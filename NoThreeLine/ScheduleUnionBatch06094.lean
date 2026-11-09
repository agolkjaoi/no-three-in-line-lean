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
namespace NoThreeLine.ScheduleUnionBatch06094

-- Frozen phase 6094, atom 7384, type 1, source (33,89).
def leavesData0 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,4,0⟩))) (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩)))) (.node (.node (.single ⟨4,14,0⟩) (.node (.single ⟨4,14,1⟩) (.single ⟨4,15,1⟩))) (.node (.node (.single ⟨5,30,0⟩) (.single ⟨5,30,1⟩)) (.node (.single ⟨5,31,0⟩) (.single ⟨5,31,1⟩))))))
def leaves0 : Fin 25 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 33 89 leaves0 i
def outputData0 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨8448,8512,22784,22848⟩) (.node (.single ⟨8448,8512,22848,22912⟩) (.single ⟨8512,8576,22784,22848⟩))) (.node (.single ⟨8512,8576,22848,22912⟩) (.node (.single ⟨8448,8576,22912,23040⟩) (.single ⟨8576,8608,22784,22816⟩)))) (.node (.node (.single ⟨8576,8608,22816,22848⟩) (.node (.single ⟨8608,8640,22784,22816⟩) (.single ⟨8608,8640,22816,22848⟩))) (.node (.single ⟨8576,8640,22848,22912⟩) (.node (.single ⟨8640,8672,22784,22816⟩) (.single ⟨8640,8672,22816,22848⟩))))) (.node (.node (.node (.single ⟨8672,8688,22784,22800⟩) (.node (.single ⟨8672,8688,22800,22816⟩) (.single ⟨8688,8696,22784,22792⟩))) (.node (.single ⟨8688,8696,22792,22800⟩) (.node (.single ⟨8696,8704,22784,22792⟩) (.single ⟨8696,8704,22792,22800⟩)))) (.node (.node (.single ⟨8688,8704,22800,22816⟩) (.node (.single ⟨8672,8704,22816,22848⟩) (.single ⟨8640,8704,22848,22912⟩))) (.node (.node (.single ⟨8576,8640,22912,22976⟩) (.single ⟨8576,8640,22976,23040⟩)) (.node (.single ⟨8640,8704,22912,22976⟩) (.single ⟨8640,8704,22976,23040⟩)))))) (.node (.node (.node (.node (.single ⟨9728,9792,24064,24128⟩) (.node (.single ⟨9728,9792,24128,24192⟩) (.single ⟨9792,9856,24064,24128⟩))) (.node (.single ⟨9792,9856,24128,24192⟩) (.node (.single ⟨9728,9856,24192,24320⟩) (.single ⟨9856,9920,24064,24128⟩)))) (.node (.node (.single ⟨9856,9920,24128,24192⟩) (.node (.single ⟨9920,9952,24064,24096⟩) (.single ⟨9920,9952,24096,24128⟩))) (.node (.single ⟨9952,9968,24064,24080⟩) (.node (.single ⟨9952,9968,24080,24096⟩) (.single ⟨9968,9976,24064,24072⟩))))) (.node (.node (.node (.single ⟨9968,9976,24072,24080⟩) (.node (.single ⟨9976,9984,24064,24072⟩) (.single ⟨9976,9984,24072,24080⟩))) (.node (.single ⟨9968,9984,24080,24096⟩) (.node (.single ⟨9952,9984,24096,24128⟩) (.single ⟨9920,9952,24128,24160⟩)))) (.node (.node (.single ⟨9920,9952,24160,24192⟩) (.node (.single ⟨9952,9984,24128,24160⟩) (.single ⟨9952,9984,24160,24192⟩))) (.node (.node (.single ⟨9856,9920,24192,24256⟩) (.single ⟨9856,9920,24256,24320⟩)) (.node (.single ⟨9920,9984,24192,24256⟩) (.single ⟨9920,9984,24256,24320⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,8448,8512⟩) (.node (.single ⟨22784,22848,8512,8576⟩) (.single ⟨22848,22912,8448,8512⟩))) (.node (.single ⟨22848,22912,8512,8576⟩) (.node (.single ⟨22784,22816,8576,8608⟩) (.single ⟨22784,22816,8608,8640⟩)))) (.node (.node (.single ⟨22816,22848,8576,8608⟩) (.node (.single ⟨22816,22848,8608,8640⟩) (.single ⟨22784,22816,8640,8672⟩))) (.node (.single ⟨22784,22800,8672,8688⟩) (.node (.single ⟨22784,22792,8688,8696⟩) (.single ⟨22784,22792,8696,8704⟩))))) (.node (.node (.node (.single ⟨22792,22800,8688,8696⟩) (.node (.single ⟨22792,22800,8696,8704⟩) (.single ⟨22800,22816,8672,8688⟩))) (.node (.single ⟨22800,22816,8688,8704⟩) (.node (.single ⟨22816,22848,8640,8672⟩) (.single ⟨22816,22848,8672,8704⟩)))) (.node (.node (.single ⟨22848,22912,8576,8640⟩) (.node (.single ⟨22848,22912,8640,8704⟩) (.single ⟨22912,23040,8448,8576⟩))) (.node (.node (.single ⟨22912,22976,8576,8640⟩) (.single ⟨22912,22976,8640,8704⟩)) (.node (.single ⟨22976,23040,8576,8640⟩) (.single ⟨22976,23040,8640,8704⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,9728,9792⟩) (.node (.single ⟨24064,24128,9792,9856⟩) (.single ⟨24128,24192,9728,9792⟩))) (.node (.single ⟨24128,24192,9792,9856⟩) (.node (.single ⟨24064,24128,9856,9920⟩) (.single ⟨24064,24096,9920,9952⟩)))) (.node (.node (.single ⟨24064,24080,9952,9968⟩) (.node (.single ⟨24064,24072,9968,9976⟩) (.single ⟨24064,24072,9976,9984⟩))) (.node (.single ⟨24072,24080,9968,9976⟩) (.node (.single ⟨24072,24080,9976,9984⟩) (.single ⟨24080,24096,9952,9968⟩))))) (.node (.node (.node (.single ⟨24080,24096,9968,9984⟩) (.node (.single ⟨24096,24128,9920,9952⟩) (.single ⟨24096,24128,9952,9984⟩))) (.node (.single ⟨24128,24192,9856,9920⟩) (.node (.single ⟨24128,24160,9920,9952⟩) (.single ⟨24128,24160,9952,9984⟩)))) (.node (.node (.single ⟨24160,24192,9920,9952⟩) (.node (.single ⟨24160,24192,9952,9984⟩) (.single ⟨24192,24320,9728,9856⟩))) (.node (.node (.single ⟨24192,24256,9856,9920⟩) (.single ⟨24192,24256,9920,9984⟩)) (.node (.single ⟨24256,24320,9856,9920⟩) (.single ⟨24256,24320,9920,9984⟩))))))))
def output0 : Fin 100 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 70) (.single 95))) (.node (.single 29) (.node (.single 0) (.single 50)))) (.node (.node (.single 99) (.node (.single 49) (.single 1))) (.node (.single 52) (.node (.single 98) (.single 47))))) (.node (.node (.node (.single 2) (.node (.single 51) (.single 97))) (.node (.single 48) (.node (.single 3) (.single 53)))) (.node (.node (.single 96) (.node (.single 46) (.single 9))) (.node (.node (.single 68) (.single 90)) (.node (.single 31) (.single 20)))))) (.node (.node (.node (.node (.single 69) (.node (.single 79) (.single 30))) (.node (.single 21) (.node (.single 71) (.single 78)))) (.node (.node (.single 28) (.node (.single 22) (.single 73))) (.node (.single 77) (.node (.single 26) (.single 23))))) (.node (.node (.node (.single 72) (.node (.single 76) (.single 27))) (.node (.single 24) (.node (.single 74) (.single 75)))) (.node (.node (.single 25) (.node (.single 10) (.single 58))) (.node (.node (.single 89) (.single 41)) (.node (.single 11) (.single 66))))))) (.node (.node (.node (.node (.node (.single 88) (.node (.single 33) (.single 19))) (.node (.single 67) (.node (.single 80) (.single 32)))) (.node (.node (.single 5) (.node (.single 54) (.single 94))) (.node (.single 45) (.node (.single 6) (.single 56))))) (.node (.node (.node (.single 93) (.node (.single 43) (.single 7))) (.node (.single 55) (.node (.single 92) (.single 44)))) (.node (.node (.single 8) (.node (.single 57) (.single 91))) (.node (.node (.single 42) (.single 12)) (.node (.single 59) (.single 87)))))) (.node (.node (.node (.node (.single 40) (.node (.single 13) (.single 64))) (.node (.single 86) (.node (.single 35) (.single 18)))) (.node (.node (.single 65) (.node (.single 81) (.single 34))) (.node (.single 14) (.node (.single 60) (.single 85))))) (.node (.node (.node (.single 39) (.node (.single 15) (.single 62))) (.node (.single 84) (.node (.single 37) (.single 16)))) (.node (.node (.single 61) (.node (.single 83) (.single 38))) (.node (.node (.single 17) (.single 63)) (.node (.single 82) (.single 36))))))))
def sourceData0 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 56)))) (.node (.node (.single 60) (.node (.single 64) (.single 68))) (.node (.single 20) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 72) (.node (.single 76) (.single 84))) (.node (.single 88) (.node (.single 92) (.single 96)))) (.node (.node (.single 80) (.node (.single 52) (.single 24))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.node (.single 35) (.single 39))) (.node (.single 31) (.node (.single 3) (.single 27)))) (.node (.node (.single 23) (.node (.single 55) (.single 51))) (.node (.single 83) (.node (.single 79) (.single 99))))) (.node (.node (.node (.single 91) (.node (.single 95) (.single 87))) (.node (.single 75) (.node (.single 47) (.single 71)))) (.node (.node (.single 63) (.node (.single 67) (.single 59))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 57) (.single 65)))) (.node (.node (.single 61) (.node (.single 69) (.single 45))) (.node (.single 73) (.node (.single 85) (.single 93))))) (.node (.node (.node (.single 89) (.node (.single 97) (.single 77))) (.node (.single 81) (.node (.single 49) (.single 53)))) (.node (.node (.single 21) (.node (.single 25) (.single 1))) (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.node (.single 38) (.single 34))) (.node (.single 30) (.node (.single 26) (.single 54)))) (.node (.node (.single 82) (.node (.single 98) (.single 94))) (.node (.single 90) (.node (.single 86) (.single 78))))) (.node (.node (.node (.single 74) (.node (.single 50) (.single 46))) (.node (.single 22) (.node (.single 70) (.single 66)))) (.node (.node (.single 62) (.node (.single 58) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover0 (i : Fin 100) : Fin 100 := ⟨coverData0.get i % 100, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 100) : Fin 100 := ⟨sourceData0.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 (.cutX 8448 .empty (.cutY 22784 .empty (.cutX 8576 (.cutY 22912 (.cutX 8512 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 8640 (.cutY 22848 (.cutX 8608 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full) (.cutY 22848 (.cutX 8672 (.cutY 22816 .full .full) (.cutY 22816 (.cutX 8688 (.cutY 22800 .full .full) (.cutY 22800 (.cutX 8696 (.cutY 22792 .full .full) (.cutY 22792 .full .full)) .full)) .full)) .full)) (.cutX 8640 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 .empty (.cutX 9984 (.cutY 24320 (.cutX 9856 (.cutY 24192 (.cutX 9792 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 9920 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 9952 (.cutY 24096 .full .full) (.cutY 24096 (.cutX 9968 (.cutY 24080 .full .full) (.cutY 24080 (.cutX 9976 (.cutY 24072 .full .full) (.cutY 24072 .full .full)) .full)) .full)) (.cutX 9952 (.cutY 24160 .full .full) (.cutY 24160 .full .full)))) (.cutX 9920 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty) .empty)))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 (.cutX 22784 .empty (.cutY 8448 .empty (.cutX 22912 (.cutY 8576 (.cutX 22848 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 22848 (.cutY 8640 (.cutX 22816 (.cutY 8608 .full .full) (.cutY 8608 .full .full)) (.cutX 22816 (.cutY 8672 .full (.cutX 22800 (.cutY 8688 .full (.cutX 22792 (.cutY 8696 .full .full) (.cutY 8696 .full .full))) (.cutY 8688 .full .full))) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 22976 (.cutY 8640 .full .full) (.cutY 8640 .full .full)))))) .empty) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 .empty (.cutX 24320 (.cutY 9984 (.cutX 24192 (.cutY 9856 (.cutX 24128 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 24128 (.cutY 9920 .full (.cutX 24096 (.cutY 9952 .full (.cutX 24080 (.cutY 9968 .full (.cutX 24072 (.cutY 9976 .full .full) (.cutY 9976 .full .full))) (.cutY 9968 .full .full))) (.cutY 9952 .full .full))) (.cutY 9920 .full (.cutX 24160 (.cutY 9952 .full .full) (.cutY 9952 .full .full))))) (.cutY 9856 .full (.cutX 24256 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty))))) .empty)) .empty))) .empty) .empty))

theorem metadata0 : 0<67962893 ∧ 33<128 ∧ 89<128 ∧ 1<4 ∧
    7384/4160=1 ∧ 7384%4160=3224 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked0_64 : ∀ i : Fin 36,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 100, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) (forallFinOffset_add (fun i => output0 i = raw0 (source0 i)) 0 64 36 (by decide) sourceChecked0_0
    sourceChecked0_64)

theorem coverChecked0_0 : ∀ i : Fin 64,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked0_64 : ∀ i : Fin 36,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 100, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
  forallFin_of_zero_offset (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (forallFinOffset_add (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) 0 64 36 (by decide) coverChecked0_0
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 6095, atom 2154, type 0, source (19,83).
def leavesData1 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves1 : Fin 13 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 83 leaves1 i
def outputData1 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,21248,21312⟩) (.node (.single ⟨4864,4928,21312,21376⟩) (.single ⟨4928,4992,21248,21312⟩))) (.node (.single ⟨4928,4992,21312,21376⟩) (.node (.single ⟨4864,4992,21376,21504⟩) (.single ⟨4992,5056,21248,21312⟩)))) (.node (.node (.single ⟨4992,5056,21312,21376⟩) (.node (.single ⟨5056,5088,21248,21280⟩) (.single ⟨5056,5088,21280,21312⟩))) (.node (.node (.single ⟨5088,5120,21248,21280⟩) (.single ⟨5088,5120,21280,21312⟩)) (.node (.single ⟨5056,5120,21312,21376⟩) (.single ⟨4992,5120,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,27648,27776⟩) (.node (.single ⟨11264,11392,27776,27904⟩) (.single ⟨11392,11456,27648,27712⟩))) (.node (.single ⟨11392,11456,27712,27776⟩) (.node (.single ⟨11456,11488,27648,27680⟩) (.single ⟨11456,11488,27680,27712⟩)))) (.node (.node (.single ⟨11488,11520,27648,27680⟩) (.node (.single ⟨11488,11520,27680,27712⟩) (.single ⟨11456,11520,27712,27776⟩))) (.node (.node (.single ⟨11392,11456,27776,27840⟩) (.single ⟨11392,11456,27840,27904⟩)) (.node (.single ⟨11456,11520,27776,27840⟩) (.single ⟨11456,11520,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,4864,4928⟩) (.node (.single ⟨21248,21312,4928,4992⟩) (.single ⟨21312,21376,4864,4928⟩))) (.node (.single ⟨21312,21376,4928,4992⟩) (.node (.single ⟨21248,21312,4992,5056⟩) (.single ⟨21248,21280,5056,5088⟩)))) (.node (.node (.single ⟨21248,21280,5088,5120⟩) (.node (.single ⟨21280,21312,5056,5088⟩) (.single ⟨21280,21312,5088,5120⟩))) (.node (.node (.single ⟨21312,21376,4992,5056⟩) (.single ⟨21312,21376,5056,5120⟩)) (.node (.single ⟨21376,21504,4864,4992⟩) (.single ⟨21376,21504,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,11264,11392⟩) (.node (.single ⟨27648,27712,11392,11456⟩) (.single ⟨27648,27680,11456,11488⟩))) (.node (.single ⟨27648,27680,11488,11520⟩) (.node (.single ⟨27680,27712,11456,11488⟩) (.single ⟨27680,27712,11488,11520⟩)))) (.node (.node (.single ⟨27712,27776,11392,11456⟩) (.node (.single ⟨27712,27776,11456,11520⟩) (.single ⟨27776,27904,11264,11392⟩))) (.node (.node (.single ⟨27776,27840,11392,11456⟩) (.single ⟨27776,27840,11456,11520⟩)) (.node (.single ⟨27840,27904,11392,11456⟩) (.single ⟨27840,27904,11456,11520⟩)))))))
def output1 : Fin 52 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover1 (i : Fin 52) : Fin 52 := ⟨coverData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 52) : Fin 52 := ⟨sourceData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 .empty (.cutX 4864 .empty (.cutY 21248 .empty (.cutX 4992 (.cutY 21376 (.cutX 4928 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 5056 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 5088 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full)))))) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 (.cutX 11520 (.cutY 27904 (.cutX 11392 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 11456 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 11488 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 11456 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 .empty (.cutX 21248 .empty (.cutY 4864 .empty (.cutX 21376 (.cutY 4992 (.cutX 21312 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 21312 (.cutY 5056 .full (.cutX 21280 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 (.cutX 27904 (.cutY 11520 (.cutX 27776 (.cutY 11392 .full (.cutX 27712 (.cutY 11456 .full (.cutX 27680 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 27840 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty) .empty) .empty) .empty))))) .empty) .empty))) .empty))

theorem metadata1 : 0<152546139 ∧ 19<128 ∧ 83<128 ∧ 0<4 ∧
    2154/4160=0 ∧ 2154%4160=2154 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 6096, atom 6488, type 1, source (21,81).
def leavesData2 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves2 : Fin 16 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 21 81 leaves2 i
def outputData2 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5376,5440,20736,20800⟩) (.single ⟨5376,5440,20800,20864⟩)) (.node (.single ⟨5440,5504,20736,20800⟩) (.single ⟨5440,5504,20800,20864⟩))) (.node (.node (.single ⟨5376,5504,20864,20992⟩) (.single ⟨5504,5568,20736,20800⟩)) (.node (.single ⟨5504,5568,20800,20864⟩) (.single ⟨5568,5600,20736,20768⟩)))) (.node (.node (.node (.single ⟨5568,5600,20768,20800⟩) (.single ⟨5600,5632,20736,20768⟩)) (.node (.single ⟨5600,5632,20768,20800⟩) (.single ⟨5568,5632,20800,20864⟩))) (.node (.node (.single ⟨5504,5568,20864,20928⟩) (.single ⟨5504,5568,20928,20992⟩)) (.node (.single ⟨5568,5632,20864,20928⟩) (.single ⟨5568,5632,20928,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11840,27136,27200⟩) (.single ⟨11776,11840,27200,27264⟩)) (.node (.single ⟨11840,11904,27136,27200⟩) (.single ⟨11840,11904,27200,27264⟩))) (.node (.node (.single ⟨11776,11904,27264,27392⟩) (.single ⟨11904,11968,27136,27200⟩)) (.node (.single ⟨11904,11968,27200,27264⟩) (.single ⟨11968,12000,27136,27168⟩)))) (.node (.node (.node (.single ⟨11968,12000,27168,27200⟩) (.single ⟨12000,12032,27136,27168⟩)) (.node (.single ⟨12000,12032,27168,27200⟩) (.single ⟨11968,12032,27200,27264⟩))) (.node (.node (.single ⟨11904,11968,27264,27328⟩) (.single ⟨11904,11968,27328,27392⟩)) (.node (.single ⟨11968,12032,27264,27328⟩) (.single ⟨11968,12032,27328,27392⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,5376,5440⟩) (.single ⟨20736,20800,5440,5504⟩)) (.node (.single ⟨20800,20864,5376,5440⟩) (.single ⟨20800,20864,5440,5504⟩))) (.node (.node (.single ⟨20736,20800,5504,5568⟩) (.single ⟨20736,20768,5568,5600⟩)) (.node (.single ⟨20736,20768,5600,5632⟩) (.single ⟨20768,20800,5568,5600⟩)))) (.node (.node (.node (.single ⟨20768,20800,5600,5632⟩) (.single ⟨20800,20864,5504,5568⟩)) (.node (.single ⟨20800,20864,5568,5632⟩) (.single ⟨20864,20992,5376,5504⟩))) (.node (.node (.single ⟨20864,20928,5504,5568⟩) (.single ⟨20864,20928,5568,5632⟩)) (.node (.single ⟨20928,20992,5504,5568⟩) (.single ⟨20928,20992,5568,5632⟩))))) (.node (.node (.node (.node (.single ⟨27136,27200,11776,11840⟩) (.single ⟨27136,27200,11840,11904⟩)) (.node (.single ⟨27200,27264,11776,11840⟩) (.single ⟨27200,27264,11840,11904⟩))) (.node (.node (.single ⟨27136,27200,11904,11968⟩) (.single ⟨27136,27168,11968,12000⟩)) (.node (.single ⟨27136,27168,12000,12032⟩) (.single ⟨27168,27200,11968,12000⟩)))) (.node (.node (.node (.single ⟨27168,27200,12000,12032⟩) (.single ⟨27200,27264,11904,11968⟩)) (.node (.single ⟨27200,27264,11968,12032⟩) (.single ⟨27264,27392,11776,11904⟩))) (.node (.node (.single ⟨27264,27328,11904,11968⟩) (.single ⟨27264,27328,11968,12032⟩)) (.node (.single ⟨27328,27392,11904,11968⟩) (.single ⟨27328,27392,11968,12032⟩)))))))
def output2 : Fin 64 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData2 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover2 (i : Fin 64) : Fin 64 := ⟨coverData2.get i % 64, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 64) : Fin 64 := ⟨sourceData2.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 (.cutX 5376 .empty (.cutY 20736 .empty (.cutX 5504 (.cutY 20864 (.cutX 5440 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5568 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 5600 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) (.cutX 5568 (.cutY 20928 .full .full) (.cutY 20928 .full .full)))))) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 .empty (.cutX 12032 (.cutY 27392 (.cutX 11904 (.cutY 27264 (.cutX 11840 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full) (.cutY 27264 (.cutX 11968 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 12000 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 11968 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty))) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 (.cutX 20736 .empty (.cutY 5376 .empty (.cutX 20864 (.cutY 5504 (.cutX 20800 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 20800 (.cutY 5568 .full (.cutX 20768 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full (.cutX 20928 (.cutY 5568 .full .full) (.cutY 5568 .full .full)))))) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 .empty (.cutX 27392 (.cutY 12032 (.cutX 27264 (.cutY 11904 (.cutX 27200 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 27200 (.cutY 11968 .full (.cutX 27168 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 27328 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty)))) .empty))) .empty) .empty))) .empty))

theorem metadata2 : 0<125829407 ∧ 21<128 ∧ 81<128 ∧ 1<4 ∧
    6488/4160=1 ∧ 6488%4160=2328 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 64,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 64, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 64,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 64, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 6097, atom 3098, type 0, source (31,91).
def leavesData3 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves3 : Fin 16 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 31 91 leaves3 i
def outputData3 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨7936,8000,23296,23360⟩) (.single ⟨7936,8000,23360,23424⟩)) (.node (.single ⟨8000,8064,23296,23360⟩) (.single ⟨8000,8064,23360,23424⟩))) (.node (.node (.single ⟨7936,8064,23424,23552⟩) (.single ⟨8064,8128,23296,23360⟩)) (.node (.single ⟨8064,8128,23360,23424⟩) (.single ⟨8128,8160,23296,23328⟩)))) (.node (.node (.node (.single ⟨8128,8160,23328,23360⟩) (.single ⟨8160,8192,23296,23328⟩)) (.node (.single ⟨8160,8192,23328,23360⟩) (.single ⟨8128,8192,23360,23424⟩))) (.node (.node (.single ⟨8064,8128,23424,23488⟩) (.single ⟨8064,8128,23488,23552⟩)) (.node (.single ⟨8128,8192,23424,23488⟩) (.single ⟨8128,8192,23488,23552⟩))))) (.node (.node (.node (.node (.single ⟨9216,9280,24576,24640⟩) (.single ⟨9216,9280,24640,24704⟩)) (.node (.single ⟨9280,9344,24576,24640⟩) (.single ⟨9280,9344,24640,24704⟩))) (.node (.node (.single ⟨9216,9344,24704,24832⟩) (.single ⟨9344,9408,24576,24640⟩)) (.node (.single ⟨9344,9408,24640,24704⟩) (.single ⟨9408,9440,24576,24608⟩)))) (.node (.node (.node (.single ⟨9408,9440,24608,24640⟩) (.single ⟨9440,9472,24576,24608⟩)) (.node (.single ⟨9440,9472,24608,24640⟩) (.single ⟨9408,9472,24640,24704⟩))) (.node (.node (.single ⟨9344,9408,24704,24768⟩) (.single ⟨9344,9408,24768,24832⟩)) (.node (.single ⟨9408,9472,24704,24768⟩) (.single ⟨9408,9472,24768,24832⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,7936,8000⟩) (.single ⟨23296,23360,8000,8064⟩)) (.node (.single ⟨23360,23424,7936,8000⟩) (.single ⟨23360,23424,8000,8064⟩))) (.node (.node (.single ⟨23296,23360,8064,8128⟩) (.single ⟨23296,23328,8128,8160⟩)) (.node (.single ⟨23296,23328,8160,8192⟩) (.single ⟨23328,23360,8128,8160⟩)))) (.node (.node (.node (.single ⟨23328,23360,8160,8192⟩) (.single ⟨23360,23424,8064,8128⟩)) (.node (.single ⟨23360,23424,8128,8192⟩) (.single ⟨23424,23552,7936,8064⟩))) (.node (.node (.single ⟨23424,23488,8064,8128⟩) (.single ⟨23424,23488,8128,8192⟩)) (.node (.single ⟨23488,23552,8064,8128⟩) (.single ⟨23488,23552,8128,8192⟩))))) (.node (.node (.node (.node (.single ⟨24576,24640,9216,9280⟩) (.single ⟨24576,24640,9280,9344⟩)) (.node (.single ⟨24640,24704,9216,9280⟩) (.single ⟨24640,24704,9280,9344⟩))) (.node (.node (.single ⟨24576,24640,9344,9408⟩) (.single ⟨24576,24608,9408,9440⟩)) (.node (.single ⟨24576,24608,9440,9472⟩) (.single ⟨24608,24640,9408,9440⟩)))) (.node (.node (.node (.single ⟨24608,24640,9440,9472⟩) (.single ⟨24640,24704,9344,9408⟩)) (.node (.single ⟨24640,24704,9408,9472⟩) (.single ⟨24704,24832,9216,9344⟩))) (.node (.node (.single ⟨24704,24768,9344,9408⟩) (.single ⟨24704,24768,9408,9472⟩)) (.node (.single ⟨24768,24832,9344,9408⟩) (.single ⟨24768,24832,9408,9472⟩)))))))
def output3 : Fin 64 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData3 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover3 (i : Fin 64) : Fin 64 := ⟨coverData3.get i % 64, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 64) : Fin 64 := ⟨sourceData3.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 .empty (.cutX 7936 .empty (.cutY 23296 .empty (.cutX 8064 (.cutY 23424 (.cutX 8000 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 8128 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 8160 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 8128 (.cutY 23488 .full .full) (.cutY 23488 .full .full)))))))) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 (.cutX 9472 (.cutY 24832 (.cutX 9344 (.cutY 24704 (.cutX 9280 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 9408 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 9440 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) (.cutX 9408 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 .empty (.cutX 23296 .empty (.cutY 7936 .empty (.cutX 23424 (.cutY 8064 (.cutX 23360 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 23360 (.cutY 8128 .full (.cutX 23328 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 23488 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 (.cutX 24832 (.cutY 9472 (.cutX 24704 (.cutY 9344 (.cutX 24640 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 24640 (.cutY 9408 .full (.cutX 24608 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 24768 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata3 : 0<145899414 ∧ 31<128 ∧ 91<128 ∧ 0<4 ∧
    3098/4160=0 ∧ 3098%4160=3098 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 6098, atom 2961, type 0, source (29,90).
def leavesData4 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves4 : Fin 7 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 90 leaves4 i
def outputData4 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,23040,23168⟩) (.node (.single ⟨7424,7552,23168,23296⟩) (.single ⟨7552,7616,23040,23104⟩))) (.node (.node (.single ⟨7552,7616,23104,23168⟩) (.single ⟨7616,7680,23040,23104⟩)) (.node (.single ⟨7616,7680,23104,23168⟩) (.single ⟨7552,7680,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,25088,25216⟩) (.node (.single ⟨9472,9600,25216,25344⟩) (.single ⟨9600,9664,25088,25152⟩))) (.node (.node (.single ⟨9600,9664,25152,25216⟩) (.single ⟨9664,9728,25088,25152⟩)) (.node (.single ⟨9664,9728,25152,25216⟩) (.single ⟨9600,9728,25216,25344⟩))))) (.node (.node (.node (.single ⟨23040,23168,7424,7552⟩) (.node (.single ⟨23040,23104,7552,7616⟩) (.single ⟨23040,23104,7616,7680⟩))) (.node (.node (.single ⟨23104,23168,7552,7616⟩) (.single ⟨23104,23168,7616,7680⟩)) (.node (.single ⟨23168,23296,7424,7552⟩) (.single ⟨23168,23296,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,9472,9600⟩) (.node (.single ⟨25088,25152,9600,9664⟩) (.single ⟨25088,25152,9664,9728⟩))) (.node (.node (.single ⟨25152,25216,9600,9664⟩) (.single ⟨25152,25216,9664,9728⟩)) (.node (.single ⟨25216,25344,9472,9600⟩) (.single ⟨25216,25344,9600,9728⟩))))))
def output4 : Fin 28 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover4 (i : Fin 28) : Fin 28 := ⟨coverData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 28) : Fin 28 := ⟨sourceData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 .empty (.cutX 7424 .empty (.cutY 23296 (.cutX 7552 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 7616 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty))) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 .empty (.cutX 9472 .empty (.cutY 25344 (.cutX 9600 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 9664 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 (.cutX 23296 (.cutY 7424 .empty (.cutX 23168 (.cutY 7552 .full (.cutX 23104 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 (.cutX 25344 (.cutY 9472 .empty (.cutX 25216 (.cutY 9600 .full (.cutX 25152 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata4 : 0<145899414 ∧ 29<128 ∧ 90<128 ∧ 0<4 ∧
    2961/4160=0 ∧ 2961%4160=2961 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 6099, atom 2889, type 0, source (28,89).
def leavesData5 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves5 : Fin 16 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 28 89 leaves5 i
def outputData5 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨7168,7232,22784,22848⟩) (.single ⟨7168,7232,22848,22912⟩)) (.node (.single ⟨7232,7296,22784,22848⟩) (.single ⟨7232,7296,22848,22912⟩))) (.node (.node (.single ⟨7168,7296,22912,23040⟩) (.single ⟨7296,7360,22784,22848⟩)) (.node (.single ⟨7296,7360,22848,22912⟩) (.single ⟨7360,7392,22784,22816⟩)))) (.node (.node (.node (.single ⟨7360,7392,22816,22848⟩) (.single ⟨7392,7424,22784,22816⟩)) (.node (.single ⟨7392,7424,22816,22848⟩) (.single ⟨7360,7424,22848,22912⟩))) (.node (.node (.single ⟨7296,7360,22912,22976⟩) (.single ⟨7296,7360,22976,23040⟩)) (.node (.single ⟨7360,7424,22912,22976⟩) (.single ⟨7360,7424,22976,23040⟩))))) (.node (.node (.node (.node (.single ⟨9728,9792,25344,25408⟩) (.single ⟨9728,9792,25408,25472⟩)) (.node (.single ⟨9792,9856,25344,25408⟩) (.single ⟨9792,9856,25408,25472⟩))) (.node (.node (.single ⟨9728,9856,25472,25600⟩) (.single ⟨9856,9920,25344,25408⟩)) (.node (.single ⟨9856,9920,25408,25472⟩) (.single ⟨9920,9952,25344,25376⟩)))) (.node (.node (.node (.single ⟨9920,9952,25376,25408⟩) (.single ⟨9952,9984,25344,25376⟩)) (.node (.single ⟨9952,9984,25376,25408⟩) (.single ⟨9920,9984,25408,25472⟩))) (.node (.node (.single ⟨9856,9920,25472,25536⟩) (.single ⟨9856,9920,25536,25600⟩)) (.node (.single ⟨9920,9984,25472,25536⟩) (.single ⟨9920,9984,25536,25600⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,7168,7232⟩) (.single ⟨22784,22848,7232,7296⟩)) (.node (.single ⟨22848,22912,7168,7232⟩) (.single ⟨22848,22912,7232,7296⟩))) (.node (.node (.single ⟨22784,22848,7296,7360⟩) (.single ⟨22784,22816,7360,7392⟩)) (.node (.single ⟨22784,22816,7392,7424⟩) (.single ⟨22816,22848,7360,7392⟩)))) (.node (.node (.node (.single ⟨22816,22848,7392,7424⟩) (.single ⟨22848,22912,7296,7360⟩)) (.node (.single ⟨22848,22912,7360,7424⟩) (.single ⟨22912,23040,7168,7296⟩))) (.node (.node (.single ⟨22912,22976,7296,7360⟩) (.single ⟨22912,22976,7360,7424⟩)) (.node (.single ⟨22976,23040,7296,7360⟩) (.single ⟨22976,23040,7360,7424⟩))))) (.node (.node (.node (.node (.single ⟨25344,25408,9728,9792⟩) (.single ⟨25344,25408,9792,9856⟩)) (.node (.single ⟨25408,25472,9728,9792⟩) (.single ⟨25408,25472,9792,9856⟩))) (.node (.node (.single ⟨25344,25408,9856,9920⟩) (.single ⟨25344,25376,9920,9952⟩)) (.node (.single ⟨25344,25376,9952,9984⟩) (.single ⟨25376,25408,9920,9952⟩)))) (.node (.node (.node (.single ⟨25376,25408,9952,9984⟩) (.single ⟨25408,25472,9856,9920⟩)) (.node (.single ⟨25408,25472,9920,9984⟩) (.single ⟨25472,25600,9728,9856⟩))) (.node (.node (.single ⟨25472,25536,9856,9920⟩) (.single ⟨25472,25536,9920,9984⟩)) (.node (.single ⟨25536,25600,9856,9920⟩) (.single ⟨25536,25600,9920,9984⟩)))))))
def output5 : Fin 64 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData5 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover5 (i : Fin 64) : Fin 64 := ⟨coverData5.get i % 64, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 64) : Fin 64 := ⟨sourceData5.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 (.cutX 7424 (.cutY 22784 .empty (.cutX 7296 (.cutY 22912 (.cutX 7232 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 7360 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 7392 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) (.cutX 7360 (.cutY 22976 .full .full) (.cutY 22976 .full .full))))) .empty) .empty) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 .empty (.cutX 9984 (.cutY 25344 .empty (.cutX 9856 (.cutY 25472 (.cutX 9792 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 9920 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 9952 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 9920 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))) .empty))) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 (.cutX 22784 .empty (.cutY 7424 (.cutX 22912 (.cutY 7296 (.cutX 22848 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 22848 (.cutY 7360 .full (.cutX 22816 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 22976 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 .empty (.cutX 25344 .empty (.cutY 9984 (.cutX 25472 (.cutY 9856 (.cutX 25408 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 25408 (.cutY 9920 .full (.cutX 25376 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 25536 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty))))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata5 : 0<145899414 ∧ 28<128 ∧ 89<128 ∧ 0<4 ∧
    2889/4160=0 ∧ 2889%4160=2889 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 6100, atom 7446, type 1, source (34,90).
def leavesData6 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves6 : Fin 13 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 34 90 leaves6 i
def outputData6 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8704,8768,23040,23104⟩) (.node (.single ⟨8704,8768,23104,23168⟩) (.single ⟨8768,8832,23040,23104⟩))) (.node (.single ⟨8768,8832,23104,23168⟩) (.node (.single ⟨8704,8832,23168,23296⟩) (.single ⟨8832,8896,23040,23104⟩)))) (.node (.node (.single ⟨8832,8896,23104,23168⟩) (.node (.single ⟨8896,8928,23040,23072⟩) (.single ⟨8896,8928,23072,23104⟩))) (.node (.node (.single ⟨8928,8960,23040,23072⟩) (.single ⟨8928,8960,23072,23104⟩)) (.node (.single ⟨8896,8960,23104,23168⟩) (.single ⟨8832,8960,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,23808,23936⟩) (.node (.single ⟨9472,9600,23936,24064⟩) (.single ⟨9600,9664,23808,23872⟩))) (.node (.single ⟨9600,9664,23872,23936⟩) (.node (.single ⟨9664,9696,23808,23840⟩) (.single ⟨9664,9696,23840,23872⟩)))) (.node (.node (.single ⟨9696,9728,23808,23840⟩) (.node (.single ⟨9696,9728,23840,23872⟩) (.single ⟨9664,9728,23872,23936⟩))) (.node (.node (.single ⟨9600,9664,23936,24000⟩) (.single ⟨9600,9664,24000,24064⟩)) (.node (.single ⟨9664,9728,23936,24000⟩) (.single ⟨9664,9728,24000,24064⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23104,8704,8768⟩) (.node (.single ⟨23040,23104,8768,8832⟩) (.single ⟨23104,23168,8704,8768⟩))) (.node (.single ⟨23104,23168,8768,8832⟩) (.node (.single ⟨23040,23104,8832,8896⟩) (.single ⟨23040,23072,8896,8928⟩)))) (.node (.node (.single ⟨23040,23072,8928,8960⟩) (.node (.single ⟨23072,23104,8896,8928⟩) (.single ⟨23072,23104,8928,8960⟩))) (.node (.node (.single ⟨23104,23168,8832,8896⟩) (.single ⟨23104,23168,8896,8960⟩)) (.node (.single ⟨23168,23296,8704,8832⟩) (.single ⟨23168,23296,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,9472,9600⟩) (.node (.single ⟨23808,23872,9600,9664⟩) (.single ⟨23808,23840,9664,9696⟩))) (.node (.single ⟨23808,23840,9696,9728⟩) (.node (.single ⟨23840,23872,9664,9696⟩) (.single ⟨23840,23872,9696,9728⟩)))) (.node (.node (.single ⟨23872,23936,9600,9664⟩) (.node (.single ⟨23872,23936,9664,9728⟩) (.single ⟨23936,24064,9472,9600⟩))) (.node (.node (.single ⟨23936,24000,9600,9664⟩) (.single ⟨23936,24000,9664,9728⟩)) (.node (.single ⟨24000,24064,9600,9664⟩) (.single ⟨24000,24064,9664,9728⟩)))))))
def output6 : Fin 52 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData6 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover6 (i : Fin 52) : Fin 52 := ⟨coverData6.get i % 52, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 52) : Fin 52 := ⟨sourceData6.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 .empty (.cutX 8960 (.cutY 23296 (.cutX 8832 (.cutY 23168 (.cutX 8768 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 8896 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 8928 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) .full)) .empty) .empty))) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 (.cutX 9472 .empty (.cutY 23808 .empty (.cutX 9600 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 9664 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 9696 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 9664 (.cutY 24000 .full .full) (.cutY 24000 .full .full)))))) .empty) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 .empty (.cutX 23296 (.cutY 8960 (.cutX 23168 (.cutY 8832 (.cutX 23104 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 23104 (.cutY 8896 .full (.cutX 23072 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty))) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 (.cutX 23808 .empty (.cutY 9472 .empty (.cutX 23936 (.cutY 9600 .full (.cutX 23872 (.cutY 9664 .full (.cutX 23840 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 24000 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata6 : 0<67962893 ∧ 34<128 ∧ 90<128 ∧ 1<4 ∧
    7446/4160=1 ∧ 7446%4160=3286 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 52,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 52, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 52,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 52, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 6101, atom 2582, type 0, source (24,86).
def leavesData7 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves7 : Fin 10 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 86 leaves7 i
def outputData7 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,22016,22080⟩) (.single ⟨6144,6208,22080,22144⟩)) (.node (.single ⟨6208,6272,22016,22080⟩) (.node (.single ⟨6208,6272,22080,22144⟩) (.single ⟨6144,6272,22144,22272⟩)))) (.node (.node (.single ⟨6272,6336,22016,22080⟩) (.single ⟨6272,6336,22080,22144⟩)) (.node (.single ⟨6336,6400,22016,22080⟩) (.node (.single ⟨6336,6400,22080,22144⟩) (.single ⟨6272,6400,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,26368,26496⟩) (.single ⟨10496,10624,26496,26624⟩)) (.node (.single ⟨10624,10688,26368,26432⟩) (.node (.single ⟨10624,10688,26432,26496⟩) (.single ⟨10688,10752,26368,26432⟩)))) (.node (.node (.single ⟨10688,10752,26432,26496⟩) (.single ⟨10624,10688,26496,26560⟩)) (.node (.single ⟨10624,10688,26560,26624⟩) (.node (.single ⟨10688,10752,26496,26560⟩) (.single ⟨10688,10752,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,6144,6208⟩) (.single ⟨22016,22080,6208,6272⟩)) (.node (.single ⟨22080,22144,6144,6208⟩) (.node (.single ⟨22080,22144,6208,6272⟩) (.single ⟨22016,22080,6272,6336⟩)))) (.node (.node (.single ⟨22016,22080,6336,6400⟩) (.single ⟨22080,22144,6272,6336⟩)) (.node (.single ⟨22080,22144,6336,6400⟩) (.node (.single ⟨22144,22272,6144,6272⟩) (.single ⟨22144,22272,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,10496,10624⟩) (.single ⟨26368,26432,10624,10688⟩)) (.node (.single ⟨26368,26432,10688,10752⟩) (.node (.single ⟨26432,26496,10624,10688⟩) (.single ⟨26432,26496,10688,10752⟩)))) (.node (.node (.single ⟨26496,26624,10496,10624⟩) (.single ⟨26496,26560,10624,10688⟩)) (.node (.single ⟨26496,26560,10688,10752⟩) (.node (.single ⟨26560,26624,10624,10688⟩) (.single ⟨26560,26624,10688,10752⟩)))))))
def output7 : Fin 40 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover7 (i : Fin 40) : Fin 40 := ⟨coverData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 40) : Fin 40 := ⟨sourceData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 .empty (.cutX 6400 (.cutY 22272 (.cutX 6272 (.cutY 22144 (.cutX 6208 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 6336 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 .empty (.cutX 10496 .empty (.cutY 26368 .empty (.cutX 10624 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 10688 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 10688 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 (.cutX 22272 (.cutY 6400 (.cutX 22144 (.cutY 6272 (.cutX 22080 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 22080 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 (.cutX 26368 .empty (.cutY 10496 .empty (.cutX 26496 (.cutY 10624 .full (.cutX 26432 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 26560 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty)) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata7 : 0<104681033 ∧ 24<128 ∧ 86<128 ∧ 0<4 ∧
    2582/4160=0 ∧ 2582%4160=2582 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 6102, atom 2417, type 0, source (22,85).
def leavesData8 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 13 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 85 leaves8 i
def outputData8 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,21760,21824⟩) (.node (.single ⟨5632,5696,21824,21888⟩) (.single ⟨5696,5760,21760,21824⟩))) (.node (.single ⟨5696,5760,21824,21888⟩) (.node (.single ⟨5632,5760,21888,22016⟩) (.single ⟨5760,5824,21760,21824⟩)))) (.node (.node (.single ⟨5760,5824,21824,21888⟩) (.node (.single ⟨5824,5856,21760,21792⟩) (.single ⟨5824,5856,21792,21824⟩))) (.node (.node (.single ⟨5856,5888,21760,21792⟩) (.single ⟨5856,5888,21792,21824⟩)) (.node (.single ⟨5824,5888,21824,21888⟩) (.single ⟨5760,5888,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,26880,27008⟩) (.node (.single ⟨10752,10880,27008,27136⟩) (.single ⟨10880,10944,26880,26944⟩))) (.node (.single ⟨10880,10944,26944,27008⟩) (.node (.single ⟨10944,10976,26880,26912⟩) (.single ⟨10944,10976,26912,26944⟩)))) (.node (.node (.single ⟨10976,11008,26880,26912⟩) (.node (.single ⟨10976,11008,26912,26944⟩) (.single ⟨10944,11008,26944,27008⟩))) (.node (.node (.single ⟨10880,10944,27008,27072⟩) (.single ⟨10880,10944,27072,27136⟩)) (.node (.single ⟨10944,11008,27008,27072⟩) (.single ⟨10944,11008,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,5632,5696⟩) (.node (.single ⟨21760,21824,5696,5760⟩) (.single ⟨21824,21888,5632,5696⟩))) (.node (.single ⟨21824,21888,5696,5760⟩) (.node (.single ⟨21760,21824,5760,5824⟩) (.single ⟨21760,21792,5824,5856⟩)))) (.node (.node (.single ⟨21760,21792,5856,5888⟩) (.node (.single ⟨21792,21824,5824,5856⟩) (.single ⟨21792,21824,5856,5888⟩))) (.node (.node (.single ⟨21824,21888,5760,5824⟩) (.single ⟨21824,21888,5824,5888⟩)) (.node (.single ⟨21888,22016,5632,5760⟩) (.single ⟨21888,22016,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,10752,10880⟩) (.node (.single ⟨26880,26944,10880,10944⟩) (.single ⟨26880,26912,10944,10976⟩))) (.node (.single ⟨26880,26912,10976,11008⟩) (.node (.single ⟨26912,26944,10944,10976⟩) (.single ⟨26912,26944,10976,11008⟩)))) (.node (.node (.single ⟨26944,27008,10880,10944⟩) (.node (.single ⟨26944,27008,10944,11008⟩) (.single ⟨27008,27136,10752,10880⟩))) (.node (.node (.single ⟨27008,27072,10880,10944⟩) (.single ⟨27008,27072,10944,11008⟩)) (.node (.single ⟨27072,27136,10880,10944⟩) (.single ⟨27072,27136,10944,11008⟩)))))))
def output8 : Fin 52 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover8 (i : Fin 52) : Fin 52 := ⟨coverData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 52) : Fin 52 := ⟨sourceData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 (.cutX 5888 (.cutY 21760 .empty (.cutX 5760 (.cutY 21888 (.cutX 5696 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 5824 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 5856 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full))) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 (.cutX 11008 (.cutY 26880 .empty (.cutX 10880 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 10944 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 10976 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 10944 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty)) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 .empty (.cutX 21760 .empty (.cutY 5888 (.cutX 21888 (.cutY 5760 (.cutX 21824 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 21824 (.cutY 5824 .full (.cutX 21792 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 .empty (.cutX 26880 .empty (.cutY 11008 (.cutX 27008 (.cutY 10880 .full (.cutX 26944 (.cutY 10944 .full (.cutX 26912 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 27072 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty))) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata8 : 0<152546139 ∧ 22<128 ∧ 85<128 ∧ 0<4 ∧
    2417/4160=0 ∧ 2417%4160=2417 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

-- Frozen phase 6103, atom 920, type 0, source (7,73).
def leavesData9 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves9 : Fin 7 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 7 73 leaves9 i
def outputData9 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1792,1920,18688,18816⟩) (.node (.single ⟨1792,1920,18816,18944⟩) (.single ⟨1920,1984,18688,18752⟩))) (.node (.node (.single ⟨1920,1984,18752,18816⟩) (.single ⟨1984,2048,18688,18752⟩)) (.node (.single ⟨1984,2048,18752,18816⟩) (.single ⟨1920,2048,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,30720,30848⟩) (.node (.single ⟨13824,13952,30848,30976⟩) (.single ⟨13952,14016,30720,30784⟩))) (.node (.node (.single ⟨13952,14016,30784,30848⟩) (.single ⟨14016,14080,30720,30784⟩)) (.node (.single ⟨14016,14080,30784,30848⟩) (.single ⟨13952,14080,30848,30976⟩))))) (.node (.node (.node (.single ⟨18688,18816,1792,1920⟩) (.node (.single ⟨18688,18752,1920,1984⟩) (.single ⟨18688,18752,1984,2048⟩))) (.node (.node (.single ⟨18752,18816,1920,1984⟩) (.single ⟨18752,18816,1984,2048⟩)) (.node (.single ⟨18816,18944,1792,1920⟩) (.single ⟨18816,18944,1920,2048⟩)))) (.node (.node (.single ⟨30720,30848,13824,13952⟩) (.node (.single ⟨30720,30784,13952,14016⟩) (.single ⟨30720,30784,14016,14080⟩))) (.node (.node (.single ⟨30784,30848,13952,14016⟩) (.single ⟨30784,30848,14016,14080⟩)) (.node (.single ⟨30848,30976,13824,13952⟩) (.single ⟨30848,30976,13952,14080⟩))))))
def output9 : Fin 28 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover9 (i : Fin 28) : Fin 28 := ⟨coverData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 28) : Fin 28 := ⟨sourceData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 .empty (.cutY 18688 .empty (.cutX 1920 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 1984 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 (.cutY 30976 (.cutX 13952 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14016 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty) .empty) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 .empty (.cutY 1792 .empty (.cutX 18816 (.cutY 1920 .full (.cutX 18752 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 (.cutY 14080 (.cutX 30848 (.cutY 13952 .full (.cutX 30784 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)) .empty)) .empty) .empty)))))) .empty))

theorem metadata9 : 0<34183877 ∧ 7<128 ∧ 73<128 ∧ 0<4 ∧
    920/4160=0 ∧ 920%4160=920 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 6104, atom 7046, type 1, source (28,86).
def leavesData10 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves10 : Fin 13 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 28 86 leaves10 i
def outputData10 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7168,7232,22016,22080⟩) (.node (.single ⟨7168,7232,22080,22144⟩) (.single ⟨7232,7296,22016,22080⟩))) (.node (.single ⟨7232,7296,22080,22144⟩) (.node (.single ⟨7168,7296,22144,22272⟩) (.single ⟨7296,7360,22016,22080⟩)))) (.node (.node (.single ⟨7296,7360,22080,22144⟩) (.node (.single ⟨7360,7392,22016,22048⟩) (.single ⟨7360,7392,22048,22080⟩))) (.node (.node (.single ⟨7392,7424,22016,22048⟩) (.single ⟨7392,7424,22048,22080⟩)) (.node (.single ⟨7360,7424,22080,22144⟩) (.single ⟨7296,7424,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,25344,25472⟩) (.node (.single ⟨10496,10624,25472,25600⟩) (.single ⟨10624,10688,25344,25408⟩))) (.node (.single ⟨10624,10688,25408,25472⟩) (.node (.single ⟨10688,10720,25344,25376⟩) (.single ⟨10688,10720,25376,25408⟩)))) (.node (.node (.single ⟨10720,10752,25344,25376⟩) (.node (.single ⟨10720,10752,25376,25408⟩) (.single ⟨10688,10752,25408,25472⟩))) (.node (.node (.single ⟨10624,10688,25472,25536⟩) (.single ⟨10624,10688,25536,25600⟩)) (.node (.single ⟨10688,10752,25472,25536⟩) (.single ⟨10688,10752,25536,25600⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,7168,7232⟩) (.node (.single ⟨22016,22080,7232,7296⟩) (.single ⟨22080,22144,7168,7232⟩))) (.node (.single ⟨22080,22144,7232,7296⟩) (.node (.single ⟨22016,22080,7296,7360⟩) (.single ⟨22016,22048,7360,7392⟩)))) (.node (.node (.single ⟨22016,22048,7392,7424⟩) (.node (.single ⟨22048,22080,7360,7392⟩) (.single ⟨22048,22080,7392,7424⟩))) (.node (.node (.single ⟨22080,22144,7296,7360⟩) (.single ⟨22080,22144,7360,7424⟩)) (.node (.single ⟨22144,22272,7168,7296⟩) (.single ⟨22144,22272,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,10496,10624⟩) (.node (.single ⟨25344,25408,10624,10688⟩) (.single ⟨25344,25376,10688,10720⟩))) (.node (.single ⟨25344,25376,10720,10752⟩) (.node (.single ⟨25376,25408,10688,10720⟩) (.single ⟨25376,25408,10720,10752⟩)))) (.node (.node (.single ⟨25408,25472,10624,10688⟩) (.node (.single ⟨25408,25472,10688,10752⟩) (.single ⟨25472,25600,10496,10624⟩))) (.node (.node (.single ⟨25472,25536,10624,10688⟩) (.single ⟨25472,25536,10688,10752⟩)) (.node (.single ⟨25536,25600,10624,10688⟩) (.single ⟨25536,25600,10688,10752⟩)))))))
def output10 : Fin 52 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData10 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover10 (i : Fin 52) : Fin 52 := ⟨coverData10.get i % 52, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 52) : Fin 52 := ⟨sourceData10.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 .empty (.cutX 7424 (.cutY 22272 (.cutX 7296 (.cutY 22144 (.cutX 7232 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 7360 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 7392 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty) .empty)) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 .empty (.cutX 10496 .empty (.cutY 25344 .empty (.cutX 10624 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 10688 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 10720 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 10688 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))))) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 (.cutX 22272 (.cutY 7424 (.cutX 22144 (.cutY 7296 (.cutX 22080 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 22080 (.cutY 7360 .full (.cutX 22048 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 (.cutX 25344 .empty (.cutY 10496 .empty (.cutX 25472 (.cutY 10624 .full (.cutX 25408 (.cutY 10688 .full (.cutX 25376 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 25536 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata10 : 0<144359671 ∧ 28<128 ∧ 86<128 ∧ 1<4 ∧
    7046/4160=1 ∧ 7046%4160=2886 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 52,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 52, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 52,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 52, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 6105, atom 7118, type 1, source (29,87).
def leavesData11 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves11 : Fin 7 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 87 leaves11 i
def outputData11 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,22272,22400⟩) (.node (.single ⟨7424,7552,22400,22528⟩) (.single ⟨7552,7616,22272,22336⟩))) (.node (.node (.single ⟨7552,7616,22336,22400⟩) (.single ⟨7616,7680,22272,22336⟩)) (.node (.single ⟨7616,7680,22336,22400⟩) (.single ⟨7552,7680,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,25088,25216⟩) (.node (.single ⟨10240,10368,25216,25344⟩) (.single ⟨10368,10432,25088,25152⟩))) (.node (.node (.single ⟨10368,10432,25152,25216⟩) (.single ⟨10432,10496,25088,25152⟩)) (.node (.single ⟨10432,10496,25152,25216⟩) (.single ⟨10368,10496,25216,25344⟩))))) (.node (.node (.node (.single ⟨22272,22400,7424,7552⟩) (.node (.single ⟨22272,22336,7552,7616⟩) (.single ⟨22272,22336,7616,7680⟩))) (.node (.node (.single ⟨22336,22400,7552,7616⟩) (.single ⟨22336,22400,7616,7680⟩)) (.node (.single ⟨22400,22528,7424,7552⟩) (.single ⟨22400,22528,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,10240,10368⟩) (.node (.single ⟨25088,25152,10368,10432⟩) (.single ⟨25088,25152,10432,10496⟩))) (.node (.node (.single ⟨25152,25216,10368,10432⟩) (.single ⟨25152,25216,10432,10496⟩)) (.node (.single ⟨25216,25344,10240,10368⟩) (.single ⟨25216,25344,10368,10496⟩))))))
def output11 : Fin 28 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover11 (i : Fin 28) : Fin 28 := ⟨coverData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 28) : Fin 28 := ⟨sourceData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 .empty (.cutX 7424 .empty (.cutY 22272 .empty (.cutX 7552 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 7616 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 .empty (.cutX 10496 (.cutY 25344 (.cutX 10368 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 10432 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 (.cutX 22272 .empty (.cutY 7424 .empty (.cutX 22400 (.cutY 7552 .full (.cutX 22336 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 (.cutX 25344 (.cutY 10496 (.cutX 25216 (.cutY 10368 .full (.cutX 25152 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata11 : 0<144359671 ∧ 29<128 ∧ 87<128 ∧ 1<4 ∧
    7118/4160=1 ∧ 7118%4160=2958 ∧ ∀ i, (leaves11 i).Valid 8 := by
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 6106, atom 7506, type 1, source (35,91).
def leavesData12 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves12 : Fin 13 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 35 91 leaves12 i
def outputData12 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8960,9024,23296,23360⟩) (.node (.single ⟨8960,9024,23360,23424⟩) (.single ⟨9024,9088,23296,23360⟩))) (.node (.single ⟨9024,9088,23360,23424⟩) (.node (.single ⟨8960,9088,23424,23552⟩) (.single ⟨9088,9152,23296,23360⟩)))) (.node (.node (.single ⟨9088,9152,23360,23424⟩) (.node (.single ⟨9152,9184,23296,23328⟩) (.single ⟨9152,9184,23328,23360⟩))) (.node (.node (.single ⟨9184,9216,23296,23328⟩) (.single ⟨9184,9216,23328,23360⟩)) (.node (.single ⟨9152,9216,23360,23424⟩) (.single ⟨9088,9216,23424,23552⟩))))) (.node (.node (.node (.single ⟨9216,9344,23552,23680⟩) (.node (.single ⟨9216,9344,23680,23808⟩) (.single ⟨9344,9408,23552,23616⟩))) (.node (.single ⟨9344,9408,23616,23680⟩) (.node (.single ⟨9408,9440,23552,23584⟩) (.single ⟨9408,9440,23584,23616⟩)))) (.node (.node (.single ⟨9440,9472,23552,23584⟩) (.node (.single ⟨9440,9472,23584,23616⟩) (.single ⟨9408,9472,23616,23680⟩))) (.node (.node (.single ⟨9344,9408,23680,23744⟩) (.single ⟨9344,9408,23744,23808⟩)) (.node (.single ⟨9408,9472,23680,23744⟩) (.single ⟨9408,9472,23744,23808⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23360,8960,9024⟩) (.node (.single ⟨23296,23360,9024,9088⟩) (.single ⟨23360,23424,8960,9024⟩))) (.node (.single ⟨23360,23424,9024,9088⟩) (.node (.single ⟨23296,23360,9088,9152⟩) (.single ⟨23296,23328,9152,9184⟩)))) (.node (.node (.single ⟨23296,23328,9184,9216⟩) (.node (.single ⟨23328,23360,9152,9184⟩) (.single ⟨23328,23360,9184,9216⟩))) (.node (.node (.single ⟨23360,23424,9088,9152⟩) (.single ⟨23360,23424,9152,9216⟩)) (.node (.single ⟨23424,23552,8960,9088⟩) (.single ⟨23424,23552,9088,9216⟩))))) (.node (.node (.node (.single ⟨23552,23680,9216,9344⟩) (.node (.single ⟨23552,23616,9344,9408⟩) (.single ⟨23552,23584,9408,9440⟩))) (.node (.single ⟨23552,23584,9440,9472⟩) (.node (.single ⟨23584,23616,9408,9440⟩) (.single ⟨23584,23616,9440,9472⟩)))) (.node (.node (.single ⟨23616,23680,9344,9408⟩) (.node (.single ⟨23616,23680,9408,9472⟩) (.single ⟨23680,23808,9216,9344⟩))) (.node (.node (.single ⟨23680,23744,9344,9408⟩) (.single ⟨23680,23744,9408,9472⟩)) (.node (.single ⟨23744,23808,9344,9408⟩) (.single ⟨23744,23808,9408,9472⟩)))))))
def output12 : Fin 52 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData12 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover12 (i : Fin 52) : Fin 52 := ⟨coverData12.get i % 52, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 52) : Fin 52 := ⟨sourceData12.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 .empty (.cutX 8960 .empty (.cutY 23296 .empty (.cutX 9088 (.cutY 23424 (.cutX 9024 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 9152 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 9184 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full)))))) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 (.cutX 9472 (.cutY 23808 (.cutX 9344 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 9408 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 9440 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) (.cutX 9408 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 .empty (.cutX 23296 .empty (.cutY 8960 .empty (.cutX 23424 (.cutY 9088 (.cutX 23360 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 23360 (.cutY 9152 .full (.cutX 23328 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 (.cutX 23808 (.cutY 9472 (.cutX 23680 (.cutY 9344 .full (.cutX 23616 (.cutY 9408 .full (.cutX 23584 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 23744 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata12 : 0<67962893 ∧ 35<128 ∧ 91<128 ∧ 1<4 ∧
    7506/4160=1 ∧ 7506%4160=3346 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 6107, atom 2244, type 0, source (20,84).
def leavesData13 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves13 : Fin 10 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 84 leaves13 i
def outputData13 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,21504,21568⟩) (.single ⟨5120,5184,21568,21632⟩)) (.node (.single ⟨5184,5248,21504,21568⟩) (.node (.single ⟨5184,5248,21568,21632⟩) (.single ⟨5120,5248,21632,21760⟩)))) (.node (.node (.single ⟨5248,5312,21504,21568⟩) (.single ⟨5248,5312,21568,21632⟩)) (.node (.single ⟨5312,5376,21504,21568⟩) (.node (.single ⟨5312,5376,21568,21632⟩) (.single ⟨5248,5376,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,27392,27520⟩) (.single ⟨11008,11136,27520,27648⟩)) (.node (.single ⟨11136,11200,27392,27456⟩) (.node (.single ⟨11136,11200,27456,27520⟩) (.single ⟨11200,11264,27392,27456⟩)))) (.node (.node (.single ⟨11200,11264,27456,27520⟩) (.single ⟨11136,11200,27520,27584⟩)) (.node (.single ⟨11136,11200,27584,27648⟩) (.node (.single ⟨11200,11264,27520,27584⟩) (.single ⟨11200,11264,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,5120,5184⟩) (.single ⟨21504,21568,5184,5248⟩)) (.node (.single ⟨21568,21632,5120,5184⟩) (.node (.single ⟨21568,21632,5184,5248⟩) (.single ⟨21504,21568,5248,5312⟩)))) (.node (.node (.single ⟨21504,21568,5312,5376⟩) (.single ⟨21568,21632,5248,5312⟩)) (.node (.single ⟨21568,21632,5312,5376⟩) (.node (.single ⟨21632,21760,5120,5248⟩) (.single ⟨21632,21760,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,11008,11136⟩) (.single ⟨27392,27456,11136,11200⟩)) (.node (.single ⟨27392,27456,11200,11264⟩) (.node (.single ⟨27456,27520,11136,11200⟩) (.single ⟨27456,27520,11200,11264⟩)))) (.node (.node (.single ⟨27520,27648,11008,11136⟩) (.single ⟨27520,27584,11136,11200⟩)) (.node (.single ⟨27520,27584,11200,11264⟩) (.node (.single ⟨27584,27648,11136,11200⟩) (.single ⟨27584,27648,11200,11264⟩)))))))
def output13 : Fin 40 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover13 (i : Fin 40) : Fin 40 := ⟨coverData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 40) : Fin 40 := ⟨sourceData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 (.cutY 22016 (.cutX 5376 (.cutY 21760 (.cutX 5248 (.cutY 21632 (.cutX 5184 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 5312 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 .empty (.cutX 11008 .empty (.cutY 27392 .empty (.cutX 11136 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 11200 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) (.cutX 11200 (.cutY 27584 .full .full) (.cutY 27584 .full .full)))))))) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 (.cutX 21760 (.cutY 5376 (.cutX 21632 (.cutY 5248 (.cutX 21568 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 21568 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 .empty (.cutY 10752 .empty (.cutX 27392 .empty (.cutY 11008 .empty (.cutX 27520 (.cutY 11136 .full (.cutX 27456 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 27584 (.cutY 11200 .full .full) (.cutY 11200 .full .full)))))))) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata13 : 0<152546139 ∧ 20<128 ∧ 84<128 ∧ 0<4 ∧
    2244/4160=0 ∧ 2244%4160=2244 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 6108, atom 1969, type 0, source (17,82).
def leavesData14 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves14 : Fin 7 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 82 leaves14 i
def outputData14 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,20992,21120⟩) (.node (.single ⟨4352,4480,21120,21248⟩) (.single ⟨4480,4544,20992,21056⟩))) (.node (.node (.single ⟨4480,4544,21056,21120⟩) (.single ⟨4544,4608,20992,21056⟩)) (.node (.single ⟨4544,4608,21056,21120⟩) (.single ⟨4480,4608,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,28160,28288⟩) (.node (.single ⟨11520,11648,28288,28416⟩) (.single ⟨11648,11712,28160,28224⟩))) (.node (.node (.single ⟨11648,11712,28224,28288⟩) (.single ⟨11712,11776,28160,28224⟩)) (.node (.single ⟨11712,11776,28224,28288⟩) (.single ⟨11648,11776,28288,28416⟩))))) (.node (.node (.node (.single ⟨20992,21120,4352,4480⟩) (.node (.single ⟨20992,21056,4480,4544⟩) (.single ⟨20992,21056,4544,4608⟩))) (.node (.node (.single ⟨21056,21120,4480,4544⟩) (.single ⟨21056,21120,4544,4608⟩)) (.node (.single ⟨21120,21248,4352,4480⟩) (.single ⟨21120,21248,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,11520,11648⟩) (.node (.single ⟨28160,28224,11648,11712⟩) (.single ⟨28160,28224,11712,11776⟩))) (.node (.node (.single ⟨28224,28288,11648,11712⟩) (.single ⟨28224,28288,11712,11776⟩)) (.node (.single ⟨28288,28416,11520,11648⟩) (.single ⟨28288,28416,11648,11776⟩))))))
def output14 : Fin 28 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData14 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover14 (i : Fin 28) : Fin 28 := ⟨coverData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 28) : Fin 28 := ⟨sourceData14.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 .empty (.cutX 4352 .empty (.cutY 21248 (.cutX 4480 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 4544 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 .empty (.cutX 11520 .empty (.cutY 28416 (.cutX 11648 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 11712 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 (.cutX 21248 (.cutY 4352 .empty (.cutX 21120 (.cutY 4480 .full (.cutX 21056 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 (.cutX 28416 (.cutY 11520 .empty (.cutX 28288 (.cutY 11648 .full (.cutX 28224 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty)))))) .empty) .empty))) .empty))

theorem metadata14 : 0<152546139 ∧ 17<128 ∧ 82<128 ∧ 0<4 ∧
    1969/4160=0 ∧ 1969%4160=1969 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 6109, atom 1873, type 0, source (16,81).
def leavesData15 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves15 : Fin 10 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 81 leaves15 i
def outputData15 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,20736,20864⟩) (.single ⟨4096,4224,20864,20992⟩)) (.node (.single ⟨4224,4288,20736,20800⟩) (.node (.single ⟨4224,4288,20800,20864⟩) (.single ⟨4288,4352,20736,20800⟩)))) (.node (.node (.single ⟨4288,4352,20800,20864⟩) (.single ⟨4224,4288,20864,20928⟩)) (.node (.single ⟨4224,4288,20928,20992⟩) (.node (.single ⟨4288,4352,20864,20928⟩) (.single ⟨4288,4352,20928,20992⟩))))) (.node (.node (.node (.single ⟨11776,11840,28416,28480⟩) (.single ⟨11776,11840,28480,28544⟩)) (.node (.single ⟨11840,11904,28416,28480⟩) (.node (.single ⟨11840,11904,28480,28544⟩) (.single ⟨11776,11904,28544,28672⟩)))) (.node (.node (.single ⟨11904,11968,28416,28480⟩) (.single ⟨11904,11968,28480,28544⟩)) (.node (.single ⟨11968,12032,28416,28480⟩) (.node (.single ⟨11968,12032,28480,28544⟩) (.single ⟨11904,12032,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20864,4096,4224⟩) (.single ⟨20736,20800,4224,4288⟩)) (.node (.single ⟨20736,20800,4288,4352⟩) (.node (.single ⟨20800,20864,4224,4288⟩) (.single ⟨20800,20864,4288,4352⟩)))) (.node (.node (.single ⟨20864,20992,4096,4224⟩) (.single ⟨20864,20928,4224,4288⟩)) (.node (.single ⟨20864,20928,4288,4352⟩) (.node (.single ⟨20928,20992,4224,4288⟩) (.single ⟨20928,20992,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,11776,11840⟩) (.single ⟨28416,28480,11840,11904⟩)) (.node (.single ⟨28480,28544,11776,11840⟩) (.node (.single ⟨28480,28544,11840,11904⟩) (.single ⟨28416,28480,11904,11968⟩)))) (.node (.node (.single ⟨28416,28480,11968,12032⟩) (.single ⟨28480,28544,11904,11968⟩)) (.node (.single ⟨28480,28544,11968,12032⟩) (.node (.single ⟨28544,28672,11776,11904⟩) (.single ⟨28544,28672,11904,12032⟩)))))))
def output15 : Fin 40 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover15 (i : Fin 40) : Fin 40 := ⟨coverData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 40) : Fin 40 := ⟨sourceData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 (.cutX 4352 (.cutY 20736 .empty (.cutX 4224 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 4288 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) (.cutX 4288 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 .empty (.cutX 12032 (.cutY 28416 .empty (.cutX 11904 (.cutY 28544 (.cutX 11840 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 11968 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))) .empty))))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 (.cutX 20736 .empty (.cutY 4352 (.cutX 20864 (.cutY 4224 .full (.cutX 20800 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 20928 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 .empty (.cutX 28416 .empty (.cutY 12032 (.cutX 28544 (.cutY 11904 (.cutX 28480 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 28480 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty)))))))) .empty) .empty))) .empty))

theorem metadata15 : 0<152546139 ∧ 16<128 ∧ 81<128 ∧ 0<4 ∧
    1873/4160=0 ∧ 1873%4160=1873 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 6110, atom 6311, type 1, source (19,80).
def leavesData16 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves16 : Fin 13 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 80 leaves16 i
def outputData16 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,20480,20544⟩) (.node (.single ⟨4864,4928,20544,20608⟩) (.single ⟨4928,4992,20480,20544⟩))) (.node (.single ⟨4928,4992,20544,20608⟩) (.node (.single ⟨4864,4992,20608,20736⟩) (.single ⟨4992,5056,20480,20544⟩)))) (.node (.node (.single ⟨4992,5056,20544,20608⟩) (.node (.single ⟨5056,5088,20480,20512⟩) (.single ⟨5056,5088,20512,20544⟩))) (.node (.node (.single ⟨5088,5120,20480,20512⟩) (.single ⟨5088,5120,20512,20544⟩)) (.node (.single ⟨5056,5120,20544,20608⟩) (.single ⟨4992,5120,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,27648,27776⟩) (.node (.single ⟨12032,12160,27776,27904⟩) (.single ⟨12160,12224,27648,27712⟩))) (.node (.single ⟨12160,12224,27712,27776⟩) (.node (.single ⟨12224,12256,27648,27680⟩) (.single ⟨12224,12256,27680,27712⟩)))) (.node (.node (.single ⟨12256,12288,27648,27680⟩) (.node (.single ⟨12256,12288,27680,27712⟩) (.single ⟨12224,12288,27712,27776⟩))) (.node (.node (.single ⟨12160,12224,27776,27840⟩) (.single ⟨12160,12224,27840,27904⟩)) (.node (.single ⟨12224,12288,27776,27840⟩) (.single ⟨12224,12288,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,4864,4928⟩) (.node (.single ⟨20480,20544,4928,4992⟩) (.single ⟨20544,20608,4864,4928⟩))) (.node (.single ⟨20544,20608,4928,4992⟩) (.node (.single ⟨20480,20544,4992,5056⟩) (.single ⟨20480,20512,5056,5088⟩)))) (.node (.node (.single ⟨20480,20512,5088,5120⟩) (.node (.single ⟨20512,20544,5056,5088⟩) (.single ⟨20512,20544,5088,5120⟩))) (.node (.node (.single ⟨20544,20608,4992,5056⟩) (.single ⟨20544,20608,5056,5120⟩)) (.node (.single ⟨20608,20736,4864,4992⟩) (.single ⟨20608,20736,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,12032,12160⟩) (.node (.single ⟨27648,27712,12160,12224⟩) (.single ⟨27648,27680,12224,12256⟩))) (.node (.single ⟨27648,27680,12256,12288⟩) (.node (.single ⟨27680,27712,12224,12256⟩) (.single ⟨27680,27712,12256,12288⟩)))) (.node (.node (.single ⟨27712,27776,12160,12224⟩) (.node (.single ⟨27712,27776,12224,12288⟩) (.single ⟨27776,27904,12032,12160⟩))) (.node (.node (.single ⟨27776,27840,12160,12224⟩) (.single ⟨27776,27840,12224,12288⟩)) (.node (.single ⟨27840,27904,12160,12224⟩) (.single ⟨27840,27904,12224,12288⟩)))))))
def output16 : Fin 52 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData16 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover16 (i : Fin 52) : Fin 52 := ⟨coverData16.get i % 52, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 52) : Fin 52 := ⟨sourceData16.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 .empty (.cutY 20736 (.cutX 4992 (.cutY 20608 (.cutX 4928 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 5056 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 5088 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 .empty (.cutY 27904 (.cutX 12160 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 12224 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 12256 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 12224 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 (.cutY 4864 .empty (.cutX 20608 (.cutY 4992 (.cutX 20544 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 20544 (.cutY 5056 .full (.cutX 20512 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 (.cutY 12032 .empty (.cutX 27776 (.cutY 12160 .full (.cutX 27712 (.cutY 12224 .full (.cutX 27680 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 27840 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)) .empty))))) .empty) .empty))) .empty))

theorem metadata16 : 0<125829407 ∧ 19<128 ∧ 80<128 ∧ 1<4 ∧
    6311/4160=1 ∧ 6311%4160=2151 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 6111, atom 2662, type 0, source (25,87).
def leavesData17 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves17 : Fin 7 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 87 leaves17 i
def outputData17 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,22272,22400⟩) (.node (.single ⟨6400,6528,22400,22528⟩) (.single ⟨6528,6592,22272,22336⟩))) (.node (.node (.single ⟨6528,6592,22336,22400⟩) (.single ⟨6592,6656,22272,22336⟩)) (.node (.single ⟨6592,6656,22336,22400⟩) (.single ⟨6528,6656,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,26112,26240⟩) (.node (.single ⟨10240,10368,26240,26368⟩) (.single ⟨10368,10432,26112,26176⟩))) (.node (.node (.single ⟨10368,10432,26176,26240⟩) (.single ⟨10432,10496,26112,26176⟩)) (.node (.single ⟨10432,10496,26176,26240⟩) (.single ⟨10368,10496,26240,26368⟩))))) (.node (.node (.node (.single ⟨22272,22400,6400,6528⟩) (.node (.single ⟨22272,22336,6528,6592⟩) (.single ⟨22272,22336,6592,6656⟩))) (.node (.node (.single ⟨22336,22400,6528,6592⟩) (.single ⟨22336,22400,6592,6656⟩)) (.node (.single ⟨22400,22528,6400,6528⟩) (.single ⟨22400,22528,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,10240,10368⟩) (.node (.single ⟨26112,26176,10368,10432⟩) (.single ⟨26112,26176,10432,10496⟩))) (.node (.node (.single ⟨26176,26240,10368,10432⟩) (.single ⟨26176,26240,10432,10496⟩)) (.node (.single ⟨26240,26368,10240,10368⟩) (.single ⟨26240,26368,10368,10496⟩))))))
def output17 : Fin 28 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData17 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover17 (i : Fin 28) : Fin 28 := ⟨coverData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 28) : Fin 28 := ⟨sourceData17.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 .empty (.cutX 6400 .empty (.cutY 22272 .empty (.cutX 6528 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 6592 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 .empty (.cutX 10496 (.cutY 26368 (.cutX 10368 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 10432 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 (.cutX 22272 .empty (.cutY 6400 .empty (.cutX 22400 (.cutY 6528 .full (.cutX 22336 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty)) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 (.cutX 26368 (.cutY 10496 (.cutX 26240 (.cutY 10368 .full (.cutX 26176 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata17 : 0<104681033 ∧ 25<128 ∧ 87<128 ∧ 0<4 ∧
    2662/4160=0 ∧ 2662%4160=2662 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 6112, atom 1255, type 0, source (10,75).
def leavesData18 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves18 : Fin 4 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 75 leaves18 i
def outputData18 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,19200,19328⟩) (.single ⟨2560,2688,19328,19456⟩)) (.node (.single ⟨2688,2816,19200,19328⟩) (.single ⟨2688,2816,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,29952,30080⟩) (.single ⟨13312,13440,30080,30208⟩)) (.node (.single ⟨13440,13568,29952,30080⟩) (.single ⟨13440,13568,30080,30208⟩)))) (.node (.node (.node (.single ⟨19200,19328,2560,2688⟩) (.single ⟨19200,19328,2688,2816⟩)) (.node (.single ⟨19328,19456,2560,2688⟩) (.single ⟨19328,19456,2688,2816⟩))) (.node (.node (.single ⟨29952,30080,13312,13440⟩) (.single ⟨29952,30080,13440,13568⟩)) (.node (.single ⟨30080,30208,13312,13440⟩) (.single ⟨30080,30208,13440,13568⟩)))))
def output18 : Fin 16 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover18 (i : Fin 16) : Fin 16 := ⟨coverData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 16) : Fin 16 := ⟨sourceData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 .empty (.cutX 2816 (.cutY 19200 .empty (.cutX 2688 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 (.cutX 13568 (.cutY 29952 .empty (.cutX 13440 (.cutY 30080 .full .full) (.cutY 30080 .full .full))) .empty) .empty) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 .empty (.cutX 19200 .empty (.cutY 2816 (.cutX 19328 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 (.cutX 29952 .empty (.cutY 13568 (.cutX 30080 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty) .empty))) .empty) .empty))))) .empty))

theorem metadata18 : 0<48363413 ∧ 10<128 ∧ 75<128 ∧ 0<4 ∧
    1255/4160=0 ∧ 1255%4160=1255 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 6113, atom 3164, type 0, source (32,92).
def leavesData19 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves19 : Fin 10 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 92 leaves19 i
def outputData19 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8256,23552,23616⟩) (.single ⟨8192,8256,23616,23680⟩)) (.node (.single ⟨8256,8320,23552,23616⟩) (.node (.single ⟨8256,8320,23616,23680⟩) (.single ⟨8192,8320,23680,23808⟩)))) (.node (.node (.single ⟨8320,8384,23552,23616⟩) (.single ⟨8320,8384,23616,23680⟩)) (.node (.single ⟨8384,8448,23552,23616⟩) (.node (.single ⟨8384,8448,23616,23680⟩) (.single ⟨8320,8448,23680,23808⟩))))) (.node (.node (.node (.single ⟨8960,9088,24320,24448⟩) (.single ⟨8960,9088,24448,24576⟩)) (.node (.single ⟨9088,9152,24320,24384⟩) (.node (.single ⟨9088,9152,24384,24448⟩) (.single ⟨9152,9216,24320,24384⟩)))) (.node (.node (.single ⟨9152,9216,24384,24448⟩) (.single ⟨9088,9152,24448,24512⟩)) (.node (.single ⟨9088,9152,24512,24576⟩) (.node (.single ⟨9152,9216,24448,24512⟩) (.single ⟨9152,9216,24512,24576⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,8192,8256⟩) (.single ⟨23552,23616,8256,8320⟩)) (.node (.single ⟨23616,23680,8192,8256⟩) (.node (.single ⟨23616,23680,8256,8320⟩) (.single ⟨23552,23616,8320,8384⟩)))) (.node (.node (.single ⟨23552,23616,8384,8448⟩) (.single ⟨23616,23680,8320,8384⟩)) (.node (.single ⟨23616,23680,8384,8448⟩) (.node (.single ⟨23680,23808,8192,8320⟩) (.single ⟨23680,23808,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,8960,9088⟩) (.single ⟨24320,24384,9088,9152⟩)) (.node (.single ⟨24320,24384,9152,9216⟩) (.node (.single ⟨24384,24448,9088,9152⟩) (.single ⟨24384,24448,9152,9216⟩)))) (.node (.node (.single ⟨24448,24576,8960,9088⟩) (.single ⟨24448,24512,9088,9152⟩)) (.node (.single ⟨24448,24512,9152,9216⟩) (.node (.single ⟨24512,24576,9088,9152⟩) (.single ⟨24512,24576,9152,9216⟩)))))))
def output19 : Fin 40 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData19 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover19 (i : Fin 40) : Fin 40 := ⟨coverData19.get i % 40, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 40) : Fin 40 := ⟨sourceData19.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 (.cutY 24064 (.cutX 8448 (.cutY 23808 (.cutX 8320 (.cutY 23680 (.cutX 8256 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 8384 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty) (.cutY 24064 .empty (.cutX 8960 .empty (.cutY 24320 .empty (.cutX 9088 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 9152 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) (.cutX 9152 (.cutY 24512 .full .full) (.cutY 24512 .full .full))))))))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 (.cutX 23808 (.cutY 8448 (.cutX 23680 (.cutY 8320 (.cutX 23616 (.cutY 8256 .full .full) (.cutY 8256 .full .full)) (.cutX 23616 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) (.cutY 8704 .empty (.cutX 24320 .empty (.cutY 8960 .empty (.cutX 24448 (.cutY 9088 .full (.cutX 24384 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 24512 (.cutY 9152 .full .full) (.cutY 9152 .full .full)))))))) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata19 : 0<75538780 ∧ 32<128 ∧ 92<128 ∧ 0<4 ∧
    3164/4160=0 ∧ 3164%4160=3164 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 6114, atom 5626, type 1, source (12,74).
def leavesData20 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves20 : Fin 4 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 74 leaves20 i
def outputData20 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,18944,19072⟩) (.single ⟨3072,3200,19072,19200⟩)) (.node (.single ⟨3200,3328,18944,19072⟩) (.single ⟨3200,3328,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,29440,29568⟩) (.single ⟨13568,13696,29568,29696⟩)) (.node (.single ⟨13696,13824,29440,29568⟩) (.single ⟨13696,13824,29568,29696⟩)))) (.node (.node (.node (.single ⟨18944,19072,3072,3200⟩) (.single ⟨18944,19072,3200,3328⟩)) (.node (.single ⟨19072,19200,3072,3200⟩) (.single ⟨19072,19200,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,13568,13696⟩) (.single ⟨29440,29568,13696,13824⟩)) (.node (.single ⟨29568,29696,13568,13696⟩) (.single ⟨29568,29696,13696,13824⟩)))))
def output20 : Fin 16 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover20 (i : Fin 16) : Fin 16 := ⟨coverData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 16) : Fin 16 := ⟨sourceData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 (.cutY 19200 (.cutX 3200 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 .empty (.cutY 29440 .empty (.cutX 13696 (.cutY 29568 .full .full) (.cutY 29568 .full .full))))) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 (.cutY 3328 (.cutX 19072 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty) .empty) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 .empty (.cutY 13568 .empty (.cutX 29568 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata20 : 0<94387549 ∧ 12<128 ∧ 74<128 ∧ 1<4 ∧
    5626/4160=1 ∧ 5626%4160=1466 ∧ ∀ i, (leaves20 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData20).mp
    (by decide +kernel)

theorem sourceChecked20_0 : ∀ i : Fin 16,
    (fun i => output20 i = raw20 (source20 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked20 : ∀ i : Fin 16, (fun i => output20 i = raw20 (source20 i)) i :=
  forallFin_of_zero_offset (fun i => output20 i = raw20 (source20 i)) sourceChecked20_0

theorem coverChecked20_0 : ∀ i : Fin 16,
    (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked20 : ∀ i : Fin 16, (fun i => (output20 (cover20 i)).ContainsBox (raw20 i)) i :=
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 6115, atom 5192, type 1, source (8,72).
def leavesData21 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves21 : Fin 7 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 72 leaves21 i
def outputData21 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,18432,18560⟩) (.node (.single ⟨2048,2176,18560,18688⟩) (.single ⟨2176,2240,18432,18496⟩))) (.node (.node (.single ⟨2176,2240,18496,18560⟩) (.single ⟨2240,2304,18432,18496⟩)) (.node (.single ⟨2240,2304,18496,18560⟩) (.single ⟨2176,2304,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,30464,30592⟩) (.node (.single ⟨14080,14208,30592,30720⟩) (.single ⟨14208,14272,30464,30528⟩))) (.node (.node (.single ⟨14208,14272,30528,30592⟩) (.single ⟨14272,14336,30464,30528⟩)) (.node (.single ⟨14272,14336,30528,30592⟩) (.single ⟨14208,14336,30592,30720⟩))))) (.node (.node (.node (.single ⟨18432,18560,2048,2176⟩) (.node (.single ⟨18432,18496,2176,2240⟩) (.single ⟨18432,18496,2240,2304⟩))) (.node (.node (.single ⟨18496,18560,2176,2240⟩) (.single ⟨18496,18560,2240,2304⟩)) (.node (.single ⟨18560,18688,2048,2176⟩) (.single ⟨18560,18688,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,14080,14208⟩) (.node (.single ⟨30464,30528,14208,14272⟩) (.single ⟨30464,30528,14272,14336⟩))) (.node (.node (.single ⟨30528,30592,14208,14272⟩) (.single ⟨30528,30592,14272,14336⟩)) (.node (.single ⟨30592,30720,14080,14208⟩) (.single ⟨30592,30720,14208,14336⟩))))))
def output21 : Fin 28 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover21 (i : Fin 28) : Fin 28 := ⟨coverData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 28) : Fin 28 := ⟨sourceData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 (.cutY 18688 (.cutX 2176 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 2240 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 .empty (.cutY 30464 .empty (.cutX 14208 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14272 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full)))))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 (.cutY 2304 (.cutX 18560 (.cutY 2176 .full (.cutX 18496 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 .empty (.cutY 14080 .empty (.cutX 30592 (.cutY 14208 .full (.cutX 30528 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full)))))))) .empty) .empty))))) .empty))

theorem metadata21 : 0<94387549 ∧ 8<128 ∧ 72<128 ∧ 1<4 ∧
    5192/4160=1 ∧ 5192%4160=1032 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 6116, atom 6574, type 1, source (22,82).
def leavesData22 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves22 : Fin 13 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 82 leaves22 i
def outputData22 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,20992,21056⟩) (.node (.single ⟨5632,5696,21056,21120⟩) (.single ⟨5696,5760,20992,21056⟩))) (.node (.single ⟨5696,5760,21056,21120⟩) (.node (.single ⟨5632,5760,21120,21248⟩) (.single ⟨5760,5824,20992,21056⟩)))) (.node (.node (.single ⟨5760,5824,21056,21120⟩) (.node (.single ⟨5824,5856,20992,21024⟩) (.single ⟨5824,5856,21024,21056⟩))) (.node (.node (.single ⟨5856,5888,20992,21024⟩) (.single ⟨5856,5888,21024,21056⟩)) (.node (.single ⟨5824,5888,21056,21120⟩) (.single ⟨5760,5888,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,26880,27008⟩) (.node (.single ⟨11520,11648,27008,27136⟩) (.single ⟨11648,11712,26880,26944⟩))) (.node (.single ⟨11648,11712,26944,27008⟩) (.node (.single ⟨11712,11744,26880,26912⟩) (.single ⟨11712,11744,26912,26944⟩)))) (.node (.node (.single ⟨11744,11776,26880,26912⟩) (.node (.single ⟨11744,11776,26912,26944⟩) (.single ⟨11712,11776,26944,27008⟩))) (.node (.node (.single ⟨11648,11712,27008,27072⟩) (.single ⟨11648,11712,27072,27136⟩)) (.node (.single ⟨11712,11776,27008,27072⟩) (.single ⟨11712,11776,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,5632,5696⟩) (.node (.single ⟨20992,21056,5696,5760⟩) (.single ⟨21056,21120,5632,5696⟩))) (.node (.single ⟨21056,21120,5696,5760⟩) (.node (.single ⟨20992,21056,5760,5824⟩) (.single ⟨20992,21024,5824,5856⟩)))) (.node (.node (.single ⟨20992,21024,5856,5888⟩) (.node (.single ⟨21024,21056,5824,5856⟩) (.single ⟨21024,21056,5856,5888⟩))) (.node (.node (.single ⟨21056,21120,5760,5824⟩) (.single ⟨21056,21120,5824,5888⟩)) (.node (.single ⟨21120,21248,5632,5760⟩) (.single ⟨21120,21248,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,11520,11648⟩) (.node (.single ⟨26880,26944,11648,11712⟩) (.single ⟨26880,26912,11712,11744⟩))) (.node (.single ⟨26880,26912,11744,11776⟩) (.node (.single ⟨26912,26944,11712,11744⟩) (.single ⟨26912,26944,11744,11776⟩)))) (.node (.node (.single ⟨26944,27008,11648,11712⟩) (.node (.single ⟨26944,27008,11712,11776⟩) (.single ⟨27008,27136,11520,11648⟩))) (.node (.node (.single ⟨27008,27072,11648,11712⟩) (.single ⟨27008,27072,11712,11776⟩)) (.node (.single ⟨27072,27136,11648,11712⟩) (.single ⟨27072,27136,11712,11776⟩)))))))
def output22 : Fin 52 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover22 (i : Fin 52) : Fin 52 := ⟨coverData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 52) : Fin 52 := ⟨sourceData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 (.cutY 21248 (.cutX 5760 (.cutY 21120 (.cutX 5696 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 5824 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 5856 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty) .empty))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 .empty (.cutY 26880 .empty (.cutX 11648 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 11712 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 11744 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 11712 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 (.cutY 5888 (.cutX 21120 (.cutY 5760 (.cutX 21056 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 21056 (.cutY 5824 .full (.cutX 21024 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 .empty (.cutY 11520 .empty (.cutX 27008 (.cutY 11648 .full (.cutX 26944 (.cutY 11712 .full (.cutX 26912 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 27072 (.cutY 11712 .full .full) (.cutY 11712 .full .full)))))) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata22 : 0<125829407 ∧ 22<128 ∧ 82<128 ∧ 1<4 ∧
    6574/4160=1 ∧ 6574%4160=2414 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 52,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 52, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) sourceChecked22_0

theorem coverChecked22_0 : ∀ i : Fin 52,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 52, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 6117, atom 6819, type 1, source (25,84).
def leavesData23 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves23 : Fin 13 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 84 leaves23 i
def outputData23 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,21504,21568⟩) (.node (.single ⟨6400,6464,21568,21632⟩) (.single ⟨6464,6528,21504,21568⟩))) (.node (.single ⟨6464,6528,21568,21632⟩) (.node (.single ⟨6400,6528,21632,21760⟩) (.single ⟨6528,6592,21504,21568⟩)))) (.node (.node (.single ⟨6528,6592,21568,21632⟩) (.node (.single ⟨6592,6624,21504,21536⟩) (.single ⟨6592,6624,21536,21568⟩))) (.node (.node (.single ⟨6624,6656,21504,21536⟩) (.single ⟨6624,6656,21536,21568⟩)) (.node (.single ⟨6592,6656,21568,21632⟩) (.single ⟨6528,6656,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,26112,26240⟩) (.node (.single ⟨11008,11136,26240,26368⟩) (.single ⟨11136,11200,26112,26176⟩))) (.node (.single ⟨11136,11200,26176,26240⟩) (.node (.single ⟨11200,11232,26112,26144⟩) (.single ⟨11200,11232,26144,26176⟩)))) (.node (.node (.single ⟨11232,11264,26112,26144⟩) (.node (.single ⟨11232,11264,26144,26176⟩) (.single ⟨11200,11264,26176,26240⟩))) (.node (.node (.single ⟨11136,11200,26240,26304⟩) (.single ⟨11136,11200,26304,26368⟩)) (.node (.single ⟨11200,11264,26240,26304⟩) (.single ⟨11200,11264,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6400,6464⟩) (.node (.single ⟨21504,21568,6464,6528⟩) (.single ⟨21568,21632,6400,6464⟩))) (.node (.single ⟨21568,21632,6464,6528⟩) (.node (.single ⟨21504,21568,6528,6592⟩) (.single ⟨21504,21536,6592,6624⟩)))) (.node (.node (.single ⟨21504,21536,6624,6656⟩) (.node (.single ⟨21536,21568,6592,6624⟩) (.single ⟨21536,21568,6624,6656⟩))) (.node (.node (.single ⟨21568,21632,6528,6592⟩) (.single ⟨21568,21632,6592,6656⟩)) (.node (.single ⟨21632,21760,6400,6528⟩) (.single ⟨21632,21760,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,11008,11136⟩) (.node (.single ⟨26112,26176,11136,11200⟩) (.single ⟨26112,26144,11200,11232⟩))) (.node (.single ⟨26112,26144,11232,11264⟩) (.node (.single ⟨26144,26176,11200,11232⟩) (.single ⟨26144,26176,11232,11264⟩)))) (.node (.node (.single ⟨26176,26240,11136,11200⟩) (.node (.single ⟨26176,26240,11200,11264⟩) (.single ⟨26240,26368,11008,11136⟩))) (.node (.node (.single ⟨26240,26304,11136,11200⟩) (.single ⟨26240,26304,11200,11264⟩)) (.node (.single ⟨26304,26368,11136,11200⟩) (.single ⟨26304,26368,11200,11264⟩)))))))
def output23 : Fin 52 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover23 (i : Fin 52) : Fin 52 := ⟨coverData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 52) : Fin 52 := ⟨sourceData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 .empty (.cutY 21760 (.cutX 6528 (.cutY 21632 (.cutX 6464 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6592 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 6624 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 .empty (.cutY 26368 (.cutX 11136 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 11200 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 11232 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 11200 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 (.cutY 6400 .empty (.cutX 21632 (.cutY 6528 (.cutX 21568 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21568 (.cutY 6592 .full (.cutX 21536 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 (.cutY 11008 .empty (.cutX 26240 (.cutY 11136 .full (.cutX 26176 (.cutY 11200 .full (.cutX 26144 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 26304 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata23 : 0<144359671 ∧ 25<128 ∧ 84<128 ∧ 1<4 ∧
    6819/4160=1 ∧ 6819%4160=2659 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 6118, atom 3228, type 0, source (33,93).
def leavesData24 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves24 : Fin 7 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 93 leaves24 i
def outputData24 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,23808,23936⟩) (.node (.single ⟨8448,8576,23936,24064⟩) (.single ⟨8576,8640,23808,23872⟩))) (.node (.node (.single ⟨8576,8640,23872,23936⟩) (.single ⟨8640,8704,23808,23872⟩)) (.node (.single ⟨8640,8704,23872,23936⟩) (.single ⟨8576,8704,23936,24064⟩)))) (.node (.node (.single ⟨8704,8832,24064,24192⟩) (.node (.single ⟨8704,8832,24192,24320⟩) (.single ⟨8832,8896,24064,24128⟩))) (.node (.node (.single ⟨8832,8896,24128,24192⟩) (.single ⟨8896,8960,24064,24128⟩)) (.node (.single ⟨8896,8960,24128,24192⟩) (.single ⟨8832,8960,24192,24320⟩))))) (.node (.node (.node (.single ⟨23808,23936,8448,8576⟩) (.node (.single ⟨23808,23872,8576,8640⟩) (.single ⟨23808,23872,8640,8704⟩))) (.node (.node (.single ⟨23872,23936,8576,8640⟩) (.single ⟨23872,23936,8640,8704⟩)) (.node (.single ⟨23936,24064,8448,8576⟩) (.single ⟨23936,24064,8576,8704⟩)))) (.node (.node (.single ⟨24064,24192,8704,8832⟩) (.node (.single ⟨24064,24128,8832,8896⟩) (.single ⟨24064,24128,8896,8960⟩))) (.node (.node (.single ⟨24128,24192,8832,8896⟩) (.single ⟨24128,24192,8896,8960⟩)) (.node (.single ⟨24192,24320,8704,8832⟩) (.single ⟨24192,24320,8832,8960⟩))))))
def output24 : Fin 28 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover24 (i : Fin 28) : Fin 28 := ⟨coverData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 28) : Fin 28 := ⟨sourceData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 (.cutY 24064 (.cutX 8448 .empty (.cutY 23808 .empty (.cutX 8576 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 8640 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty) (.cutY 24064 .empty (.cutX 8960 (.cutY 24320 (.cutX 8832 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 8896 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 (.cutX 23808 .empty (.cutY 8448 .empty (.cutX 23936 (.cutY 8576 .full (.cutX 23872 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty) (.cutY 8704 .empty (.cutX 24320 (.cutY 8960 (.cutX 24192 (.cutY 8832 .full (.cutX 24128 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty))) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata24 : 0<75538780 ∧ 33<128 ∧ 93<128 ∧ 0<4 ∧
    3228/4160=0 ∧ 3228%4160=3228 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 6119, atom 2740, type 0, source (26,88).
def leavesData25 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves25 : Fin 7 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 88 leaves25 i
def outputData25 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,22528,22656⟩) (.node (.single ⟨6656,6784,22656,22784⟩) (.single ⟨6784,6848,22528,22592⟩))) (.node (.node (.single ⟨6784,6848,22592,22656⟩) (.single ⟨6848,6912,22528,22592⟩)) (.node (.single ⟨6848,6912,22592,22656⟩) (.single ⟨6784,6912,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,25856,25984⟩) (.node (.single ⟨9984,10112,25984,26112⟩) (.single ⟨10112,10176,25856,25920⟩))) (.node (.node (.single ⟨10112,10176,25920,25984⟩) (.single ⟨10176,10240,25856,25920⟩)) (.node (.single ⟨10176,10240,25920,25984⟩) (.single ⟨10112,10240,25984,26112⟩))))) (.node (.node (.node (.single ⟨22528,22656,6656,6784⟩) (.node (.single ⟨22528,22592,6784,6848⟩) (.single ⟨22528,22592,6848,6912⟩))) (.node (.node (.single ⟨22592,22656,6784,6848⟩) (.single ⟨22592,22656,6848,6912⟩)) (.node (.single ⟨22656,22784,6656,6784⟩) (.single ⟨22656,22784,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,9984,10112⟩) (.node (.single ⟨25856,25920,10112,10176⟩) (.single ⟨25856,25920,10176,10240⟩))) (.node (.node (.single ⟨25920,25984,10112,10176⟩) (.single ⟨25920,25984,10176,10240⟩)) (.node (.single ⟨25984,26112,9984,10112⟩) (.single ⟨25984,26112,10112,10240⟩))))))
def output25 : Fin 28 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData25 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover25 (i : Fin 28) : Fin 28 := ⟨coverData25.get i % 28, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 28) : Fin 28 := ⟨sourceData25.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 (.cutX 6912 (.cutY 22784 (.cutX 6784 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 6848 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 (.cutX 9984 .empty (.cutY 25856 .empty (.cutX 10112 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10176 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty)))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 .empty (.cutX 22784 (.cutY 6912 (.cutX 22656 (.cutY 6784 .full (.cutX 22592 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty)) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 .empty (.cutX 25856 .empty (.cutY 9984 .empty (.cutX 25984 (.cutY 10112 .full (.cutX 25920 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))))) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata25 : 0<145899414 ∧ 26<128 ∧ 88<128 ∧ 0<4 ∧
    2740/4160=0 ∧ 2740%4160=2740 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 28,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 28, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) sourceChecked25_0

theorem coverChecked25_0 : ∀ i : Fin 28,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 28, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 6120, atom 2501, type 0, source (23,86).
def leavesData26 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves26 : Fin 10 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 86 leaves26 i
def outputData26 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,22016,22080⟩) (.single ⟨5888,5952,22080,22144⟩)) (.node (.single ⟨5952,6016,22016,22080⟩) (.node (.single ⟨5952,6016,22080,22144⟩) (.single ⟨5888,6016,22144,22272⟩)))) (.node (.node (.single ⟨6016,6080,22016,22080⟩) (.single ⟨6016,6080,22080,22144⟩)) (.node (.single ⟨6080,6144,22016,22080⟩) (.node (.single ⟨6080,6144,22080,22144⟩) (.single ⟨6016,6144,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,26624,26752⟩) (.single ⟨10496,10624,26752,26880⟩)) (.node (.single ⟨10624,10688,26624,26688⟩) (.node (.single ⟨10624,10688,26688,26752⟩) (.single ⟨10688,10752,26624,26688⟩)))) (.node (.node (.single ⟨10688,10752,26688,26752⟩) (.single ⟨10624,10688,26752,26816⟩)) (.node (.single ⟨10624,10688,26816,26880⟩) (.node (.single ⟨10688,10752,26752,26816⟩) (.single ⟨10688,10752,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,5888,5952⟩) (.single ⟨22016,22080,5952,6016⟩)) (.node (.single ⟨22080,22144,5888,5952⟩) (.node (.single ⟨22080,22144,5952,6016⟩) (.single ⟨22016,22080,6016,6080⟩)))) (.node (.node (.single ⟨22016,22080,6080,6144⟩) (.single ⟨22080,22144,6016,6080⟩)) (.node (.single ⟨22080,22144,6080,6144⟩) (.node (.single ⟨22144,22272,5888,6016⟩) (.single ⟨22144,22272,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,10496,10624⟩) (.single ⟨26624,26688,10624,10688⟩)) (.node (.single ⟨26624,26688,10688,10752⟩) (.node (.single ⟨26688,26752,10624,10688⟩) (.single ⟨26688,26752,10688,10752⟩)))) (.node (.node (.single ⟨26752,26880,10496,10624⟩) (.single ⟨26752,26816,10624,10688⟩)) (.node (.single ⟨26752,26816,10688,10752⟩) (.node (.single ⟨26816,26880,10624,10688⟩) (.single ⟨26816,26880,10688,10752⟩)))))))
def output26 : Fin 40 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData26 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover26 (i : Fin 40) : Fin 40 := ⟨coverData26.get i % 40, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 40) : Fin 40 := ⟨sourceData26.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 .empty (.cutX 5888 .empty (.cutY 22272 (.cutX 6016 (.cutY 22144 (.cutX 5952 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 6080 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty)))))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 (.cutY 27136 (.cutX 10496 .empty (.cutY 26880 (.cutX 10624 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 10688 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 10688 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 .empty (.cutY 5632 .empty (.cutX 22272 (.cutY 5888 .empty (.cutX 22144 (.cutY 6016 (.cutX 22080 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 22080 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty))))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 (.cutX 26880 (.cutY 10496 .empty (.cutX 26752 (.cutY 10624 .full (.cutX 26688 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 26816 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata26 : 0<152546139 ∧ 23<128 ∧ 86<128 ∧ 0<4 ∧
    2501/4160=0 ∧ 2501%4160=2501 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 6121, atom 2332, type 0, source (21,85).
def leavesData27 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves27 : Fin 10 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 85 leaves27 i
def outputData27 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,21760,21824⟩) (.single ⟨5376,5440,21824,21888⟩)) (.node (.single ⟨5440,5504,21760,21824⟩) (.node (.single ⟨5440,5504,21824,21888⟩) (.single ⟨5376,5504,21888,22016⟩)))) (.node (.node (.single ⟨5504,5568,21760,21824⟩) (.single ⟨5504,5568,21824,21888⟩)) (.node (.single ⟨5568,5632,21760,21824⟩) (.node (.single ⟨5568,5632,21824,21888⟩) (.single ⟨5504,5632,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,27136,27264⟩) (.single ⟨10752,10880,27264,27392⟩)) (.node (.single ⟨10880,10944,27136,27200⟩) (.node (.single ⟨10880,10944,27200,27264⟩) (.single ⟨10944,11008,27136,27200⟩)))) (.node (.node (.single ⟨10944,11008,27200,27264⟩) (.single ⟨10880,10944,27264,27328⟩)) (.node (.single ⟨10880,10944,27328,27392⟩) (.node (.single ⟨10944,11008,27264,27328⟩) (.single ⟨10944,11008,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,5376,5440⟩) (.single ⟨21760,21824,5440,5504⟩)) (.node (.single ⟨21824,21888,5376,5440⟩) (.node (.single ⟨21824,21888,5440,5504⟩) (.single ⟨21760,21824,5504,5568⟩)))) (.node (.node (.single ⟨21760,21824,5568,5632⟩) (.single ⟨21824,21888,5504,5568⟩)) (.node (.single ⟨21824,21888,5568,5632⟩) (.node (.single ⟨21888,22016,5376,5504⟩) (.single ⟨21888,22016,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,10752,10880⟩) (.single ⟨27136,27200,10880,10944⟩)) (.node (.single ⟨27136,27200,10944,11008⟩) (.node (.single ⟨27200,27264,10880,10944⟩) (.single ⟨27200,27264,10944,11008⟩)))) (.node (.node (.single ⟨27264,27392,10752,10880⟩) (.single ⟨27264,27328,10880,10944⟩)) (.node (.single ⟨27264,27328,10944,11008⟩) (.node (.single ⟨27328,27392,10880,10944⟩) (.single ⟨27328,27392,10944,11008⟩)))))))
def output27 : Fin 40 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover27 (i : Fin 40) : Fin 40 := ⟨coverData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 40) : Fin 40 := ⟨sourceData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 (.cutY 22016 (.cutX 5376 .empty (.cutY 21760 .empty (.cutX 5504 (.cutY 21888 (.cutX 5440 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 5568 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty) .empty))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 .empty (.cutX 11008 (.cutY 27392 (.cutX 10880 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 10944 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 10944 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty))) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 (.cutX 21760 .empty (.cutY 5376 .empty (.cutX 21888 (.cutY 5504 (.cutX 21824 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 21824 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 .empty (.cutY 10752 .empty (.cutX 27392 (.cutY 11008 (.cutX 27264 (.cutY 10880 .full (.cutX 27200 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 27328 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty) .empty))) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata27 : 0<152546139 ∧ 21<128 ∧ 85<128 ∧ 0<4 ∧
    2332/4160=0 ∧ 2332%4160=2332 ∧ ∀ i, (leaves27 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData27).mp
    (by decide +kernel)

theorem sourceChecked27_0 : ∀ i : Fin 40,
    (fun i => output27 i = raw27 (source27 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked27 : ∀ i : Fin 40, (fun i => output27 i = raw27 (source27 i)) i :=
  forallFin_of_zero_offset (fun i => output27 i = raw27 (source27 i)) sourceChecked27_0

theorem coverChecked27_0 : ∀ i : Fin 40,
    (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked27 : ∀ i : Fin 40, (fun i => (output27 (cover27 i)).ContainsBox (raw27 i)) i :=
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 6122, atom 3031, type 0, source (30,91).
def leavesData28 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves28 : Fin 13 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 30 91 leaves28 i
def outputData28 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,23296,23360⟩) (.node (.single ⟨7680,7744,23360,23424⟩) (.single ⟨7744,7808,23296,23360⟩))) (.node (.single ⟨7744,7808,23360,23424⟩) (.node (.single ⟨7680,7808,23424,23552⟩) (.single ⟨7808,7872,23296,23360⟩)))) (.node (.node (.single ⟨7808,7872,23360,23424⟩) (.node (.single ⟨7872,7904,23296,23328⟩) (.single ⟨7872,7904,23328,23360⟩))) (.node (.node (.single ⟨7904,7936,23296,23328⟩) (.single ⟨7904,7936,23328,23360⟩)) (.node (.single ⟨7872,7936,23360,23424⟩) (.single ⟨7808,7936,23424,23552⟩))))) (.node (.node (.node (.single ⟨9216,9344,24832,24960⟩) (.node (.single ⟨9216,9344,24960,25088⟩) (.single ⟨9344,9408,24832,24896⟩))) (.node (.single ⟨9344,9408,24896,24960⟩) (.node (.single ⟨9408,9440,24832,24864⟩) (.single ⟨9408,9440,24864,24896⟩)))) (.node (.node (.single ⟨9440,9472,24832,24864⟩) (.node (.single ⟨9440,9472,24864,24896⟩) (.single ⟨9408,9472,24896,24960⟩))) (.node (.node (.single ⟨9344,9408,24960,25024⟩) (.single ⟨9344,9408,25024,25088⟩)) (.node (.single ⟨9408,9472,24960,25024⟩) (.single ⟨9408,9472,25024,25088⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23360,7680,7744⟩) (.node (.single ⟨23296,23360,7744,7808⟩) (.single ⟨23360,23424,7680,7744⟩))) (.node (.single ⟨23360,23424,7744,7808⟩) (.node (.single ⟨23296,23360,7808,7872⟩) (.single ⟨23296,23328,7872,7904⟩)))) (.node (.node (.single ⟨23296,23328,7904,7936⟩) (.node (.single ⟨23328,23360,7872,7904⟩) (.single ⟨23328,23360,7904,7936⟩))) (.node (.node (.single ⟨23360,23424,7808,7872⟩) (.single ⟨23360,23424,7872,7936⟩)) (.node (.single ⟨23424,23552,7680,7808⟩) (.single ⟨23424,23552,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,9216,9344⟩) (.node (.single ⟨24832,24896,9344,9408⟩) (.single ⟨24832,24864,9408,9440⟩))) (.node (.single ⟨24832,24864,9440,9472⟩) (.node (.single ⟨24864,24896,9408,9440⟩) (.single ⟨24864,24896,9440,9472⟩)))) (.node (.node (.single ⟨24896,24960,9344,9408⟩) (.node (.single ⟨24896,24960,9408,9472⟩) (.single ⟨24960,25088,9216,9344⟩))) (.node (.node (.single ⟨24960,25024,9344,9408⟩) (.single ⟨24960,25024,9408,9472⟩)) (.node (.single ⟨25024,25088,9344,9408⟩) (.single ⟨25024,25088,9408,9472⟩)))))))
def output28 : Fin 52 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData28 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover28 (i : Fin 52) : Fin 52 := ⟨coverData28.get i % 52, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 52) : Fin 52 := ⟨sourceData28.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 .empty (.cutX 7936 (.cutY 23296 .empty (.cutX 7808 (.cutY 23424 (.cutX 7744 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 7872 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 7904 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full))) .empty))) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 (.cutX 9472 (.cutY 24832 .empty (.cutX 9344 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 9408 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 9440 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 9408 (.cutY 25024 .full .full) (.cutY 25024 .full .full))))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 .empty (.cutX 23296 .empty (.cutY 7936 (.cutX 23424 (.cutY 7808 (.cutX 23360 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 23360 (.cutY 7872 .full (.cutX 23328 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 (.cutX 24832 .empty (.cutY 9472 (.cutX 24960 (.cutY 9344 .full (.cutX 24896 (.cutY 9408 .full (.cutX 24864 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 25024 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata28 : 0<145899414 ∧ 30<128 ∧ 91<128 ∧ 0<4 ∧
    3031/4160=0 ∧ 3031%4160=3031 ∧ ∀ i, (leaves28 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData28).mp
    (by decide +kernel)

theorem sourceChecked28_0 : ∀ i : Fin 52,
    (fun i => output28 i = raw28 (source28 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked28 : ∀ i : Fin 52, (fun i => output28 i = raw28 (source28 i)) i :=
  forallFin_of_zero_offset (fun i => output28 i = raw28 (source28 i)) sourceChecked28_0

theorem coverChecked28_0 : ∀ i : Fin 52,
    (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked28 : ∀ i : Fin 52, (fun i => (output28 (cover28 i)).ContainsBox (raw28 i)) i :=
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 6123, atom 2816, type 0, source (27,89).
def leavesData29 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves29 : Fin 7 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 89 leaves29 i
def outputData29 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,22784,22912⟩) (.node (.single ⟨6912,7040,22912,23040⟩) (.single ⟨7040,7104,22784,22848⟩))) (.node (.node (.single ⟨7040,7104,22848,22912⟩) (.single ⟨7104,7168,22784,22848⟩)) (.node (.single ⟨7104,7168,22848,22912⟩) (.single ⟨7040,7168,22912,23040⟩)))) (.node (.node (.single ⟨9728,9856,25600,25728⟩) (.node (.single ⟨9728,9856,25728,25856⟩) (.single ⟨9856,9920,25600,25664⟩))) (.node (.node (.single ⟨9856,9920,25664,25728⟩) (.single ⟨9920,9984,25600,25664⟩)) (.node (.single ⟨9920,9984,25664,25728⟩) (.single ⟨9856,9984,25728,25856⟩))))) (.node (.node (.node (.single ⟨22784,22912,6912,7040⟩) (.node (.single ⟨22784,22848,7040,7104⟩) (.single ⟨22784,22848,7104,7168⟩))) (.node (.node (.single ⟨22848,22912,7040,7104⟩) (.single ⟨22848,22912,7104,7168⟩)) (.node (.single ⟨22912,23040,6912,7040⟩) (.single ⟨22912,23040,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,9728,9856⟩) (.node (.single ⟨25600,25664,9856,9920⟩) (.single ⟨25600,25664,9920,9984⟩))) (.node (.node (.single ⟨25664,25728,9856,9920⟩) (.single ⟨25664,25728,9920,9984⟩)) (.node (.single ⟨25728,25856,9728,9856⟩) (.single ⟨25728,25856,9856,9984⟩))))))
def output29 : Fin 28 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData29 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover29 (i : Fin 28) : Fin 28 := ⟨coverData29.get i % 28, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 28) : Fin 28 := ⟨sourceData29.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 (.cutX 6912 .empty (.cutY 22784 .empty (.cutX 7040 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 7104 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full)))) .empty)) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 (.cutX 9984 (.cutY 25856 (.cutX 9856 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 9920 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 .empty (.cutX 22784 .empty (.cutY 6912 .empty (.cutX 22912 (.cutY 7040 .full (.cutX 22848 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))))) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 .empty (.cutX 25856 (.cutY 9984 (.cutX 25728 (.cutY 9856 .full (.cutX 25664 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata29 : 0<145899414 ∧ 27<128 ∧ 89<128 ∧ 0<4 ∧
    2816/4160=0 ∧ 2816%4160=2816 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 6124, atom 2890, type 0, source (28,90).
def leavesData30 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves30 : Fin 7 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 90 leaves30 i
def outputData30 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,23040,23168⟩) (.node (.single ⟨7168,7296,23168,23296⟩) (.single ⟨7296,7360,23040,23104⟩))) (.node (.node (.single ⟨7296,7360,23104,23168⟩) (.single ⟨7360,7424,23040,23104⟩)) (.node (.single ⟨7360,7424,23104,23168⟩) (.single ⟨7296,7424,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,25344,25472⟩) (.node (.single ⟨9472,9600,25472,25600⟩) (.single ⟨9600,9664,25344,25408⟩))) (.node (.node (.single ⟨9600,9664,25408,25472⟩) (.single ⟨9664,9728,25344,25408⟩)) (.node (.single ⟨9664,9728,25408,25472⟩) (.single ⟨9600,9728,25472,25600⟩))))) (.node (.node (.node (.single ⟨23040,23168,7168,7296⟩) (.node (.single ⟨23040,23104,7296,7360⟩) (.single ⟨23040,23104,7360,7424⟩))) (.node (.node (.single ⟨23104,23168,7296,7360⟩) (.single ⟨23104,23168,7360,7424⟩)) (.node (.single ⟨23168,23296,7168,7296⟩) (.single ⟨23168,23296,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,9472,9600⟩) (.node (.single ⟨25344,25408,9600,9664⟩) (.single ⟨25344,25408,9664,9728⟩))) (.node (.node (.single ⟨25408,25472,9600,9664⟩) (.single ⟨25408,25472,9664,9728⟩)) (.node (.single ⟨25472,25600,9472,9600⟩) (.single ⟨25472,25600,9600,9728⟩))))))
def output30 : Fin 28 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover30 (i : Fin 28) : Fin 28 := ⟨coverData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 28) : Fin 28 := ⟨sourceData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 .empty (.cutX 7424 (.cutY 23296 (.cutX 7296 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 7360 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty)) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 .empty (.cutX 9472 .empty (.cutY 25344 .empty (.cutX 9600 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 9664 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))))) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 (.cutX 23296 (.cutY 7424 (.cutX 23168 (.cutY 7296 .full (.cutX 23104 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 (.cutX 25344 .empty (.cutY 9472 .empty (.cutX 25472 (.cutY 9600 .full (.cutX 25408 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata30 : 0<145899414 ∧ 28<128 ∧ 90<128 ∧ 0<4 ∧
    2890/4160=0 ∧ 2890%4160=2890 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 6125, atom 6897, type 1, source (26,85).
def leavesData31 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves31 : Fin 13 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 85 leaves31 i
def outputData31 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,21760,21824⟩) (.node (.single ⟨6656,6720,21824,21888⟩) (.single ⟨6720,6784,21760,21824⟩))) (.node (.single ⟨6720,6784,21824,21888⟩) (.node (.single ⟨6656,6784,21888,22016⟩) (.single ⟨6784,6848,21760,21824⟩)))) (.node (.node (.single ⟨6784,6848,21824,21888⟩) (.node (.single ⟨6848,6880,21760,21792⟩) (.single ⟨6848,6880,21792,21824⟩))) (.node (.node (.single ⟨6880,6912,21760,21792⟩) (.single ⟨6880,6912,21792,21824⟩)) (.node (.single ⟨6848,6912,21824,21888⟩) (.single ⟨6784,6912,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,25856,25984⟩) (.node (.single ⟨10752,10880,25984,26112⟩) (.single ⟨10880,10944,25856,25920⟩))) (.node (.single ⟨10880,10944,25920,25984⟩) (.node (.single ⟨10944,10976,25856,25888⟩) (.single ⟨10944,10976,25888,25920⟩)))) (.node (.node (.single ⟨10976,11008,25856,25888⟩) (.node (.single ⟨10976,11008,25888,25920⟩) (.single ⟨10944,11008,25920,25984⟩))) (.node (.node (.single ⟨10880,10944,25984,26048⟩) (.single ⟨10880,10944,26048,26112⟩)) (.node (.single ⟨10944,11008,25984,26048⟩) (.single ⟨10944,11008,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,6656,6720⟩) (.node (.single ⟨21760,21824,6720,6784⟩) (.single ⟨21824,21888,6656,6720⟩))) (.node (.single ⟨21824,21888,6720,6784⟩) (.node (.single ⟨21760,21824,6784,6848⟩) (.single ⟨21760,21792,6848,6880⟩)))) (.node (.node (.single ⟨21760,21792,6880,6912⟩) (.node (.single ⟨21792,21824,6848,6880⟩) (.single ⟨21792,21824,6880,6912⟩))) (.node (.node (.single ⟨21824,21888,6784,6848⟩) (.single ⟨21824,21888,6848,6912⟩)) (.node (.single ⟨21888,22016,6656,6784⟩) (.single ⟨21888,22016,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,10752,10880⟩) (.node (.single ⟨25856,25920,10880,10944⟩) (.single ⟨25856,25888,10944,10976⟩))) (.node (.single ⟨25856,25888,10976,11008⟩) (.node (.single ⟨25888,25920,10944,10976⟩) (.single ⟨25888,25920,10976,11008⟩)))) (.node (.node (.single ⟨25920,25984,10880,10944⟩) (.node (.single ⟨25920,25984,10944,11008⟩) (.single ⟨25984,26112,10752,10880⟩))) (.node (.node (.single ⟨25984,26048,10880,10944⟩) (.single ⟨25984,26048,10944,11008⟩)) (.node (.single ⟨26048,26112,10880,10944⟩) (.single ⟨26048,26112,10944,11008⟩)))))))
def output31 : Fin 52 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover31 (i : Fin 52) : Fin 52 := ⟨coverData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 52) : Fin 52 := ⟨sourceData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 (.cutX 6912 (.cutY 21760 .empty (.cutX 6784 (.cutY 21888 (.cutX 6720 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6848 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 6880 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full))) .empty) .empty))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 (.cutX 11008 (.cutY 25856 .empty (.cutX 10880 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10944 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 10976 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 10944 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 .empty (.cutX 21760 .empty (.cutY 6912 (.cutX 21888 (.cutY 6784 (.cutX 21824 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 21824 (.cutY 6848 .full (.cutX 21792 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 .empty (.cutX 25856 .empty (.cutY 11008 (.cutX 25984 (.cutY 10880 .full (.cutX 25920 (.cutY 10944 .full (.cutX 25888 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26048 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty))) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata31 : 0<144359671 ∧ 26<128 ∧ 85<128 ∧ 1<4 ∧
    6897/4160=1 ∧ 6897%4160=2737 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 6126, atom 7188, type 1, source (30,88).
def leavesData32 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves32 : Fin 13 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 30 88 leaves32 i
def outputData32 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,22528,22592⟩) (.node (.single ⟨7680,7744,22592,22656⟩) (.single ⟨7744,7808,22528,22592⟩))) (.node (.single ⟨7744,7808,22592,22656⟩) (.node (.single ⟨7680,7808,22656,22784⟩) (.single ⟨7808,7872,22528,22592⟩)))) (.node (.node (.single ⟨7808,7872,22592,22656⟩) (.node (.single ⟨7872,7904,22528,22560⟩) (.single ⟨7872,7904,22560,22592⟩))) (.node (.node (.single ⟨7904,7936,22528,22560⟩) (.single ⟨7904,7936,22560,22592⟩)) (.node (.single ⟨7872,7936,22592,22656⟩) (.single ⟨7808,7936,22656,22784⟩))))) (.node (.node (.node (.single ⟨9984,10112,24832,24960⟩) (.node (.single ⟨9984,10112,24960,25088⟩) (.single ⟨10112,10176,24832,24896⟩))) (.node (.single ⟨10112,10176,24896,24960⟩) (.node (.single ⟨10176,10208,24832,24864⟩) (.single ⟨10176,10208,24864,24896⟩)))) (.node (.node (.single ⟨10208,10240,24832,24864⟩) (.node (.single ⟨10208,10240,24864,24896⟩) (.single ⟨10176,10240,24896,24960⟩))) (.node (.node (.single ⟨10112,10176,24960,25024⟩) (.single ⟨10112,10176,25024,25088⟩)) (.node (.single ⟨10176,10240,24960,25024⟩) (.single ⟨10176,10240,25024,25088⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22592,7680,7744⟩) (.node (.single ⟨22528,22592,7744,7808⟩) (.single ⟨22592,22656,7680,7744⟩))) (.node (.single ⟨22592,22656,7744,7808⟩) (.node (.single ⟨22528,22592,7808,7872⟩) (.single ⟨22528,22560,7872,7904⟩)))) (.node (.node (.single ⟨22528,22560,7904,7936⟩) (.node (.single ⟨22560,22592,7872,7904⟩) (.single ⟨22560,22592,7904,7936⟩))) (.node (.node (.single ⟨22592,22656,7808,7872⟩) (.single ⟨22592,22656,7872,7936⟩)) (.node (.single ⟨22656,22784,7680,7808⟩) (.single ⟨22656,22784,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,9984,10112⟩) (.node (.single ⟨24832,24896,10112,10176⟩) (.single ⟨24832,24864,10176,10208⟩))) (.node (.single ⟨24832,24864,10208,10240⟩) (.node (.single ⟨24864,24896,10176,10208⟩) (.single ⟨24864,24896,10208,10240⟩)))) (.node (.node (.single ⟨24896,24960,10112,10176⟩) (.node (.single ⟨24896,24960,10176,10240⟩) (.single ⟨24960,25088,9984,10112⟩))) (.node (.node (.single ⟨24960,25024,10112,10176⟩) (.single ⟨24960,25024,10176,10240⟩)) (.node (.single ⟨25024,25088,10112,10176⟩) (.single ⟨25024,25088,10176,10240⟩)))))))
def output32 : Fin 52 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover32 (i : Fin 52) : Fin 52 := ⟨coverData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 52) : Fin 52 := ⟨sourceData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 (.cutY 22784 (.cutX 7808 (.cutY 22656 (.cutX 7744 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 7872 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 7904 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 .empty (.cutY 24832 .empty (.cutX 10112 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 10176 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 10208 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 10176 (.cutY 25024 .full .full) (.cutY 25024 .full .full)))))) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 (.cutY 7936 (.cutX 22656 (.cutY 7808 (.cutX 22592 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 22592 (.cutY 7872 .full (.cutX 22560 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 .empty (.cutY 9984 .empty (.cutX 24960 (.cutY 10112 .full (.cutX 24896 (.cutY 10176 .full (.cutX 24864 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 25024 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))))) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata32 : 0<149239428 ∧ 30<128 ∧ 88<128 ∧ 1<4 ∧
    7188/4160=1 ∧ 7188%4160=3028 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 6127, atom 7321, type 1, source (32,89).
def leavesData33 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves33 : Fin 13 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 32 89 leaves33 i
def outputData33 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8192,8256,22784,22848⟩) (.node (.single ⟨8192,8256,22848,22912⟩) (.single ⟨8256,8320,22784,22848⟩))) (.node (.single ⟨8256,8320,22848,22912⟩) (.node (.single ⟨8192,8320,22912,23040⟩) (.single ⟨8320,8384,22784,22848⟩)))) (.node (.node (.single ⟨8320,8384,22848,22912⟩) (.node (.single ⟨8384,8416,22784,22816⟩) (.single ⟨8384,8416,22816,22848⟩))) (.node (.node (.single ⟨8416,8448,22784,22816⟩) (.single ⟨8416,8448,22816,22848⟩)) (.node (.single ⟨8384,8448,22848,22912⟩) (.single ⟨8320,8448,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,24320,24448⟩) (.node (.single ⟨9728,9856,24448,24576⟩) (.single ⟨9856,9920,24320,24384⟩))) (.node (.single ⟨9856,9920,24384,24448⟩) (.node (.single ⟨9920,9952,24320,24352⟩) (.single ⟨9920,9952,24352,24384⟩)))) (.node (.node (.single ⟨9952,9984,24320,24352⟩) (.node (.single ⟨9952,9984,24352,24384⟩) (.single ⟨9920,9984,24384,24448⟩))) (.node (.node (.single ⟨9856,9920,24448,24512⟩) (.single ⟨9856,9920,24512,24576⟩)) (.node (.single ⟨9920,9984,24448,24512⟩) (.single ⟨9920,9984,24512,24576⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,8192,8256⟩) (.node (.single ⟨22784,22848,8256,8320⟩) (.single ⟨22848,22912,8192,8256⟩))) (.node (.single ⟨22848,22912,8256,8320⟩) (.node (.single ⟨22784,22848,8320,8384⟩) (.single ⟨22784,22816,8384,8416⟩)))) (.node (.node (.single ⟨22784,22816,8416,8448⟩) (.node (.single ⟨22816,22848,8384,8416⟩) (.single ⟨22816,22848,8416,8448⟩))) (.node (.node (.single ⟨22848,22912,8320,8384⟩) (.single ⟨22848,22912,8384,8448⟩)) (.node (.single ⟨22912,23040,8192,8320⟩) (.single ⟨22912,23040,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,9728,9856⟩) (.node (.single ⟨24320,24384,9856,9920⟩) (.single ⟨24320,24352,9920,9952⟩))) (.node (.single ⟨24320,24352,9952,9984⟩) (.node (.single ⟨24352,24384,9920,9952⟩) (.single ⟨24352,24384,9952,9984⟩)))) (.node (.node (.single ⟨24384,24448,9856,9920⟩) (.node (.single ⟨24384,24448,9920,9984⟩) (.single ⟨24448,24576,9728,9856⟩))) (.node (.node (.single ⟨24448,24512,9856,9920⟩) (.single ⟨24448,24512,9920,9984⟩)) (.node (.single ⟨24512,24576,9856,9920⟩) (.single ⟨24512,24576,9920,9984⟩)))))))
def output33 : Fin 52 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData33 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover33 (i : Fin 52) : Fin 52 := ⟨coverData33.get i % 52, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 52) : Fin 52 := ⟨sourceData33.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 (.cutX 8448 (.cutY 22784 .empty (.cutX 8320 (.cutY 22912 (.cutX 8256 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 8384 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 8416 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 .empty (.cutX 9984 (.cutY 24320 .empty (.cutX 9856 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 9920 (.cutY 24384 .full .full) (.cutY 24384 (.cutX 9952 (.cutY 24352 .full .full) (.cutY 24352 .full .full)) .full)) (.cutX 9920 (.cutY 24512 .full .full) (.cutY 24512 .full .full))))) .empty)))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 (.cutX 22784 .empty (.cutY 8448 (.cutX 22912 (.cutY 8320 (.cutX 22848 (.cutY 8256 .full .full) (.cutY 8256 .full .full)) (.cutX 22848 (.cutY 8384 .full (.cutX 22816 (.cutY 8416 .full .full) (.cutY 8416 .full .full))) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 .empty (.cutX 24320 .empty (.cutY 9984 (.cutX 24448 (.cutY 9856 .full (.cutX 24384 (.cutY 9920 .full (.cutX 24352 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 24512 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty)))))) .empty)) .empty))) .empty) .empty))

theorem metadata33 : 0<67962893 ∧ 32<128 ∧ 89<128 ∧ 1<4 ∧
    7321/4160=1 ∧ 7321%4160=3161 ∧ ∀ i, (leaves33 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData33).mp
    (by decide +kernel)

theorem sourceChecked33_0 : ∀ i : Fin 52,
    (fun i => output33 i = raw33 (source33 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked33 : ∀ i : Fin 52, (fun i => output33 i = raw33 (source33 i)) i :=
  forallFin_of_zero_offset (fun i => output33 i = raw33 (source33 i)) sourceChecked33_0

theorem coverChecked33_0 : ∀ i : Fin 52,
    (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked33 : ∀ i : Fin 52, (fun i => (output33 (cover33 i)).ContainsBox (raw33 i)) i :=
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 6128, atom 2063, type 0, source (18,83).
def leavesData34 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves34 : Fin 10 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 83 leaves34 i
def outputData34 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,21248,21312⟩) (.single ⟨4608,4672,21312,21376⟩)) (.node (.single ⟨4672,4736,21248,21312⟩) (.node (.single ⟨4672,4736,21312,21376⟩) (.single ⟨4608,4736,21376,21504⟩)))) (.node (.node (.single ⟨4736,4800,21248,21312⟩) (.single ⟨4736,4800,21312,21376⟩)) (.node (.single ⟨4800,4864,21248,21312⟩) (.node (.single ⟨4800,4864,21312,21376⟩) (.single ⟨4736,4864,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,27904,28032⟩) (.single ⟨11264,11392,28032,28160⟩)) (.node (.single ⟨11392,11456,27904,27968⟩) (.node (.single ⟨11392,11456,27968,28032⟩) (.single ⟨11456,11520,27904,27968⟩)))) (.node (.node (.single ⟨11456,11520,27968,28032⟩) (.single ⟨11392,11456,28032,28096⟩)) (.node (.single ⟨11392,11456,28096,28160⟩) (.node (.single ⟨11456,11520,28032,28096⟩) (.single ⟨11456,11520,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,4608,4672⟩) (.single ⟨21248,21312,4672,4736⟩)) (.node (.single ⟨21312,21376,4608,4672⟩) (.node (.single ⟨21312,21376,4672,4736⟩) (.single ⟨21248,21312,4736,4800⟩)))) (.node (.node (.single ⟨21248,21312,4800,4864⟩) (.single ⟨21312,21376,4736,4800⟩)) (.node (.single ⟨21312,21376,4800,4864⟩) (.node (.single ⟨21376,21504,4608,4736⟩) (.single ⟨21376,21504,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,11264,11392⟩) (.single ⟨27904,27968,11392,11456⟩)) (.node (.single ⟨27904,27968,11456,11520⟩) (.node (.single ⟨27968,28032,11392,11456⟩) (.single ⟨27968,28032,11456,11520⟩)))) (.node (.node (.single ⟨28032,28160,11264,11392⟩) (.single ⟨28032,28096,11392,11456⟩)) (.node (.single ⟨28032,28096,11456,11520⟩) (.node (.single ⟨28096,28160,11392,11456⟩) (.single ⟨28096,28160,11456,11520⟩)))))))
def output34 : Fin 40 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover34 (i : Fin 40) : Fin 40 := ⟨coverData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 40) : Fin 40 := ⟨sourceData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 .empty (.cutX 4864 (.cutY 21248 .empty (.cutX 4736 (.cutY 21376 (.cutX 4672 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 4800 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 (.cutX 11520 (.cutY 27904 .empty (.cutX 11392 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 11456 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) (.cutX 11456 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 .empty (.cutX 21248 .empty (.cutY 4864 (.cutX 21376 (.cutY 4736 (.cutX 21312 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 21312 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 (.cutX 27904 .empty (.cutY 11520 (.cutX 28032 (.cutY 11392 .full (.cutX 27968 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 28096 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty) .empty))))) .empty) .empty))) .empty))

theorem metadata34 : 0<152546139 ∧ 18<128 ∧ 83<128 ∧ 0<4 ∧
    2063/4160=0 ∧ 2063%4160=2063 ∧ ∀ i, (leaves34 i).Valid 8 := by
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 6129, atom 2155, type 0, source (19,84).
def leavesData35 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves35 : Fin 10 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 84 leaves35 i
def outputData35 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,21504,21568⟩) (.single ⟨4864,4928,21568,21632⟩)) (.node (.single ⟨4928,4992,21504,21568⟩) (.node (.single ⟨4928,4992,21568,21632⟩) (.single ⟨4864,4992,21632,21760⟩)))) (.node (.node (.single ⟨4992,5056,21504,21568⟩) (.single ⟨4992,5056,21568,21632⟩)) (.node (.single ⟨5056,5120,21504,21568⟩) (.node (.single ⟨5056,5120,21568,21632⟩) (.single ⟨4992,5120,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,27648,27776⟩) (.single ⟨11008,11136,27776,27904⟩)) (.node (.single ⟨11136,11200,27648,27712⟩) (.node (.single ⟨11136,11200,27712,27776⟩) (.single ⟨11200,11264,27648,27712⟩)))) (.node (.node (.single ⟨11200,11264,27712,27776⟩) (.single ⟨11136,11200,27776,27840⟩)) (.node (.single ⟨11136,11200,27840,27904⟩) (.node (.single ⟨11200,11264,27776,27840⟩) (.single ⟨11200,11264,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,4864,4928⟩) (.single ⟨21504,21568,4928,4992⟩)) (.node (.single ⟨21568,21632,4864,4928⟩) (.node (.single ⟨21568,21632,4928,4992⟩) (.single ⟨21504,21568,4992,5056⟩)))) (.node (.node (.single ⟨21504,21568,5056,5120⟩) (.single ⟨21568,21632,4992,5056⟩)) (.node (.single ⟨21568,21632,5056,5120⟩) (.node (.single ⟨21632,21760,4864,4992⟩) (.single ⟨21632,21760,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,11008,11136⟩) (.single ⟨27648,27712,11136,11200⟩)) (.node (.single ⟨27648,27712,11200,11264⟩) (.node (.single ⟨27712,27776,11136,11200⟩) (.single ⟨27712,27776,11200,11264⟩)))) (.node (.node (.single ⟨27776,27904,11008,11136⟩) (.single ⟨27776,27840,11136,11200⟩)) (.node (.single ⟨27776,27840,11200,11264⟩) (.node (.single ⟨27840,27904,11136,11200⟩) (.single ⟨27840,27904,11200,11264⟩)))))))
def output35 : Fin 40 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData35 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover35 (i : Fin 40) : Fin 40 := ⟨coverData35.get i % 40, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 40) : Fin 40 := ⟨sourceData35.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 .empty (.cutY 22016 (.cutX 4864 .empty (.cutY 21760 (.cutX 4992 (.cutY 21632 (.cutX 4928 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 5056 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty)) .empty))) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 (.cutX 11008 .empty (.cutY 27904 (.cutX 11136 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 11200 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 11200 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 .empty (.cutX 21760 (.cutY 4864 .empty (.cutX 21632 (.cutY 4992 (.cutX 21568 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 21568 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 (.cutY 10752 .empty (.cutX 27904 (.cutY 11008 .empty (.cutX 27776 (.cutY 11136 .full (.cutX 27712 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 27840 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty)) .empty) .empty)))) .empty) .empty))) .empty))

theorem metadata35 : 0<152546139 ∧ 19<128 ∧ 84<128 ∧ 0<4 ∧
    2155/4160=0 ∧ 2155%4160=2155 ∧ ∀ i, (leaves35 i).Valid 8 := by
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 6130, atom 1363, type 0, source (11,76).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 76 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,19456,19584⟩) (.single ⟨2816,2944,19584,19712⟩)) (.node (.single ⟨2944,3072,19456,19584⟩) (.single ⟨2944,3072,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,29696,29824⟩) (.single ⟨13056,13184,29824,29952⟩)) (.node (.single ⟨13184,13312,29696,29824⟩) (.single ⟨13184,13312,29824,29952⟩)))) (.node (.node (.node (.single ⟨19456,19584,2816,2944⟩) (.single ⟨19456,19584,2944,3072⟩)) (.node (.single ⟨19584,19712,2816,2944⟩) (.single ⟨19584,19712,2944,3072⟩))) (.node (.node (.single ⟨29696,29824,13056,13184⟩) (.single ⟨29696,29824,13184,13312⟩)) (.node (.single ⟨29824,29952,13056,13184⟩) (.single ⟨29824,29952,13184,13312⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 .empty (.cutY 19968 (.cutX 2816 .empty (.cutY 19712 (.cutX 2944 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty))) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 .empty (.cutY 30208 (.cutX 13056 .empty (.cutY 29952 (.cutX 13184 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty))) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 (.cutY 2560 .empty (.cutX 19712 (.cutY 2816 .empty (.cutX 19584 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 (.cutY 12800 .empty (.cutX 29952 (.cutY 13056 .empty (.cutX 29824 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty)) .empty) .empty)) .empty) .empty))))) .empty))

theorem metadata36 : 0<48363413 ∧ 11<128 ∧ 76<128 ∧ 0<4 ∧
    1363/4160=0 ∧ 1363%4160=1363 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 6131, atom 3099, type 0, source (31,92).
def leavesData37 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves37 : Fin 10 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 31 92 leaves37 i
def outputData37 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7936,8000,23552,23616⟩) (.single ⟨7936,8000,23616,23680⟩)) (.node (.single ⟨8000,8064,23552,23616⟩) (.node (.single ⟨8000,8064,23616,23680⟩) (.single ⟨7936,8064,23680,23808⟩)))) (.node (.node (.single ⟨8064,8128,23552,23616⟩) (.single ⟨8064,8128,23616,23680⟩)) (.node (.single ⟨8128,8192,23552,23616⟩) (.node (.single ⟨8128,8192,23616,23680⟩) (.single ⟨8064,8192,23680,23808⟩))))) (.node (.node (.node (.single ⟨8960,9088,24576,24704⟩) (.single ⟨8960,9088,24704,24832⟩)) (.node (.single ⟨9088,9152,24576,24640⟩) (.node (.single ⟨9088,9152,24640,24704⟩) (.single ⟨9152,9216,24576,24640⟩)))) (.node (.node (.single ⟨9152,9216,24640,24704⟩) (.single ⟨9088,9152,24704,24768⟩)) (.node (.single ⟨9088,9152,24768,24832⟩) (.node (.single ⟨9152,9216,24704,24768⟩) (.single ⟨9152,9216,24768,24832⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,7936,8000⟩) (.single ⟨23552,23616,8000,8064⟩)) (.node (.single ⟨23616,23680,7936,8000⟩) (.node (.single ⟨23616,23680,8000,8064⟩) (.single ⟨23552,23616,8064,8128⟩)))) (.node (.node (.single ⟨23552,23616,8128,8192⟩) (.single ⟨23616,23680,8064,8128⟩)) (.node (.single ⟨23616,23680,8128,8192⟩) (.node (.single ⟨23680,23808,7936,8064⟩) (.single ⟨23680,23808,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,8960,9088⟩) (.single ⟨24576,24640,9088,9152⟩)) (.node (.single ⟨24576,24640,9152,9216⟩) (.node (.single ⟨24640,24704,9088,9152⟩) (.single ⟨24640,24704,9152,9216⟩)))) (.node (.node (.single ⟨24704,24832,8960,9088⟩) (.single ⟨24704,24768,9088,9152⟩)) (.node (.single ⟨24704,24768,9152,9216⟩) (.node (.single ⟨24768,24832,9088,9152⟩) (.single ⟨24768,24832,9152,9216⟩)))))))
def output37 : Fin 40 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData37 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover37 (i : Fin 40) : Fin 40 := ⟨coverData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 40) : Fin 40 := ⟨sourceData37.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 .empty (.cutX 7680 .empty (.cutY 24064 (.cutX 7936 .empty (.cutY 23808 (.cutX 8064 (.cutY 23680 (.cutX 8000 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 8128 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty)))))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 (.cutX 8704 .empty (.cutY 25088 (.cutX 8960 .empty (.cutY 24832 (.cutX 9088 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 9152 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) (.cutX 9152 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 .empty (.cutX 24064 (.cutY 7680 .empty (.cutX 23808 (.cutY 7936 .empty (.cutX 23680 (.cutY 8064 (.cutX 23616 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 23616 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)) .empty))))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 (.cutX 25088 (.cutY 8704 .empty (.cutX 24832 (.cutY 8960 .empty (.cutX 24704 (.cutY 9088 .full (.cutX 24640 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 24768 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata37 : 0<145899414 ∧ 31<128 ∧ 92<128 ∧ 0<4 ∧
    3099/4160=0 ∧ 3099%4160=3099 ∧ ∀ i, (leaves37 i).Valid 8 := by
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 6132, atom 1775, type 0, source (15,80).
def leavesData38 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves38 : Fin 7 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 80 leaves38 i
def outputData38 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,20480,20608⟩) (.node (.single ⟨3840,3968,20608,20736⟩) (.single ⟨3968,4032,20480,20544⟩))) (.node (.node (.single ⟨3968,4032,20544,20608⟩) (.single ⟨4032,4096,20480,20544⟩)) (.node (.single ⟨4032,4096,20544,20608⟩) (.single ⟨3968,4096,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,28672,28800⟩) (.node (.single ⟨12032,12160,28800,28928⟩) (.single ⟨12160,12224,28672,28736⟩))) (.node (.node (.single ⟨12160,12224,28736,28800⟩) (.single ⟨12224,12288,28672,28736⟩)) (.node (.single ⟨12224,12288,28736,28800⟩) (.single ⟨12160,12288,28800,28928⟩))))) (.node (.node (.node (.single ⟨20480,20608,3840,3968⟩) (.node (.single ⟨20480,20544,3968,4032⟩) (.single ⟨20480,20544,4032,4096⟩))) (.node (.node (.single ⟨20544,20608,3968,4032⟩) (.single ⟨20544,20608,4032,4096⟩)) (.node (.single ⟨20608,20736,3840,3968⟩) (.single ⟨20608,20736,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,12032,12160⟩) (.node (.single ⟨28672,28736,12160,12224⟩) (.single ⟨28672,28736,12224,12288⟩))) (.node (.node (.single ⟨28736,28800,12160,12224⟩) (.single ⟨28736,28800,12224,12288⟩)) (.node (.single ⟨28800,28928,12032,12160⟩) (.single ⟨28800,28928,12160,12288⟩))))))
def output38 : Fin 28 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover38 (i : Fin 28) : Fin 28 := ⟨coverData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 28) : Fin 28 := ⟨sourceData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 (.cutX 3840 .empty (.cutY 20736 (.cutX 3968 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 4032 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 .empty (.cutY 29184 (.cutX 12032 .empty (.cutY 28928 (.cutX 12160 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 12224 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty)) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 (.cutY 3584 .empty (.cutX 20736 (.cutY 3840 .empty (.cutX 20608 (.cutY 3968 .full (.cutX 20544 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 .empty (.cutX 28928 (.cutY 12032 .empty (.cutX 28800 (.cutY 12160 .full (.cutX 28736 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata38 : 0<72090291 ∧ 15<128 ∧ 80<128 ∧ 0<4 ∧
    1775/4160=0 ∧ 1775%4160=1775 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 6133, atom 447, type 0, source (3,72).
def leavesData39 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves39 : Fin 7 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 72 leaves39 i
def outputData39 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,18432,18560⟩) (.node (.single ⟨768,896,18560,18688⟩) (.single ⟨896,960,18432,18496⟩))) (.node (.node (.single ⟨896,960,18496,18560⟩) (.single ⟨960,1024,18432,18496⟩)) (.node (.single ⟨960,1024,18496,18560⟩) (.single ⟨896,1024,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,31744,31872⟩) (.node (.single ⟨14080,14208,31872,32000⟩) (.single ⟨14208,14272,31744,31808⟩))) (.node (.node (.single ⟨14208,14272,31808,31872⟩) (.single ⟨14272,14336,31744,31808⟩)) (.node (.single ⟨14272,14336,31808,31872⟩) (.single ⟨14208,14336,31872,32000⟩))))) (.node (.node (.node (.single ⟨18432,18560,768,896⟩) (.node (.single ⟨18432,18496,896,960⟩) (.single ⟨18432,18496,960,1024⟩))) (.node (.node (.single ⟨18496,18560,896,960⟩) (.single ⟨18496,18560,960,1024⟩)) (.node (.single ⟨18560,18688,768,896⟩) (.single ⟨18560,18688,896,1024⟩)))) (.node (.node (.single ⟨31744,31872,14080,14208⟩) (.node (.single ⟨31744,31808,14208,14272⟩) (.single ⟨31744,31808,14272,14336⟩))) (.node (.node (.single ⟨31808,31872,14208,14272⟩) (.single ⟨31808,31872,14272,14336⟩)) (.node (.single ⟨31872,32000,14080,14208⟩) (.single ⟨31872,32000,14208,14336⟩))))))
def output39 : Fin 28 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData39 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover39 (i : Fin 28) : Fin 28 := ⟨coverData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 28) : Fin 28 := ⟨sourceData39.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 (.cutX 768 .empty (.cutY 18688 (.cutX 896 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 960 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 .empty (.cutY 32256 (.cutX 14080 .empty (.cutY 32000 (.cutX 14208 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 14272 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty)) .empty))))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 (.cutY 512 .empty (.cutX 18688 (.cutY 768 .empty (.cutX 18560 (.cutY 896 .full (.cutX 18496 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 .empty (.cutX 32000 (.cutY 14080 .empty (.cutX 31872 (.cutY 14208 .full (.cutX 31808 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty))) .empty)))))) .empty))

theorem metadata39 : 0<34183877 ∧ 3<128 ∧ 72<128 ∧ 0<4 ∧
    447/4160=0 ∧ 447%4160=447 ∧ ∀ i, (leaves39 i).Valid 8 := by
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 6134, atom 1675, type 0, source (14,79).
def leavesData40 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves40 : Fin 4 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 79 leaves40 i
def outputData40 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,20224,20352⟩) (.single ⟨3584,3712,20352,20480⟩)) (.node (.single ⟨3712,3840,20224,20352⟩) (.single ⟨3712,3840,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,28928,29056⟩) (.single ⟨12288,12416,29056,29184⟩)) (.node (.single ⟨12416,12544,28928,29056⟩) (.single ⟨12416,12544,29056,29184⟩)))) (.node (.node (.node (.single ⟨20224,20352,3584,3712⟩) (.single ⟨20224,20352,3712,3840⟩)) (.node (.single ⟨20352,20480,3584,3712⟩) (.single ⟨20352,20480,3712,3840⟩))) (.node (.node (.single ⟨28928,29056,12288,12416⟩) (.single ⟨28928,29056,12416,12544⟩)) (.node (.single ⟨29056,29184,12288,12416⟩) (.single ⟨29056,29184,12416,12544⟩)))))
def output40 : Fin 16 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover40 (i : Fin 16) : Fin 16 := ⟨coverData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 16) : Fin 16 := ⟨sourceData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 .empty (.cutX 3840 (.cutY 20224 .empty (.cutX 3712 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty))))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 (.cutX 12544 (.cutY 28928 .empty (.cutX 12416 (.cutY 29056 .full .full) (.cutY 29056 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 .empty (.cutX 20224 .empty (.cutY 3840 (.cutX 20352 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty)))))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 (.cutX 28928 .empty (.cutY 12544 (.cutX 29056 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata40 : 0<48363413 ∧ 14<128 ∧ 79<128 ∧ 0<4 ∧
    1675/4160=0 ∧ 1675%4160=1675 ∧ ∀ i, (leaves40 i).Valid 8 := by
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 6135, atom 6658, type 1, source (23,83).
def leavesData41 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves41 : Fin 13 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 83 leaves41 i
def outputData41 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,21248,21312⟩) (.node (.single ⟨5888,5952,21312,21376⟩) (.single ⟨5952,6016,21248,21312⟩))) (.node (.single ⟨5952,6016,21312,21376⟩) (.node (.single ⟨5888,6016,21376,21504⟩) (.single ⟨6016,6080,21248,21312⟩)))) (.node (.node (.single ⟨6016,6080,21312,21376⟩) (.node (.single ⟨6080,6112,21248,21280⟩) (.single ⟨6080,6112,21280,21312⟩))) (.node (.node (.single ⟨6112,6144,21248,21280⟩) (.single ⟨6112,6144,21280,21312⟩)) (.node (.single ⟨6080,6144,21312,21376⟩) (.single ⟨6016,6144,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26624,26752⟩) (.node (.single ⟨11264,11392,26752,26880⟩) (.single ⟨11392,11456,26624,26688⟩))) (.node (.single ⟨11392,11456,26688,26752⟩) (.node (.single ⟨11456,11488,26624,26656⟩) (.single ⟨11456,11488,26656,26688⟩)))) (.node (.node (.single ⟨11488,11520,26624,26656⟩) (.node (.single ⟨11488,11520,26656,26688⟩) (.single ⟨11456,11520,26688,26752⟩))) (.node (.node (.single ⟨11392,11456,26752,26816⟩) (.single ⟨11392,11456,26816,26880⟩)) (.node (.single ⟨11456,11520,26752,26816⟩) (.single ⟨11456,11520,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5888,5952⟩) (.node (.single ⟨21248,21312,5952,6016⟩) (.single ⟨21312,21376,5888,5952⟩))) (.node (.single ⟨21312,21376,5952,6016⟩) (.node (.single ⟨21248,21312,6016,6080⟩) (.single ⟨21248,21280,6080,6112⟩)))) (.node (.node (.single ⟨21248,21280,6112,6144⟩) (.node (.single ⟨21280,21312,6080,6112⟩) (.single ⟨21280,21312,6112,6144⟩))) (.node (.node (.single ⟨21312,21376,6016,6080⟩) (.single ⟨21312,21376,6080,6144⟩)) (.node (.single ⟨21376,21504,5888,6016⟩) (.single ⟨21376,21504,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,11264,11392⟩) (.node (.single ⟨26624,26688,11392,11456⟩) (.single ⟨26624,26656,11456,11488⟩))) (.node (.single ⟨26624,26656,11488,11520⟩) (.node (.single ⟨26656,26688,11456,11488⟩) (.single ⟨26656,26688,11488,11520⟩)))) (.node (.node (.single ⟨26688,26752,11392,11456⟩) (.node (.single ⟨26688,26752,11456,11520⟩) (.single ⟨26752,26880,11264,11392⟩))) (.node (.node (.single ⟨26752,26816,11392,11456⟩) (.single ⟨26752,26816,11456,11520⟩)) (.node (.single ⟨26816,26880,11392,11456⟩) (.single ⟨26816,26880,11456,11520⟩)))))))
def output41 : Fin 52 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData41 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover41 (i : Fin 52) : Fin 52 := ⟨coverData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 52) : Fin 52 := ⟨sourceData41.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 .empty (.cutY 21248 .empty (.cutX 6016 (.cutY 21376 (.cutX 5952 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 6080 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 6112 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full)))))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 (.cutY 26880 (.cutX 11392 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 11456 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 11488 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 11456 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 .empty (.cutY 5888 .empty (.cutX 21376 (.cutY 6016 (.cutX 21312 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 21312 (.cutY 6080 .full (.cutX 21280 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 (.cutY 11520 (.cutX 26752 (.cutY 11392 .full (.cutX 26688 (.cutY 11456 .full (.cutX 26656 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 26816 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata41 : 0<125829407 ∧ 23<128 ∧ 83<128 ∧ 1<4 ∧
    6658/4160=1 ∧ 6658%4160=2498 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 6136, atom 5730, type 1, source (13,75).
def leavesData42 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves42 : Fin 4 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 75 leaves42 i
def outputData42 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,19200,19328⟩) (.single ⟨3328,3456,19328,19456⟩)) (.node (.single ⟨3456,3584,19200,19328⟩) (.single ⟨3456,3584,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,29184,29312⟩) (.single ⟨13312,13440,29312,29440⟩)) (.node (.single ⟨13440,13568,29184,29312⟩) (.single ⟨13440,13568,29312,29440⟩)))) (.node (.node (.node (.single ⟨19200,19328,3328,3456⟩) (.single ⟨19200,19328,3456,3584⟩)) (.node (.single ⟨19328,19456,3328,3456⟩) (.single ⟨19328,19456,3456,3584⟩))) (.node (.node (.single ⟨29184,29312,13312,13440⟩) (.single ⟨29184,29312,13440,13568⟩)) (.node (.single ⟨29312,29440,13312,13440⟩) (.single ⟨29312,29440,13440,13568⟩)))))
def output42 : Fin 16 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData42 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover42 (i : Fin 16) : Fin 16 := ⟨coverData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 16) : Fin 16 := ⟨sourceData42.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 .empty (.cutY 19200 .empty (.cutX 3456 (.cutY 19328 .full .full) (.cutY 19328 .full .full))))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 (.cutY 29440 (.cutX 13440 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 .empty (.cutY 3328 .empty (.cutX 19328 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 (.cutY 13568 (.cutX 29312 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata42 : 0<94387549 ∧ 13<128 ∧ 75<128 ∧ 1<4 ∧
    5730/4160=1 ∧ 5730%4160=1570 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 6137, atom 805, type 0, source (6,73).
def leavesData43 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves43 : Fin 7 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 73 leaves43 i
def outputData43 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,18688,18816⟩) (.node (.single ⟨1536,1664,18816,18944⟩) (.single ⟨1664,1728,18688,18752⟩))) (.node (.node (.single ⟨1664,1728,18752,18816⟩) (.single ⟨1728,1792,18688,18752⟩)) (.node (.single ⟨1728,1792,18752,18816⟩) (.single ⟨1664,1792,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,30976,31104⟩) (.node (.single ⟨13824,13952,31104,31232⟩) (.single ⟨13952,14016,30976,31040⟩))) (.node (.node (.single ⟨13952,14016,31040,31104⟩) (.single ⟨14016,14080,30976,31040⟩)) (.node (.single ⟨14016,14080,31040,31104⟩) (.single ⟨13952,14080,31104,31232⟩))))) (.node (.node (.node (.single ⟨18688,18816,1536,1664⟩) (.node (.single ⟨18688,18752,1664,1728⟩) (.single ⟨18688,18752,1728,1792⟩))) (.node (.node (.single ⟨18752,18816,1664,1728⟩) (.single ⟨18752,18816,1728,1792⟩)) (.node (.single ⟨18816,18944,1536,1664⟩) (.single ⟨18816,18944,1664,1792⟩)))) (.node (.node (.single ⟨30976,31104,13824,13952⟩) (.node (.single ⟨30976,31040,13952,14016⟩) (.single ⟨30976,31040,14016,14080⟩))) (.node (.node (.single ⟨31040,31104,13952,14016⟩) (.single ⟨31040,31104,14016,14080⟩)) (.node (.single ⟨31104,31232,13824,13952⟩) (.single ⟨31104,31232,13952,14080⟩))))))
def output43 : Fin 28 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover43 (i : Fin 28) : Fin 28 := ⟨coverData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 28) : Fin 28 := ⟨sourceData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 (.cutY 18688 .empty (.cutX 1664 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 1728 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 (.cutY 30976 .empty (.cutX 13952 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 14016 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full))) .empty) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 .empty (.cutY 1792 (.cutX 18816 (.cutY 1664 .full (.cutX 18752 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 .empty (.cutY 14080 (.cutX 31104 (.cutY 13952 .full (.cutX 31040 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty)) .empty) .empty)))))) .empty))

theorem metadata43 : 0<34183877 ∧ 6<128 ∧ 73<128 ∧ 0<4 ∧
    805/4160=0 ∧ 805%4160=805 ∧ ∀ i, (leaves43 i).Valid 8 := by
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 6138, atom 5413, type 1, source (10,73).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 73 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,18688,18816⟩) (.node (.single ⟨2560,2688,18816,18944⟩) (.single ⟨2688,2752,18688,18752⟩))) (.node (.node (.single ⟨2688,2752,18752,18816⟩) (.single ⟨2752,2816,18688,18752⟩)) (.node (.single ⟨2752,2816,18752,18816⟩) (.single ⟨2688,2816,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29952,30080⟩) (.node (.single ⟨13824,13952,30080,30208⟩) (.single ⟨13952,14016,29952,30016⟩))) (.node (.node (.single ⟨13952,14016,30016,30080⟩) (.single ⟨14016,14080,29952,30016⟩)) (.node (.single ⟨14016,14080,30016,30080⟩) (.single ⟨13952,14080,30080,30208⟩))))) (.node (.node (.node (.single ⟨18688,18816,2560,2688⟩) (.node (.single ⟨18688,18752,2688,2752⟩) (.single ⟨18688,18752,2752,2816⟩))) (.node (.node (.single ⟨18752,18816,2688,2752⟩) (.single ⟨18752,18816,2752,2816⟩)) (.node (.single ⟨18816,18944,2560,2688⟩) (.single ⟨18816,18944,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,13824,13952⟩) (.node (.single ⟨29952,30016,13952,14016⟩) (.single ⟨29952,30016,14016,14080⟩))) (.node (.node (.single ⟨30016,30080,13952,14016⟩) (.single ⟨30016,30080,14016,14080⟩)) (.node (.single ⟨30080,30208,13824,13952⟩) (.single ⟨30080,30208,13952,14080⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 (.cutY 18688 .empty (.cutX 2688 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 2752 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 (.cutY 29952 .empty (.cutX 13952 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 14016 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 .empty (.cutY 2816 (.cutX 18816 (.cutY 2688 .full (.cutX 18752 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 .empty (.cutY 14080 (.cutX 30080 (.cutY 13952 .full (.cutX 30016 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty))) .empty) .empty))))) .empty))

theorem metadata44 : 0<94387549 ∧ 10<128 ∧ 73<128 ∧ 1<4 ∧
    5413/4160=1 ∧ 5413%4160=1253 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 6139, atom 4606, type 1, source (3,71).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 71 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,18176,18304⟩) (.node (.single ⟨768,896,18304,18432⟩) (.single ⟨896,960,18176,18240⟩))) (.node (.node (.single ⟨896,960,18240,18304⟩) (.single ⟨960,1024,18176,18240⟩)) (.node (.single ⟨960,1024,18240,18304⟩) (.single ⟨896,1024,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,31744,31872⟩) (.node (.single ⟨14336,14464,31872,32000⟩) (.single ⟨14464,14528,31744,31808⟩))) (.node (.node (.single ⟨14464,14528,31808,31872⟩) (.single ⟨14528,14592,31744,31808⟩)) (.node (.single ⟨14528,14592,31808,31872⟩) (.single ⟨14464,14592,31872,32000⟩))))) (.node (.node (.node (.single ⟨18176,18304,768,896⟩) (.node (.single ⟨18176,18240,896,960⟩) (.single ⟨18176,18240,960,1024⟩))) (.node (.node (.single ⟨18240,18304,896,960⟩) (.single ⟨18240,18304,960,1024⟩)) (.node (.single ⟨18304,18432,768,896⟩) (.single ⟨18304,18432,896,1024⟩)))) (.node (.node (.single ⟨31744,31872,14336,14464⟩) (.node (.single ⟨31744,31808,14464,14528⟩) (.single ⟨31744,31808,14528,14592⟩))) (.node (.node (.single ⟨31808,31872,14464,14528⟩) (.single ⟨31808,31872,14528,14592⟩)) (.node (.single ⟨31872,32000,14336,14464⟩) (.single ⟨31872,32000,14464,14592⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 .empty (.cutY 18176 .empty (.cutX 896 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 960 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 (.cutY 32000 (.cutX 14464 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 14528 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 .empty (.cutY 768 .empty (.cutX 18304 (.cutY 896 .full (.cutX 18240 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full)))))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 (.cutY 14592 (.cutX 31872 (.cutY 14464 .full (.cutX 31808 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty)))))))) .empty))

theorem metadata45 : 0<202148459 ∧ 3<128 ∧ 71<128 ∧ 1<4 ∧
    4606/4160=1 ∧ 4606%4160=446 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

-- Frozen phase 6140, atom 5079, type 1, source (7,72).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 7 72 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,18432,18496⟩) (.single ⟨1792,1856,18496,18560⟩)) (.node (.single ⟨1856,1920,18432,18496⟩) (.node (.single ⟨1856,1920,18496,18560⟩) (.single ⟨1792,1920,18560,18688⟩)))) (.node (.node (.single ⟨1920,1984,18432,18496⟩) (.single ⟨1920,1984,18496,18560⟩)) (.node (.single ⟨1984,2048,18432,18496⟩) (.node (.single ⟨1984,2048,18496,18560⟩) (.single ⟨1920,2048,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,30720,30848⟩) (.single ⟨14080,14208,30848,30976⟩)) (.node (.single ⟨14208,14272,30720,30784⟩) (.node (.single ⟨14208,14272,30784,30848⟩) (.single ⟨14272,14336,30720,30784⟩)))) (.node (.node (.single ⟨14272,14336,30784,30848⟩) (.single ⟨14208,14272,30848,30912⟩)) (.node (.single ⟨14208,14272,30912,30976⟩) (.node (.single ⟨14272,14336,30848,30912⟩) (.single ⟨14272,14336,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18496,1792,1856⟩) (.single ⟨18432,18496,1856,1920⟩)) (.node (.single ⟨18496,18560,1792,1856⟩) (.node (.single ⟨18496,18560,1856,1920⟩) (.single ⟨18432,18496,1920,1984⟩)))) (.node (.node (.single ⟨18432,18496,1984,2048⟩) (.single ⟨18496,18560,1920,1984⟩)) (.node (.single ⟨18496,18560,1984,2048⟩) (.node (.single ⟨18560,18688,1792,1920⟩) (.single ⟨18560,18688,1920,2048⟩))))) (.node (.node (.node (.single ⟨30720,30848,14080,14208⟩) (.single ⟨30720,30784,14208,14272⟩)) (.node (.single ⟨30720,30784,14272,14336⟩) (.node (.single ⟨30784,30848,14208,14272⟩) (.single ⟨30784,30848,14272,14336⟩)))) (.node (.node (.single ⟨30848,30976,14080,14208⟩) (.single ⟨30848,30912,14208,14272⟩)) (.node (.single ⟨30848,30912,14272,14336⟩) (.node (.single ⟨30912,30976,14208,14272⟩) (.single ⟨30912,30976,14272,14336⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 .empty (.cutY 18688 (.cutX 1920 (.cutY 18560 (.cutX 1856 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full) (.cutY 18560 (.cutX 1984 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 .empty (.cutY 30976 (.cutX 14208 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14272 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 14272 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 (.cutY 1792 .empty (.cutX 18560 (.cutY 1920 (.cutX 18496 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 18496 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 (.cutY 14080 .empty (.cutX 30848 (.cutY 14208 .full (.cutX 30784 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full (.cutX 30912 (.cutY 14272 .full .full) (.cutY 14272 .full .full))))) .empty)) .empty)) .empty) .empty)))))) .empty))

theorem metadata46 : 0<137362203 ∧ 7<128 ∧ 72<128 ∧ 1<4 ∧
    5079/4160=1 ∧ 5079%4160=919 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 6141, atom 4964, type 1, source (6,72).
def leavesData47 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves47 : Fin 4 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 72 leaves47 i
def outputData47 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,18432,18560⟩) (.single ⟨1536,1664,18560,18688⟩)) (.node (.single ⟨1664,1792,18432,18560⟩) (.single ⟨1664,1792,18560,18688⟩))) (.node (.node (.single ⟨14080,14208,30976,31104⟩) (.single ⟨14080,14208,31104,31232⟩)) (.node (.single ⟨14208,14336,30976,31104⟩) (.single ⟨14208,14336,31104,31232⟩)))) (.node (.node (.node (.single ⟨18432,18560,1536,1664⟩) (.single ⟨18432,18560,1664,1792⟩)) (.node (.single ⟨18560,18688,1536,1664⟩) (.single ⟨18560,18688,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,14080,14208⟩) (.single ⟨30976,31104,14208,14336⟩)) (.node (.single ⟨31104,31232,14080,14208⟩) (.single ⟨31104,31232,14208,14336⟩)))))
def output47 : Fin 16 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover47 (i : Fin 16) : Fin 16 := ⟨coverData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 16) : Fin 16 := ⟨sourceData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 (.cutY 18688 (.cutX 1664 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 .empty (.cutY 30976 .empty (.cutX 14208 (.cutY 31104 .full .full) (.cutY 31104 .full .full)))) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 (.cutY 1792 (.cutX 18560 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 .empty (.cutY 14080 .empty (.cutX 31104 (.cutY 14208 .full .full) (.cutY 14208 .full .full))))) .empty)) .empty) .empty)))))) .empty))

theorem metadata47 : 0<137362203 ∧ 6<128 ∧ 72<128 ∧ 1<4 ∧
    4964/4160=1 ∧ 4964%4160=804 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 6142, atom 6973, type 1, source (27,86).
def leavesData48 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves48 : Fin 7 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 86 leaves48 i
def outputData48 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,22016,22144⟩) (.node (.single ⟨6912,7040,22144,22272⟩) (.single ⟨7040,7104,22016,22080⟩))) (.node (.node (.single ⟨7040,7104,22080,22144⟩) (.single ⟨7104,7168,22016,22080⟩)) (.node (.single ⟨7104,7168,22080,22144⟩) (.single ⟨7040,7168,22144,22272⟩)))) (.node (.node (.single ⟨10496,10624,25600,25728⟩) (.node (.single ⟨10496,10624,25728,25856⟩) (.single ⟨10624,10688,25600,25664⟩))) (.node (.node (.single ⟨10624,10688,25664,25728⟩) (.single ⟨10688,10752,25600,25664⟩)) (.node (.single ⟨10688,10752,25664,25728⟩) (.single ⟨10624,10752,25728,25856⟩))))) (.node (.node (.node (.single ⟨22016,22144,6912,7040⟩) (.node (.single ⟨22016,22080,7040,7104⟩) (.single ⟨22016,22080,7104,7168⟩))) (.node (.node (.single ⟨22080,22144,7040,7104⟩) (.single ⟨22080,22144,7104,7168⟩)) (.node (.single ⟨22144,22272,6912,7040⟩) (.single ⟨22144,22272,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,10496,10624⟩) (.node (.single ⟨25600,25664,10624,10688⟩) (.single ⟨25600,25664,10688,10752⟩))) (.node (.node (.single ⟨25664,25728,10624,10688⟩) (.single ⟨25664,25728,10688,10752⟩)) (.node (.single ⟨25728,25856,10496,10624⟩) (.single ⟨25728,25856,10624,10752⟩))))))
def output48 : Fin 28 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover48 (i : Fin 28) : Fin 28 := ⟨coverData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 28) : Fin 28 := ⟨sourceData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 .empty (.cutY 22272 (.cutX 7040 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 7104 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 .empty (.cutY 25856 (.cutX 10624 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10688 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 (.cutY 6912 .empty (.cutX 22144 (.cutY 7040 .full (.cutX 22080 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 (.cutY 10496 .empty (.cutX 25728 (.cutY 10624 .full (.cutX 25664 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata48 : 0<144359671 ∧ 27<128 ∧ 86<128 ∧ 1<4 ∧
    6973/4160=1 ∧ 6973%4160=2813 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 6143, atom 6126, type 1, source (17,79).
def leavesData49 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves49 : Fin 7 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 79 leaves49 i
def outputData49 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,20224,20352⟩) (.node (.single ⟨4352,4480,20352,20480⟩) (.single ⟨4480,4544,20224,20288⟩))) (.node (.node (.single ⟨4480,4544,20288,20352⟩) (.single ⟨4544,4608,20224,20288⟩)) (.node (.single ⟨4544,4608,20288,20352⟩) (.single ⟨4480,4608,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,28160,28288⟩) (.node (.single ⟨12288,12416,28288,28416⟩) (.single ⟨12416,12480,28160,28224⟩))) (.node (.node (.single ⟨12416,12480,28224,28288⟩) (.single ⟨12480,12544,28160,28224⟩)) (.node (.single ⟨12480,12544,28224,28288⟩) (.single ⟨12416,12544,28288,28416⟩))))) (.node (.node (.node (.single ⟨20224,20352,4352,4480⟩) (.node (.single ⟨20224,20288,4480,4544⟩) (.single ⟨20224,20288,4544,4608⟩))) (.node (.node (.single ⟨20288,20352,4480,4544⟩) (.single ⟨20288,20352,4544,4608⟩)) (.node (.single ⟨20352,20480,4352,4480⟩) (.single ⟨20352,20480,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,12288,12416⟩) (.node (.single ⟨28160,28224,12416,12480⟩) (.single ⟨28160,28224,12480,12544⟩))) (.node (.node (.single ⟨28224,28288,12416,12480⟩) (.single ⟨28224,28288,12480,12544⟩)) (.node (.single ⟨28288,28416,12288,12416⟩) (.single ⟨28288,28416,12416,12544⟩))))))
def output49 : Fin 28 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover49 (i : Fin 28) : Fin 28 := ⟨coverData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 28) : Fin 28 := ⟨sourceData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 .empty (.cutY 20224 .empty (.cutX 4480 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 4544 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 (.cutY 28416 (.cutX 12416 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 12480 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 .empty (.cutY 4352 .empty (.cutX 20352 (.cutY 4480 .full (.cutX 20288 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 (.cutY 12544 (.cutX 28288 (.cutY 12416 .full (.cutX 28224 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata49 : 0<157738472 ∧ 17<128 ∧ 79<128 ∧ 1<4 ∧
    6126/4160=1 ∧ 6126%4160=1966 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 6144, atom 6030, type 1, source (16,78).
def leavesData50 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves50 : Fin 10 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 78 leaves50 i
def outputData50 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,19968,20096⟩) (.single ⟨4096,4224,20096,20224⟩)) (.node (.single ⟨4224,4288,19968,20032⟩) (.node (.single ⟨4224,4288,20032,20096⟩) (.single ⟨4288,4320,19968,20000⟩)))) (.node (.node (.single ⟨4288,4320,20000,20032⟩) (.single ⟨4320,4352,19968,20000⟩)) (.node (.single ⟨4320,4352,20000,20032⟩) (.node (.single ⟨4288,4352,20032,20096⟩) (.single ⟨4224,4352,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,28416,28544⟩) (.single ⟨12544,12672,28544,28672⟩)) (.node (.single ⟨12672,12736,28416,28480⟩) (.node (.single ⟨12672,12736,28480,28544⟩) (.single ⟨12736,12768,28416,28448⟩)))) (.node (.node (.single ⟨12736,12768,28448,28480⟩) (.single ⟨12768,12800,28416,28448⟩)) (.node (.single ⟨12768,12800,28448,28480⟩) (.node (.single ⟨12736,12800,28480,28544⟩) (.single ⟨12672,12800,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,4096,4224⟩) (.single ⟨19968,20032,4224,4288⟩)) (.node (.single ⟨19968,20000,4288,4320⟩) (.node (.single ⟨19968,20000,4320,4352⟩) (.single ⟨20000,20032,4288,4320⟩)))) (.node (.node (.single ⟨20000,20032,4320,4352⟩) (.single ⟨20032,20096,4224,4288⟩)) (.node (.single ⟨20032,20096,4288,4352⟩) (.node (.single ⟨20096,20224,4096,4224⟩) (.single ⟨20096,20224,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,12544,12672⟩) (.single ⟨28416,28480,12672,12736⟩)) (.node (.single ⟨28416,28448,12736,12768⟩) (.node (.single ⟨28416,28448,12768,12800⟩) (.single ⟨28448,28480,12736,12768⟩)))) (.node (.node (.single ⟨28448,28480,12768,12800⟩) (.single ⟨28480,28544,12672,12736⟩)) (.node (.single ⟨28480,28544,12736,12800⟩) (.node (.single ⟨28544,28672,12544,12672⟩) (.single ⟨28544,28672,12672,12800⟩)))))))
def output50 : Fin 40 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover50 (i : Fin 40) : Fin 40 := ⟨coverData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 40) : Fin 40 := ⟨sourceData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 (.cutY 20224 (.cutX 4224 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 4288 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 4320 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 .empty (.cutY 28416 .empty (.cutX 12672 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 12736 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 12768 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))))) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 (.cutY 4352 (.cutX 20096 (.cutY 4224 .full (.cutX 20032 (.cutY 4288 .full (.cutX 20000 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 .empty (.cutY 12544 .empty (.cutX 28544 (.cutY 12672 .full (.cutX 28480 (.cutY 12736 .full (.cutX 28448 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata50 : 0<157738472 ∧ 16<128 ∧ 78<128 ∧ 1<4 ∧
    6030/4160=1 ∧ 6030%4160=1870 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 6145, atom 324, type 0, source (2,72).
def leavesData51 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves51 : Fin 7 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 72 leaves51 i
def outputData51 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,18432,18560⟩) (.node (.single ⟨512,640,18560,18688⟩) (.single ⟨640,704,18432,18496⟩))) (.node (.node (.single ⟨640,704,18496,18560⟩) (.single ⟨704,768,18432,18496⟩)) (.node (.single ⟨704,768,18496,18560⟩) (.single ⟨640,768,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,32000,32128⟩) (.node (.single ⟨14080,14208,32128,32256⟩) (.single ⟨14208,14272,32000,32064⟩))) (.node (.node (.single ⟨14208,14272,32064,32128⟩) (.single ⟨14272,14336,32000,32064⟩)) (.node (.single ⟨14272,14336,32064,32128⟩) (.single ⟨14208,14336,32128,32256⟩))))) (.node (.node (.node (.single ⟨18432,18560,512,640⟩) (.node (.single ⟨18432,18496,640,704⟩) (.single ⟨18432,18496,704,768⟩))) (.node (.node (.single ⟨18496,18560,640,704⟩) (.single ⟨18496,18560,704,768⟩)) (.node (.single ⟨18560,18688,512,640⟩) (.single ⟨18560,18688,640,768⟩)))) (.node (.node (.single ⟨32000,32128,14080,14208⟩) (.node (.single ⟨32000,32064,14208,14272⟩) (.single ⟨32000,32064,14272,14336⟩))) (.node (.node (.single ⟨32064,32128,14208,14272⟩) (.single ⟨32064,32128,14272,14336⟩)) (.node (.single ⟨32128,32256,14080,14208⟩) (.single ⟨32128,32256,14208,14336⟩))))))
def output51 : Fin 28 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData51 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover51 (i : Fin 28) : Fin 28 := ⟨coverData51.get i % 28, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 28) : Fin 28 := ⟨sourceData51.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 (.cutX 768 (.cutY 18688 (.cutX 640 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 704 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 .empty (.cutY 32256 (.cutX 14080 .empty (.cutY 32000 .empty (.cutX 14208 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 14272 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty))))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 (.cutY 512 .empty (.cutX 18688 (.cutY 768 (.cutX 18560 (.cutY 640 .full (.cutX 18496 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 .empty (.cutX 32000 .empty (.cutY 14080 .empty (.cutX 32128 (.cutY 14208 .full (.cutX 32064 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))) .empty))) .empty)))))) .empty))

theorem metadata51 : 0<34183877 ∧ 2<128 ∧ 72<128 ∧ 0<4 ∧
    324/4160=0 ∧ 324%4160=324 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 6146, atom 1034, type 0, source (8,74).
def leavesData52 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves52 : Fin 4 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 74 leaves52 i
def outputData52 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,18944,19072⟩) (.single ⟨2048,2176,19072,19200⟩)) (.node (.single ⟨2176,2304,18944,19072⟩) (.single ⟨2176,2304,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,30464,30592⟩) (.single ⟨13568,13696,30592,30720⟩)) (.node (.single ⟨13696,13824,30464,30592⟩) (.single ⟨13696,13824,30592,30720⟩)))) (.node (.node (.node (.single ⟨18944,19072,2048,2176⟩) (.single ⟨18944,19072,2176,2304⟩)) (.node (.single ⟨19072,19200,2048,2176⟩) (.single ⟨19072,19200,2176,2304⟩))) (.node (.node (.single ⟨30464,30592,13568,13696⟩) (.single ⟨30464,30592,13696,13824⟩)) (.node (.single ⟨30592,30720,13568,13696⟩) (.single ⟨30592,30720,13696,13824⟩)))))
def output52 : Fin 16 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData52 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover52 (i : Fin 16) : Fin 16 := ⟨coverData52.get i % 16, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 16) : Fin 16 := ⟨sourceData52.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 .empty (.cutX 2304 (.cutY 19200 (.cutX 2176 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 .empty (.cutX 13568 .empty (.cutY 30464 .empty (.cutX 13696 (.cutY 30592 .full .full) (.cutY 30592 .full .full))))) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 (.cutX 19200 (.cutY 2304 (.cutX 19072 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 (.cutX 30464 .empty (.cutY 13568 .empty (.cutX 30592 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty)))) .empty) .empty))))) .empty))

theorem metadata52 : 0<48363413 ∧ 8<128 ∧ 74<128 ∧ 0<4 ∧
    1034/4160=0 ∧ 1034%4160=1034 ∧ ∀ i, (leaves52 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData52).mp
    (by decide +kernel)

theorem sourceChecked52_0 : ∀ i : Fin 16,
    (fun i => output52 i = raw52 (source52 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked52 : ∀ i : Fin 16, (fun i => output52 i = raw52 (source52 i)) i :=
  forallFin_of_zero_offset (fun i => output52 i = raw52 (source52 i)) sourceChecked52_0

theorem coverChecked52_0 : ∀ i : Fin 16,
    (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked52 : ∀ i : Fin 16, (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) i :=
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 6147, atom 1469, type 0, source (12,77).
def leavesData53 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves53 : Fin 4 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 77 leaves53 i
def outputData53 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,19712,19840⟩) (.single ⟨3072,3200,19840,19968⟩)) (.node (.single ⟨3200,3328,19712,19840⟩) (.single ⟨3200,3328,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,29440,29568⟩) (.single ⟨12800,12928,29568,29696⟩)) (.node (.single ⟨12928,13056,29440,29568⟩) (.single ⟨12928,13056,29568,29696⟩)))) (.node (.node (.node (.single ⟨19712,19840,3072,3200⟩) (.single ⟨19712,19840,3200,3328⟩)) (.node (.single ⟨19840,19968,3072,3200⟩) (.single ⟨19840,19968,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,12800,12928⟩) (.single ⟨29440,29568,12928,13056⟩)) (.node (.single ⟨29568,29696,12800,12928⟩) (.single ⟨29568,29696,12928,13056⟩)))))
def output53 : Fin 16 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData53 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover53 (i : Fin 16) : Fin 16 := ⟨coverData53.get i % 16, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 16) : Fin 16 := ⟨sourceData53.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 (.cutX 3328 (.cutY 19712 .empty (.cutX 3200 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 .empty (.cutX 13056 (.cutY 29440 .empty (.cutX 12928 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty))) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 (.cutX 19712 .empty (.cutY 3328 (.cutX 19840 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 .empty (.cutX 29440 .empty (.cutY 13056 (.cutX 29568 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata53 : 0<48363413 ∧ 12<128 ∧ 77<128 ∧ 0<4 ∧
    1469/4160=0 ∧ 1469%4160=1469 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 16,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 16, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) sourceChecked53_0

theorem coverChecked53_0 : ∀ i : Fin 16,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 16, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 6148, atom 1573, type 0, source (13,78).
def leavesData54 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves54 : Fin 4 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 78 leaves54 i
def outputData54 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,19968,20096⟩) (.single ⟨3328,3456,20096,20224⟩)) (.node (.single ⟨3456,3584,19968,20096⟩) (.single ⟨3456,3584,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,29184,29312⟩) (.single ⟨12544,12672,29312,29440⟩)) (.node (.single ⟨12672,12800,29184,29312⟩) (.single ⟨12672,12800,29312,29440⟩)))) (.node (.node (.node (.single ⟨19968,20096,3328,3456⟩) (.single ⟨19968,20096,3456,3584⟩)) (.node (.single ⟨20096,20224,3328,3456⟩) (.single ⟨20096,20224,3456,3584⟩))) (.node (.node (.single ⟨29184,29312,12544,12672⟩) (.single ⟨29184,29312,12672,12800⟩)) (.node (.single ⟨29312,29440,12544,12672⟩) (.single ⟨29312,29440,12672,12800⟩)))))
def output54 : Fin 16 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover54 (i : Fin 16) : Fin 16 := ⟨coverData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 16) : Fin 16 := ⟨sourceData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 .empty (.cutX 3328 .empty (.cutY 20224 (.cutX 3456 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty))) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 .empty (.cutX 12544 .empty (.cutY 29440 (.cutX 12672 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 (.cutX 20224 (.cutY 3328 .empty (.cutX 20096 (.cutY 3456 .full .full) (.cutY 3456 .full .full))) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 (.cutX 29440 (.cutY 12544 .empty (.cutX 29312 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty)) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata54 : 0<48363413 ∧ 13<128 ∧ 78<128 ∧ 0<4 ∧
    1573/4160=0 ∧ 1573%4160=1573 ∧ ∀ i, (leaves54 i).Valid 8 := by
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 6149, atom 5932, type 1, source (15,77).
def leavesData55 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves55 : Fin 7 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 77 leaves55 i
def outputData55 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,19712,19840⟩) (.node (.single ⟨3840,3968,19840,19968⟩) (.single ⟨3968,4032,19712,19776⟩))) (.node (.node (.single ⟨3968,4032,19776,19840⟩) (.single ⟨4032,4096,19712,19776⟩)) (.node (.single ⟨4032,4096,19776,19840⟩) (.single ⟨3968,4096,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,28672,28800⟩) (.node (.single ⟨12800,12928,28800,28928⟩) (.single ⟨12928,12992,28672,28736⟩))) (.node (.node (.single ⟨12928,12992,28736,28800⟩) (.single ⟨12992,13056,28672,28736⟩)) (.node (.single ⟨12992,13056,28736,28800⟩) (.single ⟨12928,13056,28800,28928⟩))))) (.node (.node (.node (.single ⟨19712,19840,3840,3968⟩) (.node (.single ⟨19712,19776,3968,4032⟩) (.single ⟨19712,19776,4032,4096⟩))) (.node (.node (.single ⟨19776,19840,3968,4032⟩) (.single ⟨19776,19840,4032,4096⟩)) (.node (.single ⟨19840,19968,3840,3968⟩) (.single ⟨19840,19968,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,12800,12928⟩) (.node (.single ⟨28672,28736,12928,12992⟩) (.single ⟨28672,28736,12992,13056⟩))) (.node (.node (.single ⟨28736,28800,12928,12992⟩) (.single ⟨28736,28800,12992,13056⟩)) (.node (.single ⟨28800,28928,12800,12928⟩) (.single ⟨28800,28928,12928,13056⟩))))))
def output55 : Fin 28 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData55 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover55 (i : Fin 28) : Fin 28 := ⟨coverData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 28) : Fin 28 := ⟨sourceData55.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 .empty (.cutY 19712 .empty (.cutX 3968 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 4032 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full)))) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 (.cutY 28928 (.cutX 12928 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 12992 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 .empty (.cutY 3840 .empty (.cutX 19840 (.cutY 3968 .full (.cutX 19776 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 (.cutY 13056 (.cutX 28800 (.cutY 12928 .full (.cutX 28736 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata55 : 0<94387549 ∧ 15<128 ∧ 77<128 ∧ 1<4 ∧
    5932/4160=1 ∧ 5932%4160=1772 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 6150, atom 6401, type 1, source (20,81).
def leavesData56 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves56 : Fin 16 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 20 81 leaves56 i
def outputData56 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5120,5184,20736,20800⟩) (.single ⟨5120,5184,20800,20864⟩)) (.node (.single ⟨5184,5248,20736,20800⟩) (.single ⟨5184,5248,20800,20864⟩))) (.node (.node (.single ⟨5120,5248,20864,20992⟩) (.single ⟨5248,5312,20736,20800⟩)) (.node (.single ⟨5248,5312,20800,20864⟩) (.single ⟨5312,5344,20736,20768⟩)))) (.node (.node (.node (.single ⟨5312,5344,20768,20800⟩) (.single ⟨5344,5376,20736,20768⟩)) (.node (.single ⟨5344,5376,20768,20800⟩) (.single ⟨5312,5376,20800,20864⟩))) (.node (.node (.single ⟨5248,5312,20864,20928⟩) (.single ⟨5248,5312,20928,20992⟩)) (.node (.single ⟨5312,5376,20864,20928⟩) (.single ⟨5312,5376,20928,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11840,27392,27456⟩) (.single ⟨11776,11840,27456,27520⟩)) (.node (.single ⟨11840,11904,27392,27456⟩) (.single ⟨11840,11904,27456,27520⟩))) (.node (.node (.single ⟨11776,11904,27520,27648⟩) (.single ⟨11904,11968,27392,27456⟩)) (.node (.single ⟨11904,11968,27456,27520⟩) (.single ⟨11968,12000,27392,27424⟩)))) (.node (.node (.node (.single ⟨11968,12000,27424,27456⟩) (.single ⟨12000,12032,27392,27424⟩)) (.node (.single ⟨12000,12032,27424,27456⟩) (.single ⟨11968,12032,27456,27520⟩))) (.node (.node (.single ⟨11904,11968,27520,27584⟩) (.single ⟨11904,11968,27584,27648⟩)) (.node (.single ⟨11968,12032,27520,27584⟩) (.single ⟨11968,12032,27584,27648⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,5120,5184⟩) (.single ⟨20736,20800,5184,5248⟩)) (.node (.single ⟨20800,20864,5120,5184⟩) (.single ⟨20800,20864,5184,5248⟩))) (.node (.node (.single ⟨20736,20800,5248,5312⟩) (.single ⟨20736,20768,5312,5344⟩)) (.node (.single ⟨20736,20768,5344,5376⟩) (.single ⟨20768,20800,5312,5344⟩)))) (.node (.node (.node (.single ⟨20768,20800,5344,5376⟩) (.single ⟨20800,20864,5248,5312⟩)) (.node (.single ⟨20800,20864,5312,5376⟩) (.single ⟨20864,20992,5120,5248⟩))) (.node (.node (.single ⟨20864,20928,5248,5312⟩) (.single ⟨20864,20928,5312,5376⟩)) (.node (.single ⟨20928,20992,5248,5312⟩) (.single ⟨20928,20992,5312,5376⟩))))) (.node (.node (.node (.node (.single ⟨27392,27456,11776,11840⟩) (.single ⟨27392,27456,11840,11904⟩)) (.node (.single ⟨27456,27520,11776,11840⟩) (.single ⟨27456,27520,11840,11904⟩))) (.node (.node (.single ⟨27392,27456,11904,11968⟩) (.single ⟨27392,27424,11968,12000⟩)) (.node (.single ⟨27392,27424,12000,12032⟩) (.single ⟨27424,27456,11968,12000⟩)))) (.node (.node (.node (.single ⟨27424,27456,12000,12032⟩) (.single ⟨27456,27520,11904,11968⟩)) (.node (.single ⟨27456,27520,11968,12032⟩) (.single ⟨27520,27648,11776,11904⟩))) (.node (.node (.single ⟨27520,27584,11904,11968⟩) (.single ⟨27520,27584,11968,12032⟩)) (.node (.single ⟨27584,27648,11904,11968⟩) (.single ⟨27584,27648,11968,12032⟩)))))))
def output56 : Fin 64 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData56 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover56 (i : Fin 64) : Fin 64 := ⟨coverData56.get i % 64, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 64) : Fin 64 := ⟨sourceData56.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 (.cutX 5376 (.cutY 20736 .empty (.cutX 5248 (.cutY 20864 (.cutX 5184 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5312 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 5344 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) (.cutX 5312 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 .empty (.cutX 12032 (.cutY 27392 .empty (.cutX 11904 (.cutY 27520 (.cutX 11840 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full) (.cutY 27520 (.cutX 11968 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 12000 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 11968 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty))) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 (.cutX 20736 .empty (.cutY 5376 (.cutX 20864 (.cutY 5248 (.cutX 20800 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 20800 (.cutY 5312 .full (.cutX 20768 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full (.cutX 20928 (.cutY 5312 .full .full) (.cutY 5312 .full .full)))) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 .empty (.cutX 27392 .empty (.cutY 12032 (.cutX 27520 (.cutY 11904 (.cutX 27456 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 27456 (.cutY 11968 .full (.cutX 27424 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 27584 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))))) .empty))) .empty) .empty))) .empty))

theorem metadata56 : 0<125829407 ∧ 20<128 ∧ 81<128 ∧ 1<4 ∧
    6401/4160=1 ∧ 6401%4160=2241 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 64,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 64, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) sourceChecked56_0

theorem coverChecked56_0 : ∀ i : Fin 64,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 64, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 6151, atom 4483, type 1, source (2,71).
def leavesData57 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves57 : Fin 4 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 2 71 leaves57 i
def outputData57 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨512,640,18176,18304⟩) (.single ⟨512,640,18304,18432⟩)) (.node (.single ⟨640,768,18176,18304⟩) (.single ⟨640,768,18304,18432⟩))) (.node (.node (.single ⟨14336,14464,32000,32128⟩) (.single ⟨14336,14464,32128,32256⟩)) (.node (.single ⟨14464,14592,32000,32128⟩) (.single ⟨14464,14592,32128,32256⟩)))) (.node (.node (.node (.single ⟨18176,18304,512,640⟩) (.single ⟨18176,18304,640,768⟩)) (.node (.single ⟨18304,18432,512,640⟩) (.single ⟨18304,18432,640,768⟩))) (.node (.node (.single ⟨32000,32128,14336,14464⟩) (.single ⟨32000,32128,14464,14592⟩)) (.node (.single ⟨32128,32256,14336,14464⟩) (.single ⟨32128,32256,14464,14592⟩)))))
def output57 : Fin 16 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover57 (i : Fin 16) : Fin 16 := ⟨coverData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 16) : Fin 16 := ⟨sourceData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 (.cutY 18176 .empty (.cutX 640 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 (.cutY 32000 .empty (.cutX 14464 (.cutY 32128 .full .full) (.cutY 32128 .full .full))) .empty) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 .empty (.cutY 768 (.cutX 18304 (.cutY 640 .full .full) (.cutY 640 .full .full)) .empty)))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 .empty (.cutY 14592 (.cutX 32128 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty)))))))) .empty))

theorem metadata57 : 0<202148459 ∧ 2<128 ∧ 71<128 ∧ 1<4 ∧
    4483/4160=1 ∧ 4483%4160=323 ∧ ∀ i, (leaves57 i).Valid 8 := by
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 6152, atom 4357, type 1, source (1,70).
def leavesData58 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves58 : Fin 16 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 1 70 leaves58 i
def outputData58 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨256,320,17920,17984⟩) (.single ⟨256,320,17984,18048⟩)) (.node (.single ⟨320,384,17920,17984⟩) (.single ⟨320,384,17984,18048⟩))) (.node (.node (.single ⟨256,384,18048,18176⟩) (.single ⟨384,448,17920,17984⟩)) (.node (.single ⟨384,448,17984,18048⟩) (.single ⟨448,480,17920,17952⟩)))) (.node (.node (.node (.single ⟨448,480,17952,17984⟩) (.single ⟨480,512,17920,17952⟩)) (.node (.single ⟨480,512,17952,17984⟩) (.single ⟨448,512,17984,18048⟩))) (.node (.node (.single ⟨384,448,18048,18112⟩) (.single ⟨384,448,18112,18176⟩)) (.node (.single ⟨448,512,18048,18112⟩) (.single ⟨448,512,18112,18176⟩))))) (.node (.node (.node (.node (.single ⟨14592,14656,32256,32320⟩) (.single ⟨14592,14656,32320,32384⟩)) (.node (.single ⟨14656,14720,32256,32320⟩) (.single ⟨14656,14720,32320,32384⟩))) (.node (.node (.single ⟨14592,14720,32384,32512⟩) (.single ⟨14720,14784,32256,32320⟩)) (.node (.single ⟨14720,14784,32320,32384⟩) (.single ⟨14784,14816,32256,32288⟩)))) (.node (.node (.node (.single ⟨14784,14816,32288,32320⟩) (.single ⟨14816,14848,32256,32288⟩)) (.node (.single ⟨14816,14848,32288,32320⟩) (.single ⟨14784,14848,32320,32384⟩))) (.node (.node (.single ⟨14720,14784,32384,32448⟩) (.single ⟨14720,14784,32448,32512⟩)) (.node (.single ⟨14784,14848,32384,32448⟩) (.single ⟨14784,14848,32448,32512⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,256,320⟩) (.single ⟨17920,17984,320,384⟩)) (.node (.single ⟨17984,18048,256,320⟩) (.single ⟨17984,18048,320,384⟩))) (.node (.node (.single ⟨17920,17984,384,448⟩) (.single ⟨17920,17952,448,480⟩)) (.node (.single ⟨17920,17952,480,512⟩) (.single ⟨17952,17984,448,480⟩)))) (.node (.node (.node (.single ⟨17952,17984,480,512⟩) (.single ⟨17984,18048,384,448⟩)) (.node (.single ⟨17984,18048,448,512⟩) (.single ⟨18048,18176,256,384⟩))) (.node (.node (.single ⟨18048,18112,384,448⟩) (.single ⟨18048,18112,448,512⟩)) (.node (.single ⟨18112,18176,384,448⟩) (.single ⟨18112,18176,448,512⟩))))) (.node (.node (.node (.node (.single ⟨32256,32320,14592,14656⟩) (.single ⟨32256,32320,14656,14720⟩)) (.node (.single ⟨32320,32384,14592,14656⟩) (.single ⟨32320,32384,14656,14720⟩))) (.node (.node (.single ⟨32256,32320,14720,14784⟩) (.single ⟨32256,32288,14784,14816⟩)) (.node (.single ⟨32256,32288,14816,14848⟩) (.single ⟨32288,32320,14784,14816⟩)))) (.node (.node (.node (.single ⟨32288,32320,14816,14848⟩) (.single ⟨32320,32384,14720,14784⟩)) (.node (.single ⟨32320,32384,14784,14848⟩) (.single ⟨32384,32512,14592,14720⟩))) (.node (.node (.single ⟨32384,32448,14720,14784⟩) (.single ⟨32384,32448,14784,14848⟩)) (.node (.single ⟨32448,32512,14720,14784⟩) (.single ⟨32448,32512,14784,14848⟩)))))))
def output58 : Fin 64 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData58 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover58 (i : Fin 64) : Fin 64 := ⟨coverData58.get i % 64, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 64) : Fin 64 := ⟨sourceData58.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 .empty (.cutY 18176 (.cutX 384 (.cutY 18048 (.cutX 320 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 448 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 480 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) (.cutX 448 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 .empty (.cutY 32512 (.cutX 14720 (.cutY 32384 (.cutX 14656 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full) (.cutY 32384 (.cutX 14784 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 14816 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 14784 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 (.cutY 256 .empty (.cutX 18048 (.cutY 384 (.cutX 17984 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17984 (.cutY 448 .full (.cutX 17952 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full (.cutX 18112 (.cutY 448 .full .full) (.cutY 448 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 (.cutY 14592 .empty (.cutX 32384 (.cutY 14720 (.cutX 32320 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) (.cutX 32320 (.cutY 14784 .full (.cutX 32288 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 32448 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty)) .empty)))))))) .empty))

theorem metadata58 : 0<202148459 ∧ 1<128 ∧ 70<128 ∧ 1<4 ∧
    4357/4160=1 ∧ 4357%4160=197 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 64,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 64, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 64,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 64, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 6153, atom 5832, type 1, source (14,76).
def leavesData59 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves59 : Fin 7 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 76 leaves59 i
def outputData59 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,19456,19584⟩) (.node (.single ⟨3584,3712,19584,19712⟩) (.single ⟨3712,3776,19456,19520⟩))) (.node (.node (.single ⟨3712,3776,19520,19584⟩) (.single ⟨3776,3840,19456,19520⟩)) (.node (.single ⟨3776,3840,19520,19584⟩) (.single ⟨3712,3840,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,28928,29056⟩) (.node (.single ⟨13056,13184,29056,29184⟩) (.single ⟨13184,13248,28928,28992⟩))) (.node (.node (.single ⟨13184,13248,28992,29056⟩) (.single ⟨13248,13312,28928,28992⟩)) (.node (.single ⟨13248,13312,28992,29056⟩) (.single ⟨13184,13312,29056,29184⟩))))) (.node (.node (.node (.single ⟨19456,19584,3584,3712⟩) (.node (.single ⟨19456,19520,3712,3776⟩) (.single ⟨19456,19520,3776,3840⟩))) (.node (.node (.single ⟨19520,19584,3712,3776⟩) (.single ⟨19520,19584,3776,3840⟩)) (.node (.single ⟨19584,19712,3584,3712⟩) (.single ⟨19584,19712,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,13056,13184⟩) (.node (.single ⟨28928,28992,13184,13248⟩) (.single ⟨28928,28992,13248,13312⟩))) (.node (.node (.single ⟨28992,29056,13184,13248⟩) (.single ⟨28992,29056,13248,13312⟩)) (.node (.single ⟨29056,29184,13056,13184⟩) (.single ⟨29056,29184,13184,13312⟩))))))
def output59 : Fin 28 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData59 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover59 (i : Fin 28) : Fin 28 := ⟨coverData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 28) : Fin 28 := ⟨sourceData59.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 (.cutY 19712 (.cutX 3712 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 3776 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 .empty (.cutY 28928 .empty (.cutX 13184 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 13248 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 (.cutY 3840 (.cutX 19584 (.cutY 3712 .full (.cutX 19520 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 .empty (.cutY 13056 .empty (.cutX 29056 (.cutY 13184 .full (.cutX 28992 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))))) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata59 : 0<94387549 ∧ 14<128 ∧ 76<128 ∧ 1<4 ∧
    5832/4160=1 ∧ 5832%4160=1672 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

-- Frozen phase 6154, atom 2583, type 0, source (24,87).
def leavesData60 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves60 : Fin 10 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 87 leaves60 i
def outputData60 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,22272,22336⟩) (.single ⟨6144,6208,22336,22400⟩)) (.node (.single ⟨6208,6272,22272,22336⟩) (.node (.single ⟨6208,6272,22336,22400⟩) (.single ⟨6144,6272,22400,22528⟩)))) (.node (.node (.single ⟨6272,6336,22272,22336⟩) (.single ⟨6272,6336,22336,22400⟩)) (.node (.single ⟨6336,6400,22272,22336⟩) (.node (.single ⟨6336,6400,22336,22400⟩) (.single ⟨6272,6400,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,26368,26496⟩) (.single ⟨10240,10368,26496,26624⟩)) (.node (.single ⟨10368,10432,26368,26432⟩) (.node (.single ⟨10368,10432,26432,26496⟩) (.single ⟨10432,10496,26368,26432⟩)))) (.node (.node (.single ⟨10432,10496,26432,26496⟩) (.single ⟨10368,10432,26496,26560⟩)) (.node (.single ⟨10368,10432,26560,26624⟩) (.node (.single ⟨10432,10496,26496,26560⟩) (.single ⟨10432,10496,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22336,6144,6208⟩) (.single ⟨22272,22336,6208,6272⟩)) (.node (.single ⟨22336,22400,6144,6208⟩) (.node (.single ⟨22336,22400,6208,6272⟩) (.single ⟨22272,22336,6272,6336⟩)))) (.node (.node (.single ⟨22272,22336,6336,6400⟩) (.single ⟨22336,22400,6272,6336⟩)) (.node (.single ⟨22336,22400,6336,6400⟩) (.node (.single ⟨22400,22528,6144,6272⟩) (.single ⟨22400,22528,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,10240,10368⟩) (.single ⟨26368,26432,10368,10432⟩)) (.node (.single ⟨26368,26432,10432,10496⟩) (.node (.single ⟨26432,26496,10368,10432⟩) (.single ⟨26432,26496,10432,10496⟩)))) (.node (.node (.single ⟨26496,26624,10240,10368⟩) (.single ⟨26496,26560,10368,10432⟩)) (.node (.single ⟨26496,26560,10432,10496⟩) (.node (.single ⟨26560,26624,10368,10432⟩) (.single ⟨26560,26624,10432,10496⟩)))))))
def output60 : Fin 40 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover60 (i : Fin 40) : Fin 40 := ⟨coverData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 40) : Fin 40 := ⟨sourceData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 .empty (.cutX 6400 (.cutY 22272 .empty (.cutX 6272 (.cutY 22400 (.cutX 6208 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 6336 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))) .empty)) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 .empty (.cutX 10496 (.cutY 26368 .empty (.cutX 10368 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 10432 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 10432 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 (.cutX 22272 .empty (.cutY 6400 (.cutX 22400 (.cutY 6272 (.cutX 22336 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 22336 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty)) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 (.cutX 26368 .empty (.cutY 10496 (.cutX 26496 (.cutY 10368 .full (.cutX 26432 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 26560 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty)) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata60 : 0<104681033 ∧ 24<128 ∧ 87<128 ∧ 0<4 ∧
    2583/4160=0 ∧ 2583%4160=2583 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 6155, atom 2418, type 0, source (22,86).
def leavesData61 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves61 : Fin 10 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 86 leaves61 i
def outputData61 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,22016,22080⟩) (.single ⟨5632,5696,22080,22144⟩)) (.node (.single ⟨5696,5760,22016,22080⟩) (.node (.single ⟨5696,5760,22080,22144⟩) (.single ⟨5632,5760,22144,22272⟩)))) (.node (.node (.single ⟨5760,5824,22016,22080⟩) (.single ⟨5760,5824,22080,22144⟩)) (.node (.single ⟨5824,5888,22016,22080⟩) (.node (.single ⟨5824,5888,22080,22144⟩) (.single ⟨5760,5888,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,26880,27008⟩) (.single ⟨10496,10624,27008,27136⟩)) (.node (.single ⟨10624,10688,26880,26944⟩) (.node (.single ⟨10624,10688,26944,27008⟩) (.single ⟨10688,10752,26880,26944⟩)))) (.node (.node (.single ⟨10688,10752,26944,27008⟩) (.single ⟨10624,10688,27008,27072⟩)) (.node (.single ⟨10624,10688,27072,27136⟩) (.node (.single ⟨10688,10752,27008,27072⟩) (.single ⟨10688,10752,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,5632,5696⟩) (.single ⟨22016,22080,5696,5760⟩)) (.node (.single ⟨22080,22144,5632,5696⟩) (.node (.single ⟨22080,22144,5696,5760⟩) (.single ⟨22016,22080,5760,5824⟩)))) (.node (.node (.single ⟨22016,22080,5824,5888⟩) (.single ⟨22080,22144,5760,5824⟩)) (.node (.single ⟨22080,22144,5824,5888⟩) (.node (.single ⟨22144,22272,5632,5760⟩) (.single ⟨22144,22272,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,10496,10624⟩) (.single ⟨26880,26944,10624,10688⟩)) (.node (.single ⟨26880,26944,10688,10752⟩) (.node (.single ⟨26944,27008,10624,10688⟩) (.single ⟨26944,27008,10688,10752⟩)))) (.node (.node (.single ⟨27008,27136,10496,10624⟩) (.single ⟨27008,27072,10624,10688⟩)) (.node (.single ⟨27008,27072,10688,10752⟩) (.node (.single ⟨27072,27136,10624,10688⟩) (.single ⟨27072,27136,10688,10752⟩)))))))
def output61 : Fin 40 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData61 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover61 (i : Fin 40) : Fin 40 := ⟨coverData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 40) : Fin 40 := ⟨sourceData61.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 .empty (.cutX 5888 (.cutY 22272 (.cutX 5760 (.cutY 22144 (.cutX 5696 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 5824 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty) .empty))))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 (.cutY 27136 (.cutX 10496 .empty (.cutY 26880 .empty (.cutX 10624 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 10688 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 10688 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 .empty (.cutY 5632 .empty (.cutX 22272 (.cutY 5888 (.cutX 22144 (.cutY 5760 (.cutX 22080 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 22080 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty))))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 (.cutX 26880 .empty (.cutY 10496 .empty (.cutX 27008 (.cutY 10624 .full (.cutX 26944 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 27072 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata61 : 0<152546139 ∧ 22<128 ∧ 86<128 ∧ 0<4 ∧
    2418/4160=0 ∧ 2418%4160=2418 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 6156, atom 2962, type 0, source (29,91).
def leavesData62 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves62 : Fin 7 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 91 leaves62 i
def outputData62 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,23296,23424⟩) (.node (.single ⟨7424,7552,23424,23552⟩) (.single ⟨7552,7616,23296,23360⟩))) (.node (.node (.single ⟨7552,7616,23360,23424⟩) (.single ⟨7616,7680,23296,23360⟩)) (.node (.single ⟨7616,7680,23360,23424⟩) (.single ⟨7552,7680,23424,23552⟩)))) (.node (.node (.single ⟨9216,9344,25088,25216⟩) (.node (.single ⟨9216,9344,25216,25344⟩) (.single ⟨9344,9408,25088,25152⟩))) (.node (.node (.single ⟨9344,9408,25152,25216⟩) (.single ⟨9408,9472,25088,25152⟩)) (.node (.single ⟨9408,9472,25152,25216⟩) (.single ⟨9344,9472,25216,25344⟩))))) (.node (.node (.node (.single ⟨23296,23424,7424,7552⟩) (.node (.single ⟨23296,23360,7552,7616⟩) (.single ⟨23296,23360,7616,7680⟩))) (.node (.node (.single ⟨23360,23424,7552,7616⟩) (.single ⟨23360,23424,7616,7680⟩)) (.node (.single ⟨23424,23552,7424,7552⟩) (.single ⟨23424,23552,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,9216,9344⟩) (.node (.single ⟨25088,25152,9344,9408⟩) (.single ⟨25088,25152,9408,9472⟩))) (.node (.node (.single ⟨25152,25216,9344,9408⟩) (.single ⟨25152,25216,9408,9472⟩)) (.node (.single ⟨25216,25344,9216,9344⟩) (.single ⟨25216,25344,9344,9472⟩))))))
def output62 : Fin 28 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData62 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover62 (i : Fin 28) : Fin 28 := ⟨coverData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 28) : Fin 28 := ⟨sourceData62.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 .empty (.cutX 7424 .empty (.cutY 23296 .empty (.cutX 7552 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 7616 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))))) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 .empty (.cutX 9472 (.cutY 25344 (.cutX 9344 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 9408 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 (.cutX 23296 .empty (.cutY 7424 .empty (.cutX 23424 (.cutY 7552 .full (.cutX 23360 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 (.cutX 25344 (.cutY 9472 (.cutX 25216 (.cutY 9344 .full (.cutX 25152 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata62 : 0<145899414 ∧ 29<128 ∧ 91<128 ∧ 0<4 ∧
    2962/4160=0 ∧ 2962%4160=2962 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 6157, atom 6489, type 1, source (21,82).
def leavesData63 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves63 : Fin 13 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 82 leaves63 i
def outputData63 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,20992,21056⟩) (.node (.single ⟨5376,5440,21056,21120⟩) (.single ⟨5440,5504,20992,21056⟩))) (.node (.single ⟨5440,5504,21056,21120⟩) (.node (.single ⟨5376,5504,21120,21248⟩) (.single ⟨5504,5568,20992,21056⟩)))) (.node (.node (.single ⟨5504,5568,21056,21120⟩) (.node (.single ⟨5568,5600,20992,21024⟩) (.single ⟨5568,5600,21024,21056⟩))) (.node (.node (.single ⟨5600,5632,20992,21024⟩) (.single ⟨5600,5632,21024,21056⟩)) (.node (.single ⟨5568,5632,21056,21120⟩) (.single ⟨5504,5632,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,27136,27264⟩) (.node (.single ⟨11520,11648,27264,27392⟩) (.single ⟨11648,11712,27136,27200⟩))) (.node (.single ⟨11648,11712,27200,27264⟩) (.node (.single ⟨11712,11744,27136,27168⟩) (.single ⟨11712,11744,27168,27200⟩)))) (.node (.node (.single ⟨11744,11776,27136,27168⟩) (.node (.single ⟨11744,11776,27168,27200⟩) (.single ⟨11712,11776,27200,27264⟩))) (.node (.node (.single ⟨11648,11712,27264,27328⟩) (.single ⟨11648,11712,27328,27392⟩)) (.node (.single ⟨11712,11776,27264,27328⟩) (.single ⟨11712,11776,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,5376,5440⟩) (.node (.single ⟨20992,21056,5440,5504⟩) (.single ⟨21056,21120,5376,5440⟩))) (.node (.single ⟨21056,21120,5440,5504⟩) (.node (.single ⟨20992,21056,5504,5568⟩) (.single ⟨20992,21024,5568,5600⟩)))) (.node (.node (.single ⟨20992,21024,5600,5632⟩) (.node (.single ⟨21024,21056,5568,5600⟩) (.single ⟨21024,21056,5600,5632⟩))) (.node (.node (.single ⟨21056,21120,5504,5568⟩) (.single ⟨21056,21120,5568,5632⟩)) (.node (.single ⟨21120,21248,5376,5504⟩) (.single ⟨21120,21248,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,11520,11648⟩) (.node (.single ⟨27136,27200,11648,11712⟩) (.single ⟨27136,27168,11712,11744⟩))) (.node (.single ⟨27136,27168,11744,11776⟩) (.node (.single ⟨27168,27200,11712,11744⟩) (.single ⟨27168,27200,11744,11776⟩)))) (.node (.node (.single ⟨27200,27264,11648,11712⟩) (.node (.single ⟨27200,27264,11712,11776⟩) (.single ⟨27264,27392,11520,11648⟩))) (.node (.node (.single ⟨27264,27328,11648,11712⟩) (.single ⟨27264,27328,11712,11776⟩)) (.node (.single ⟨27328,27392,11648,11712⟩) (.single ⟨27328,27392,11712,11776⟩)))))))
def output63 : Fin 52 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover63 (i : Fin 52) : Fin 52 := ⟨coverData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 52) : Fin 52 := ⟨sourceData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 .empty (.cutX 5376 .empty (.cutY 21248 (.cutX 5504 (.cutY 21120 (.cutX 5440 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 5568 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 5600 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 .empty (.cutX 11520 .empty (.cutY 27392 (.cutX 11648 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 11712 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 11744 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 11712 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty))) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 (.cutX 21248 (.cutY 5376 .empty (.cutX 21120 (.cutY 5504 (.cutX 21056 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 21056 (.cutY 5568 .full (.cutX 21024 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 (.cutX 27392 (.cutY 11520 .empty (.cutX 27264 (.cutY 11648 .full (.cutX 27200 (.cutY 11712 .full (.cutX 27168 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 27328 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty))) .empty))) .empty) .empty))) .empty))

theorem metadata63 : 0<125829407 ∧ 21<128 ∧ 82<128 ∧ 1<4 ∧
    6489/4160=1 ∧ 6489%4160=2329 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 52,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 52, (fun i => output63 i = raw63 (source63 i)) i :=
  forallFin_of_zero_offset (fun i => output63 i = raw63 (source63 i)) sourceChecked63_0

theorem coverChecked63_0 : ∀ i : Fin 52,
    (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked63 : ∀ i : Fin 52, (fun i => (output63 (cover63 i)).ContainsBox (raw63 i)) i :=
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 6158, atom 4230, type 1, source (0,70).
def leavesData64 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves64 : Fin 7 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 70 leaves64 i
def outputData64 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,17920,18048⟩) (.node (.single ⟨0,128,18048,18176⟩) (.single ⟨128,192,17920,17984⟩))) (.node (.node (.single ⟨128,192,17984,18048⟩) (.single ⟨192,256,17920,17984⟩)) (.node (.single ⟨192,256,17984,18048⟩) (.single ⟨128,256,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,32512,32640⟩) (.node (.single ⟨14592,14720,32640,32768⟩) (.single ⟨14720,14784,32512,32576⟩))) (.node (.node (.single ⟨14720,14784,32576,32640⟩) (.single ⟨14784,14848,32512,32576⟩)) (.node (.single ⟨14784,14848,32576,32640⟩) (.single ⟨14720,14848,32640,32768⟩))))) (.node (.node (.node (.single ⟨17920,18048,0,128⟩) (.node (.single ⟨17920,17984,128,192⟩) (.single ⟨17920,17984,192,256⟩))) (.node (.node (.single ⟨17984,18048,128,192⟩) (.single ⟨17984,18048,192,256⟩)) (.node (.single ⟨18048,18176,0,128⟩) (.single ⟨18048,18176,128,256⟩)))) (.node (.node (.single ⟨32512,32640,14592,14720⟩) (.node (.single ⟨32512,32576,14720,14784⟩) (.single ⟨32512,32576,14784,14848⟩))) (.node (.node (.single ⟨32576,32640,14720,14784⟩) (.single ⟨32576,32640,14784,14848⟩)) (.node (.single ⟨32640,32768,14592,14720⟩) (.single ⟨32640,32768,14720,14848⟩))))))
def output64 : Fin 28 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData64 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover64 (i : Fin 28) : Fin 28 := ⟨coverData64.get i % 28, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 28) : Fin 28 := ⟨sourceData64.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 (.cutY 18176 (.cutX 128 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 192 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 .empty (.cutY 32512 .empty (.cutX 14720 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 14784 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 (.cutY 256 (.cutX 18048 (.cutY 128 .full (.cutX 17984 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 .empty (.cutY 14592 .empty (.cutX 32640 (.cutY 14720 .full (.cutX 32576 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty)) .empty)))))))) .empty))

theorem metadata64 : 0<202148459 ∧ 0<128 ∧ 70<128 ∧ 1<4 ∧
    4230/4160=1 ∧ 4230%4160=70 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 28,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 28, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 28,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 28, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 6159, atom 6740, type 1, source (24,84).
def leavesData65 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves65 : Fin 13 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 84 leaves65 i
def outputData65 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,21504,21568⟩) (.node (.single ⟨6144,6208,21568,21632⟩) (.single ⟨6208,6272,21504,21568⟩))) (.node (.single ⟨6208,6272,21568,21632⟩) (.node (.single ⟨6144,6272,21632,21760⟩) (.single ⟨6272,6336,21504,21568⟩)))) (.node (.node (.single ⟨6272,6336,21568,21632⟩) (.node (.single ⟨6336,6368,21504,21536⟩) (.single ⟨6336,6368,21536,21568⟩))) (.node (.node (.single ⟨6368,6400,21504,21536⟩) (.single ⟨6368,6400,21536,21568⟩)) (.node (.single ⟨6336,6400,21568,21632⟩) (.single ⟨6272,6400,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,26368,26496⟩) (.node (.single ⟨11008,11136,26496,26624⟩) (.single ⟨11136,11200,26368,26432⟩))) (.node (.single ⟨11136,11200,26432,26496⟩) (.node (.single ⟨11200,11232,26368,26400⟩) (.single ⟨11200,11232,26400,26432⟩)))) (.node (.node (.single ⟨11232,11264,26368,26400⟩) (.node (.single ⟨11232,11264,26400,26432⟩) (.single ⟨11200,11264,26432,26496⟩))) (.node (.node (.single ⟨11136,11200,26496,26560⟩) (.single ⟨11136,11200,26560,26624⟩)) (.node (.single ⟨11200,11264,26496,26560⟩) (.single ⟨11200,11264,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6144,6208⟩) (.node (.single ⟨21504,21568,6208,6272⟩) (.single ⟨21568,21632,6144,6208⟩))) (.node (.single ⟨21568,21632,6208,6272⟩) (.node (.single ⟨21504,21568,6272,6336⟩) (.single ⟨21504,21536,6336,6368⟩)))) (.node (.node (.single ⟨21504,21536,6368,6400⟩) (.node (.single ⟨21536,21568,6336,6368⟩) (.single ⟨21536,21568,6368,6400⟩))) (.node (.node (.single ⟨21568,21632,6272,6336⟩) (.single ⟨21568,21632,6336,6400⟩)) (.node (.single ⟨21632,21760,6144,6272⟩) (.single ⟨21632,21760,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,11008,11136⟩) (.node (.single ⟨26368,26432,11136,11200⟩) (.single ⟨26368,26400,11200,11232⟩))) (.node (.single ⟨26368,26400,11232,11264⟩) (.node (.single ⟨26400,26432,11200,11232⟩) (.single ⟨26400,26432,11232,11264⟩)))) (.node (.node (.single ⟨26432,26496,11136,11200⟩) (.node (.single ⟨26432,26496,11200,11264⟩) (.single ⟨26496,26624,11008,11136⟩))) (.node (.node (.single ⟨26496,26560,11136,11200⟩) (.single ⟨26496,26560,11200,11264⟩)) (.node (.single ⟨26560,26624,11136,11200⟩) (.single ⟨26560,26624,11200,11264⟩)))))))
def output65 : Fin 52 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData65 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover65 (i : Fin 52) : Fin 52 := ⟨coverData65.get i % 52, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 52) : Fin 52 := ⟨sourceData65.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 (.cutY 21760 (.cutX 6272 (.cutY 21632 (.cutX 6208 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6336 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 6368 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 .empty (.cutY 26368 .empty (.cutX 11136 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 11200 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 11232 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 11200 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 (.cutY 6400 (.cutX 21632 (.cutY 6272 (.cutX 21568 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 21568 (.cutY 6336 .full (.cutX 21536 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 .empty (.cutY 11008 .empty (.cutX 26496 (.cutY 11136 .full (.cutX 26432 (.cutY 11200 .full (.cutX 26400 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 26560 (.cutY 11200 .full .full) (.cutY 11200 .full .full)))))))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata65 : 0<144359671 ∧ 24<128 ∧ 84<128 ∧ 1<4 ∧
    6740/4160=1 ∧ 6740%4160=2580 ∧ ∀ i, (leaves65 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData65).mp
    (by decide +kernel)

theorem sourceChecked65_0 : ∀ i : Fin 52,
    (fun i => output65 i = raw65 (source65 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked65 : ∀ i : Fin 52, (fun i => output65 i = raw65 (source65 i)) i :=
  forallFin_of_zero_offset (fun i => output65 i = raw65 (source65 i)) sourceChecked65_0

theorem coverChecked65_0 : ∀ i : Fin 52,
    (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked65 : ∀ i : Fin 52, (fun i => (output65 (cover65 i)).ContainsBox (raw65 i)) i :=
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 6160, atom 7385, type 1, source (33,90).
def leavesData66 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves66 : Fin 13 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 33 90 leaves66 i
def outputData66 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8448,8512,23040,23104⟩) (.node (.single ⟨8448,8512,23104,23168⟩) (.single ⟨8512,8576,23040,23104⟩))) (.node (.single ⟨8512,8576,23104,23168⟩) (.node (.single ⟨8448,8576,23168,23296⟩) (.single ⟨8576,8640,23040,23104⟩)))) (.node (.node (.single ⟨8576,8640,23104,23168⟩) (.node (.single ⟨8640,8672,23040,23072⟩) (.single ⟨8640,8672,23072,23104⟩))) (.node (.node (.single ⟨8672,8704,23040,23072⟩) (.single ⟨8672,8704,23072,23104⟩)) (.node (.single ⟨8640,8704,23104,23168⟩) (.single ⟨8576,8704,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,24064,24192⟩) (.node (.single ⟨9472,9600,24192,24320⟩) (.single ⟨9600,9664,24064,24128⟩))) (.node (.single ⟨9600,9664,24128,24192⟩) (.node (.single ⟨9664,9696,24064,24096⟩) (.single ⟨9664,9696,24096,24128⟩)))) (.node (.node (.single ⟨9696,9728,24064,24096⟩) (.node (.single ⟨9696,9728,24096,24128⟩) (.single ⟨9664,9728,24128,24192⟩))) (.node (.node (.single ⟨9600,9664,24192,24256⟩) (.single ⟨9600,9664,24256,24320⟩)) (.node (.single ⟨9664,9728,24192,24256⟩) (.single ⟨9664,9728,24256,24320⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23104,8448,8512⟩) (.node (.single ⟨23040,23104,8512,8576⟩) (.single ⟨23104,23168,8448,8512⟩))) (.node (.single ⟨23104,23168,8512,8576⟩) (.node (.single ⟨23040,23104,8576,8640⟩) (.single ⟨23040,23072,8640,8672⟩)))) (.node (.node (.single ⟨23040,23072,8672,8704⟩) (.node (.single ⟨23072,23104,8640,8672⟩) (.single ⟨23072,23104,8672,8704⟩))) (.node (.node (.single ⟨23104,23168,8576,8640⟩) (.single ⟨23104,23168,8640,8704⟩)) (.node (.single ⟨23168,23296,8448,8576⟩) (.single ⟨23168,23296,8576,8704⟩))))) (.node (.node (.node (.single ⟨24064,24192,9472,9600⟩) (.node (.single ⟨24064,24128,9600,9664⟩) (.single ⟨24064,24096,9664,9696⟩))) (.node (.single ⟨24064,24096,9696,9728⟩) (.node (.single ⟨24096,24128,9664,9696⟩) (.single ⟨24096,24128,9696,9728⟩)))) (.node (.node (.single ⟨24128,24192,9600,9664⟩) (.node (.single ⟨24128,24192,9664,9728⟩) (.single ⟨24192,24320,9472,9600⟩))) (.node (.node (.single ⟨24192,24256,9600,9664⟩) (.single ⟨24192,24256,9664,9728⟩)) (.node (.single ⟨24256,24320,9600,9664⟩) (.single ⟨24256,24320,9664,9728⟩)))))))
def output66 : Fin 52 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData66 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover66 (i : Fin 52) : Fin 52 := ⟨coverData66.get i % 52, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 52) : Fin 52 := ⟨sourceData66.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 .empty (.cutX 8448 .empty (.cutY 23296 (.cutX 8576 (.cutY 23168 (.cutX 8512 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 8640 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 8672 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) .full)) .empty))) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 .empty (.cutX 9472 .empty (.cutY 24320 (.cutX 9600 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 9664 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 9696 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 9664 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 (.cutX 23296 (.cutY 8448 .empty (.cutX 23168 (.cutY 8576 (.cutX 23104 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 23104 (.cutY 8640 .full (.cutX 23072 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty)) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 (.cutX 24320 (.cutY 9472 .empty (.cutX 24192 (.cutY 9600 .full (.cutX 24128 (.cutY 9664 .full (.cutX 24096 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 24256 (.cutY 9664 .full .full) (.cutY 9664 .full .full))))) .empty) .empty)))) .empty)) .empty))) .empty) .empty))

theorem metadata66 : 0<67962893 ∧ 33<128 ∧ 90<128 ∧ 1<4 ∧
    7385/4160=1 ∧ 7385%4160=3225 ∧ ∀ i, (leaves66 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData66).mp
    (by decide +kernel)

theorem sourceChecked66_0 : ∀ i : Fin 52,
    (fun i => output66 i = raw66 (source66 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked66 : ∀ i : Fin 52, (fun i => output66 i = raw66 (source66 i)) i :=
  forallFin_of_zero_offset (fun i => output66 i = raw66 (source66 i)) sourceChecked66_0

theorem coverChecked66_0 : ∀ i : Fin 52,
    (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked66 : ∀ i : Fin 52, (fun i => (output66 (cover66 i)).ContainsBox (raw66 i)) i :=
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 6161, atom 1146, type 0, source (9,75).
def leavesData67 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves67 : Fin 4 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 75 leaves67 i
def outputData67 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,19200,19328⟩) (.single ⟨2304,2432,19328,19456⟩)) (.node (.single ⟨2432,2560,19200,19328⟩) (.single ⟨2432,2560,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,30208,30336⟩) (.single ⟨13312,13440,30336,30464⟩)) (.node (.single ⟨13440,13568,30208,30336⟩) (.single ⟨13440,13568,30336,30464⟩)))) (.node (.node (.node (.single ⟨19200,19328,2304,2432⟩) (.single ⟨19200,19328,2432,2560⟩)) (.node (.single ⟨19328,19456,2304,2432⟩) (.single ⟨19328,19456,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,13312,13440⟩) (.single ⟨30208,30336,13440,13568⟩)) (.node (.single ⟨30336,30464,13312,13440⟩) (.single ⟨30336,30464,13440,13568⟩)))))
def output67 : Fin 16 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover67 (i : Fin 16) : Fin 16 := ⟨coverData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 16) : Fin 16 := ⟨sourceData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 .empty (.cutX 2304 .empty (.cutY 19200 .empty (.cutX 2432 (.cutY 19328 .full .full) (.cutY 19328 .full .full))))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 .empty (.cutX 13568 (.cutY 30464 (.cutX 13440 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty)) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 (.cutX 19200 .empty (.cutY 2304 .empty (.cutX 19328 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 (.cutX 30464 (.cutY 13568 (.cutX 30336 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty) .empty) .empty)))) .empty) .empty))))) .empty))

theorem metadata67 : 0<48363413 ∧ 9<128 ∧ 75<128 ∧ 0<4 ∧
    1146/4160=0 ∧ 1146%4160=1146 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 6162, atom 2663, type 0, source (25,88).
def leavesData68 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves68 : Fin 7 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 88 leaves68 i
def outputData68 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,22528,22656⟩) (.node (.single ⟨6400,6528,22656,22784⟩) (.single ⟨6528,6592,22528,22592⟩))) (.node (.node (.single ⟨6528,6592,22592,22656⟩) (.single ⟨6592,6656,22528,22592⟩)) (.node (.single ⟨6592,6656,22592,22656⟩) (.single ⟨6528,6656,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,26112,26240⟩) (.node (.single ⟨9984,10112,26240,26368⟩) (.single ⟨10112,10176,26112,26176⟩))) (.node (.node (.single ⟨10112,10176,26176,26240⟩) (.single ⟨10176,10240,26112,26176⟩)) (.node (.single ⟨10176,10240,26176,26240⟩) (.single ⟨10112,10240,26240,26368⟩))))) (.node (.node (.node (.single ⟨22528,22656,6400,6528⟩) (.node (.single ⟨22528,22592,6528,6592⟩) (.single ⟨22528,22592,6592,6656⟩))) (.node (.node (.single ⟨22592,22656,6528,6592⟩) (.single ⟨22592,22656,6592,6656⟩)) (.node (.single ⟨22656,22784,6400,6528⟩) (.single ⟨22656,22784,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,9984,10112⟩) (.node (.single ⟨26112,26176,10112,10176⟩) (.single ⟨26112,26176,10176,10240⟩))) (.node (.node (.single ⟨26176,26240,10112,10176⟩) (.single ⟨26176,26240,10176,10240⟩)) (.node (.single ⟨26240,26368,9984,10112⟩) (.single ⟨26240,26368,10112,10240⟩))))))
def output68 : Fin 28 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover68 (i : Fin 28) : Fin 28 := ⟨coverData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 28) : Fin 28 := ⟨sourceData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 (.cutY 23040 (.cutX 6400 .empty (.cutY 22784 (.cutX 6528 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 6592 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 .empty (.cutX 9984 .empty (.cutY 26368 (.cutX 10112 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 10176 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty)))))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 (.cutX 22784 (.cutY 6400 .empty (.cutX 22656 (.cutY 6528 .full (.cutX 22592 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 .empty (.cutY 9728 .empty (.cutX 26368 (.cutY 9984 .empty (.cutX 26240 (.cutY 10112 .full (.cutX 26176 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty))))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata68 : 0<145899414 ∧ 25<128 ∧ 88<128 ∧ 0<4 ∧
    2663/4160=0 ∧ 2663%4160=2663 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 6163, atom 7047, type 1, source (28,87).
def leavesData69 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves69 : Fin 13 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 28 87 leaves69 i
def outputData69 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7168,7232,22272,22336⟩) (.node (.single ⟨7168,7232,22336,22400⟩) (.single ⟨7232,7296,22272,22336⟩))) (.node (.single ⟨7232,7296,22336,22400⟩) (.node (.single ⟨7168,7296,22400,22528⟩) (.single ⟨7296,7360,22272,22336⟩)))) (.node (.node (.single ⟨7296,7360,22336,22400⟩) (.node (.single ⟨7360,7392,22272,22304⟩) (.single ⟨7360,7392,22304,22336⟩))) (.node (.node (.single ⟨7392,7424,22272,22304⟩) (.single ⟨7392,7424,22304,22336⟩)) (.node (.single ⟨7360,7424,22336,22400⟩) (.single ⟨7296,7424,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,25344,25472⟩) (.node (.single ⟨10240,10368,25472,25600⟩) (.single ⟨10368,10432,25344,25408⟩))) (.node (.single ⟨10368,10432,25408,25472⟩) (.node (.single ⟨10432,10464,25344,25376⟩) (.single ⟨10432,10464,25376,25408⟩)))) (.node (.node (.single ⟨10464,10496,25344,25376⟩) (.node (.single ⟨10464,10496,25376,25408⟩) (.single ⟨10432,10496,25408,25472⟩))) (.node (.node (.single ⟨10368,10432,25472,25536⟩) (.single ⟨10368,10432,25536,25600⟩)) (.node (.single ⟨10432,10496,25472,25536⟩) (.single ⟨10432,10496,25536,25600⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22336,7168,7232⟩) (.node (.single ⟨22272,22336,7232,7296⟩) (.single ⟨22336,22400,7168,7232⟩))) (.node (.single ⟨22336,22400,7232,7296⟩) (.node (.single ⟨22272,22336,7296,7360⟩) (.single ⟨22272,22304,7360,7392⟩)))) (.node (.node (.single ⟨22272,22304,7392,7424⟩) (.node (.single ⟨22304,22336,7360,7392⟩) (.single ⟨22304,22336,7392,7424⟩))) (.node (.node (.single ⟨22336,22400,7296,7360⟩) (.single ⟨22336,22400,7360,7424⟩)) (.node (.single ⟨22400,22528,7168,7296⟩) (.single ⟨22400,22528,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,10240,10368⟩) (.node (.single ⟨25344,25408,10368,10432⟩) (.single ⟨25344,25376,10432,10464⟩))) (.node (.single ⟨25344,25376,10464,10496⟩) (.node (.single ⟨25376,25408,10432,10464⟩) (.single ⟨25376,25408,10464,10496⟩)))) (.node (.node (.single ⟨25408,25472,10368,10432⟩) (.node (.single ⟨25408,25472,10432,10496⟩) (.single ⟨25472,25600,10240,10368⟩))) (.node (.node (.single ⟨25472,25536,10368,10432⟩) (.single ⟨25472,25536,10432,10496⟩)) (.node (.single ⟨25536,25600,10368,10432⟩) (.single ⟨25536,25600,10432,10496⟩)))))))
def output69 : Fin 52 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData69 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover69 (i : Fin 52) : Fin 52 := ⟨coverData69.get i % 52, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 52) : Fin 52 := ⟨sourceData69.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 .empty (.cutX 7424 (.cutY 22272 .empty (.cutX 7296 (.cutY 22400 (.cutX 7232 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 7360 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 7392 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) .full))) .empty)) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 .empty (.cutX 10496 (.cutY 25344 .empty (.cutX 10368 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 10432 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 10464 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 10432 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 (.cutX 22272 .empty (.cutY 7424 (.cutX 22400 (.cutY 7296 (.cutX 22336 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 22336 (.cutY 7360 .full (.cutX 22304 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 (.cutX 25344 .empty (.cutY 10496 (.cutX 25472 (.cutY 10368 .full (.cutX 25408 (.cutY 10432 .full (.cutX 25376 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 25536 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata69 : 0<144359671 ∧ 28<128 ∧ 87<128 ∧ 1<4 ∧
    7047/4160=1 ∧ 7047%4160=2887 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 6164, atom 2245, type 0, source (20,85).
def leavesData70 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves70 : Fin 10 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 85 leaves70 i
def outputData70 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,21760,21824⟩) (.single ⟨5120,5184,21824,21888⟩)) (.node (.single ⟨5184,5248,21760,21824⟩) (.node (.single ⟨5184,5248,21824,21888⟩) (.single ⟨5120,5248,21888,22016⟩)))) (.node (.node (.single ⟨5248,5312,21760,21824⟩) (.single ⟨5248,5312,21824,21888⟩)) (.node (.single ⟨5312,5376,21760,21824⟩) (.node (.single ⟨5312,5376,21824,21888⟩) (.single ⟨5248,5376,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,27392,27520⟩) (.single ⟨10752,10880,27520,27648⟩)) (.node (.single ⟨10880,10944,27392,27456⟩) (.node (.single ⟨10880,10944,27456,27520⟩) (.single ⟨10944,11008,27392,27456⟩)))) (.node (.node (.single ⟨10944,11008,27456,27520⟩) (.single ⟨10880,10944,27520,27584⟩)) (.node (.single ⟨10880,10944,27584,27648⟩) (.node (.single ⟨10944,11008,27520,27584⟩) (.single ⟨10944,11008,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,5120,5184⟩) (.single ⟨21760,21824,5184,5248⟩)) (.node (.single ⟨21824,21888,5120,5184⟩) (.node (.single ⟨21824,21888,5184,5248⟩) (.single ⟨21760,21824,5248,5312⟩)))) (.node (.node (.single ⟨21760,21824,5312,5376⟩) (.single ⟨21824,21888,5248,5312⟩)) (.node (.single ⟨21824,21888,5312,5376⟩) (.node (.single ⟨21888,22016,5120,5248⟩) (.single ⟨21888,22016,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,10752,10880⟩) (.single ⟨27392,27456,10880,10944⟩)) (.node (.single ⟨27392,27456,10944,11008⟩) (.node (.single ⟨27456,27520,10880,10944⟩) (.single ⟨27456,27520,10944,11008⟩)))) (.node (.node (.single ⟨27520,27648,10752,10880⟩) (.single ⟨27520,27584,10880,10944⟩)) (.node (.single ⟨27520,27584,10944,11008⟩) (.node (.single ⟨27584,27648,10880,10944⟩) (.single ⟨27584,27648,10944,11008⟩)))))))
def output70 : Fin 40 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData70 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover70 (i : Fin 40) : Fin 40 := ⟨coverData70.get i % 40, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 40) : Fin 40 := ⟨sourceData70.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 (.cutY 22016 (.cutX 5376 (.cutY 21760 .empty (.cutX 5248 (.cutY 21888 (.cutX 5184 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 5312 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 .empty (.cutX 11008 (.cutY 27392 .empty (.cutX 10880 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 10944 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) (.cutX 10944 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty))) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 (.cutX 21760 .empty (.cutY 5376 (.cutX 21888 (.cutY 5248 (.cutX 21824 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 21824 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 .empty (.cutY 10752 .empty (.cutX 27392 .empty (.cutY 11008 (.cutX 27520 (.cutY 10880 .full (.cutX 27456 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 27584 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty)))) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata70 : 0<152546139 ∧ 20<128 ∧ 85<128 ∧ 0<4 ∧
    2245/4160=0 ∧ 2245%4160=2245 ∧ ∀ i, (leaves70 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData70).mp
    (by decide +kernel)

theorem sourceChecked70_0 : ∀ i : Fin 40,
    (fun i => output70 i = raw70 (source70 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked70 : ∀ i : Fin 40, (fun i => output70 i = raw70 (source70 i)) i :=
  forallFin_of_zero_offset (fun i => output70 i = raw70 (source70 i)) sourceChecked70_0

theorem coverChecked70_0 : ∀ i : Fin 40,
    (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked70 : ∀ i : Fin 40, (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) i :=
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 6165, atom 3165, type 0, source (32,93).
def leavesData71 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves71 : Fin 7 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 93 leaves71 i
def outputData71 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,23808,23936⟩) (.node (.single ⟨8192,8320,23936,24064⟩) (.single ⟨8320,8384,23808,23872⟩))) (.node (.node (.single ⟨8320,8384,23872,23936⟩) (.single ⟨8384,8448,23808,23872⟩)) (.node (.single ⟨8384,8448,23872,23936⟩) (.single ⟨8320,8448,23936,24064⟩)))) (.node (.node (.single ⟨8704,8832,24320,24448⟩) (.node (.single ⟨8704,8832,24448,24576⟩) (.single ⟨8832,8896,24320,24384⟩))) (.node (.node (.single ⟨8832,8896,24384,24448⟩) (.single ⟨8896,8960,24320,24384⟩)) (.node (.single ⟨8896,8960,24384,24448⟩) (.single ⟨8832,8960,24448,24576⟩))))) (.node (.node (.node (.single ⟨23808,23936,8192,8320⟩) (.node (.single ⟨23808,23872,8320,8384⟩) (.single ⟨23808,23872,8384,8448⟩))) (.node (.node (.single ⟨23872,23936,8320,8384⟩) (.single ⟨23872,23936,8384,8448⟩)) (.node (.single ⟨23936,24064,8192,8320⟩) (.single ⟨23936,24064,8320,8448⟩)))) (.node (.node (.single ⟨24320,24448,8704,8832⟩) (.node (.single ⟨24320,24384,8832,8896⟩) (.single ⟨24320,24384,8896,8960⟩))) (.node (.node (.single ⟨24384,24448,8832,8896⟩) (.single ⟨24384,24448,8896,8960⟩)) (.node (.single ⟨24448,24576,8704,8832⟩) (.single ⟨24448,24576,8832,8960⟩))))))
def output71 : Fin 28 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData71 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover71 (i : Fin 28) : Fin 28 := ⟨coverData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 28) : Fin 28 := ⟨sourceData71.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 (.cutY 24064 (.cutX 8448 (.cutY 23808 .empty (.cutX 8320 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 8384 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full))) .empty) .empty) (.cutY 24064 .empty (.cutX 8960 (.cutY 24320 .empty (.cutX 8832 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 8896 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))) .empty)))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 (.cutX 23808 .empty (.cutY 8448 (.cutX 23936 (.cutY 8320 .full (.cutX 23872 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty) (.cutY 8704 .empty (.cutX 24320 .empty (.cutY 8960 (.cutX 24448 (.cutY 8832 .full (.cutX 24384 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty)))) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata71 : 0<75538780 ∧ 32<128 ∧ 93<128 ∧ 0<4 ∧
    3165/4160=0 ∧ 3165%4160=3165 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 6166, atom 7447, type 1, source (34,91).
def leavesData72 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves72 : Fin 10 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 34 91 leaves72 i
def outputData72 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8704,8832,23296,23424⟩) (.single ⟨8704,8832,23424,23552⟩)) (.node (.single ⟨8832,8896,23296,23360⟩) (.node (.single ⟨8832,8896,23360,23424⟩) (.single ⟨8896,8928,23296,23328⟩)))) (.node (.node (.single ⟨8896,8928,23328,23360⟩) (.single ⟨8928,8960,23296,23328⟩)) (.node (.single ⟨8928,8960,23328,23360⟩) (.node (.single ⟨8896,8960,23360,23424⟩) (.single ⟨8832,8960,23424,23552⟩))))) (.node (.node (.node (.single ⟨9216,9344,23808,23936⟩) (.single ⟨9216,9344,23936,24064⟩)) (.node (.single ⟨9344,9408,23808,23872⟩) (.node (.single ⟨9344,9408,23872,23936⟩) (.single ⟨9408,9440,23808,23840⟩)))) (.node (.node (.single ⟨9408,9440,23840,23872⟩) (.single ⟨9440,9472,23808,23840⟩)) (.node (.single ⟨9440,9472,23840,23872⟩) (.node (.single ⟨9408,9472,23872,23936⟩) (.single ⟨9344,9472,23936,24064⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,8704,8832⟩) (.single ⟨23296,23360,8832,8896⟩)) (.node (.single ⟨23296,23328,8896,8928⟩) (.node (.single ⟨23296,23328,8928,8960⟩) (.single ⟨23328,23360,8896,8928⟩)))) (.node (.node (.single ⟨23328,23360,8928,8960⟩) (.single ⟨23360,23424,8832,8896⟩)) (.node (.single ⟨23360,23424,8896,8960⟩) (.node (.single ⟨23424,23552,8704,8832⟩) (.single ⟨23424,23552,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,9216,9344⟩) (.single ⟨23808,23872,9344,9408⟩)) (.node (.single ⟨23808,23840,9408,9440⟩) (.node (.single ⟨23808,23840,9440,9472⟩) (.single ⟨23840,23872,9408,9440⟩)))) (.node (.node (.single ⟨23840,23872,9440,9472⟩) (.single ⟨23872,23936,9344,9408⟩)) (.node (.single ⟨23872,23936,9408,9472⟩) (.node (.single ⟨23936,24064,9216,9344⟩) (.single ⟨23936,24064,9344,9472⟩)))))))
def output72 : Fin 40 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover72 (i : Fin 40) : Fin 40 := ⟨coverData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 40) : Fin 40 := ⟨sourceData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 .empty (.cutX 8960 (.cutY 23296 .empty (.cutX 8832 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 8896 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 8928 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full))) .empty))) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 (.cutX 9472 (.cutY 23808 .empty (.cutX 9344 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 9408 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 9440 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) .full))) .empty) .empty) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 .empty (.cutX 23296 .empty (.cutY 8960 (.cutX 23424 (.cutY 8832 .full (.cutX 23360 (.cutY 8896 .full (.cutX 23328 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty)))) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 (.cutX 23808 .empty (.cutY 9472 (.cutX 23936 (.cutY 9344 .full (.cutX 23872 (.cutY 9408 .full (.cutX 23840 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata72 : 0<67962893 ∧ 34<128 ∧ 91<128 ∧ 1<4 ∧
    7447/4160=1 ∧ 7447%4160=3287 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 6167, atom 7256, type 1, source (31,89).
def leavesData73 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves73 : Fin 19 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 31 89 leaves73 i
def outputData73 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨7936,8000,22784,22848⟩) (.single ⟨7936,8000,22848,22912⟩)) (.node (.single ⟨8000,8064,22784,22848⟩) (.single ⟨8000,8064,22848,22912⟩))) (.node (.node (.single ⟨7936,8064,22912,23040⟩) (.single ⟨8064,8096,22784,22816⟩)) (.node (.single ⟨8064,8096,22816,22848⟩) (.node (.single ⟨8096,8128,22784,22816⟩) (.single ⟨8096,8128,22816,22848⟩))))) (.node (.node (.node (.single ⟨8064,8128,22848,22912⟩) (.single ⟨8128,8160,22784,22816⟩)) (.node (.single ⟨8128,8160,22816,22848⟩) (.node (.single ⟨8160,8192,22784,22816⟩) (.single ⟨8160,8192,22816,22848⟩)))) (.node (.node (.single ⟨8128,8192,22848,22912⟩) (.single ⟨8064,8128,22912,22976⟩)) (.node (.single ⟨8064,8128,22976,23040⟩) (.node (.single ⟨8128,8192,22912,22976⟩) (.single ⟨8128,8192,22976,23040⟩)))))) (.node (.node (.node (.node (.single ⟨9728,9792,24576,24640⟩) (.single ⟨9728,9792,24640,24704⟩)) (.node (.single ⟨9792,9856,24576,24640⟩) (.single ⟨9792,9856,24640,24704⟩))) (.node (.node (.single ⟨9728,9856,24704,24832⟩) (.single ⟨9856,9920,24576,24640⟩)) (.node (.single ⟨9856,9920,24640,24704⟩) (.node (.single ⟨9920,9952,24576,24608⟩) (.single ⟨9920,9952,24608,24640⟩))))) (.node (.node (.node (.single ⟨9952,9984,24576,24608⟩) (.single ⟨9952,9984,24608,24640⟩)) (.node (.single ⟨9920,9952,24640,24672⟩) (.node (.single ⟨9920,9952,24672,24704⟩) (.single ⟨9952,9984,24640,24672⟩)))) (.node (.node (.single ⟨9952,9984,24672,24704⟩) (.single ⟨9856,9920,24704,24768⟩)) (.node (.single ⟨9856,9920,24768,24832⟩) (.node (.single ⟨9920,9984,24704,24768⟩) (.single ⟨9920,9984,24768,24832⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,7936,8000⟩) (.single ⟨22784,22848,8000,8064⟩)) (.node (.single ⟨22848,22912,7936,8000⟩) (.single ⟨22848,22912,8000,8064⟩))) (.node (.node (.single ⟨22784,22816,8064,8096⟩) (.single ⟨22784,22816,8096,8128⟩)) (.node (.single ⟨22816,22848,8064,8096⟩) (.node (.single ⟨22816,22848,8096,8128⟩) (.single ⟨22784,22816,8128,8160⟩))))) (.node (.node (.node (.single ⟨22784,22816,8160,8192⟩) (.single ⟨22816,22848,8128,8160⟩)) (.node (.single ⟨22816,22848,8160,8192⟩) (.node (.single ⟨22848,22912,8064,8128⟩) (.single ⟨22848,22912,8128,8192⟩)))) (.node (.node (.single ⟨22912,23040,7936,8064⟩) (.single ⟨22912,22976,8064,8128⟩)) (.node (.single ⟨22912,22976,8128,8192⟩) (.node (.single ⟨22976,23040,8064,8128⟩) (.single ⟨22976,23040,8128,8192⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,9728,9792⟩) (.single ⟨24576,24640,9792,9856⟩)) (.node (.single ⟨24640,24704,9728,9792⟩) (.single ⟨24640,24704,9792,9856⟩))) (.node (.node (.single ⟨24576,24640,9856,9920⟩) (.single ⟨24576,24608,9920,9952⟩)) (.node (.single ⟨24576,24608,9952,9984⟩) (.node (.single ⟨24608,24640,9920,9952⟩) (.single ⟨24608,24640,9952,9984⟩))))) (.node (.node (.node (.single ⟨24640,24704,9856,9920⟩) (.single ⟨24640,24672,9920,9952⟩)) (.node (.single ⟨24640,24672,9952,9984⟩) (.node (.single ⟨24672,24704,9920,9952⟩) (.single ⟨24672,24704,9952,9984⟩)))) (.node (.node (.single ⟨24704,24832,9728,9856⟩) (.single ⟨24704,24768,9856,9920⟩)) (.node (.single ⟨24704,24768,9920,9984⟩) (.node (.single ⟨24768,24832,9856,9920⟩) (.single ⟨24768,24832,9920,9984⟩))))))))
def output73 : Fin 76 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1))))) (.node (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39)))) (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.node (.single 41) (.single 72)))))) (.node (.node (.node (.node (.single 34) (.single 9)) (.node (.single 50) (.single 66))) (.node (.node (.single 25) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))) (.node (.node (.node (.single 15) (.single 53)) (.node (.single 60) (.node (.single 22) (.single 16)))) (.node (.node (.single 55) (.single 59)) (.node (.single 20) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 10))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 48))))) (.node (.node (.node (.single 64) (.single 27)) (.node (.single 12) (.node (.single 47) (.single 63)))) (.node (.node (.single 28) (.single 13)) (.node (.single 49) (.node (.single 62) (.single 26))))))))
def sourceData73 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.single 31))) (.node (.node (.single 3) (.single 27)) (.node (.single 23) (.node (.single 75) (.single 67))))) (.node (.node (.node (.single 71) (.single 63)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 61))))) (.node (.node (.node (.single 69) (.single 65)) (.node (.single 73) (.node (.single 21) (.single 25)))) (.node (.node (.single 1) (.single 29)) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 30))) (.node (.node (.single 26) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 22) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover73 (i : Fin 76) : Fin 76 := ⟨coverData73.get i % 76, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 76) : Fin 76 := ⟨sourceData73.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 .empty (.cutY 22784 .empty (.cutX 8064 (.cutY 22912 (.cutX 8000 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 8128 (.cutY 22848 (.cutX 8096 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full) (.cutY 22848 (.cutX 8160 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) (.cutX 8128 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 (.cutY 24832 (.cutX 9856 (.cutY 24704 (.cutX 9792 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 9920 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 9952 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) (.cutX 9952 (.cutY 24672 .full .full) (.cutY 24672 .full .full)))) (.cutX 9920 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 .empty (.cutY 7936 .empty (.cutX 22912 (.cutY 8064 (.cutX 22848 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 22848 (.cutY 8128 (.cutX 22816 (.cutY 8096 .full .full) (.cutY 8096 .full .full)) (.cutX 22816 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 22976 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 (.cutY 9984 (.cutX 24704 (.cutY 9856 (.cutX 24640 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 24640 (.cutY 9920 .full (.cutX 24608 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full (.cutX 24672 (.cutY 9952 .full .full) (.cutY 9952 .full .full))))) (.cutY 9856 .full (.cutX 24768 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata73 : 0<149239428 ∧ 31<128 ∧ 89<128 ∧ 1<4 ∧
    7256/4160=1 ∧ 7256%4160=3096 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 64,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked73_64 : ∀ i : Fin 12,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 76, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) (forallFinOffset_add (fun i => output73 i = raw73 (source73 i)) 0 64 12 (by decide) sourceChecked73_0
    sourceChecked73_64)

theorem coverChecked73_0 : ∀ i : Fin 64,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked73_64 : ∀ i : Fin 12,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 76, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
  forallFin_of_zero_offset (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (forallFinOffset_add (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) 0 64 12 (by decide) coverChecked73_0
    coverChecked73_64)

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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 6168, atom 7119, type 1, source (29,88).
def leavesData74 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves74 : Fin 7 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 88 leaves74 i
def outputData74 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,22528,22656⟩) (.node (.single ⟨7424,7552,22656,22784⟩) (.single ⟨7552,7616,22528,22592⟩))) (.node (.node (.single ⟨7552,7616,22592,22656⟩) (.single ⟨7616,7680,22528,22592⟩)) (.node (.single ⟨7616,7680,22592,22656⟩) (.single ⟨7552,7680,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,25088,25216⟩) (.node (.single ⟨9984,10112,25216,25344⟩) (.single ⟨10112,10176,25088,25152⟩))) (.node (.node (.single ⟨10112,10176,25152,25216⟩) (.single ⟨10176,10240,25088,25152⟩)) (.node (.single ⟨10176,10240,25152,25216⟩) (.single ⟨10112,10240,25216,25344⟩))))) (.node (.node (.node (.single ⟨22528,22656,7424,7552⟩) (.node (.single ⟨22528,22592,7552,7616⟩) (.single ⟨22528,22592,7616,7680⟩))) (.node (.node (.single ⟨22592,22656,7552,7616⟩) (.single ⟨22592,22656,7616,7680⟩)) (.node (.single ⟨22656,22784,7424,7552⟩) (.single ⟨22656,22784,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,9984,10112⟩) (.node (.single ⟨25088,25152,10112,10176⟩) (.single ⟨25088,25152,10176,10240⟩))) (.node (.node (.single ⟨25152,25216,10112,10176⟩) (.single ⟨25152,25216,10176,10240⟩)) (.node (.single ⟨25216,25344,9984,10112⟩) (.single ⟨25216,25344,10112,10240⟩))))))
def output74 : Fin 28 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover74 (i : Fin 28) : Fin 28 := ⟨coverData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 28) : Fin 28 := ⟨sourceData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 (.cutX 7424 .empty (.cutY 22784 (.cutX 7552 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 7616 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 .empty (.cutX 9984 .empty (.cutY 25344 (.cutX 10112 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 10176 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 (.cutX 22784 (.cutY 7424 .empty (.cutX 22656 (.cutY 7552 .full (.cutX 22592 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 .empty (.cutX 25344 (.cutY 9984 .empty (.cutX 25216 (.cutY 10112 .full (.cutX 25152 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata74 : 0<149239428 ∧ 29<128 ∧ 88<128 ∧ 1<4 ∧
    7119/4160=1 ∧ 7119%4160=2959 ∧ ∀ i, (leaves74 i).Valid 8 := by
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 6169, atom 5521, type 1, source (11,74).
def leavesData75 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves75 : Fin 4 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 74 leaves75 i
def outputData75 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,18944,19072⟩) (.single ⟨2816,2944,19072,19200⟩)) (.node (.single ⟨2944,3072,18944,19072⟩) (.single ⟨2944,3072,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,29696,29824⟩) (.single ⟨13568,13696,29824,29952⟩)) (.node (.single ⟨13696,13824,29696,29824⟩) (.single ⟨13696,13824,29824,29952⟩)))) (.node (.node (.node (.single ⟨18944,19072,2816,2944⟩) (.single ⟨18944,19072,2944,3072⟩)) (.node (.single ⟨19072,19200,2816,2944⟩) (.single ⟨19072,19200,2944,3072⟩))) (.node (.node (.single ⟨29696,29824,13568,13696⟩) (.single ⟨29696,29824,13696,13824⟩)) (.node (.single ⟨29824,29952,13568,13696⟩) (.single ⟨29824,29952,13696,13824⟩)))))
def output75 : Fin 16 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover75 (i : Fin 16) : Fin 16 := ⟨coverData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 16) : Fin 16 := ⟨sourceData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 .empty (.cutX 2816 .empty (.cutY 19200 (.cutX 2944 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty)))) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 (.cutX 13568 .empty (.cutY 29952 (.cutX 13696 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 .empty (.cutX 19200 (.cutY 2816 .empty (.cutX 19072 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 (.cutX 29952 (.cutY 13568 .empty (.cutX 29824 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty) .empty))) .empty) .empty))))) .empty))

theorem metadata75 : 0<94387549 ∧ 11<128 ∧ 74<128 ∧ 1<4 ∧
    5521/4160=1 ∧ 5521%4160=1361 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 6170, atom 1874, type 0, source (16,82).
def leavesData76 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves76 : Fin 7 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 82 leaves76 i
def outputData76 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,20992,21120⟩) (.node (.single ⟨4096,4224,21120,21248⟩) (.single ⟨4224,4288,20992,21056⟩))) (.node (.node (.single ⟨4224,4288,21056,21120⟩) (.single ⟨4288,4352,20992,21056⟩)) (.node (.single ⟨4288,4352,21056,21120⟩) (.single ⟨4224,4352,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,28416,28544⟩) (.node (.single ⟨11520,11648,28544,28672⟩) (.single ⟨11648,11712,28416,28480⟩))) (.node (.node (.single ⟨11648,11712,28480,28544⟩) (.single ⟨11712,11776,28416,28480⟩)) (.node (.single ⟨11712,11776,28480,28544⟩) (.single ⟨11648,11776,28544,28672⟩))))) (.node (.node (.node (.single ⟨20992,21120,4096,4224⟩) (.node (.single ⟨20992,21056,4224,4288⟩) (.single ⟨20992,21056,4288,4352⟩))) (.node (.node (.single ⟨21056,21120,4224,4288⟩) (.single ⟨21056,21120,4288,4352⟩)) (.node (.single ⟨21120,21248,4096,4224⟩) (.single ⟨21120,21248,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,11520,11648⟩) (.node (.single ⟨28416,28480,11648,11712⟩) (.single ⟨28416,28480,11712,11776⟩))) (.node (.node (.single ⟨28480,28544,11648,11712⟩) (.single ⟨28480,28544,11712,11776⟩)) (.node (.single ⟨28544,28672,11520,11648⟩) (.single ⟨28544,28672,11648,11776⟩))))))
def output76 : Fin 28 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData76 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover76 (i : Fin 28) : Fin 28 := ⟨coverData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 28) : Fin 28 := ⟨sourceData76.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 .empty (.cutX 4352 (.cutY 21248 (.cutX 4224 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 4288 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 .empty (.cutX 11520 .empty (.cutY 28416 .empty (.cutX 11648 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 11712 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 (.cutX 21248 (.cutY 4352 (.cutX 21120 (.cutY 4224 .full (.cutX 21056 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 (.cutX 28416 .empty (.cutY 11520 .empty (.cutX 28544 (.cutY 11648 .full (.cutX 28480 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty)))))) .empty) .empty))) .empty))

theorem metadata76 : 0<152546139 ∧ 16<128 ∧ 82<128 ∧ 0<4 ∧
    1874/4160=0 ∧ 1874%4160=1874 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 6171, atom 2741, type 0, source (26,89).
def leavesData77 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves77 : Fin 7 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 89 leaves77 i
def outputData77 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,22784,22912⟩) (.node (.single ⟨6656,6784,22912,23040⟩) (.single ⟨6784,6848,22784,22848⟩))) (.node (.node (.single ⟨6784,6848,22848,22912⟩) (.single ⟨6848,6912,22784,22848⟩)) (.node (.single ⟨6848,6912,22848,22912⟩) (.single ⟨6784,6912,22912,23040⟩)))) (.node (.node (.single ⟨9728,9856,25856,25984⟩) (.node (.single ⟨9728,9856,25984,26112⟩) (.single ⟨9856,9920,25856,25920⟩))) (.node (.node (.single ⟨9856,9920,25920,25984⟩) (.single ⟨9920,9984,25856,25920⟩)) (.node (.single ⟨9920,9984,25920,25984⟩) (.single ⟨9856,9984,25984,26112⟩))))) (.node (.node (.node (.single ⟨22784,22912,6656,6784⟩) (.node (.single ⟨22784,22848,6784,6848⟩) (.single ⟨22784,22848,6848,6912⟩))) (.node (.node (.single ⟨22848,22912,6784,6848⟩) (.single ⟨22848,22912,6848,6912⟩)) (.node (.single ⟨22912,23040,6656,6784⟩) (.single ⟨22912,23040,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,9728,9856⟩) (.node (.single ⟨25856,25920,9856,9920⟩) (.single ⟨25856,25920,9920,9984⟩))) (.node (.node (.single ⟨25920,25984,9856,9920⟩) (.single ⟨25920,25984,9920,9984⟩)) (.node (.single ⟨25984,26112,9728,9856⟩) (.single ⟨25984,26112,9856,9984⟩))))))
def output77 : Fin 28 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData77 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover77 (i : Fin 28) : Fin 28 := ⟨coverData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 28) : Fin 28 := ⟨sourceData77.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 (.cutX 6912 (.cutY 22784 .empty (.cutX 6784 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 6848 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full))) .empty) .empty)) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 (.cutX 9984 (.cutY 25856 .empty (.cutX 9856 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 9920 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full))) .empty) .empty)))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 .empty (.cutX 22784 .empty (.cutY 6912 (.cutX 22912 (.cutY 6784 .full (.cutX 22848 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 .empty (.cutX 25856 .empty (.cutY 9984 (.cutX 25984 (.cutY 9856 .full (.cutX 25920 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata77 : 0<145899414 ∧ 26<128 ∧ 89<128 ∧ 0<4 ∧
    2741/4160=0 ∧ 2741%4160=2741 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 6172, atom 6220, type 1, source (18,80).
def leavesData78 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves78 : Fin 13 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 80 leaves78 i
def outputData78 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,20480,20544⟩) (.node (.single ⟨4608,4672,20544,20608⟩) (.single ⟨4672,4736,20480,20544⟩))) (.node (.single ⟨4672,4736,20544,20608⟩) (.node (.single ⟨4608,4736,20608,20736⟩) (.single ⟨4736,4800,20480,20544⟩)))) (.node (.node (.single ⟨4736,4800,20544,20608⟩) (.node (.single ⟨4800,4832,20480,20512⟩) (.single ⟨4800,4832,20512,20544⟩))) (.node (.node (.single ⟨4832,4864,20480,20512⟩) (.single ⟨4832,4864,20512,20544⟩)) (.node (.single ⟨4800,4864,20544,20608⟩) (.single ⟨4736,4864,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,27904,28032⟩) (.node (.single ⟨12032,12160,28032,28160⟩) (.single ⟨12160,12224,27904,27968⟩))) (.node (.single ⟨12160,12224,27968,28032⟩) (.node (.single ⟨12224,12256,27904,27936⟩) (.single ⟨12224,12256,27936,27968⟩)))) (.node (.node (.single ⟨12256,12288,27904,27936⟩) (.node (.single ⟨12256,12288,27936,27968⟩) (.single ⟨12224,12288,27968,28032⟩))) (.node (.node (.single ⟨12160,12224,28032,28096⟩) (.single ⟨12160,12224,28096,28160⟩)) (.node (.single ⟨12224,12288,28032,28096⟩) (.single ⟨12224,12288,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,4608,4672⟩) (.node (.single ⟨20480,20544,4672,4736⟩) (.single ⟨20544,20608,4608,4672⟩))) (.node (.single ⟨20544,20608,4672,4736⟩) (.node (.single ⟨20480,20544,4736,4800⟩) (.single ⟨20480,20512,4800,4832⟩)))) (.node (.node (.single ⟨20480,20512,4832,4864⟩) (.node (.single ⟨20512,20544,4800,4832⟩) (.single ⟨20512,20544,4832,4864⟩))) (.node (.node (.single ⟨20544,20608,4736,4800⟩) (.single ⟨20544,20608,4800,4864⟩)) (.node (.single ⟨20608,20736,4608,4736⟩) (.single ⟨20608,20736,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,12032,12160⟩) (.node (.single ⟨27904,27968,12160,12224⟩) (.single ⟨27904,27936,12224,12256⟩))) (.node (.single ⟨27904,27936,12256,12288⟩) (.node (.single ⟨27936,27968,12224,12256⟩) (.single ⟨27936,27968,12256,12288⟩)))) (.node (.node (.single ⟨27968,28032,12160,12224⟩) (.node (.single ⟨27968,28032,12224,12288⟩) (.single ⟨28032,28160,12032,12160⟩))) (.node (.node (.single ⟨28032,28096,12160,12224⟩) (.single ⟨28032,28096,12224,12288⟩)) (.node (.single ⟨28096,28160,12160,12224⟩) (.single ⟨28096,28160,12224,12288⟩)))))))
def output78 : Fin 52 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover78 (i : Fin 52) : Fin 52 := ⟨coverData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 52) : Fin 52 := ⟨sourceData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 (.cutY 20736 (.cutX 4736 (.cutY 20608 (.cutX 4672 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 4800 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 4832 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 .empty (.cutY 27904 .empty (.cutX 12160 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 12224 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 12256 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 12224 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 (.cutY 4864 (.cutX 20608 (.cutY 4736 (.cutX 20544 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 20544 (.cutY 4800 .full (.cutX 20512 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 .empty (.cutY 12032 .empty (.cutX 28032 (.cutY 12160 .full (.cutX 27968 (.cutY 12224 .full (.cutX 27936 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 28096 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))) .empty))))) .empty) .empty))) .empty))

theorem metadata78 : 0<125829407 ∧ 18<128 ∧ 80<128 ∧ 1<4 ∧
    6220/4160=1 ∧ 6220%4160=2060 ∧ ∀ i, (leaves78 i).Valid 8 := by
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 6173, atom 7507, type 1, source (35,92).
def leavesData79 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves79 : Fin 16 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 35 92 leaves79 i
def outputData79 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨8960,9024,23552,23616⟩) (.single ⟨8960,9024,23616,23680⟩)) (.node (.single ⟨9024,9088,23552,23616⟩) (.single ⟨9024,9088,23616,23680⟩))) (.node (.node (.single ⟨8960,9088,23680,23808⟩) (.single ⟨9088,9152,23552,23616⟩)) (.node (.single ⟨9088,9152,23616,23680⟩) (.single ⟨9152,9184,23552,23584⟩)))) (.node (.node (.node (.single ⟨9152,9184,23584,23616⟩) (.single ⟨9184,9216,23552,23584⟩)) (.node (.single ⟨9184,9216,23584,23616⟩) (.single ⟨9152,9216,23616,23680⟩))) (.node (.node (.single ⟨9088,9152,23680,23744⟩) (.single ⟨9088,9152,23744,23808⟩)) (.node (.single ⟨9152,9216,23680,23744⟩) (.single ⟨9152,9216,23744,23808⟩))))) (.node (.node (.node (.node (.single ⟨23552,23616,8960,9024⟩) (.single ⟨23552,23616,9024,9088⟩)) (.node (.single ⟨23616,23680,8960,9024⟩) (.single ⟨23616,23680,9024,9088⟩))) (.node (.node (.single ⟨23552,23616,9088,9152⟩) (.single ⟨23552,23584,9152,9184⟩)) (.node (.single ⟨23552,23584,9184,9216⟩) (.single ⟨23584,23616,9152,9184⟩)))) (.node (.node (.node (.single ⟨23584,23616,9184,9216⟩) (.single ⟨23616,23680,9088,9152⟩)) (.node (.single ⟨23616,23680,9152,9216⟩) (.single ⟨23680,23808,8960,9088⟩))) (.node (.node (.single ⟨23680,23744,9088,9152⟩) (.single ⟨23680,23744,9152,9216⟩)) (.node (.single ⟨23744,23808,9088,9152⟩) (.single ⟨23744,23808,9152,9216⟩))))))
def output79 : Fin 32 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5))))) (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15))) (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13)))) (.node (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))) (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12)))))) (.node (.node (.node (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3))) (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData79 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))))) (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 9)) (.node (.single 6) (.single 1))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18))))))
def cover79 (i : Fin 64) : Fin 32 := ⟨coverData79.get i % 32, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 32) : Fin 64 := ⟨sourceData79.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 .empty (.cutY 24064 (.cutX 8960 .empty (.cutY 23808 (.cutX 9088 (.cutY 23680 (.cutX 9024 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 9152 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 9184 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) (.cutX 9152 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty)) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 .empty (.cutX 23808 (.cutY 8960 .empty (.cutX 23680 (.cutY 9088 (.cutX 23616 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 23616 (.cutY 9152 .full (.cutX 23584 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 23744 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))) .empty)) .empty) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata79 : 0<67962893 ∧ 35<128 ∧ 92<128 ∧ 1<4 ∧
    7507/4160=1 ∧ 7507%4160=3347 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 32,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 32, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 64,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 64, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
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

theorem areaUnits79 : gridUnionAreaUnits output79 = 131072 := by decide +kernel

noncomputable def phaseMass79 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (67962893/3276800000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 6174, atom 2817, type 0, source (27,90).
def leavesData80 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves80 : Fin 7 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 90 leaves80 i
def outputData80 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,23040,23168⟩) (.node (.single ⟨6912,7040,23168,23296⟩) (.single ⟨7040,7104,23040,23104⟩))) (.node (.node (.single ⟨7040,7104,23104,23168⟩) (.single ⟨7104,7168,23040,23104⟩)) (.node (.single ⟨7104,7168,23104,23168⟩) (.single ⟨7040,7168,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,25600,25728⟩) (.node (.single ⟨9472,9600,25728,25856⟩) (.single ⟨9600,9664,25600,25664⟩))) (.node (.node (.single ⟨9600,9664,25664,25728⟩) (.single ⟨9664,9728,25600,25664⟩)) (.node (.single ⟨9664,9728,25664,25728⟩) (.single ⟨9600,9728,25728,25856⟩))))) (.node (.node (.node (.single ⟨23040,23168,6912,7040⟩) (.node (.single ⟨23040,23104,7040,7104⟩) (.single ⟨23040,23104,7104,7168⟩))) (.node (.node (.single ⟨23104,23168,7040,7104⟩) (.single ⟨23104,23168,7104,7168⟩)) (.node (.single ⟨23168,23296,6912,7040⟩) (.single ⟨23168,23296,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,9472,9600⟩) (.node (.single ⟨25600,25664,9600,9664⟩) (.single ⟨25600,25664,9664,9728⟩))) (.node (.node (.single ⟨25664,25728,9600,9664⟩) (.single ⟨25664,25728,9664,9728⟩)) (.node (.single ⟨25728,25856,9472,9600⟩) (.single ⟨25728,25856,9600,9728⟩))))))
def output80 : Fin 28 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover80 (i : Fin 28) : Fin 28 := ⟨coverData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 28) : Fin 28 := ⟨sourceData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 .empty (.cutX 6912 .empty (.cutY 23296 (.cutX 7040 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 7104 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty)))) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 (.cutY 26112 (.cutX 9472 .empty (.cutY 25856 (.cutX 9600 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 9664 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 .empty (.cutY 6656 .empty (.cutX 23296 (.cutY 6912 .empty (.cutX 23168 (.cutY 7040 .full (.cutX 23104 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 (.cutX 25856 (.cutY 9472 .empty (.cutX 25728 (.cutY 9600 .full (.cutX 25664 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata80 : 0<145899414 ∧ 27<128 ∧ 90<128 ∧ 0<4 ∧
    2817/4160=0 ∧ 2817%4160=2817 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 6175, atom 1970, type 0, source (17,83).
def leavesData81 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves81 : Fin 7 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 17 83 leaves81 i
def outputData81 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4352,4480,21248,21376⟩) (.node (.single ⟨4352,4480,21376,21504⟩) (.single ⟨4480,4544,21248,21312⟩))) (.node (.node (.single ⟨4480,4544,21312,21376⟩) (.single ⟨4544,4608,21248,21312⟩)) (.node (.single ⟨4544,4608,21312,21376⟩) (.single ⟨4480,4608,21376,21504⟩)))) (.node (.node (.single ⟨11264,11392,28160,28288⟩) (.node (.single ⟨11264,11392,28288,28416⟩) (.single ⟨11392,11456,28160,28224⟩))) (.node (.node (.single ⟨11392,11456,28224,28288⟩) (.single ⟨11456,11520,28160,28224⟩)) (.node (.single ⟨11456,11520,28224,28288⟩) (.single ⟨11392,11520,28288,28416⟩))))) (.node (.node (.node (.single ⟨21248,21376,4352,4480⟩) (.node (.single ⟨21248,21312,4480,4544⟩) (.single ⟨21248,21312,4544,4608⟩))) (.node (.node (.single ⟨21312,21376,4480,4544⟩) (.single ⟨21312,21376,4544,4608⟩)) (.node (.single ⟨21376,21504,4352,4480⟩) (.single ⟨21376,21504,4480,4608⟩)))) (.node (.node (.single ⟨28160,28288,11264,11392⟩) (.node (.single ⟨28160,28224,11392,11456⟩) (.single ⟨28160,28224,11456,11520⟩))) (.node (.node (.single ⟨28224,28288,11392,11456⟩) (.single ⟨28224,28288,11456,11520⟩)) (.node (.single ⟨28288,28416,11264,11392⟩) (.single ⟨28288,28416,11392,11520⟩))))))
def output81 : Fin 28 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover81 (i : Fin 28) : Fin 28 := ⟨coverData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 28) : Fin 28 := ⟨sourceData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 .empty (.cutX 4352 .empty (.cutY 21248 .empty (.cutX 4480 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 4544 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full))))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 .empty (.cutX 11520 (.cutY 28416 (.cutX 11392 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 11456 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty) .empty)) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 (.cutX 21248 .empty (.cutY 4352 .empty (.cutX 21376 (.cutY 4480 .full (.cutX 21312 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 (.cutX 28416 (.cutY 11520 (.cutX 28288 (.cutY 11392 .full (.cutX 28224 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty)))))) .empty) .empty))) .empty))

theorem metadata81 : 0<152546139 ∧ 17<128 ∧ 83<128 ∧ 0<4 ∧
    1970/4160=0 ∧ 1970%4160=1970 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 6176, atom 6820, type 1, source (25,85).
def leavesData82 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves82 : Fin 13 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 85 leaves82 i
def outputData82 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,21760,21824⟩) (.node (.single ⟨6400,6464,21824,21888⟩) (.single ⟨6464,6528,21760,21824⟩))) (.node (.single ⟨6464,6528,21824,21888⟩) (.node (.single ⟨6400,6528,21888,22016⟩) (.single ⟨6528,6592,21760,21824⟩)))) (.node (.node (.single ⟨6528,6592,21824,21888⟩) (.node (.single ⟨6592,6624,21760,21792⟩) (.single ⟨6592,6624,21792,21824⟩))) (.node (.node (.single ⟨6624,6656,21760,21792⟩) (.single ⟨6624,6656,21792,21824⟩)) (.node (.single ⟨6592,6656,21824,21888⟩) (.single ⟨6528,6656,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,26112,26240⟩) (.node (.single ⟨10752,10880,26240,26368⟩) (.single ⟨10880,10944,26112,26176⟩))) (.node (.single ⟨10880,10944,26176,26240⟩) (.node (.single ⟨10944,10976,26112,26144⟩) (.single ⟨10944,10976,26144,26176⟩)))) (.node (.node (.single ⟨10976,11008,26112,26144⟩) (.node (.single ⟨10976,11008,26144,26176⟩) (.single ⟨10944,11008,26176,26240⟩))) (.node (.node (.single ⟨10880,10944,26240,26304⟩) (.single ⟨10880,10944,26304,26368⟩)) (.node (.single ⟨10944,11008,26240,26304⟩) (.single ⟨10944,11008,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,6400,6464⟩) (.node (.single ⟨21760,21824,6464,6528⟩) (.single ⟨21824,21888,6400,6464⟩))) (.node (.single ⟨21824,21888,6464,6528⟩) (.node (.single ⟨21760,21824,6528,6592⟩) (.single ⟨21760,21792,6592,6624⟩)))) (.node (.node (.single ⟨21760,21792,6624,6656⟩) (.node (.single ⟨21792,21824,6592,6624⟩) (.single ⟨21792,21824,6624,6656⟩))) (.node (.node (.single ⟨21824,21888,6528,6592⟩) (.single ⟨21824,21888,6592,6656⟩)) (.node (.single ⟨21888,22016,6400,6528⟩) (.single ⟨21888,22016,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,10752,10880⟩) (.node (.single ⟨26112,26176,10880,10944⟩) (.single ⟨26112,26144,10944,10976⟩))) (.node (.single ⟨26112,26144,10976,11008⟩) (.node (.single ⟨26144,26176,10944,10976⟩) (.single ⟨26144,26176,10976,11008⟩)))) (.node (.node (.single ⟨26176,26240,10880,10944⟩) (.node (.single ⟨26176,26240,10944,11008⟩) (.single ⟨26240,26368,10752,10880⟩))) (.node (.node (.single ⟨26240,26304,10880,10944⟩) (.single ⟨26240,26304,10944,11008⟩)) (.node (.single ⟨26304,26368,10880,10944⟩) (.single ⟨26304,26368,10944,11008⟩)))))))
def output82 : Fin 52 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData82 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover82 (i : Fin 52) : Fin 52 := ⟨coverData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 52) : Fin 52 := ⟨sourceData82.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 .empty (.cutY 21760 .empty (.cutX 6528 (.cutY 21888 (.cutX 6464 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6592 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 6624 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 (.cutY 26368 (.cutX 10880 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 10944 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 10976 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 10944 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 .empty (.cutY 6400 .empty (.cutX 21888 (.cutY 6528 (.cutX 21824 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21824 (.cutY 6592 .full (.cutX 21792 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 (.cutY 11008 (.cutX 26240 (.cutY 10880 .full (.cutX 26176 (.cutY 10944 .full (.cutX 26144 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26304 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty) .empty))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata82 : 0<144359671 ∧ 25<128 ∧ 85<128 ∧ 1<4 ∧
    6820/4160=1 ∧ 6820%4160=2660 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 6177, atom 3032, type 0, source (30,92).
def leavesData83 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves83 : Fin 10 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 30 92 leaves83 i
def outputData83 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,23552,23616⟩) (.single ⟨7680,7744,23616,23680⟩)) (.node (.single ⟨7744,7808,23552,23616⟩) (.node (.single ⟨7744,7808,23616,23680⟩) (.single ⟨7680,7808,23680,23808⟩)))) (.node (.node (.single ⟨7808,7872,23552,23616⟩) (.single ⟨7808,7872,23616,23680⟩)) (.node (.single ⟨7872,7936,23552,23616⟩) (.node (.single ⟨7872,7936,23616,23680⟩) (.single ⟨7808,7936,23680,23808⟩))))) (.node (.node (.node (.single ⟨8960,9088,24832,24960⟩) (.single ⟨8960,9088,24960,25088⟩)) (.node (.single ⟨9088,9152,24832,24896⟩) (.node (.single ⟨9088,9152,24896,24960⟩) (.single ⟨9152,9216,24832,24896⟩)))) (.node (.node (.single ⟨9152,9216,24896,24960⟩) (.single ⟨9088,9152,24960,25024⟩)) (.node (.single ⟨9088,9152,25024,25088⟩) (.node (.single ⟨9152,9216,24960,25024⟩) (.single ⟨9152,9216,25024,25088⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,7680,7744⟩) (.single ⟨23552,23616,7744,7808⟩)) (.node (.single ⟨23616,23680,7680,7744⟩) (.node (.single ⟨23616,23680,7744,7808⟩) (.single ⟨23552,23616,7808,7872⟩)))) (.node (.node (.single ⟨23552,23616,7872,7936⟩) (.single ⟨23616,23680,7808,7872⟩)) (.node (.single ⟨23616,23680,7872,7936⟩) (.node (.single ⟨23680,23808,7680,7808⟩) (.single ⟨23680,23808,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,8960,9088⟩) (.single ⟨24832,24896,9088,9152⟩)) (.node (.single ⟨24832,24896,9152,9216⟩) (.node (.single ⟨24896,24960,9088,9152⟩) (.single ⟨24896,24960,9152,9216⟩)))) (.node (.node (.single ⟨24960,25088,8960,9088⟩) (.single ⟨24960,25024,9088,9152⟩)) (.node (.single ⟨24960,25024,9152,9216⟩) (.node (.single ⟨25024,25088,9088,9152⟩) (.single ⟨25024,25088,9152,9216⟩)))))))
def output83 : Fin 40 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover83 (i : Fin 40) : Fin 40 := ⟨coverData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 40) : Fin 40 := ⟨sourceData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 .empty (.cutX 7680 .empty (.cutY 24064 (.cutX 7936 (.cutY 23808 (.cutX 7808 (.cutY 23680 (.cutX 7744 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 7872 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty)))))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 (.cutX 8704 .empty (.cutY 25088 (.cutX 8960 .empty (.cutY 24832 .empty (.cutX 9088 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 9152 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) (.cutX 9152 (.cutY 25024 .full .full) (.cutY 25024 .full .full)))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 .empty (.cutX 24064 (.cutY 7680 .empty (.cutX 23808 (.cutY 7936 (.cutX 23680 (.cutY 7808 (.cutX 23616 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 23616 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)) .empty))))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 (.cutX 25088 (.cutY 8704 .empty (.cutX 24832 .empty (.cutY 8960 .empty (.cutX 24960 (.cutY 9088 .full (.cutX 24896 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 25024 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata83 : 0<145899414 ∧ 30<128 ∧ 92<128 ∧ 0<4 ∧
    3032/4160=0 ∧ 3032%4160=3032 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 6178, atom 3229, type 0, source (33,94).
def leavesData84 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves84 : Fin 16 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 33 94 leaves84 i
def outputData84 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨8448,8512,24064,24128⟩) (.single ⟨8448,8512,24128,24192⟩)) (.node (.single ⟨8512,8576,24064,24128⟩) (.single ⟨8512,8576,24128,24192⟩))) (.node (.node (.single ⟨8448,8576,24192,24320⟩) (.single ⟨8576,8640,24064,24128⟩)) (.node (.single ⟨8576,8640,24128,24192⟩) (.single ⟨8640,8672,24064,24096⟩)))) (.node (.node (.node (.single ⟨8640,8672,24096,24128⟩) (.single ⟨8672,8704,24064,24096⟩)) (.node (.single ⟨8672,8704,24096,24128⟩) (.single ⟨8640,8704,24128,24192⟩))) (.node (.node (.single ⟨8576,8640,24192,24256⟩) (.single ⟨8576,8640,24256,24320⟩)) (.node (.single ⟨8640,8704,24192,24256⟩) (.single ⟨8640,8704,24256,24320⟩))))) (.node (.node (.node (.node (.single ⟨24064,24128,8448,8512⟩) (.single ⟨24064,24128,8512,8576⟩)) (.node (.single ⟨24128,24192,8448,8512⟩) (.single ⟨24128,24192,8512,8576⟩))) (.node (.node (.single ⟨24064,24128,8576,8640⟩) (.single ⟨24064,24096,8640,8672⟩)) (.node (.single ⟨24064,24096,8672,8704⟩) (.single ⟨24096,24128,8640,8672⟩)))) (.node (.node (.node (.single ⟨24096,24128,8672,8704⟩) (.single ⟨24128,24192,8576,8640⟩)) (.node (.single ⟨24128,24192,8640,8704⟩) (.single ⟨24192,24320,8448,8576⟩))) (.node (.node (.single ⟨24192,24256,8576,8640⟩) (.single ⟨24192,24256,8640,8704⟩)) (.node (.single ⟨24256,24320,8576,8640⟩) (.single ⟨24256,24320,8640,8704⟩))))))
def output84 : Fin 32 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15)))) (.node (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13))) (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))))) (.node (.node (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3)))))) (.node (.node (.node (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData84 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))) (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 25)) (.node (.single 22) (.single 1))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))
def cover84 (i : Fin 64) : Fin 32 := ⟨coverData84.get i % 32, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 32) : Fin 64 := ⟨sourceData84.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 (.cutY 24064 .empty (.cutX 8448 .empty (.cutY 24320 (.cutX 8576 (.cutY 24192 (.cutX 8512 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 8640 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 8672 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 8640 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))) .empty)) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 .empty (.cutY 8704 (.cutX 24320 (.cutY 8448 .empty (.cutX 24192 (.cutY 8576 (.cutX 24128 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 24128 (.cutY 8640 .full (.cutX 24096 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 24256 (.cutY 8640 .full .full) (.cutY 8640 .full .full))))) .empty) .empty)) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata84 : 0<75538780 ∧ 33<128 ∧ 94<128 ∧ 0<4 ∧
    3229/4160=0 ∧ 3229%4160=3229 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 32,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 32, (fun i => output84 i = raw84 (source84 i)) i :=
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

theorem areaUnits84 : gridUnionAreaUnits output84 = 131072 := by decide +kernel

noncomputable def phaseMass84 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (3776939/163840000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 6179, atom 2502, type 0, source (23,87).
def leavesData85 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves85 : Fin 10 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 87 leaves85 i
def outputData85 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,22272,22336⟩) (.single ⟨5888,5952,22336,22400⟩)) (.node (.single ⟨5952,6016,22272,22336⟩) (.node (.single ⟨5952,6016,22336,22400⟩) (.single ⟨5888,6016,22400,22528⟩)))) (.node (.node (.single ⟨6016,6080,22272,22336⟩) (.single ⟨6016,6080,22336,22400⟩)) (.node (.single ⟨6080,6144,22272,22336⟩) (.node (.single ⟨6080,6144,22336,22400⟩) (.single ⟨6016,6144,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,26624,26752⟩) (.single ⟨10240,10368,26752,26880⟩)) (.node (.single ⟨10368,10432,26624,26688⟩) (.node (.single ⟨10368,10432,26688,26752⟩) (.single ⟨10432,10496,26624,26688⟩)))) (.node (.node (.single ⟨10432,10496,26688,26752⟩) (.single ⟨10368,10432,26752,26816⟩)) (.node (.single ⟨10368,10432,26816,26880⟩) (.node (.single ⟨10432,10496,26752,26816⟩) (.single ⟨10432,10496,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22336,5888,5952⟩) (.single ⟨22272,22336,5952,6016⟩)) (.node (.single ⟨22336,22400,5888,5952⟩) (.node (.single ⟨22336,22400,5952,6016⟩) (.single ⟨22272,22336,6016,6080⟩)))) (.node (.node (.single ⟨22272,22336,6080,6144⟩) (.single ⟨22336,22400,6016,6080⟩)) (.node (.single ⟨22336,22400,6080,6144⟩) (.node (.single ⟨22400,22528,5888,6016⟩) (.single ⟨22400,22528,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,10240,10368⟩) (.single ⟨26624,26688,10368,10432⟩)) (.node (.single ⟨26624,26688,10432,10496⟩) (.node (.single ⟨26688,26752,10368,10432⟩) (.single ⟨26688,26752,10432,10496⟩)))) (.node (.node (.single ⟨26752,26880,10240,10368⟩) (.single ⟨26752,26816,10368,10432⟩)) (.node (.single ⟨26752,26816,10432,10496⟩) (.node (.single ⟨26816,26880,10368,10432⟩) (.single ⟨26816,26880,10432,10496⟩)))))))
def output85 : Fin 40 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover85 (i : Fin 40) : Fin 40 := ⟨coverData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 40) : Fin 40 := ⟨sourceData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 .empty (.cutX 5888 .empty (.cutY 22272 .empty (.cutX 6016 (.cutY 22400 (.cutX 5952 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 6080 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full)))))))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 (.cutY 27136 (.cutX 10496 (.cutY 26880 (.cutX 10368 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 10432 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 10432 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 .empty (.cutY 5632 .empty (.cutX 22272 .empty (.cutY 5888 .empty (.cutX 22400 (.cutY 6016 (.cutX 22336 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 22336 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full)))))))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 (.cutX 26880 (.cutY 10496 (.cutX 26752 (.cutY 10368 .full (.cutX 26688 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 26816 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata85 : 0<152546139 ∧ 23<128 ∧ 87<128 ∧ 0<4 ∧
    2502/4160=0 ∧ 2502%4160=2502 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 6180, atom 2333, type 0, source (21,86).
def leavesData86 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves86 : Fin 10 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 86 leaves86 i
def outputData86 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,22016,22080⟩) (.single ⟨5376,5440,22080,22144⟩)) (.node (.single ⟨5440,5504,22016,22080⟩) (.node (.single ⟨5440,5504,22080,22144⟩) (.single ⟨5376,5504,22144,22272⟩)))) (.node (.node (.single ⟨5504,5568,22016,22080⟩) (.single ⟨5504,5568,22080,22144⟩)) (.node (.single ⟨5568,5632,22016,22080⟩) (.node (.single ⟨5568,5632,22080,22144⟩) (.single ⟨5504,5632,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,27136,27264⟩) (.single ⟨10496,10624,27264,27392⟩)) (.node (.single ⟨10624,10688,27136,27200⟩) (.node (.single ⟨10624,10688,27200,27264⟩) (.single ⟨10688,10752,27136,27200⟩)))) (.node (.node (.single ⟨10688,10752,27200,27264⟩) (.single ⟨10624,10688,27264,27328⟩)) (.node (.single ⟨10624,10688,27328,27392⟩) (.node (.single ⟨10688,10752,27264,27328⟩) (.single ⟨10688,10752,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,5376,5440⟩) (.single ⟨22016,22080,5440,5504⟩)) (.node (.single ⟨22080,22144,5376,5440⟩) (.node (.single ⟨22080,22144,5440,5504⟩) (.single ⟨22016,22080,5504,5568⟩)))) (.node (.node (.single ⟨22016,22080,5568,5632⟩) (.single ⟨22080,22144,5504,5568⟩)) (.node (.single ⟨22080,22144,5568,5632⟩) (.node (.single ⟨22144,22272,5376,5504⟩) (.single ⟨22144,22272,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,10496,10624⟩) (.single ⟨27136,27200,10624,10688⟩)) (.node (.single ⟨27136,27200,10688,10752⟩) (.node (.single ⟨27200,27264,10624,10688⟩) (.single ⟨27200,27264,10688,10752⟩)))) (.node (.node (.single ⟨27264,27392,10496,10624⟩) (.single ⟨27264,27328,10624,10688⟩)) (.node (.single ⟨27264,27328,10688,10752⟩) (.node (.single ⟨27328,27392,10624,10688⟩) (.single ⟨27328,27392,10688,10752⟩)))))))
def output86 : Fin 40 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover86 (i : Fin 40) : Fin 40 := ⟨coverData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 40) : Fin 40 := ⟨sourceData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 (.cutY 22016 .empty (.cutX 5376 .empty (.cutY 22272 (.cutX 5504 (.cutY 22144 (.cutX 5440 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 5568 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))) .empty))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 (.cutY 27136 .empty (.cutX 10496 .empty (.cutY 27392 (.cutX 10624 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 10688 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 10688 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty))) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 .empty (.cutY 5632 (.cutX 22272 (.cutY 5376 .empty (.cutX 22144 (.cutY 5504 (.cutX 22080 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 22080 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 .empty (.cutY 10752 (.cutX 27392 (.cutY 10496 .empty (.cutX 27264 (.cutY 10624 .full (.cutX 27200 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 27328 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty)) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata86 : 0<152546139 ∧ 21<128 ∧ 86<128 ∧ 0<4 ∧
    2333/4160=0 ∧ 2333%4160=2333 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 6181, atom 2064, type 0, source (18,84).
def leavesData87 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves87 : Fin 10 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 84 leaves87 i
def outputData87 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,21504,21568⟩) (.single ⟨4608,4672,21568,21632⟩)) (.node (.single ⟨4672,4736,21504,21568⟩) (.node (.single ⟨4672,4736,21568,21632⟩) (.single ⟨4608,4736,21632,21760⟩)))) (.node (.node (.single ⟨4736,4800,21504,21568⟩) (.single ⟨4736,4800,21568,21632⟩)) (.node (.single ⟨4800,4864,21504,21568⟩) (.node (.single ⟨4800,4864,21568,21632⟩) (.single ⟨4736,4864,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,27904,28032⟩) (.single ⟨11008,11136,28032,28160⟩)) (.node (.single ⟨11136,11200,27904,27968⟩) (.node (.single ⟨11136,11200,27968,28032⟩) (.single ⟨11200,11264,27904,27968⟩)))) (.node (.node (.single ⟨11200,11264,27968,28032⟩) (.single ⟨11136,11200,28032,28096⟩)) (.node (.single ⟨11136,11200,28096,28160⟩) (.node (.single ⟨11200,11264,28032,28096⟩) (.single ⟨11200,11264,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,4608,4672⟩) (.single ⟨21504,21568,4672,4736⟩)) (.node (.single ⟨21568,21632,4608,4672⟩) (.node (.single ⟨21568,21632,4672,4736⟩) (.single ⟨21504,21568,4736,4800⟩)))) (.node (.node (.single ⟨21504,21568,4800,4864⟩) (.single ⟨21568,21632,4736,4800⟩)) (.node (.single ⟨21568,21632,4800,4864⟩) (.node (.single ⟨21632,21760,4608,4736⟩) (.single ⟨21632,21760,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,11008,11136⟩) (.single ⟨27904,27968,11136,11200⟩)) (.node (.single ⟨27904,27968,11200,11264⟩) (.node (.single ⟨27968,28032,11136,11200⟩) (.single ⟨27968,28032,11200,11264⟩)))) (.node (.node (.single ⟨28032,28160,11008,11136⟩) (.single ⟨28032,28096,11136,11200⟩)) (.node (.single ⟨28032,28096,11200,11264⟩) (.node (.single ⟨28096,28160,11136,11200⟩) (.single ⟨28096,28160,11200,11264⟩)))))))
def output87 : Fin 40 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover87 (i : Fin 40) : Fin 40 := ⟨coverData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 40) : Fin 40 := ⟨sourceData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 .empty (.cutY 22016 (.cutX 4864 (.cutY 21760 (.cutX 4736 (.cutY 21632 (.cutX 4672 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 4800 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 (.cutX 11008 .empty (.cutY 27904 .empty (.cutX 11136 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 11200 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) (.cutX 11200 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 .empty (.cutX 21760 (.cutY 4864 (.cutX 21632 (.cutY 4736 (.cutX 21568 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 21568 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 (.cutY 10752 .empty (.cutX 27904 .empty (.cutY 11008 .empty (.cutX 28032 (.cutY 11136 .full (.cutX 27968 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 28096 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))))) .empty) .empty)))) .empty) .empty))) .empty))

theorem metadata87 : 0<152546139 ∧ 18<128 ∧ 84<128 ∧ 0<4 ∧
    2064/4160=0 ∧ 2064%4160=2064 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 6182, atom 2156, type 0, source (19,85).
def leavesData88 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves88 : Fin 7 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 85 leaves88 i
def outputData88 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,21760,21888⟩) (.node (.single ⟨4864,4992,21888,22016⟩) (.single ⟨4992,5056,21760,21824⟩))) (.node (.node (.single ⟨4992,5056,21824,21888⟩) (.single ⟨5056,5120,21760,21824⟩)) (.node (.single ⟨5056,5120,21824,21888⟩) (.single ⟨4992,5120,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,27648,27776⟩) (.node (.single ⟨10752,10880,27776,27904⟩) (.single ⟨10880,10944,27648,27712⟩))) (.node (.node (.single ⟨10880,10944,27712,27776⟩) (.single ⟨10944,11008,27648,27712⟩)) (.node (.single ⟨10944,11008,27712,27776⟩) (.single ⟨10880,11008,27776,27904⟩))))) (.node (.node (.node (.single ⟨21760,21888,4864,4992⟩) (.node (.single ⟨21760,21824,4992,5056⟩) (.single ⟨21760,21824,5056,5120⟩))) (.node (.node (.single ⟨21824,21888,4992,5056⟩) (.single ⟨21824,21888,5056,5120⟩)) (.node (.single ⟨21888,22016,4864,4992⟩) (.single ⟨21888,22016,4992,5120⟩)))) (.node (.node (.single ⟨27648,27776,10752,10880⟩) (.node (.single ⟨27648,27712,10880,10944⟩) (.single ⟨27648,27712,10944,11008⟩))) (.node (.node (.single ⟨27712,27776,10880,10944⟩) (.single ⟨27712,27776,10944,11008⟩)) (.node (.single ⟨27776,27904,10752,10880⟩) (.single ⟨27776,27904,10880,11008⟩))))))
def output88 : Fin 28 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData88 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover88 (i : Fin 28) : Fin 28 := ⟨coverData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 28) : Fin 28 := ⟨sourceData88.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 .empty (.cutY 22016 (.cutX 4864 .empty (.cutY 21760 .empty (.cutX 4992 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 5056 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty))) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 (.cutX 11008 (.cutY 27904 (.cutX 10880 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 10944 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty) .empty) .empty))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 .empty (.cutX 21760 .empty (.cutY 4864 .empty (.cutX 21888 (.cutY 4992 .full (.cutX 21824 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 (.cutY 10752 .empty (.cutX 27904 (.cutY 11008 (.cutX 27776 (.cutY 10880 .full (.cutX 27712 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty)))) .empty) .empty))) .empty))

theorem metadata88 : 0<152546139 ∧ 19<128 ∧ 85<128 ∧ 0<4 ∧
    2156/4160=0 ∧ 2156%4160=2156 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 6183, atom 6575, type 1, source (22,83).
def leavesData89 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves89 : Fin 13 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 83 leaves89 i
def outputData89 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,21248,21312⟩) (.node (.single ⟨5632,5696,21312,21376⟩) (.single ⟨5696,5760,21248,21312⟩))) (.node (.single ⟨5696,5760,21312,21376⟩) (.node (.single ⟨5632,5760,21376,21504⟩) (.single ⟨5760,5824,21248,21312⟩)))) (.node (.node (.single ⟨5760,5824,21312,21376⟩) (.node (.single ⟨5824,5856,21248,21280⟩) (.single ⟨5824,5856,21280,21312⟩))) (.node (.node (.single ⟨5856,5888,21248,21280⟩) (.single ⟨5856,5888,21280,21312⟩)) (.node (.single ⟨5824,5888,21312,21376⟩) (.single ⟨5760,5888,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26880,27008⟩) (.node (.single ⟨11264,11392,27008,27136⟩) (.single ⟨11392,11456,26880,26944⟩))) (.node (.single ⟨11392,11456,26944,27008⟩) (.node (.single ⟨11456,11488,26880,26912⟩) (.single ⟨11456,11488,26912,26944⟩)))) (.node (.node (.single ⟨11488,11520,26880,26912⟩) (.node (.single ⟨11488,11520,26912,26944⟩) (.single ⟨11456,11520,26944,27008⟩))) (.node (.node (.single ⟨11392,11456,27008,27072⟩) (.single ⟨11392,11456,27072,27136⟩)) (.node (.single ⟨11456,11520,27008,27072⟩) (.single ⟨11456,11520,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5632,5696⟩) (.node (.single ⟨21248,21312,5696,5760⟩) (.single ⟨21312,21376,5632,5696⟩))) (.node (.single ⟨21312,21376,5696,5760⟩) (.node (.single ⟨21248,21312,5760,5824⟩) (.single ⟨21248,21280,5824,5856⟩)))) (.node (.node (.single ⟨21248,21280,5856,5888⟩) (.node (.single ⟨21280,21312,5824,5856⟩) (.single ⟨21280,21312,5856,5888⟩))) (.node (.node (.single ⟨21312,21376,5760,5824⟩) (.single ⟨21312,21376,5824,5888⟩)) (.node (.single ⟨21376,21504,5632,5760⟩) (.single ⟨21376,21504,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,11264,11392⟩) (.node (.single ⟨26880,26944,11392,11456⟩) (.single ⟨26880,26912,11456,11488⟩))) (.node (.single ⟨26880,26912,11488,11520⟩) (.node (.single ⟨26912,26944,11456,11488⟩) (.single ⟨26912,26944,11488,11520⟩)))) (.node (.node (.single ⟨26944,27008,11392,11456⟩) (.node (.single ⟨26944,27008,11456,11520⟩) (.single ⟨27008,27136,11264,11392⟩))) (.node (.node (.single ⟨27008,27072,11392,11456⟩) (.single ⟨27008,27072,11456,11520⟩)) (.node (.single ⟨27072,27136,11392,11456⟩) (.single ⟨27072,27136,11456,11520⟩)))))))
def output89 : Fin 52 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData89 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover89 (i : Fin 52) : Fin 52 := ⟨coverData89.get i % 52, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 52) : Fin 52 := ⟨sourceData89.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 (.cutY 21248 .empty (.cutX 5760 (.cutY 21376 (.cutX 5696 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 5824 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 5856 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))) .empty))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 (.cutY 26880 .empty (.cutX 11392 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 11456 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 11488 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 11456 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 .empty (.cutY 5888 (.cutX 21376 (.cutY 5760 (.cutX 21312 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 21312 (.cutY 5824 .full (.cutX 21280 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 .empty (.cutY 11520 (.cutX 27008 (.cutY 11392 .full (.cutX 26944 (.cutY 11456 .full (.cutX 26912 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 27072 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata89 : 0<125829407 ∧ 22<128 ∧ 83<128 ∧ 1<4 ∧
    6575/4160=1 ∧ 6575%4160=2415 ∧ ∀ i, (leaves89 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData89).mp
    (by decide +kernel)

theorem sourceChecked89_0 : ∀ i : Fin 52,
    (fun i => output89 i = raw89 (source89 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked89 : ∀ i : Fin 52, (fun i => output89 i = raw89 (source89 i)) i :=
  forallFin_of_zero_offset (fun i => output89 i = raw89 (source89 i)) sourceChecked89_0

theorem coverChecked89_0 : ∀ i : Fin 52,
    (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked89 : ∀ i : Fin 52, (fun i => (output89 (cover89 i)).ContainsBox (raw89 i)) i :=
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 6184, atom 5304, type 1, source (9,73).
def leavesData90 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves90 : Fin 4 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 73 leaves90 i
def outputData90 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,18688,18816⟩) (.single ⟨2304,2432,18816,18944⟩)) (.node (.single ⟨2432,2560,18688,18816⟩) (.single ⟨2432,2560,18816,18944⟩))) (.node (.node (.single ⟨13824,13952,30208,30336⟩) (.single ⟨13824,13952,30336,30464⟩)) (.node (.single ⟨13952,14080,30208,30336⟩) (.single ⟨13952,14080,30336,30464⟩)))) (.node (.node (.node (.single ⟨18688,18816,2304,2432⟩) (.single ⟨18688,18816,2432,2560⟩)) (.node (.single ⟨18816,18944,2304,2432⟩) (.single ⟨18816,18944,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,13824,13952⟩) (.single ⟨30208,30336,13952,14080⟩)) (.node (.single ⟨30336,30464,13824,13952⟩) (.single ⟨30336,30464,13952,14080⟩)))))
def output90 : Fin 16 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover90 (i : Fin 16) : Fin 16 := ⟨coverData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 16) : Fin 16 := ⟨sourceData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 .empty (.cutY 18688 .empty (.cutX 2432 (.cutY 18816 .full .full) (.cutY 18816 .full .full)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 (.cutY 30464 (.cutX 13952 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 .empty (.cutY 2304 .empty (.cutX 18816 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 (.cutY 14080 (.cutX 30336 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty) .empty))))) .empty) .empty))))) .empty))

theorem metadata90 : 0<94387549 ∧ 9<128 ∧ 73<128 ∧ 1<4 ∧
    5304/4160=1 ∧ 5304%4160=1144 ∧ ∀ i, (leaves90 i).Valid 8 := by
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 6185, atom 2584, type 0, source (24,88).
def leavesData91 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves91 : Fin 10 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 88 leaves91 i
def outputData91 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,22528,22592⟩) (.single ⟨6144,6208,22592,22656⟩)) (.node (.single ⟨6208,6272,22528,22592⟩) (.node (.single ⟨6208,6272,22592,22656⟩) (.single ⟨6144,6272,22656,22784⟩)))) (.node (.node (.single ⟨6272,6336,22528,22592⟩) (.single ⟨6272,6336,22592,22656⟩)) (.node (.single ⟨6336,6400,22528,22592⟩) (.node (.single ⟨6336,6400,22592,22656⟩) (.single ⟨6272,6400,22656,22784⟩))))) (.node (.node (.node (.single ⟨9984,10112,26368,26496⟩) (.single ⟨9984,10112,26496,26624⟩)) (.node (.single ⟨10112,10176,26368,26432⟩) (.node (.single ⟨10112,10176,26432,26496⟩) (.single ⟨10176,10240,26368,26432⟩)))) (.node (.node (.single ⟨10176,10240,26432,26496⟩) (.single ⟨10112,10176,26496,26560⟩)) (.node (.single ⟨10112,10176,26560,26624⟩) (.node (.single ⟨10176,10240,26496,26560⟩) (.single ⟨10176,10240,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22592,6144,6208⟩) (.single ⟨22528,22592,6208,6272⟩)) (.node (.single ⟨22592,22656,6144,6208⟩) (.node (.single ⟨22592,22656,6208,6272⟩) (.single ⟨22528,22592,6272,6336⟩)))) (.node (.node (.single ⟨22528,22592,6336,6400⟩) (.single ⟨22592,22656,6272,6336⟩)) (.node (.single ⟨22592,22656,6336,6400⟩) (.node (.single ⟨22656,22784,6144,6272⟩) (.single ⟨22656,22784,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,9984,10112⟩) (.single ⟨26368,26432,10112,10176⟩)) (.node (.single ⟨26368,26432,10176,10240⟩) (.node (.single ⟨26432,26496,10112,10176⟩) (.single ⟨26432,26496,10176,10240⟩)))) (.node (.node (.single ⟨26496,26624,9984,10112⟩) (.single ⟨26496,26560,10112,10176⟩)) (.node (.single ⟨26496,26560,10176,10240⟩) (.node (.single ⟨26560,26624,10112,10176⟩) (.single ⟨26560,26624,10176,10240⟩)))))))
def output91 : Fin 40 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData91 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover91 (i : Fin 40) : Fin 40 := ⟨coverData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 40) : Fin 40 := ⟨sourceData91.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 (.cutY 23040 (.cutX 6400 (.cutY 22784 (.cutX 6272 (.cutY 22656 (.cutX 6208 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 6336 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 .empty (.cutX 9984 .empty (.cutY 26368 .empty (.cutX 10112 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 10176 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 10176 (.cutY 26560 .full .full) (.cutY 26560 .full .full)))))))))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 (.cutX 22784 (.cutY 6400 (.cutX 22656 (.cutY 6272 (.cutX 22592 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 22592 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 .empty (.cutY 9728 .empty (.cutX 26368 .empty (.cutY 9984 .empty (.cutX 26496 (.cutY 10112 .full (.cutX 26432 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 26560 (.cutY 10176 .full .full) (.cutY 10176 .full .full)))))))))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata91 : 0<145899414 ∧ 24<128 ∧ 88<128 ∧ 0<4 ∧
    2584/4160=0 ∧ 2584%4160=2584 ∧ ∀ i, (leaves91 i).Valid 8 := by
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 6186, atom 3100, type 0, source (31,93).
def leavesData92 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves92 : Fin 10 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 31 93 leaves92 i
def outputData92 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7936,8000,23808,23872⟩) (.single ⟨7936,8000,23872,23936⟩)) (.node (.single ⟨8000,8064,23808,23872⟩) (.node (.single ⟨8000,8064,23872,23936⟩) (.single ⟨7936,8064,23936,24064⟩)))) (.node (.node (.single ⟨8064,8128,23808,23872⟩) (.single ⟨8064,8128,23872,23936⟩)) (.node (.single ⟨8128,8192,23808,23872⟩) (.node (.single ⟨8128,8192,23872,23936⟩) (.single ⟨8064,8192,23936,24064⟩))))) (.node (.node (.node (.single ⟨8704,8832,24576,24704⟩) (.single ⟨8704,8832,24704,24832⟩)) (.node (.single ⟨8832,8896,24576,24640⟩) (.node (.single ⟨8832,8896,24640,24704⟩) (.single ⟨8896,8960,24576,24640⟩)))) (.node (.node (.single ⟨8896,8960,24640,24704⟩) (.single ⟨8832,8896,24704,24768⟩)) (.node (.single ⟨8832,8896,24768,24832⟩) (.node (.single ⟨8896,8960,24704,24768⟩) (.single ⟨8896,8960,24768,24832⟩)))))) (.node (.node (.node (.node (.single ⟨23808,23872,7936,8000⟩) (.single ⟨23808,23872,8000,8064⟩)) (.node (.single ⟨23872,23936,7936,8000⟩) (.node (.single ⟨23872,23936,8000,8064⟩) (.single ⟨23808,23872,8064,8128⟩)))) (.node (.node (.single ⟨23808,23872,8128,8192⟩) (.single ⟨23872,23936,8064,8128⟩)) (.node (.single ⟨23872,23936,8128,8192⟩) (.node (.single ⟨23936,24064,7936,8064⟩) (.single ⟨23936,24064,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,8704,8832⟩) (.single ⟨24576,24640,8832,8896⟩)) (.node (.single ⟨24576,24640,8896,8960⟩) (.node (.single ⟨24640,24704,8832,8896⟩) (.single ⟨24640,24704,8896,8960⟩)))) (.node (.node (.single ⟨24704,24832,8704,8832⟩) (.single ⟨24704,24768,8832,8896⟩)) (.node (.single ⟨24704,24768,8896,8960⟩) (.node (.single ⟨24768,24832,8832,8896⟩) (.single ⟨24768,24832,8896,8960⟩)))))))
def output92 : Fin 40 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData92 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover92 (i : Fin 40) : Fin 40 := ⟨coverData92.get i % 40, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 40) : Fin 40 := ⟨sourceData92.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 .empty (.cutX 7680 .empty (.cutY 24064 (.cutX 7936 .empty (.cutY 23808 .empty (.cutX 8064 (.cutY 23936 (.cutX 8000 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 8128 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty)))))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 (.cutX 8704 .empty (.cutY 25088 (.cutX 8960 (.cutY 24832 (.cutX 8832 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 8896 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) (.cutX 8896 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 .empty (.cutX 24064 (.cutY 7680 .empty (.cutX 23808 .empty (.cutY 7936 .empty (.cutX 23936 (.cutY 8064 (.cutX 23872 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 23872 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))) .empty))))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 (.cutX 25088 (.cutY 8704 .empty (.cutX 24832 (.cutY 8960 (.cutX 24704 (.cutY 8832 .full (.cutX 24640 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 24768 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata92 : 0<145899414 ∧ 31<128 ∧ 93<128 ∧ 0<4 ∧
    3100/4160=0 ∧ 3100%4160=3100 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 40,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 40, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 40,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 40, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 6187, atom 2891, type 0, source (28,91).
def leavesData93 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves93 : Fin 7 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 91 leaves93 i
def outputData93 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,23296,23424⟩) (.node (.single ⟨7168,7296,23424,23552⟩) (.single ⟨7296,7360,23296,23360⟩))) (.node (.node (.single ⟨7296,7360,23360,23424⟩) (.single ⟨7360,7424,23296,23360⟩)) (.node (.single ⟨7360,7424,23360,23424⟩) (.single ⟨7296,7424,23424,23552⟩)))) (.node (.node (.single ⟨9216,9344,25344,25472⟩) (.node (.single ⟨9216,9344,25472,25600⟩) (.single ⟨9344,9408,25344,25408⟩))) (.node (.node (.single ⟨9344,9408,25408,25472⟩) (.single ⟨9408,9472,25344,25408⟩)) (.node (.single ⟨9408,9472,25408,25472⟩) (.single ⟨9344,9472,25472,25600⟩))))) (.node (.node (.node (.single ⟨23296,23424,7168,7296⟩) (.node (.single ⟨23296,23360,7296,7360⟩) (.single ⟨23296,23360,7360,7424⟩))) (.node (.node (.single ⟨23360,23424,7296,7360⟩) (.single ⟨23360,23424,7360,7424⟩)) (.node (.single ⟨23424,23552,7168,7296⟩) (.single ⟨23424,23552,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,9216,9344⟩) (.node (.single ⟨25344,25408,9344,9408⟩) (.single ⟨25344,25408,9408,9472⟩))) (.node (.node (.single ⟨25408,25472,9344,9408⟩) (.single ⟨25408,25472,9408,9472⟩)) (.node (.single ⟨25472,25600,9216,9344⟩) (.single ⟨25472,25600,9344,9472⟩))))))
def output93 : Fin 28 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData93 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover93 (i : Fin 28) : Fin 28 := ⟨coverData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 28) : Fin 28 := ⟨sourceData93.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 .empty (.cutX 7424 (.cutY 23296 .empty (.cutX 7296 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 7360 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty)) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 .empty (.cutX 9472 (.cutY 25344 .empty (.cutX 9344 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 9408 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 (.cutX 23296 .empty (.cutY 7424 (.cutX 23424 (.cutY 7296 .full (.cutX 23360 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 (.cutX 25344 .empty (.cutY 9472 (.cutX 25472 (.cutY 9344 .full (.cutX 25408 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata93 : 0<145899414 ∧ 28<128 ∧ 91<128 ∧ 0<4 ∧
    2891/4160=0 ∧ 2891%4160=2891 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 6188, atom 2963, type 0, source (29,92).
def leavesData94 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves94 : Fin 7 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 92 leaves94 i
def outputData94 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,23552,23680⟩) (.node (.single ⟨7424,7552,23680,23808⟩) (.single ⟨7552,7616,23552,23616⟩))) (.node (.node (.single ⟨7552,7616,23616,23680⟩) (.single ⟨7616,7680,23552,23616⟩)) (.node (.single ⟨7616,7680,23616,23680⟩) (.single ⟨7552,7680,23680,23808⟩)))) (.node (.node (.single ⟨8960,9088,25088,25216⟩) (.node (.single ⟨8960,9088,25216,25344⟩) (.single ⟨9088,9152,25088,25152⟩))) (.node (.node (.single ⟨9088,9152,25152,25216⟩) (.single ⟨9152,9216,25088,25152⟩)) (.node (.single ⟨9152,9216,25152,25216⟩) (.single ⟨9088,9216,25216,25344⟩))))) (.node (.node (.node (.single ⟨23552,23680,7424,7552⟩) (.node (.single ⟨23552,23616,7552,7616⟩) (.single ⟨23552,23616,7616,7680⟩))) (.node (.node (.single ⟨23616,23680,7552,7616⟩) (.single ⟨23616,23680,7616,7680⟩)) (.node (.single ⟨23680,23808,7424,7552⟩) (.single ⟨23680,23808,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,8960,9088⟩) (.node (.single ⟨25088,25152,9088,9152⟩) (.single ⟨25088,25152,9152,9216⟩))) (.node (.node (.single ⟨25152,25216,9088,9152⟩) (.single ⟨25152,25216,9152,9216⟩)) (.node (.single ⟨25216,25344,8960,9088⟩) (.single ⟨25216,25344,9088,9216⟩))))))
def output94 : Fin 28 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData94 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover94 (i : Fin 28) : Fin 28 := ⟨coverData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 28) : Fin 28 := ⟨sourceData94.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 .empty (.cutX 7680 (.cutY 24064 (.cutX 7424 .empty (.cutY 23808 (.cutX 7552 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 7616 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty) .empty))))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 (.cutX 8704 .empty (.cutY 25088 .empty (.cutX 8960 .empty (.cutY 25344 (.cutX 9088 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 9152 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 .empty (.cutX 24064 (.cutY 7680 (.cutX 23808 (.cutY 7424 .empty (.cutX 23680 (.cutY 7552 .full (.cutX 23616 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) .empty))))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 (.cutX 25088 .empty (.cutY 8704 .empty (.cutX 25344 (.cutY 8960 .empty (.cutX 25216 (.cutY 9088 .full (.cutX 25152 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata94 : 0<145899414 ∧ 29<128 ∧ 92<128 ∧ 0<4 ∧
    2963/4160=0 ∧ 2963%4160=2963 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 6189, atom 2419, type 0, source (22,87).
def leavesData95 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves95 : Fin 10 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 87 leaves95 i
def outputData95 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,22272,22336⟩) (.single ⟨5632,5696,22336,22400⟩)) (.node (.single ⟨5696,5760,22272,22336⟩) (.node (.single ⟨5696,5760,22336,22400⟩) (.single ⟨5632,5760,22400,22528⟩)))) (.node (.node (.single ⟨5760,5824,22272,22336⟩) (.single ⟨5760,5824,22336,22400⟩)) (.node (.single ⟨5824,5888,22272,22336⟩) (.node (.single ⟨5824,5888,22336,22400⟩) (.single ⟨5760,5888,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,26880,27008⟩) (.single ⟨10240,10368,27008,27136⟩)) (.node (.single ⟨10368,10432,26880,26944⟩) (.node (.single ⟨10368,10432,26944,27008⟩) (.single ⟨10432,10496,26880,26944⟩)))) (.node (.node (.single ⟨10432,10496,26944,27008⟩) (.single ⟨10368,10432,27008,27072⟩)) (.node (.single ⟨10368,10432,27072,27136⟩) (.node (.single ⟨10432,10496,27008,27072⟩) (.single ⟨10432,10496,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22336,5632,5696⟩) (.single ⟨22272,22336,5696,5760⟩)) (.node (.single ⟨22336,22400,5632,5696⟩) (.node (.single ⟨22336,22400,5696,5760⟩) (.single ⟨22272,22336,5760,5824⟩)))) (.node (.node (.single ⟨22272,22336,5824,5888⟩) (.single ⟨22336,22400,5760,5824⟩)) (.node (.single ⟨22336,22400,5824,5888⟩) (.node (.single ⟨22400,22528,5632,5760⟩) (.single ⟨22400,22528,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,10240,10368⟩) (.single ⟨26880,26944,10368,10432⟩)) (.node (.single ⟨26880,26944,10432,10496⟩) (.node (.single ⟨26944,27008,10368,10432⟩) (.single ⟨26944,27008,10432,10496⟩)))) (.node (.node (.single ⟨27008,27136,10240,10368⟩) (.single ⟨27008,27072,10368,10432⟩)) (.node (.single ⟨27008,27072,10432,10496⟩) (.node (.single ⟨27072,27136,10368,10432⟩) (.single ⟨27072,27136,10432,10496⟩)))))))
def output95 : Fin 40 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData95 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover95 (i : Fin 40) : Fin 40 := ⟨coverData95.get i % 40, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 40) : Fin 40 := ⟨sourceData95.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 .empty (.cutX 5888 (.cutY 22272 .empty (.cutX 5760 (.cutY 22400 (.cutX 5696 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 5824 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))) .empty))))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 (.cutY 27136 (.cutX 10496 (.cutY 26880 .empty (.cutX 10368 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 10432 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 10432 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 .empty (.cutY 5632 .empty (.cutX 22272 .empty (.cutY 5888 (.cutX 22400 (.cutY 5760 (.cutX 22336 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 22336 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty)))))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 (.cutX 26880 .empty (.cutY 10496 (.cutX 27008 (.cutY 10368 .full (.cutX 26944 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 27072 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata95 : 0<152546139 ∧ 22<128 ∧ 87<128 ∧ 0<4 ∧
    2419/4160=0 ∧ 2419%4160=2419 ∧ ∀ i, (leaves95 i).Valid 8 := by
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 6190, atom 2664, type 0, source (25,89).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 89 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,22784,22912⟩) (.node (.single ⟨6400,6528,22912,23040⟩) (.single ⟨6528,6592,22784,22848⟩))) (.node (.node (.single ⟨6528,6592,22848,22912⟩) (.single ⟨6592,6656,22784,22848⟩)) (.node (.single ⟨6592,6656,22848,22912⟩) (.single ⟨6528,6656,22912,23040⟩)))) (.node (.node (.single ⟨9728,9856,26112,26240⟩) (.node (.single ⟨9728,9856,26240,26368⟩) (.single ⟨9856,9920,26112,26176⟩))) (.node (.node (.single ⟨9856,9920,26176,26240⟩) (.single ⟨9920,9984,26112,26176⟩)) (.node (.single ⟨9920,9984,26176,26240⟩) (.single ⟨9856,9984,26240,26368⟩))))) (.node (.node (.node (.single ⟨22784,22912,6400,6528⟩) (.node (.single ⟨22784,22848,6528,6592⟩) (.single ⟨22784,22848,6592,6656⟩))) (.node (.node (.single ⟨22848,22912,6528,6592⟩) (.single ⟨22848,22912,6592,6656⟩)) (.node (.single ⟨22912,23040,6400,6528⟩) (.single ⟨22912,23040,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,9728,9856⟩) (.node (.single ⟨26112,26176,9856,9920⟩) (.single ⟨26112,26176,9920,9984⟩))) (.node (.node (.single ⟨26176,26240,9856,9920⟩) (.single ⟨26176,26240,9920,9984⟩)) (.node (.single ⟨26240,26368,9728,9856⟩) (.single ⟨26240,26368,9856,9984⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 (.cutY 23040 (.cutX 6400 .empty (.cutY 22784 .empty (.cutX 6528 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 6592 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full)))) .empty) .empty) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 .empty (.cutX 9984 (.cutY 26368 (.cutX 9856 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 9920 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty))))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 (.cutX 22784 .empty (.cutY 6400 .empty (.cutX 22912 (.cutY 6528 .full (.cutX 22848 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 .empty (.cutY 9728 .empty (.cutX 26368 (.cutY 9984 (.cutX 26240 (.cutY 9856 .full (.cutX 26176 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty))))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata96 : 0<145899414 ∧ 25<128 ∧ 89<128 ∧ 0<4 ∧
    2664/4160=0 ∧ 2664%4160=2664 ∧ ∀ i, (leaves96 i).Valid 8 := by
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 6191, atom 2742, type 0, source (26,90).
def leavesData97 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves97 : Fin 7 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 90 leaves97 i
def outputData97 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,23040,23168⟩) (.node (.single ⟨6656,6784,23168,23296⟩) (.single ⟨6784,6848,23040,23104⟩))) (.node (.node (.single ⟨6784,6848,23104,23168⟩) (.single ⟨6848,6912,23040,23104⟩)) (.node (.single ⟨6848,6912,23104,23168⟩) (.single ⟨6784,6912,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,25856,25984⟩) (.node (.single ⟨9472,9600,25984,26112⟩) (.single ⟨9600,9664,25856,25920⟩))) (.node (.node (.single ⟨9600,9664,25920,25984⟩) (.single ⟨9664,9728,25856,25920⟩)) (.node (.single ⟨9664,9728,25920,25984⟩) (.single ⟨9600,9728,25984,26112⟩))))) (.node (.node (.node (.single ⟨23040,23168,6656,6784⟩) (.node (.single ⟨23040,23104,6784,6848⟩) (.single ⟨23040,23104,6848,6912⟩))) (.node (.node (.single ⟨23104,23168,6784,6848⟩) (.single ⟨23104,23168,6848,6912⟩)) (.node (.single ⟨23168,23296,6656,6784⟩) (.single ⟨23168,23296,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,9472,9600⟩) (.node (.single ⟨25856,25920,9600,9664⟩) (.single ⟨25856,25920,9664,9728⟩))) (.node (.node (.single ⟨25920,25984,9600,9664⟩) (.single ⟨25920,25984,9664,9728⟩)) (.node (.single ⟨25984,26112,9472,9600⟩) (.single ⟨25984,26112,9600,9728⟩))))))
def output97 : Fin 28 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData97 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover97 (i : Fin 28) : Fin 28 := ⟨coverData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 28) : Fin 28 := ⟨sourceData97.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 .empty (.cutX 6912 (.cutY 23296 (.cutX 6784 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 6848 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty))) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 (.cutY 26112 (.cutX 9472 .empty (.cutY 25856 .empty (.cutX 9600 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 9664 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty) .empty))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 .empty (.cutY 6656 .empty (.cutX 23296 (.cutY 6912 (.cutX 23168 (.cutY 6784 .full (.cutX 23104 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 (.cutX 25856 .empty (.cutY 9472 .empty (.cutX 25984 (.cutY 9600 .full (.cutX 25920 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata97 : 0<145899414 ∧ 26<128 ∧ 90<128 ∧ 0<4 ∧
    2742/4160=0 ∧ 2742%4160=2742 ∧ ∀ i, (leaves97 i).Valid 8 := by
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 6192, atom 7322, type 1, source (32,90).
def leavesData98 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves98 : Fin 10 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 90 leaves98 i
def outputData98 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8256,23040,23104⟩) (.single ⟨8192,8256,23104,23168⟩)) (.node (.single ⟨8256,8320,23040,23104⟩) (.node (.single ⟨8256,8320,23104,23168⟩) (.single ⟨8192,8320,23168,23296⟩)))) (.node (.node (.single ⟨8320,8384,23040,23104⟩) (.single ⟨8320,8384,23104,23168⟩)) (.node (.single ⟨8384,8448,23040,23104⟩) (.node (.single ⟨8384,8448,23104,23168⟩) (.single ⟨8320,8448,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,24320,24448⟩) (.single ⟨9472,9600,24448,24576⟩)) (.node (.single ⟨9600,9664,24320,24384⟩) (.node (.single ⟨9600,9664,24384,24448⟩) (.single ⟨9664,9728,24320,24384⟩)))) (.node (.node (.single ⟨9664,9728,24384,24448⟩) (.single ⟨9600,9664,24448,24512⟩)) (.node (.single ⟨9600,9664,24512,24576⟩) (.node (.single ⟨9664,9728,24448,24512⟩) (.single ⟨9664,9728,24512,24576⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23104,8192,8256⟩) (.single ⟨23040,23104,8256,8320⟩)) (.node (.single ⟨23104,23168,8192,8256⟩) (.node (.single ⟨23104,23168,8256,8320⟩) (.single ⟨23040,23104,8320,8384⟩)))) (.node (.node (.single ⟨23040,23104,8384,8448⟩) (.single ⟨23104,23168,8320,8384⟩)) (.node (.single ⟨23104,23168,8384,8448⟩) (.node (.single ⟨23168,23296,8192,8320⟩) (.single ⟨23168,23296,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,9472,9600⟩) (.single ⟨24320,24384,9600,9664⟩)) (.node (.single ⟨24320,24384,9664,9728⟩) (.node (.single ⟨24384,24448,9600,9664⟩) (.single ⟨24384,24448,9664,9728⟩)))) (.node (.node (.single ⟨24448,24576,9472,9600⟩) (.single ⟨24448,24512,9600,9664⟩)) (.node (.single ⟨24448,24512,9664,9728⟩) (.node (.single ⟨24512,24576,9600,9664⟩) (.single ⟨24512,24576,9664,9728⟩)))))))
def output98 : Fin 40 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover98 (i : Fin 40) : Fin 40 := ⟨coverData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 40) : Fin 40 := ⟨sourceData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 .empty (.cutX 8448 (.cutY 23296 (.cutX 8320 (.cutY 23168 (.cutX 8256 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 8384 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty)) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 .empty (.cutX 9472 .empty (.cutY 24320 .empty (.cutX 9600 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 9664 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) (.cutX 9664 (.cutY 24512 .full .full) (.cutY 24512 .full .full))))))) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 (.cutX 23296 (.cutY 8448 (.cutX 23168 (.cutY 8320 (.cutX 23104 (.cutY 8256 .full .full) (.cutY 8256 .full .full)) (.cutX 23104 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 (.cutX 24320 .empty (.cutY 9472 .empty (.cutX 24448 (.cutY 9600 .full (.cutX 24384 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 24512 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty)))) .empty)) .empty))) .empty) .empty))

theorem metadata98 : 0<67962893 ∧ 32<128 ∧ 90<128 ∧ 1<4 ∧
    7322/4160=1 ∧ 7322%4160=3162 ∧ ∀ i, (leaves98 i).Valid 8 := by
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 6193, atom 6898, type 1, source (26,86).
def leavesData99 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves99 : Fin 13 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 86 leaves99 i
def outputData99 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,22016,22080⟩) (.node (.single ⟨6656,6720,22080,22144⟩) (.single ⟨6720,6784,22016,22080⟩))) (.node (.single ⟨6720,6784,22080,22144⟩) (.node (.single ⟨6656,6784,22144,22272⟩) (.single ⟨6784,6848,22016,22080⟩)))) (.node (.node (.single ⟨6784,6848,22080,22144⟩) (.node (.single ⟨6848,6880,22016,22048⟩) (.single ⟨6848,6880,22048,22080⟩))) (.node (.node (.single ⟨6880,6912,22016,22048⟩) (.single ⟨6880,6912,22048,22080⟩)) (.node (.single ⟨6848,6912,22080,22144⟩) (.single ⟨6784,6912,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,25856,25984⟩) (.node (.single ⟨10496,10624,25984,26112⟩) (.single ⟨10624,10688,25856,25920⟩))) (.node (.single ⟨10624,10688,25920,25984⟩) (.node (.single ⟨10688,10720,25856,25888⟩) (.single ⟨10688,10720,25888,25920⟩)))) (.node (.node (.single ⟨10720,10752,25856,25888⟩) (.node (.single ⟨10720,10752,25888,25920⟩) (.single ⟨10688,10752,25920,25984⟩))) (.node (.node (.single ⟨10624,10688,25984,26048⟩) (.single ⟨10624,10688,26048,26112⟩)) (.node (.single ⟨10688,10752,25984,26048⟩) (.single ⟨10688,10752,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,6656,6720⟩) (.node (.single ⟨22016,22080,6720,6784⟩) (.single ⟨22080,22144,6656,6720⟩))) (.node (.single ⟨22080,22144,6720,6784⟩) (.node (.single ⟨22016,22080,6784,6848⟩) (.single ⟨22016,22048,6848,6880⟩)))) (.node (.node (.single ⟨22016,22048,6880,6912⟩) (.node (.single ⟨22048,22080,6848,6880⟩) (.single ⟨22048,22080,6880,6912⟩))) (.node (.node (.single ⟨22080,22144,6784,6848⟩) (.single ⟨22080,22144,6848,6912⟩)) (.node (.single ⟨22144,22272,6656,6784⟩) (.single ⟨22144,22272,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,10496,10624⟩) (.node (.single ⟨25856,25920,10624,10688⟩) (.single ⟨25856,25888,10688,10720⟩))) (.node (.single ⟨25856,25888,10720,10752⟩) (.node (.single ⟨25888,25920,10688,10720⟩) (.single ⟨25888,25920,10720,10752⟩)))) (.node (.node (.single ⟨25920,25984,10624,10688⟩) (.node (.single ⟨25920,25984,10688,10752⟩) (.single ⟨25984,26112,10496,10624⟩))) (.node (.node (.single ⟨25984,26048,10624,10688⟩) (.single ⟨25984,26048,10688,10752⟩)) (.node (.single ⟨26048,26112,10624,10688⟩) (.single ⟨26048,26112,10688,10752⟩)))))))
def output99 : Fin 52 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData99 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover99 (i : Fin 52) : Fin 52 := ⟨coverData99.get i % 52, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 52) : Fin 52 := ⟨sourceData99.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 (.cutY 22272 (.cutX 6784 (.cutY 22144 (.cutX 6720 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 6848 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 6880 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 .empty (.cutY 25856 .empty (.cutX 10624 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10688 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 10720 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 10688 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 (.cutY 6912 (.cutX 22144 (.cutY 6784 (.cutX 22080 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 22080 (.cutY 6848 .full (.cutX 22048 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 .empty (.cutY 10496 .empty (.cutX 25984 (.cutY 10624 .full (.cutX 25920 (.cutY 10688 .full (.cutX 25888 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 26048 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata99 : 0<144359671 ∧ 26<128 ∧ 86<128 ∧ 1<4 ∧
    6898/4160=1 ∧ 6898%4160=2738 ∧ ∀ i, (leaves99 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData99).mp
    (by decide +kernel)

theorem sourceChecked99_0 : ∀ i : Fin 52,
    (fun i => output99 i = raw99 (source99 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked99 : ∀ i : Fin 52, (fun i => output99 i = raw99 (source99 i)) i :=
  forallFin_of_zero_offset (fun i => output99 i = raw99 (source99 i)) sourceChecked99_0

theorem coverChecked99_0 : ∀ i : Fin 52,
    (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked99 : ∀ i : Fin 52, (fun i => (output99 (cover99 i)).ContainsBox (raw99 i)) i :=
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 6194, atom 6974, type 1, source (27,87).
def leavesData100 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves100 : Fin 7 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 87 leaves100 i
def outputData100 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,22272,22400⟩) (.node (.single ⟨6912,7040,22400,22528⟩) (.single ⟨7040,7104,22272,22336⟩))) (.node (.node (.single ⟨7040,7104,22336,22400⟩) (.single ⟨7104,7168,22272,22336⟩)) (.node (.single ⟨7104,7168,22336,22400⟩) (.single ⟨7040,7168,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,25600,25728⟩) (.node (.single ⟨10240,10368,25728,25856⟩) (.single ⟨10368,10432,25600,25664⟩))) (.node (.node (.single ⟨10368,10432,25664,25728⟩) (.single ⟨10432,10496,25600,25664⟩)) (.node (.single ⟨10432,10496,25664,25728⟩) (.single ⟨10368,10496,25728,25856⟩))))) (.node (.node (.node (.single ⟨22272,22400,6912,7040⟩) (.node (.single ⟨22272,22336,7040,7104⟩) (.single ⟨22272,22336,7104,7168⟩))) (.node (.node (.single ⟨22336,22400,7040,7104⟩) (.single ⟨22336,22400,7104,7168⟩)) (.node (.single ⟨22400,22528,6912,7040⟩) (.single ⟨22400,22528,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,10240,10368⟩) (.node (.single ⟨25600,25664,10368,10432⟩) (.single ⟨25600,25664,10432,10496⟩))) (.node (.node (.single ⟨25664,25728,10368,10432⟩) (.single ⟨25664,25728,10432,10496⟩)) (.node (.single ⟨25728,25856,10240,10368⟩) (.single ⟨25728,25856,10368,10496⟩))))))
def output100 : Fin 28 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData100 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover100 (i : Fin 28) : Fin 28 := ⟨coverData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 28) : Fin 28 := ⟨sourceData100.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 .empty (.cutY 22272 .empty (.cutX 7040 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 7104 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 (.cutY 25856 (.cutX 10368 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10432 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 .empty (.cutY 6912 .empty (.cutX 22400 (.cutY 7040 .full (.cutX 22336 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 (.cutY 10496 (.cutX 25728 (.cutY 10368 .full (.cutX 25664 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata100 : 0<144359671 ∧ 27<128 ∧ 87<128 ∧ 1<4 ∧
    6974/4160=1 ∧ 6974%4160=2814 ∧ ∀ i, (leaves100 i).Valid 8 := by
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 6195, atom 7189, type 1, source (30,89).
def leavesData101 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves101 : Fin 19 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 30 89 leaves101 i
def outputData101 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨7680,7744,22784,22848⟩) (.single ⟨7680,7744,22848,22912⟩)) (.node (.single ⟨7744,7808,22784,22848⟩) (.single ⟨7744,7808,22848,22912⟩))) (.node (.node (.single ⟨7680,7808,22912,23040⟩) (.single ⟨7808,7840,22784,22816⟩)) (.node (.single ⟨7808,7840,22816,22848⟩) (.node (.single ⟨7840,7872,22784,22816⟩) (.single ⟨7840,7872,22816,22848⟩))))) (.node (.node (.node (.single ⟨7808,7872,22848,22912⟩) (.single ⟨7872,7904,22784,22816⟩)) (.node (.single ⟨7872,7904,22816,22848⟩) (.node (.single ⟨7904,7936,22784,22816⟩) (.single ⟨7904,7936,22816,22848⟩)))) (.node (.node (.single ⟨7872,7936,22848,22912⟩) (.single ⟨7808,7872,22912,22976⟩)) (.node (.single ⟨7808,7872,22976,23040⟩) (.node (.single ⟨7872,7936,22912,22976⟩) (.single ⟨7872,7936,22976,23040⟩)))))) (.node (.node (.node (.node (.single ⟨9728,9792,24832,24896⟩) (.single ⟨9728,9792,24896,24960⟩)) (.node (.single ⟨9792,9856,24832,24896⟩) (.single ⟨9792,9856,24896,24960⟩))) (.node (.node (.single ⟨9728,9856,24960,25088⟩) (.single ⟨9856,9920,24832,24896⟩)) (.node (.single ⟨9856,9920,24896,24960⟩) (.node (.single ⟨9920,9952,24832,24864⟩) (.single ⟨9920,9952,24864,24896⟩))))) (.node (.node (.node (.single ⟨9952,9984,24832,24864⟩) (.single ⟨9952,9984,24864,24896⟩)) (.node (.single ⟨9920,9952,24896,24928⟩) (.node (.single ⟨9920,9952,24928,24960⟩) (.single ⟨9952,9984,24896,24928⟩)))) (.node (.node (.single ⟨9952,9984,24928,24960⟩) (.single ⟨9856,9920,24960,25024⟩)) (.node (.single ⟨9856,9920,25024,25088⟩) (.node (.single ⟨9920,9984,24960,25024⟩) (.single ⟨9920,9984,25024,25088⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,7680,7744⟩) (.single ⟨22784,22848,7744,7808⟩)) (.node (.single ⟨22848,22912,7680,7744⟩) (.single ⟨22848,22912,7744,7808⟩))) (.node (.node (.single ⟨22784,22816,7808,7840⟩) (.single ⟨22784,22816,7840,7872⟩)) (.node (.single ⟨22816,22848,7808,7840⟩) (.node (.single ⟨22816,22848,7840,7872⟩) (.single ⟨22784,22816,7872,7904⟩))))) (.node (.node (.node (.single ⟨22784,22816,7904,7936⟩) (.single ⟨22816,22848,7872,7904⟩)) (.node (.single ⟨22816,22848,7904,7936⟩) (.node (.single ⟨22848,22912,7808,7872⟩) (.single ⟨22848,22912,7872,7936⟩)))) (.node (.node (.single ⟨22912,23040,7680,7808⟩) (.single ⟨22912,22976,7808,7872⟩)) (.node (.single ⟨22912,22976,7872,7936⟩) (.node (.single ⟨22976,23040,7808,7872⟩) (.single ⟨22976,23040,7872,7936⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,9728,9792⟩) (.single ⟨24832,24896,9792,9856⟩)) (.node (.single ⟨24896,24960,9728,9792⟩) (.single ⟨24896,24960,9792,9856⟩))) (.node (.node (.single ⟨24832,24896,9856,9920⟩) (.single ⟨24832,24864,9920,9952⟩)) (.node (.single ⟨24832,24864,9952,9984⟩) (.node (.single ⟨24864,24896,9920,9952⟩) (.single ⟨24864,24896,9952,9984⟩))))) (.node (.node (.node (.single ⟨24896,24960,9856,9920⟩) (.single ⟨24896,24928,9920,9952⟩)) (.node (.single ⟨24896,24928,9952,9984⟩) (.node (.single ⟨24928,24960,9920,9952⟩) (.single ⟨24928,24960,9952,9984⟩)))) (.node (.node (.single ⟨24960,25088,9728,9856⟩) (.single ⟨24960,25024,9856,9920⟩)) (.node (.single ⟨24960,25024,9920,9984⟩) (.node (.single ⟨25024,25088,9856,9920⟩) (.single ⟨25024,25088,9920,9984⟩))))))))
def output101 : Fin 76 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1))))) (.node (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39)))) (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.node (.single 41) (.single 72)))))) (.node (.node (.node (.node (.single 34) (.single 9)) (.node (.single 50) (.single 66))) (.node (.node (.single 25) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))) (.node (.node (.node (.single 15) (.single 53)) (.node (.single 60) (.node (.single 22) (.single 16)))) (.node (.node (.single 55) (.single 59)) (.node (.single 20) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 10))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 48))))) (.node (.node (.node (.single 64) (.single 27)) (.node (.single 12) (.node (.single 47) (.single 63)))) (.node (.node (.single 28) (.single 13)) (.node (.single 49) (.node (.single 62) (.single 26))))))))
def sourceData101 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.single 31))) (.node (.node (.single 3) (.single 27)) (.node (.single 23) (.node (.single 75) (.single 67))))) (.node (.node (.node (.single 71) (.single 63)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 61))))) (.node (.node (.node (.single 69) (.single 65)) (.node (.single 73) (.node (.single 21) (.single 25)))) (.node (.node (.single 1) (.single 29)) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 30))) (.node (.node (.single 26) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 22) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover101 (i : Fin 76) : Fin 76 := ⟨coverData101.get i % 76, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 76) : Fin 76 := ⟨sourceData101.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 (.cutY 22784 .empty (.cutX 7808 (.cutY 22912 (.cutX 7744 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 7872 (.cutY 22848 (.cutX 7840 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full) (.cutY 22848 (.cutX 7904 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) (.cutX 7872 (.cutY 22976 .full .full) (.cutY 22976 .full .full))))) .empty) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 (.cutY 24832 .empty (.cutX 9856 (.cutY 24960 (.cutX 9792 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 9920 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 9952 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) (.cutX 9952 (.cutY 24928 .full .full) (.cutY 24928 .full .full)))) (.cutX 9920 (.cutY 25024 .full .full) (.cutY 25024 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 .empty (.cutY 7936 (.cutX 22912 (.cutY 7808 (.cutX 22848 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 22848 (.cutY 7872 (.cutX 22816 (.cutY 7840 .full .full) (.cutY 7840 .full .full)) (.cutX 22816 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 22976 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 .empty (.cutY 9984 (.cutX 24960 (.cutY 9856 (.cutX 24896 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 24896 (.cutY 9920 .full (.cutX 24864 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full (.cutX 24928 (.cutY 9952 .full .full) (.cutY 9952 .full .full))))) (.cutY 9856 .full (.cutX 25024 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata101 : 0<149239428 ∧ 30<128 ∧ 89<128 ∧ 1<4 ∧
    7189/4160=1 ∧ 7189%4160=3029 ∧ ∀ i, (leaves101 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData101).mp
    (by decide +kernel)

theorem sourceChecked101_0 : ∀ i : Fin 64,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked101_64 : ∀ i : Fin 12,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked101 : ∀ i : Fin 76, (fun i => output101 i = raw101 (source101 i)) i :=
  forallFin_of_zero_offset (fun i => output101 i = raw101 (source101 i)) (forallFinOffset_add (fun i => output101 i = raw101 (source101 i)) 0 64 12 (by decide) sourceChecked101_0
    sourceChecked101_64)

theorem coverChecked101_0 : ∀ i : Fin 64,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked101_64 : ∀ i : Fin 12,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked101 : ∀ i : Fin 76, (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) i :=
  forallFin_of_zero_offset (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (forallFinOffset_add (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) 0 64 12 (by decide) coverChecked101_0
    coverChecked101_64)

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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 6196, atom 6312, type 1, source (19,81).
def leavesData102 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves102 : Fin 13 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 81 leaves102 i
def outputData102 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,20736,20800⟩) (.node (.single ⟨4864,4928,20800,20864⟩) (.single ⟨4928,4992,20736,20800⟩))) (.node (.single ⟨4928,4992,20800,20864⟩) (.node (.single ⟨4864,4992,20864,20992⟩) (.single ⟨4992,5056,20736,20800⟩)))) (.node (.node (.single ⟨4992,5056,20800,20864⟩) (.node (.single ⟨5056,5088,20736,20768⟩) (.single ⟨5056,5088,20768,20800⟩))) (.node (.node (.single ⟨5088,5120,20736,20768⟩) (.single ⟨5088,5120,20768,20800⟩)) (.node (.single ⟨5056,5120,20800,20864⟩) (.single ⟨4992,5120,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,27648,27776⟩) (.node (.single ⟨11776,11904,27776,27904⟩) (.single ⟨11904,11968,27648,27712⟩))) (.node (.single ⟨11904,11968,27712,27776⟩) (.node (.single ⟨11968,12000,27648,27680⟩) (.single ⟨11968,12000,27680,27712⟩)))) (.node (.node (.single ⟨12000,12032,27648,27680⟩) (.node (.single ⟨12000,12032,27680,27712⟩) (.single ⟨11968,12032,27712,27776⟩))) (.node (.node (.single ⟨11904,11968,27776,27840⟩) (.single ⟨11904,11968,27840,27904⟩)) (.node (.single ⟨11968,12032,27776,27840⟩) (.single ⟨11968,12032,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,4864,4928⟩) (.node (.single ⟨20736,20800,4928,4992⟩) (.single ⟨20800,20864,4864,4928⟩))) (.node (.single ⟨20800,20864,4928,4992⟩) (.node (.single ⟨20736,20800,4992,5056⟩) (.single ⟨20736,20768,5056,5088⟩)))) (.node (.node (.single ⟨20736,20768,5088,5120⟩) (.node (.single ⟨20768,20800,5056,5088⟩) (.single ⟨20768,20800,5088,5120⟩))) (.node (.node (.single ⟨20800,20864,4992,5056⟩) (.single ⟨20800,20864,5056,5120⟩)) (.node (.single ⟨20864,20992,4864,4992⟩) (.single ⟨20864,20992,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,11776,11904⟩) (.node (.single ⟨27648,27712,11904,11968⟩) (.single ⟨27648,27680,11968,12000⟩))) (.node (.single ⟨27648,27680,12000,12032⟩) (.node (.single ⟨27680,27712,11968,12000⟩) (.single ⟨27680,27712,12000,12032⟩)))) (.node (.node (.single ⟨27712,27776,11904,11968⟩) (.node (.single ⟨27712,27776,11968,12032⟩) (.single ⟨27776,27904,11776,11904⟩))) (.node (.node (.single ⟨27776,27840,11904,11968⟩) (.single ⟨27776,27840,11968,12032⟩)) (.node (.single ⟨27840,27904,11904,11968⟩) (.single ⟨27840,27904,11968,12032⟩)))))))
def output102 : Fin 52 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData102 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover102 (i : Fin 52) : Fin 52 := ⟨coverData102.get i % 52, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 52) : Fin 52 := ⟨sourceData102.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 .empty (.cutY 20736 .empty (.cutX 4992 (.cutY 20864 (.cutX 4928 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5056 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 5088 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full)))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 (.cutY 27904 (.cutX 11904 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 11968 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 12000 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 11968 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 .empty (.cutY 4864 .empty (.cutX 20864 (.cutY 4992 (.cutX 20800 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 20800 (.cutY 5056 .full (.cutX 20768 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 (.cutY 12032 (.cutX 27776 (.cutY 11904 .full (.cutX 27712 (.cutY 11968 .full (.cutX 27680 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 27840 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty)) .empty))))) .empty) .empty))) .empty))

theorem metadata102 : 0<125829407 ∧ 19<128 ∧ 81<128 ∧ 1<4 ∧
    6312/4160=1 ∧ 6312%4160=2152 ∧ ∀ i, (leaves102 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData102).mp
    (by decide +kernel)

theorem sourceChecked102_0 : ∀ i : Fin 52,
    (fun i => output102 i = raw102 (source102 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked102 : ∀ i : Fin 52, (fun i => output102 i = raw102 (source102 i)) i :=
  forallFin_of_zero_offset (fun i => output102 i = raw102 (source102 i)) sourceChecked102_0

theorem coverChecked102_0 : ∀ i : Fin 52,
    (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked102 : ∀ i : Fin 52, (fun i => (output102 (cover102 i)).ContainsBox (raw102 i)) i :=
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 6197, atom 688, type 0, source (5,73).
def leavesData103 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves103 : Fin 7 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 73 leaves103 i
def outputData103 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,18688,18816⟩) (.node (.single ⟨1280,1408,18816,18944⟩) (.single ⟨1408,1472,18688,18752⟩))) (.node (.node (.single ⟨1408,1472,18752,18816⟩) (.single ⟨1472,1536,18688,18752⟩)) (.node (.single ⟨1472,1536,18752,18816⟩) (.single ⟨1408,1536,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,31232,31360⟩) (.node (.single ⟨13824,13952,31360,31488⟩) (.single ⟨13952,14016,31232,31296⟩))) (.node (.node (.single ⟨13952,14016,31296,31360⟩) (.single ⟨14016,14080,31232,31296⟩)) (.node (.single ⟨14016,14080,31296,31360⟩) (.single ⟨13952,14080,31360,31488⟩))))) (.node (.node (.node (.single ⟨18688,18816,1280,1408⟩) (.node (.single ⟨18688,18752,1408,1472⟩) (.single ⟨18688,18752,1472,1536⟩))) (.node (.node (.single ⟨18752,18816,1408,1472⟩) (.single ⟨18752,18816,1472,1536⟩)) (.node (.single ⟨18816,18944,1280,1408⟩) (.single ⟨18816,18944,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,13824,13952⟩) (.node (.single ⟨31232,31296,13952,14016⟩) (.single ⟨31232,31296,14016,14080⟩))) (.node (.node (.single ⟨31296,31360,13952,14016⟩) (.single ⟨31296,31360,14016,14080⟩)) (.node (.single ⟨31360,31488,13824,13952⟩) (.single ⟨31360,31488,13952,14080⟩))))))
def output103 : Fin 28 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover103 (i : Fin 28) : Fin 28 := ⟨coverData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 28) : Fin 28 := ⟨sourceData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 (.cutX 1280 .empty (.cutY 18688 .empty (.cutX 1408 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 1472 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 .empty (.cutX 14080 (.cutY 31488 (.cutX 13952 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14016 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty) .empty))) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 (.cutX 18688 .empty (.cutY 1280 .empty (.cutX 18816 (.cutY 1408 .full (.cutX 18752 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 .empty (.cutX 31488 (.cutY 14080 (.cutX 31360 (.cutY 13952 .full (.cutX 31296 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)))) .empty) .empty)))))) .empty))

theorem metadata103 : 0<34183877 ∧ 5<128 ∧ 73<128 ∧ 0<4 ∧
    688/4160=0 ∧ 688%4160=688 ∧ ∀ i, (leaves103 i).Valid 8 := by
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 6198, atom 4847, type 1, source (5,72).
def leavesData104 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves104 : Fin 7 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 72 leaves104 i
def outputData104 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,18432,18560⟩) (.node (.single ⟨1280,1408,18560,18688⟩) (.single ⟨1408,1472,18432,18496⟩))) (.node (.node (.single ⟨1408,1472,18496,18560⟩) (.single ⟨1472,1536,18432,18496⟩)) (.node (.single ⟨1472,1536,18496,18560⟩) (.single ⟨1408,1536,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,31232,31360⟩) (.node (.single ⟨14080,14208,31360,31488⟩) (.single ⟨14208,14272,31232,31296⟩))) (.node (.node (.single ⟨14208,14272,31296,31360⟩) (.single ⟨14272,14336,31232,31296⟩)) (.node (.single ⟨14272,14336,31296,31360⟩) (.single ⟨14208,14336,31360,31488⟩))))) (.node (.node (.node (.single ⟨18432,18560,1280,1408⟩) (.node (.single ⟨18432,18496,1408,1472⟩) (.single ⟨18432,18496,1472,1536⟩))) (.node (.node (.single ⟨18496,18560,1408,1472⟩) (.single ⟨18496,18560,1472,1536⟩)) (.node (.single ⟨18560,18688,1280,1408⟩) (.single ⟨18560,18688,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,14080,14208⟩) (.node (.single ⟨31232,31296,14208,14272⟩) (.single ⟨31232,31296,14272,14336⟩))) (.node (.node (.single ⟨31296,31360,14208,14272⟩) (.single ⟨31296,31360,14272,14336⟩)) (.node (.single ⟨31360,31488,14080,14208⟩) (.single ⟨31360,31488,14208,14336⟩))))))
def output104 : Fin 28 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover104 (i : Fin 28) : Fin 28 := ⟨coverData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 28) : Fin 28 := ⟨sourceData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 (.cutX 1280 .empty (.cutY 18688 (.cutX 1408 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 1472 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 .empty (.cutX 14080 .empty (.cutY 31488 (.cutX 14208 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14272 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty)))) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 (.cutX 18688 (.cutY 1280 .empty (.cutX 18560 (.cutY 1408 .full (.cutX 18496 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 .empty (.cutX 31488 (.cutY 14080 .empty (.cutX 31360 (.cutY 14208 .full (.cutX 31296 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)))) .empty) .empty)))))) .empty))

theorem metadata104 : 0<137362203 ∧ 5<128 ∧ 72<128 ∧ 1<4 ∧
    4847/4160=1 ∧ 4847%4160=687 ∧ ∀ i, (leaves104 i).Valid 8 := by
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 6199, atom 921, type 0, source (7,74).
def leavesData105 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves105 : Fin 4 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 74 leaves105 i
def outputData105 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,18944,19072⟩) (.single ⟨1792,1920,19072,19200⟩)) (.node (.single ⟨1920,2048,18944,19072⟩) (.single ⟨1920,2048,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,30720,30848⟩) (.single ⟨13568,13696,30848,30976⟩)) (.node (.single ⟨13696,13824,30720,30848⟩) (.single ⟨13696,13824,30848,30976⟩)))) (.node (.node (.node (.single ⟨18944,19072,1792,1920⟩) (.single ⟨18944,19072,1920,2048⟩)) (.node (.single ⟨19072,19200,1792,1920⟩) (.single ⟨19072,19200,1920,2048⟩))) (.node (.node (.single ⟨30720,30848,13568,13696⟩) (.single ⟨30720,30848,13696,13824⟩)) (.node (.single ⟨30848,30976,13568,13696⟩) (.single ⟨30848,30976,13696,13824⟩)))))
def output105 : Fin 16 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData105 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover105 (i : Fin 16) : Fin 16 := ⟨coverData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 16) : Fin 16 := ⟨sourceData105.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 .empty (.cutX 1792 .empty (.cutY 19200 (.cutX 1920 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty)))) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 (.cutX 13568 .empty (.cutY 30976 (.cutX 13696 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty)) .empty) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 .empty (.cutX 19200 (.cutY 1792 .empty (.cutX 19072 (.cutY 1920 .full .full) (.cutY 1920 .full .full))) .empty)))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 (.cutX 30976 (.cutY 13568 .empty (.cutX 30848 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty) .empty)) .empty) .empty)))))) .empty))

theorem metadata105 : 0<34183877 ∧ 7<128 ∧ 74<128 ∧ 0<4 ∧
    921/4160=0 ∧ 921%4160=921 ∧ ∀ i, (leaves105 i).Valid 8 := by
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 6200, atom 5627, type 1, source (12,75).
def leavesData106 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves106 : Fin 4 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 75 leaves106 i
def outputData106 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,19200,19328⟩) (.single ⟨3072,3200,19328,19456⟩)) (.node (.single ⟨3200,3328,19200,19328⟩) (.single ⟨3200,3328,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,29440,29568⟩) (.single ⟨13312,13440,29568,29696⟩)) (.node (.single ⟨13440,13568,29440,29568⟩) (.single ⟨13440,13568,29568,29696⟩)))) (.node (.node (.node (.single ⟨19200,19328,3072,3200⟩) (.single ⟨19200,19328,3200,3328⟩)) (.node (.single ⟨19328,19456,3072,3200⟩) (.single ⟨19328,19456,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,13312,13440⟩) (.single ⟨29440,29568,13440,13568⟩)) (.node (.single ⟨29568,29696,13312,13440⟩) (.single ⟨29568,29696,13440,13568⟩)))))
def output106 : Fin 16 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData106 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover106 (i : Fin 16) : Fin 16 := ⟨coverData106.get i % 16, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 16) : Fin 16 := ⟨sourceData106.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 (.cutY 19200 .empty (.cutX 3200 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty)) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 (.cutY 29440 .empty (.cutX 13440 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty)) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 .empty (.cutY 3328 (.cutX 19328 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 .empty (.cutY 13568 (.cutX 29568 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata106 : 0<94387549 ∧ 12<128 ∧ 75<128 ∧ 1<4 ∧
    5627/4160=1 ∧ 5627%4160=1467 ∧ ∀ i, (leaves106 i).Valid 8 := by
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 6201, atom 4358, type 1, source (1,71).
def leavesData107 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves107 : Fin 7 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 71 leaves107 i
def outputData107 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,18176,18304⟩) (.node (.single ⟨256,384,18304,18432⟩) (.single ⟨384,448,18176,18240⟩))) (.node (.node (.single ⟨384,448,18240,18304⟩) (.single ⟨448,512,18176,18240⟩)) (.node (.single ⟨448,512,18240,18304⟩) (.single ⟨384,512,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,32256,32384⟩) (.node (.single ⟨14336,14464,32384,32512⟩) (.single ⟨14464,14528,32256,32320⟩))) (.node (.node (.single ⟨14464,14528,32320,32384⟩) (.single ⟨14528,14592,32256,32320⟩)) (.node (.single ⟨14528,14592,32320,32384⟩) (.single ⟨14464,14592,32384,32512⟩))))) (.node (.node (.node (.single ⟨18176,18304,256,384⟩) (.node (.single ⟨18176,18240,384,448⟩) (.single ⟨18176,18240,448,512⟩))) (.node (.node (.single ⟨18240,18304,384,448⟩) (.single ⟨18240,18304,448,512⟩)) (.node (.single ⟨18304,18432,256,384⟩) (.single ⟨18304,18432,384,512⟩)))) (.node (.node (.single ⟨32256,32384,14336,14464⟩) (.node (.single ⟨32256,32320,14464,14528⟩) (.single ⟨32256,32320,14528,14592⟩))) (.node (.node (.single ⟨32320,32384,14464,14528⟩) (.single ⟨32320,32384,14528,14592⟩)) (.node (.single ⟨32384,32512,14336,14464⟩) (.single ⟨32384,32512,14464,14592⟩))))))
def output107 : Fin 28 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover107 (i : Fin 28) : Fin 28 := ⟨coverData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 28) : Fin 28 := ⟨sourceData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 .empty (.cutY 18176 .empty (.cutX 384 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 448 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 (.cutY 32512 (.cutX 14464 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 14528 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty) .empty)) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 .empty (.cutY 256 .empty (.cutX 18304 (.cutY 384 .full (.cutX 18240 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 (.cutY 14592 (.cutX 32384 (.cutY 14464 .full (.cutX 32320 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty)))))))) .empty))

theorem metadata107 : 0<202148459 ∧ 1<128 ∧ 71<128 ∧ 1<4 ∧
    4358/4160=1 ∧ 4358%4160=198 ∧ ∀ i, (leaves107 i).Valid 8 := by
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 6202, atom 199, type 0, source (1,72).
def leavesData108 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves108 : Fin 7 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 72 leaves108 i
def outputData108 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,18432,18560⟩) (.node (.single ⟨256,384,18560,18688⟩) (.single ⟨384,448,18432,18496⟩))) (.node (.node (.single ⟨384,448,18496,18560⟩) (.single ⟨448,512,18432,18496⟩)) (.node (.single ⟨448,512,18496,18560⟩) (.single ⟨384,512,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,32256,32384⟩) (.node (.single ⟨14080,14208,32384,32512⟩) (.single ⟨14208,14272,32256,32320⟩))) (.node (.node (.single ⟨14208,14272,32320,32384⟩) (.single ⟨14272,14336,32256,32320⟩)) (.node (.single ⟨14272,14336,32320,32384⟩) (.single ⟨14208,14336,32384,32512⟩))))) (.node (.node (.node (.single ⟨18432,18560,256,384⟩) (.node (.single ⟨18432,18496,384,448⟩) (.single ⟨18432,18496,448,512⟩))) (.node (.node (.single ⟨18496,18560,384,448⟩) (.single ⟨18496,18560,448,512⟩)) (.node (.single ⟨18560,18688,256,384⟩) (.single ⟨18560,18688,384,512⟩)))) (.node (.node (.single ⟨32256,32384,14080,14208⟩) (.node (.single ⟨32256,32320,14208,14272⟩) (.single ⟨32256,32320,14272,14336⟩))) (.node (.node (.single ⟨32320,32384,14208,14272⟩) (.single ⟨32320,32384,14272,14336⟩)) (.node (.single ⟨32384,32512,14080,14208⟩) (.single ⟨32384,32512,14208,14336⟩))))))
def output108 : Fin 28 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData108 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover108 (i : Fin 28) : Fin 28 := ⟨coverData108.get i % 28, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 28) : Fin 28 := ⟨sourceData108.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 (.cutY 18944 (.cutX 256 .empty (.cutY 18688 (.cutX 384 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 448 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 .empty (.cutY 32256 .empty (.cutX 14080 .empty (.cutY 32512 (.cutX 14208 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 14272 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty))))))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 (.cutY 512 (.cutX 18688 (.cutY 256 .empty (.cutX 18560 (.cutY 384 .full (.cutX 18496 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 .empty (.cutY 13824 .empty (.cutX 32512 (.cutY 14080 .empty (.cutX 32384 (.cutY 14208 .full (.cutX 32320 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty))))) .empty)))))) .empty))

theorem metadata108 : 0<34183877 ∧ 1<128 ∧ 72<128 ∧ 0<4 ∧
    199/4160=0 ∧ 199%4160=199 ∧ ∀ i, (leaves108 i).Valid 8 := by
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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 6203, atom 4231, type 1, source (0,71).
def leavesData109 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves109 : Fin 4 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 71 leaves109 i
def outputData109 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,18176,18304⟩) (.single ⟨0,128,18304,18432⟩)) (.node (.single ⟨128,256,18176,18304⟩) (.single ⟨128,256,18304,18432⟩))) (.node (.node (.single ⟨14336,14464,32512,32640⟩) (.single ⟨14336,14464,32640,32768⟩)) (.node (.single ⟨14464,14592,32512,32640⟩) (.single ⟨14464,14592,32640,32768⟩)))) (.node (.node (.node (.single ⟨18176,18304,0,128⟩) (.single ⟨18176,18304,128,256⟩)) (.node (.single ⟨18304,18432,0,128⟩) (.single ⟨18304,18432,128,256⟩))) (.node (.node (.single ⟨32512,32640,14336,14464⟩) (.single ⟨32512,32640,14464,14592⟩)) (.node (.single ⟨32640,32768,14336,14464⟩) (.single ⟨32640,32768,14464,14592⟩)))))
def output109 : Fin 16 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover109 (i : Fin 16) : Fin 16 := ⟨coverData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 16) : Fin 16 := ⟨sourceData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 (.cutY 18176 .empty (.cutX 128 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 (.cutY 32512 .empty (.cutX 14464 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 .empty (.cutY 256 (.cutX 18304 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 .empty (.cutY 14592 (.cutX 32640 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty)) .empty)))))))) .empty))

theorem metadata109 : 0<202148459 ∧ 0<128 ∧ 71<128 ∧ 1<4 ∧
    4231/4160=1 ∧ 4231%4160=71 ∧ ∀ i, (leaves109 i).Valid 8 := by
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 6204, atom 4728, type 1, source (4,72).
def leavesData110 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves110 : Fin 4 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 72 leaves110 i
def outputData110 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,18432,18560⟩) (.single ⟨1024,1152,18560,18688⟩)) (.node (.single ⟨1152,1280,18432,18560⟩) (.single ⟨1152,1280,18560,18688⟩))) (.node (.node (.single ⟨14080,14208,31488,31616⟩) (.single ⟨14080,14208,31616,31744⟩)) (.node (.single ⟨14208,14336,31488,31616⟩) (.single ⟨14208,14336,31616,31744⟩)))) (.node (.node (.node (.single ⟨18432,18560,1024,1152⟩) (.single ⟨18432,18560,1152,1280⟩)) (.node (.single ⟨18560,18688,1024,1152⟩) (.single ⟨18560,18688,1152,1280⟩))) (.node (.node (.single ⟨31488,31616,14080,14208⟩) (.single ⟨31488,31616,14208,14336⟩)) (.node (.single ⟨31616,31744,14080,14208⟩) (.single ⟨31616,31744,14208,14336⟩)))))
def output110 : Fin 16 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData110 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover110 (i : Fin 16) : Fin 16 := ⟨coverData110.get i % 16, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 16) : Fin 16 := ⟨sourceData110.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 (.cutX 1280 (.cutY 18688 (.cutX 1152 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 .empty (.cutX 14080 .empty (.cutY 31488 .empty (.cutX 14208 (.cutY 31616 .full .full) (.cutY 31616 .full .full)))))) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 (.cutX 18688 (.cutY 1280 (.cutX 18560 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 .empty (.cutX 31488 .empty (.cutY 14080 .empty (.cutX 31616 (.cutY 14208 .full .full) (.cutY 14208 .full .full))))))) .empty) .empty)))))) .empty))

theorem metadata110 : 0<137362203 ∧ 4<128 ∧ 72<128 ∧ 1<4 ∧
    4728/4160=1 ∧ 4728%4160=568 ∧ ∀ i, (leaves110 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData110).mp
    (by decide +kernel)

theorem sourceChecked110_0 : ∀ i : Fin 16,
    (fun i => output110 i = raw110 (source110 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked110 : ∀ i : Fin 16, (fun i => output110 i = raw110 (source110 i)) i :=
  forallFin_of_zero_offset (fun i => output110 i = raw110 (source110 i)) sourceChecked110_0

theorem coverChecked110_0 : ∀ i : Fin 16,
    (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked110 : ∀ i : Fin 16, (fun i => (output110 (cover110 i)).ContainsBox (raw110 i)) i :=
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 6205, atom 1776, type 0, source (15,81).
def leavesData111 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves111 : Fin 7 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 81 leaves111 i
def outputData111 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,20736,20864⟩) (.node (.single ⟨3840,3968,20864,20992⟩) (.single ⟨3968,4032,20736,20800⟩))) (.node (.node (.single ⟨3968,4032,20800,20864⟩) (.single ⟨4032,4096,20736,20800⟩)) (.node (.single ⟨4032,4096,20800,20864⟩) (.single ⟨3968,4096,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,28672,28800⟩) (.node (.single ⟨11776,11904,28800,28928⟩) (.single ⟨11904,11968,28672,28736⟩))) (.node (.node (.single ⟨11904,11968,28736,28800⟩) (.single ⟨11968,12032,28672,28736⟩)) (.node (.single ⟨11968,12032,28736,28800⟩) (.single ⟨11904,12032,28800,28928⟩))))) (.node (.node (.node (.single ⟨20736,20864,3840,3968⟩) (.node (.single ⟨20736,20800,3968,4032⟩) (.single ⟨20736,20800,4032,4096⟩))) (.node (.node (.single ⟨20800,20864,3968,4032⟩) (.single ⟨20800,20864,4032,4096⟩)) (.node (.single ⟨20864,20992,3840,3968⟩) (.single ⟨20864,20992,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,11776,11904⟩) (.node (.single ⟨28672,28736,11904,11968⟩) (.single ⟨28672,28736,11968,12032⟩))) (.node (.node (.single ⟨28736,28800,11904,11968⟩) (.single ⟨28736,28800,11968,12032⟩)) (.node (.single ⟨28800,28928,11776,11904⟩) (.single ⟨28800,28928,11904,12032⟩))))))
def output111 : Fin 28 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData111 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover111 (i : Fin 28) : Fin 28 := ⟨coverData111.get i % 28, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 28) : Fin 28 := ⟨sourceData111.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 (.cutX 3840 .empty (.cutY 20736 .empty (.cutX 3968 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 4032 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 .empty (.cutY 29184 (.cutX 12032 (.cutY 28928 (.cutX 11904 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 11968 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty)) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 (.cutY 3584 .empty (.cutX 20736 .empty (.cutY 3840 .empty (.cutX 20864 (.cutY 3968 .full (.cutX 20800 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 .empty (.cutX 28928 (.cutY 12032 (.cutX 28800 (.cutY 11904 .full (.cutX 28736 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata111 : 0<72090291 ∧ 15<128 ∧ 81<128 ∧ 0<4 ∧
    1776/4160=0 ∧ 1776%4160=1776 ∧ ∀ i, (leaves111 i).Valid 8 := by
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111].sum

theorem actual_batch_mass : batchActualMass = (5371362017/655360000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch06094
#print axioms NoThreeLine.ScheduleUnionBatch06094.actual_batch_mass
