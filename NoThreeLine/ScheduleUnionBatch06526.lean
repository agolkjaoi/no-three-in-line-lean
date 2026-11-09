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
namespace NoThreeLine.ScheduleUnionBatch06526

-- Frozen phase 6526, atom 6226, type 1, source (18,86).
def leavesData0 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves0 : Fin 13 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 86 leaves0 i
def outputData0 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4736,22016,22144⟩) (.node (.single ⟨4608,4736,22144,22272⟩) (.single ⟨4736,4800,22016,22080⟩))) (.node (.single ⟨4736,4800,22080,22144⟩) (.node (.single ⟨4800,4832,22016,22048⟩) (.single ⟨4800,4832,22048,22080⟩)))) (.node (.node (.single ⟨4832,4864,22016,22048⟩) (.node (.single ⟨4832,4864,22048,22080⟩) (.single ⟨4800,4864,22080,22144⟩))) (.node (.node (.single ⟨4736,4800,22144,22208⟩) (.single ⟨4736,4800,22208,22272⟩)) (.node (.single ⟨4800,4864,22144,22208⟩) (.single ⟨4800,4864,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,27904,27968⟩) (.node (.single ⟨10496,10560,27968,28032⟩) (.single ⟨10560,10624,27904,27968⟩))) (.node (.single ⟨10560,10624,27968,28032⟩) (.node (.single ⟨10496,10624,28032,28160⟩) (.single ⟨10624,10688,27904,27968⟩)))) (.node (.node (.single ⟨10624,10688,27968,28032⟩) (.node (.single ⟨10688,10720,27904,27936⟩) (.single ⟨10688,10720,27936,27968⟩))) (.node (.node (.single ⟨10720,10752,27904,27936⟩) (.single ⟨10720,10752,27936,27968⟩)) (.node (.single ⟨10688,10752,27968,28032⟩) (.single ⟨10624,10752,28032,28160⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,4608,4736⟩) (.node (.single ⟨22016,22080,4736,4800⟩) (.single ⟨22016,22048,4800,4832⟩))) (.node (.single ⟨22016,22048,4832,4864⟩) (.node (.single ⟨22048,22080,4800,4832⟩) (.single ⟨22048,22080,4832,4864⟩)))) (.node (.node (.single ⟨22080,22144,4736,4800⟩) (.node (.single ⟨22080,22144,4800,4864⟩) (.single ⟨22144,22272,4608,4736⟩))) (.node (.node (.single ⟨22144,22208,4736,4800⟩) (.single ⟨22144,22208,4800,4864⟩)) (.node (.single ⟨22208,22272,4736,4800⟩) (.single ⟨22208,22272,4800,4864⟩))))) (.node (.node (.node (.single ⟨27904,27968,10496,10560⟩) (.node (.single ⟨27904,27968,10560,10624⟩) (.single ⟨27968,28032,10496,10560⟩))) (.node (.single ⟨27968,28032,10560,10624⟩) (.node (.single ⟨27904,27968,10624,10688⟩) (.single ⟨27904,27936,10688,10720⟩)))) (.node (.node (.single ⟨27904,27936,10720,10752⟩) (.node (.single ⟨27936,27968,10688,10720⟩) (.single ⟨27936,27968,10720,10752⟩))) (.node (.node (.single ⟨27968,28032,10624,10688⟩) (.single ⟨27968,28032,10688,10752⟩)) (.node (.single ⟨28032,28160,10496,10624⟩) (.single ⟨28032,28160,10624,10752⟩)))))))
def output0 : Fin 52 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData0 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover0 (i : Fin 52) : Fin 52 := ⟨coverData0.get i % 52, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 52) : Fin 52 := ⟨sourceData0.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 .empty (.cutY 22016 .empty (.cutX 4864 (.cutY 22272 (.cutX 4736 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 4800 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 4832 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) (.cutX 4800 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty)))) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 (.cutY 28160 (.cutX 10496 .empty (.cutY 27904 .empty (.cutX 10624 (.cutY 28032 (.cutX 10560 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 10688 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 10720 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) .full)))) .empty) .empty)) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 .empty (.cutY 4608 .empty (.cutX 22272 (.cutY 4864 (.cutX 22144 (.cutY 4736 .full (.cutX 22080 (.cutY 4800 .full (.cutX 22048 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 22208 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty) .empty))) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 (.cutY 10752 (.cutX 27904 .empty (.cutY 10496 .empty (.cutX 28032 (.cutY 10624 (.cutX 27968 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 27968 (.cutY 10688 .full (.cutX 27936 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty)))) .empty) .empty))) .empty))

theorem metadata0 : 0<125829407 ∧ 18<128 ∧ 86<128 ∧ 1<4 ∧
    6226/4160=1 ∧ 6226%4160=2066 ∧ ∀ i, (leaves0 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData0).mp
    (by decide +kernel)

theorem sourceChecked0_0 : ∀ i : Fin 52,
    (fun i => output0 i = raw0 (source0 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked0 : ∀ i : Fin 52, (fun i => output0 i = raw0 (source0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i)) sourceChecked0_0

theorem coverChecked0_0 : ∀ i : Fin 52,
    (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked0 : ∀ i : Fin 52, (fun i => (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 6527, atom 6319, type 1, source (19,88).
def leavesData1 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves1 : Fin 19 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 19 88 leaves1 i
def outputData1 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,22528,22592⟩) (.single ⟨4864,4928,22592,22656⟩)) (.node (.single ⟨4928,4992,22528,22592⟩) (.single ⟨4928,4992,22592,22656⟩))) (.node (.node (.single ⟨4864,4992,22656,22784⟩) (.single ⟨4992,5056,22528,22592⟩)) (.node (.single ⟨4992,5056,22592,22656⟩) (.node (.single ⟨5056,5088,22528,22560⟩) (.single ⟨5056,5088,22560,22592⟩))))) (.node (.node (.node (.single ⟨5088,5120,22528,22560⟩) (.single ⟨5088,5120,22560,22592⟩)) (.node (.single ⟨5056,5088,22592,22624⟩) (.node (.single ⟨5056,5088,22624,22656⟩) (.single ⟨5088,5120,22592,22624⟩)))) (.node (.node (.single ⟨5088,5120,22624,22656⟩) (.single ⟨4992,5056,22656,22720⟩)) (.node (.single ⟨4992,5056,22720,22784⟩) (.node (.single ⟨5056,5120,22656,22720⟩) (.single ⟨5056,5120,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨9984,10048,27648,27712⟩) (.single ⟨9984,10048,27712,27776⟩)) (.node (.single ⟨10048,10112,27648,27712⟩) (.single ⟨10048,10112,27712,27776⟩))) (.node (.node (.single ⟨9984,10112,27776,27904⟩) (.single ⟨10112,10144,27648,27680⟩)) (.node (.single ⟨10112,10144,27680,27712⟩) (.node (.single ⟨10144,10176,27648,27680⟩) (.single ⟨10144,10176,27680,27712⟩))))) (.node (.node (.node (.single ⟨10112,10176,27712,27776⟩) (.single ⟨10176,10208,27648,27680⟩)) (.node (.single ⟨10176,10208,27680,27712⟩) (.node (.single ⟨10208,10240,27648,27680⟩) (.single ⟨10208,10240,27680,27712⟩)))) (.node (.node (.single ⟨10176,10240,27712,27776⟩) (.single ⟨10112,10176,27776,27840⟩)) (.node (.single ⟨10112,10176,27840,27904⟩) (.node (.single ⟨10176,10240,27776,27840⟩) (.single ⟨10176,10240,27840,27904⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22528,22592,4864,4928⟩) (.single ⟨22528,22592,4928,4992⟩)) (.node (.single ⟨22592,22656,4864,4928⟩) (.single ⟨22592,22656,4928,4992⟩))) (.node (.node (.single ⟨22528,22592,4992,5056⟩) (.single ⟨22528,22560,5056,5088⟩)) (.node (.single ⟨22528,22560,5088,5120⟩) (.node (.single ⟨22560,22592,5056,5088⟩) (.single ⟨22560,22592,5088,5120⟩))))) (.node (.node (.node (.single ⟨22592,22656,4992,5056⟩) (.single ⟨22592,22624,5056,5088⟩)) (.node (.single ⟨22592,22624,5088,5120⟩) (.node (.single ⟨22624,22656,5056,5088⟩) (.single ⟨22624,22656,5088,5120⟩)))) (.node (.node (.single ⟨22656,22784,4864,4992⟩) (.single ⟨22656,22720,4992,5056⟩)) (.node (.single ⟨22656,22720,5056,5120⟩) (.node (.single ⟨22720,22784,4992,5056⟩) (.single ⟨22720,22784,5056,5120⟩)))))) (.node (.node (.node (.node (.single ⟨27648,27712,9984,10048⟩) (.single ⟨27648,27712,10048,10112⟩)) (.node (.single ⟨27712,27776,9984,10048⟩) (.single ⟨27712,27776,10048,10112⟩))) (.node (.node (.single ⟨27648,27680,10112,10144⟩) (.single ⟨27648,27680,10144,10176⟩)) (.node (.single ⟨27680,27712,10112,10144⟩) (.node (.single ⟨27680,27712,10144,10176⟩) (.single ⟨27648,27680,10176,10208⟩))))) (.node (.node (.node (.single ⟨27648,27680,10208,10240⟩) (.single ⟨27680,27712,10176,10208⟩)) (.node (.single ⟨27680,27712,10208,10240⟩) (.node (.single ⟨27712,27776,10112,10176⟩) (.single ⟨27712,27776,10176,10240⟩)))) (.node (.node (.single ⟨27776,27904,9984,10112⟩) (.single ⟨27776,27840,10112,10176⟩)) (.node (.single ⟨27776,27840,10176,10240⟩) (.node (.single ⟨27840,27904,10112,10176⟩) (.single ⟨27840,27904,10176,10240⟩))))))))
def output1 : Fin 76 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData1 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover1 (i : Fin 76) : Fin 76 := ⟨coverData1.get i % 76, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 76) : Fin 76 := ⟨sourceData1.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 (.cutX 4864 .empty (.cutY 22784 (.cutX 4992 (.cutY 22656 (.cutX 4928 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 5056 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 5088 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) (.cutX 5088 (.cutY 22624 .full .full) (.cutY 22624 .full .full)))) (.cutX 5056 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 .empty (.cutY 28160 (.cutX 9984 .empty (.cutY 27904 (.cutX 10112 (.cutY 27776 (.cutX 10048 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full) (.cutY 27776 (.cutX 10176 (.cutY 27712 (.cutX 10144 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full) (.cutY 27712 (.cutX 10208 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 10176 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty))))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 (.cutY 4608 .empty (.cutX 22784 (.cutY 4864 .empty (.cutX 22656 (.cutY 4992 (.cutX 22592 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 22592 (.cutY 5056 .full (.cutX 22560 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full (.cutX 22624 (.cutY 5088 .full .full) (.cutY 5088 .full .full))))) (.cutY 4992 .full (.cutX 22720 (.cutY 5056 .full .full) (.cutY 5056 .full .full))))) .empty)) .empty) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 .empty (.cutX 27904 (.cutY 9984 .empty (.cutX 27776 (.cutY 10112 (.cutX 27712 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 27712 (.cutY 10176 (.cutX 27680 (.cutY 10144 .full .full) (.cutY 10144 .full .full)) (.cutX 27680 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 27840 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty)) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata1 : 0<192153497 ∧ 19<128 ∧ 88<128 ∧ 1<4 ∧
    6319/4160=1 ∧ 6319%4160=2159 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 64,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked1_64 : ∀ i : Fin 12,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 76, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) (forallFinOffset_add (fun i => output1 i = raw1 (source1 i)) 0 64 12 (by decide) sourceChecked1_0
    sourceChecked1_64)

theorem coverChecked1_0 : ∀ i : Fin 64,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked1_64 : ∀ i : Fin 12,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 76, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
  forallFin_of_zero_offset (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (forallFinOffset_add (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) 0 64 12 (by decide) coverChecked1_0
    coverChecked1_64)

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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 6528, atom 2254, type 0, source (20,94).
def leavesData2 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves2 : Fin 13 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 94 leaves2 i
def outputData2 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,24064,24128⟩) (.node (.single ⟨5120,5184,24128,24192⟩) (.single ⟨5184,5248,24064,24128⟩))) (.node (.single ⟨5184,5248,24128,24192⟩) (.node (.single ⟨5120,5248,24192,24320⟩) (.single ⟨5248,5312,24064,24128⟩)))) (.node (.node (.single ⟨5248,5312,24128,24192⟩) (.node (.single ⟨5312,5344,24064,24096⟩) (.single ⟨5312,5344,24096,24128⟩))) (.node (.node (.single ⟨5344,5376,24064,24096⟩) (.single ⟨5344,5376,24096,24128⟩)) (.node (.single ⟨5312,5376,24128,24192⟩) (.single ⟨5248,5376,24192,24320⟩))))) (.node (.node (.node (.single ⟨8448,8576,27392,27520⟩) (.node (.single ⟨8448,8576,27520,27648⟩) (.single ⟨8576,8640,27392,27456⟩))) (.node (.single ⟨8576,8640,27456,27520⟩) (.node (.single ⟨8640,8672,27392,27424⟩) (.single ⟨8640,8672,27424,27456⟩)))) (.node (.node (.single ⟨8672,8704,27392,27424⟩) (.node (.single ⟨8672,8704,27424,27456⟩) (.single ⟨8640,8704,27456,27520⟩))) (.node (.node (.single ⟨8576,8640,27520,27584⟩) (.single ⟨8576,8640,27584,27648⟩)) (.node (.single ⟨8640,8704,27520,27584⟩) (.single ⟨8640,8704,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,5120,5184⟩) (.node (.single ⟨24064,24128,5184,5248⟩) (.single ⟨24128,24192,5120,5184⟩))) (.node (.single ⟨24128,24192,5184,5248⟩) (.node (.single ⟨24064,24128,5248,5312⟩) (.single ⟨24064,24096,5312,5344⟩)))) (.node (.node (.single ⟨24064,24096,5344,5376⟩) (.node (.single ⟨24096,24128,5312,5344⟩) (.single ⟨24096,24128,5344,5376⟩))) (.node (.node (.single ⟨24128,24192,5248,5312⟩) (.single ⟨24128,24192,5312,5376⟩)) (.node (.single ⟨24192,24320,5120,5248⟩) (.single ⟨24192,24320,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,8448,8576⟩) (.node (.single ⟨27392,27456,8576,8640⟩) (.single ⟨27392,27424,8640,8672⟩))) (.node (.single ⟨27392,27424,8672,8704⟩) (.node (.single ⟨27424,27456,8640,8672⟩) (.single ⟨27424,27456,8672,8704⟩)))) (.node (.node (.single ⟨27456,27520,8576,8640⟩) (.node (.single ⟨27456,27520,8640,8704⟩) (.single ⟨27520,27648,8448,8576⟩))) (.node (.node (.single ⟨27520,27584,8576,8640⟩) (.single ⟨27520,27584,8640,8704⟩)) (.node (.single ⟨27584,27648,8576,8640⟩) (.single ⟨27584,27648,8640,8704⟩)))))))
def output2 : Fin 52 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover2 (i : Fin 52) : Fin 52 := ⟨coverData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 52) : Fin 52 := ⟨sourceData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 .empty (.cutX 5376 (.cutY 24320 (.cutX 5248 (.cutY 24192 (.cutX 5184 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 5312 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 5344 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) .full)) .empty) .empty)) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 (.cutY 27136 .empty (.cutX 8448 .empty (.cutY 27392 .empty (.cutX 8576 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 8640 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 8672 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 8640 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))))) .empty) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 .empty (.cutY 5632 (.cutX 24320 (.cutY 5376 (.cutX 24192 (.cutY 5248 (.cutX 24128 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 24128 (.cutY 5312 .full (.cutX 24096 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty)))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 (.cutX 27392 .empty (.cutY 8448 .empty (.cutX 27520 (.cutY 8576 .full (.cutX 27456 (.cutY 8640 .full (.cutX 27424 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 27584 (.cutY 8640 .full .full) (.cutY 8640 .full .full)))))) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata2 : 0<156282496 ∧ 20<128 ∧ 94<128 ∧ 0<4 ∧
    2254/4160=0 ∧ 2254%4160=2254 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 6529, atom 2342, type 0, source (21,95).
def leavesData3 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves3 : Fin 7 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 95 leaves3 i
def outputData3 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,24320,24448⟩) (.node (.single ⟨5376,5504,24448,24576⟩) (.single ⟨5504,5568,24320,24384⟩))) (.node (.node (.single ⟨5504,5568,24384,24448⟩) (.single ⟨5568,5632,24320,24384⟩)) (.node (.single ⟨5568,5632,24384,24448⟩) (.single ⟨5504,5632,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,27136,27264⟩) (.node (.single ⟨8192,8320,27264,27392⟩) (.single ⟨8320,8384,27136,27200⟩))) (.node (.node (.single ⟨8320,8384,27200,27264⟩) (.single ⟨8384,8448,27136,27200⟩)) (.node (.single ⟨8384,8448,27200,27264⟩) (.single ⟨8320,8448,27264,27392⟩))))) (.node (.node (.node (.single ⟨24320,24448,5376,5504⟩) (.node (.single ⟨24320,24384,5504,5568⟩) (.single ⟨24320,24384,5568,5632⟩))) (.node (.node (.single ⟨24384,24448,5504,5568⟩) (.single ⟨24384,24448,5568,5632⟩)) (.node (.single ⟨24448,24576,5376,5504⟩) (.single ⟨24448,24576,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,8192,8320⟩) (.node (.single ⟨27136,27200,8320,8384⟩) (.single ⟨27136,27200,8384,8448⟩))) (.node (.node (.single ⟨27200,27264,8320,8384⟩) (.single ⟨27200,27264,8384,8448⟩)) (.node (.single ⟨27264,27392,8192,8320⟩) (.single ⟨27264,27392,8320,8448⟩))))))
def output3 : Fin 28 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover3 (i : Fin 28) : Fin 28 := ⟨coverData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 28) : Fin 28 := ⟨sourceData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 .empty (.cutX 5376 .empty (.cutY 24320 .empty (.cutX 5504 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 5568 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 (.cutY 27136 .empty (.cutX 8448 (.cutY 27392 (.cutX 8320 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 8384 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 .empty (.cutY 5632 (.cutX 24320 .empty (.cutY 5376 .empty (.cutX 24448 (.cutY 5504 .full (.cutX 24384 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty)))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 (.cutX 27392 (.cutY 8448 (.cutX 27264 (.cutY 8320 .full (.cutX 27200 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata3 : 0<156282496 ∧ 21<128 ∧ 95<128 ∧ 0<4 ∧
    2342/4160=0 ∧ 2342%4160=2342 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 6530, atom 1882, type 0, source (16,90).
def leavesData4 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves4 : Fin 16 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 16 90 leaves4 i
def outputData4 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4096,4160,23040,23104⟩) (.single ⟨4096,4160,23104,23168⟩)) (.node (.single ⟨4160,4224,23040,23104⟩) (.single ⟨4160,4224,23104,23168⟩))) (.node (.node (.single ⟨4096,4224,23168,23296⟩) (.single ⟨4224,4288,23040,23104⟩)) (.node (.single ⟨4224,4288,23104,23168⟩) (.single ⟨4288,4320,23040,23072⟩)))) (.node (.node (.node (.single ⟨4288,4320,23072,23104⟩) (.single ⟨4320,4352,23040,23072⟩)) (.node (.single ⟨4320,4352,23072,23104⟩) (.single ⟨4288,4352,23104,23168⟩))) (.node (.node (.single ⟨4224,4288,23168,23232⟩) (.single ⟨4224,4288,23232,23296⟩)) (.node (.single ⟨4288,4352,23168,23232⟩) (.single ⟨4288,4352,23232,23296⟩))))) (.node (.node (.node (.node (.single ⟨9472,9536,28416,28480⟩) (.single ⟨9472,9536,28480,28544⟩)) (.node (.single ⟨9536,9600,28416,28480⟩) (.single ⟨9536,9600,28480,28544⟩))) (.node (.node (.single ⟨9472,9600,28544,28672⟩) (.single ⟨9600,9664,28416,28480⟩)) (.node (.single ⟨9600,9664,28480,28544⟩) (.single ⟨9664,9696,28416,28448⟩)))) (.node (.node (.node (.single ⟨9664,9696,28448,28480⟩) (.single ⟨9696,9728,28416,28448⟩)) (.node (.single ⟨9696,9728,28448,28480⟩) (.single ⟨9664,9728,28480,28544⟩))) (.node (.node (.single ⟨9600,9664,28544,28608⟩) (.single ⟨9600,9664,28608,28672⟩)) (.node (.single ⟨9664,9728,28544,28608⟩) (.single ⟨9664,9728,28608,28672⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23040,23104,4096,4160⟩) (.single ⟨23040,23104,4160,4224⟩)) (.node (.single ⟨23104,23168,4096,4160⟩) (.single ⟨23104,23168,4160,4224⟩))) (.node (.node (.single ⟨23040,23104,4224,4288⟩) (.single ⟨23040,23072,4288,4320⟩)) (.node (.single ⟨23040,23072,4320,4352⟩) (.single ⟨23072,23104,4288,4320⟩)))) (.node (.node (.node (.single ⟨23072,23104,4320,4352⟩) (.single ⟨23104,23168,4224,4288⟩)) (.node (.single ⟨23104,23168,4288,4352⟩) (.single ⟨23168,23296,4096,4224⟩))) (.node (.node (.single ⟨23168,23232,4224,4288⟩) (.single ⟨23168,23232,4288,4352⟩)) (.node (.single ⟨23232,23296,4224,4288⟩) (.single ⟨23232,23296,4288,4352⟩))))) (.node (.node (.node (.node (.single ⟨28416,28480,9472,9536⟩) (.single ⟨28416,28480,9536,9600⟩)) (.node (.single ⟨28480,28544,9472,9536⟩) (.single ⟨28480,28544,9536,9600⟩))) (.node (.node (.single ⟨28416,28480,9600,9664⟩) (.single ⟨28416,28448,9664,9696⟩)) (.node (.single ⟨28416,28448,9696,9728⟩) (.single ⟨28448,28480,9664,9696⟩)))) (.node (.node (.node (.single ⟨28448,28480,9696,9728⟩) (.single ⟨28480,28544,9600,9664⟩)) (.node (.single ⟨28480,28544,9664,9728⟩) (.single ⟨28544,28672,9472,9600⟩))) (.node (.node (.single ⟨28544,28608,9600,9664⟩) (.single ⟨28544,28608,9664,9728⟩)) (.node (.single ⟨28608,28672,9600,9664⟩) (.single ⟨28608,28672,9664,9728⟩)))))))
def output4 : Fin 64 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData4 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover4 (i : Fin 64) : Fin 64 := ⟨coverData4.get i % 64, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 64) : Fin 64 := ⟨sourceData4.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 (.cutY 23040 .empty (.cutX 4352 (.cutY 23296 (.cutX 4224 (.cutY 23168 (.cutX 4160 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 4288 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 4320 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) (.cutX 4288 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 .empty (.cutX 9472 .empty (.cutY 28416 .empty (.cutX 9600 (.cutY 28544 (.cutX 9536 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 9664 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 9696 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 9664 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))))) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 (.cutX 23296 (.cutY 4352 (.cutX 23168 (.cutY 4224 (.cutX 23104 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 23104 (.cutY 4288 .full (.cutX 23072 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 23232 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 .empty (.cutY 9728 (.cutX 28416 .empty (.cutY 9472 .empty (.cutX 28544 (.cutY 9600 (.cutX 28480 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 28480 (.cutY 9664 .full (.cutX 28448 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 28608 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty)))) .empty)) .empty) .empty))) .empty))

theorem metadata4 : 0<156282496 ∧ 16<128 ∧ 90<128 ∧ 0<4 ∧
    1882/4160=0 ∧ 1882%4160=1882 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 64,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 64, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 64,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 64, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 6531, atom 6749, type 1, source (24,93).
def leavesData5 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves5 : Fin 10 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 93 leaves5 i
def outputData5 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,23808,23872⟩) (.single ⟨6144,6208,23872,23936⟩)) (.node (.single ⟨6208,6272,23808,23872⟩) (.node (.single ⟨6208,6272,23872,23936⟩) (.single ⟨6144,6272,23936,24064⟩)))) (.node (.node (.single ⟨6272,6336,23808,23872⟩) (.single ⟨6272,6336,23872,23936⟩)) (.node (.single ⟨6336,6400,23808,23872⟩) (.node (.single ⟨6336,6400,23872,23936⟩) (.single ⟨6272,6400,23936,24064⟩))))) (.node (.node (.node (.single ⟨8704,8832,26368,26496⟩) (.single ⟨8704,8832,26496,26624⟩)) (.node (.single ⟨8832,8896,26368,26432⟩) (.node (.single ⟨8832,8896,26432,26496⟩) (.single ⟨8896,8960,26368,26432⟩)))) (.node (.node (.single ⟨8896,8960,26432,26496⟩) (.single ⟨8832,8896,26496,26560⟩)) (.node (.single ⟨8832,8896,26560,26624⟩) (.node (.single ⟨8896,8960,26496,26560⟩) (.single ⟨8896,8960,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨23808,23872,6144,6208⟩) (.single ⟨23808,23872,6208,6272⟩)) (.node (.single ⟨23872,23936,6144,6208⟩) (.node (.single ⟨23872,23936,6208,6272⟩) (.single ⟨23808,23872,6272,6336⟩)))) (.node (.node (.single ⟨23808,23872,6336,6400⟩) (.single ⟨23872,23936,6272,6336⟩)) (.node (.single ⟨23872,23936,6336,6400⟩) (.node (.single ⟨23936,24064,6144,6272⟩) (.single ⟨23936,24064,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,8704,8832⟩) (.single ⟨26368,26432,8832,8896⟩)) (.node (.single ⟨26368,26432,8896,8960⟩) (.node (.single ⟨26432,26496,8832,8896⟩) (.single ⟨26432,26496,8896,8960⟩)))) (.node (.node (.single ⟨26496,26624,8704,8832⟩) (.single ⟨26496,26560,8832,8896⟩)) (.node (.single ⟨26496,26560,8896,8960⟩) (.node (.single ⟨26560,26624,8832,8896⟩) (.single ⟨26560,26624,8896,8960⟩)))))))
def output5 : Fin 40 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover5 (i : Fin 40) : Fin 40 := ⟨coverData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 40) : Fin 40 := ⟨sourceData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 (.cutY 24064 (.cutX 6400 (.cutY 23808 .empty (.cutX 6272 (.cutY 23936 (.cutX 6208 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 6336 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full))) .empty) .empty) .empty)) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 .empty (.cutY 26112 .empty (.cutX 8960 (.cutY 26368 .empty (.cutX 8832 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 8896 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 8896 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)))) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 (.cutY 6656 (.cutX 23808 .empty (.cutY 6400 (.cutX 23936 (.cutY 6272 (.cutX 23872 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 23872 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 .empty (.cutY 8704 .empty (.cutX 26368 .empty (.cutY 8960 (.cutX 26496 (.cutY 8832 .full (.cutX 26432 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 26560 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty)))) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata5 : 0<149239428 ∧ 24<128 ∧ 93<128 ∧ 1<4 ∧
    6749/4160=1 ∧ 6749%4160=2589 ∧ ∀ i, (leaves5 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData5).mp
    (by decide +kernel)

theorem sourceChecked5_0 : ∀ i : Fin 40,
    (fun i => output5 i = raw5 (source5 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked5 : ∀ i : Fin 40, (fun i => output5 i = raw5 (source5 i)) i :=
  forallFin_of_zero_offset (fun i => output5 i = raw5 (source5 i)) sourceChecked5_0

theorem coverChecked5_0 : ∀ i : Fin 40,
    (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked5 : ∀ i : Fin 40, (fun i => (output5 (cover5 i)).ContainsBox (raw5 i)) i :=
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 6532, atom 6410, type 1, source (20,90).
def leavesData6 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves6 : Fin 16 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 20 90 leaves6 i
def outputData6 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5120,5184,23040,23104⟩) (.single ⟨5120,5184,23104,23168⟩)) (.node (.single ⟨5184,5248,23040,23104⟩) (.single ⟨5184,5248,23104,23168⟩))) (.node (.node (.single ⟨5120,5248,23168,23296⟩) (.single ⟨5248,5312,23040,23104⟩)) (.node (.single ⟨5248,5312,23104,23168⟩) (.single ⟨5312,5344,23040,23072⟩)))) (.node (.node (.node (.single ⟨5312,5344,23072,23104⟩) (.single ⟨5344,5376,23040,23072⟩)) (.node (.single ⟨5344,5376,23072,23104⟩) (.single ⟨5312,5376,23104,23168⟩))) (.node (.node (.single ⟨5248,5312,23168,23232⟩) (.single ⟨5248,5312,23232,23296⟩)) (.node (.single ⟨5312,5376,23168,23232⟩) (.single ⟨5312,5376,23232,23296⟩))))) (.node (.node (.node (.node (.single ⟨9472,9536,27392,27456⟩) (.single ⟨9472,9536,27456,27520⟩)) (.node (.single ⟨9536,9600,27392,27456⟩) (.single ⟨9536,9600,27456,27520⟩))) (.node (.node (.single ⟨9472,9600,27520,27648⟩) (.single ⟨9600,9664,27392,27456⟩)) (.node (.single ⟨9600,9664,27456,27520⟩) (.single ⟨9664,9696,27392,27424⟩)))) (.node (.node (.node (.single ⟨9664,9696,27424,27456⟩) (.single ⟨9696,9728,27392,27424⟩)) (.node (.single ⟨9696,9728,27424,27456⟩) (.single ⟨9664,9728,27456,27520⟩))) (.node (.node (.single ⟨9600,9664,27520,27584⟩) (.single ⟨9600,9664,27584,27648⟩)) (.node (.single ⟨9664,9728,27520,27584⟩) (.single ⟨9664,9728,27584,27648⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23040,23104,5120,5184⟩) (.single ⟨23040,23104,5184,5248⟩)) (.node (.single ⟨23104,23168,5120,5184⟩) (.single ⟨23104,23168,5184,5248⟩))) (.node (.node (.single ⟨23040,23104,5248,5312⟩) (.single ⟨23040,23072,5312,5344⟩)) (.node (.single ⟨23040,23072,5344,5376⟩) (.single ⟨23072,23104,5312,5344⟩)))) (.node (.node (.node (.single ⟨23072,23104,5344,5376⟩) (.single ⟨23104,23168,5248,5312⟩)) (.node (.single ⟨23104,23168,5312,5376⟩) (.single ⟨23168,23296,5120,5248⟩))) (.node (.node (.single ⟨23168,23232,5248,5312⟩) (.single ⟨23168,23232,5312,5376⟩)) (.node (.single ⟨23232,23296,5248,5312⟩) (.single ⟨23232,23296,5312,5376⟩))))) (.node (.node (.node (.node (.single ⟨27392,27456,9472,9536⟩) (.single ⟨27392,27456,9536,9600⟩)) (.node (.single ⟨27456,27520,9472,9536⟩) (.single ⟨27456,27520,9536,9600⟩))) (.node (.node (.single ⟨27392,27456,9600,9664⟩) (.single ⟨27392,27424,9664,9696⟩)) (.node (.single ⟨27392,27424,9696,9728⟩) (.single ⟨27424,27456,9664,9696⟩)))) (.node (.node (.node (.single ⟨27424,27456,9696,9728⟩) (.single ⟨27456,27520,9600,9664⟩)) (.node (.single ⟨27456,27520,9664,9728⟩) (.single ⟨27520,27648,9472,9600⟩))) (.node (.node (.single ⟨27520,27584,9600,9664⟩) (.single ⟨27520,27584,9664,9728⟩)) (.node (.single ⟨27584,27648,9600,9664⟩) (.single ⟨27584,27648,9664,9728⟩)))))))
def output6 : Fin 64 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21))))) (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData6 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 15)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19)))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 13) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))))))
def cover6 (i : Fin 64) : Fin 64 := ⟨coverData6.get i % 64, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 64) : Fin 64 := ⟨sourceData6.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 (.cutX 5632 (.cutY 23040 .empty (.cutX 5376 (.cutY 23296 (.cutX 5248 (.cutY 23168 (.cutX 5184 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 5312 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 5344 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) (.cutX 5312 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty) .empty)) .empty) .empty))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 (.cutX 9728 (.cutY 27136 .empty (.cutX 9472 .empty (.cutY 27392 .empty (.cutX 9600 (.cutY 27520 (.cutX 9536 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full) (.cutY 27520 (.cutX 9664 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 9696 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 9664 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))))) .empty) .empty))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 .empty (.cutX 23040 .empty (.cutY 5632 (.cutX 23296 (.cutY 5376 (.cutX 23168 (.cutY 5248 (.cutX 23104 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 23104 (.cutY 5312 .full (.cutX 23072 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full (.cutX 23232 (.cutY 5312 .full .full) (.cutY 5312 .full .full)))) .empty) .empty) .empty))) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 .empty (.cutX 27136 .empty (.cutY 9728 (.cutX 27392 .empty (.cutY 9472 .empty (.cutX 27520 (.cutY 9600 (.cutX 27456 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 27456 (.cutY 9664 .full (.cutX 27424 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 27584 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty))) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata6 : 0<192153497 ∧ 20<128 ∧ 90<128 ∧ 1<4 ∧
    6410/4160=1 ∧ 6410%4160=2250 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 64,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 64, (fun i => output6 i = raw6 (source6 i)) i :=
  forallFin_of_zero_offset (fun i => output6 i = raw6 (source6 i)) sourceChecked6_0

theorem coverChecked6_0 : ∀ i : Fin 64,
    (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked6 : ∀ i : Fin 64, (fun i => (output6 (cover6 i)).ContainsBox (raw6 i)) i :=
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 6533, atom 6498, type 1, source (21,91).
def leavesData7 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves7 : Fin 19 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 21 91 leaves7 i
def outputData7 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨5376,5440,23296,23360⟩) (.single ⟨5376,5440,23360,23424⟩)) (.node (.single ⟨5440,5504,23296,23360⟩) (.single ⟨5440,5504,23360,23424⟩))) (.node (.node (.single ⟨5376,5504,23424,23552⟩) (.single ⟨5504,5536,23296,23328⟩)) (.node (.single ⟨5504,5536,23328,23360⟩) (.node (.single ⟨5536,5568,23296,23328⟩) (.single ⟨5536,5568,23328,23360⟩))))) (.node (.node (.node (.single ⟨5504,5568,23360,23424⟩) (.single ⟨5568,5600,23296,23328⟩)) (.node (.single ⟨5568,5600,23328,23360⟩) (.node (.single ⟨5600,5632,23296,23328⟩) (.single ⟨5600,5632,23328,23360⟩)))) (.node (.node (.single ⟨5568,5632,23360,23424⟩) (.single ⟨5504,5568,23424,23488⟩)) (.node (.single ⟨5504,5568,23488,23552⟩) (.node (.single ⟨5568,5632,23424,23488⟩) (.single ⟨5568,5632,23488,23552⟩)))))) (.node (.node (.node (.node (.single ⟨9216,9280,27136,27200⟩) (.single ⟨9216,9280,27200,27264⟩)) (.node (.single ⟨9280,9344,27136,27200⟩) (.single ⟨9280,9344,27200,27264⟩))) (.node (.node (.single ⟨9216,9344,27264,27392⟩) (.single ⟨9344,9408,27136,27200⟩)) (.node (.single ⟨9344,9408,27200,27264⟩) (.node (.single ⟨9408,9440,27136,27168⟩) (.single ⟨9408,9440,27168,27200⟩))))) (.node (.node (.node (.single ⟨9440,9472,27136,27168⟩) (.single ⟨9440,9472,27168,27200⟩)) (.node (.single ⟨9408,9440,27200,27232⟩) (.node (.single ⟨9408,9440,27232,27264⟩) (.single ⟨9440,9472,27200,27232⟩)))) (.node (.node (.single ⟨9440,9472,27232,27264⟩) (.single ⟨9344,9408,27264,27328⟩)) (.node (.single ⟨9344,9408,27328,27392⟩) (.node (.single ⟨9408,9472,27264,27328⟩) (.single ⟨9408,9472,27328,27392⟩))))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,5376,5440⟩) (.single ⟨23296,23360,5440,5504⟩)) (.node (.single ⟨23360,23424,5376,5440⟩) (.single ⟨23360,23424,5440,5504⟩))) (.node (.node (.single ⟨23296,23328,5504,5536⟩) (.single ⟨23296,23328,5536,5568⟩)) (.node (.single ⟨23328,23360,5504,5536⟩) (.node (.single ⟨23328,23360,5536,5568⟩) (.single ⟨23296,23328,5568,5600⟩))))) (.node (.node (.node (.single ⟨23296,23328,5600,5632⟩) (.single ⟨23328,23360,5568,5600⟩)) (.node (.single ⟨23328,23360,5600,5632⟩) (.node (.single ⟨23360,23424,5504,5568⟩) (.single ⟨23360,23424,5568,5632⟩)))) (.node (.node (.single ⟨23424,23552,5376,5504⟩) (.single ⟨23424,23488,5504,5568⟩)) (.node (.single ⟨23424,23488,5568,5632⟩) (.node (.single ⟨23488,23552,5504,5568⟩) (.single ⟨23488,23552,5568,5632⟩)))))) (.node (.node (.node (.node (.single ⟨27136,27200,9216,9280⟩) (.single ⟨27136,27200,9280,9344⟩)) (.node (.single ⟨27200,27264,9216,9280⟩) (.single ⟨27200,27264,9280,9344⟩))) (.node (.node (.single ⟨27136,27200,9344,9408⟩) (.single ⟨27136,27168,9408,9440⟩)) (.node (.single ⟨27136,27168,9440,9472⟩) (.node (.single ⟨27168,27200,9408,9440⟩) (.single ⟨27168,27200,9440,9472⟩))))) (.node (.node (.node (.single ⟨27200,27264,9344,9408⟩) (.single ⟨27200,27232,9408,9440⟩)) (.node (.single ⟨27200,27232,9440,9472⟩) (.node (.single ⟨27232,27264,9408,9440⟩) (.single ⟨27232,27264,9440,9472⟩)))) (.node (.node (.single ⟨27264,27392,9216,9344⟩) (.single ⟨27264,27328,9344,9408⟩)) (.node (.single ⟨27264,27328,9408,9472⟩) (.node (.single ⟨27328,27392,9344,9408⟩) (.single ⟨27328,27392,9408,9472⟩))))))))
def output7 : Fin 76 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1))))) (.node (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39)))) (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.node (.single 41) (.single 72)))))) (.node (.node (.node (.node (.single 34) (.single 9)) (.node (.single 50) (.single 66))) (.node (.node (.single 25) (.single 15)) (.node (.single 53) (.node (.single 60) (.single 22))))) (.node (.node (.node (.single 16) (.single 55)) (.node (.single 59) (.node (.single 20) (.single 14)))) (.node (.node (.single 51) (.single 61)) (.node (.single 24) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 10))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 48))))) (.node (.node (.node (.single 64) (.single 27)) (.node (.single 12) (.node (.single 47) (.single 63)))) (.node (.node (.single 28) (.single 13)) (.node (.single 49) (.node (.single 62) (.single 26))))))))
def sourceData7 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 32) (.single 24)) (.node (.single 28) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 31)) (.node (.single 39) (.single 27))) (.node (.node (.single 3) (.single 35)) (.node (.single 23) (.node (.single 75) (.single 67))))) (.node (.node (.node (.single 71) (.single 63)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 61))))) (.node (.node (.node (.single 69) (.single 65)) (.node (.single 73) (.node (.single 21) (.single 33)))) (.node (.node (.single 1) (.single 25)) (.node (.single 37) (.node (.single 29) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 30) (.single 26))) (.node (.node (.single 34) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 22) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover7 (i : Fin 76) : Fin 76 := ⟨coverData7.get i % 76, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 76) : Fin 76 := ⟨sourceData7.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 (.cutX 5632 (.cutY 23040 .empty (.cutX 5376 .empty (.cutY 23296 .empty (.cutX 5504 (.cutY 23424 (.cutX 5440 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 5568 (.cutY 23360 (.cutX 5536 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full) (.cutY 23360 (.cutX 5600 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 5568 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))))) .empty) .empty))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 (.cutX 9728 (.cutY 27136 .empty (.cutX 9472 (.cutY 27392 (.cutX 9344 (.cutY 27264 (.cutX 9280 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full) (.cutY 27264 (.cutX 9408 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 9440 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) (.cutX 9440 (.cutY 27232 .full .full) (.cutY 27232 .full .full)))) (.cutX 9408 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 .empty (.cutX 23040 .empty (.cutY 5632 (.cutX 23296 .empty (.cutY 5376 .empty (.cutX 23424 (.cutY 5504 (.cutX 23360 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 23360 (.cutY 5568 (.cutX 23328 (.cutY 5536 .full .full) (.cutY 5536 .full .full)) (.cutX 23328 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full (.cutX 23488 (.cutY 5568 .full .full) (.cutY 5568 .full .full)))))) .empty))) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 .empty (.cutX 27136 .empty (.cutY 9728 (.cutX 27392 (.cutY 9472 (.cutX 27264 (.cutY 9344 (.cutX 27200 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 27200 (.cutY 9408 .full (.cutX 27168 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full (.cutX 27232 (.cutY 9440 .full .full) (.cutY 9440 .full .full))))) (.cutY 9344 .full (.cutX 27328 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty) .empty) .empty))) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata7 : 0<192153497 ∧ 21<128 ∧ 91<128 ∧ 1<4 ∧
    6498/4160=1 ∧ 6498%4160=2338 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 64,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked7_64 : ∀ i : Fin 12,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 76, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) (forallFinOffset_add (fun i => output7 i = raw7 (source7 i)) 0 64 12 (by decide) sourceChecked7_0
    sourceChecked7_64)

theorem coverChecked7_0 : ∀ i : Fin 64,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked7_64 : ∀ i : Fin 12,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 76, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
  forallFin_of_zero_offset (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (forallFinOffset_add (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) 0 64 12 (by decide) coverChecked7_0
    coverChecked7_64)

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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 6534, atom 6584, type 1, source (22,92).
def leavesData8 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves8 : Fin 16 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 22 92 leaves8 i
def outputData8 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5632,5696,23552,23616⟩) (.single ⟨5632,5696,23616,23680⟩)) (.node (.single ⟨5696,5760,23552,23616⟩) (.single ⟨5696,5760,23616,23680⟩))) (.node (.node (.single ⟨5632,5760,23680,23808⟩) (.single ⟨5760,5824,23552,23616⟩)) (.node (.single ⟨5760,5824,23616,23680⟩) (.single ⟨5824,5856,23552,23584⟩)))) (.node (.node (.node (.single ⟨5824,5856,23584,23616⟩) (.single ⟨5856,5888,23552,23584⟩)) (.node (.single ⟨5856,5888,23584,23616⟩) (.single ⟨5824,5888,23616,23680⟩))) (.node (.node (.single ⟨5760,5824,23680,23744⟩) (.single ⟨5760,5824,23744,23808⟩)) (.node (.single ⟨5824,5888,23680,23744⟩) (.single ⟨5824,5888,23744,23808⟩))))) (.node (.node (.node (.node (.single ⟨8960,9024,26880,26944⟩) (.single ⟨8960,9024,26944,27008⟩)) (.node (.single ⟨9024,9088,26880,26944⟩) (.single ⟨9024,9088,26944,27008⟩))) (.node (.node (.single ⟨8960,9088,27008,27136⟩) (.single ⟨9088,9152,26880,26944⟩)) (.node (.single ⟨9088,9152,26944,27008⟩) (.single ⟨9152,9184,26880,26912⟩)))) (.node (.node (.node (.single ⟨9152,9184,26912,26944⟩) (.single ⟨9184,9216,26880,26912⟩)) (.node (.single ⟨9184,9216,26912,26944⟩) (.single ⟨9152,9216,26944,27008⟩))) (.node (.node (.single ⟨9088,9152,27008,27072⟩) (.single ⟨9088,9152,27072,27136⟩)) (.node (.single ⟨9152,9216,27008,27072⟩) (.single ⟨9152,9216,27072,27136⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23552,23616,5632,5696⟩) (.single ⟨23552,23616,5696,5760⟩)) (.node (.single ⟨23616,23680,5632,5696⟩) (.single ⟨23616,23680,5696,5760⟩))) (.node (.node (.single ⟨23552,23616,5760,5824⟩) (.single ⟨23552,23584,5824,5856⟩)) (.node (.single ⟨23552,23584,5856,5888⟩) (.single ⟨23584,23616,5824,5856⟩)))) (.node (.node (.node (.single ⟨23584,23616,5856,5888⟩) (.single ⟨23616,23680,5760,5824⟩)) (.node (.single ⟨23616,23680,5824,5888⟩) (.single ⟨23680,23808,5632,5760⟩))) (.node (.node (.single ⟨23680,23744,5760,5824⟩) (.single ⟨23680,23744,5824,5888⟩)) (.node (.single ⟨23744,23808,5760,5824⟩) (.single ⟨23744,23808,5824,5888⟩))))) (.node (.node (.node (.node (.single ⟨26880,26944,8960,9024⟩) (.single ⟨26880,26944,9024,9088⟩)) (.node (.single ⟨26944,27008,8960,9024⟩) (.single ⟨26944,27008,9024,9088⟩))) (.node (.node (.single ⟨26880,26944,9088,9152⟩) (.single ⟨26880,26912,9152,9184⟩)) (.node (.single ⟨26880,26912,9184,9216⟩) (.single ⟨26912,26944,9152,9184⟩)))) (.node (.node (.node (.single ⟨26912,26944,9184,9216⟩) (.single ⟨26944,27008,9088,9152⟩)) (.node (.single ⟨26944,27008,9152,9216⟩) (.single ⟨27008,27136,8960,9088⟩))) (.node (.node (.single ⟨27008,27072,9088,9152⟩) (.single ⟨27008,27072,9152,9216⟩)) (.node (.single ⟨27072,27136,9088,9152⟩) (.single ⟨27072,27136,9152,9216⟩)))))))
def output8 : Fin 64 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData8 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover8 (i : Fin 64) : Fin 64 := ⟨coverData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 64) : Fin 64 := ⟨sourceData8.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 .empty (.cutY 24064 (.cutX 5888 (.cutY 23808 (.cutX 5760 (.cutY 23680 (.cutX 5696 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 5824 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 5856 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) (.cutX 5824 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty))))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 (.cutX 8960 .empty (.cutY 26880 .empty (.cutX 9088 (.cutY 27008 (.cutX 9024 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full) (.cutY 27008 (.cutX 9152 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 9184 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 9152 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 .empty (.cutX 23808 (.cutY 5888 (.cutX 23680 (.cutY 5760 (.cutX 23616 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 23616 (.cutY 5824 .full (.cutX 23584 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full (.cutX 23744 (.cutY 5824 .full .full) (.cutY 5824 .full .full)))) .empty) .empty)) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 (.cutY 8704 .empty (.cutX 26880 .empty (.cutY 8960 .empty (.cutX 27008 (.cutY 9088 (.cutX 26944 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 26944 (.cutY 9152 .full (.cutX 26912 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 27072 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata8 : 0<192153497 ∧ 22<128 ∧ 92<128 ∧ 1<4 ∧
    6584/4160=1 ∧ 6584%4160=2424 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 6535, atom 326, type 0, source (2,74).
def leavesData9 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves9 : Fin 7 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 74 leaves9 i
def outputData9 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,18944,19072⟩) (.node (.single ⟨512,640,19072,19200⟩) (.single ⟨640,704,18944,19008⟩))) (.node (.node (.single ⟨640,704,19008,19072⟩) (.single ⟨704,768,18944,19008⟩)) (.node (.single ⟨704,768,19008,19072⟩) (.single ⟨640,768,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,32000,32128⟩) (.node (.single ⟨13568,13696,32128,32256⟩) (.single ⟨13696,13760,32000,32064⟩))) (.node (.node (.single ⟨13696,13760,32064,32128⟩) (.single ⟨13760,13824,32000,32064⟩)) (.node (.single ⟨13760,13824,32064,32128⟩) (.single ⟨13696,13824,32128,32256⟩))))) (.node (.node (.node (.single ⟨18944,19072,512,640⟩) (.node (.single ⟨18944,19008,640,704⟩) (.single ⟨18944,19008,704,768⟩))) (.node (.node (.single ⟨19008,19072,640,704⟩) (.single ⟨19008,19072,704,768⟩)) (.node (.single ⟨19072,19200,512,640⟩) (.single ⟨19072,19200,640,768⟩)))) (.node (.node (.single ⟨32000,32128,13568,13696⟩) (.node (.single ⟨32000,32064,13696,13760⟩) (.single ⟨32000,32064,13760,13824⟩))) (.node (.node (.single ⟨32064,32128,13696,13760⟩) (.single ⟨32064,32128,13760,13824⟩)) (.node (.single ⟨32128,32256,13568,13696⟩) (.single ⟨32128,32256,13696,13824⟩))))))
def output9 : Fin 28 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover9 (i : Fin 28) : Fin 28 := ⟨coverData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 28) : Fin 28 := ⟨sourceData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 .empty (.cutX 768 (.cutY 19200 (.cutX 640 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 704 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 (.cutX 13568 .empty (.cutY 32000 .empty (.cutX 13696 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 13760 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full)))) .empty) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 .empty (.cutX 19200 (.cutY 768 (.cutX 19072 (.cutY 640 .full (.cutX 19008 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 (.cutX 32000 .empty (.cutY 13568 .empty (.cutX 32128 (.cutY 13696 .full (.cutX 32064 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty))) .empty)))))) .empty))

theorem metadata9 : 0<34183877 ∧ 2<128 ∧ 74<128 ∧ 0<4 ∧
    326/4160=0 ∧ 326%4160=326 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

-- Frozen phase 6536, atom 4608, type 1, source (3,73).
def leavesData10 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves10 : Fin 10 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 73 leaves10 i
def outputData10 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,18688,18752⟩) (.single ⟨768,832,18752,18816⟩)) (.node (.single ⟨832,896,18688,18752⟩) (.node (.single ⟨832,896,18752,18816⟩) (.single ⟨768,896,18816,18944⟩)))) (.node (.node (.single ⟨896,960,18688,18752⟩) (.single ⟨896,960,18752,18816⟩)) (.node (.single ⟨960,1024,18688,18752⟩) (.node (.single ⟨960,1024,18752,18816⟩) (.single ⟨896,1024,18816,18944⟩))))) (.node (.node (.node (.single ⟨13824,13952,31744,31872⟩) (.single ⟨13824,13952,31872,32000⟩)) (.node (.single ⟨13952,14016,31744,31808⟩) (.node (.single ⟨13952,14016,31808,31872⟩) (.single ⟨14016,14080,31744,31808⟩)))) (.node (.node (.single ⟨14016,14080,31808,31872⟩) (.single ⟨13952,14016,31872,31936⟩)) (.node (.single ⟨13952,14016,31936,32000⟩) (.node (.single ⟨14016,14080,31872,31936⟩) (.single ⟨14016,14080,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18752,768,832⟩) (.single ⟨18688,18752,832,896⟩)) (.node (.single ⟨18752,18816,768,832⟩) (.node (.single ⟨18752,18816,832,896⟩) (.single ⟨18688,18752,896,960⟩)))) (.node (.node (.single ⟨18688,18752,960,1024⟩) (.single ⟨18752,18816,896,960⟩)) (.node (.single ⟨18752,18816,960,1024⟩) (.node (.single ⟨18816,18944,768,896⟩) (.single ⟨18816,18944,896,1024⟩))))) (.node (.node (.node (.single ⟨31744,31872,13824,13952⟩) (.single ⟨31744,31808,13952,14016⟩)) (.node (.single ⟨31744,31808,14016,14080⟩) (.node (.single ⟨31808,31872,13952,14016⟩) (.single ⟨31808,31872,14016,14080⟩)))) (.node (.node (.single ⟨31872,32000,13824,13952⟩) (.single ⟨31872,31936,13952,14016⟩)) (.node (.single ⟨31872,31936,14016,14080⟩) (.node (.single ⟨31936,32000,13952,14016⟩) (.single ⟨31936,32000,14016,14080⟩)))))))
def output10 : Fin 40 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover10 (i : Fin 40) : Fin 40 := ⟨coverData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 40) : Fin 40 := ⟨sourceData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 (.cutX 768 .empty (.cutY 18688 .empty (.cutX 896 (.cutY 18816 (.cutX 832 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full) (.cutY 18816 (.cutX 960 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 .empty (.cutY 32256 (.cutX 14080 (.cutY 32000 (.cutX 13952 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 14016 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 14016 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty))))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 (.cutY 512 .empty (.cutX 18688 .empty (.cutY 768 .empty (.cutX 18816 (.cutY 896 (.cutX 18752 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 18752 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full))))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 .empty (.cutX 32000 (.cutY 14080 (.cutX 31872 (.cutY 13952 .full (.cutX 31808 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full (.cutX 31936 (.cutY 14016 .full .full) (.cutY 14016 .full .full)))) .empty) .empty)) .empty))) .empty)))))) .empty))

theorem metadata10 : 0<137362203 ∧ 3<128 ∧ 73<128 ∧ 1<4 ∧
    4608/4160=1 ∧ 4608%4160=448 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 40,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 40, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) sourceChecked10_0

theorem coverChecked10_0 : ∀ i : Fin 40,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 40, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 6537, atom 1681, type 0, source (14,85).
def leavesData11 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves11 : Fin 10 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 85 leaves11 i
def outputData11 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,21760,21888⟩) (.single ⟨3584,3712,21888,22016⟩)) (.node (.single ⟨3712,3776,21760,21824⟩) (.node (.single ⟨3712,3776,21824,21888⟩) (.single ⟨3776,3840,21760,21824⟩)))) (.node (.node (.single ⟨3776,3840,21824,21888⟩) (.single ⟨3712,3776,21888,21952⟩)) (.node (.single ⟨3712,3776,21952,22016⟩) (.node (.single ⟨3776,3840,21888,21952⟩) (.single ⟨3776,3840,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,28928,28992⟩) (.single ⟨10752,10816,28992,29056⟩)) (.node (.single ⟨10816,10880,28928,28992⟩) (.node (.single ⟨10816,10880,28992,29056⟩) (.single ⟨10752,10880,29056,29184⟩)))) (.node (.node (.single ⟨10880,10944,28928,28992⟩) (.single ⟨10880,10944,28992,29056⟩)) (.node (.single ⟨10944,11008,28928,28992⟩) (.node (.single ⟨10944,11008,28992,29056⟩) (.single ⟨10880,11008,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,3584,3712⟩) (.single ⟨21760,21824,3712,3776⟩)) (.node (.single ⟨21760,21824,3776,3840⟩) (.node (.single ⟨21824,21888,3712,3776⟩) (.single ⟨21824,21888,3776,3840⟩)))) (.node (.node (.single ⟨21888,22016,3584,3712⟩) (.single ⟨21888,21952,3712,3776⟩)) (.node (.single ⟨21888,21952,3776,3840⟩) (.node (.single ⟨21952,22016,3712,3776⟩) (.single ⟨21952,22016,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,10752,10816⟩) (.single ⟨28928,28992,10816,10880⟩)) (.node (.single ⟨28992,29056,10752,10816⟩) (.node (.single ⟨28992,29056,10816,10880⟩) (.single ⟨28928,28992,10880,10944⟩)))) (.node (.node (.single ⟨28928,28992,10944,11008⟩) (.single ⟨28992,29056,10880,10944⟩)) (.node (.single ⟨28992,29056,10944,11008⟩) (.node (.single ⟨29056,29184,10752,10880⟩) (.single ⟨29056,29184,10880,11008⟩)))))))
def output11 : Fin 40 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData11 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover11 (i : Fin 40) : Fin 40 := ⟨coverData11.get i % 40, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 40) : Fin 40 := ⟨sourceData11.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 (.cutX 3840 (.cutY 21760 .empty (.cutX 3712 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3776 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) (.cutX 3776 (.cutY 21952 .full .full) (.cutY 21952 .full .full))))) .empty) .empty)))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 (.cutX 11008 (.cutY 28928 .empty (.cutX 10880 (.cutY 29056 (.cutX 10816 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10944 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 .empty (.cutX 21760 .empty (.cutY 3840 (.cutX 21888 (.cutY 3712 .full (.cutX 21824 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 21952 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 .empty (.cutX 28928 .empty (.cutY 11008 (.cutX 29056 (.cutY 10880 (.cutX 28992 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 28992 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata11 : 0<72090291 ∧ 14<128 ∧ 85<128 ∧ 0<4 ∧
    1681/4160=0 ∧ 1681%4160=1681 ∧ ∀ i, (leaves11 i).Valid 8 := by
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 6538, atom 808, type 0, source (6,76).
def leavesData12 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves12 : Fin 7 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 76 leaves12 i
def outputData12 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,19456,19584⟩) (.node (.single ⟨1536,1664,19584,19712⟩) (.single ⟨1664,1728,19456,19520⟩))) (.node (.node (.single ⟨1664,1728,19520,19584⟩) (.single ⟨1728,1792,19456,19520⟩)) (.node (.single ⟨1728,1792,19520,19584⟩) (.single ⟨1664,1792,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,30976,31104⟩) (.node (.single ⟨13056,13184,31104,31232⟩) (.single ⟨13184,13248,30976,31040⟩))) (.node (.node (.single ⟨13184,13248,31040,31104⟩) (.single ⟨13248,13312,30976,31040⟩)) (.node (.single ⟨13248,13312,31040,31104⟩) (.single ⟨13184,13312,31104,31232⟩))))) (.node (.node (.node (.single ⟨19456,19584,1536,1664⟩) (.node (.single ⟨19456,19520,1664,1728⟩) (.single ⟨19456,19520,1728,1792⟩))) (.node (.node (.single ⟨19520,19584,1664,1728⟩) (.single ⟨19520,19584,1728,1792⟩)) (.node (.single ⟨19584,19712,1536,1664⟩) (.single ⟨19584,19712,1664,1792⟩)))) (.node (.node (.single ⟨30976,31104,13056,13184⟩) (.node (.single ⟨30976,31040,13184,13248⟩) (.single ⟨30976,31040,13248,13312⟩))) (.node (.node (.single ⟨31040,31104,13184,13248⟩) (.single ⟨31040,31104,13248,13312⟩)) (.node (.single ⟨31104,31232,13056,13184⟩) (.single ⟨31104,31232,13184,13312⟩))))))
def output12 : Fin 28 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover12 (i : Fin 28) : Fin 28 := ⟨coverData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 28) : Fin 28 := ⟨sourceData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 (.cutX 1792 (.cutY 19712 (.cutX 1664 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 1728 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty) .empty) .empty))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 (.cutX 13056 .empty (.cutY 30976 .empty (.cutX 13184 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 13248 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full)))) .empty)) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 .empty (.cutX 19712 (.cutY 1792 (.cutX 19584 (.cutY 1664 .full (.cutX 19520 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 .empty (.cutX 30976 .empty (.cutY 13056 .empty (.cutX 31104 (.cutY 13184 .full (.cutX 31040 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))))) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata12 : 0<34183877 ∧ 6<128 ∧ 76<128 ∧ 0<4 ∧
    808/4160=0 ∧ 808%4160=808 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 6539, atom 1578, type 0, source (13,83).
def leavesData13 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves13 : Fin 10 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 83 leaves13 i
def outputData13 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,21248,21376⟩) (.single ⟨3328,3456,21376,21504⟩)) (.node (.single ⟨3456,3520,21248,21312⟩) (.node (.single ⟨3456,3520,21312,21376⟩) (.single ⟨3520,3584,21248,21312⟩)))) (.node (.node (.single ⟨3520,3584,21312,21376⟩) (.single ⟨3456,3520,21376,21440⟩)) (.node (.single ⟨3456,3520,21440,21504⟩) (.node (.single ⟨3520,3584,21376,21440⟩) (.single ⟨3520,3584,21440,21504⟩))))) (.node (.node (.node (.single ⟨11264,11328,29184,29248⟩) (.single ⟨11264,11328,29248,29312⟩)) (.node (.single ⟨11328,11392,29184,29248⟩) (.node (.single ⟨11328,11392,29248,29312⟩) (.single ⟨11264,11392,29312,29440⟩)))) (.node (.node (.single ⟨11392,11456,29184,29248⟩) (.single ⟨11392,11456,29248,29312⟩)) (.node (.single ⟨11456,11520,29184,29248⟩) (.node (.single ⟨11456,11520,29248,29312⟩) (.single ⟨11392,11520,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,3328,3456⟩) (.single ⟨21248,21312,3456,3520⟩)) (.node (.single ⟨21248,21312,3520,3584⟩) (.node (.single ⟨21312,21376,3456,3520⟩) (.single ⟨21312,21376,3520,3584⟩)))) (.node (.node (.single ⟨21376,21504,3328,3456⟩) (.single ⟨21376,21440,3456,3520⟩)) (.node (.single ⟨21376,21440,3520,3584⟩) (.node (.single ⟨21440,21504,3456,3520⟩) (.single ⟨21440,21504,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,11264,11328⟩) (.single ⟨29184,29248,11328,11392⟩)) (.node (.single ⟨29248,29312,11264,11328⟩) (.node (.single ⟨29248,29312,11328,11392⟩) (.single ⟨29184,29248,11392,11456⟩)))) (.node (.node (.single ⟨29184,29248,11456,11520⟩) (.single ⟨29248,29312,11392,11456⟩)) (.node (.single ⟨29248,29312,11456,11520⟩) (.node (.single ⟨29312,29440,11264,11392⟩) (.single ⟨29312,29440,11392,11520⟩)))))))
def output13 : Fin 40 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData13 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover13 (i : Fin 40) : Fin 40 := ⟨coverData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 40) : Fin 40 := ⟨sourceData13.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 .empty (.cutX 3328 .empty (.cutY 21248 .empty (.cutX 3456 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 3520 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) (.cutX 3520 (.cutY 21440 .full .full) (.cutY 21440 .full .full))))))) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 .empty (.cutX 11520 (.cutY 29440 (.cutX 11392 (.cutY 29312 (.cutX 11328 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 11456 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 (.cutX 21248 .empty (.cutY 3328 .empty (.cutX 21376 (.cutY 3456 .full (.cutX 21312 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 21440 (.cutY 3520 .full .full) (.cutY 3520 .full .full)))))) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 (.cutX 29440 (.cutY 11520 (.cutX 29312 (.cutY 11392 (.cutX 29248 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 29248 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty))) .empty)) .empty) .empty)))) .empty))

theorem metadata13 : 0<72090291 ∧ 13<128 ∧ 83<128 ∧ 0<4 ∧
    1578/4160=0 ∧ 1578%4160=1578 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 6540, atom 6132, type 1, source (17,85).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 85 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4480,21760,21888⟩) (.node (.single ⟨4352,4480,21888,22016⟩) (.single ⟨4480,4544,21760,21824⟩))) (.node (.single ⟨4480,4544,21824,21888⟩) (.node (.single ⟨4544,4576,21760,21792⟩) (.single ⟨4544,4576,21792,21824⟩)))) (.node (.node (.single ⟨4576,4608,21760,21792⟩) (.node (.single ⟨4576,4608,21792,21824⟩) (.single ⟨4544,4608,21824,21888⟩))) (.node (.node (.single ⟨4480,4544,21888,21952⟩) (.single ⟨4480,4544,21952,22016⟩)) (.node (.single ⟨4544,4608,21888,21952⟩) (.single ⟨4544,4608,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,28160,28224⟩) (.node (.single ⟨10752,10816,28224,28288⟩) (.single ⟨10816,10880,28160,28224⟩))) (.node (.single ⟨10816,10880,28224,28288⟩) (.node (.single ⟨10752,10880,28288,28416⟩) (.single ⟨10880,10944,28160,28224⟩)))) (.node (.node (.single ⟨10880,10944,28224,28288⟩) (.node (.single ⟨10944,10976,28160,28192⟩) (.single ⟨10944,10976,28192,28224⟩))) (.node (.node (.single ⟨10976,11008,28160,28192⟩) (.single ⟨10976,11008,28192,28224⟩)) (.node (.single ⟨10944,11008,28224,28288⟩) (.single ⟨10880,11008,28288,28416⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,4352,4480⟩) (.node (.single ⟨21760,21824,4480,4544⟩) (.single ⟨21760,21792,4544,4576⟩))) (.node (.single ⟨21760,21792,4576,4608⟩) (.node (.single ⟨21792,21824,4544,4576⟩) (.single ⟨21792,21824,4576,4608⟩)))) (.node (.node (.single ⟨21824,21888,4480,4544⟩) (.node (.single ⟨21824,21888,4544,4608⟩) (.single ⟨21888,22016,4352,4480⟩))) (.node (.node (.single ⟨21888,21952,4480,4544⟩) (.single ⟨21888,21952,4544,4608⟩)) (.node (.single ⟨21952,22016,4480,4544⟩) (.single ⟨21952,22016,4544,4608⟩))))) (.node (.node (.node (.single ⟨28160,28224,10752,10816⟩) (.node (.single ⟨28160,28224,10816,10880⟩) (.single ⟨28224,28288,10752,10816⟩))) (.node (.single ⟨28224,28288,10816,10880⟩) (.node (.single ⟨28160,28224,10880,10944⟩) (.single ⟨28160,28192,10944,10976⟩)))) (.node (.node (.single ⟨28160,28192,10976,11008⟩) (.node (.single ⟨28192,28224,10944,10976⟩) (.single ⟨28192,28224,10976,11008⟩))) (.node (.node (.single ⟨28224,28288,10880,10944⟩) (.single ⟨28224,28288,10944,11008⟩)) (.node (.single ⟨28288,28416,10752,10880⟩) (.single ⟨28288,28416,10880,11008⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 (.cutY 22016 (.cutX 4352 .empty (.cutY 21760 .empty (.cutX 4480 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 4544 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 4576 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) (.cutX 4544 (.cutY 21952 .full .full) (.cutY 21952 .full .full)))))) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 .empty (.cutX 11008 (.cutY 28416 (.cutX 10880 (.cutY 28288 (.cutX 10816 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 10944 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 10976 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) .full)) .empty) .empty)))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 (.cutX 21760 .empty (.cutY 4352 .empty (.cutX 21888 (.cutY 4480 .full (.cutX 21824 (.cutY 4544 .full (.cutX 21792 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 21952 (.cutY 4544 .full .full) (.cutY 4544 .full .full)))))) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 .empty (.cutY 10752 .empty (.cutX 28416 (.cutY 11008 (.cutX 28288 (.cutY 10880 (.cutX 28224 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 28224 (.cutY 10944 .full (.cutX 28192 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty)))) .empty) .empty))) .empty))

theorem metadata14 : 0<125829407 ∧ 17<128 ∧ 85<128 ∧ 1<4 ∧
    6132/4160=1 ∧ 6132%4160=1972 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 6541, atom 1474, type 0, source (12,82).
def leavesData15 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves15 : Fin 7 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 82 leaves15 i
def outputData15 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,20992,21120⟩) (.node (.single ⟨3072,3200,21120,21248⟩) (.single ⟨3200,3264,20992,21056⟩))) (.node (.node (.single ⟨3200,3264,21056,21120⟩) (.single ⟨3264,3328,20992,21056⟩)) (.node (.single ⟨3264,3328,21056,21120⟩) (.single ⟨3200,3328,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,29440,29568⟩) (.node (.single ⟨11520,11648,29568,29696⟩) (.single ⟨11648,11712,29440,29504⟩))) (.node (.node (.single ⟨11648,11712,29504,29568⟩) (.single ⟨11712,11776,29440,29504⟩)) (.node (.single ⟨11712,11776,29504,29568⟩) (.single ⟨11648,11776,29568,29696⟩))))) (.node (.node (.node (.single ⟨20992,21120,3072,3200⟩) (.node (.single ⟨20992,21056,3200,3264⟩) (.single ⟨20992,21056,3264,3328⟩))) (.node (.node (.single ⟨21056,21120,3200,3264⟩) (.single ⟨21056,21120,3264,3328⟩)) (.node (.single ⟨21120,21248,3072,3200⟩) (.single ⟨21120,21248,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,11520,11648⟩) (.node (.single ⟨29440,29504,11648,11712⟩) (.single ⟨29440,29504,11712,11776⟩))) (.node (.node (.single ⟨29504,29568,11648,11712⟩) (.single ⟨29504,29568,11712,11776⟩)) (.node (.single ⟨29568,29696,11520,11648⟩) (.single ⟨29568,29696,11648,11776⟩))))))
def output15 : Fin 28 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData15 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover15 (i : Fin 28) : Fin 28 := ⟨coverData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 28) : Fin 28 := ⟨sourceData15.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 .empty (.cutX 3328 (.cutY 21248 (.cutX 3200 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 3264 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 .empty (.cutX 11520 .empty (.cutY 29440 .empty (.cutX 11648 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 11712 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 (.cutX 21248 (.cutY 3328 (.cutX 21120 (.cutY 3200 .full (.cutX 21056 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty) .empty) .empty))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 (.cutX 29440 .empty (.cutY 11520 .empty (.cutX 29568 (.cutY 11648 .full (.cutX 29504 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty))) .empty)) .empty) .empty)))) .empty))

theorem metadata15 : 0<72090291 ∧ 12<128 ∧ 82<128 ∧ 0<4 ∧
    1474/4160=0 ∧ 1474%4160=1474 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 6542, atom 5937, type 1, source (15,82).
def leavesData16 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves16 : Fin 10 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 82 leaves16 i
def outputData16 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,20992,21120⟩) (.single ⟨3840,3968,21120,21248⟩)) (.node (.single ⟨3968,4032,20992,21056⟩) (.node (.single ⟨3968,4032,21056,21120⟩) (.single ⟨4032,4096,20992,21056⟩)))) (.node (.node (.single ⟨4032,4096,21056,21120⟩) (.single ⟨3968,4032,21120,21184⟩)) (.node (.single ⟨3968,4032,21184,21248⟩) (.node (.single ⟨4032,4096,21120,21184⟩) (.single ⟨4032,4096,21184,21248⟩))))) (.node (.node (.node (.single ⟨11520,11584,28672,28736⟩) (.single ⟨11520,11584,28736,28800⟩)) (.node (.single ⟨11584,11648,28672,28736⟩) (.node (.single ⟨11584,11648,28736,28800⟩) (.single ⟨11520,11648,28800,28928⟩)))) (.node (.node (.single ⟨11648,11712,28672,28736⟩) (.single ⟨11648,11712,28736,28800⟩)) (.node (.single ⟨11712,11776,28672,28736⟩) (.node (.single ⟨11712,11776,28736,28800⟩) (.single ⟨11648,11776,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21120,3840,3968⟩) (.single ⟨20992,21056,3968,4032⟩)) (.node (.single ⟨20992,21056,4032,4096⟩) (.node (.single ⟨21056,21120,3968,4032⟩) (.single ⟨21056,21120,4032,4096⟩)))) (.node (.node (.single ⟨21120,21248,3840,3968⟩) (.single ⟨21120,21184,3968,4032⟩)) (.node (.single ⟨21120,21184,4032,4096⟩) (.node (.single ⟨21184,21248,3968,4032⟩) (.single ⟨21184,21248,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,11520,11584⟩) (.single ⟨28672,28736,11584,11648⟩)) (.node (.single ⟨28736,28800,11520,11584⟩) (.node (.single ⟨28736,28800,11584,11648⟩) (.single ⟨28672,28736,11648,11712⟩)))) (.node (.node (.single ⟨28672,28736,11712,11776⟩) (.single ⟨28736,28800,11648,11712⟩)) (.node (.single ⟨28736,28800,11712,11776⟩) (.node (.single ⟨28800,28928,11520,11648⟩) (.single ⟨28800,28928,11648,11776⟩)))))))
def output16 : Fin 40 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData16 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover16 (i : Fin 40) : Fin 40 := ⟨coverData16.get i % 40, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 40) : Fin 40 := ⟨sourceData16.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 .empty (.cutX 3840 .empty (.cutY 21248 (.cutX 3968 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 4032 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) (.cutX 4032 (.cutY 21184 .full .full) (.cutY 21184 .full .full)))) .empty)))) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 (.cutX 11520 .empty (.cutY 28928 (.cutX 11648 (.cutY 28800 (.cutX 11584 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 11712 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 .empty (.cutX 21248 (.cutY 3840 .empty (.cutX 21120 (.cutY 3968 .full (.cutX 21056 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 21184 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 (.cutX 28928 (.cutY 11520 .empty (.cutX 28800 (.cutY 11648 (.cutX 28736 (.cutY 11584 .full .full) (.cutY 11584 .full .full)) (.cutX 28736 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata16 : 0<139307719 ∧ 15<128 ∧ 82<128 ∧ 1<4 ∧
    5937/4160=1 ∧ 5937%4160=1777 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 6543, atom 1783, type 0, source (15,88).
def leavesData17 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves17 : Fin 13 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 88 leaves17 i
def outputData17 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,22528,22656⟩) (.node (.single ⟨3840,3968,22656,22784⟩) (.single ⟨3968,4032,22528,22592⟩))) (.node (.single ⟨3968,4032,22592,22656⟩) (.node (.single ⟨4032,4064,22528,22560⟩) (.single ⟨4032,4064,22560,22592⟩)))) (.node (.node (.single ⟨4064,4096,22528,22560⟩) (.node (.single ⟨4064,4096,22560,22592⟩) (.single ⟨4032,4096,22592,22656⟩))) (.node (.node (.single ⟨3968,4032,22656,22720⟩) (.single ⟨3968,4032,22720,22784⟩)) (.node (.single ⟨4032,4096,22656,22720⟩) (.single ⟨4032,4096,22720,22784⟩))))) (.node (.node (.node (.single ⟨9984,10048,28672,28736⟩) (.node (.single ⟨9984,10048,28736,28800⟩) (.single ⟨10048,10112,28672,28736⟩))) (.node (.single ⟨10048,10112,28736,28800⟩) (.node (.single ⟨9984,10112,28800,28928⟩) (.single ⟨10112,10176,28672,28736⟩)))) (.node (.node (.single ⟨10112,10176,28736,28800⟩) (.node (.single ⟨10176,10208,28672,28704⟩) (.single ⟨10176,10208,28704,28736⟩))) (.node (.node (.single ⟨10208,10240,28672,28704⟩) (.single ⟨10208,10240,28704,28736⟩)) (.node (.single ⟨10176,10240,28736,28800⟩) (.single ⟨10112,10240,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22656,3840,3968⟩) (.node (.single ⟨22528,22592,3968,4032⟩) (.single ⟨22528,22560,4032,4064⟩))) (.node (.single ⟨22528,22560,4064,4096⟩) (.node (.single ⟨22560,22592,4032,4064⟩) (.single ⟨22560,22592,4064,4096⟩)))) (.node (.node (.single ⟨22592,22656,3968,4032⟩) (.node (.single ⟨22592,22656,4032,4096⟩) (.single ⟨22656,22784,3840,3968⟩))) (.node (.node (.single ⟨22656,22720,3968,4032⟩) (.single ⟨22656,22720,4032,4096⟩)) (.node (.single ⟨22720,22784,3968,4032⟩) (.single ⟨22720,22784,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9984,10048⟩) (.node (.single ⟨28672,28736,10048,10112⟩) (.single ⟨28736,28800,9984,10048⟩))) (.node (.single ⟨28736,28800,10048,10112⟩) (.node (.single ⟨28672,28736,10112,10176⟩) (.single ⟨28672,28704,10176,10208⟩)))) (.node (.node (.single ⟨28672,28704,10208,10240⟩) (.node (.single ⟨28704,28736,10176,10208⟩) (.single ⟨28704,28736,10208,10240⟩))) (.node (.node (.single ⟨28736,28800,10112,10176⟩) (.single ⟨28736,28800,10176,10240⟩)) (.node (.single ⟨28800,28928,9984,10112⟩) (.single ⟨28800,28928,10112,10240⟩)))))))
def output17 : Fin 52 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData17 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover17 (i : Fin 52) : Fin 52 := ⟨coverData17.get i % 52, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 52) : Fin 52 := ⟨sourceData17.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 (.cutX 3840 .empty (.cutY 22784 (.cutX 3968 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 4032 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 4064 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) (.cutX 4032 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty)) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 (.cutX 9984 .empty (.cutY 28928 (.cutX 10112 (.cutY 28800 (.cutX 10048 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 10176 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 10208 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 .empty (.cutX 22784 (.cutY 3840 .empty (.cutX 22656 (.cutY 3968 .full (.cutX 22592 (.cutY 4032 .full (.cutX 22560 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 22720 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty)) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 .empty (.cutX 28928 (.cutY 9984 .empty (.cutX 28800 (.cutY 10112 (.cutX 28736 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 28736 (.cutY 10176 .full (.cutX 28704 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata17 : 0<77641223 ∧ 15<128 ∧ 88<128 ∧ 0<4 ∧
    1783/4160=0 ∧ 1783%4160=1783 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 52,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 52, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 52,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 52, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 6544, atom 2824, type 0, source (27,97).
def leavesData18 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves18 : Fin 16 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 27 97 leaves18 i
def outputData18 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6912,6976,24832,24896⟩) (.single ⟨6912,6976,24896,24960⟩)) (.node (.single ⟨6976,7040,24832,24896⟩) (.single ⟨6976,7040,24896,24960⟩))) (.node (.node (.single ⟨6912,7040,24960,25088⟩) (.single ⟨7040,7104,24832,24896⟩)) (.node (.single ⟨7040,7104,24896,24960⟩) (.single ⟨7104,7136,24832,24864⟩)))) (.node (.node (.node (.single ⟨7104,7136,24864,24896⟩) (.single ⟨7136,7168,24832,24864⟩)) (.node (.single ⟨7136,7168,24864,24896⟩) (.single ⟨7104,7168,24896,24960⟩))) (.node (.node (.single ⟨7040,7104,24960,25024⟩) (.single ⟨7040,7104,25024,25088⟩)) (.node (.single ⟨7104,7168,24960,25024⟩) (.single ⟨7104,7168,25024,25088⟩))))) (.node (.node (.node (.node (.single ⟨7680,7744,25600,25664⟩) (.single ⟨7680,7744,25664,25728⟩)) (.node (.single ⟨7744,7808,25600,25664⟩) (.single ⟨7744,7808,25664,25728⟩))) (.node (.node (.single ⟨7680,7808,25728,25856⟩) (.single ⟨7808,7872,25600,25664⟩)) (.node (.single ⟨7808,7872,25664,25728⟩) (.single ⟨7872,7904,25600,25632⟩)))) (.node (.node (.node (.single ⟨7872,7904,25632,25664⟩) (.single ⟨7904,7936,25600,25632⟩)) (.node (.single ⟨7904,7936,25632,25664⟩) (.single ⟨7872,7936,25664,25728⟩))) (.node (.node (.single ⟨7808,7872,25728,25792⟩) (.single ⟨7808,7872,25792,25856⟩)) (.node (.single ⟨7872,7936,25728,25792⟩) (.single ⟨7872,7936,25792,25856⟩)))))) (.node (.node (.node (.node (.node (.single ⟨24832,24896,6912,6976⟩) (.single ⟨24832,24896,6976,7040⟩)) (.node (.single ⟨24896,24960,6912,6976⟩) (.single ⟨24896,24960,6976,7040⟩))) (.node (.node (.single ⟨24832,24896,7040,7104⟩) (.single ⟨24832,24864,7104,7136⟩)) (.node (.single ⟨24832,24864,7136,7168⟩) (.single ⟨24864,24896,7104,7136⟩)))) (.node (.node (.node (.single ⟨24864,24896,7136,7168⟩) (.single ⟨24896,24960,7040,7104⟩)) (.node (.single ⟨24896,24960,7104,7168⟩) (.single ⟨24960,25088,6912,7040⟩))) (.node (.node (.single ⟨24960,25024,7040,7104⟩) (.single ⟨24960,25024,7104,7168⟩)) (.node (.single ⟨25024,25088,7040,7104⟩) (.single ⟨25024,25088,7104,7168⟩))))) (.node (.node (.node (.node (.single ⟨25600,25664,7680,7744⟩) (.single ⟨25600,25664,7744,7808⟩)) (.node (.single ⟨25664,25728,7680,7744⟩) (.single ⟨25664,25728,7744,7808⟩))) (.node (.node (.single ⟨25600,25664,7808,7872⟩) (.single ⟨25600,25632,7872,7904⟩)) (.node (.single ⟨25600,25632,7904,7936⟩) (.single ⟨25632,25664,7872,7904⟩)))) (.node (.node (.node (.single ⟨25632,25664,7904,7936⟩) (.single ⟨25664,25728,7808,7872⟩)) (.node (.single ⟨25664,25728,7872,7936⟩) (.single ⟨25728,25856,7680,7808⟩))) (.node (.node (.single ⟨25728,25792,7808,7872⟩) (.single ⟨25728,25792,7872,7936⟩)) (.node (.single ⟨25792,25856,7808,7872⟩) (.single ⟨25792,25856,7872,7936⟩)))))))
def output18 : Fin 64 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover18 (i : Fin 64) : Fin 64 := ⟨coverData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 64) : Fin 64 := ⟨sourceData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 (.cutX 6912 .empty (.cutY 24832 .empty (.cutX 7040 (.cutY 24960 (.cutX 6976 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 7104 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 7136 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 7104 (.cutY 25024 .full .full) (.cutY 25024 .full .full)))))) .empty)) .empty) (.cutY 25600 .empty (.cutX 7680 .empty (.cutY 26112 (.cutX 7936 (.cutY 25856 (.cutX 7808 (.cutY 25728 (.cutX 7744 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 7872 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 7904 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 7872 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty) .empty) .empty)))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 (.cutY 6656 .empty (.cutX 24832 .empty (.cutY 6912 .empty (.cutX 24960 (.cutY 7040 (.cutX 24896 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 24896 (.cutY 7104 .full (.cutX 24864 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 25024 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))))) .empty) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 .empty (.cutX 25856 (.cutY 7936 (.cutX 25728 (.cutY 7808 (.cutX 25664 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 25664 (.cutY 7872 .full (.cutX 25632 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 25792 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty) .empty)) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata18 : 0<31548346 ∧ 27<128 ∧ 97<128 ∧ 0<4 ∧
    2824/4160=0 ∧ 2824%4160=2824 ∧ ∀ i, (leaves18 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData18).mp
    (by decide +kernel)

theorem sourceChecked18_0 : ∀ i : Fin 64,
    (fun i => output18 i = raw18 (source18 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked18 : ∀ i : Fin 64, (fun i => output18 i = raw18 (source18 i)) i :=
  forallFin_of_zero_offset (fun i => output18 i = raw18 (source18 i)) sourceChecked18_0

theorem coverChecked18_0 : ∀ i : Fin 64,
    (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked18 : ∀ i : Fin 64, (fun i => (output18 (cover18 i)).ContainsBox (raw18 i)) i :=
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 6545, atom 6982, type 1, source (27,95).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 95 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,24320,24448⟩) (.node (.single ⟨6912,7040,24448,24576⟩) (.single ⟨7040,7104,24320,24384⟩))) (.node (.node (.single ⟨7040,7104,24384,24448⟩) (.single ⟨7104,7168,24320,24384⟩)) (.node (.single ⟨7104,7168,24384,24448⟩) (.single ⟨7040,7168,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,25600,25728⟩) (.node (.single ⟨8192,8320,25728,25856⟩) (.single ⟨8320,8384,25600,25664⟩))) (.node (.node (.single ⟨8320,8384,25664,25728⟩) (.single ⟨8384,8448,25600,25664⟩)) (.node (.single ⟨8384,8448,25664,25728⟩) (.single ⟨8320,8448,25728,25856⟩))))) (.node (.node (.node (.single ⟨24320,24448,6912,7040⟩) (.node (.single ⟨24320,24384,7040,7104⟩) (.single ⟨24320,24384,7104,7168⟩))) (.node (.node (.single ⟨24384,24448,7040,7104⟩) (.single ⟨24384,24448,7104,7168⟩)) (.node (.single ⟨24448,24576,6912,7040⟩) (.single ⟨24448,24576,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,8192,8320⟩) (.node (.single ⟨25600,25664,8320,8384⟩) (.single ⟨25600,25664,8384,8448⟩))) (.node (.node (.single ⟨25664,25728,8320,8384⟩) (.single ⟨25664,25728,8384,8448⟩)) (.node (.single ⟨25728,25856,8192,8320⟩) (.single ⟨25728,25856,8320,8448⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 .empty (.cutY 24064 .empty (.cutX 6912 .empty (.cutY 24320 .empty (.cutX 7040 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 7104 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 (.cutY 26112 (.cutX 8448 (.cutY 25856 (.cutX 8320 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 8384 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 .empty (.cutY 6656 .empty (.cutX 24320 .empty (.cutY 6912 .empty (.cutX 24448 (.cutY 7040 .full (.cutX 24384 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 (.cutY 8704 (.cutX 25856 (.cutY 8448 (.cutX 25728 (.cutY 8320 .full (.cutX 25664 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata19 : 0<149239428 ∧ 27<128 ∧ 95<128 ∧ 1<4 ∧
    6982/4160=1 ∧ 6982%4160=2822 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 6546, atom 571, type 0, source (4,75).
def leavesData20 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves20 : Fin 7 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 75 leaves20 i
def outputData20 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,19200,19328⟩) (.node (.single ⟨1024,1152,19328,19456⟩) (.single ⟨1152,1216,19200,19264⟩))) (.node (.node (.single ⟨1152,1216,19264,19328⟩) (.single ⟨1216,1280,19200,19264⟩)) (.node (.single ⟨1216,1280,19264,19328⟩) (.single ⟨1152,1280,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,31488,31616⟩) (.node (.single ⟨13312,13440,31616,31744⟩) (.single ⟨13440,13504,31488,31552⟩))) (.node (.node (.single ⟨13440,13504,31552,31616⟩) (.single ⟨13504,13568,31488,31552⟩)) (.node (.single ⟨13504,13568,31552,31616⟩) (.single ⟨13440,13568,31616,31744⟩))))) (.node (.node (.node (.single ⟨19200,19328,1024,1152⟩) (.node (.single ⟨19200,19264,1152,1216⟩) (.single ⟨19200,19264,1216,1280⟩))) (.node (.node (.single ⟨19264,19328,1152,1216⟩) (.single ⟨19264,19328,1216,1280⟩)) (.node (.single ⟨19328,19456,1024,1152⟩) (.single ⟨19328,19456,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,13312,13440⟩) (.node (.single ⟨31488,31552,13440,13504⟩) (.single ⟨31488,31552,13504,13568⟩))) (.node (.node (.single ⟨31552,31616,13440,13504⟩) (.single ⟨31552,31616,13504,13568⟩)) (.node (.single ⟨31616,31744,13312,13440⟩) (.single ⟨31616,31744,13440,13568⟩))))))
def output20 : Fin 28 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData20 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover20 (i : Fin 28) : Fin 28 := ⟨coverData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 28) : Fin 28 := ⟨sourceData20.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 .empty (.cutX 1280 (.cutY 19200 .empty (.cutX 1152 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 1216 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full))) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 .empty (.cutX 13568 (.cutY 31488 .empty (.cutX 13440 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 13504 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty)) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 (.cutX 19200 .empty (.cutY 1280 (.cutX 19328 (.cutY 1152 .full (.cutX 19264 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 (.cutX 31488 .empty (.cutY 13568 (.cutX 31616 (.cutY 13440 .full (.cutX 31552 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty))) .empty) .empty)))))) .empty))

theorem metadata20 : 0<34183877 ∧ 4<128 ∧ 75<128 ∧ 0<4 ∧
    571/4160=0 ∧ 571%4160=571 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 6547, atom 4849, type 1, source (5,74).
def leavesData21 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves21 : Fin 7 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 74 leaves21 i
def outputData21 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,18944,19072⟩) (.node (.single ⟨1280,1408,19072,19200⟩) (.single ⟨1408,1472,18944,19008⟩))) (.node (.node (.single ⟨1408,1472,19008,19072⟩) (.single ⟨1472,1536,18944,19008⟩)) (.node (.single ⟨1472,1536,19008,19072⟩) (.single ⟨1408,1536,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,31232,31360⟩) (.node (.single ⟨13568,13696,31360,31488⟩) (.single ⟨13696,13760,31232,31296⟩))) (.node (.node (.single ⟨13696,13760,31296,31360⟩) (.single ⟨13760,13824,31232,31296⟩)) (.node (.single ⟨13760,13824,31296,31360⟩) (.single ⟨13696,13824,31360,31488⟩))))) (.node (.node (.node (.single ⟨18944,19072,1280,1408⟩) (.node (.single ⟨18944,19008,1408,1472⟩) (.single ⟨18944,19008,1472,1536⟩))) (.node (.node (.single ⟨19008,19072,1408,1472⟩) (.single ⟨19008,19072,1472,1536⟩)) (.node (.single ⟨19072,19200,1280,1408⟩) (.single ⟨19072,19200,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,13568,13696⟩) (.node (.single ⟨31232,31296,13696,13760⟩) (.single ⟨31232,31296,13760,13824⟩))) (.node (.node (.single ⟨31296,31360,13696,13760⟩) (.single ⟨31296,31360,13760,13824⟩)) (.node (.single ⟨31360,31488,13568,13696⟩) (.single ⟨31360,31488,13696,13824⟩))))))
def output21 : Fin 28 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData21 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover21 (i : Fin 28) : Fin 28 := ⟨coverData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 28) : Fin 28 := ⟨sourceData21.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 .empty (.cutX 1280 .empty (.cutY 19200 (.cutX 1408 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 1472 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 .empty (.cutX 13568 .empty (.cutY 31488 (.cutX 13696 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 13760 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty))) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 (.cutX 19200 (.cutY 1280 .empty (.cutX 19072 (.cutY 1408 .full (.cutX 19008 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 (.cutX 31488 (.cutY 13568 .empty (.cutX 31360 (.cutY 13696 .full (.cutX 31296 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty))) .empty) .empty)))))) .empty))

theorem metadata21 : 0<137362203 ∧ 5<128 ∧ 74<128 ∧ 1<4 ∧
    4849/4160=1 ∧ 4849%4160=689 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 6548, atom 924, type 0, source (7,77).
def leavesData22 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves22 : Fin 4 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 77 leaves22 i
def outputData22 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,19712,19840⟩) (.single ⟨1792,1920,19840,19968⟩)) (.node (.single ⟨1920,2048,19712,19840⟩) (.single ⟨1920,2048,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,30720,30848⟩) (.single ⟨12800,12928,30848,30976⟩)) (.node (.single ⟨12928,13056,30720,30848⟩) (.single ⟨12928,13056,30848,30976⟩)))) (.node (.node (.node (.single ⟨19712,19840,1792,1920⟩) (.single ⟨19712,19840,1920,2048⟩)) (.node (.single ⟨19840,19968,1792,1920⟩) (.single ⟨19840,19968,1920,2048⟩))) (.node (.node (.single ⟨30720,30848,12800,12928⟩) (.single ⟨30720,30848,12928,13056⟩)) (.node (.single ⟨30848,30976,12800,12928⟩) (.single ⟨30848,30976,12928,13056⟩)))))
def output22 : Fin 16 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData22 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover22 (i : Fin 16) : Fin 16 := ⟨coverData22.get i % 16, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 16) : Fin 16 := ⟨sourceData22.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 .empty (.cutY 19968 (.cutX 1792 .empty (.cutY 19712 .empty (.cutX 1920 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty))))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 .empty (.cutY 31232 (.cutX 13056 (.cutY 30976 (.cutX 12928 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 (.cutY 1536 .empty (.cutX 19712 .empty (.cutY 1792 .empty (.cutX 19840 (.cutY 1920 .full .full) (.cutY 1920 .full .full))))) .empty))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 (.cutY 12800 .empty (.cutX 30976 (.cutY 13056 (.cutX 30848 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)))))) .empty))

theorem metadata22 : 0<34183877 ∧ 7<128 ∧ 77<128 ∧ 0<4 ∧
    924/4160=0 ∧ 924%4160=924 ∧ ∀ i, (leaves22 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData22).mp
    (by decide +kernel)

theorem sourceChecked22_0 : ∀ i : Fin 16,
    (fun i => output22 i = raw22 (source22 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked22 : ∀ i : Fin 16, (fun i => output22 i = raw22 (source22 i)) i :=
  forallFin_of_zero_offset (fun i => output22 i = raw22 (source22 i)) sourceChecked22_0

theorem coverChecked22_0 : ∀ i : Fin 16,
    (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked22 : ∀ i : Fin 16, (fun i => (output22 (cover22 i)).ContainsBox (raw22 i)) i :=
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 6549, atom 5307, type 1, source (9,76).
def leavesData23 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves23 : Fin 4 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 76 leaves23 i
def outputData23 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,19456,19584⟩) (.single ⟨2304,2432,19584,19712⟩)) (.node (.single ⟨2432,2560,19456,19584⟩) (.single ⟨2432,2560,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,30208,30336⟩) (.single ⟨13056,13184,30336,30464⟩)) (.node (.single ⟨13184,13312,30208,30336⟩) (.single ⟨13184,13312,30336,30464⟩)))) (.node (.node (.node (.single ⟨19456,19584,2304,2432⟩) (.single ⟨19456,19584,2432,2560⟩)) (.node (.single ⟨19584,19712,2304,2432⟩) (.single ⟨19584,19712,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,13056,13184⟩) (.single ⟨30208,30336,13184,13312⟩)) (.node (.single ⟨30336,30464,13056,13184⟩) (.single ⟨30336,30464,13184,13312⟩)))))
def output23 : Fin 16 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData23 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover23 (i : Fin 16) : Fin 16 := ⟨coverData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 16) : Fin 16 := ⟨sourceData23.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 (.cutX 2304 .empty (.cutY 19712 (.cutX 2432 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 .empty (.cutY 30208 .empty (.cutX 13056 .empty (.cutY 30464 (.cutX 13184 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty))))) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 (.cutY 2560 (.cutX 19712 (.cutY 2304 .empty (.cutX 19584 (.cutY 2432 .full .full) (.cutY 2432 .full .full))) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 .empty (.cutX 30464 (.cutY 13056 .empty (.cutX 30336 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty))) .empty)) .empty) .empty))))) .empty))

theorem metadata23 : 0<94387549 ∧ 9<128 ∧ 76<128 ∧ 1<4 ∧
    5307/4160=1 ∧ 5307%4160=1147 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 6550, atom 5082, type 1, source (7,75).
def leavesData24 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves24 : Fin 7 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 7 75 leaves24 i
def outputData24 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1792,1920,19200,19328⟩) (.node (.single ⟨1792,1920,19328,19456⟩) (.single ⟨1920,1984,19200,19264⟩))) (.node (.node (.single ⟨1920,1984,19264,19328⟩) (.single ⟨1984,2048,19200,19264⟩)) (.node (.single ⟨1984,2048,19264,19328⟩) (.single ⟨1920,2048,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,30720,30848⟩) (.node (.single ⟨13312,13440,30848,30976⟩) (.single ⟨13440,13504,30720,30784⟩))) (.node (.node (.single ⟨13440,13504,30784,30848⟩) (.single ⟨13504,13568,30720,30784⟩)) (.node (.single ⟨13504,13568,30784,30848⟩) (.single ⟨13440,13568,30848,30976⟩))))) (.node (.node (.node (.single ⟨19200,19328,1792,1920⟩) (.node (.single ⟨19200,19264,1920,1984⟩) (.single ⟨19200,19264,1984,2048⟩))) (.node (.node (.single ⟨19264,19328,1920,1984⟩) (.single ⟨19264,19328,1984,2048⟩)) (.node (.single ⟨19328,19456,1792,1920⟩) (.single ⟨19328,19456,1920,2048⟩)))) (.node (.node (.single ⟨30720,30848,13312,13440⟩) (.node (.single ⟨30720,30784,13440,13504⟩) (.single ⟨30720,30784,13504,13568⟩))) (.node (.node (.single ⟨30784,30848,13440,13504⟩) (.single ⟨30784,30848,13504,13568⟩)) (.node (.single ⟨30848,30976,13312,13440⟩) (.single ⟨30848,30976,13440,13568⟩))))))
def output24 : Fin 28 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData24 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover24 (i : Fin 28) : Fin 28 := ⟨coverData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 28) : Fin 28 := ⟨sourceData24.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 .empty (.cutX 1792 .empty (.cutY 19200 .empty (.cutX 1920 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 1984 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 (.cutX 13568 (.cutY 30976 (.cutX 13440 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 13504 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 .empty (.cutX 19200 .empty (.cutY 1792 .empty (.cutX 19328 (.cutY 1920 .full (.cutX 19264 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 (.cutX 30976 (.cutY 13568 (.cutX 30848 (.cutY 13440 .full (.cutX 30784 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)))))) .empty))

theorem metadata24 : 0<137362203 ∧ 7<128 ∧ 75<128 ∧ 1<4 ∧
    5082/4160=1 ∧ 5082%4160=922 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 6551, atom 4485, type 1, source (2,73).
def leavesData25 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves25 : Fin 7 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 73 leaves25 i
def outputData25 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,18688,18816⟩) (.node (.single ⟨512,640,18816,18944⟩) (.single ⟨640,704,18688,18752⟩))) (.node (.node (.single ⟨640,704,18752,18816⟩) (.single ⟨704,768,18688,18752⟩)) (.node (.single ⟨704,768,18752,18816⟩) (.single ⟨640,768,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,32000,32128⟩) (.node (.single ⟨13824,13952,32128,32256⟩) (.single ⟨13952,14016,32000,32064⟩))) (.node (.node (.single ⟨13952,14016,32064,32128⟩) (.single ⟨14016,14080,32000,32064⟩)) (.node (.single ⟨14016,14080,32064,32128⟩) (.single ⟨13952,14080,32128,32256⟩))))) (.node (.node (.node (.single ⟨18688,18816,512,640⟩) (.node (.single ⟨18688,18752,640,704⟩) (.single ⟨18688,18752,704,768⟩))) (.node (.node (.single ⟨18752,18816,640,704⟩) (.single ⟨18752,18816,704,768⟩)) (.node (.single ⟨18816,18944,512,640⟩) (.single ⟨18816,18944,640,768⟩)))) (.node (.node (.single ⟨32000,32128,13824,13952⟩) (.node (.single ⟨32000,32064,13952,14016⟩) (.single ⟨32000,32064,14016,14080⟩))) (.node (.node (.single ⟨32064,32128,13952,14016⟩) (.single ⟨32064,32128,14016,14080⟩)) (.node (.single ⟨32128,32256,13824,13952⟩) (.single ⟨32128,32256,13952,14080⟩))))))
def output25 : Fin 28 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData25 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover25 (i : Fin 28) : Fin 28 := ⟨coverData25.get i % 28, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 28) : Fin 28 := ⟨sourceData25.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 (.cutX 768 (.cutY 18688 .empty (.cutX 640 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 704 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 .empty (.cutY 32256 (.cutX 14080 (.cutY 32000 .empty (.cutX 13952 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 14016 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty))))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 (.cutY 512 .empty (.cutX 18688 .empty (.cutY 768 (.cutX 18816 (.cutY 640 .full (.cutX 18752 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 .empty (.cutX 32000 .empty (.cutY 14080 (.cutX 32128 (.cutY 13952 .full (.cutX 32064 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))) .empty))) .empty)))))) .empty))

theorem metadata25 : 0<137362203 ∧ 2<128 ∧ 73<128 ∧ 1<4 ∧
    4485/4160=1 ∧ 4485%4160=325 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 6552, atom 6320, type 1, source (19,89).
def leavesData26 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves26 : Fin 19 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 19 89 leaves26 i
def outputData26 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,22784,22848⟩) (.single ⟨4864,4928,22848,22912⟩)) (.node (.single ⟨4928,4992,22784,22848⟩) (.single ⟨4928,4992,22848,22912⟩))) (.node (.node (.single ⟨4864,4992,22912,23040⟩) (.single ⟨4992,5056,22784,22848⟩)) (.node (.single ⟨4992,5056,22848,22912⟩) (.node (.single ⟨5056,5088,22784,22816⟩) (.single ⟨5056,5088,22816,22848⟩))))) (.node (.node (.node (.single ⟨5088,5120,22784,22816⟩) (.single ⟨5088,5120,22816,22848⟩)) (.node (.single ⟨5056,5088,22848,22880⟩) (.node (.single ⟨5056,5088,22880,22912⟩) (.single ⟨5088,5120,22848,22880⟩)))) (.node (.node (.single ⟨5088,5120,22880,22912⟩) (.single ⟨4992,5056,22912,22976⟩)) (.node (.single ⟨4992,5056,22976,23040⟩) (.node (.single ⟨5056,5120,22912,22976⟩) (.single ⟨5056,5120,22976,23040⟩)))))) (.node (.node (.node (.node (.single ⟨9728,9792,27648,27712⟩) (.single ⟨9728,9792,27712,27776⟩)) (.node (.single ⟨9792,9856,27648,27712⟩) (.single ⟨9792,9856,27712,27776⟩))) (.node (.node (.single ⟨9728,9856,27776,27904⟩) (.single ⟨9856,9888,27648,27680⟩)) (.node (.single ⟨9856,9888,27680,27712⟩) (.node (.single ⟨9888,9920,27648,27680⟩) (.single ⟨9888,9920,27680,27712⟩))))) (.node (.node (.node (.single ⟨9856,9920,27712,27776⟩) (.single ⟨9920,9952,27648,27680⟩)) (.node (.single ⟨9920,9952,27680,27712⟩) (.node (.single ⟨9952,9984,27648,27680⟩) (.single ⟨9952,9984,27680,27712⟩)))) (.node (.node (.single ⟨9920,9984,27712,27776⟩) (.single ⟨9856,9920,27776,27840⟩)) (.node (.single ⟨9856,9920,27840,27904⟩) (.node (.single ⟨9920,9984,27776,27840⟩) (.single ⟨9920,9984,27840,27904⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,4864,4928⟩) (.single ⟨22784,22848,4928,4992⟩)) (.node (.single ⟨22848,22912,4864,4928⟩) (.single ⟨22848,22912,4928,4992⟩))) (.node (.node (.single ⟨22784,22848,4992,5056⟩) (.single ⟨22784,22816,5056,5088⟩)) (.node (.single ⟨22784,22816,5088,5120⟩) (.node (.single ⟨22816,22848,5056,5088⟩) (.single ⟨22816,22848,5088,5120⟩))))) (.node (.node (.node (.single ⟨22848,22912,4992,5056⟩) (.single ⟨22848,22880,5056,5088⟩)) (.node (.single ⟨22848,22880,5088,5120⟩) (.node (.single ⟨22880,22912,5056,5088⟩) (.single ⟨22880,22912,5088,5120⟩)))) (.node (.node (.single ⟨22912,23040,4864,4992⟩) (.single ⟨22912,22976,4992,5056⟩)) (.node (.single ⟨22912,22976,5056,5120⟩) (.node (.single ⟨22976,23040,4992,5056⟩) (.single ⟨22976,23040,5056,5120⟩)))))) (.node (.node (.node (.node (.single ⟨27648,27712,9728,9792⟩) (.single ⟨27648,27712,9792,9856⟩)) (.node (.single ⟨27712,27776,9728,9792⟩) (.single ⟨27712,27776,9792,9856⟩))) (.node (.node (.single ⟨27648,27680,9856,9888⟩) (.single ⟨27648,27680,9888,9920⟩)) (.node (.single ⟨27680,27712,9856,9888⟩) (.node (.single ⟨27680,27712,9888,9920⟩) (.single ⟨27648,27680,9920,9952⟩))))) (.node (.node (.node (.single ⟨27648,27680,9952,9984⟩) (.single ⟨27680,27712,9920,9952⟩)) (.node (.single ⟨27680,27712,9952,9984⟩) (.node (.single ⟨27712,27776,9856,9920⟩) (.single ⟨27712,27776,9920,9984⟩)))) (.node (.node (.single ⟨27776,27904,9728,9856⟩) (.single ⟨27776,27840,9856,9920⟩)) (.node (.single ⟨27776,27840,9920,9984⟩) (.node (.single ⟨27840,27904,9856,9920⟩) (.single ⟨27840,27904,9920,9984⟩))))))))
def output26 : Fin 76 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData26 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover26 (i : Fin 76) : Fin 76 := ⟨coverData26.get i % 76, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 76) : Fin 76 := ⟨sourceData26.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 (.cutX 4864 .empty (.cutY 22784 .empty (.cutX 4992 (.cutY 22912 (.cutX 4928 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 5056 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 5088 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) (.cutX 5088 (.cutY 22880 .full .full) (.cutY 22880 .full .full)))) (.cutX 5056 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 .empty (.cutY 28160 (.cutX 9984 (.cutY 27904 (.cutX 9856 (.cutY 27776 (.cutX 9792 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full) (.cutY 27776 (.cutX 9920 (.cutY 27712 (.cutX 9888 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full) (.cutY 27712 (.cutX 9952 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 9920 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty))))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 (.cutY 4608 .empty (.cutX 22784 .empty (.cutY 4864 .empty (.cutX 22912 (.cutY 4992 (.cutX 22848 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 22848 (.cutY 5056 .full (.cutX 22816 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full (.cutX 22880 (.cutY 5088 .full .full) (.cutY 5088 .full .full))))) (.cutY 4992 .full (.cutX 22976 (.cutY 5056 .full .full) (.cutY 5056 .full .full))))))) .empty) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 .empty (.cutX 27904 (.cutY 9984 (.cutX 27776 (.cutY 9856 (.cutX 27712 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 27712 (.cutY 9920 (.cutX 27680 (.cutY 9888 .full .full) (.cutY 9888 .full .full)) (.cutX 27680 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 27840 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata26 : 0<192153497 ∧ 19<128 ∧ 89<128 ∧ 1<4 ∧
    6320/4160=1 ∧ 6320%4160=2160 ∧ ∀ i, (leaves26 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData26).mp
    (by decide +kernel)

theorem sourceChecked26_0 : ∀ i : Fin 64,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked26_64 : ∀ i : Fin 12,
    (fun i => output26 i = raw26 (source26 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked26 : ∀ i : Fin 76, (fun i => output26 i = raw26 (source26 i)) i :=
  forallFin_of_zero_offset (fun i => output26 i = raw26 (source26 i)) (forallFinOffset_add (fun i => output26 i = raw26 (source26 i)) 0 64 12 (by decide) sourceChecked26_0
    sourceChecked26_64)

theorem coverChecked26_0 : ∀ i : Fin 64,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked26_64 : ∀ i : Fin 12,
    (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked26 : ∀ i : Fin 76, (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) i :=
  forallFin_of_zero_offset (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) (forallFinOffset_add (fun i => (output26 (cover26 i)).ContainsBox (raw26 i)) 0 64 12 (by decide) coverChecked26_0
    coverChecked26_64)

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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 6553, atom 1979, type 0, source (17,92).
def leavesData27 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves27 : Fin 10 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 17 92 leaves27 i
def outputData27 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4352,4480,23552,23680⟩) (.single ⟨4352,4480,23680,23808⟩)) (.node (.single ⟨4480,4544,23552,23616⟩) (.node (.single ⟨4480,4544,23616,23680⟩) (.single ⟨4544,4608,23552,23616⟩)))) (.node (.node (.single ⟨4544,4608,23616,23680⟩) (.single ⟨4480,4544,23680,23744⟩)) (.node (.single ⟨4480,4544,23744,23808⟩) (.node (.single ⟨4544,4608,23680,23744⟩) (.single ⟨4544,4608,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,28160,28224⟩) (.single ⟨8960,9024,28224,28288⟩)) (.node (.single ⟨9024,9088,28160,28224⟩) (.node (.single ⟨9024,9088,28224,28288⟩) (.single ⟨8960,9088,28288,28416⟩)))) (.node (.node (.single ⟨9088,9152,28160,28224⟩) (.single ⟨9088,9152,28224,28288⟩)) (.node (.single ⟨9152,9216,28160,28224⟩) (.node (.single ⟨9152,9216,28224,28288⟩) (.single ⟨9088,9216,28288,28416⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23680,4352,4480⟩) (.single ⟨23552,23616,4480,4544⟩)) (.node (.single ⟨23552,23616,4544,4608⟩) (.node (.single ⟨23616,23680,4480,4544⟩) (.single ⟨23616,23680,4544,4608⟩)))) (.node (.node (.single ⟨23680,23808,4352,4480⟩) (.single ⟨23680,23744,4480,4544⟩)) (.node (.single ⟨23680,23744,4544,4608⟩) (.node (.single ⟨23744,23808,4480,4544⟩) (.single ⟨23744,23808,4544,4608⟩))))) (.node (.node (.node (.single ⟨28160,28224,8960,9024⟩) (.single ⟨28160,28224,9024,9088⟩)) (.node (.single ⟨28224,28288,8960,9024⟩) (.node (.single ⟨28224,28288,9024,9088⟩) (.single ⟨28160,28224,9088,9152⟩)))) (.node (.node (.single ⟨28160,28224,9152,9216⟩) (.single ⟨28224,28288,9088,9152⟩)) (.node (.single ⟨28224,28288,9152,9216⟩) (.node (.single ⟨28288,28416,8960,9088⟩) (.single ⟨28288,28416,9088,9216⟩)))))))
def output27 : Fin 40 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover27 (i : Fin 40) : Fin 40 := ⟨coverData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 40) : Fin 40 := ⟨sourceData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 .empty (.cutY 23808 (.cutX 4480 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 4544 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 4544 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 .empty (.cutY 28416 (.cutX 9088 (.cutY 28288 (.cutX 9024 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 9152 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full)) .empty))))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 (.cutY 4352 .empty (.cutX 23680 (.cutY 4480 .full (.cutX 23616 (.cutY 4544 .full .full) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 23744 (.cutY 4544 .full .full) (.cutY 4544 .full .full))))) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 (.cutY 8960 .empty (.cutX 28288 (.cutY 9088 (.cutX 28224 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 28224 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata27 : 0<156282496 ∧ 17<128 ∧ 92<128 ∧ 0<4 ∧
    1979/4160=0 ∧ 1979%4160=1979 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 6554, atom 4730, type 1, source (4,74).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 74 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,18944,19072⟩) (.node (.single ⟨1024,1152,19072,19200⟩) (.single ⟨1152,1216,18944,19008⟩))) (.node (.node (.single ⟨1152,1216,19008,19072⟩) (.single ⟨1216,1280,18944,19008⟩)) (.node (.single ⟨1216,1280,19008,19072⟩) (.single ⟨1152,1280,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,31488,31616⟩) (.node (.single ⟨13568,13696,31616,31744⟩) (.single ⟨13696,13760,31488,31552⟩))) (.node (.node (.single ⟨13696,13760,31552,31616⟩) (.single ⟨13760,13824,31488,31552⟩)) (.node (.single ⟨13760,13824,31552,31616⟩) (.single ⟨13696,13824,31616,31744⟩))))) (.node (.node (.node (.single ⟨18944,19072,1024,1152⟩) (.node (.single ⟨18944,19008,1152,1216⟩) (.single ⟨18944,19008,1216,1280⟩))) (.node (.node (.single ⟨19008,19072,1152,1216⟩) (.single ⟨19008,19072,1216,1280⟩)) (.node (.single ⟨19072,19200,1024,1152⟩) (.single ⟨19072,19200,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,13568,13696⟩) (.node (.single ⟨31488,31552,13696,13760⟩) (.single ⟨31488,31552,13760,13824⟩))) (.node (.node (.single ⟨31552,31616,13696,13760⟩) (.single ⟨31552,31616,13760,13824⟩)) (.node (.single ⟨31616,31744,13568,13696⟩) (.single ⟨31616,31744,13696,13824⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 .empty (.cutX 1280 (.cutY 19200 (.cutX 1152 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 1216 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 .empty (.cutX 13568 .empty (.cutY 31488 .empty (.cutX 13696 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 13760 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))))) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 (.cutX 19200 (.cutY 1280 (.cutX 19072 (.cutY 1152 .full (.cutX 19008 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 (.cutX 31488 .empty (.cutY 13568 .empty (.cutX 31616 (.cutY 13696 .full (.cutX 31552 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty))) .empty) .empty)))))) .empty))

theorem metadata28 : 0<137362203 ∧ 4<128 ∧ 74<128 ∧ 1<4 ∧
    4730/4160=1 ∧ 4730%4160=570 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 6555, atom 6668, type 1, source (23,93).
def leavesData29 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves29 : Fin 10 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 93 leaves29 i
def outputData29 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,23808,23872⟩) (.single ⟨5888,5952,23872,23936⟩)) (.node (.single ⟨5952,6016,23808,23872⟩) (.node (.single ⟨5952,6016,23872,23936⟩) (.single ⟨5888,6016,23936,24064⟩)))) (.node (.node (.single ⟨6016,6080,23808,23872⟩) (.single ⟨6016,6080,23872,23936⟩)) (.node (.single ⟨6080,6144,23808,23872⟩) (.node (.single ⟨6080,6144,23872,23936⟩) (.single ⟨6016,6144,23936,24064⟩))))) (.node (.node (.node (.single ⟨8704,8832,26624,26752⟩) (.single ⟨8704,8832,26752,26880⟩)) (.node (.single ⟨8832,8896,26624,26688⟩) (.node (.single ⟨8832,8896,26688,26752⟩) (.single ⟨8896,8960,26624,26688⟩)))) (.node (.node (.single ⟨8896,8960,26688,26752⟩) (.single ⟨8832,8896,26752,26816⟩)) (.node (.single ⟨8832,8896,26816,26880⟩) (.node (.single ⟨8896,8960,26752,26816⟩) (.single ⟨8896,8960,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨23808,23872,5888,5952⟩) (.single ⟨23808,23872,5952,6016⟩)) (.node (.single ⟨23872,23936,5888,5952⟩) (.node (.single ⟨23872,23936,5952,6016⟩) (.single ⟨23808,23872,6016,6080⟩)))) (.node (.node (.single ⟨23808,23872,6080,6144⟩) (.single ⟨23872,23936,6016,6080⟩)) (.node (.single ⟨23872,23936,6080,6144⟩) (.node (.single ⟨23936,24064,5888,6016⟩) (.single ⟨23936,24064,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,8704,8832⟩) (.single ⟨26624,26688,8832,8896⟩)) (.node (.single ⟨26624,26688,8896,8960⟩) (.node (.single ⟨26688,26752,8832,8896⟩) (.single ⟨26688,26752,8896,8960⟩)))) (.node (.node (.single ⟨26752,26880,8704,8832⟩) (.single ⟨26752,26816,8832,8896⟩)) (.node (.single ⟨26752,26816,8896,8960⟩) (.node (.single ⟨26816,26880,8832,8896⟩) (.single ⟨26816,26880,8896,8960⟩)))))))
def output29 : Fin 40 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData29 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover29 (i : Fin 40) : Fin 40 := ⟨coverData29.get i % 40, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 40) : Fin 40 := ⟨sourceData29.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 .empty (.cutY 24064 (.cutX 5888 .empty (.cutY 23808 .empty (.cutX 6016 (.cutY 23936 (.cutX 5952 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 6080 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full)))) .empty))))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 (.cutX 8960 (.cutY 26880 (.cutX 8832 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 8896 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 8896 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 .empty (.cutX 23808 .empty (.cutY 5888 .empty (.cutX 23936 (.cutY 6016 (.cutX 23872 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 23872 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 (.cutY 8704 .empty (.cutX 26880 (.cutY 8960 (.cutX 26752 (.cutY 8832 .full (.cutX 26688 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 26816 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata29 : 0<192153497 ∧ 23<128 ∧ 93<128 ∧ 1<4 ∧
    6668/4160=1 ∧ 6668%4160=2508 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 6556, atom 7127, type 1, source (29,96).
def leavesData30 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves30 : Fin 7 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 29 96 leaves30 i
def outputData30 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7424,7552,24576,24704⟩) (.node (.single ⟨7424,7552,24704,24832⟩) (.single ⟨7552,7616,24576,24640⟩))) (.node (.node (.single ⟨7552,7616,24640,24704⟩) (.single ⟨7616,7680,24576,24640⟩)) (.node (.single ⟨7616,7680,24640,24704⟩) (.single ⟨7552,7680,24704,24832⟩)))) (.node (.node (.single ⟨7936,8064,25088,25216⟩) (.node (.single ⟨7936,8064,25216,25344⟩) (.single ⟨8064,8128,25088,25152⟩))) (.node (.node (.single ⟨8064,8128,25152,25216⟩) (.single ⟨8128,8192,25088,25152⟩)) (.node (.single ⟨8128,8192,25152,25216⟩) (.single ⟨8064,8192,25216,25344⟩))))) (.node (.node (.node (.single ⟨24576,24704,7424,7552⟩) (.node (.single ⟨24576,24640,7552,7616⟩) (.single ⟨24576,24640,7616,7680⟩))) (.node (.node (.single ⟨24640,24704,7552,7616⟩) (.single ⟨24640,24704,7616,7680⟩)) (.node (.single ⟨24704,24832,7424,7552⟩) (.single ⟨24704,24832,7552,7680⟩)))) (.node (.node (.single ⟨25088,25216,7936,8064⟩) (.node (.single ⟨25088,25152,8064,8128⟩) (.single ⟨25088,25152,8128,8192⟩))) (.node (.node (.single ⟨25152,25216,8064,8128⟩) (.single ⟨25152,25216,8128,8192⟩)) (.node (.single ⟨25216,25344,7936,8064⟩) (.single ⟨25216,25344,8064,8192⟩))))))
def output30 : Fin 28 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover30 (i : Fin 28) : Fin 28 := ⟨coverData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 28) : Fin 28 := ⟨sourceData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 (.cutY 25088 (.cutX 7424 .empty (.cutY 24832 (.cutX 7552 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 7616 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty) (.cutY 25088 .empty (.cutX 7936 .empty (.cutY 25344 (.cutX 8064 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 8128 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 (.cutY 7680 (.cutX 24832 (.cutY 7424 .empty (.cutX 24704 (.cutY 7552 .full (.cutX 24640 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty) (.cutY 7680 .empty (.cutX 25344 (.cutY 7936 .empty (.cutX 25216 (.cutY 8064 .full (.cutX 25152 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)))) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata30 : 0<48020332 ∧ 29<128 ∧ 96<128 ∧ 1<4 ∧
    7127/4160=1 ∧ 7127%4160=2967 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 6557, atom 6829, type 1, source (25,94).
def leavesData31 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves31 : Fin 10 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 94 leaves31 i
def outputData31 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,24064,24128⟩) (.single ⟨6400,6464,24128,24192⟩)) (.node (.single ⟨6464,6528,24064,24128⟩) (.node (.single ⟨6464,6528,24128,24192⟩) (.single ⟨6400,6528,24192,24320⟩)))) (.node (.node (.single ⟨6528,6592,24064,24128⟩) (.single ⟨6528,6592,24128,24192⟩)) (.node (.single ⟨6592,6656,24064,24128⟩) (.node (.single ⟨6592,6656,24128,24192⟩) (.single ⟨6528,6656,24192,24320⟩))))) (.node (.node (.node (.single ⟨8448,8576,26112,26240⟩) (.single ⟨8448,8576,26240,26368⟩)) (.node (.single ⟨8576,8640,26112,26176⟩) (.node (.single ⟨8576,8640,26176,26240⟩) (.single ⟨8640,8704,26112,26176⟩)))) (.node (.node (.single ⟨8640,8704,26176,26240⟩) (.single ⟨8576,8640,26240,26304⟩)) (.node (.single ⟨8576,8640,26304,26368⟩) (.node (.single ⟨8640,8704,26240,26304⟩) (.single ⟨8640,8704,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,6400,6464⟩) (.single ⟨24064,24128,6464,6528⟩)) (.node (.single ⟨24128,24192,6400,6464⟩) (.node (.single ⟨24128,24192,6464,6528⟩) (.single ⟨24064,24128,6528,6592⟩)))) (.node (.node (.single ⟨24064,24128,6592,6656⟩) (.single ⟨24128,24192,6528,6592⟩)) (.node (.single ⟨24128,24192,6592,6656⟩) (.node (.single ⟨24192,24320,6400,6528⟩) (.single ⟨24192,24320,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,8448,8576⟩) (.single ⟨26112,26176,8576,8640⟩)) (.node (.single ⟨26112,26176,8640,8704⟩) (.node (.single ⟨26176,26240,8576,8640⟩) (.single ⟨26176,26240,8640,8704⟩)))) (.node (.node (.single ⟨26240,26368,8448,8576⟩) (.single ⟨26240,26304,8576,8640⟩)) (.node (.single ⟨26240,26304,8640,8704⟩) (.node (.single ⟨26304,26368,8576,8640⟩) (.single ⟨26304,26368,8640,8704⟩)))))))
def output31 : Fin 40 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover31 (i : Fin 40) : Fin 40 := ⟨coverData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 40) : Fin 40 := ⟨sourceData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 (.cutY 24064 .empty (.cutX 6400 .empty (.cutY 24320 (.cutX 6528 (.cutY 24192 (.cutX 6464 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 6592 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty))) .empty)) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 (.cutY 26112 .empty (.cutX 8448 .empty (.cutY 26368 (.cutX 8576 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 8640 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 8640 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 .empty (.cutY 6656 (.cutX 24320 (.cutY 6400 .empty (.cutX 24192 (.cutY 6528 (.cutX 24128 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 24128 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 .empty (.cutY 8704 (.cutX 26368 (.cutY 8448 .empty (.cutX 26240 (.cutY 8576 .full (.cutX 26176 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 26304 (.cutY 8640 .full .full) (.cutY 8640 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata31 : 0<149239428 ∧ 25<128 ∧ 94<128 ∧ 1<4 ∧
    6829/4160=1 ∧ 6829%4160=2669 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 6558, atom 2511, type 0, source (23,96).
def leavesData32 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves32 : Fin 10 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 96 leaves32 i
def outputData32 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,24576,24640⟩) (.single ⟨5888,5952,24640,24704⟩)) (.node (.single ⟨5952,6016,24576,24640⟩) (.node (.single ⟨5952,6016,24640,24704⟩) (.single ⟨5888,6016,24704,24832⟩)))) (.node (.node (.single ⟨6016,6080,24576,24640⟩) (.single ⟨6016,6080,24640,24704⟩)) (.node (.single ⟨6080,6144,24576,24640⟩) (.node (.single ⟨6080,6144,24640,24704⟩) (.single ⟨6016,6144,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,26624,26752⟩) (.single ⟨7936,8064,26752,26880⟩)) (.node (.single ⟨8064,8128,26624,26688⟩) (.node (.single ⟨8064,8128,26688,26752⟩) (.single ⟨8128,8192,26624,26688⟩)))) (.node (.node (.single ⟨8128,8192,26688,26752⟩) (.single ⟨8064,8128,26752,26816⟩)) (.node (.single ⟨8064,8128,26816,26880⟩) (.node (.single ⟨8128,8192,26752,26816⟩) (.single ⟨8128,8192,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,5888,5952⟩) (.single ⟨24576,24640,5952,6016⟩)) (.node (.single ⟨24640,24704,5888,5952⟩) (.node (.single ⟨24640,24704,5952,6016⟩) (.single ⟨24576,24640,6016,6080⟩)))) (.node (.node (.single ⟨24576,24640,6080,6144⟩) (.single ⟨24640,24704,6016,6080⟩)) (.node (.single ⟨24640,24704,6080,6144⟩) (.node (.single ⟨24704,24832,5888,6016⟩) (.single ⟨24704,24832,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,7936,8064⟩) (.single ⟨26624,26688,8064,8128⟩)) (.node (.single ⟨26624,26688,8128,8192⟩) (.node (.single ⟨26688,26752,8064,8128⟩) (.single ⟨26688,26752,8128,8192⟩)))) (.node (.node (.single ⟨26752,26880,7936,8064⟩) (.single ⟨26752,26816,8064,8128⟩)) (.node (.single ⟨26752,26816,8128,8192⟩) (.node (.single ⟨26816,26880,8064,8128⟩) (.single ⟨26816,26880,8128,8192⟩)))))))
def output32 : Fin 40 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData32 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover32 (i : Fin 40) : Fin 40 := ⟨coverData32.get i % 40, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 40) : Fin 40 := ⟨sourceData32.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 (.cutX 5888 .empty (.cutY 24832 (.cutX 6016 (.cutY 24704 (.cutX 5952 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 6080 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full)) .empty)) .empty)) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 (.cutX 7936 .empty (.cutY 26880 (.cutX 8064 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 8128 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 8128 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 .empty (.cutX 24832 (.cutY 5888 .empty (.cutX 24704 (.cutY 6016 (.cutX 24640 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 24640 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 .empty (.cutX 26880 (.cutY 7936 .empty (.cutX 26752 (.cutY 8064 .full (.cutX 26688 (.cutY 8128 .full .full) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 26816 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))) .empty)) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata32 : 0<121837468 ∧ 23<128 ∧ 96<128 ∧ 0<4 ∧
    2511/4160=0 ∧ 2511%4160=2511 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

-- Frozen phase 6559, atom 5837, type 1, source (14,81).
def leavesData33 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves33 : Fin 7 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 81 leaves33 i
def outputData33 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,20736,20864⟩) (.node (.single ⟨3584,3712,20864,20992⟩) (.single ⟨3712,3776,20736,20800⟩))) (.node (.node (.single ⟨3712,3776,20800,20864⟩) (.single ⟨3776,3840,20736,20800⟩)) (.node (.single ⟨3776,3840,20800,20864⟩) (.single ⟨3712,3840,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,28928,29056⟩) (.node (.single ⟨11776,11904,29056,29184⟩) (.single ⟨11904,11968,28928,28992⟩))) (.node (.node (.single ⟨11904,11968,28992,29056⟩) (.single ⟨11968,12032,28928,28992⟩)) (.node (.single ⟨11968,12032,28992,29056⟩) (.single ⟨11904,12032,29056,29184⟩))))) (.node (.node (.node (.single ⟨20736,20864,3584,3712⟩) (.node (.single ⟨20736,20800,3712,3776⟩) (.single ⟨20736,20800,3776,3840⟩))) (.node (.node (.single ⟨20800,20864,3712,3776⟩) (.single ⟨20800,20864,3776,3840⟩)) (.node (.single ⟨20864,20992,3584,3712⟩) (.single ⟨20864,20992,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,11776,11904⟩) (.node (.single ⟨28928,28992,11904,11968⟩) (.single ⟨28928,28992,11968,12032⟩))) (.node (.node (.single ⟨28992,29056,11904,11968⟩) (.single ⟨28992,29056,11968,12032⟩)) (.node (.single ⟨29056,29184,11776,11904⟩) (.single ⟨29056,29184,11904,12032⟩))))))
def output33 : Fin 28 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData33 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover33 (i : Fin 28) : Fin 28 := ⟨coverData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 28) : Fin 28 := ⟨sourceData33.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 (.cutX 3840 (.cutY 20736 .empty (.cutX 3712 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 3776 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full))) .empty) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 .empty (.cutY 29184 (.cutX 12032 (.cutY 28928 .empty (.cutX 11904 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 11968 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 (.cutY 3584 .empty (.cutX 20736 .empty (.cutY 3840 (.cutX 20864 (.cutY 3712 .full (.cutX 20800 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 .empty (.cutX 28928 .empty (.cutY 12032 (.cutX 29056 (.cutY 11904 .full (.cutX 28992 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty))) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata33 : 0<139307719 ∧ 14<128 ∧ 81<128 ∧ 1<4 ∧
    5837/4160=1 ∧ 5837%4160=1677 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 6560, atom 6227, type 1, source (18,87).
def leavesData34 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves34 : Fin 16 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 18 87 leaves34 i
def outputData34 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,22272,22336⟩) (.single ⟨4608,4672,22336,22400⟩)) (.node (.single ⟨4672,4736,22272,22336⟩) (.single ⟨4672,4736,22336,22400⟩))) (.node (.node (.single ⟨4608,4736,22400,22528⟩) (.single ⟨4736,4800,22272,22336⟩)) (.node (.single ⟨4736,4800,22336,22400⟩) (.single ⟨4800,4832,22272,22304⟩)))) (.node (.node (.node (.single ⟨4800,4832,22304,22336⟩) (.single ⟨4832,4864,22272,22304⟩)) (.node (.single ⟨4832,4864,22304,22336⟩) (.single ⟨4800,4864,22336,22400⟩))) (.node (.node (.single ⟨4736,4800,22400,22464⟩) (.single ⟨4736,4800,22464,22528⟩)) (.node (.single ⟨4800,4864,22400,22464⟩) (.single ⟨4800,4864,22464,22528⟩))))) (.node (.node (.node (.node (.single ⟨10240,10304,27904,27968⟩) (.single ⟨10240,10304,27968,28032⟩)) (.node (.single ⟨10304,10368,27904,27968⟩) (.single ⟨10304,10368,27968,28032⟩))) (.node (.node (.single ⟨10240,10368,28032,28160⟩) (.single ⟨10368,10432,27904,27968⟩)) (.node (.single ⟨10368,10432,27968,28032⟩) (.single ⟨10432,10464,27904,27936⟩)))) (.node (.node (.node (.single ⟨10432,10464,27936,27968⟩) (.single ⟨10464,10496,27904,27936⟩)) (.node (.single ⟨10464,10496,27936,27968⟩) (.single ⟨10432,10496,27968,28032⟩))) (.node (.node (.single ⟨10368,10432,28032,28096⟩) (.single ⟨10368,10432,28096,28160⟩)) (.node (.single ⟨10432,10496,28032,28096⟩) (.single ⟨10432,10496,28096,28160⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22272,22336,4608,4672⟩) (.single ⟨22272,22336,4672,4736⟩)) (.node (.single ⟨22336,22400,4608,4672⟩) (.single ⟨22336,22400,4672,4736⟩))) (.node (.node (.single ⟨22272,22336,4736,4800⟩) (.single ⟨22272,22304,4800,4832⟩)) (.node (.single ⟨22272,22304,4832,4864⟩) (.single ⟨22304,22336,4800,4832⟩)))) (.node (.node (.node (.single ⟨22304,22336,4832,4864⟩) (.single ⟨22336,22400,4736,4800⟩)) (.node (.single ⟨22336,22400,4800,4864⟩) (.single ⟨22400,22528,4608,4736⟩))) (.node (.node (.single ⟨22400,22464,4736,4800⟩) (.single ⟨22400,22464,4800,4864⟩)) (.node (.single ⟨22464,22528,4736,4800⟩) (.single ⟨22464,22528,4800,4864⟩))))) (.node (.node (.node (.node (.single ⟨27904,27968,10240,10304⟩) (.single ⟨27904,27968,10304,10368⟩)) (.node (.single ⟨27968,28032,10240,10304⟩) (.single ⟨27968,28032,10304,10368⟩))) (.node (.node (.single ⟨27904,27968,10368,10432⟩) (.single ⟨27904,27936,10432,10464⟩)) (.node (.single ⟨27904,27936,10464,10496⟩) (.single ⟨27936,27968,10432,10464⟩)))) (.node (.node (.node (.single ⟨27936,27968,10464,10496⟩) (.single ⟨27968,28032,10368,10432⟩)) (.node (.single ⟨27968,28032,10432,10496⟩) (.single ⟨28032,28160,10240,10368⟩))) (.node (.node (.single ⟨28032,28096,10368,10432⟩) (.single ⟨28032,28096,10432,10496⟩)) (.node (.single ⟨28096,28160,10368,10432⟩) (.single ⟨28096,28160,10432,10496⟩)))))))
def output34 : Fin 64 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData34 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover34 (i : Fin 64) : Fin 64 := ⟨coverData34.get i % 64, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 64) : Fin 64 := ⟨sourceData34.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 .empty (.cutY 22016 .empty (.cutX 4864 (.cutY 22272 .empty (.cutX 4736 (.cutY 22400 (.cutX 4672 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 4800 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 4832 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 4800 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty)))) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 (.cutY 28160 (.cutX 10496 (.cutY 27904 .empty (.cutX 10368 (.cutY 28032 (.cutX 10304 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 10432 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 10464 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 10432 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty) .empty)) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 .empty (.cutY 4608 .empty (.cutX 22272 .empty (.cutY 4864 (.cutX 22400 (.cutY 4736 (.cutX 22336 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 22336 (.cutY 4800 .full (.cutX 22304 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 22464 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty)))) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 (.cutY 10752 (.cutX 27904 .empty (.cutY 10496 (.cutX 28032 (.cutY 10368 (.cutX 27968 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 27968 (.cutY 10432 .full (.cutX 27936 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 28096 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty) .empty) .empty)))) .empty) .empty))) .empty))

theorem metadata34 : 0<125829407 ∧ 18<128 ∧ 87<128 ∧ 1<4 ∧
    6227/4160=1 ∧ 6227%4160=2067 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 64,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 64, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) sourceChecked34_0

theorem coverChecked34_0 : ∀ i : Fin 64,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 64, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 6561, atom 2898, type 0, source (28,98).
def leavesData35 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves35 : Fin 16 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 28 98 leaves35 i
def outputData35 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨7168,7232,25088,25152⟩) (.single ⟨7168,7232,25152,25216⟩)) (.node (.single ⟨7232,7296,25088,25152⟩) (.single ⟨7232,7296,25152,25216⟩))) (.node (.node (.single ⟨7168,7296,25216,25344⟩) (.single ⟨7296,7360,25088,25152⟩)) (.node (.single ⟨7296,7360,25152,25216⟩) (.single ⟨7360,7392,25088,25120⟩)))) (.node (.node (.node (.single ⟨7360,7392,25120,25152⟩) (.single ⟨7392,7424,25088,25120⟩)) (.node (.single ⟨7392,7424,25120,25152⟩) (.single ⟨7360,7424,25152,25216⟩))) (.node (.node (.single ⟨7296,7360,25216,25280⟩) (.single ⟨7296,7360,25280,25344⟩)) (.node (.single ⟨7360,7424,25216,25280⟩) (.single ⟨7360,7424,25280,25344⟩))))) (.node (.node (.node (.node (.single ⟨7424,7488,25344,25408⟩) (.single ⟨7424,7488,25408,25472⟩)) (.node (.single ⟨7488,7552,25344,25408⟩) (.single ⟨7488,7552,25408,25472⟩))) (.node (.node (.single ⟨7424,7552,25472,25600⟩) (.single ⟨7552,7616,25344,25408⟩)) (.node (.single ⟨7552,7616,25408,25472⟩) (.single ⟨7616,7648,25344,25376⟩)))) (.node (.node (.node (.single ⟨7616,7648,25376,25408⟩) (.single ⟨7648,7680,25344,25376⟩)) (.node (.single ⟨7648,7680,25376,25408⟩) (.single ⟨7616,7680,25408,25472⟩))) (.node (.node (.single ⟨7552,7616,25472,25536⟩) (.single ⟨7552,7616,25536,25600⟩)) (.node (.single ⟨7616,7680,25472,25536⟩) (.single ⟨7616,7680,25536,25600⟩)))))) (.node (.node (.node (.node (.node (.single ⟨25088,25152,7168,7232⟩) (.single ⟨25088,25152,7232,7296⟩)) (.node (.single ⟨25152,25216,7168,7232⟩) (.single ⟨25152,25216,7232,7296⟩))) (.node (.node (.single ⟨25088,25152,7296,7360⟩) (.single ⟨25088,25120,7360,7392⟩)) (.node (.single ⟨25088,25120,7392,7424⟩) (.single ⟨25120,25152,7360,7392⟩)))) (.node (.node (.node (.single ⟨25120,25152,7392,7424⟩) (.single ⟨25152,25216,7296,7360⟩)) (.node (.single ⟨25152,25216,7360,7424⟩) (.single ⟨25216,25344,7168,7296⟩))) (.node (.node (.single ⟨25216,25280,7296,7360⟩) (.single ⟨25216,25280,7360,7424⟩)) (.node (.single ⟨25280,25344,7296,7360⟩) (.single ⟨25280,25344,7360,7424⟩))))) (.node (.node (.node (.node (.single ⟨25344,25408,7424,7488⟩) (.single ⟨25344,25408,7488,7552⟩)) (.node (.single ⟨25408,25472,7424,7488⟩) (.single ⟨25408,25472,7488,7552⟩))) (.node (.node (.single ⟨25344,25408,7552,7616⟩) (.single ⟨25344,25376,7616,7648⟩)) (.node (.single ⟨25344,25376,7648,7680⟩) (.single ⟨25376,25408,7616,7648⟩)))) (.node (.node (.node (.single ⟨25376,25408,7648,7680⟩) (.single ⟨25408,25472,7552,7616⟩)) (.node (.single ⟨25408,25472,7616,7680⟩) (.single ⟨25472,25600,7424,7552⟩))) (.node (.node (.single ⟨25472,25536,7552,7616⟩) (.single ⟨25472,25536,7616,7680⟩)) (.node (.single ⟨25536,25600,7552,7616⟩) (.single ⟨25536,25600,7616,7680⟩)))))))
def output35 : Fin 64 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData35 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover35 (i : Fin 64) : Fin 64 := ⟨coverData35.get i % 64, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 64) : Fin 64 := ⟨sourceData35.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 (.cutY 25088 .empty (.cutX 7424 (.cutY 25344 (.cutX 7296 (.cutY 25216 (.cutX 7232 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 7360 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 7392 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) (.cutX 7360 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty) (.cutY 25344 .empty (.cutX 7552 (.cutY 25472 (.cutX 7488 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 7616 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 7648 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 7616 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))))) .empty) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 .empty (.cutY 7680 (.cutX 25344 (.cutY 7424 (.cutX 25216 (.cutY 7296 (.cutX 25152 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 25152 (.cutY 7360 .full (.cutX 25120 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 25280 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) (.cutY 7424 .empty (.cutX 25472 (.cutY 7552 (.cutX 25408 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 25408 (.cutY 7616 .full (.cutX 25376 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 25536 (.cutY 7616 .full .full) (.cutY 7616 .full .full)))))) .empty))) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata35 : 0<31548346 ∧ 28<128 ∧ 98<128 ∧ 0<4 ∧
    2898/4160=0 ∧ 2898%4160=2898 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 64,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 64, (fun i => output35 i = raw35 (source35 i)) i :=
  forallFin_of_zero_offset (fun i => output35 i = raw35 (source35 i)) sourceChecked35_0

theorem coverChecked35_0 : ∀ i : Fin 64,
    (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked35 : ∀ i : Fin 64, (fun i => (output35 (cover35 i)).ContainsBox (raw35 i)) i :=
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 6562, atom 2073, type 0, source (18,93).
def leavesData36 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves36 : Fin 16 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 18 93 leaves36 i
def outputData36 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,23808,23872⟩) (.single ⟨4608,4672,23872,23936⟩)) (.node (.single ⟨4672,4736,23808,23872⟩) (.single ⟨4672,4736,23872,23936⟩))) (.node (.node (.single ⟨4608,4736,23936,24064⟩) (.single ⟨4736,4800,23808,23872⟩)) (.node (.single ⟨4736,4800,23872,23936⟩) (.single ⟨4800,4832,23808,23840⟩)))) (.node (.node (.node (.single ⟨4800,4832,23840,23872⟩) (.single ⟨4832,4864,23808,23840⟩)) (.node (.single ⟨4832,4864,23840,23872⟩) (.single ⟨4800,4864,23872,23936⟩))) (.node (.node (.single ⟨4736,4800,23936,24000⟩) (.single ⟨4736,4800,24000,24064⟩)) (.node (.single ⟨4800,4864,23936,24000⟩) (.single ⟨4800,4864,24000,24064⟩))))) (.node (.node (.node (.node (.single ⟨8704,8768,27904,27968⟩) (.single ⟨8704,8768,27968,28032⟩)) (.node (.single ⟨8768,8832,27904,27968⟩) (.single ⟨8768,8832,27968,28032⟩))) (.node (.node (.single ⟨8704,8832,28032,28160⟩) (.single ⟨8832,8896,27904,27968⟩)) (.node (.single ⟨8832,8896,27968,28032⟩) (.single ⟨8896,8928,27904,27936⟩)))) (.node (.node (.node (.single ⟨8896,8928,27936,27968⟩) (.single ⟨8928,8960,27904,27936⟩)) (.node (.single ⟨8928,8960,27936,27968⟩) (.single ⟨8896,8960,27968,28032⟩))) (.node (.node (.single ⟨8832,8896,28032,28096⟩) (.single ⟨8832,8896,28096,28160⟩)) (.node (.single ⟨8896,8960,28032,28096⟩) (.single ⟨8896,8960,28096,28160⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23808,23872,4608,4672⟩) (.single ⟨23808,23872,4672,4736⟩)) (.node (.single ⟨23872,23936,4608,4672⟩) (.single ⟨23872,23936,4672,4736⟩))) (.node (.node (.single ⟨23808,23872,4736,4800⟩) (.single ⟨23808,23840,4800,4832⟩)) (.node (.single ⟨23808,23840,4832,4864⟩) (.single ⟨23840,23872,4800,4832⟩)))) (.node (.node (.node (.single ⟨23840,23872,4832,4864⟩) (.single ⟨23872,23936,4736,4800⟩)) (.node (.single ⟨23872,23936,4800,4864⟩) (.single ⟨23936,24064,4608,4736⟩))) (.node (.node (.single ⟨23936,24000,4736,4800⟩) (.single ⟨23936,24000,4800,4864⟩)) (.node (.single ⟨24000,24064,4736,4800⟩) (.single ⟨24000,24064,4800,4864⟩))))) (.node (.node (.node (.node (.single ⟨27904,27968,8704,8768⟩) (.single ⟨27904,27968,8768,8832⟩)) (.node (.single ⟨27968,28032,8704,8768⟩) (.single ⟨27968,28032,8768,8832⟩))) (.node (.node (.single ⟨27904,27968,8832,8896⟩) (.single ⟨27904,27936,8896,8928⟩)) (.node (.single ⟨27904,27936,8928,8960⟩) (.single ⟨27936,27968,8896,8928⟩)))) (.node (.node (.node (.single ⟨27936,27968,8928,8960⟩) (.single ⟨27968,28032,8832,8896⟩)) (.node (.single ⟨27968,28032,8896,8960⟩) (.single ⟨28032,28160,8704,8832⟩))) (.node (.node (.single ⟨28032,28096,8832,8896⟩) (.single ⟨28032,28096,8896,8960⟩)) (.node (.single ⟨28096,28160,8832,8896⟩) (.single ⟨28096,28160,8896,8960⟩)))))))
def output36 : Fin 64 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData36 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover36 (i : Fin 64) : Fin 64 := ⟨coverData36.get i % 64, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 64) : Fin 64 := ⟨sourceData36.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 (.cutX 4864 (.cutY 23808 .empty (.cutX 4736 (.cutY 23936 (.cutX 4672 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 4800 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 4832 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 4800 (.cutY 24000 .full .full) (.cutY 24000 .full .full))))) .empty) .empty))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 (.cutX 8960 (.cutY 27904 .empty (.cutX 8832 (.cutY 28032 (.cutX 8768 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 8896 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 8928 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 8896 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 .empty (.cutX 23808 .empty (.cutY 4864 (.cutX 23936 (.cutY 4736 (.cutX 23872 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 23872 (.cutY 4800 .full (.cutX 23840 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 24000 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty))) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 .empty (.cutX 27904 .empty (.cutY 8960 (.cutX 28032 (.cutY 8832 (.cutX 27968 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 27968 (.cutY 8896 .full (.cutX 27936 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 28096 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty))) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata36 : 0<156282496 ∧ 18<128 ∧ 93<128 ∧ 0<4 ∧
    2073/4160=0 ∧ 2073%4160=2073 ∧ ∀ i, (leaves36 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData36).mp
    (by decide +kernel)

theorem sourceChecked36_0 : ∀ i : Fin 64,
    (fun i => output36 i = raw36 (source36 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked36 : ∀ i : Fin 64, (fun i => output36 i = raw36 (source36 i)) i :=
  forallFin_of_zero_offset (fun i => output36 i = raw36 (source36 i)) sourceChecked36_0

theorem coverChecked36_0 : ∀ i : Fin 64,
    (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked36 : ∀ i : Fin 64, (fun i => (output36 (cover36 i)).ContainsBox (raw36 i)) i :=
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 6563, atom 6499, type 1, source (21,92).
def leavesData37 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves37 : Fin 13 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 92 leaves37 i
def outputData37 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,23552,23616⟩) (.node (.single ⟨5376,5440,23616,23680⟩) (.single ⟨5440,5504,23552,23616⟩))) (.node (.single ⟨5440,5504,23616,23680⟩) (.node (.single ⟨5376,5504,23680,23808⟩) (.single ⟨5504,5568,23552,23616⟩)))) (.node (.node (.single ⟨5504,5568,23616,23680⟩) (.node (.single ⟨5568,5632,23552,23616⟩) (.single ⟨5568,5632,23616,23680⟩))) (.node (.node (.single ⟨5504,5568,23680,23744⟩) (.single ⟨5504,5568,23744,23808⟩)) (.node (.single ⟨5568,5632,23680,23744⟩) (.single ⟨5568,5632,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,27136,27200⟩) (.node (.single ⟨8960,9024,27200,27264⟩) (.single ⟨9024,9088,27136,27200⟩))) (.node (.single ⟨9024,9088,27200,27264⟩) (.node (.single ⟨8960,9088,27264,27392⟩) (.single ⟨9088,9152,27136,27200⟩)))) (.node (.node (.single ⟨9088,9152,27200,27264⟩) (.node (.single ⟨9152,9216,27136,27200⟩) (.single ⟨9152,9216,27200,27264⟩))) (.node (.node (.single ⟨9088,9152,27264,27328⟩) (.single ⟨9088,9152,27328,27392⟩)) (.node (.single ⟨9152,9216,27264,27328⟩) (.single ⟨9152,9216,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,5376,5440⟩) (.node (.single ⟨23552,23616,5440,5504⟩) (.single ⟨23616,23680,5376,5440⟩))) (.node (.single ⟨23616,23680,5440,5504⟩) (.node (.single ⟨23552,23616,5504,5568⟩) (.single ⟨23552,23616,5568,5632⟩)))) (.node (.node (.single ⟨23616,23680,5504,5568⟩) (.node (.single ⟨23616,23680,5568,5632⟩) (.single ⟨23680,23808,5376,5504⟩))) (.node (.node (.single ⟨23680,23744,5504,5568⟩) (.single ⟨23680,23744,5568,5632⟩)) (.node (.single ⟨23744,23808,5504,5568⟩) (.single ⟨23744,23808,5568,5632⟩))))) (.node (.node (.node (.single ⟨27136,27200,8960,9024⟩) (.node (.single ⟨27136,27200,9024,9088⟩) (.single ⟨27200,27264,8960,9024⟩))) (.node (.single ⟨27200,27264,9024,9088⟩) (.node (.single ⟨27136,27200,9088,9152⟩) (.single ⟨27136,27200,9152,9216⟩)))) (.node (.node (.single ⟨27200,27264,9088,9152⟩) (.node (.single ⟨27200,27264,9152,9216⟩) (.single ⟨27264,27392,8960,9088⟩))) (.node (.node (.single ⟨27264,27328,9088,9152⟩) (.single ⟨27264,27328,9152,9216⟩)) (.node (.single ⟨27328,27392,9088,9152⟩) (.single ⟨27328,27392,9152,9216⟩)))))))
def output37 : Fin 52 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 7))))) (.node (.node (.node (.single 31) (.node (.single 44) (.single 20))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData37 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 19)))) (.node (.node (.single 11) (.node (.single 15) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 17) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 18) (.single 14)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover37 (i : Fin 52) : Fin 52 := ⟨coverData37.get i % 52, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 52) : Fin 52 := ⟨sourceData37.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 (.cutX 5376 .empty (.cutY 23808 (.cutX 5504 (.cutY 23680 (.cutX 5440 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 5568 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 5568 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty)) .empty) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 .empty (.cutX 8960 .empty (.cutY 27392 (.cutX 9088 (.cutY 27264 (.cutX 9024 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full) (.cutY 27264 (.cutX 9152 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 9152 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 (.cutX 23808 (.cutY 5376 .empty (.cutX 23680 (.cutY 5504 (.cutX 23616 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 23616 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full (.cutX 23744 (.cutY 5568 .full .full) (.cutY 5568 .full .full))))) .empty) .empty) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 .empty (.cutX 27392 (.cutY 8960 .empty (.cutX 27264 (.cutY 9088 (.cutX 27200 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 27200 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 27328 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))) .empty))) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata37 : 0<192153497 ∧ 21<128 ∧ 92<128 ∧ 1<4 ∧
    6499/4160=1 ∧ 6499%4160=2339 ∧ ∀ i, (leaves37 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData37).mp
    (by decide +kernel)

theorem sourceChecked37_0 : ∀ i : Fin 52,
    (fun i => output37 i = raw37 (source37 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked37 : ∀ i : Fin 52, (fun i => output37 i = raw37 (source37 i)) i :=
  forallFin_of_zero_offset (fun i => output37 i = raw37 (source37 i)) sourceChecked37_0

theorem coverChecked37_0 : ∀ i : Fin 52,
    (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked37 : ∀ i : Fin 52, (fun i => (output37 (cover37 i)).ContainsBox (raw37 i)) i :=
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

-- Frozen phase 6564, atom 2255, type 0, source (20,95).
def leavesData38 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves38 : Fin 7 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 95 leaves38 i
def outputData38 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,24320,24448⟩) (.node (.single ⟨5120,5248,24448,24576⟩) (.single ⟨5248,5312,24320,24384⟩))) (.node (.node (.single ⟨5248,5312,24384,24448⟩) (.single ⟨5312,5376,24320,24384⟩)) (.node (.single ⟨5312,5376,24384,24448⟩) (.single ⟨5248,5376,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,27392,27520⟩) (.node (.single ⟨8192,8320,27520,27648⟩) (.single ⟨8320,8384,27392,27456⟩))) (.node (.node (.single ⟨8320,8384,27456,27520⟩) (.single ⟨8384,8448,27392,27456⟩)) (.node (.single ⟨8384,8448,27456,27520⟩) (.single ⟨8320,8448,27520,27648⟩))))) (.node (.node (.node (.single ⟨24320,24448,5120,5248⟩) (.node (.single ⟨24320,24384,5248,5312⟩) (.single ⟨24320,24384,5312,5376⟩))) (.node (.node (.single ⟨24384,24448,5248,5312⟩) (.single ⟨24384,24448,5312,5376⟩)) (.node (.single ⟨24448,24576,5120,5248⟩) (.single ⟨24448,24576,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,8192,8320⟩) (.node (.single ⟨27392,27456,8320,8384⟩) (.single ⟨27392,27456,8384,8448⟩))) (.node (.node (.single ⟨27456,27520,8320,8384⟩) (.single ⟨27456,27520,8384,8448⟩)) (.node (.single ⟨27520,27648,8192,8320⟩) (.single ⟨27520,27648,8320,8448⟩))))))
def output38 : Fin 28 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover38 (i : Fin 28) : Fin 28 := ⟨coverData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 28) : Fin 28 := ⟨sourceData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 .empty (.cutX 5376 (.cutY 24320 .empty (.cutX 5248 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 5312 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))) .empty)) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 (.cutY 27136 .empty (.cutX 8448 (.cutY 27392 .empty (.cutX 8320 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 8384 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 .empty (.cutY 5632 (.cutX 24320 .empty (.cutY 5376 (.cutX 24448 (.cutY 5248 .full (.cutX 24384 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty)))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 (.cutX 27392 .empty (.cutY 8448 (.cutX 27520 (.cutY 8320 .full (.cutX 27456 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata38 : 0<156282496 ∧ 20<128 ∧ 95<128 ∧ 0<4 ∧
    2255/4160=0 ∧ 2255%4160=2255 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 6565, atom 6411, type 1, source (20,91).
def leavesData39 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves39 : Fin 16 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 20 91 leaves39 i
def outputData39 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5120,5184,23296,23360⟩) (.single ⟨5120,5184,23360,23424⟩)) (.node (.single ⟨5184,5248,23296,23360⟩) (.single ⟨5184,5248,23360,23424⟩))) (.node (.node (.single ⟨5120,5248,23424,23552⟩) (.single ⟨5248,5312,23296,23360⟩)) (.node (.single ⟨5248,5312,23360,23424⟩) (.single ⟨5312,5344,23296,23328⟩)))) (.node (.node (.node (.single ⟨5312,5344,23328,23360⟩) (.single ⟨5344,5376,23296,23328⟩)) (.node (.single ⟨5344,5376,23328,23360⟩) (.single ⟨5312,5376,23360,23424⟩))) (.node (.node (.single ⟨5248,5312,23424,23488⟩) (.single ⟨5248,5312,23488,23552⟩)) (.node (.single ⟨5312,5376,23424,23488⟩) (.single ⟨5312,5376,23488,23552⟩))))) (.node (.node (.node (.node (.single ⟨9216,9280,27392,27456⟩) (.single ⟨9216,9280,27456,27520⟩)) (.node (.single ⟨9280,9344,27392,27456⟩) (.single ⟨9280,9344,27456,27520⟩))) (.node (.node (.single ⟨9216,9344,27520,27648⟩) (.single ⟨9344,9408,27392,27456⟩)) (.node (.single ⟨9344,9408,27456,27520⟩) (.single ⟨9408,9440,27392,27424⟩)))) (.node (.node (.node (.single ⟨9408,9440,27424,27456⟩) (.single ⟨9440,9472,27392,27424⟩)) (.node (.single ⟨9440,9472,27424,27456⟩) (.single ⟨9408,9472,27456,27520⟩))) (.node (.node (.single ⟨9344,9408,27520,27584⟩) (.single ⟨9344,9408,27584,27648⟩)) (.node (.single ⟨9408,9472,27520,27584⟩) (.single ⟨9408,9472,27584,27648⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,5120,5184⟩) (.single ⟨23296,23360,5184,5248⟩)) (.node (.single ⟨23360,23424,5120,5184⟩) (.single ⟨23360,23424,5184,5248⟩))) (.node (.node (.single ⟨23296,23360,5248,5312⟩) (.single ⟨23296,23328,5312,5344⟩)) (.node (.single ⟨23296,23328,5344,5376⟩) (.single ⟨23328,23360,5312,5344⟩)))) (.node (.node (.node (.single ⟨23328,23360,5344,5376⟩) (.single ⟨23360,23424,5248,5312⟩)) (.node (.single ⟨23360,23424,5312,5376⟩) (.single ⟨23424,23552,5120,5248⟩))) (.node (.node (.single ⟨23424,23488,5248,5312⟩) (.single ⟨23424,23488,5312,5376⟩)) (.node (.single ⟨23488,23552,5248,5312⟩) (.single ⟨23488,23552,5312,5376⟩))))) (.node (.node (.node (.node (.single ⟨27392,27456,9216,9280⟩) (.single ⟨27392,27456,9280,9344⟩)) (.node (.single ⟨27456,27520,9216,9280⟩) (.single ⟨27456,27520,9280,9344⟩))) (.node (.node (.single ⟨27392,27456,9344,9408⟩) (.single ⟨27392,27424,9408,9440⟩)) (.node (.single ⟨27392,27424,9440,9472⟩) (.single ⟨27424,27456,9408,9440⟩)))) (.node (.node (.node (.single ⟨27424,27456,9440,9472⟩) (.single ⟨27456,27520,9344,9408⟩)) (.node (.single ⟨27456,27520,9408,9472⟩) (.single ⟨27520,27648,9216,9344⟩))) (.node (.node (.single ⟨27520,27584,9344,9408⟩) (.single ⟨27520,27584,9408,9472⟩)) (.node (.single ⟨27584,27648,9344,9408⟩) (.single ⟨27584,27648,9408,9472⟩)))))))
def output39 : Fin 64 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData39 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover39 (i : Fin 64) : Fin 64 := ⟨coverData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 64) : Fin 64 := ⟨sourceData39.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 (.cutX 5632 (.cutY 23040 .empty (.cutX 5376 (.cutY 23296 .empty (.cutX 5248 (.cutY 23424 (.cutX 5184 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 5312 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 5344 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 5312 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty)) .empty) .empty))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 (.cutX 9728 (.cutY 27136 .empty (.cutX 9472 (.cutY 27392 .empty (.cutX 9344 (.cutY 27520 (.cutX 9280 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full) (.cutY 27520 (.cutX 9408 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 9440 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 9408 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty)) .empty) .empty))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 .empty (.cutX 23040 .empty (.cutY 5632 (.cutX 23296 .empty (.cutY 5376 (.cutX 23424 (.cutY 5248 (.cutX 23360 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 23360 (.cutY 5312 .full (.cutX 23328 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full (.cutX 23488 (.cutY 5312 .full .full) (.cutY 5312 .full .full)))) .empty)) .empty))) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 .empty (.cutX 27136 .empty (.cutY 9728 (.cutX 27392 .empty (.cutY 9472 (.cutX 27520 (.cutY 9344 (.cutX 27456 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 27456 (.cutY 9408 .full (.cutX 27424 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 27584 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty)) .empty))) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata39 : 0<192153497 ∧ 20<128 ∧ 91<128 ∧ 1<4 ∧
    6411/4160=1 ∧ 6411%4160=2251 ∧ ∀ i, (leaves39 i).Valid 8 := by
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 6566, atom 1150, type 0, source (9,79).
def leavesData40 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves40 : Fin 4 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 79 leaves40 i
def outputData40 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,20224,20352⟩) (.single ⟨2304,2432,20352,20480⟩)) (.node (.single ⟨2432,2560,20224,20352⟩) (.single ⟨2432,2560,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,30208,30336⟩) (.single ⟨12288,12416,30336,30464⟩)) (.node (.single ⟨12416,12544,30208,30336⟩) (.single ⟨12416,12544,30336,30464⟩)))) (.node (.node (.node (.single ⟨20224,20352,2304,2432⟩) (.single ⟨20224,20352,2432,2560⟩)) (.node (.single ⟨20352,20480,2304,2432⟩) (.single ⟨20352,20480,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,12288,12416⟩) (.single ⟨30208,30336,12416,12544⟩)) (.node (.single ⟨30336,30464,12288,12416⟩) (.single ⟨30336,30464,12416,12544⟩)))))
def output40 : Fin 16 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData40 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover40 (i : Fin 16) : Fin 16 := ⟨coverData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 16) : Fin 16 := ⟨sourceData40.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 .empty (.cutX 2304 .empty (.cutY 20224 .empty (.cutX 2432 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 .empty (.cutX 12544 (.cutY 30464 (.cutX 12416 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 (.cutX 20224 .empty (.cutY 2304 .empty (.cutX 20352 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 (.cutX 30464 (.cutY 12544 (.cutX 30336 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty))))) .empty))

theorem metadata40 : 0<48363413 ∧ 9<128 ∧ 79<128 ∧ 0<4 ∧
    1150/4160=0 ∧ 1150%4160=1150 ∧ ∀ i, (leaves40 i).Valid 8 := by
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

-- Frozen phase 6567, atom 4967, type 1, source (6,75).
def leavesData41 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves41 : Fin 4 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 75 leaves41 i
def outputData41 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,19200,19328⟩) (.single ⟨1536,1664,19328,19456⟩)) (.node (.single ⟨1664,1792,19200,19328⟩) (.single ⟨1664,1792,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,30976,31104⟩) (.single ⟨13312,13440,31104,31232⟩)) (.node (.single ⟨13440,13568,30976,31104⟩) (.single ⟨13440,13568,31104,31232⟩)))) (.node (.node (.node (.single ⟨19200,19328,1536,1664⟩) (.single ⟨19200,19328,1664,1792⟩)) (.node (.single ⟨19328,19456,1536,1664⟩) (.single ⟨19328,19456,1664,1792⟩))) (.node (.node (.single ⟨30976,31104,13312,13440⟩) (.single ⟨30976,31104,13440,13568⟩)) (.node (.single ⟨31104,31232,13312,13440⟩) (.single ⟨31104,31232,13440,13568⟩)))))
def output41 : Fin 16 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover41 (i : Fin 16) : Fin 16 := ⟨coverData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 16) : Fin 16 := ⟨sourceData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 .empty (.cutX 1792 (.cutY 19200 .empty (.cutX 1664 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty))) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 (.cutY 31232 (.cutX 13568 (.cutY 30976 .empty (.cutX 13440 (.cutY 31104 .full .full) (.cutY 31104 .full .full))) .empty) .empty) .empty) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 .empty (.cutY 1536 .empty (.cutX 19200 .empty (.cutY 1792 (.cutX 19328 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty))))) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 (.cutX 30976 .empty (.cutY 13568 (.cutX 31104 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty) .empty)) .empty) .empty)))))) .empty))

theorem metadata41 : 0<137362203 ∧ 6<128 ∧ 75<128 ∧ 1<4 ∧
    4967/4160=1 ∧ 4967%4160=807 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 6568, atom 6036, type 1, source (16,84).
def leavesData42 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 13 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 84 leaves42 i
def outputData42 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,21504,21632⟩) (.node (.single ⟨4096,4224,21632,21760⟩) (.single ⟨4224,4288,21504,21568⟩))) (.node (.single ⟨4224,4288,21568,21632⟩) (.node (.single ⟨4288,4320,21504,21536⟩) (.single ⟨4288,4320,21536,21568⟩)))) (.node (.node (.single ⟨4320,4352,21504,21536⟩) (.node (.single ⟨4320,4352,21536,21568⟩) (.single ⟨4288,4352,21568,21632⟩))) (.node (.node (.single ⟨4224,4288,21632,21696⟩) (.single ⟨4224,4288,21696,21760⟩)) (.node (.single ⟨4288,4352,21632,21696⟩) (.single ⟨4288,4352,21696,21760⟩))))) (.node (.node (.node (.single ⟨11008,11072,28416,28480⟩) (.node (.single ⟨11008,11072,28480,28544⟩) (.single ⟨11072,11136,28416,28480⟩))) (.node (.single ⟨11072,11136,28480,28544⟩) (.node (.single ⟨11008,11136,28544,28672⟩) (.single ⟨11136,11200,28416,28480⟩)))) (.node (.node (.single ⟨11136,11200,28480,28544⟩) (.node (.single ⟨11200,11232,28416,28448⟩) (.single ⟨11200,11232,28448,28480⟩))) (.node (.node (.single ⟨11232,11264,28416,28448⟩) (.single ⟨11232,11264,28448,28480⟩)) (.node (.single ⟨11200,11264,28480,28544⟩) (.single ⟨11136,11264,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,4096,4224⟩) (.node (.single ⟨21504,21568,4224,4288⟩) (.single ⟨21504,21536,4288,4320⟩))) (.node (.single ⟨21504,21536,4320,4352⟩) (.node (.single ⟨21536,21568,4288,4320⟩) (.single ⟨21536,21568,4320,4352⟩)))) (.node (.node (.single ⟨21568,21632,4224,4288⟩) (.node (.single ⟨21568,21632,4288,4352⟩) (.single ⟨21632,21760,4096,4224⟩))) (.node (.node (.single ⟨21632,21696,4224,4288⟩) (.single ⟨21632,21696,4288,4352⟩)) (.node (.single ⟨21696,21760,4224,4288⟩) (.single ⟨21696,21760,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,11008,11072⟩) (.node (.single ⟨28416,28480,11072,11136⟩) (.single ⟨28480,28544,11008,11072⟩))) (.node (.single ⟨28480,28544,11072,11136⟩) (.node (.single ⟨28416,28480,11136,11200⟩) (.single ⟨28416,28448,11200,11232⟩)))) (.node (.node (.single ⟨28416,28448,11232,11264⟩) (.node (.single ⟨28448,28480,11200,11232⟩) (.single ⟨28448,28480,11232,11264⟩))) (.node (.node (.single ⟨28480,28544,11136,11200⟩) (.single ⟨28480,28544,11200,11264⟩)) (.node (.single ⟨28544,28672,11008,11136⟩) (.single ⟨28544,28672,11136,11264⟩)))))))
def output42 : Fin 52 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover42 (i : Fin 52) : Fin 52 := ⟨coverData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 52) : Fin 52 := ⟨sourceData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 (.cutY 22016 (.cutX 4352 (.cutY 21760 (.cutX 4224 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 4288 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 4320 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) (.cutX 4288 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 .empty (.cutX 11008 .empty (.cutY 28416 .empty (.cutX 11136 (.cutY 28544 (.cutX 11072 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 11200 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 11232 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))))))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 (.cutX 21760 (.cutY 4352 (.cutX 21632 (.cutY 4224 .full (.cutX 21568 (.cutY 4288 .full (.cutX 21536 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 21696 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 .empty (.cutY 10752 .empty (.cutX 28416 .empty (.cutY 11008 .empty (.cutX 28544 (.cutY 11136 (.cutX 28480 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 28480 (.cutY 11200 .full (.cutX 28448 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty)))) .empty) .empty))) .empty))

theorem metadata42 : 0<125829407 ∧ 16<128 ∧ 84<128 ∧ 1<4 ∧
    6036/4160=1 ∧ 6036%4160=1876 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 6569, atom 5417, type 1, source (10,77).
def leavesData43 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves43 : Fin 4 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 77 leaves43 i
def outputData43 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,19712,19840⟩) (.single ⟨2560,2688,19840,19968⟩)) (.node (.single ⟨2688,2816,19712,19840⟩) (.single ⟨2688,2816,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,29952,30080⟩) (.single ⟨12800,12928,30080,30208⟩)) (.node (.single ⟨12928,13056,29952,30080⟩) (.single ⟨12928,13056,30080,30208⟩)))) (.node (.node (.node (.single ⟨19712,19840,2560,2688⟩) (.single ⟨19712,19840,2688,2816⟩)) (.node (.single ⟨19840,19968,2560,2688⟩) (.single ⟨19840,19968,2688,2816⟩))) (.node (.node (.single ⟨29952,30080,12800,12928⟩) (.single ⟨29952,30080,12928,13056⟩)) (.node (.single ⟨30080,30208,12800,12928⟩) (.single ⟨30080,30208,12928,13056⟩)))))
def output43 : Fin 16 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData43 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover43 (i : Fin 16) : Fin 16 := ⟨coverData43.get i % 16, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 16) : Fin 16 := ⟨sourceData43.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 .empty (.cutY 19968 (.cutX 2816 (.cutY 19712 .empty (.cutX 2688 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty))) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 .empty (.cutY 30208 (.cutX 13056 (.cutY 29952 .empty (.cutX 12928 (.cutY 30080 .full .full) (.cutY 30080 .full .full))) .empty) .empty))) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 (.cutY 2560 .empty (.cutX 19712 .empty (.cutY 2816 (.cutX 19840 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 (.cutY 12800 .empty (.cutX 29952 .empty (.cutY 13056 (.cutX 30080 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty))) .empty) .empty)) .empty) .empty))))) .empty))

theorem metadata43 : 0<94387549 ∧ 10<128 ∧ 77<128 ∧ 1<4 ∧
    5417/4160=1 ∧ 5417%4160=1257 ∧ ∀ i, (leaves43 i).Valid 8 := by
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 6570, atom 6228, type 1, source (18,88).
def leavesData44 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves44 : Fin 19 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 18 88 leaves44 i
def outputData44 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,22528,22592⟩) (.single ⟨4608,4672,22592,22656⟩)) (.node (.single ⟨4672,4736,22528,22592⟩) (.single ⟨4672,4736,22592,22656⟩))) (.node (.node (.single ⟨4608,4736,22656,22784⟩) (.single ⟨4736,4800,22528,22592⟩)) (.node (.single ⟨4736,4800,22592,22656⟩) (.node (.single ⟨4800,4832,22528,22560⟩) (.single ⟨4800,4832,22560,22592⟩))))) (.node (.node (.node (.single ⟨4832,4864,22528,22560⟩) (.single ⟨4832,4864,22560,22592⟩)) (.node (.single ⟨4800,4832,22592,22624⟩) (.node (.single ⟨4800,4832,22624,22656⟩) (.single ⟨4832,4864,22592,22624⟩)))) (.node (.node (.single ⟨4832,4864,22624,22656⟩) (.single ⟨4736,4800,22656,22720⟩)) (.node (.single ⟨4736,4800,22720,22784⟩) (.node (.single ⟨4800,4864,22656,22720⟩) (.single ⟨4800,4864,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨9984,10048,27904,27968⟩) (.single ⟨9984,10048,27968,28032⟩)) (.node (.single ⟨10048,10112,27904,27968⟩) (.single ⟨10048,10112,27968,28032⟩))) (.node (.node (.single ⟨9984,10112,28032,28160⟩) (.single ⟨10112,10144,27904,27936⟩)) (.node (.single ⟨10112,10144,27936,27968⟩) (.node (.single ⟨10144,10176,27904,27936⟩) (.single ⟨10144,10176,27936,27968⟩))))) (.node (.node (.node (.single ⟨10112,10176,27968,28032⟩) (.single ⟨10176,10208,27904,27936⟩)) (.node (.single ⟨10176,10208,27936,27968⟩) (.node (.single ⟨10208,10240,27904,27936⟩) (.single ⟨10208,10240,27936,27968⟩)))) (.node (.node (.single ⟨10176,10240,27968,28032⟩) (.single ⟨10112,10176,28032,28096⟩)) (.node (.single ⟨10112,10176,28096,28160⟩) (.node (.single ⟨10176,10240,28032,28096⟩) (.single ⟨10176,10240,28096,28160⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22528,22592,4608,4672⟩) (.single ⟨22528,22592,4672,4736⟩)) (.node (.single ⟨22592,22656,4608,4672⟩) (.single ⟨22592,22656,4672,4736⟩))) (.node (.node (.single ⟨22528,22592,4736,4800⟩) (.single ⟨22528,22560,4800,4832⟩)) (.node (.single ⟨22528,22560,4832,4864⟩) (.node (.single ⟨22560,22592,4800,4832⟩) (.single ⟨22560,22592,4832,4864⟩))))) (.node (.node (.node (.single ⟨22592,22656,4736,4800⟩) (.single ⟨22592,22624,4800,4832⟩)) (.node (.single ⟨22592,22624,4832,4864⟩) (.node (.single ⟨22624,22656,4800,4832⟩) (.single ⟨22624,22656,4832,4864⟩)))) (.node (.node (.single ⟨22656,22784,4608,4736⟩) (.single ⟨22656,22720,4736,4800⟩)) (.node (.single ⟨22656,22720,4800,4864⟩) (.node (.single ⟨22720,22784,4736,4800⟩) (.single ⟨22720,22784,4800,4864⟩)))))) (.node (.node (.node (.node (.single ⟨27904,27968,9984,10048⟩) (.single ⟨27904,27968,10048,10112⟩)) (.node (.single ⟨27968,28032,9984,10048⟩) (.single ⟨27968,28032,10048,10112⟩))) (.node (.node (.single ⟨27904,27936,10112,10144⟩) (.single ⟨27904,27936,10144,10176⟩)) (.node (.single ⟨27936,27968,10112,10144⟩) (.node (.single ⟨27936,27968,10144,10176⟩) (.single ⟨27904,27936,10176,10208⟩))))) (.node (.node (.node (.single ⟨27904,27936,10208,10240⟩) (.single ⟨27936,27968,10176,10208⟩)) (.node (.single ⟨27936,27968,10208,10240⟩) (.node (.single ⟨27968,28032,10112,10176⟩) (.single ⟨27968,28032,10176,10240⟩)))) (.node (.node (.single ⟨28032,28160,9984,10112⟩) (.single ⟨28032,28096,10112,10176⟩)) (.node (.single ⟨28032,28096,10176,10240⟩) (.node (.single ⟨28096,28160,10112,10176⟩) (.single ⟨28096,28160,10176,10240⟩))))))))
def output44 : Fin 76 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData44 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover44 (i : Fin 76) : Fin 76 := ⟨coverData44.get i % 76, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 76) : Fin 76 := ⟨sourceData44.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 (.cutX 4864 (.cutY 22784 (.cutX 4736 (.cutY 22656 (.cutX 4672 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 4800 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 4832 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) (.cutX 4832 (.cutY 22624 .full .full) (.cutY 22624 .full .full)))) (.cutX 4800 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 .empty (.cutY 28160 (.cutX 9984 .empty (.cutY 27904 .empty (.cutX 10112 (.cutY 28032 (.cutX 10048 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 10176 (.cutY 27968 (.cutX 10144 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full) (.cutY 27968 (.cutX 10208 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 10176 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty))))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 (.cutY 4608 .empty (.cutX 22784 (.cutY 4864 (.cutX 22656 (.cutY 4736 (.cutX 22592 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 22592 (.cutY 4800 .full (.cutX 22560 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full (.cutX 22624 (.cutY 4832 .full .full) (.cutY 4832 .full .full))))) (.cutY 4736 .full (.cutX 22720 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 .empty (.cutX 27904 .empty (.cutY 9984 .empty (.cutX 28032 (.cutY 10112 (.cutX 27968 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 27968 (.cutY 10176 (.cutX 27936 (.cutY 10144 .full .full) (.cutY 10144 .full .full)) (.cutX 27936 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 28096 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))))) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata44 : 0<192153497 ∧ 18<128 ∧ 88<128 ∧ 1<4 ∧
    6228/4160=1 ∧ 6228%4160=2068 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 64,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked44_64 : ∀ i : Fin 12,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 76, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) (forallFinOffset_add (fun i => output44 i = raw44 (source44 i)) 0 64 12 (by decide) sourceChecked44_0
    sourceChecked44_64)

theorem coverChecked44_0 : ∀ i : Fin 64,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked44_64 : ∀ i : Fin 12,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 76, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
  forallFin_of_zero_offset (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (forallFinOffset_add (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) 0 64 12 (by decide) coverChecked44_0
    coverChecked44_64)

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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 6571, atom 1368, type 0, source (11,81).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 81 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,20736,20864⟩) (.node (.single ⟨2816,2944,20864,20992⟩) (.single ⟨2944,3008,20736,20800⟩))) (.node (.node (.single ⟨2944,3008,20800,20864⟩) (.single ⟨3008,3072,20736,20800⟩)) (.node (.single ⟨3008,3072,20800,20864⟩) (.single ⟨2944,3072,20864,20992⟩)))) (.node (.node (.single ⟨11776,11904,29696,29824⟩) (.node (.single ⟨11776,11904,29824,29952⟩) (.single ⟨11904,11968,29696,29760⟩))) (.node (.node (.single ⟨11904,11968,29760,29824⟩) (.single ⟨11968,12032,29696,29760⟩)) (.node (.single ⟨11968,12032,29760,29824⟩) (.single ⟨11904,12032,29824,29952⟩))))) (.node (.node (.node (.single ⟨20736,20864,2816,2944⟩) (.node (.single ⟨20736,20800,2944,3008⟩) (.single ⟨20736,20800,3008,3072⟩))) (.node (.node (.single ⟨20800,20864,2944,3008⟩) (.single ⟨20800,20864,3008,3072⟩)) (.node (.single ⟨20864,20992,2816,2944⟩) (.single ⟨20864,20992,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,11776,11904⟩) (.node (.single ⟨29696,29760,11904,11968⟩) (.single ⟨29696,29760,11968,12032⟩))) (.node (.node (.single ⟨29760,29824,11904,11968⟩) (.single ⟨29760,29824,11968,12032⟩)) (.node (.single ⟨29824,29952,11776,11904⟩) (.single ⟨29824,29952,11904,12032⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 (.cutX 2816 .empty (.cutY 20736 .empty (.cutX 2944 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 3008 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full)))) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 (.cutX 12032 (.cutY 29952 (.cutX 11904 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 11968 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty)))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 .empty (.cutX 20736 .empty (.cutY 2816 .empty (.cutX 20864 (.cutY 2944 .full (.cutX 20800 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))))) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 .empty (.cutX 29952 (.cutY 12032 (.cutX 29824 (.cutY 11904 .full (.cutX 29760 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)) .empty)))) .empty) .empty)))) .empty))

theorem metadata45 : 0<72090291 ∧ 11<128 ∧ 81<128 ∧ 0<4 ∧
    1368/4160=0 ∧ 1368%4160=1368 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 6572, atom 5735, type 1, source (13,80).
def leavesData46 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves46 : Fin 7 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 80 leaves46 i
def outputData46 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,20480,20608⟩) (.node (.single ⟨3328,3456,20608,20736⟩) (.single ⟨3456,3520,20480,20544⟩))) (.node (.node (.single ⟨3456,3520,20544,20608⟩) (.single ⟨3520,3584,20480,20544⟩)) (.node (.single ⟨3520,3584,20544,20608⟩) (.single ⟨3456,3584,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,29184,29312⟩) (.node (.single ⟨12032,12160,29312,29440⟩) (.single ⟨12160,12224,29184,29248⟩))) (.node (.node (.single ⟨12160,12224,29248,29312⟩) (.single ⟨12224,12288,29184,29248⟩)) (.node (.single ⟨12224,12288,29248,29312⟩) (.single ⟨12160,12288,29312,29440⟩))))) (.node (.node (.node (.single ⟨20480,20608,3328,3456⟩) (.node (.single ⟨20480,20544,3456,3520⟩) (.single ⟨20480,20544,3520,3584⟩))) (.node (.node (.single ⟨20544,20608,3456,3520⟩) (.single ⟨20544,20608,3520,3584⟩)) (.node (.single ⟨20608,20736,3328,3456⟩) (.single ⟨20608,20736,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,12032,12160⟩) (.node (.single ⟨29184,29248,12160,12224⟩) (.single ⟨29184,29248,12224,12288⟩))) (.node (.node (.single ⟨29248,29312,12160,12224⟩) (.single ⟨29248,29312,12224,12288⟩)) (.node (.single ⟨29312,29440,12032,12160⟩) (.single ⟨29312,29440,12160,12288⟩))))))
def output46 : Fin 28 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover46 (i : Fin 28) : Fin 28 := ⟨coverData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 28) : Fin 28 := ⟨sourceData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 (.cutY 20992 (.cutX 3328 .empty (.cutY 20736 (.cutX 3456 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 3520 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 .empty (.cutY 29184 .empty (.cutX 12032 .empty (.cutY 29440 (.cutX 12160 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 12224 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 (.cutY 3584 (.cutX 20736 (.cutY 3328 .empty (.cutX 20608 (.cutY 3456 .full (.cutX 20544 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 .empty (.cutY 11776 .empty (.cutX 29440 (.cutY 12032 .empty (.cutX 29312 (.cutY 12160 .full (.cutX 29248 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))) .empty)))) .empty)) .empty) .empty)))) .empty))

theorem metadata46 : 0<139307719 ∧ 13<128 ∧ 80<128 ∧ 1<4 ∧
    5735/4160=1 ∧ 5735%4160=1575 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 6573, atom 5631, type 1, source (12,79).
def leavesData47 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves47 : Fin 4 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 79 leaves47 i
def outputData47 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,20224,20352⟩) (.single ⟨3072,3200,20352,20480⟩)) (.node (.single ⟨3200,3328,20224,20352⟩) (.single ⟨3200,3328,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,29440,29568⟩) (.single ⟨12288,12416,29568,29696⟩)) (.node (.single ⟨12416,12544,29440,29568⟩) (.single ⟨12416,12544,29568,29696⟩)))) (.node (.node (.node (.single ⟨20224,20352,3072,3200⟩) (.single ⟨20224,20352,3200,3328⟩)) (.node (.single ⟨20352,20480,3072,3200⟩) (.single ⟨20352,20480,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,12288,12416⟩) (.single ⟨29440,29568,12416,12544⟩)) (.node (.single ⟨29568,29696,12288,12416⟩) (.single ⟨29568,29696,12416,12544⟩)))))
def output47 : Fin 16 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData47 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover47 (i : Fin 16) : Fin 16 := ⟨coverData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 16) : Fin 16 := ⟨sourceData47.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 .empty (.cutX 3328 (.cutY 20224 .empty (.cutX 3200 (.cutY 20352 .full .full) (.cutY 20352 .full .full))) .empty)) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 .empty (.cutX 12544 (.cutY 29440 .empty (.cutX 12416 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 (.cutX 20224 .empty (.cutY 3328 (.cutX 20352 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty)))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 (.cutX 29440 .empty (.cutY 12544 (.cutX 29568 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata47 : 0<94387549 ∧ 12<128 ∧ 79<128 ∧ 1<4 ∧
    5631/4160=1 ∧ 5631%4160=1471 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 6574, atom 5525, type 1, source (11,78).
def leavesData48 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves48 : Fin 4 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 78 leaves48 i
def outputData48 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,19968,20096⟩) (.single ⟨2816,2944,20096,20224⟩)) (.node (.single ⟨2944,3072,19968,20096⟩) (.single ⟨2944,3072,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,29696,29824⟩) (.single ⟨12544,12672,29824,29952⟩)) (.node (.single ⟨12672,12800,29696,29824⟩) (.single ⟨12672,12800,29824,29952⟩)))) (.node (.node (.node (.single ⟨19968,20096,2816,2944⟩) (.single ⟨19968,20096,2944,3072⟩)) (.node (.single ⟨20096,20224,2816,2944⟩) (.single ⟨20096,20224,2944,3072⟩))) (.node (.node (.single ⟨29696,29824,12544,12672⟩) (.single ⟨29696,29824,12672,12800⟩)) (.node (.single ⟨29824,29952,12544,12672⟩) (.single ⟨29824,29952,12672,12800⟩)))))
def output48 : Fin 16 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData48 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover48 (i : Fin 16) : Fin 16 := ⟨coverData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 16) : Fin 16 := ⟨sourceData48.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 .empty (.cutY 19968 .empty (.cutX 2816 .empty (.cutY 20224 (.cutX 2944 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty))))) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 (.cutX 12544 .empty (.cutY 29952 (.cutX 12672 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 .empty (.cutX 20224 (.cutY 2816 .empty (.cutX 20096 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty))) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 (.cutY 12800 (.cutX 29952 (.cutY 12544 .empty (.cutX 29824 (.cutY 12672 .full .full) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty))))) .empty))

theorem metadata48 : 0<94387549 ∧ 11<128 ∧ 78<128 ∧ 1<4 ∧
    5525/4160=1 ∧ 5525%4160=1365 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 6575, atom 6907, type 1, source (26,95).
def leavesData49 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves49 : Fin 7 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 95 leaves49 i
def outputData49 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,24320,24448⟩) (.node (.single ⟨6656,6784,24448,24576⟩) (.single ⟨6784,6848,24320,24384⟩))) (.node (.node (.single ⟨6784,6848,24384,24448⟩) (.single ⟨6848,6912,24320,24384⟩)) (.node (.single ⟨6848,6912,24384,24448⟩) (.single ⟨6784,6912,24448,24576⟩)))) (.node (.node (.single ⟨8192,8320,25856,25984⟩) (.node (.single ⟨8192,8320,25984,26112⟩) (.single ⟨8320,8384,25856,25920⟩))) (.node (.node (.single ⟨8320,8384,25920,25984⟩) (.single ⟨8384,8448,25856,25920⟩)) (.node (.single ⟨8384,8448,25920,25984⟩) (.single ⟨8320,8448,25984,26112⟩))))) (.node (.node (.node (.single ⟨24320,24448,6656,6784⟩) (.node (.single ⟨24320,24384,6784,6848⟩) (.single ⟨24320,24384,6848,6912⟩))) (.node (.node (.single ⟨24384,24448,6784,6848⟩) (.single ⟨24384,24448,6848,6912⟩)) (.node (.single ⟨24448,24576,6656,6784⟩) (.single ⟨24448,24576,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,8192,8320⟩) (.node (.single ⟨25856,25920,8320,8384⟩) (.single ⟨25856,25920,8384,8448⟩))) (.node (.node (.single ⟨25920,25984,8320,8384⟩) (.single ⟨25920,25984,8384,8448⟩)) (.node (.single ⟨25984,26112,8192,8320⟩) (.single ⟨25984,26112,8320,8448⟩))))))
def output49 : Fin 28 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover49 (i : Fin 28) : Fin 28 := ⟨coverData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 28) : Fin 28 := ⟨sourceData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 .empty (.cutY 24064 .empty (.cutX 6912 (.cutY 24320 .empty (.cutX 6784 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 6848 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))) .empty)))) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 (.cutY 26112 (.cutX 8448 (.cutY 25856 .empty (.cutX 8320 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 8384 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 .empty (.cutY 6656 .empty (.cutX 24320 .empty (.cutY 6912 (.cutX 24448 (.cutY 6784 .full (.cutX 24384 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 (.cutY 8704 (.cutX 25856 .empty (.cutY 8448 (.cutX 25984 (.cutY 8320 .full (.cutX 25920 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata49 : 0<149239428 ∧ 26<128 ∧ 95<128 ∧ 1<4 ∧
    6907/4160=1 ∧ 6907%4160=2747 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 6576, atom 2165, type 0, source (19,94).
def leavesData50 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩))) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩))))) (.node (.node (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,2⟩)))) (.node (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves50 : Fin 25 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 19 94 leaves50 i
def outputData50 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,24064,24128⟩) (.node (.single ⟨4864,4928,24128,24192⟩) (.single ⟨4928,4992,24064,24128⟩))) (.node (.single ⟨4928,4992,24128,24192⟩) (.node (.single ⟨4864,4992,24192,24320⟩) (.single ⟨4992,5024,24064,24096⟩)))) (.node (.node (.single ⟨4992,5024,24096,24128⟩) (.node (.single ⟨5024,5056,24064,24096⟩) (.single ⟨5024,5056,24096,24128⟩))) (.node (.single ⟨4992,5056,24128,24192⟩) (.node (.single ⟨5056,5088,24064,24096⟩) (.single ⟨5056,5088,24096,24128⟩))))) (.node (.node (.node (.single ⟨5088,5104,24064,24080⟩) (.node (.single ⟨5088,5104,24080,24096⟩) (.single ⟨5104,5120,24064,24080⟩))) (.node (.single ⟨5104,5120,24080,24096⟩) (.node (.single ⟨5088,5120,24096,24128⟩) (.single ⟨5056,5088,24128,24160⟩)))) (.node (.node (.single ⟨5056,5088,24160,24192⟩) (.node (.single ⟨5088,5120,24128,24160⟩) (.single ⟨5088,5120,24160,24192⟩))) (.node (.node (.single ⟨4992,5056,24192,24256⟩) (.single ⟨4992,5056,24256,24320⟩)) (.node (.single ⟨5056,5120,24192,24256⟩) (.single ⟨5056,5120,24256,24320⟩)))))) (.node (.node (.node (.node (.single ⟨8448,8512,27648,27712⟩) (.node (.single ⟨8448,8512,27712,27776⟩) (.single ⟨8512,8576,27648,27712⟩))) (.node (.single ⟨8512,8576,27712,27776⟩) (.node (.single ⟨8448,8576,27776,27904⟩) (.single ⟨8576,8608,27648,27680⟩)))) (.node (.node (.single ⟨8576,8608,27680,27712⟩) (.node (.single ⟨8608,8640,27648,27680⟩) (.single ⟨8608,8640,27680,27712⟩))) (.node (.single ⟨8576,8640,27712,27776⟩) (.node (.single ⟨8640,8672,27648,27680⟩) (.single ⟨8640,8672,27680,27712⟩))))) (.node (.node (.node (.single ⟨8672,8688,27648,27664⟩) (.node (.single ⟨8672,8688,27664,27680⟩) (.single ⟨8688,8704,27648,27664⟩))) (.node (.single ⟨8688,8704,27664,27680⟩) (.node (.single ⟨8672,8704,27680,27712⟩) (.single ⟨8640,8672,27712,27744⟩)))) (.node (.node (.single ⟨8640,8672,27744,27776⟩) (.node (.single ⟨8672,8704,27712,27744⟩) (.single ⟨8672,8704,27744,27776⟩))) (.node (.node (.single ⟨8576,8640,27776,27840⟩) (.single ⟨8576,8640,27840,27904⟩)) (.node (.single ⟨8640,8704,27776,27840⟩) (.single ⟨8640,8704,27840,27904⟩))))))) (.node (.node (.node (.node (.node (.single ⟨24064,24128,4864,4928⟩) (.node (.single ⟨24064,24128,4928,4992⟩) (.single ⟨24128,24192,4864,4928⟩))) (.node (.single ⟨24128,24192,4928,4992⟩) (.node (.single ⟨24064,24096,4992,5024⟩) (.single ⟨24064,24096,5024,5056⟩)))) (.node (.node (.single ⟨24096,24128,4992,5024⟩) (.node (.single ⟨24096,24128,5024,5056⟩) (.single ⟨24064,24096,5056,5088⟩))) (.node (.single ⟨24064,24080,5088,5104⟩) (.node (.single ⟨24064,24080,5104,5120⟩) (.single ⟨24080,24096,5088,5104⟩))))) (.node (.node (.node (.single ⟨24080,24096,5104,5120⟩) (.node (.single ⟨24096,24128,5056,5088⟩) (.single ⟨24096,24128,5088,5120⟩))) (.node (.single ⟨24128,24192,4992,5056⟩) (.node (.single ⟨24128,24160,5056,5088⟩) (.single ⟨24128,24160,5088,5120⟩)))) (.node (.node (.single ⟨24160,24192,5056,5088⟩) (.node (.single ⟨24160,24192,5088,5120⟩) (.single ⟨24192,24320,4864,4992⟩))) (.node (.node (.single ⟨24192,24256,4992,5056⟩) (.single ⟨24192,24256,5056,5120⟩)) (.node (.single ⟨24256,24320,4992,5056⟩) (.single ⟨24256,24320,5056,5120⟩)))))) (.node (.node (.node (.node (.single ⟨27648,27712,8448,8512⟩) (.node (.single ⟨27648,27712,8512,8576⟩) (.single ⟨27712,27776,8448,8512⟩))) (.node (.single ⟨27712,27776,8512,8576⟩) (.node (.single ⟨27648,27680,8576,8608⟩) (.single ⟨27648,27680,8608,8640⟩)))) (.node (.node (.single ⟨27680,27712,8576,8608⟩) (.node (.single ⟨27680,27712,8608,8640⟩) (.single ⟨27648,27680,8640,8672⟩))) (.node (.single ⟨27648,27664,8672,8688⟩) (.node (.single ⟨27648,27664,8688,8704⟩) (.single ⟨27664,27680,8672,8688⟩))))) (.node (.node (.node (.single ⟨27664,27680,8688,8704⟩) (.node (.single ⟨27680,27712,8640,8672⟩) (.single ⟨27680,27712,8672,8704⟩))) (.node (.single ⟨27712,27776,8576,8640⟩) (.node (.single ⟨27712,27744,8640,8672⟩) (.single ⟨27712,27744,8672,8704⟩)))) (.node (.node (.single ⟨27744,27776,8640,8672⟩) (.node (.single ⟨27744,27776,8672,8704⟩) (.single ⟨27776,27904,8448,8576⟩))) (.node (.node (.single ⟨27776,27840,8576,8640⟩) (.single ⟨27776,27840,8640,8704⟩)) (.node (.single ⟨27840,27904,8576,8640⟩) (.single ⟨27840,27904,8640,8704⟩))))))))
def output50 : Fin 100 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 70) (.single 95))) (.node (.single 29) (.node (.single 0) (.single 50)))) (.node (.node (.single 99) (.node (.single 49) (.single 1))) (.node (.single 52) (.node (.single 98) (.single 47))))) (.node (.node (.node (.single 2) (.node (.single 51) (.single 97))) (.node (.single 48) (.node (.single 3) (.single 53)))) (.node (.node (.single 96) (.node (.single 46) (.single 9))) (.node (.node (.single 65) (.single 90)) (.node (.single 34) (.single 21)))))) (.node (.node (.node (.node (.single 71) (.node (.single 78) (.single 28))) (.node (.single 22) (.node (.single 73) (.single 77)))) (.node (.node (.single 26) (.node (.single 23) (.single 72))) (.node (.single 76) (.node (.single 27) (.single 24))))) (.node (.node (.node (.single 74) (.node (.single 75) (.single 25))) (.node (.single 10) (.node (.single 58) (.single 89)))) (.node (.node (.single 41) (.node (.single 11) (.single 63))) (.node (.node (.single 88) (.single 36)) (.node (.single 16) (.single 64))))))) (.node (.node (.node (.node (.node (.single 83) (.node (.single 35) (.single 5))) (.node (.single 54) (.node (.single 94) (.single 45)))) (.node (.node (.single 6) (.node (.single 56) (.single 93))) (.node (.single 43) (.node (.single 7) (.single 55))))) (.node (.node (.node (.single 92) (.node (.single 44) (.single 8))) (.node (.single 57) (.node (.single 91) (.single 42)))) (.node (.node (.single 17) (.node (.single 66) (.single 82))) (.node (.node (.single 33) (.single 18)) (.node (.single 68) (.single 81)))))) (.node (.node (.node (.node (.single 31) (.node (.single 19) (.single 67))) (.node (.single 80) (.node (.single 32) (.single 20)))) (.node (.node (.single 69) (.node (.single 79) (.single 30))) (.node (.single 12) (.node (.single 59) (.single 87))))) (.node (.node (.node (.single 40) (.node (.single 13) (.single 61))) (.node (.single 86) (.node (.single 38) (.single 14)))) (.node (.node (.single 60) (.node (.single 85) (.single 39))) (.node (.node (.single 15) (.single 62)) (.node (.single 84) (.single 37))))))))
def sourceData50 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 52)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 20) (.node (.single 40) (.single 44))))) (.node (.node (.node (.single 84) (.node (.single 88) (.single 92))) (.node (.single 96) (.node (.single 48) (.single 68)))) (.node (.node (.single 72) (.node (.single 76) (.single 80))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.node (.single 31) (.single 35))) (.node (.single 27) (.node (.single 3) (.single 83)))) (.node (.node (.single 75) (.node (.single 79) (.single 71))) (.node (.single 23) (.node (.single 51) (.single 47))))) (.node (.node (.node (.single 99) (.node (.single 91) (.single 95))) (.node (.single 87) (.node (.single 43) (.single 67)))) (.node (.node (.single 59) (.node (.single 63) (.single 55))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 53) (.single 61)))) (.node (.node (.single 57) (.node (.single 65) (.single 41))) (.node (.single 85) (.node (.single 93) (.single 89))))) (.node (.node (.node (.single 97) (.node (.single 45) (.single 49))) (.node (.single 21) (.node (.single 69) (.single 77)))) (.node (.node (.single 73) (.node (.single 81) (.single 1))) (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.node (.single 34) (.single 30))) (.node (.single 26) (.node (.single 82) (.single 78)))) (.node (.node (.single 74) (.node (.single 70) (.single 50))) (.node (.single 98) (.node (.single 94) (.single 90))))) (.node (.node (.node (.single 86) (.node (.single 46) (.single 42))) (.node (.single 22) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 54) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover50 (i : Fin 100) : Fin 100 := ⟨coverData50.get i % 100, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 100) : Fin 100 := ⟨sourceData50.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 .empty (.cutY 24320 (.cutX 4992 (.cutY 24192 (.cutX 4928 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 5056 (.cutY 24128 (.cutX 5024 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full) (.cutY 24128 (.cutX 5088 (.cutY 24096 .full .full) (.cutY 24096 (.cutX 5104 (.cutY 24080 .full .full) (.cutY 24080 .full .full)) .full)) (.cutX 5088 (.cutY 24160 .full .full) (.cutY 24160 .full .full)))) (.cutX 5056 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 .empty (.cutY 27904 (.cutX 8576 (.cutY 27776 (.cutX 8512 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full) (.cutY 27776 (.cutX 8640 (.cutY 27712 (.cutX 8608 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full) (.cutY 27712 (.cutX 8672 (.cutY 27680 .full .full) (.cutY 27680 (.cutX 8688 (.cutY 27664 .full .full) (.cutY 27664 .full .full)) .full)) (.cutX 8672 (.cutY 27744 .full .full) (.cutY 27744 .full .full)))) (.cutX 8640 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 (.cutY 4864 .empty (.cutX 24192 (.cutY 4992 (.cutX 24128 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 24128 (.cutY 5056 (.cutX 24096 (.cutY 5024 .full .full) (.cutY 5024 .full .full)) (.cutX 24096 (.cutY 5088 .full (.cutX 24080 (.cutY 5104 .full .full) (.cutY 5104 .full .full))) (.cutY 5088 .full .full))) (.cutY 5056 .full (.cutX 24160 (.cutY 5088 .full .full) (.cutY 5088 .full .full))))) (.cutY 4992 .full (.cutX 24256 (.cutY 5056 .full .full) (.cutY 5056 .full .full))))) .empty))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 (.cutY 8448 .empty (.cutX 27776 (.cutY 8576 (.cutX 27712 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 27712 (.cutY 8640 (.cutX 27680 (.cutY 8608 .full .full) (.cutY 8608 .full .full)) (.cutX 27680 (.cutY 8672 .full (.cutX 27664 (.cutY 8688 .full .full) (.cutY 8688 .full .full))) (.cutY 8672 .full .full))) (.cutY 8640 .full (.cutX 27744 (.cutY 8672 .full .full) (.cutY 8672 .full .full))))) (.cutY 8576 .full (.cutX 27840 (.cutY 8640 .full .full) (.cutY 8640 .full .full))))) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata50 : 0<156282496 ∧ 19<128 ∧ 94<128 ∧ 0<4 ∧
    2165/4160=0 ∧ 2165%4160=2165 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 64,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked50_64 : ∀ i : Fin 36,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 100, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) (forallFinOffset_add (fun i => output50 i = raw50 (source50 i)) 0 64 36 (by decide) sourceChecked50_0
    sourceChecked50_64)

theorem coverChecked50_0 : ∀ i : Fin 64,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked50_64 : ∀ i : Fin 36,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 100, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
  forallFin_of_zero_offset (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (forallFinOffset_add (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) 0 64 36 (by decide) coverChecked50_0
    coverChecked50_64)

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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 6577, atom 1682, type 0, source (14,86).
def leavesData51 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves51 : Fin 10 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 86 leaves51 i
def outputData51 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,22016,22144⟩) (.single ⟨3584,3712,22144,22272⟩)) (.node (.single ⟨3712,3776,22016,22080⟩) (.node (.single ⟨3712,3776,22080,22144⟩) (.single ⟨3776,3840,22016,22080⟩)))) (.node (.node (.single ⟨3776,3840,22080,22144⟩) (.single ⟨3712,3776,22144,22208⟩)) (.node (.single ⟨3712,3776,22208,22272⟩) (.node (.single ⟨3776,3840,22144,22208⟩) (.single ⟨3776,3840,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,28928,28992⟩) (.single ⟨10496,10560,28992,29056⟩)) (.node (.single ⟨10560,10624,28928,28992⟩) (.node (.single ⟨10560,10624,28992,29056⟩) (.single ⟨10496,10624,29056,29184⟩)))) (.node (.node (.single ⟨10624,10688,28928,28992⟩) (.single ⟨10624,10688,28992,29056⟩)) (.node (.single ⟨10688,10752,28928,28992⟩) (.node (.single ⟨10688,10752,28992,29056⟩) (.single ⟨10624,10752,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,3584,3712⟩) (.single ⟨22016,22080,3712,3776⟩)) (.node (.single ⟨22016,22080,3776,3840⟩) (.node (.single ⟨22080,22144,3712,3776⟩) (.single ⟨22080,22144,3776,3840⟩)))) (.node (.node (.single ⟨22144,22272,3584,3712⟩) (.single ⟨22144,22208,3712,3776⟩)) (.node (.single ⟨22144,22208,3776,3840⟩) (.node (.single ⟨22208,22272,3712,3776⟩) (.single ⟨22208,22272,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,10496,10560⟩) (.single ⟨28928,28992,10560,10624⟩)) (.node (.single ⟨28992,29056,10496,10560⟩) (.node (.single ⟨28992,29056,10560,10624⟩) (.single ⟨28928,28992,10624,10688⟩)))) (.node (.node (.single ⟨28928,28992,10688,10752⟩) (.single ⟨28992,29056,10624,10688⟩)) (.node (.single ⟨28992,29056,10688,10752⟩) (.node (.single ⟨29056,29184,10496,10624⟩) (.single ⟨29056,29184,10624,10752⟩)))))))
def output51 : Fin 40 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover51 (i : Fin 40) : Fin 40 := ⟨coverData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 40) : Fin 40 := ⟨sourceData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 .empty (.cutX 3840 (.cutY 22272 (.cutX 3712 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3776 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 3776 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty))))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 (.cutX 10496 .empty (.cutY 28928 .empty (.cutX 10624 (.cutY 29056 (.cutX 10560 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10688 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 .empty (.cutX 22272 (.cutY 3840 (.cutX 22144 (.cutY 3712 .full (.cutX 22080 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 22208 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty) .empty)))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 (.cutX 28928 .empty (.cutY 10496 .empty (.cutX 29056 (.cutY 10624 (.cutX 28992 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 28992 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata51 : 0<72090291 ∧ 14<128 ∧ 86<128 ∧ 0<4 ∧
    1682/4160=0 ∧ 1682%4160=1682 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 6578, atom 6133, type 1, source (17,86).
def leavesData52 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves52 : Fin 13 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 86 leaves52 i
def outputData52 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4480,22016,22144⟩) (.node (.single ⟨4352,4480,22144,22272⟩) (.single ⟨4480,4544,22016,22080⟩))) (.node (.single ⟨4480,4544,22080,22144⟩) (.node (.single ⟨4544,4576,22016,22048⟩) (.single ⟨4544,4576,22048,22080⟩)))) (.node (.node (.single ⟨4576,4608,22016,22048⟩) (.node (.single ⟨4576,4608,22048,22080⟩) (.single ⟨4544,4608,22080,22144⟩))) (.node (.node (.single ⟨4480,4544,22144,22208⟩) (.single ⟨4480,4544,22208,22272⟩)) (.node (.single ⟨4544,4608,22144,22208⟩) (.single ⟨4544,4608,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,28160,28224⟩) (.node (.single ⟨10496,10560,28224,28288⟩) (.single ⟨10560,10624,28160,28224⟩))) (.node (.single ⟨10560,10624,28224,28288⟩) (.node (.single ⟨10496,10624,28288,28416⟩) (.single ⟨10624,10688,28160,28224⟩)))) (.node (.node (.single ⟨10624,10688,28224,28288⟩) (.node (.single ⟨10688,10720,28160,28192⟩) (.single ⟨10688,10720,28192,28224⟩))) (.node (.node (.single ⟨10720,10752,28160,28192⟩) (.single ⟨10720,10752,28192,28224⟩)) (.node (.single ⟨10688,10752,28224,28288⟩) (.single ⟨10624,10752,28288,28416⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,4352,4480⟩) (.node (.single ⟨22016,22080,4480,4544⟩) (.single ⟨22016,22048,4544,4576⟩))) (.node (.single ⟨22016,22048,4576,4608⟩) (.node (.single ⟨22048,22080,4544,4576⟩) (.single ⟨22048,22080,4576,4608⟩)))) (.node (.node (.single ⟨22080,22144,4480,4544⟩) (.node (.single ⟨22080,22144,4544,4608⟩) (.single ⟨22144,22272,4352,4480⟩))) (.node (.node (.single ⟨22144,22208,4480,4544⟩) (.single ⟨22144,22208,4544,4608⟩)) (.node (.single ⟨22208,22272,4480,4544⟩) (.single ⟨22208,22272,4544,4608⟩))))) (.node (.node (.node (.single ⟨28160,28224,10496,10560⟩) (.node (.single ⟨28160,28224,10560,10624⟩) (.single ⟨28224,28288,10496,10560⟩))) (.node (.single ⟨28224,28288,10560,10624⟩) (.node (.single ⟨28160,28224,10624,10688⟩) (.single ⟨28160,28192,10688,10720⟩)))) (.node (.node (.single ⟨28160,28192,10720,10752⟩) (.node (.single ⟨28192,28224,10688,10720⟩) (.single ⟨28192,28224,10720,10752⟩))) (.node (.node (.single ⟨28224,28288,10624,10688⟩) (.single ⟨28224,28288,10688,10752⟩)) (.node (.single ⟨28288,28416,10496,10624⟩) (.single ⟨28288,28416,10624,10752⟩)))))))
def output52 : Fin 52 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData52 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover52 (i : Fin 52) : Fin 52 := ⟨coverData52.get i % 52, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 52) : Fin 52 := ⟨sourceData52.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 (.cutY 22016 .empty (.cutX 4352 .empty (.cutY 22272 (.cutX 4480 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 4544 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 4576 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) (.cutX 4544 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty))) .empty)) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 (.cutY 28160 .empty (.cutX 10496 .empty (.cutY 28416 (.cutX 10624 (.cutY 28288 (.cutX 10560 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 10688 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 10720 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) .full)) .empty))) .empty)) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 .empty (.cutY 4608 (.cutX 22272 (.cutY 4352 .empty (.cutX 22144 (.cutY 4480 .full (.cutX 22080 (.cutY 4544 .full (.cutX 22048 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 22208 (.cutY 4544 .full .full) (.cutY 4544 .full .full))))) .empty) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 .empty (.cutY 10752 (.cutX 28416 (.cutY 10496 .empty (.cutX 28288 (.cutY 10624 (.cutX 28224 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 28224 (.cutY 10688 .full (.cutX 28192 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty)) .empty)))) .empty) .empty))) .empty))

theorem metadata52 : 0<125829407 ∧ 17<128 ∧ 86<128 ∧ 1<4 ∧
    6133/4160=1 ∧ 6133%4160=1973 ∧ ∀ i, (leaves52 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData52).mp
    (by decide +kernel)

theorem sourceChecked52_0 : ∀ i : Fin 52,
    (fun i => output52 i = raw52 (source52 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked52 : ∀ i : Fin 52, (fun i => output52 i = raw52 (source52 i)) i :=
  forallFin_of_zero_offset (fun i => output52 i = raw52 (source52 i)) sourceChecked52_0

theorem coverChecked52_0 : ∀ i : Fin 52,
    (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked52 : ∀ i : Fin 52, (fun i => (output52 (cover52 i)).ContainsBox (raw52 i)) i :=
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 6579, atom 6321, type 1, source (19,90).
def leavesData53 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,2⟩))) (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,4,0⟩))) (.node (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,2⟩)))) (.node (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves53 : Fin 28 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 19 90 leaves53 i
def outputData53 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,23040,23104⟩) (.node (.single ⟨4864,4928,23104,23168⟩) (.single ⟨4928,4992,23040,23104⟩))) (.node (.node (.single ⟨4928,4992,23104,23168⟩) (.single ⟨4864,4928,23168,23232⟩)) (.node (.single ⟨4864,4928,23232,23296⟩) (.single ⟨4928,4992,23168,23232⟩)))) (.node (.node (.single ⟨4928,4992,23232,23296⟩) (.node (.single ⟨4992,5024,23040,23072⟩) (.single ⟨4992,5024,23072,23104⟩))) (.node (.node (.single ⟨5024,5056,23040,23072⟩) (.single ⟨5024,5056,23072,23104⟩)) (.node (.single ⟨4992,5056,23104,23168⟩) (.single ⟨5056,5088,23040,23072⟩))))) (.node (.node (.node (.single ⟨5056,5088,23072,23104⟩) (.node (.single ⟨5088,5104,23040,23056⟩) (.single ⟨5088,5104,23056,23072⟩))) (.node (.node (.single ⟨5104,5120,23040,23056⟩) (.single ⟨5104,5120,23056,23072⟩)) (.node (.single ⟨5088,5120,23072,23104⟩) (.single ⟨5056,5088,23104,23136⟩)))) (.node (.node (.single ⟨5056,5088,23136,23168⟩) (.node (.single ⟨5088,5120,23104,23136⟩) (.single ⟨5088,5120,23136,23168⟩))) (.node (.node (.single ⟨4992,5056,23168,23232⟩) (.single ⟨4992,5056,23232,23296⟩)) (.node (.single ⟨5056,5120,23168,23232⟩) (.single ⟨5056,5120,23232,23296⟩)))))) (.node (.node (.node (.node (.single ⟨9472,9536,27648,27712⟩) (.node (.single ⟨9472,9536,27712,27776⟩) (.single ⟨9536,9600,27648,27712⟩))) (.node (.node (.single ⟨9536,9600,27712,27776⟩) (.single ⟨9472,9536,27776,27840⟩)) (.node (.single ⟨9472,9536,27840,27904⟩) (.single ⟨9536,9600,27776,27840⟩)))) (.node (.node (.single ⟨9536,9600,27840,27904⟩) (.node (.single ⟨9600,9632,27648,27680⟩) (.single ⟨9600,9632,27680,27712⟩))) (.node (.node (.single ⟨9632,9664,27648,27680⟩) (.single ⟨9632,9664,27680,27712⟩)) (.node (.single ⟨9600,9664,27712,27776⟩) (.single ⟨9664,9696,27648,27680⟩))))) (.node (.node (.node (.single ⟨9664,9696,27680,27712⟩) (.node (.single ⟨9696,9712,27648,27664⟩) (.single ⟨9696,9712,27664,27680⟩))) (.node (.node (.single ⟨9712,9728,27648,27664⟩) (.single ⟨9712,9728,27664,27680⟩)) (.node (.single ⟨9696,9728,27680,27712⟩) (.single ⟨9664,9696,27712,27744⟩)))) (.node (.node (.single ⟨9664,9696,27744,27776⟩) (.node (.single ⟨9696,9728,27712,27744⟩) (.single ⟨9696,9728,27744,27776⟩))) (.node (.node (.single ⟨9600,9664,27776,27840⟩) (.single ⟨9600,9664,27840,27904⟩)) (.node (.single ⟨9664,9728,27776,27840⟩) (.single ⟨9664,9728,27840,27904⟩))))))) (.node (.node (.node (.node (.node (.single ⟨23040,23104,4864,4928⟩) (.node (.single ⟨23040,23104,4928,4992⟩) (.single ⟨23104,23168,4864,4928⟩))) (.node (.node (.single ⟨23104,23168,4928,4992⟩) (.single ⟨23040,23072,4992,5024⟩)) (.node (.single ⟨23040,23072,5024,5056⟩) (.single ⟨23072,23104,4992,5024⟩)))) (.node (.node (.single ⟨23072,23104,5024,5056⟩) (.node (.single ⟨23040,23072,5056,5088⟩) (.single ⟨23040,23056,5088,5104⟩))) (.node (.node (.single ⟨23040,23056,5104,5120⟩) (.single ⟨23056,23072,5088,5104⟩)) (.node (.single ⟨23056,23072,5104,5120⟩) (.single ⟨23072,23104,5056,5088⟩))))) (.node (.node (.node (.single ⟨23072,23104,5088,5120⟩) (.node (.single ⟨23104,23168,4992,5056⟩) (.single ⟨23104,23136,5056,5088⟩))) (.node (.node (.single ⟨23104,23136,5088,5120⟩) (.single ⟨23136,23168,5056,5088⟩)) (.node (.single ⟨23136,23168,5088,5120⟩) (.single ⟨23168,23232,4864,4928⟩)))) (.node (.node (.single ⟨23168,23232,4928,4992⟩) (.node (.single ⟨23232,23296,4864,4928⟩) (.single ⟨23232,23296,4928,4992⟩))) (.node (.node (.single ⟨23168,23232,4992,5056⟩) (.single ⟨23168,23232,5056,5120⟩)) (.node (.single ⟨23232,23296,4992,5056⟩) (.single ⟨23232,23296,5056,5120⟩)))))) (.node (.node (.node (.node (.single ⟨27648,27712,9472,9536⟩) (.node (.single ⟨27648,27712,9536,9600⟩) (.single ⟨27712,27776,9472,9536⟩))) (.node (.node (.single ⟨27712,27776,9536,9600⟩) (.single ⟨27648,27680,9600,9632⟩)) (.node (.single ⟨27648,27680,9632,9664⟩) (.single ⟨27680,27712,9600,9632⟩)))) (.node (.node (.single ⟨27680,27712,9632,9664⟩) (.node (.single ⟨27648,27680,9664,9696⟩) (.single ⟨27648,27664,9696,9712⟩))) (.node (.node (.single ⟨27648,27664,9712,9728⟩) (.single ⟨27664,27680,9696,9712⟩)) (.node (.single ⟨27664,27680,9712,9728⟩) (.single ⟨27680,27712,9664,9696⟩))))) (.node (.node (.node (.single ⟨27680,27712,9696,9728⟩) (.node (.single ⟨27712,27776,9600,9664⟩) (.single ⟨27712,27744,9664,9696⟩))) (.node (.node (.single ⟨27712,27744,9696,9728⟩) (.single ⟨27744,27776,9664,9696⟩)) (.node (.single ⟨27744,27776,9696,9728⟩) (.single ⟨27776,27840,9472,9536⟩)))) (.node (.node (.single ⟨27776,27840,9536,9600⟩) (.node (.single ⟨27840,27904,9472,9536⟩) (.single ⟨27840,27904,9536,9600⟩))) (.node (.node (.single ⟨27776,27840,9600,9664⟩) (.single ⟨27776,27840,9664,9728⟩)) (.node (.single ⟨27840,27904,9600,9664⟩) (.single ⟨27840,27904,9664,9728⟩))))))))
def output53 : Fin 112 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 56) (.single 111))) (.node (.node (.single 55) (.single 1)) (.node (.single 58) (.single 110)))) (.node (.node (.single 53) (.node (.single 2) (.single 57))) (.node (.node (.single 109) (.single 54)) (.node (.single 3) (.single 59))))) (.node (.node (.node (.single 108) (.node (.single 52) (.single 12))) (.node (.node (.single 71) (.single 99)) (.node (.single 40) (.single 24)))) (.node (.node (.single 80) (.node (.single 87) (.single 31))) (.node (.node (.single 25) (.single 82)) (.node (.single 86) (.single 29)))))) (.node (.node (.node (.node (.single 26) (.node (.single 81) (.single 85))) (.node (.node (.single 30) (.single 27)) (.node (.single 83) (.single 84)))) (.node (.node (.single 28) (.node (.single 4) (.single 76))) (.node (.node (.single 107) (.single 35)) (.node (.single 5) (.single 78))))) (.node (.node (.node (.single 106) (.node (.single 33) (.single 6))) (.node (.node (.single 77) (.single 105)) (.node (.single 34) (.single 7)))) (.node (.node (.single 79) (.node (.single 104) (.single 32))) (.node (.node (.single 13) (.single 64)) (.node (.single 98) (.single 47))))))) (.node (.node (.node (.node (.node (.single 14) (.node (.single 69) (.single 97))) (.node (.node (.single 42) (.single 19)) (.node (.single 70) (.single 92)))) (.node (.node (.single 41) (.node (.single 8) (.single 60))) (.node (.node (.single 103) (.single 51)) (.node (.single 9) (.single 62))))) (.node (.node (.node (.single 102) (.node (.single 49) (.single 10))) (.node (.node (.single 61) (.single 101)) (.node (.single 50) (.single 11)))) (.node (.node (.single 63) (.node (.single 100) (.single 48))) (.node (.node (.single 20) (.single 72)) (.node (.single 91) (.single 39)))))) (.node (.node (.node (.node (.single 21) (.node (.single 74) (.single 90))) (.node (.node (.single 37) (.single 22)) (.node (.single 73) (.single 89)))) (.node (.node (.single 38) (.node (.single 23) (.single 75))) (.node (.node (.single 88) (.single 36)) (.node (.single 15) (.single 65))))) (.node (.node (.node (.single 96) (.node (.single 46) (.single 16))) (.node (.node (.single 67) (.single 95)) (.node (.single 44) (.single 17)))) (.node (.node (.single 66) (.node (.single 94) (.single 45))) (.node (.node (.single 18) (.single 68)) (.node (.single 93) (.single 43))))))))
def sourceData53 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.node (.single 12) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.single 48) (.node (.single 64) (.single 68))) (.node (.node (.single 72) (.single 76)) (.node (.single 16) (.single 52))))) (.node (.node (.node (.single 56) (.node (.single 96) (.single 100))) (.node (.node (.single 104) (.single 108)) (.node (.single 60) (.single 80)))) (.node (.node (.single 84) (.node (.single 88) (.single 92))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32)))))) (.node (.node (.node (.node (.single 35) (.node (.single 27) (.single 31))) (.node (.node (.single 23) (.single 51)) (.node (.single 43) (.single 47)))) (.node (.node (.single 39) (.node (.single 95) (.single 87))) (.node (.node (.single 91) (.single 83)) (.node (.single 19) (.single 63))))) (.node (.node (.node (.single 59) (.node (.single 111) (.single 103))) (.node (.node (.single 107) (.single 99)) (.node (.single 55) (.single 79)))) (.node (.node (.single 71) (.node (.single 75) (.single 67))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 5))) (.node (.node (.single 13) (.single 65)) (.node (.single 73) (.single 69)))) (.node (.node (.single 77) (.node (.single 53) (.single 97))) (.node (.node (.single 105) (.single 101)) (.node (.single 109) (.single 57))))) (.node (.node (.node (.single 61) (.node (.single 17) (.single 81))) (.node (.node (.single 89) (.single 85)) (.node (.single 93) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33)))))) (.node (.node (.node (.node (.single 34) (.node (.single 30) (.single 26))) (.node (.node (.single 22) (.single 94)) (.node (.single 90) (.single 86)))) (.node (.node (.single 82) (.node (.single 62) (.single 110))) (.node (.node (.single 106) (.single 102)) (.node (.single 98) (.single 58))))) (.node (.node (.node (.single 54) (.node (.single 18) (.single 78))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2))))))))
def cover53 (i : Fin 112) : Fin 112 := ⟨coverData53.get i % 112, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 112) : Fin 112 := ⟨sourceData53.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 .empty (.cutX 4864 .empty (.cutY 23296 (.cutX 4992 (.cutY 23168 (.cutX 4928 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) (.cutX 4928 (.cutY 23232 .full .full) (.cutY 23232 .full .full))) (.cutY 23168 (.cutX 5056 (.cutY 23104 (.cutX 5024 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full) (.cutY 23104 (.cutX 5088 (.cutY 23072 .full .full) (.cutY 23072 (.cutX 5104 (.cutY 23056 .full .full) (.cutY 23056 .full .full)) .full)) (.cutX 5088 (.cutY 23136 .full .full) (.cutY 23136 .full .full)))) (.cutX 5056 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty)))) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 (.cutX 9472 .empty (.cutY 27904 (.cutX 9600 (.cutY 27776 (.cutX 9536 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 9536 (.cutY 27840 .full .full) (.cutY 27840 .full .full))) (.cutY 27776 (.cutX 9664 (.cutY 27712 (.cutX 9632 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full) (.cutY 27712 (.cutX 9696 (.cutY 27680 .full .full) (.cutY 27680 (.cutX 9712 (.cutY 27664 .full .full) (.cutY 27664 .full .full)) .full)) (.cutX 9696 (.cutY 27744 .full .full) (.cutY 27744 .full .full)))) (.cutX 9664 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 .empty (.cutX 23296 (.cutY 4864 .empty (.cutX 23168 (.cutY 4992 (.cutX 23104 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 23104 (.cutY 5056 (.cutX 23072 (.cutY 5024 .full .full) (.cutY 5024 .full .full)) (.cutX 23072 (.cutY 5088 .full (.cutX 23056 (.cutY 5104 .full .full) (.cutY 5104 .full .full))) (.cutY 5088 .full .full))) (.cutY 5056 .full (.cutX 23136 (.cutY 5088 .full .full) (.cutY 5088 .full .full))))) (.cutY 4992 (.cutX 23232 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 23232 (.cutY 5056 .full .full) (.cutY 5056 .full .full))))) .empty))) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 (.cutX 27904 (.cutY 9472 .empty (.cutX 27776 (.cutY 9600 (.cutX 27712 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 27712 (.cutY 9664 (.cutX 27680 (.cutY 9632 .full .full) (.cutY 9632 .full .full)) (.cutX 27680 (.cutY 9696 .full (.cutX 27664 (.cutY 9712 .full .full) (.cutY 9712 .full .full))) (.cutY 9696 .full .full))) (.cutY 9664 .full (.cutX 27744 (.cutY 9696 .full .full) (.cutY 9696 .full .full))))) (.cutY 9600 (.cutX 27840 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 27840 (.cutY 9664 .full .full) (.cutY 9664 .full .full))))) .empty) .empty) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata53 : 0<192153497 ∧ 19<128 ∧ 90<128 ∧ 1<4 ∧
    6321/4160=1 ∧ 6321%4160=2161 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 64,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked53_64 : ∀ i : Fin 48,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 112, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) (forallFinOffset_add (fun i => output53 i = raw53 (source53 i)) 0 64 48 (by decide) sourceChecked53_0
    sourceChecked53_64)

theorem coverChecked53_0 : ∀ i : Fin 64,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked53_64 : ∀ i : Fin 48,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 112, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
  forallFin_of_zero_offset (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (forallFinOffset_add (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) 0 64 48 (by decide) coverChecked53_0
    coverChecked53_64)

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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 6580, atom 6750, type 1, source (24,94).
def leavesData54 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves54 : Fin 10 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 94 leaves54 i
def outputData54 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,24064,24128⟩) (.single ⟨6144,6208,24128,24192⟩)) (.node (.single ⟨6208,6272,24064,24128⟩) (.node (.single ⟨6208,6272,24128,24192⟩) (.single ⟨6144,6272,24192,24320⟩)))) (.node (.node (.single ⟨6272,6336,24064,24128⟩) (.single ⟨6272,6336,24128,24192⟩)) (.node (.single ⟨6336,6400,24064,24128⟩) (.node (.single ⟨6336,6400,24128,24192⟩) (.single ⟨6272,6400,24192,24320⟩))))) (.node (.node (.node (.single ⟨8448,8576,26368,26496⟩) (.single ⟨8448,8576,26496,26624⟩)) (.node (.single ⟨8576,8640,26368,26432⟩) (.node (.single ⟨8576,8640,26432,26496⟩) (.single ⟨8640,8704,26368,26432⟩)))) (.node (.node (.single ⟨8640,8704,26432,26496⟩) (.single ⟨8576,8640,26496,26560⟩)) (.node (.single ⟨8576,8640,26560,26624⟩) (.node (.single ⟨8640,8704,26496,26560⟩) (.single ⟨8640,8704,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,6144,6208⟩) (.single ⟨24064,24128,6208,6272⟩)) (.node (.single ⟨24128,24192,6144,6208⟩) (.node (.single ⟨24128,24192,6208,6272⟩) (.single ⟨24064,24128,6272,6336⟩)))) (.node (.node (.single ⟨24064,24128,6336,6400⟩) (.single ⟨24128,24192,6272,6336⟩)) (.node (.single ⟨24128,24192,6336,6400⟩) (.node (.single ⟨24192,24320,6144,6272⟩) (.single ⟨24192,24320,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,8448,8576⟩) (.single ⟨26368,26432,8576,8640⟩)) (.node (.single ⟨26368,26432,8640,8704⟩) (.node (.single ⟨26432,26496,8576,8640⟩) (.single ⟨26432,26496,8640,8704⟩)))) (.node (.node (.single ⟨26496,26624,8448,8576⟩) (.single ⟨26496,26560,8576,8640⟩)) (.node (.single ⟨26496,26560,8640,8704⟩) (.node (.single ⟨26560,26624,8576,8640⟩) (.single ⟨26560,26624,8640,8704⟩)))))))
def output54 : Fin 40 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData54 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover54 (i : Fin 40) : Fin 40 := ⟨coverData54.get i % 40, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 40) : Fin 40 := ⟨sourceData54.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 (.cutY 24064 .empty (.cutX 6400 (.cutY 24320 (.cutX 6272 (.cutY 24192 (.cutX 6208 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 6336 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)) .empty)) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 (.cutY 26112 .empty (.cutX 8448 .empty (.cutY 26368 .empty (.cutX 8576 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 8640 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 8640 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))) .empty)) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 .empty (.cutY 6656 (.cutX 24320 (.cutY 6400 (.cutX 24192 (.cutY 6272 (.cutX 24128 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 24128 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 .empty (.cutY 8704 (.cutX 26368 .empty (.cutY 8448 .empty (.cutX 26496 (.cutY 8576 .full (.cutX 26432 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 26560 (.cutY 8640 .full .full) (.cutY 8640 .full .full)))))) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata54 : 0<149239428 ∧ 24<128 ∧ 94<128 ∧ 1<4 ∧
    6750/4160=1 ∧ 6750%4160=2590 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 40,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 40, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 40,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 40, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 6581, atom 6585, type 1, source (22,93).
def leavesData55 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves55 : Fin 16 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 22 93 leaves55 i
def outputData55 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5632,5696,23808,23872⟩) (.single ⟨5632,5696,23872,23936⟩)) (.node (.single ⟨5696,5760,23808,23872⟩) (.single ⟨5696,5760,23872,23936⟩))) (.node (.node (.single ⟨5632,5760,23936,24064⟩) (.single ⟨5760,5824,23808,23872⟩)) (.node (.single ⟨5760,5824,23872,23936⟩) (.single ⟨5824,5856,23808,23840⟩)))) (.node (.node (.node (.single ⟨5824,5856,23840,23872⟩) (.single ⟨5856,5888,23808,23840⟩)) (.node (.single ⟨5856,5888,23840,23872⟩) (.single ⟨5824,5888,23872,23936⟩))) (.node (.node (.single ⟨5760,5824,23936,24000⟩) (.single ⟨5760,5824,24000,24064⟩)) (.node (.single ⟨5824,5888,23936,24000⟩) (.single ⟨5824,5888,24000,24064⟩))))) (.node (.node (.node (.node (.single ⟨8704,8768,26880,26944⟩) (.single ⟨8704,8768,26944,27008⟩)) (.node (.single ⟨8768,8832,26880,26944⟩) (.single ⟨8768,8832,26944,27008⟩))) (.node (.node (.single ⟨8704,8832,27008,27136⟩) (.single ⟨8832,8896,26880,26944⟩)) (.node (.single ⟨8832,8896,26944,27008⟩) (.single ⟨8896,8928,26880,26912⟩)))) (.node (.node (.node (.single ⟨8896,8928,26912,26944⟩) (.single ⟨8928,8960,26880,26912⟩)) (.node (.single ⟨8928,8960,26912,26944⟩) (.single ⟨8896,8960,26944,27008⟩))) (.node (.node (.single ⟨8832,8896,27008,27072⟩) (.single ⟨8832,8896,27072,27136⟩)) (.node (.single ⟨8896,8960,27008,27072⟩) (.single ⟨8896,8960,27072,27136⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23808,23872,5632,5696⟩) (.single ⟨23808,23872,5696,5760⟩)) (.node (.single ⟨23872,23936,5632,5696⟩) (.single ⟨23872,23936,5696,5760⟩))) (.node (.node (.single ⟨23808,23872,5760,5824⟩) (.single ⟨23808,23840,5824,5856⟩)) (.node (.single ⟨23808,23840,5856,5888⟩) (.single ⟨23840,23872,5824,5856⟩)))) (.node (.node (.node (.single ⟨23840,23872,5856,5888⟩) (.single ⟨23872,23936,5760,5824⟩)) (.node (.single ⟨23872,23936,5824,5888⟩) (.single ⟨23936,24064,5632,5760⟩))) (.node (.node (.single ⟨23936,24000,5760,5824⟩) (.single ⟨23936,24000,5824,5888⟩)) (.node (.single ⟨24000,24064,5760,5824⟩) (.single ⟨24000,24064,5824,5888⟩))))) (.node (.node (.node (.node (.single ⟨26880,26944,8704,8768⟩) (.single ⟨26880,26944,8768,8832⟩)) (.node (.single ⟨26944,27008,8704,8768⟩) (.single ⟨26944,27008,8768,8832⟩))) (.node (.node (.single ⟨26880,26944,8832,8896⟩) (.single ⟨26880,26912,8896,8928⟩)) (.node (.single ⟨26880,26912,8928,8960⟩) (.single ⟨26912,26944,8896,8928⟩)))) (.node (.node (.node (.single ⟨26912,26944,8928,8960⟩) (.single ⟨26944,27008,8832,8896⟩)) (.node (.single ⟨26944,27008,8896,8960⟩) (.single ⟨27008,27136,8704,8832⟩))) (.node (.node (.single ⟨27008,27072,8832,8896⟩) (.single ⟨27008,27072,8896,8960⟩)) (.node (.single ⟨27072,27136,8832,8896⟩) (.single ⟨27072,27136,8896,8960⟩)))))))
def output55 : Fin 64 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData55 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover55 (i : Fin 64) : Fin 64 := ⟨coverData55.get i % 64, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 64) : Fin 64 := ⟨sourceData55.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 .empty (.cutY 24064 (.cutX 5888 (.cutY 23808 .empty (.cutX 5760 (.cutY 23936 (.cutX 5696 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 5824 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 5856 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 5824 (.cutY 24000 .full .full) (.cutY 24000 .full .full))))) .empty) .empty))))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 (.cutX 8960 (.cutY 26880 .empty (.cutX 8832 (.cutY 27008 (.cutX 8768 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full) (.cutY 27008 (.cutX 8896 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 8928 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 8896 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 .empty (.cutX 23808 .empty (.cutY 5888 (.cutX 23936 (.cutY 5760 (.cutX 23872 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 23872 (.cutY 5824 .full (.cutX 23840 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full (.cutX 24000 (.cutY 5824 .full .full) (.cutY 5824 .full .full)))) .empty))) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 (.cutY 8704 .empty (.cutX 26880 .empty (.cutY 8960 (.cutX 27008 (.cutY 8832 (.cutX 26944 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 26944 (.cutY 8896 .full (.cutX 26912 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 27072 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata55 : 0<192153497 ∧ 22<128 ∧ 93<128 ∧ 1<4 ∧
    6585/4160=1 ∧ 6585%4160=2425 ∧ ∀ i, (leaves55 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData55).mp
    (by decide +kernel)

theorem sourceChecked55_0 : ∀ i : Fin 64,
    (fun i => output55 i = raw55 (source55 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked55 : ∀ i : Fin 64, (fun i => output55 i = raw55 (source55 i)) i :=
  forallFin_of_zero_offset (fun i => output55 i = raw55 (source55 i)) sourceChecked55_0

theorem coverChecked55_0 : ∀ i : Fin 64,
    (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked55 : ∀ i : Fin 64, (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) i :=
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 6582, atom 1883, type 0, source (16,91).
def leavesData56 : FiniteInputTree DyadicLeaf 25 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩))) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩))))) (.node (.node (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,2⟩)))) (.node (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves56 : Fin 25 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 100) : GridBox := phaseImageBoxes 32768 8 16 91 leaves56 i
def outputData56 : FiniteInputTree GridBox 100 := (.node (.node (.node (.node (.node (.node (.single ⟨4096,4160,23296,23360⟩) (.node (.single ⟨4096,4160,23360,23424⟩) (.single ⟨4160,4224,23296,23360⟩))) (.node (.single ⟨4160,4224,23360,23424⟩) (.node (.single ⟨4096,4224,23424,23552⟩) (.single ⟨4224,4256,23296,23328⟩)))) (.node (.node (.single ⟨4224,4256,23328,23360⟩) (.node (.single ⟨4256,4288,23296,23328⟩) (.single ⟨4256,4288,23328,23360⟩))) (.node (.single ⟨4224,4288,23360,23424⟩) (.node (.single ⟨4288,4320,23296,23328⟩) (.single ⟨4288,4320,23328,23360⟩))))) (.node (.node (.node (.single ⟨4320,4336,23296,23312⟩) (.node (.single ⟨4320,4336,23312,23328⟩) (.single ⟨4336,4352,23296,23312⟩))) (.node (.single ⟨4336,4352,23312,23328⟩) (.node (.single ⟨4320,4352,23328,23360⟩) (.single ⟨4288,4320,23360,23392⟩)))) (.node (.node (.single ⟨4288,4320,23392,23424⟩) (.node (.single ⟨4320,4352,23360,23392⟩) (.single ⟨4320,4352,23392,23424⟩))) (.node (.node (.single ⟨4224,4288,23424,23488⟩) (.single ⟨4224,4288,23488,23552⟩)) (.node (.single ⟨4288,4352,23424,23488⟩) (.single ⟨4288,4352,23488,23552⟩)))))) (.node (.node (.node (.node (.single ⟨9216,9280,28416,28480⟩) (.node (.single ⟨9216,9280,28480,28544⟩) (.single ⟨9280,9344,28416,28480⟩))) (.node (.single ⟨9280,9344,28480,28544⟩) (.node (.single ⟨9216,9344,28544,28672⟩) (.single ⟨9344,9376,28416,28448⟩)))) (.node (.node (.single ⟨9344,9376,28448,28480⟩) (.node (.single ⟨9376,9408,28416,28448⟩) (.single ⟨9376,9408,28448,28480⟩))) (.node (.single ⟨9344,9408,28480,28544⟩) (.node (.single ⟨9408,9440,28416,28448⟩) (.single ⟨9408,9440,28448,28480⟩))))) (.node (.node (.node (.single ⟨9440,9456,28416,28432⟩) (.node (.single ⟨9440,9456,28432,28448⟩) (.single ⟨9456,9472,28416,28432⟩))) (.node (.single ⟨9456,9472,28432,28448⟩) (.node (.single ⟨9440,9472,28448,28480⟩) (.single ⟨9408,9440,28480,28512⟩)))) (.node (.node (.single ⟨9408,9440,28512,28544⟩) (.node (.single ⟨9440,9472,28480,28512⟩) (.single ⟨9440,9472,28512,28544⟩))) (.node (.node (.single ⟨9344,9408,28544,28608⟩) (.single ⟨9344,9408,28608,28672⟩)) (.node (.single ⟨9408,9472,28544,28608⟩) (.single ⟨9408,9472,28608,28672⟩))))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,4096,4160⟩) (.node (.single ⟨23296,23360,4160,4224⟩) (.single ⟨23360,23424,4096,4160⟩))) (.node (.single ⟨23360,23424,4160,4224⟩) (.node (.single ⟨23296,23328,4224,4256⟩) (.single ⟨23296,23328,4256,4288⟩)))) (.node (.node (.single ⟨23328,23360,4224,4256⟩) (.node (.single ⟨23328,23360,4256,4288⟩) (.single ⟨23296,23328,4288,4320⟩))) (.node (.single ⟨23296,23312,4320,4336⟩) (.node (.single ⟨23296,23312,4336,4352⟩) (.single ⟨23312,23328,4320,4336⟩))))) (.node (.node (.node (.single ⟨23312,23328,4336,4352⟩) (.node (.single ⟨23328,23360,4288,4320⟩) (.single ⟨23328,23360,4320,4352⟩))) (.node (.single ⟨23360,23424,4224,4288⟩) (.node (.single ⟨23360,23392,4288,4320⟩) (.single ⟨23360,23392,4320,4352⟩)))) (.node (.node (.single ⟨23392,23424,4288,4320⟩) (.node (.single ⟨23392,23424,4320,4352⟩) (.single ⟨23424,23552,4096,4224⟩))) (.node (.node (.single ⟨23424,23488,4224,4288⟩) (.single ⟨23424,23488,4288,4352⟩)) (.node (.single ⟨23488,23552,4224,4288⟩) (.single ⟨23488,23552,4288,4352⟩)))))) (.node (.node (.node (.node (.single ⟨28416,28480,9216,9280⟩) (.node (.single ⟨28416,28480,9280,9344⟩) (.single ⟨28480,28544,9216,9280⟩))) (.node (.single ⟨28480,28544,9280,9344⟩) (.node (.single ⟨28416,28448,9344,9376⟩) (.single ⟨28416,28448,9376,9408⟩)))) (.node (.node (.single ⟨28448,28480,9344,9376⟩) (.node (.single ⟨28448,28480,9376,9408⟩) (.single ⟨28416,28448,9408,9440⟩))) (.node (.single ⟨28416,28432,9440,9456⟩) (.node (.single ⟨28416,28432,9456,9472⟩) (.single ⟨28432,28448,9440,9456⟩))))) (.node (.node (.node (.single ⟨28432,28448,9456,9472⟩) (.node (.single ⟨28448,28480,9408,9440⟩) (.single ⟨28448,28480,9440,9472⟩))) (.node (.single ⟨28480,28544,9344,9408⟩) (.node (.single ⟨28480,28512,9408,9440⟩) (.single ⟨28480,28512,9440,9472⟩)))) (.node (.node (.single ⟨28512,28544,9408,9440⟩) (.node (.single ⟨28512,28544,9440,9472⟩) (.single ⟨28544,28672,9216,9344⟩))) (.node (.node (.single ⟨28544,28608,9344,9408⟩) (.single ⟨28544,28608,9408,9472⟩)) (.node (.single ⟨28608,28672,9344,9408⟩) (.single ⟨28608,28672,9408,9472⟩))))))))
def output56 : Fin 100 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 70) (.single 95))) (.node (.single 29) (.node (.single 0) (.single 50)))) (.node (.node (.single 99) (.node (.single 49) (.single 1))) (.node (.single 52) (.node (.single 98) (.single 47))))) (.node (.node (.node (.single 2) (.node (.single 51) (.single 97))) (.node (.single 48) (.node (.single 3) (.single 53)))) (.node (.node (.single 96) (.node (.single 46) (.single 9))) (.node (.node (.single 65) (.single 90)) (.node (.single 34) (.single 21)))))) (.node (.node (.node (.node (.single 71) (.node (.single 78) (.single 28))) (.node (.single 22) (.node (.single 73) (.single 77)))) (.node (.node (.single 26) (.node (.single 23) (.single 72))) (.node (.single 76) (.node (.single 27) (.single 24))))) (.node (.node (.node (.single 74) (.node (.single 75) (.single 25))) (.node (.single 10) (.node (.single 58) (.single 89)))) (.node (.node (.single 41) (.node (.single 11) (.single 63))) (.node (.node (.single 88) (.single 36)) (.node (.single 16) (.single 64))))))) (.node (.node (.node (.node (.node (.single 83) (.node (.single 35) (.single 5))) (.node (.single 54) (.node (.single 94) (.single 45)))) (.node (.node (.single 6) (.node (.single 56) (.single 93))) (.node (.single 43) (.node (.single 7) (.single 55))))) (.node (.node (.node (.single 92) (.node (.single 44) (.single 8))) (.node (.single 57) (.node (.single 91) (.single 42)))) (.node (.node (.single 17) (.node (.single 66) (.single 82))) (.node (.node (.single 33) (.single 18)) (.node (.single 68) (.single 81)))))) (.node (.node (.node (.node (.single 31) (.node (.single 19) (.single 67))) (.node (.single 80) (.node (.single 32) (.single 20)))) (.node (.node (.single 69) (.node (.single 79) (.single 30))) (.node (.single 12) (.node (.single 59) (.single 87))))) (.node (.node (.node (.single 40) (.node (.single 13) (.single 61))) (.node (.single 86) (.node (.single 38) (.single 14)))) (.node (.node (.single 60) (.node (.single 85) (.single 39))) (.node (.node (.single 15) (.single 62)) (.node (.single 84) (.single 37))))))))
def sourceData56 : FiniteInputTree ℕ 100 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 52)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 20) (.node (.single 40) (.single 44))))) (.node (.node (.node (.single 84) (.node (.single 88) (.single 92))) (.node (.single 96) (.node (.single 48) (.single 68)))) (.node (.node (.single 72) (.node (.single 76) (.single 80))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.node (.single 31) (.single 35))) (.node (.single 27) (.node (.single 3) (.single 83)))) (.node (.node (.single 75) (.node (.single 79) (.single 71))) (.node (.single 23) (.node (.single 51) (.single 47))))) (.node (.node (.node (.single 99) (.node (.single 91) (.single 95))) (.node (.single 87) (.node (.single 43) (.single 67)))) (.node (.node (.single 59) (.node (.single 63) (.single 55))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 53) (.single 61)))) (.node (.node (.single 57) (.node (.single 65) (.single 41))) (.node (.single 85) (.node (.single 93) (.single 89))))) (.node (.node (.node (.single 97) (.node (.single 45) (.single 49))) (.node (.single 21) (.node (.single 69) (.single 77)))) (.node (.node (.single 73) (.node (.single 81) (.single 1))) (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.node (.single 34) (.single 30))) (.node (.single 26) (.node (.single 82) (.single 78)))) (.node (.node (.single 74) (.node (.single 70) (.single 50))) (.node (.single 98) (.node (.single 94) (.single 90))))) (.node (.node (.node (.single 86) (.node (.single 46) (.single 42))) (.node (.single 22) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 54) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))))
def cover56 (i : Fin 100) : Fin 100 := ⟨coverData56.get i % 100, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 100) : Fin 100 := ⟨sourceData56.get i % 100, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 (.cutY 23040 .empty (.cutX 4352 (.cutY 23296 .empty (.cutX 4224 (.cutY 23424 (.cutX 4160 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 4288 (.cutY 23360 (.cutX 4256 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full) (.cutY 23360 (.cutX 4320 (.cutY 23328 .full .full) (.cutY 23328 (.cutX 4336 (.cutY 23312 .full .full) (.cutY 23312 .full .full)) .full)) (.cutX 4320 (.cutY 23392 .full .full) (.cutY 23392 .full .full)))) (.cutX 4288 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty)) .empty) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 .empty (.cutX 9472 (.cutY 28416 .empty (.cutX 9344 (.cutY 28544 (.cutX 9280 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 9408 (.cutY 28480 (.cutX 9376 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full) (.cutY 28480 (.cutX 9440 (.cutY 28448 .full .full) (.cutY 28448 (.cutX 9456 (.cutY 28432 .full .full) (.cutY 28432 .full .full)) .full)) (.cutX 9440 (.cutY 28512 .full .full) (.cutY 28512 .full .full)))) (.cutX 9408 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))) .empty)) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 (.cutX 23296 .empty (.cutY 4352 (.cutX 23424 (.cutY 4224 (.cutX 23360 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 23360 (.cutY 4288 (.cutX 23328 (.cutY 4256 .full .full) (.cutY 4256 .full .full)) (.cutX 23328 (.cutY 4320 .full (.cutX 23312 (.cutY 4336 .full .full) (.cutY 4336 .full .full))) (.cutY 4320 .full .full))) (.cutY 4288 .full (.cutX 23392 (.cutY 4320 .full .full) (.cutY 4320 .full .full))))) (.cutY 4224 .full (.cutX 23488 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 .empty (.cutY 9728 (.cutX 28416 .empty (.cutY 9472 (.cutX 28544 (.cutY 9344 (.cutX 28480 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 28480 (.cutY 9408 (.cutX 28448 (.cutY 9376 .full .full) (.cutY 9376 .full .full)) (.cutX 28448 (.cutY 9440 .full (.cutX 28432 (.cutY 9456 .full .full) (.cutY 9456 .full .full))) (.cutY 9440 .full .full))) (.cutY 9408 .full (.cutX 28512 (.cutY 9440 .full .full) (.cutY 9440 .full .full))))) (.cutY 9344 .full (.cutX 28608 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty)) .empty)))) .empty)) .empty) .empty))) .empty))

theorem metadata56 : 0<156282496 ∧ 16<128 ∧ 91<128 ∧ 0<4 ∧
    1883/4160=0 ∧ 1883%4160=1883 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 64,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked56_64 : ∀ i : Fin 36,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 100, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) (forallFinOffset_add (fun i => output56 i = raw56 (source56 i)) 0 64 36 (by decide) sourceChecked56_0
    sourceChecked56_64)

theorem coverChecked56_0 : ∀ i : Fin 64,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 100 0 64 (by decide) i) := by decide +kernel

theorem coverChecked56_64 : ∀ i : Fin 36,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 100 64 36 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 100, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
  forallFin_of_zero_offset (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (forallFinOffset_add (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) 0 64 36 (by decide) coverChecked56_0
    coverChecked56_64)

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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 6583, atom 6229, type 1, source (18,89).
def leavesData57 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves57 : Fin 19 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 18 89 leaves57 i
def outputData57 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,22784,22848⟩) (.single ⟨4608,4672,22848,22912⟩)) (.node (.single ⟨4672,4736,22784,22848⟩) (.single ⟨4672,4736,22848,22912⟩))) (.node (.node (.single ⟨4608,4736,22912,23040⟩) (.single ⟨4736,4800,22784,22848⟩)) (.node (.single ⟨4736,4800,22848,22912⟩) (.node (.single ⟨4800,4832,22784,22816⟩) (.single ⟨4800,4832,22816,22848⟩))))) (.node (.node (.node (.single ⟨4832,4864,22784,22816⟩) (.single ⟨4832,4864,22816,22848⟩)) (.node (.single ⟨4800,4832,22848,22880⟩) (.node (.single ⟨4800,4832,22880,22912⟩) (.single ⟨4832,4864,22848,22880⟩)))) (.node (.node (.single ⟨4832,4864,22880,22912⟩) (.single ⟨4736,4800,22912,22976⟩)) (.node (.single ⟨4736,4800,22976,23040⟩) (.node (.single ⟨4800,4864,22912,22976⟩) (.single ⟨4800,4864,22976,23040⟩)))))) (.node (.node (.node (.node (.single ⟨9728,9792,27904,27968⟩) (.single ⟨9728,9792,27968,28032⟩)) (.node (.single ⟨9792,9856,27904,27968⟩) (.single ⟨9792,9856,27968,28032⟩))) (.node (.node (.single ⟨9728,9856,28032,28160⟩) (.single ⟨9856,9888,27904,27936⟩)) (.node (.single ⟨9856,9888,27936,27968⟩) (.node (.single ⟨9888,9920,27904,27936⟩) (.single ⟨9888,9920,27936,27968⟩))))) (.node (.node (.node (.single ⟨9856,9920,27968,28032⟩) (.single ⟨9920,9952,27904,27936⟩)) (.node (.single ⟨9920,9952,27936,27968⟩) (.node (.single ⟨9952,9984,27904,27936⟩) (.single ⟨9952,9984,27936,27968⟩)))) (.node (.node (.single ⟨9920,9984,27968,28032⟩) (.single ⟨9856,9920,28032,28096⟩)) (.node (.single ⟨9856,9920,28096,28160⟩) (.node (.single ⟨9920,9984,28032,28096⟩) (.single ⟨9920,9984,28096,28160⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22784,22848,4608,4672⟩) (.single ⟨22784,22848,4672,4736⟩)) (.node (.single ⟨22848,22912,4608,4672⟩) (.single ⟨22848,22912,4672,4736⟩))) (.node (.node (.single ⟨22784,22848,4736,4800⟩) (.single ⟨22784,22816,4800,4832⟩)) (.node (.single ⟨22784,22816,4832,4864⟩) (.node (.single ⟨22816,22848,4800,4832⟩) (.single ⟨22816,22848,4832,4864⟩))))) (.node (.node (.node (.single ⟨22848,22912,4736,4800⟩) (.single ⟨22848,22880,4800,4832⟩)) (.node (.single ⟨22848,22880,4832,4864⟩) (.node (.single ⟨22880,22912,4800,4832⟩) (.single ⟨22880,22912,4832,4864⟩)))) (.node (.node (.single ⟨22912,23040,4608,4736⟩) (.single ⟨22912,22976,4736,4800⟩)) (.node (.single ⟨22912,22976,4800,4864⟩) (.node (.single ⟨22976,23040,4736,4800⟩) (.single ⟨22976,23040,4800,4864⟩)))))) (.node (.node (.node (.node (.single ⟨27904,27968,9728,9792⟩) (.single ⟨27904,27968,9792,9856⟩)) (.node (.single ⟨27968,28032,9728,9792⟩) (.single ⟨27968,28032,9792,9856⟩))) (.node (.node (.single ⟨27904,27936,9856,9888⟩) (.single ⟨27904,27936,9888,9920⟩)) (.node (.single ⟨27936,27968,9856,9888⟩) (.node (.single ⟨27936,27968,9888,9920⟩) (.single ⟨27904,27936,9920,9952⟩))))) (.node (.node (.node (.single ⟨27904,27936,9952,9984⟩) (.single ⟨27936,27968,9920,9952⟩)) (.node (.single ⟨27936,27968,9952,9984⟩) (.node (.single ⟨27968,28032,9856,9920⟩) (.single ⟨27968,28032,9920,9984⟩)))) (.node (.node (.single ⟨28032,28160,9728,9856⟩) (.single ⟨28032,28096,9856,9920⟩)) (.node (.single ⟨28032,28096,9920,9984⟩) (.node (.single ⟨28096,28160,9856,9920⟩) (.single ⟨28096,28160,9920,9984⟩))))))))
def output57 : Fin 76 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData57 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover57 (i : Fin 76) : Fin 76 := ⟨coverData57.get i % 76, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 76) : Fin 76 := ⟨sourceData57.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 (.cutX 4864 (.cutY 22784 .empty (.cutX 4736 (.cutY 22912 (.cutX 4672 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 4800 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 4832 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) (.cutX 4832 (.cutY 22880 .full .full) (.cutY 22880 .full .full)))) (.cutX 4800 (.cutY 22976 .full .full) (.cutY 22976 .full .full))))) .empty) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 .empty (.cutY 28160 (.cutX 9984 (.cutY 27904 .empty (.cutX 9856 (.cutY 28032 (.cutX 9792 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 9920 (.cutY 27968 (.cutX 9888 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full) (.cutY 27968 (.cutX 9952 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 9920 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty))))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 (.cutY 4608 .empty (.cutX 22784 .empty (.cutY 4864 (.cutX 22912 (.cutY 4736 (.cutX 22848 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 22848 (.cutY 4800 .full (.cutX 22816 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full (.cutX 22880 (.cutY 4832 .full .full) (.cutY 4832 .full .full))))) (.cutY 4736 .full (.cutX 22976 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty))) .empty) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 .empty (.cutX 27904 .empty (.cutY 9984 (.cutX 28032 (.cutY 9856 (.cutX 27968 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 27968 (.cutY 9920 (.cutX 27936 (.cutY 9888 .full .full) (.cutY 9888 .full .full)) (.cutX 27936 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 28096 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty))) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata57 : 0<192153497 ∧ 18<128 ∧ 89<128 ∧ 1<4 ∧
    6229/4160=1 ∧ 6229%4160=2069 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 64,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked57_64 : ∀ i : Fin 12,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 76, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) (forallFinOffset_add (fun i => output57 i = raw57 (source57 i)) 0 64 12 (by decide) sourceChecked57_0
    sourceChecked57_64)

theorem coverChecked57_0 : ∀ i : Fin 64,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked57_64 : ∀ i : Fin 12,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 76, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
  forallFin_of_zero_offset (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (forallFinOffset_add (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) 0 64 12 (by decide) coverChecked57_0
    coverChecked57_64)

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

-- Frozen phase 6584, atom 6412, type 1, source (20,92).
def leavesData58 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves58 : Fin 13 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 92 leaves58 i
def outputData58 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,23552,23616⟩) (.node (.single ⟨5120,5184,23616,23680⟩) (.single ⟨5184,5248,23552,23616⟩))) (.node (.single ⟨5184,5248,23616,23680⟩) (.node (.single ⟨5120,5248,23680,23808⟩) (.single ⟨5248,5312,23552,23616⟩)))) (.node (.node (.single ⟨5248,5312,23616,23680⟩) (.node (.single ⟨5312,5376,23552,23616⟩) (.single ⟨5312,5376,23616,23680⟩))) (.node (.node (.single ⟨5248,5312,23680,23744⟩) (.single ⟨5248,5312,23744,23808⟩)) (.node (.single ⟨5312,5376,23680,23744⟩) (.single ⟨5312,5376,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,27392,27456⟩) (.node (.single ⟨8960,9024,27456,27520⟩) (.single ⟨9024,9088,27392,27456⟩))) (.node (.single ⟨9024,9088,27456,27520⟩) (.node (.single ⟨8960,9088,27520,27648⟩) (.single ⟨9088,9152,27392,27456⟩)))) (.node (.node (.single ⟨9088,9152,27456,27520⟩) (.node (.single ⟨9152,9216,27392,27456⟩) (.single ⟨9152,9216,27456,27520⟩))) (.node (.node (.single ⟨9088,9152,27520,27584⟩) (.single ⟨9088,9152,27584,27648⟩)) (.node (.single ⟨9152,9216,27520,27584⟩) (.single ⟨9152,9216,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,5120,5184⟩) (.node (.single ⟨23552,23616,5184,5248⟩) (.single ⟨23616,23680,5120,5184⟩))) (.node (.single ⟨23616,23680,5184,5248⟩) (.node (.single ⟨23552,23616,5248,5312⟩) (.single ⟨23552,23616,5312,5376⟩)))) (.node (.node (.single ⟨23616,23680,5248,5312⟩) (.node (.single ⟨23616,23680,5312,5376⟩) (.single ⟨23680,23808,5120,5248⟩))) (.node (.node (.single ⟨23680,23744,5248,5312⟩) (.single ⟨23680,23744,5312,5376⟩)) (.node (.single ⟨23744,23808,5248,5312⟩) (.single ⟨23744,23808,5312,5376⟩))))) (.node (.node (.node (.single ⟨27392,27456,8960,9024⟩) (.node (.single ⟨27392,27456,9024,9088⟩) (.single ⟨27456,27520,8960,9024⟩))) (.node (.single ⟨27456,27520,9024,9088⟩) (.node (.single ⟨27392,27456,9088,9152⟩) (.single ⟨27392,27456,9152,9216⟩)))) (.node (.node (.single ⟨27456,27520,9088,9152⟩) (.node (.single ⟨27456,27520,9152,9216⟩) (.single ⟨27520,27648,8960,9088⟩))) (.node (.node (.single ⟨27520,27584,9088,9152⟩) (.single ⟨27520,27584,9152,9216⟩)) (.node (.single ⟨27584,27648,9088,9152⟩) (.single ⟨27584,27648,9152,9216⟩)))))))
def output58 : Fin 52 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 7))))) (.node (.node (.node (.single 31) (.node (.single 44) (.single 20))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData58 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 19)))) (.node (.node (.single 11) (.node (.single 15) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 17) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 18) (.single 14)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover58 (i : Fin 52) : Fin 52 := ⟨coverData58.get i % 52, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 52) : Fin 52 := ⟨sourceData58.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 (.cutX 5376 (.cutY 23808 (.cutX 5248 (.cutY 23680 (.cutX 5184 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 5312 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 5312 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 .empty (.cutX 8960 .empty (.cutY 27392 .empty (.cutX 9088 (.cutY 27520 (.cutX 9024 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full) (.cutY 27520 (.cutX 9152 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) (.cutX 9152 (.cutY 27584 .full .full) (.cutY 27584 .full .full)))))))) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 (.cutX 23808 (.cutY 5376 (.cutX 23680 (.cutY 5248 (.cutX 23616 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 23616 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full (.cutX 23744 (.cutY 5312 .full .full) (.cutY 5312 .full .full)))) .empty) .empty) .empty) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 .empty (.cutX 27392 .empty (.cutY 8960 .empty (.cutX 27520 (.cutY 9088 (.cutX 27456 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 27456 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 27584 (.cutY 9152 .full .full) (.cutY 9152 .full .full)))))))) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata58 : 0<192153497 ∧ 20<128 ∧ 92<128 ∧ 1<4 ∧
    6412/4160=1 ∧ 6412%4160=2252 ∧ ∀ i, (leaves58 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData58).mp
    (by decide +kernel)

theorem sourceChecked58_0 : ∀ i : Fin 52,
    (fun i => output58 i = raw58 (source58 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked58 : ∀ i : Fin 52, (fun i => output58 i = raw58 (source58 i)) i :=
  forallFin_of_zero_offset (fun i => output58 i = raw58 (source58 i)) sourceChecked58_0

theorem coverChecked58_0 : ∀ i : Fin 52,
    (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked58 : ∀ i : Fin 52, (fun i => (output58 (cover58 i)).ContainsBox (raw58 i)) i :=
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 6585, atom 1784, type 0, source (15,89).
def leavesData59 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,6,2⟩) (.single ⟨3,6,3⟩)) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩)))))
def leaves59 : Fin 16 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 15 89 leaves59 i
def outputData59 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3840,3968,22784,22912⟩) (.single ⟨3840,3968,22912,23040⟩)) (.node (.single ⟨3968,4032,22784,22848⟩) (.single ⟨3968,4032,22848,22912⟩))) (.node (.node (.single ⟨4032,4064,22784,22816⟩) (.single ⟨4032,4064,22816,22848⟩)) (.node (.single ⟨4064,4096,22784,22816⟩) (.single ⟨4064,4096,22816,22848⟩)))) (.node (.node (.node (.single ⟨4032,4064,22848,22880⟩) (.single ⟨4032,4064,22880,22912⟩)) (.node (.single ⟨4064,4096,22848,22880⟩) (.single ⟨4064,4096,22880,22912⟩))) (.node (.node (.single ⟨3968,4032,22912,22976⟩) (.single ⟨3968,4032,22976,23040⟩)) (.node (.single ⟨4032,4096,22912,22976⟩) (.single ⟨4032,4096,22976,23040⟩))))) (.node (.node (.node (.node (.single ⟨9728,9792,28672,28736⟩) (.single ⟨9728,9792,28736,28800⟩)) (.node (.single ⟨9792,9856,28672,28736⟩) (.single ⟨9792,9856,28736,28800⟩))) (.node (.node (.single ⟨9728,9856,28800,28928⟩) (.single ⟨9856,9888,28672,28704⟩)) (.node (.single ⟨9856,9888,28704,28736⟩) (.single ⟨9888,9920,28672,28704⟩)))) (.node (.node (.node (.single ⟨9888,9920,28704,28736⟩) (.single ⟨9856,9920,28736,28800⟩)) (.node (.single ⟨9920,9952,28672,28704⟩) (.single ⟨9920,9952,28704,28736⟩))) (.node (.node (.single ⟨9952,9984,28672,28704⟩) (.single ⟨9952,9984,28704,28736⟩)) (.node (.single ⟨9920,9984,28736,28800⟩) (.single ⟨9856,9984,28800,28928⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22784,22912,3840,3968⟩) (.single ⟨22784,22848,3968,4032⟩)) (.node (.single ⟨22784,22816,4032,4064⟩) (.single ⟨22784,22816,4064,4096⟩))) (.node (.node (.single ⟨22816,22848,4032,4064⟩) (.single ⟨22816,22848,4064,4096⟩)) (.node (.single ⟨22848,22912,3968,4032⟩) (.single ⟨22848,22880,4032,4064⟩)))) (.node (.node (.node (.single ⟨22848,22880,4064,4096⟩) (.single ⟨22880,22912,4032,4064⟩)) (.node (.single ⟨22880,22912,4064,4096⟩) (.single ⟨22912,23040,3840,3968⟩))) (.node (.node (.single ⟨22912,22976,3968,4032⟩) (.single ⟨22912,22976,4032,4096⟩)) (.node (.single ⟨22976,23040,3968,4032⟩) (.single ⟨22976,23040,4032,4096⟩))))) (.node (.node (.node (.node (.single ⟨28672,28736,9728,9792⟩) (.single ⟨28672,28736,9792,9856⟩)) (.node (.single ⟨28736,28800,9728,9792⟩) (.single ⟨28736,28800,9792,9856⟩))) (.node (.node (.single ⟨28672,28704,9856,9888⟩) (.single ⟨28672,28704,9888,9920⟩)) (.node (.single ⟨28704,28736,9856,9888⟩) (.single ⟨28704,28736,9888,9920⟩)))) (.node (.node (.node (.single ⟨28672,28704,9920,9952⟩) (.single ⟨28672,28704,9952,9984⟩)) (.node (.single ⟨28704,28736,9920,9952⟩) (.single ⟨28704,28736,9952,9984⟩))) (.node (.node (.single ⟨28736,28800,9856,9920⟩) (.single ⟨28736,28800,9920,9984⟩)) (.node (.single ⟨28800,28928,9728,9856⟩) (.single ⟨28800,28928,9856,9984⟩)))))))
def output59 : Fin 64 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 43)) (.node (.single 62) (.single 20)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 38)) (.node (.single 60) (.single 25))))) (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 4) (.single 34)) (.node (.single 59) (.single 29))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 35)) (.node (.single 57) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))))) (.node (.node (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24))) (.node (.node (.single 9) (.single 41)) (.node (.single 54) (.single 22)))) (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))))
def sourceData59 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))) (.node (.node (.single 7) (.single 63)) (.node (.single 55) (.single 59)))) (.node (.node (.node (.single 51) (.single 15)) (.node (.single 47) (.single 39))) (.node (.node (.single 43) (.single 35)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 33) (.single 41))) (.node (.node (.single 37) (.single 45)) (.node (.single 13) (.single 49)))) (.node (.node (.node (.single 57) (.single 53)) (.node (.single 61) (.single 5))) (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18))) (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50)))) (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover59 (i : Fin 64) : Fin 64 := ⟨coverData59.get i % 64, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 64) : Fin 64 := ⟨sourceData59.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 (.cutX 3840 .empty (.cutY 22784 .empty (.cutX 3968 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 4032 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 4064 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) (.cutX 4064 (.cutY 22880 .full .full) (.cutY 22880 .full .full)))) (.cutX 4032 (.cutY 22976 .full .full) (.cutY 22976 .full .full)))))) .empty)) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 (.cutX 9984 (.cutY 28928 (.cutX 9856 (.cutY 28800 (.cutX 9792 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 9920 (.cutY 28736 (.cutX 9888 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full) (.cutY 28736 (.cutX 9952 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 .empty (.cutX 22784 .empty (.cutY 3840 .empty (.cutX 22912 (.cutY 3968 .full (.cutX 22848 (.cutY 4032 .full (.cutX 22816 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full (.cutX 22880 (.cutY 4064 .full .full) (.cutY 4064 .full .full))))) (.cutY 3968 .full (.cutX 22976 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 .empty (.cutX 28928 (.cutY 9984 (.cutX 28800 (.cutY 9856 (.cutX 28736 (.cutY 9792 .full .full) (.cutY 9792 .full .full)) (.cutX 28736 (.cutY 9920 (.cutX 28704 (.cutY 9888 .full .full) (.cutY 9888 .full .full)) (.cutX 28704 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata59 : 0<77641223 ∧ 15<128 ∧ 89<128 ∧ 0<4 ∧
    1784/4160=0 ∧ 1784%4160=1784 ∧ ∀ i, (leaves59 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData59).mp
    (by decide +kernel)

theorem sourceChecked59_0 : ∀ i : Fin 64,
    (fun i => output59 i = raw59 (source59 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked59 : ∀ i : Fin 64, (fun i => output59 i = raw59 (source59 i)) i :=
  forallFin_of_zero_offset (fun i => output59 i = raw59 (source59 i)) sourceChecked59_0

theorem coverChecked59_0 : ∀ i : Fin 64,
    (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked59 : ∀ i : Fin 64, (fun i => (output59 (cover59 i)).ContainsBox (raw59 i)) i :=
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 6586, atom 1260, type 0, source (10,80).
def leavesData60 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves60 : Fin 7 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 80 leaves60 i
def outputData60 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,20480,20608⟩) (.node (.single ⟨2560,2688,20608,20736⟩) (.single ⟨2688,2752,20480,20544⟩))) (.node (.node (.single ⟨2688,2752,20544,20608⟩) (.single ⟨2752,2816,20480,20544⟩)) (.node (.single ⟨2752,2816,20544,20608⟩) (.single ⟨2688,2816,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,29952,30080⟩) (.node (.single ⟨12032,12160,30080,30208⟩) (.single ⟨12160,12224,29952,30016⟩))) (.node (.node (.single ⟨12160,12224,30016,30080⟩) (.single ⟨12224,12288,29952,30016⟩)) (.node (.single ⟨12224,12288,30016,30080⟩) (.single ⟨12160,12288,30080,30208⟩))))) (.node (.node (.node (.single ⟨20480,20608,2560,2688⟩) (.node (.single ⟨20480,20544,2688,2752⟩) (.single ⟨20480,20544,2752,2816⟩))) (.node (.node (.single ⟨20544,20608,2688,2752⟩) (.single ⟨20544,20608,2752,2816⟩)) (.node (.single ⟨20608,20736,2560,2688⟩) (.single ⟨20608,20736,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,12032,12160⟩) (.node (.single ⟨29952,30016,12160,12224⟩) (.single ⟨29952,30016,12224,12288⟩))) (.node (.node (.single ⟨30016,30080,12160,12224⟩) (.single ⟨30016,30080,12224,12288⟩)) (.node (.single ⟨30080,30208,12032,12160⟩) (.single ⟨30080,30208,12160,12288⟩))))))
def output60 : Fin 28 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData60 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover60 (i : Fin 28) : Fin 28 := ⟨coverData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 28) : Fin 28 := ⟨sourceData60.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 (.cutX 2816 (.cutY 20736 (.cutX 2688 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 2752 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 (.cutX 12032 .empty (.cutY 29952 .empty (.cutX 12160 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 12224 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty)))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 .empty (.cutX 20736 (.cutY 2816 (.cutX 20608 (.cutY 2688 .full (.cutX 20544 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 .empty (.cutX 29952 .empty (.cutY 12032 .empty (.cutX 30080 (.cutY 12160 .full (.cutX 30016 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))) .empty)))) .empty) .empty)))) .empty))

theorem metadata60 : 0<72090291 ∧ 10<128 ∧ 80<128 ∧ 0<4 ∧
    1260/4160=0 ∧ 1260%4160=1260 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 6587, atom 2749, type 0, source (26,97).
def leavesData61 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves61 : Fin 16 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 26 97 leaves61 i
def outputData61 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6656,6720,24832,24896⟩) (.single ⟨6656,6720,24896,24960⟩)) (.node (.single ⟨6720,6784,24832,24896⟩) (.single ⟨6720,6784,24896,24960⟩))) (.node (.node (.single ⟨6656,6784,24960,25088⟩) (.single ⟨6784,6848,24832,24896⟩)) (.node (.single ⟨6784,6848,24896,24960⟩) (.single ⟨6848,6880,24832,24864⟩)))) (.node (.node (.node (.single ⟨6848,6880,24864,24896⟩) (.single ⟨6880,6912,24832,24864⟩)) (.node (.single ⟨6880,6912,24864,24896⟩) (.single ⟨6848,6912,24896,24960⟩))) (.node (.node (.single ⟨6784,6848,24960,25024⟩) (.single ⟨6784,6848,25024,25088⟩)) (.node (.single ⟨6848,6912,24960,25024⟩) (.single ⟨6848,6912,25024,25088⟩))))) (.node (.node (.node (.node (.single ⟨7680,7744,25856,25920⟩) (.single ⟨7680,7744,25920,25984⟩)) (.node (.single ⟨7744,7808,25856,25920⟩) (.single ⟨7744,7808,25920,25984⟩))) (.node (.node (.single ⟨7680,7808,25984,26112⟩) (.single ⟨7808,7872,25856,25920⟩)) (.node (.single ⟨7808,7872,25920,25984⟩) (.single ⟨7872,7904,25856,25888⟩)))) (.node (.node (.node (.single ⟨7872,7904,25888,25920⟩) (.single ⟨7904,7936,25856,25888⟩)) (.node (.single ⟨7904,7936,25888,25920⟩) (.single ⟨7872,7936,25920,25984⟩))) (.node (.node (.single ⟨7808,7872,25984,26048⟩) (.single ⟨7808,7872,26048,26112⟩)) (.node (.single ⟨7872,7936,25984,26048⟩) (.single ⟨7872,7936,26048,26112⟩)))))) (.node (.node (.node (.node (.node (.single ⟨24832,24896,6656,6720⟩) (.single ⟨24832,24896,6720,6784⟩)) (.node (.single ⟨24896,24960,6656,6720⟩) (.single ⟨24896,24960,6720,6784⟩))) (.node (.node (.single ⟨24832,24896,6784,6848⟩) (.single ⟨24832,24864,6848,6880⟩)) (.node (.single ⟨24832,24864,6880,6912⟩) (.single ⟨24864,24896,6848,6880⟩)))) (.node (.node (.node (.single ⟨24864,24896,6880,6912⟩) (.single ⟨24896,24960,6784,6848⟩)) (.node (.single ⟨24896,24960,6848,6912⟩) (.single ⟨24960,25088,6656,6784⟩))) (.node (.node (.single ⟨24960,25024,6784,6848⟩) (.single ⟨24960,25024,6848,6912⟩)) (.node (.single ⟨25024,25088,6784,6848⟩) (.single ⟨25024,25088,6848,6912⟩))))) (.node (.node (.node (.node (.single ⟨25856,25920,7680,7744⟩) (.single ⟨25856,25920,7744,7808⟩)) (.node (.single ⟨25920,25984,7680,7744⟩) (.single ⟨25920,25984,7744,7808⟩))) (.node (.node (.single ⟨25856,25920,7808,7872⟩) (.single ⟨25856,25888,7872,7904⟩)) (.node (.single ⟨25856,25888,7904,7936⟩) (.single ⟨25888,25920,7872,7904⟩)))) (.node (.node (.node (.single ⟨25888,25920,7904,7936⟩) (.single ⟨25920,25984,7808,7872⟩)) (.node (.single ⟨25920,25984,7872,7936⟩) (.single ⟨25984,26112,7680,7808⟩))) (.node (.node (.single ⟨25984,26048,7808,7872⟩) (.single ⟨25984,26048,7872,7936⟩)) (.node (.single ⟨26048,26112,7808,7872⟩) (.single ⟨26048,26112,7872,7936⟩)))))))
def output61 : Fin 64 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData61 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover61 (i : Fin 64) : Fin 64 := ⟨coverData61.get i % 64, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 64) : Fin 64 := ⟨sourceData61.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 (.cutX 6912 (.cutY 24832 .empty (.cutX 6784 (.cutY 24960 (.cutX 6720 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 6848 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 6880 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 6848 (.cutY 25024 .full .full) (.cutY 25024 .full .full))))) .empty) .empty)) .empty) (.cutY 25600 .empty (.cutX 7680 .empty (.cutY 26112 (.cutX 7936 (.cutY 25856 .empty (.cutX 7808 (.cutY 25984 (.cutX 7744 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 7872 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 7904 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 7872 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty)))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 (.cutY 6656 .empty (.cutX 24832 .empty (.cutY 6912 (.cutX 24960 (.cutY 6784 (.cutX 24896 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 24896 (.cutY 6848 .full (.cutX 24864 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 25024 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty))) .empty) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 .empty (.cutX 25856 .empty (.cutY 7936 (.cutX 25984 (.cutY 7808 (.cutX 25920 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 25920 (.cutY 7872 .full (.cutX 25888 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 26048 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata61 : 0<31548346 ∧ 26<128 ∧ 97<128 ∧ 0<4 ∧
    2749/4160=0 ∧ 2749%4160=2749 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 64,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 64, (fun i => output61 i = raw61 (source61 i)) i :=
  forallFin_of_zero_offset (fun i => output61 i = raw61 (source61 i)) sourceChecked61_0

theorem coverChecked61_0 : ∀ i : Fin 64,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked61 : ∀ i : Fin 64, (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) i :=
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 6588, atom 1579, type 0, source (13,84).
def leavesData62 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves62 : Fin 10 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 13 84 leaves62 i
def outputData62 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3328,3456,21504,21632⟩) (.single ⟨3328,3456,21632,21760⟩)) (.node (.single ⟨3456,3520,21504,21568⟩) (.node (.single ⟨3456,3520,21568,21632⟩) (.single ⟨3520,3584,21504,21568⟩)))) (.node (.node (.single ⟨3520,3584,21568,21632⟩) (.single ⟨3456,3520,21632,21696⟩)) (.node (.single ⟨3456,3520,21696,21760⟩) (.node (.single ⟨3520,3584,21632,21696⟩) (.single ⟨3520,3584,21696,21760⟩))))) (.node (.node (.node (.single ⟨11008,11072,29184,29248⟩) (.single ⟨11008,11072,29248,29312⟩)) (.node (.single ⟨11072,11136,29184,29248⟩) (.node (.single ⟨11072,11136,29248,29312⟩) (.single ⟨11008,11136,29312,29440⟩)))) (.node (.node (.single ⟨11136,11200,29184,29248⟩) (.single ⟨11136,11200,29248,29312⟩)) (.node (.single ⟨11200,11264,29184,29248⟩) (.node (.single ⟨11200,11264,29248,29312⟩) (.single ⟨11136,11264,29312,29440⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,3328,3456⟩) (.single ⟨21504,21568,3456,3520⟩)) (.node (.single ⟨21504,21568,3520,3584⟩) (.node (.single ⟨21568,21632,3456,3520⟩) (.single ⟨21568,21632,3520,3584⟩)))) (.node (.node (.single ⟨21632,21760,3328,3456⟩) (.single ⟨21632,21696,3456,3520⟩)) (.node (.single ⟨21632,21696,3520,3584⟩) (.node (.single ⟨21696,21760,3456,3520⟩) (.single ⟨21696,21760,3520,3584⟩))))) (.node (.node (.node (.single ⟨29184,29248,11008,11072⟩) (.single ⟨29184,29248,11072,11136⟩)) (.node (.single ⟨29248,29312,11008,11072⟩) (.node (.single ⟨29248,29312,11072,11136⟩) (.single ⟨29184,29248,11136,11200⟩)))) (.node (.node (.single ⟨29184,29248,11200,11264⟩) (.single ⟨29248,29312,11136,11200⟩)) (.node (.single ⟨29248,29312,11200,11264⟩) (.node (.single ⟨29312,29440,11008,11136⟩) (.single ⟨29312,29440,11136,11264⟩)))))))
def output62 : Fin 40 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover62 (i : Fin 40) : Fin 40 := ⟨coverData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 40) : Fin 40 := ⟨sourceData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 (.cutX 3328 .empty (.cutY 21760 (.cutX 3456 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 3520 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) (.cutX 3520 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty)) .empty) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 .empty (.cutY 29184 .empty (.cutX 11008 .empty (.cutY 29440 (.cutX 11136 (.cutY 29312 (.cutX 11072 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 11200 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 (.cutY 3584 (.cutX 21760 (.cutY 3328 .empty (.cutX 21632 (.cutY 3456 .full (.cutX 21568 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full (.cutX 21696 (.cutY 3520 .full .full) (.cutY 3520 .full .full))))) .empty) .empty) .empty)))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 .empty (.cutX 29440 (.cutY 11008 .empty (.cutX 29312 (.cutY 11136 (.cutX 29248 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 29248 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))) .empty))) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata62 : 0<72090291 ∧ 13<128 ∧ 84<128 ∧ 0<4 ∧
    1579/4160=0 ∧ 1579%4160=1579 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 6589, atom 2428, type 0, source (22,96).
def leavesData63 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves63 : Fin 13 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 96 leaves63 i
def outputData63 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,24576,24640⟩) (.node (.single ⟨5632,5696,24640,24704⟩) (.single ⟨5696,5760,24576,24640⟩))) (.node (.single ⟨5696,5760,24640,24704⟩) (.node (.single ⟨5632,5760,24704,24832⟩) (.single ⟨5760,5824,24576,24640⟩)))) (.node (.node (.single ⟨5760,5824,24640,24704⟩) (.node (.single ⟨5824,5856,24576,24608⟩) (.single ⟨5824,5856,24608,24640⟩))) (.node (.node (.single ⟨5856,5888,24576,24608⟩) (.single ⟨5856,5888,24608,24640⟩)) (.node (.single ⟨5824,5888,24640,24704⟩) (.single ⟨5760,5888,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,26880,27008⟩) (.node (.single ⟨7936,8064,27008,27136⟩) (.single ⟨8064,8128,26880,26944⟩))) (.node (.single ⟨8064,8128,26944,27008⟩) (.node (.single ⟨8128,8160,26880,26912⟩) (.single ⟨8128,8160,26912,26944⟩)))) (.node (.node (.single ⟨8160,8192,26880,26912⟩) (.node (.single ⟨8160,8192,26912,26944⟩) (.single ⟨8128,8192,26944,27008⟩))) (.node (.node (.single ⟨8064,8128,27008,27072⟩) (.single ⟨8064,8128,27072,27136⟩)) (.node (.single ⟨8128,8192,27008,27072⟩) (.single ⟨8128,8192,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,5632,5696⟩) (.node (.single ⟨24576,24640,5696,5760⟩) (.single ⟨24640,24704,5632,5696⟩))) (.node (.single ⟨24640,24704,5696,5760⟩) (.node (.single ⟨24576,24640,5760,5824⟩) (.single ⟨24576,24608,5824,5856⟩)))) (.node (.node (.single ⟨24576,24608,5856,5888⟩) (.node (.single ⟨24608,24640,5824,5856⟩) (.single ⟨24608,24640,5856,5888⟩))) (.node (.node (.single ⟨24640,24704,5760,5824⟩) (.single ⟨24640,24704,5824,5888⟩)) (.node (.single ⟨24704,24832,5632,5760⟩) (.single ⟨24704,24832,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,7936,8064⟩) (.node (.single ⟨26880,26944,8064,8128⟩) (.single ⟨26880,26912,8128,8160⟩))) (.node (.single ⟨26880,26912,8160,8192⟩) (.node (.single ⟨26912,26944,8128,8160⟩) (.single ⟨26912,26944,8160,8192⟩)))) (.node (.node (.single ⟨26944,27008,8064,8128⟩) (.node (.single ⟨26944,27008,8128,8192⟩) (.single ⟨27008,27136,7936,8064⟩))) (.node (.node (.single ⟨27008,27072,8064,8128⟩) (.single ⟨27008,27072,8128,8192⟩)) (.node (.single ⟨27072,27136,8064,8128⟩) (.single ⟨27072,27136,8128,8192⟩)))))))
def output63 : Fin 52 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover63 (i : Fin 52) : Fin 52 := ⟨coverData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 52) : Fin 52 := ⟨sourceData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 (.cutX 5888 (.cutY 24832 (.cutX 5760 (.cutY 24704 (.cutX 5696 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 5824 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 5856 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 (.cutX 7936 .empty (.cutY 26880 .empty (.cutX 8064 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 8128 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 8160 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 8128 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 .empty (.cutX 24832 (.cutY 5888 (.cutX 24704 (.cutY 5760 (.cutX 24640 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 24640 (.cutY 5824 .full (.cutX 24608 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 .empty (.cutX 26880 .empty (.cutY 7936 .empty (.cutX 27008 (.cutY 8064 .full (.cutX 26944 (.cutY 8128 .full (.cutX 26912 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 27072 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata63 : 0<121837468 ∧ 22<128 ∧ 96<128 ∧ 0<4 ∧
    2428/4160=0 ∧ 2428%4160=2428 ∧ ∀ i, (leaves63 i).Valid 8 := by
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 6590, atom 6322, type 1, source (19,91).
def leavesData64 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves64 : Fin 16 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 19 91 leaves64 i
def outputData64 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4864,4928,23296,23360⟩) (.single ⟨4864,4928,23360,23424⟩)) (.node (.single ⟨4928,4992,23296,23360⟩) (.single ⟨4928,4992,23360,23424⟩))) (.node (.node (.single ⟨4864,4992,23424,23552⟩) (.single ⟨4992,5056,23296,23360⟩)) (.node (.single ⟨4992,5056,23360,23424⟩) (.single ⟨5056,5088,23296,23328⟩)))) (.node (.node (.node (.single ⟨5056,5088,23328,23360⟩) (.single ⟨5088,5120,23296,23328⟩)) (.node (.single ⟨5088,5120,23328,23360⟩) (.single ⟨5056,5120,23360,23424⟩))) (.node (.node (.single ⟨4992,5056,23424,23488⟩) (.single ⟨4992,5056,23488,23552⟩)) (.node (.single ⟨5056,5120,23424,23488⟩) (.single ⟨5056,5120,23488,23552⟩))))) (.node (.node (.node (.node (.single ⟨9216,9280,27648,27712⟩) (.single ⟨9216,9280,27712,27776⟩)) (.node (.single ⟨9280,9344,27648,27712⟩) (.single ⟨9280,9344,27712,27776⟩))) (.node (.node (.single ⟨9216,9344,27776,27904⟩) (.single ⟨9344,9408,27648,27712⟩)) (.node (.single ⟨9344,9408,27712,27776⟩) (.single ⟨9408,9440,27648,27680⟩)))) (.node (.node (.node (.single ⟨9408,9440,27680,27712⟩) (.single ⟨9440,9472,27648,27680⟩)) (.node (.single ⟨9440,9472,27680,27712⟩) (.single ⟨9408,9472,27712,27776⟩))) (.node (.node (.single ⟨9344,9408,27776,27840⟩) (.single ⟨9344,9408,27840,27904⟩)) (.node (.single ⟨9408,9472,27776,27840⟩) (.single ⟨9408,9472,27840,27904⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,4864,4928⟩) (.single ⟨23296,23360,4928,4992⟩)) (.node (.single ⟨23360,23424,4864,4928⟩) (.single ⟨23360,23424,4928,4992⟩))) (.node (.node (.single ⟨23296,23360,4992,5056⟩) (.single ⟨23296,23328,5056,5088⟩)) (.node (.single ⟨23296,23328,5088,5120⟩) (.single ⟨23328,23360,5056,5088⟩)))) (.node (.node (.node (.single ⟨23328,23360,5088,5120⟩) (.single ⟨23360,23424,4992,5056⟩)) (.node (.single ⟨23360,23424,5056,5120⟩) (.single ⟨23424,23552,4864,4992⟩))) (.node (.node (.single ⟨23424,23488,4992,5056⟩) (.single ⟨23424,23488,5056,5120⟩)) (.node (.single ⟨23488,23552,4992,5056⟩) (.single ⟨23488,23552,5056,5120⟩))))) (.node (.node (.node (.node (.single ⟨27648,27712,9216,9280⟩) (.single ⟨27648,27712,9280,9344⟩)) (.node (.single ⟨27712,27776,9216,9280⟩) (.single ⟨27712,27776,9280,9344⟩))) (.node (.node (.single ⟨27648,27712,9344,9408⟩) (.single ⟨27648,27680,9408,9440⟩)) (.node (.single ⟨27648,27680,9440,9472⟩) (.single ⟨27680,27712,9408,9440⟩)))) (.node (.node (.node (.single ⟨27680,27712,9440,9472⟩) (.single ⟨27712,27776,9344,9408⟩)) (.node (.single ⟨27712,27776,9408,9472⟩) (.single ⟨27776,27904,9216,9344⟩))) (.node (.node (.single ⟨27776,27840,9344,9408⟩) (.single ⟨27776,27840,9408,9472⟩)) (.node (.single ⟨27840,27904,9344,9408⟩) (.single ⟨27840,27904,9408,9472⟩)))))))
def output64 : Fin 64 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData64 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover64 (i : Fin 64) : Fin 64 := ⟨coverData64.get i % 64, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 64) : Fin 64 := ⟨sourceData64.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 .empty (.cutX 4864 .empty (.cutY 23296 .empty (.cutX 4992 (.cutY 23424 (.cutX 4928 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 5056 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 5088 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 5056 (.cutY 23488 .full .full) (.cutY 23488 .full .full)))))))) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 (.cutX 9472 (.cutY 27904 (.cutX 9344 (.cutY 27776 (.cutX 9280 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full) (.cutY 27776 (.cutX 9408 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 9440 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 9408 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 .empty (.cutX 23296 .empty (.cutY 4864 .empty (.cutX 23424 (.cutY 4992 (.cutX 23360 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 23360 (.cutY 5056 .full (.cutX 23328 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full (.cutX 23488 (.cutY 5056 .full .full) (.cutY 5056 .full .full)))))))) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 (.cutX 27904 (.cutY 9472 (.cutX 27776 (.cutY 9344 (.cutX 27712 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 27712 (.cutY 9408 .full (.cutX 27680 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 27840 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata64 : 0<192153497 ∧ 19<128 ∧ 91<128 ∧ 1<4 ∧
    6322/4160=1 ∧ 6322%4160=2162 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 64,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 64, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 64,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 64, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 6591, atom 1785, type 0, source (15,90).
def leavesData65 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves65 : Fin 10 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 90 leaves65 i
def outputData65 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,23040,23168⟩) (.single ⟨3840,3968,23168,23296⟩)) (.node (.single ⟨3968,4032,23040,23104⟩) (.node (.single ⟨3968,4032,23104,23168⟩) (.single ⟨4032,4096,23040,23104⟩)))) (.node (.node (.single ⟨4032,4096,23104,23168⟩) (.single ⟨3968,4032,23168,23232⟩)) (.node (.single ⟨3968,4032,23232,23296⟩) (.node (.single ⟨4032,4096,23168,23232⟩) (.single ⟨4032,4096,23232,23296⟩))))) (.node (.node (.node (.single ⟨9472,9536,28672,28736⟩) (.single ⟨9472,9536,28736,28800⟩)) (.node (.single ⟨9536,9600,28672,28736⟩) (.node (.single ⟨9536,9600,28736,28800⟩) (.single ⟨9472,9600,28800,28928⟩)))) (.node (.node (.single ⟨9600,9664,28672,28736⟩) (.single ⟨9600,9664,28736,28800⟩)) (.node (.single ⟨9664,9728,28672,28736⟩) (.node (.single ⟨9664,9728,28736,28800⟩) (.single ⟨9600,9728,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23168,3840,3968⟩) (.single ⟨23040,23104,3968,4032⟩)) (.node (.single ⟨23040,23104,4032,4096⟩) (.node (.single ⟨23104,23168,3968,4032⟩) (.single ⟨23104,23168,4032,4096⟩)))) (.node (.node (.single ⟨23168,23296,3840,3968⟩) (.single ⟨23168,23232,3968,4032⟩)) (.node (.single ⟨23168,23232,4032,4096⟩) (.node (.single ⟨23232,23296,3968,4032⟩) (.single ⟨23232,23296,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,9472,9536⟩) (.single ⟨28672,28736,9536,9600⟩)) (.node (.single ⟨28736,28800,9472,9536⟩) (.node (.single ⟨28736,28800,9536,9600⟩) (.single ⟨28672,28736,9600,9664⟩)))) (.node (.node (.single ⟨28672,28736,9664,9728⟩) (.single ⟨28736,28800,9600,9664⟩)) (.node (.single ⟨28736,28800,9664,9728⟩) (.node (.single ⟨28800,28928,9472,9600⟩) (.single ⟨28800,28928,9600,9728⟩)))))))
def output65 : Fin 40 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover65 (i : Fin 40) : Fin 40 := ⟨coverData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 40) : Fin 40 := ⟨sourceData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 .empty (.cutX 3840 .empty (.cutY 23296 (.cutX 3968 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 4032 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) (.cutX 4032 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty)))) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 (.cutX 9472 .empty (.cutY 28928 (.cutX 9600 (.cutY 28800 (.cutX 9536 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 9664 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 .empty (.cutX 23296 (.cutY 3840 .empty (.cutX 23168 (.cutY 3968 .full (.cutX 23104 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 23232 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty)))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 (.cutX 28928 (.cutY 9472 .empty (.cutX 28800 (.cutY 9600 (.cutX 28736 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 28736 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata65 : 0<77641223 ∧ 15<128 ∧ 90<128 ∧ 0<4 ∧
    1785/4160=0 ∧ 1785%4160=1785 ∧ ∀ i, (leaves65 i).Valid 8 := by
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 6592, atom 1884, type 0, source (16,92).
def leavesData66 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves66 : Fin 10 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 92 leaves66 i
def outputData66 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,23552,23680⟩) (.single ⟨4096,4224,23680,23808⟩)) (.node (.single ⟨4224,4288,23552,23616⟩) (.node (.single ⟨4224,4288,23616,23680⟩) (.single ⟨4288,4352,23552,23616⟩)))) (.node (.node (.single ⟨4288,4352,23616,23680⟩) (.single ⟨4224,4288,23680,23744⟩)) (.node (.single ⟨4224,4288,23744,23808⟩) (.node (.single ⟨4288,4352,23680,23744⟩) (.single ⟨4288,4352,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,28416,28480⟩) (.single ⟨8960,9024,28480,28544⟩)) (.node (.single ⟨9024,9088,28416,28480⟩) (.node (.single ⟨9024,9088,28480,28544⟩) (.single ⟨8960,9088,28544,28672⟩)))) (.node (.node (.single ⟨9088,9152,28416,28480⟩) (.single ⟨9088,9152,28480,28544⟩)) (.node (.single ⟨9152,9216,28416,28480⟩) (.node (.single ⟨9152,9216,28480,28544⟩) (.single ⟨9088,9216,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23680,4096,4224⟩) (.single ⟨23552,23616,4224,4288⟩)) (.node (.single ⟨23552,23616,4288,4352⟩) (.node (.single ⟨23616,23680,4224,4288⟩) (.single ⟨23616,23680,4288,4352⟩)))) (.node (.node (.single ⟨23680,23808,4096,4224⟩) (.single ⟨23680,23744,4224,4288⟩)) (.node (.single ⟨23680,23744,4288,4352⟩) (.node (.single ⟨23744,23808,4224,4288⟩) (.single ⟨23744,23808,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,8960,9024⟩) (.single ⟨28416,28480,9024,9088⟩)) (.node (.single ⟨28480,28544,8960,9024⟩) (.node (.single ⟨28480,28544,9024,9088⟩) (.single ⟨28416,28480,9088,9152⟩)))) (.node (.node (.single ⟨28416,28480,9152,9216⟩) (.single ⟨28480,28544,9088,9152⟩)) (.node (.single ⟨28480,28544,9152,9216⟩) (.node (.single ⟨28544,28672,8960,9088⟩) (.single ⟨28544,28672,9088,9216⟩)))))))
def output66 : Fin 40 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover66 (i : Fin 40) : Fin 40 := ⟨coverData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 40) : Fin 40 := ⟨sourceData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 (.cutY 23808 (.cutX 4224 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 4288 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 4288 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 .empty (.cutY 28416 .empty (.cutX 9088 (.cutY 28544 (.cutX 9024 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 9152 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 (.cutY 4352 (.cutX 23680 (.cutY 4224 .full (.cutX 23616 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 23744 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 .empty (.cutY 8960 .empty (.cutX 28544 (.cutY 9088 (.cutX 28480 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 28480 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata66 : 0<156282496 ∧ 16<128 ∧ 92<128 ∧ 0<4 ∧
    1884/4160=0 ∧ 1884%4160=1884 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 6593, atom 1980, type 0, source (17,93).
def leavesData67 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves67 : Fin 16 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 17 93 leaves67 i
def outputData67 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,23808,23872⟩) (.single ⟨4352,4416,23872,23936⟩)) (.node (.single ⟨4416,4480,23808,23872⟩) (.single ⟨4416,4480,23872,23936⟩))) (.node (.node (.single ⟨4352,4480,23936,24064⟩) (.single ⟨4480,4544,23808,23872⟩)) (.node (.single ⟨4480,4544,23872,23936⟩) (.single ⟨4544,4576,23808,23840⟩)))) (.node (.node (.node (.single ⟨4544,4576,23840,23872⟩) (.single ⟨4576,4608,23808,23840⟩)) (.node (.single ⟨4576,4608,23840,23872⟩) (.single ⟨4544,4608,23872,23936⟩))) (.node (.node (.single ⟨4480,4544,23936,24000⟩) (.single ⟨4480,4544,24000,24064⟩)) (.node (.single ⟨4544,4608,23936,24000⟩) (.single ⟨4544,4608,24000,24064⟩))))) (.node (.node (.node (.node (.single ⟨8704,8768,28160,28224⟩) (.single ⟨8704,8768,28224,28288⟩)) (.node (.single ⟨8768,8832,28160,28224⟩) (.single ⟨8768,8832,28224,28288⟩))) (.node (.node (.single ⟨8704,8832,28288,28416⟩) (.single ⟨8832,8896,28160,28224⟩)) (.node (.single ⟨8832,8896,28224,28288⟩) (.single ⟨8896,8928,28160,28192⟩)))) (.node (.node (.node (.single ⟨8896,8928,28192,28224⟩) (.single ⟨8928,8960,28160,28192⟩)) (.node (.single ⟨8928,8960,28192,28224⟩) (.single ⟨8896,8960,28224,28288⟩))) (.node (.node (.single ⟨8832,8896,28288,28352⟩) (.single ⟨8832,8896,28352,28416⟩)) (.node (.single ⟨8896,8960,28288,28352⟩) (.single ⟨8896,8960,28352,28416⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23808,23872,4352,4416⟩) (.single ⟨23808,23872,4416,4480⟩)) (.node (.single ⟨23872,23936,4352,4416⟩) (.single ⟨23872,23936,4416,4480⟩))) (.node (.node (.single ⟨23808,23872,4480,4544⟩) (.single ⟨23808,23840,4544,4576⟩)) (.node (.single ⟨23808,23840,4576,4608⟩) (.single ⟨23840,23872,4544,4576⟩)))) (.node (.node (.node (.single ⟨23840,23872,4576,4608⟩) (.single ⟨23872,23936,4480,4544⟩)) (.node (.single ⟨23872,23936,4544,4608⟩) (.single ⟨23936,24064,4352,4480⟩))) (.node (.node (.single ⟨23936,24000,4480,4544⟩) (.single ⟨23936,24000,4544,4608⟩)) (.node (.single ⟨24000,24064,4480,4544⟩) (.single ⟨24000,24064,4544,4608⟩))))) (.node (.node (.node (.node (.single ⟨28160,28224,8704,8768⟩) (.single ⟨28160,28224,8768,8832⟩)) (.node (.single ⟨28224,28288,8704,8768⟩) (.single ⟨28224,28288,8768,8832⟩))) (.node (.node (.single ⟨28160,28224,8832,8896⟩) (.single ⟨28160,28192,8896,8928⟩)) (.node (.single ⟨28160,28192,8928,8960⟩) (.single ⟨28192,28224,8896,8928⟩)))) (.node (.node (.node (.single ⟨28192,28224,8928,8960⟩) (.single ⟨28224,28288,8832,8896⟩)) (.node (.single ⟨28224,28288,8896,8960⟩) (.single ⟨28288,28416,8704,8832⟩))) (.node (.node (.single ⟨28288,28352,8832,8896⟩) (.single ⟨28288,28352,8896,8960⟩)) (.node (.single ⟨28352,28416,8832,8896⟩) (.single ⟨28352,28416,8896,8960⟩)))))))
def output67 : Fin 64 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData67 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover67 (i : Fin 64) : Fin 64 := ⟨coverData67.get i % 64, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 64) : Fin 64 := ⟨sourceData67.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 (.cutY 24064 (.cutX 4352 .empty (.cutY 23808 .empty (.cutX 4480 (.cutY 23936 (.cutX 4416 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 4544 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 4576 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 4544 (.cutY 24000 .full .full) (.cutY 24000 .full .full)))))) .empty) .empty)) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 .empty (.cutY 28160 .empty (.cutX 8960 (.cutY 28416 (.cutX 8832 (.cutY 28288 (.cutX 8768 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 8896 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 8928 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 8896 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)))) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 (.cutY 4608 (.cutX 23808 .empty (.cutY 4352 .empty (.cutX 23936 (.cutY 4480 (.cutX 23872 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 23872 (.cutY 4544 .full (.cutX 23840 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 24000 (.cutY 4544 .full .full) (.cutY 4544 .full .full)))))) .empty) .empty) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 .empty (.cutY 8704 .empty (.cutX 28416 (.cutY 8960 (.cutX 28288 (.cutY 8832 (.cutX 28224 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 28224 (.cutY 8896 .full (.cutX 28192 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 28352 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata67 : 0<156282496 ∧ 17<128 ∧ 93<128 ∧ 0<4 ∧
    1980/4160=0 ∧ 1980%4160=1980 ∧ ∀ i, (leaves67 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData67).mp
    (by decide +kernel)

theorem sourceChecked67_0 : ∀ i : Fin 64,
    (fun i => output67 i = raw67 (source67 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked67 : ∀ i : Fin 64, (fun i => output67 i = raw67 (source67 i)) i :=
  forallFin_of_zero_offset (fun i => output67 i = raw67 (source67 i)) sourceChecked67_0

theorem coverChecked67_0 : ∀ i : Fin 64,
    (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked67 : ∀ i : Fin 64, (fun i => (output67 (cover67 i)).ContainsBox (raw67 i)) i :=
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 6594, atom 7197, type 1, source (30,97).
def leavesData68 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves68 : Fin 16 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 30 97 leaves68 i
def outputData68 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨7680,7744,24832,24896⟩) (.single ⟨7680,7744,24896,24960⟩)) (.node (.single ⟨7744,7808,24832,24896⟩) (.single ⟨7744,7808,24896,24960⟩))) (.node (.node (.single ⟨7680,7808,24960,25088⟩) (.single ⟨7808,7872,24832,24896⟩)) (.node (.single ⟨7808,7872,24896,24960⟩) (.single ⟨7872,7904,24832,24864⟩)))) (.node (.node (.node (.single ⟨7872,7904,24864,24896⟩) (.single ⟨7904,7936,24832,24864⟩)) (.node (.single ⟨7904,7936,24864,24896⟩) (.single ⟨7872,7936,24896,24960⟩))) (.node (.node (.single ⟨7808,7872,24960,25024⟩) (.single ⟨7808,7872,25024,25088⟩)) (.node (.single ⟨7872,7936,24960,25024⟩) (.single ⟨7872,7936,25024,25088⟩))))) (.node (.node (.node (.node (.single ⟨24832,24896,7680,7744⟩) (.single ⟨24832,24896,7744,7808⟩)) (.node (.single ⟨24896,24960,7680,7744⟩) (.single ⟨24896,24960,7744,7808⟩))) (.node (.node (.single ⟨24832,24896,7808,7872⟩) (.single ⟨24832,24864,7872,7904⟩)) (.node (.single ⟨24832,24864,7904,7936⟩) (.single ⟨24864,24896,7872,7904⟩)))) (.node (.node (.node (.single ⟨24864,24896,7904,7936⟩) (.single ⟨24896,24960,7808,7872⟩)) (.node (.single ⟨24896,24960,7872,7936⟩) (.single ⟨24960,25088,7680,7808⟩))) (.node (.node (.single ⟨24960,25024,7808,7872⟩) (.single ⟨24960,25024,7872,7936⟩)) (.node (.single ⟨25024,25088,7808,7872⟩) (.single ⟨25024,25088,7872,7936⟩))))))
def output68 : Fin 32 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5))))) (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15))) (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13)))) (.node (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))) (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12)))))) (.node (.node (.node (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3))) (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData68 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))))) (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 9)) (.node (.single 6) (.single 1))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18))))))
def cover68 (i : Fin 64) : Fin 32 := ⟨coverData68.get i % 32, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 32) : Fin 64 := ⟨sourceData68.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 .empty (.cutY 25088 (.cutX 7936 (.cutY 24832 .empty (.cutX 7808 (.cutY 24960 (.cutX 7744 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 7872 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 7904 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) (.cutX 7872 (.cutY 25024 .full .full) (.cutY 25024 .full .full))))) .empty) .empty)) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 (.cutY 7680 .empty (.cutX 24832 .empty (.cutY 7936 (.cutX 24960 (.cutY 7808 (.cutX 24896 (.cutY 7744 .full .full) (.cutY 7744 .full .full)) (.cutX 24896 (.cutY 7872 .full (.cutX 24864 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 25024 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))) .empty)) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata68 : 0<48020332 ∧ 30<128 ∧ 97<128 ∧ 1<4 ∧
    7197/4160=1 ∧ 7197%4160=3037 ∧ ∀ i, (leaves68 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData68).mp
    (by decide +kernel)

theorem sourceChecked68_0 : ∀ i : Fin 32,
    (fun i => output68 i = raw68 (source68 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked68 : ∀ i : Fin 32, (fun i => output68 i = raw68 (source68 i)) i :=
  forallFin_of_zero_offset (fun i => output68 i = raw68 (source68 i)) sourceChecked68_0

theorem coverChecked68_0 : ∀ i : Fin 64,
    (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked68 : ∀ i : Fin 64, (fun i => (output68 (cover68 i)).ContainsBox (raw68 i)) i :=
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

theorem areaUnits68 : gridUnionAreaUnits output68 = 131072 := by decide +kernel

noncomputable def phaseMass68 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (12005083/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 6595, atom 2074, type 0, source (18,94).
def leavesData69 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves69 : Fin 16 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 18 94 leaves69 i
def outputData69 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,24064,24128⟩) (.single ⟨4608,4672,24128,24192⟩)) (.node (.single ⟨4672,4736,24064,24128⟩) (.single ⟨4672,4736,24128,24192⟩))) (.node (.node (.single ⟨4608,4736,24192,24320⟩) (.single ⟨4736,4800,24064,24128⟩)) (.node (.single ⟨4736,4800,24128,24192⟩) (.single ⟨4800,4832,24064,24096⟩)))) (.node (.node (.node (.single ⟨4800,4832,24096,24128⟩) (.single ⟨4832,4864,24064,24096⟩)) (.node (.single ⟨4832,4864,24096,24128⟩) (.single ⟨4800,4864,24128,24192⟩))) (.node (.node (.single ⟨4736,4800,24192,24256⟩) (.single ⟨4736,4800,24256,24320⟩)) (.node (.single ⟨4800,4864,24192,24256⟩) (.single ⟨4800,4864,24256,24320⟩))))) (.node (.node (.node (.node (.single ⟨8448,8512,27904,27968⟩) (.single ⟨8448,8512,27968,28032⟩)) (.node (.single ⟨8512,8576,27904,27968⟩) (.single ⟨8512,8576,27968,28032⟩))) (.node (.node (.single ⟨8448,8576,28032,28160⟩) (.single ⟨8576,8640,27904,27968⟩)) (.node (.single ⟨8576,8640,27968,28032⟩) (.single ⟨8640,8672,27904,27936⟩)))) (.node (.node (.node (.single ⟨8640,8672,27936,27968⟩) (.single ⟨8672,8704,27904,27936⟩)) (.node (.single ⟨8672,8704,27936,27968⟩) (.single ⟨8640,8704,27968,28032⟩))) (.node (.node (.single ⟨8576,8640,28032,28096⟩) (.single ⟨8576,8640,28096,28160⟩)) (.node (.single ⟨8640,8704,28032,28096⟩) (.single ⟨8640,8704,28096,28160⟩)))))) (.node (.node (.node (.node (.node (.single ⟨24064,24128,4608,4672⟩) (.single ⟨24064,24128,4672,4736⟩)) (.node (.single ⟨24128,24192,4608,4672⟩) (.single ⟨24128,24192,4672,4736⟩))) (.node (.node (.single ⟨24064,24128,4736,4800⟩) (.single ⟨24064,24096,4800,4832⟩)) (.node (.single ⟨24064,24096,4832,4864⟩) (.single ⟨24096,24128,4800,4832⟩)))) (.node (.node (.node (.single ⟨24096,24128,4832,4864⟩) (.single ⟨24128,24192,4736,4800⟩)) (.node (.single ⟨24128,24192,4800,4864⟩) (.single ⟨24192,24320,4608,4736⟩))) (.node (.node (.single ⟨24192,24256,4736,4800⟩) (.single ⟨24192,24256,4800,4864⟩)) (.node (.single ⟨24256,24320,4736,4800⟩) (.single ⟨24256,24320,4800,4864⟩))))) (.node (.node (.node (.node (.single ⟨27904,27968,8448,8512⟩) (.single ⟨27904,27968,8512,8576⟩)) (.node (.single ⟨27968,28032,8448,8512⟩) (.single ⟨27968,28032,8512,8576⟩))) (.node (.node (.single ⟨27904,27968,8576,8640⟩) (.single ⟨27904,27936,8640,8672⟩)) (.node (.single ⟨27904,27936,8672,8704⟩) (.single ⟨27936,27968,8640,8672⟩)))) (.node (.node (.node (.single ⟨27936,27968,8672,8704⟩) (.single ⟨27968,28032,8576,8640⟩)) (.node (.single ⟨27968,28032,8640,8704⟩) (.single ⟨28032,28160,8448,8576⟩))) (.node (.node (.single ⟨28032,28096,8576,8640⟩) (.single ⟨28032,28096,8640,8704⟩)) (.node (.single ⟨28096,28160,8576,8640⟩) (.single ⟨28096,28160,8640,8704⟩)))))))
def output69 : Fin 64 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData69 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover69 (i : Fin 64) : Fin 64 := ⟨coverData69.get i % 64, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 64) : Fin 64 := ⟨sourceData69.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 (.cutY 24320 (.cutX 4736 (.cutY 24192 (.cutX 4672 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 4800 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 4832 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 4800 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty) .empty)))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 .empty (.cutY 27904 .empty (.cutX 8576 (.cutY 28032 (.cutX 8512 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 8640 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 8672 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 8640 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 (.cutY 4864 (.cutX 24192 (.cutY 4736 (.cutX 24128 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 24128 (.cutY 4800 .full (.cutX 24096 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 24256 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty) .empty))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 .empty (.cutY 8448 .empty (.cutX 28032 (.cutY 8576 (.cutX 27968 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 27968 (.cutY 8640 .full (.cutX 27936 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 28096 (.cutY 8640 .full .full) (.cutY 8640 .full .full)))))) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata69 : 0<156282496 ∧ 18<128 ∧ 94<128 ∧ 0<4 ∧
    2074/4160=0 ∧ 2074%4160=2074 ∧ ∀ i, (leaves69 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData69).mp
    (by decide +kernel)

theorem sourceChecked69_0 : ∀ i : Fin 64,
    (fun i => output69 i = raw69 (source69 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked69 : ∀ i : Fin 64, (fun i => output69 i = raw69 (source69 i)) i :=
  forallFin_of_zero_offset (fun i => output69 i = raw69 (source69 i)) sourceChecked69_0

theorem coverChecked69_0 : ∀ i : Fin 64,
    (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked69 : ∀ i : Fin 64, (fun i => (output69 (cover69 i)).ContainsBox (raw69 i)) i :=
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 6596, atom 6669, type 1, source (23,94).
def leavesData70 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves70 : Fin 13 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 94 leaves70 i
def outputData70 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,24064,24128⟩) (.node (.single ⟨5888,5952,24128,24192⟩) (.single ⟨5952,6016,24064,24128⟩))) (.node (.single ⟨5952,6016,24128,24192⟩) (.node (.single ⟨5888,6016,24192,24320⟩) (.single ⟨6016,6080,24064,24128⟩)))) (.node (.node (.single ⟨6016,6080,24128,24192⟩) (.node (.single ⟨6080,6112,24064,24096⟩) (.single ⟨6080,6112,24096,24128⟩))) (.node (.node (.single ⟨6112,6144,24064,24096⟩) (.single ⟨6112,6144,24096,24128⟩)) (.node (.single ⟨6080,6144,24128,24192⟩) (.single ⟨6016,6144,24192,24320⟩))))) (.node (.node (.node (.single ⟨8448,8576,26624,26752⟩) (.node (.single ⟨8448,8576,26752,26880⟩) (.single ⟨8576,8640,26624,26688⟩))) (.node (.single ⟨8576,8640,26688,26752⟩) (.node (.single ⟨8640,8672,26624,26656⟩) (.single ⟨8640,8672,26656,26688⟩)))) (.node (.node (.single ⟨8672,8704,26624,26656⟩) (.node (.single ⟨8672,8704,26656,26688⟩) (.single ⟨8640,8704,26688,26752⟩))) (.node (.node (.single ⟨8576,8640,26752,26816⟩) (.single ⟨8576,8640,26816,26880⟩)) (.node (.single ⟨8640,8704,26752,26816⟩) (.single ⟨8640,8704,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24128,5888,5952⟩) (.node (.single ⟨24064,24128,5952,6016⟩) (.single ⟨24128,24192,5888,5952⟩))) (.node (.single ⟨24128,24192,5952,6016⟩) (.node (.single ⟨24064,24128,6016,6080⟩) (.single ⟨24064,24096,6080,6112⟩)))) (.node (.node (.single ⟨24064,24096,6112,6144⟩) (.node (.single ⟨24096,24128,6080,6112⟩) (.single ⟨24096,24128,6112,6144⟩))) (.node (.node (.single ⟨24128,24192,6016,6080⟩) (.single ⟨24128,24192,6080,6144⟩)) (.node (.single ⟨24192,24320,5888,6016⟩) (.single ⟨24192,24320,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,8448,8576⟩) (.node (.single ⟨26624,26688,8576,8640⟩) (.single ⟨26624,26656,8640,8672⟩))) (.node (.single ⟨26624,26656,8672,8704⟩) (.node (.single ⟨26656,26688,8640,8672⟩) (.single ⟨26656,26688,8672,8704⟩)))) (.node (.node (.single ⟨26688,26752,8576,8640⟩) (.node (.single ⟨26688,26752,8640,8704⟩) (.single ⟨26752,26880,8448,8576⟩))) (.node (.node (.single ⟨26752,26816,8576,8640⟩) (.single ⟨26752,26816,8640,8704⟩)) (.node (.single ⟨26816,26880,8576,8640⟩) (.single ⟨26816,26880,8640,8704⟩)))))))
def output70 : Fin 52 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData70 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover70 (i : Fin 52) : Fin 52 := ⟨coverData70.get i % 52, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 52) : Fin 52 := ⟨sourceData70.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 .empty (.cutY 24064 .empty (.cutX 5888 .empty (.cutY 24320 (.cutX 6016 (.cutY 24192 (.cutX 5952 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full) (.cutY 24192 (.cutX 6080 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 6112 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) .full)) .empty))))))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 (.cutY 27136 (.cutX 8448 .empty (.cutY 26880 (.cutX 8576 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 8640 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 8672 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 8640 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 .empty (.cutY 5632 .empty (.cutX 24320 (.cutY 5888 .empty (.cutX 24192 (.cutY 6016 (.cutX 24128 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 24128 (.cutY 6080 .full (.cutX 24096 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty))))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 (.cutY 8704 (.cutX 26880 (.cutY 8448 .empty (.cutX 26752 (.cutY 8576 .full (.cutX 26688 (.cutY 8640 .full (.cutX 26656 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full (.cutX 26816 (.cutY 8640 .full .full) (.cutY 8640 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata70 : 0<192153497 ∧ 23<128 ∧ 94<128 ∧ 1<4 ∧
    6669/4160=1 ∧ 6669%4160=2509 ∧ ∀ i, (leaves70 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData70).mp
    (by decide +kernel)

theorem sourceChecked70_0 : ∀ i : Fin 52,
    (fun i => output70 i = raw70 (source70 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked70 : ∀ i : Fin 52, (fun i => output70 i = raw70 (source70 i)) i :=
  forallFin_of_zero_offset (fun i => output70 i = raw70 (source70 i)) sourceChecked70_0

theorem coverChecked70_0 : ∀ i : Fin 52,
    (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked70 : ∀ i : Fin 52, (fun i => (output70 (cover70 i)).ContainsBox (raw70 i)) i :=
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 6597, atom 6500, type 1, source (21,93).
def leavesData71 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves71 : Fin 16 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 21 93 leaves71 i
def outputData71 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5376,5440,23808,23872⟩) (.single ⟨5376,5440,23872,23936⟩)) (.node (.single ⟨5440,5504,23808,23872⟩) (.single ⟨5440,5504,23872,23936⟩))) (.node (.node (.single ⟨5376,5504,23936,24064⟩) (.single ⟨5504,5568,23808,23872⟩)) (.node (.single ⟨5504,5568,23872,23936⟩) (.single ⟨5568,5600,23808,23840⟩)))) (.node (.node (.node (.single ⟨5568,5600,23840,23872⟩) (.single ⟨5600,5632,23808,23840⟩)) (.node (.single ⟨5600,5632,23840,23872⟩) (.single ⟨5568,5632,23872,23936⟩))) (.node (.node (.single ⟨5504,5568,23936,24000⟩) (.single ⟨5504,5568,24000,24064⟩)) (.node (.single ⟨5568,5632,23936,24000⟩) (.single ⟨5568,5632,24000,24064⟩))))) (.node (.node (.node (.node (.single ⟨8704,8768,27136,27200⟩) (.single ⟨8704,8768,27200,27264⟩)) (.node (.single ⟨8768,8832,27136,27200⟩) (.single ⟨8768,8832,27200,27264⟩))) (.node (.node (.single ⟨8704,8832,27264,27392⟩) (.single ⟨8832,8896,27136,27200⟩)) (.node (.single ⟨8832,8896,27200,27264⟩) (.single ⟨8896,8928,27136,27168⟩)))) (.node (.node (.node (.single ⟨8896,8928,27168,27200⟩) (.single ⟨8928,8960,27136,27168⟩)) (.node (.single ⟨8928,8960,27168,27200⟩) (.single ⟨8896,8960,27200,27264⟩))) (.node (.node (.single ⟨8832,8896,27264,27328⟩) (.single ⟨8832,8896,27328,27392⟩)) (.node (.single ⟨8896,8960,27264,27328⟩) (.single ⟨8896,8960,27328,27392⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23808,23872,5376,5440⟩) (.single ⟨23808,23872,5440,5504⟩)) (.node (.single ⟨23872,23936,5376,5440⟩) (.single ⟨23872,23936,5440,5504⟩))) (.node (.node (.single ⟨23808,23872,5504,5568⟩) (.single ⟨23808,23840,5568,5600⟩)) (.node (.single ⟨23808,23840,5600,5632⟩) (.single ⟨23840,23872,5568,5600⟩)))) (.node (.node (.node (.single ⟨23840,23872,5600,5632⟩) (.single ⟨23872,23936,5504,5568⟩)) (.node (.single ⟨23872,23936,5568,5632⟩) (.single ⟨23936,24064,5376,5504⟩))) (.node (.node (.single ⟨23936,24000,5504,5568⟩) (.single ⟨23936,24000,5568,5632⟩)) (.node (.single ⟨24000,24064,5504,5568⟩) (.single ⟨24000,24064,5568,5632⟩))))) (.node (.node (.node (.node (.single ⟨27136,27200,8704,8768⟩) (.single ⟨27136,27200,8768,8832⟩)) (.node (.single ⟨27200,27264,8704,8768⟩) (.single ⟨27200,27264,8768,8832⟩))) (.node (.node (.single ⟨27136,27200,8832,8896⟩) (.single ⟨27136,27168,8896,8928⟩)) (.node (.single ⟨27136,27168,8928,8960⟩) (.single ⟨27168,27200,8896,8928⟩)))) (.node (.node (.node (.single ⟨27168,27200,8928,8960⟩) (.single ⟨27200,27264,8832,8896⟩)) (.node (.single ⟨27200,27264,8896,8960⟩) (.single ⟨27264,27392,8704,8832⟩))) (.node (.node (.single ⟨27264,27328,8832,8896⟩) (.single ⟨27264,27328,8896,8960⟩)) (.node (.single ⟨27328,27392,8832,8896⟩) (.single ⟨27328,27392,8896,8960⟩)))))))
def output71 : Fin 64 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData71 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover71 (i : Fin 64) : Fin 64 := ⟨coverData71.get i % 64, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 64) : Fin 64 := ⟨sourceData71.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 .empty (.cutY 23552 .empty (.cutX 5632 (.cutY 24064 (.cutX 5376 .empty (.cutY 23808 .empty (.cutX 5504 (.cutY 23936 (.cutX 5440 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full) (.cutY 23936 (.cutX 5568 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 5600 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 5568 (.cutY 24000 .full .full) (.cutY 24000 .full .full)))))) .empty) .empty)))) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 (.cutX 8704 .empty (.cutY 27136 .empty (.cutX 8960 (.cutY 27392 (.cutX 8832 (.cutY 27264 (.cutX 8768 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full) (.cutY 27264 (.cutX 8896 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 8928 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 8896 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 .empty (.cutX 24064 (.cutY 5632 (.cutX 23808 .empty (.cutY 5376 .empty (.cutX 23936 (.cutY 5504 (.cutX 23872 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 23872 (.cutY 5568 .full (.cutX 23840 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full (.cutX 24000 (.cutY 5568 .full .full) (.cutY 5568 .full .full)))))) .empty) .empty))) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 (.cutY 9216 (.cutX 27136 .empty (.cutY 8704 .empty (.cutX 27392 (.cutY 8960 (.cutX 27264 (.cutY 8832 (.cutX 27200 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 27200 (.cutY 8896 .full (.cutX 27168 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full (.cutX 27328 (.cutY 8896 .full .full) (.cutY 8896 .full .full)))) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty))) .empty))

theorem metadata71 : 0<192153497 ∧ 21<128 ∧ 93<128 ∧ 1<4 ∧
    6500/4160=1 ∧ 6500%4160=2340 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 64,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 64, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) sourceChecked71_0

theorem coverChecked71_0 : ∀ i : Fin 64,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 64, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 6598, atom 7056, type 1, source (28,96).
def leavesData72 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves72 : Fin 13 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 28 96 leaves72 i
def outputData72 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7168,7232,24576,24640⟩) (.node (.single ⟨7168,7232,24640,24704⟩) (.single ⟨7232,7296,24576,24640⟩))) (.node (.single ⟨7232,7296,24640,24704⟩) (.node (.single ⟨7168,7296,24704,24832⟩) (.single ⟨7296,7360,24576,24640⟩)))) (.node (.node (.single ⟨7296,7360,24640,24704⟩) (.node (.single ⟨7360,7392,24576,24608⟩) (.single ⟨7360,7392,24608,24640⟩))) (.node (.node (.single ⟨7392,7424,24576,24608⟩) (.single ⟨7392,7424,24608,24640⟩)) (.node (.single ⟨7360,7424,24640,24704⟩) (.single ⟨7296,7424,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,25344,25472⟩) (.node (.single ⟨7936,8064,25472,25600⟩) (.single ⟨8064,8128,25344,25408⟩))) (.node (.single ⟨8064,8128,25408,25472⟩) (.node (.single ⟨8128,8160,25344,25376⟩) (.single ⟨8128,8160,25376,25408⟩)))) (.node (.node (.single ⟨8160,8192,25344,25376⟩) (.node (.single ⟨8160,8192,25376,25408⟩) (.single ⟨8128,8192,25408,25472⟩))) (.node (.node (.single ⟨8064,8128,25472,25536⟩) (.single ⟨8064,8128,25536,25600⟩)) (.node (.single ⟨8128,8192,25472,25536⟩) (.single ⟨8128,8192,25536,25600⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,7168,7232⟩) (.node (.single ⟨24576,24640,7232,7296⟩) (.single ⟨24640,24704,7168,7232⟩))) (.node (.single ⟨24640,24704,7232,7296⟩) (.node (.single ⟨24576,24640,7296,7360⟩) (.single ⟨24576,24608,7360,7392⟩)))) (.node (.node (.single ⟨24576,24608,7392,7424⟩) (.node (.single ⟨24608,24640,7360,7392⟩) (.single ⟨24608,24640,7392,7424⟩))) (.node (.node (.single ⟨24640,24704,7296,7360⟩) (.single ⟨24640,24704,7360,7424⟩)) (.node (.single ⟨24704,24832,7168,7296⟩) (.single ⟨24704,24832,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,7936,8064⟩) (.node (.single ⟨25344,25408,8064,8128⟩) (.single ⟨25344,25376,8128,8160⟩))) (.node (.single ⟨25344,25376,8160,8192⟩) (.node (.single ⟨25376,25408,8128,8160⟩) (.single ⟨25376,25408,8160,8192⟩)))) (.node (.node (.single ⟨25408,25472,8064,8128⟩) (.node (.single ⟨25408,25472,8128,8192⟩) (.single ⟨25472,25600,7936,8064⟩))) (.node (.node (.single ⟨25472,25536,8064,8128⟩) (.single ⟨25472,25536,8128,8192⟩)) (.node (.single ⟨25536,25600,8064,8128⟩) (.single ⟨25536,25600,8128,8192⟩)))))))
def output72 : Fin 52 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover72 (i : Fin 52) : Fin 52 := ⟨coverData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 52) : Fin 52 := ⟨sourceData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 .empty (.cutY 25600 (.cutX 7680 (.cutY 25088 (.cutX 7424 (.cutY 24832 (.cutX 7296 (.cutY 24704 (.cutX 7232 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 7360 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 7392 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty) (.cutY 25088 .empty (.cutX 7936 .empty (.cutY 25344 .empty (.cutX 8064 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 8128 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 8160 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 8128 (.cutY 25536 .full .full) (.cutY 25536 .full .full)))))))) .empty)) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 .empty (.cutX 25088 (.cutY 7680 (.cutX 24832 (.cutY 7424 (.cutX 24704 (.cutY 7296 (.cutX 24640 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 24640 (.cutY 7360 .full (.cutX 24608 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) (.cutY 7680 .empty (.cutX 25344 .empty (.cutY 7936 .empty (.cutX 25472 (.cutY 8064 .full (.cutX 25408 (.cutY 8128 .full (.cutX 25376 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 25536 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))))))) .empty)) .empty)) .empty) .empty)) .empty))

theorem metadata72 : 0<48020332 ∧ 28<128 ∧ 96<128 ∧ 1<4 ∧
    7056/4160=1 ∧ 7056%4160=2896 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 6599, atom 2166, type 0, source (19,95).
def leavesData73 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves73 : Fin 13 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 95 leaves73 i
def outputData73 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,24320,24384⟩) (.node (.single ⟨4864,4928,24384,24448⟩) (.single ⟨4928,4992,24320,24384⟩))) (.node (.single ⟨4928,4992,24384,24448⟩) (.node (.single ⟨4864,4992,24448,24576⟩) (.single ⟨4992,5056,24320,24384⟩)))) (.node (.node (.single ⟨4992,5056,24384,24448⟩) (.node (.single ⟨5056,5088,24320,24352⟩) (.single ⟨5056,5088,24352,24384⟩))) (.node (.node (.single ⟨5088,5120,24320,24352⟩) (.single ⟨5088,5120,24352,24384⟩)) (.node (.single ⟨5056,5120,24384,24448⟩) (.single ⟨4992,5120,24448,24576⟩))))) (.node (.node (.node (.single ⟨8192,8320,27648,27776⟩) (.node (.single ⟨8192,8320,27776,27904⟩) (.single ⟨8320,8384,27648,27712⟩))) (.node (.single ⟨8320,8384,27712,27776⟩) (.node (.single ⟨8384,8416,27648,27680⟩) (.single ⟨8384,8416,27680,27712⟩)))) (.node (.node (.single ⟨8416,8448,27648,27680⟩) (.node (.single ⟨8416,8448,27680,27712⟩) (.single ⟨8384,8448,27712,27776⟩))) (.node (.node (.single ⟨8320,8384,27776,27840⟩) (.single ⟨8320,8384,27840,27904⟩)) (.node (.single ⟨8384,8448,27776,27840⟩) (.single ⟨8384,8448,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨24320,24384,4864,4928⟩) (.node (.single ⟨24320,24384,4928,4992⟩) (.single ⟨24384,24448,4864,4928⟩))) (.node (.single ⟨24384,24448,4928,4992⟩) (.node (.single ⟨24320,24384,4992,5056⟩) (.single ⟨24320,24352,5056,5088⟩)))) (.node (.node (.single ⟨24320,24352,5088,5120⟩) (.node (.single ⟨24352,24384,5056,5088⟩) (.single ⟨24352,24384,5088,5120⟩))) (.node (.node (.single ⟨24384,24448,4992,5056⟩) (.single ⟨24384,24448,5056,5120⟩)) (.node (.single ⟨24448,24576,4864,4992⟩) (.single ⟨24448,24576,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,8192,8320⟩) (.node (.single ⟨27648,27712,8320,8384⟩) (.single ⟨27648,27680,8384,8416⟩))) (.node (.single ⟨27648,27680,8416,8448⟩) (.node (.single ⟨27680,27712,8384,8416⟩) (.single ⟨27680,27712,8416,8448⟩)))) (.node (.node (.single ⟨27712,27776,8320,8384⟩) (.node (.single ⟨27712,27776,8384,8448⟩) (.single ⟨27776,27904,8192,8320⟩))) (.node (.node (.single ⟨27776,27840,8320,8384⟩) (.single ⟨27776,27840,8384,8448⟩)) (.node (.single ⟨27840,27904,8320,8384⟩) (.single ⟨27840,27904,8384,8448⟩)))))))
def output73 : Fin 52 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData73 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover73 (i : Fin 52) : Fin 52 := ⟨coverData73.get i % 52, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 52) : Fin 52 := ⟨sourceData73.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 .empty (.cutX 4608 .empty (.cutY 24064 .empty (.cutX 4864 .empty (.cutY 24320 .empty (.cutX 4992 (.cutY 24448 (.cutX 4928 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full) (.cutY 24448 (.cutX 5056 (.cutY 24384 .full .full) (.cutY 24384 (.cutX 5088 (.cutY 24352 .full .full) (.cutY 24352 .full .full)) .full)) .full))))))) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 (.cutY 27648 .empty (.cutX 8704 (.cutY 28160 (.cutX 8448 (.cutY 27904 (.cutX 8320 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 8384 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 8416 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 8384 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 .empty (.cutY 5120 (.cutX 24064 .empty (.cutY 4608 .empty (.cutX 24320 .empty (.cutY 4864 .empty (.cutX 24448 (.cutY 4992 (.cutX 24384 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 24384 (.cutY 5056 .full (.cutX 24352 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty)) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 (.cutX 28160 (.cutY 8704 (.cutX 27904 (.cutY 8448 (.cutX 27776 (.cutY 8320 .full (.cutX 27712 (.cutY 8384 .full (.cutX 27680 (.cutY 8416 .full .full) (.cutY 8416 .full .full))) (.cutY 8384 .full .full))) (.cutY 8320 .full (.cutX 27840 (.cutY 8384 .full .full) (.cutY 8384 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty))) .empty))

theorem metadata73 : 0<156282496 ∧ 19<128 ∧ 95<128 ∧ 0<4 ∧
    2166/4160=0 ∧ 2166%4160=2166 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 52,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 52, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) sourceChecked73_0

theorem coverChecked73_0 : ∀ i : Fin 52,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 52, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (156282496/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (1220957/12800000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 6600, atom 6830, type 1, source (25,95).
def leavesData74 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves74 : Fin 10 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 95 leaves74 i
def outputData74 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,24320,24384⟩) (.single ⟨6400,6464,24384,24448⟩)) (.node (.single ⟨6464,6528,24320,24384⟩) (.node (.single ⟨6464,6528,24384,24448⟩) (.single ⟨6400,6528,24448,24576⟩)))) (.node (.node (.single ⟨6528,6592,24320,24384⟩) (.single ⟨6528,6592,24384,24448⟩)) (.node (.single ⟨6592,6656,24320,24384⟩) (.node (.single ⟨6592,6656,24384,24448⟩) (.single ⟨6528,6656,24448,24576⟩))))) (.node (.node (.node (.single ⟨8192,8320,26112,26240⟩) (.single ⟨8192,8320,26240,26368⟩)) (.node (.single ⟨8320,8384,26112,26176⟩) (.node (.single ⟨8320,8384,26176,26240⟩) (.single ⟨8384,8448,26112,26176⟩)))) (.node (.node (.single ⟨8384,8448,26176,26240⟩) (.single ⟨8320,8384,26240,26304⟩)) (.node (.single ⟨8320,8384,26304,26368⟩) (.node (.single ⟨8384,8448,26240,26304⟩) (.single ⟨8384,8448,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨24320,24384,6400,6464⟩) (.single ⟨24320,24384,6464,6528⟩)) (.node (.single ⟨24384,24448,6400,6464⟩) (.node (.single ⟨24384,24448,6464,6528⟩) (.single ⟨24320,24384,6528,6592⟩)))) (.node (.node (.single ⟨24320,24384,6592,6656⟩) (.single ⟨24384,24448,6528,6592⟩)) (.node (.single ⟨24384,24448,6592,6656⟩) (.node (.single ⟨24448,24576,6400,6528⟩) (.single ⟨24448,24576,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,8192,8320⟩) (.single ⟨26112,26176,8320,8384⟩)) (.node (.single ⟨26112,26176,8384,8448⟩) (.node (.single ⟨26176,26240,8320,8384⟩) (.single ⟨26176,26240,8384,8448⟩)))) (.node (.node (.single ⟨26240,26368,8192,8320⟩) (.single ⟨26240,26304,8320,8384⟩)) (.node (.single ⟨26240,26304,8384,8448⟩) (.node (.single ⟨26304,26368,8320,8384⟩) (.single ⟨26304,26368,8384,8448⟩)))))))
def output74 : Fin 40 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData74 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover74 (i : Fin 40) : Fin 40 := ⟨coverData74.get i % 40, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 40) : Fin 40 := ⟨sourceData74.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 .empty (.cutX 6656 (.cutY 24064 .empty (.cutX 6400 .empty (.cutY 24320 .empty (.cutX 6528 (.cutY 24448 (.cutX 6464 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full) (.cutY 24448 (.cutX 6592 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))) .empty)) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 (.cutY 25600 .empty (.cutX 8704 (.cutY 26112 .empty (.cutX 8448 (.cutY 26368 (.cutX 8320 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 8384 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 8384 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 .empty (.cutY 7168 (.cutX 24064 .empty (.cutY 6656 (.cutX 24320 .empty (.cutY 6400 .empty (.cutX 24448 (.cutY 6528 (.cutX 24384 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 24384 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty)) .empty)))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 (.cutX 26112 .empty (.cutY 8704 (.cutX 26368 (.cutY 8448 (.cutX 26240 (.cutY 8320 .full (.cutX 26176 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full (.cutX 26304 (.cutY 8384 .full .full) (.cutY 8384 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty))

theorem metadata74 : 0<149239428 ∧ 25<128 ∧ 95<128 ∧ 1<4 ∧
    6830/4160=1 ∧ 6830%4160=2670 ∧ ∀ i, (leaves74 i).Valid 8 := by
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 6601, atom 5938, type 1, source (15,83).
def leavesData75 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves75 : Fin 13 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 83 leaves75 i
def outputData75 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,21248,21376⟩) (.node (.single ⟨3840,3968,21376,21504⟩) (.single ⟨3968,4032,21248,21312⟩))) (.node (.single ⟨3968,4032,21312,21376⟩) (.node (.single ⟨4032,4064,21248,21280⟩) (.single ⟨4032,4064,21280,21312⟩)))) (.node (.node (.single ⟨4064,4096,21248,21280⟩) (.node (.single ⟨4064,4096,21280,21312⟩) (.single ⟨4032,4096,21312,21376⟩))) (.node (.node (.single ⟨3968,4032,21376,21440⟩) (.single ⟨3968,4032,21440,21504⟩)) (.node (.single ⟨4032,4096,21376,21440⟩) (.single ⟨4032,4096,21440,21504⟩))))) (.node (.node (.node (.single ⟨11264,11328,28672,28736⟩) (.node (.single ⟨11264,11328,28736,28800⟩) (.single ⟨11328,11392,28672,28736⟩))) (.node (.single ⟨11328,11392,28736,28800⟩) (.node (.single ⟨11264,11392,28800,28928⟩) (.single ⟨11392,11456,28672,28736⟩)))) (.node (.node (.single ⟨11392,11456,28736,28800⟩) (.node (.single ⟨11456,11488,28672,28704⟩) (.single ⟨11456,11488,28704,28736⟩))) (.node (.node (.single ⟨11488,11520,28672,28704⟩) (.single ⟨11488,11520,28704,28736⟩)) (.node (.single ⟨11456,11520,28736,28800⟩) (.single ⟨11392,11520,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,3840,3968⟩) (.node (.single ⟨21248,21312,3968,4032⟩) (.single ⟨21248,21280,4032,4064⟩))) (.node (.single ⟨21248,21280,4064,4096⟩) (.node (.single ⟨21280,21312,4032,4064⟩) (.single ⟨21280,21312,4064,4096⟩)))) (.node (.node (.single ⟨21312,21376,3968,4032⟩) (.node (.single ⟨21312,21376,4032,4096⟩) (.single ⟨21376,21504,3840,3968⟩))) (.node (.node (.single ⟨21376,21440,3968,4032⟩) (.single ⟨21376,21440,4032,4096⟩)) (.node (.single ⟨21440,21504,3968,4032⟩) (.single ⟨21440,21504,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,11264,11328⟩) (.node (.single ⟨28672,28736,11328,11392⟩) (.single ⟨28736,28800,11264,11328⟩))) (.node (.single ⟨28736,28800,11328,11392⟩) (.node (.single ⟨28672,28736,11392,11456⟩) (.single ⟨28672,28704,11456,11488⟩)))) (.node (.node (.single ⟨28672,28704,11488,11520⟩) (.node (.single ⟨28704,28736,11456,11488⟩) (.single ⟨28704,28736,11488,11520⟩))) (.node (.node (.single ⟨28736,28800,11392,11456⟩) (.single ⟨28736,28800,11456,11520⟩)) (.node (.single ⟨28800,28928,11264,11392⟩) (.single ⟨28800,28928,11392,11520⟩)))))))
def output75 : Fin 52 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover75 (i : Fin 52) : Fin 52 := ⟨coverData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 52) : Fin 52 := ⟨sourceData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 .empty (.cutX 3840 .empty (.cutY 21248 .empty (.cutX 3968 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 4032 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 4064 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) (.cutX 4032 (.cutY 21440 .full .full) (.cutY 21440 .full .full)))))))) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 (.cutX 11520 (.cutY 28928 (.cutX 11392 (.cutY 28800 (.cutX 11328 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 11456 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 11488 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 .empty (.cutX 21248 .empty (.cutY 3840 .empty (.cutX 21376 (.cutY 3968 .full (.cutX 21312 (.cutY 4032 .full (.cutX 21280 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 21440 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))))))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 (.cutX 28928 (.cutY 11520 (.cutX 28800 (.cutY 11392 (.cutX 28736 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 28736 (.cutY 11456 .full (.cutX 28704 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata75 : 0<139307719 ∧ 15<128 ∧ 83<128 ∧ 1<4 ∧
    5938/4160=1 ∧ 5938%4160=1778 ∧ ∀ i, (leaves75 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData75).mp
    (by decide +kernel)

theorem sourceChecked75_0 : ∀ i : Fin 52,
    (fun i => output75 i = raw75 (source75 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked75 : ∀ i : Fin 52, (fun i => output75 i = raw75 (source75 i)) i :=
  forallFin_of_zero_offset (fun i => output75 i = raw75 (source75 i)) sourceChecked75_0

theorem coverChecked75_0 : ∀ i : Fin 52,
    (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked75 : ∀ i : Fin 52, (fun i => (output75 (cover75 i)).ContainsBox (raw75 i)) i :=
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 6602, atom 1683, type 0, source (14,87).
def leavesData76 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves76 : Fin 10 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 14 87 leaves76 i
def outputData76 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,22272,22400⟩) (.single ⟨3584,3712,22400,22528⟩)) (.node (.single ⟨3712,3776,22272,22336⟩) (.node (.single ⟨3712,3776,22336,22400⟩) (.single ⟨3776,3840,22272,22336⟩)))) (.node (.node (.single ⟨3776,3840,22336,22400⟩) (.single ⟨3712,3776,22400,22464⟩)) (.node (.single ⟨3712,3776,22464,22528⟩) (.node (.single ⟨3776,3840,22400,22464⟩) (.single ⟨3776,3840,22464,22528⟩))))) (.node (.node (.node (.single ⟨10240,10304,28928,28992⟩) (.single ⟨10240,10304,28992,29056⟩)) (.node (.single ⟨10304,10368,28928,28992⟩) (.node (.single ⟨10304,10368,28992,29056⟩) (.single ⟨10240,10368,29056,29184⟩)))) (.node (.node (.single ⟨10368,10432,28928,28992⟩) (.single ⟨10368,10432,28992,29056⟩)) (.node (.single ⟨10432,10496,28928,28992⟩) (.node (.single ⟨10432,10496,28992,29056⟩) (.single ⟨10368,10496,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,3584,3712⟩) (.single ⟨22272,22336,3712,3776⟩)) (.node (.single ⟨22272,22336,3776,3840⟩) (.node (.single ⟨22336,22400,3712,3776⟩) (.single ⟨22336,22400,3776,3840⟩)))) (.node (.node (.single ⟨22400,22528,3584,3712⟩) (.single ⟨22400,22464,3712,3776⟩)) (.node (.single ⟨22400,22464,3776,3840⟩) (.node (.single ⟨22464,22528,3712,3776⟩) (.single ⟨22464,22528,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,10240,10304⟩) (.single ⟨28928,28992,10304,10368⟩)) (.node (.single ⟨28992,29056,10240,10304⟩) (.node (.single ⟨28992,29056,10304,10368⟩) (.single ⟨28928,28992,10368,10432⟩)))) (.node (.node (.single ⟨28928,28992,10432,10496⟩) (.single ⟨28992,29056,10368,10432⟩)) (.node (.single ⟨28992,29056,10432,10496⟩) (.node (.single ⟨29056,29184,10240,10368⟩) (.single ⟨29056,29184,10368,10496⟩)))))))
def output76 : Fin 40 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover76 (i : Fin 40) : Fin 40 := ⟨coverData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 40) : Fin 40 := ⟨sourceData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 .empty (.cutY 22016 .empty (.cutX 3840 (.cutY 22272 .empty (.cutX 3712 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 3776 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) (.cutX 3776 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty))))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 (.cutX 10496 (.cutY 28928 .empty (.cutX 10368 (.cutY 29056 (.cutX 10304 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 10432 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 .empty (.cutX 22272 .empty (.cutY 3840 (.cutX 22400 (.cutY 3712 .full (.cutX 22336 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 22464 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 (.cutY 10752 (.cutX 28928 .empty (.cutY 10496 (.cutX 29056 (.cutY 10368 (.cutX 28992 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 28992 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata76 : 0<72090291 ∧ 14<128 ∧ 87<128 ∧ 0<4 ∧
    1683/4160=0 ∧ 1683%4160=1683 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 6603, atom 6037, type 1, source (16,85).
def leavesData77 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves77 : Fin 13 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 85 leaves77 i
def outputData77 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,21760,21888⟩) (.node (.single ⟨4096,4224,21888,22016⟩) (.single ⟨4224,4288,21760,21824⟩))) (.node (.single ⟨4224,4288,21824,21888⟩) (.node (.single ⟨4288,4320,21760,21792⟩) (.single ⟨4288,4320,21792,21824⟩)))) (.node (.node (.single ⟨4320,4352,21760,21792⟩) (.node (.single ⟨4320,4352,21792,21824⟩) (.single ⟨4288,4352,21824,21888⟩))) (.node (.node (.single ⟨4224,4288,21888,21952⟩) (.single ⟨4224,4288,21952,22016⟩)) (.node (.single ⟨4288,4352,21888,21952⟩) (.single ⟨4288,4352,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,28416,28480⟩) (.node (.single ⟨10752,10816,28480,28544⟩) (.single ⟨10816,10880,28416,28480⟩))) (.node (.single ⟨10816,10880,28480,28544⟩) (.node (.single ⟨10752,10880,28544,28672⟩) (.single ⟨10880,10944,28416,28480⟩)))) (.node (.node (.single ⟨10880,10944,28480,28544⟩) (.node (.single ⟨10944,10976,28416,28448⟩) (.single ⟨10944,10976,28448,28480⟩))) (.node (.node (.single ⟨10976,11008,28416,28448⟩) (.single ⟨10976,11008,28448,28480⟩)) (.node (.single ⟨10944,11008,28480,28544⟩) (.single ⟨10880,11008,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,4096,4224⟩) (.node (.single ⟨21760,21824,4224,4288⟩) (.single ⟨21760,21792,4288,4320⟩))) (.node (.single ⟨21760,21792,4320,4352⟩) (.node (.single ⟨21792,21824,4288,4320⟩) (.single ⟨21792,21824,4320,4352⟩)))) (.node (.node (.single ⟨21824,21888,4224,4288⟩) (.node (.single ⟨21824,21888,4288,4352⟩) (.single ⟨21888,22016,4096,4224⟩))) (.node (.node (.single ⟨21888,21952,4224,4288⟩) (.single ⟨21888,21952,4288,4352⟩)) (.node (.single ⟨21952,22016,4224,4288⟩) (.single ⟨21952,22016,4288,4352⟩))))) (.node (.node (.node (.single ⟨28416,28480,10752,10816⟩) (.node (.single ⟨28416,28480,10816,10880⟩) (.single ⟨28480,28544,10752,10816⟩))) (.node (.single ⟨28480,28544,10816,10880⟩) (.node (.single ⟨28416,28480,10880,10944⟩) (.single ⟨28416,28448,10944,10976⟩)))) (.node (.node (.single ⟨28416,28448,10976,11008⟩) (.node (.single ⟨28448,28480,10944,10976⟩) (.single ⟨28448,28480,10976,11008⟩))) (.node (.node (.single ⟨28480,28544,10880,10944⟩) (.single ⟨28480,28544,10944,11008⟩)) (.node (.single ⟨28544,28672,10752,10880⟩) (.single ⟨28544,28672,10880,11008⟩)))))))
def output77 : Fin 52 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover77 (i : Fin 52) : Fin 52 := ⟨coverData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 52) : Fin 52 := ⟨sourceData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 (.cutY 22016 (.cutX 4352 (.cutY 21760 .empty (.cutX 4224 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 4288 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 4320 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) (.cutX 4288 (.cutY 21952 .full .full) (.cutY 21952 .full .full))))) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 .empty (.cutY 28160 .empty (.cutX 11008 (.cutY 28416 .empty (.cutX 10880 (.cutY 28544 (.cutX 10816 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full) (.cutY 28544 (.cutX 10944 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 10976 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))) .empty)))) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 (.cutY 4608 (.cutX 21760 .empty (.cutY 4352 (.cutX 21888 (.cutY 4224 .full (.cutX 21824 (.cutY 4288 .full (.cutX 21792 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full (.cutX 21952 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 .empty (.cutY 10752 .empty (.cutX 28416 .empty (.cutY 11008 (.cutX 28544 (.cutY 10880 (.cutX 28480 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 28480 (.cutY 10944 .full (.cutX 28448 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty)))) .empty)))) .empty) .empty))) .empty))

theorem metadata77 : 0<125829407 ∧ 16<128 ∧ 85<128 ∧ 1<4 ∧
    6037/4160=1 ∧ 6037%4160=1877 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 6604, atom 6134, type 1, source (17,87).
def leavesData78 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves78 : Fin 19 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 17 87 leaves78 i
def outputData78 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,22272,22336⟩) (.single ⟨4352,4416,22336,22400⟩)) (.node (.single ⟨4416,4480,22272,22336⟩) (.single ⟨4416,4480,22336,22400⟩))) (.node (.node (.single ⟨4352,4480,22400,22528⟩) (.single ⟨4480,4544,22272,22336⟩)) (.node (.single ⟨4480,4544,22336,22400⟩) (.node (.single ⟨4544,4576,22272,22304⟩) (.single ⟨4544,4576,22304,22336⟩))))) (.node (.node (.node (.single ⟨4576,4608,22272,22304⟩) (.single ⟨4576,4608,22304,22336⟩)) (.node (.single ⟨4544,4576,22336,22368⟩) (.node (.single ⟨4544,4576,22368,22400⟩) (.single ⟨4576,4608,22336,22368⟩)))) (.node (.node (.single ⟨4576,4608,22368,22400⟩) (.single ⟨4480,4544,22400,22464⟩)) (.node (.single ⟨4480,4544,22464,22528⟩) (.node (.single ⟨4544,4608,22400,22464⟩) (.single ⟨4544,4608,22464,22528⟩)))))) (.node (.node (.node (.node (.single ⟨10240,10304,28160,28224⟩) (.single ⟨10240,10304,28224,28288⟩)) (.node (.single ⟨10304,10368,28160,28224⟩) (.single ⟨10304,10368,28224,28288⟩))) (.node (.node (.single ⟨10240,10368,28288,28416⟩) (.single ⟨10368,10400,28160,28192⟩)) (.node (.single ⟨10368,10400,28192,28224⟩) (.node (.single ⟨10400,10432,28160,28192⟩) (.single ⟨10400,10432,28192,28224⟩))))) (.node (.node (.node (.single ⟨10368,10432,28224,28288⟩) (.single ⟨10432,10464,28160,28192⟩)) (.node (.single ⟨10432,10464,28192,28224⟩) (.node (.single ⟨10464,10496,28160,28192⟩) (.single ⟨10464,10496,28192,28224⟩)))) (.node (.node (.single ⟨10432,10496,28224,28288⟩) (.single ⟨10368,10432,28288,28352⟩)) (.node (.single ⟨10368,10432,28352,28416⟩) (.node (.single ⟨10432,10496,28288,28352⟩) (.single ⟨10432,10496,28352,28416⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22272,22336,4352,4416⟩) (.single ⟨22272,22336,4416,4480⟩)) (.node (.single ⟨22336,22400,4352,4416⟩) (.single ⟨22336,22400,4416,4480⟩))) (.node (.node (.single ⟨22272,22336,4480,4544⟩) (.single ⟨22272,22304,4544,4576⟩)) (.node (.single ⟨22272,22304,4576,4608⟩) (.node (.single ⟨22304,22336,4544,4576⟩) (.single ⟨22304,22336,4576,4608⟩))))) (.node (.node (.node (.single ⟨22336,22400,4480,4544⟩) (.single ⟨22336,22368,4544,4576⟩)) (.node (.single ⟨22336,22368,4576,4608⟩) (.node (.single ⟨22368,22400,4544,4576⟩) (.single ⟨22368,22400,4576,4608⟩)))) (.node (.node (.single ⟨22400,22528,4352,4480⟩) (.single ⟨22400,22464,4480,4544⟩)) (.node (.single ⟨22400,22464,4544,4608⟩) (.node (.single ⟨22464,22528,4480,4544⟩) (.single ⟨22464,22528,4544,4608⟩)))))) (.node (.node (.node (.node (.single ⟨28160,28224,10240,10304⟩) (.single ⟨28160,28224,10304,10368⟩)) (.node (.single ⟨28224,28288,10240,10304⟩) (.single ⟨28224,28288,10304,10368⟩))) (.node (.node (.single ⟨28160,28192,10368,10400⟩) (.single ⟨28160,28192,10400,10432⟩)) (.node (.single ⟨28192,28224,10368,10400⟩) (.node (.single ⟨28192,28224,10400,10432⟩) (.single ⟨28160,28192,10432,10464⟩))))) (.node (.node (.node (.single ⟨28160,28192,10464,10496⟩) (.single ⟨28192,28224,10432,10464⟩)) (.node (.single ⟨28192,28224,10464,10496⟩) (.node (.single ⟨28224,28288,10368,10432⟩) (.single ⟨28224,28288,10432,10496⟩)))) (.node (.node (.single ⟨28288,28416,10240,10368⟩) (.single ⟨28288,28352,10368,10432⟩)) (.node (.single ⟨28288,28352,10432,10496⟩) (.node (.single ⟨28352,28416,10368,10432⟩) (.single ⟨28352,28416,10432,10496⟩))))))))
def output78 : Fin 76 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData78 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover78 (i : Fin 76) : Fin 76 := ⟨coverData78.get i % 76, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 76) : Fin 76 := ⟨sourceData78.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 .empty (.cutX 4608 (.cutY 22016 .empty (.cutX 4352 .empty (.cutY 22272 .empty (.cutX 4480 (.cutY 22400 (.cutX 4416 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 4544 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 4576 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) (.cutX 4576 (.cutY 22368 .full .full) (.cutY 22368 .full .full)))) (.cutX 4544 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))))) .empty)) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 .empty (.cutX 10752 (.cutY 28160 .empty (.cutX 10496 (.cutY 28416 (.cutX 10368 (.cutY 28288 (.cutX 10304 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 10432 (.cutY 28224 (.cutX 10400 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full) (.cutY 28224 (.cutX 10464 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 10432 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)) .empty)) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 (.cutX 22016 .empty (.cutY 4608 (.cutX 22272 .empty (.cutY 4352 .empty (.cutX 22400 (.cutY 4480 (.cutX 22336 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 22336 (.cutY 4544 .full (.cutX 22304 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full (.cutX 22368 (.cutY 4576 .full .full) (.cutY 4576 .full .full))))) (.cutY 4480 .full (.cutX 22464 (.cutY 4544 .full .full) (.cutY 4544 .full .full)))))) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 (.cutX 28160 .empty (.cutY 10752 (.cutX 28416 (.cutY 10496 (.cutX 28288 (.cutY 10368 (.cutX 28224 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 28224 (.cutY 10432 (.cutX 28192 (.cutY 10400 .full .full) (.cutY 10400 .full .full)) (.cutX 28192 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 28352 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty) .empty) .empty)) .empty)))) .empty) .empty))) .empty))

theorem metadata78 : 0<125829407 ∧ 17<128 ∧ 87<128 ∧ 1<4 ∧
    6134/4160=1 ∧ 6134%4160=1974 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 64,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked78_64 : ∀ i : Fin 12,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 76, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) (forallFinOffset_add (fun i => output78 i = raw78 (source78 i)) 0 64 12 (by decide) sourceChecked78_0
    sourceChecked78_64)

theorem coverChecked78_0 : ∀ i : Fin 64,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked78_64 : ∀ i : Fin 12,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 76, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
  forallFin_of_zero_offset (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (forallFinOffset_add (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) 0 64 12 (by decide) coverChecked78_0
    coverChecked78_64)

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

-- Frozen phase 6605, atom 6230, type 1, source (18,90).
def leavesData79 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves79 : Fin 19 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 18 90 leaves79 i
def outputData79 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,23040,23104⟩) (.single ⟨4608,4672,23104,23168⟩)) (.node (.single ⟨4672,4736,23040,23104⟩) (.single ⟨4672,4736,23104,23168⟩))) (.node (.node (.single ⟨4608,4736,23168,23296⟩) (.single ⟨4736,4800,23040,23104⟩)) (.node (.single ⟨4736,4800,23104,23168⟩) (.node (.single ⟨4800,4832,23040,23072⟩) (.single ⟨4800,4832,23072,23104⟩))))) (.node (.node (.node (.single ⟨4832,4864,23040,23072⟩) (.single ⟨4832,4864,23072,23104⟩)) (.node (.single ⟨4800,4832,23104,23136⟩) (.node (.single ⟨4800,4832,23136,23168⟩) (.single ⟨4832,4864,23104,23136⟩)))) (.node (.node (.single ⟨4832,4864,23136,23168⟩) (.single ⟨4736,4800,23168,23232⟩)) (.node (.single ⟨4736,4800,23232,23296⟩) (.node (.single ⟨4800,4864,23168,23232⟩) (.single ⟨4800,4864,23232,23296⟩)))))) (.node (.node (.node (.node (.single ⟨9472,9536,27904,27968⟩) (.single ⟨9472,9536,27968,28032⟩)) (.node (.single ⟨9536,9600,27904,27968⟩) (.single ⟨9536,9600,27968,28032⟩))) (.node (.node (.single ⟨9472,9600,28032,28160⟩) (.single ⟨9600,9632,27904,27936⟩)) (.node (.single ⟨9600,9632,27936,27968⟩) (.node (.single ⟨9632,9664,27904,27936⟩) (.single ⟨9632,9664,27936,27968⟩))))) (.node (.node (.node (.single ⟨9600,9664,27968,28032⟩) (.single ⟨9664,9696,27904,27936⟩)) (.node (.single ⟨9664,9696,27936,27968⟩) (.node (.single ⟨9696,9728,27904,27936⟩) (.single ⟨9696,9728,27936,27968⟩)))) (.node (.node (.single ⟨9664,9728,27968,28032⟩) (.single ⟨9600,9664,28032,28096⟩)) (.node (.single ⟨9600,9664,28096,28160⟩) (.node (.single ⟨9664,9728,28032,28096⟩) (.single ⟨9664,9728,28096,28160⟩))))))) (.node (.node (.node (.node (.node (.single ⟨23040,23104,4608,4672⟩) (.single ⟨23040,23104,4672,4736⟩)) (.node (.single ⟨23104,23168,4608,4672⟩) (.single ⟨23104,23168,4672,4736⟩))) (.node (.node (.single ⟨23040,23104,4736,4800⟩) (.single ⟨23040,23072,4800,4832⟩)) (.node (.single ⟨23040,23072,4832,4864⟩) (.node (.single ⟨23072,23104,4800,4832⟩) (.single ⟨23072,23104,4832,4864⟩))))) (.node (.node (.node (.single ⟨23104,23168,4736,4800⟩) (.single ⟨23104,23136,4800,4832⟩)) (.node (.single ⟨23104,23136,4832,4864⟩) (.node (.single ⟨23136,23168,4800,4832⟩) (.single ⟨23136,23168,4832,4864⟩)))) (.node (.node (.single ⟨23168,23296,4608,4736⟩) (.single ⟨23168,23232,4736,4800⟩)) (.node (.single ⟨23168,23232,4800,4864⟩) (.node (.single ⟨23232,23296,4736,4800⟩) (.single ⟨23232,23296,4800,4864⟩)))))) (.node (.node (.node (.node (.single ⟨27904,27968,9472,9536⟩) (.single ⟨27904,27968,9536,9600⟩)) (.node (.single ⟨27968,28032,9472,9536⟩) (.single ⟨27968,28032,9536,9600⟩))) (.node (.node (.single ⟨27904,27936,9600,9632⟩) (.single ⟨27904,27936,9632,9664⟩)) (.node (.single ⟨27936,27968,9600,9632⟩) (.node (.single ⟨27936,27968,9632,9664⟩) (.single ⟨27904,27936,9664,9696⟩))))) (.node (.node (.node (.single ⟨27904,27936,9696,9728⟩) (.single ⟨27936,27968,9664,9696⟩)) (.node (.single ⟨27936,27968,9696,9728⟩) (.node (.single ⟨27968,28032,9600,9664⟩) (.single ⟨27968,28032,9664,9728⟩)))) (.node (.node (.single ⟨28032,28160,9472,9600⟩) (.single ⟨28032,28096,9600,9664⟩)) (.node (.single ⟨28032,28096,9664,9728⟩) (.node (.single ⟨28096,28160,9600,9664⟩) (.single ⟨28096,28160,9664,9728⟩))))))))
def output79 : Fin 76 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData79 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover79 (i : Fin 76) : Fin 76 := ⟨coverData79.get i % 76, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 76) : Fin 76 := ⟨sourceData79.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 .empty (.cutY 23040 .empty (.cutX 4864 (.cutY 23296 (.cutX 4736 (.cutY 23168 (.cutX 4672 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 4800 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 4832 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) (.cutX 4832 (.cutY 23136 .full .full) (.cutY 23136 .full .full)))) (.cutX 4800 (.cutY 23232 .full .full) (.cutY 23232 .full .full)))) .empty) .empty))) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 (.cutY 28160 (.cutX 9472 .empty (.cutY 27904 .empty (.cutX 9600 (.cutY 28032 (.cutX 9536 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 9664 (.cutY 27968 (.cutX 9632 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full) (.cutY 27968 (.cutX 9696 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 9664 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty)))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 .empty (.cutY 4608 .empty (.cutX 23296 (.cutY 4864 (.cutX 23168 (.cutY 4736 (.cutX 23104 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 23104 (.cutY 4800 .full (.cutX 23072 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full (.cutX 23136 (.cutY 4832 .full .full) (.cutY 4832 .full .full))))) (.cutY 4736 .full (.cutX 23232 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty) .empty))) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 (.cutY 9728 (.cutX 27904 .empty (.cutY 9472 .empty (.cutX 28032 (.cutY 9600 (.cutX 27968 (.cutY 9536 .full .full) (.cutY 9536 .full .full)) (.cutX 27968 (.cutY 9664 (.cutX 27936 (.cutY 9632 .full .full) (.cutY 9632 .full .full)) (.cutX 27936 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 28096 (.cutY 9664 .full .full) (.cutY 9664 .full .full)))))) .empty) .empty))) .empty)) .empty) .empty))) .empty))

theorem metadata79 : 0<192153497 ∧ 18<128 ∧ 90<128 ∧ 1<4 ∧
    6230/4160=1 ∧ 6230%4160=2070 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 64,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked79_64 : ∀ i : Fin 12,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 76, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) (forallFinOffset_add (fun i => output79 i = raw79 (source79 i)) 0 64 12 (by decide) sourceChecked79_0
    sourceChecked79_64)

theorem coverChecked79_0 : ∀ i : Fin 64,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked79_64 : ∀ i : Fin 12,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 76, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
  forallFin_of_zero_offset (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (forallFinOffset_add (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) 0 64 12 (by decide) coverChecked79_0
    coverChecked79_64)

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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 6606, atom 6135, type 1, source (17,88).
def leavesData80 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))))) (.node (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves80 : Fin 19 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 17 88 leaves80 i
def outputData80 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,22528,22592⟩) (.single ⟨4352,4416,22592,22656⟩)) (.node (.single ⟨4416,4480,22528,22592⟩) (.single ⟨4416,4480,22592,22656⟩))) (.node (.node (.single ⟨4352,4480,22656,22784⟩) (.single ⟨4480,4544,22528,22592⟩)) (.node (.single ⟨4480,4544,22592,22656⟩) (.node (.single ⟨4544,4576,22528,22560⟩) (.single ⟨4544,4576,22560,22592⟩))))) (.node (.node (.node (.single ⟨4576,4608,22528,22560⟩) (.single ⟨4576,4608,22560,22592⟩)) (.node (.single ⟨4544,4576,22592,22624⟩) (.node (.single ⟨4544,4576,22624,22656⟩) (.single ⟨4576,4608,22592,22624⟩)))) (.node (.node (.single ⟨4576,4608,22624,22656⟩) (.single ⟨4480,4544,22656,22720⟩)) (.node (.single ⟨4480,4544,22720,22784⟩) (.node (.single ⟨4544,4608,22656,22720⟩) (.single ⟨4544,4608,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨9984,10048,28160,28224⟩) (.single ⟨9984,10048,28224,28288⟩)) (.node (.single ⟨10048,10112,28160,28224⟩) (.single ⟨10048,10112,28224,28288⟩))) (.node (.node (.single ⟨9984,10112,28288,28416⟩) (.single ⟨10112,10144,28160,28192⟩)) (.node (.single ⟨10112,10144,28192,28224⟩) (.node (.single ⟨10144,10176,28160,28192⟩) (.single ⟨10144,10176,28192,28224⟩))))) (.node (.node (.node (.single ⟨10112,10176,28224,28288⟩) (.single ⟨10176,10208,28160,28192⟩)) (.node (.single ⟨10176,10208,28192,28224⟩) (.node (.single ⟨10208,10240,28160,28192⟩) (.single ⟨10208,10240,28192,28224⟩)))) (.node (.node (.single ⟨10176,10240,28224,28288⟩) (.single ⟨10112,10176,28288,28352⟩)) (.node (.single ⟨10112,10176,28352,28416⟩) (.node (.single ⟨10176,10240,28288,28352⟩) (.single ⟨10176,10240,28352,28416⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22528,22592,4352,4416⟩) (.single ⟨22528,22592,4416,4480⟩)) (.node (.single ⟨22592,22656,4352,4416⟩) (.single ⟨22592,22656,4416,4480⟩))) (.node (.node (.single ⟨22528,22592,4480,4544⟩) (.single ⟨22528,22560,4544,4576⟩)) (.node (.single ⟨22528,22560,4576,4608⟩) (.node (.single ⟨22560,22592,4544,4576⟩) (.single ⟨22560,22592,4576,4608⟩))))) (.node (.node (.node (.single ⟨22592,22656,4480,4544⟩) (.single ⟨22592,22624,4544,4576⟩)) (.node (.single ⟨22592,22624,4576,4608⟩) (.node (.single ⟨22624,22656,4544,4576⟩) (.single ⟨22624,22656,4576,4608⟩)))) (.node (.node (.single ⟨22656,22784,4352,4480⟩) (.single ⟨22656,22720,4480,4544⟩)) (.node (.single ⟨22656,22720,4544,4608⟩) (.node (.single ⟨22720,22784,4480,4544⟩) (.single ⟨22720,22784,4544,4608⟩)))))) (.node (.node (.node (.node (.single ⟨28160,28224,9984,10048⟩) (.single ⟨28160,28224,10048,10112⟩)) (.node (.single ⟨28224,28288,9984,10048⟩) (.single ⟨28224,28288,10048,10112⟩))) (.node (.node (.single ⟨28160,28192,10112,10144⟩) (.single ⟨28160,28192,10144,10176⟩)) (.node (.single ⟨28192,28224,10112,10144⟩) (.node (.single ⟨28192,28224,10144,10176⟩) (.single ⟨28160,28192,10176,10208⟩))))) (.node (.node (.node (.single ⟨28160,28192,10208,10240⟩) (.single ⟨28192,28224,10176,10208⟩)) (.node (.single ⟨28192,28224,10208,10240⟩) (.node (.single ⟨28224,28288,10112,10176⟩) (.single ⟨28224,28288,10176,10240⟩)))) (.node (.node (.single ⟨28288,28416,9984,10112⟩) (.single ⟨28288,28352,10112,10176⟩)) (.node (.single ⟨28288,28352,10176,10240⟩) (.node (.single ⟨28352,28416,10112,10176⟩) (.single ⟨28352,28416,10176,10240⟩))))))))
def output80 : Fin 76 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 70) (.node (.single 33) (.single 6))))) (.node (.node (.node (.single 47) (.single 69)) (.node (.single 28) (.node (.single 15) (.single 53)))) (.node (.node (.single 60) (.single 22)) (.node (.single 16) (.node (.single 55) (.single 59)))))) (.node (.node (.node (.node (.single 20) (.single 17)) (.node (.single 54) (.single 58))) (.node (.node (.single 21) (.single 18)) (.node (.single 56) (.node (.single 57) (.single 19))))) (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1)))) (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39))))))) (.node (.node (.node (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.single 41))) (.node (.node (.single 72) (.single 34)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData80 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.single 40))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 24)))))) (.node (.node (.node (.node (.single 27) (.single 19)) (.node (.single 23) (.single 15))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 11) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 7) (.single 43)) (.node (.single 35) (.node (.single 39) (.single 31))))))) (.node (.node (.node (.node (.node (.single 29) (.single 37)) (.node (.single 33) (.single 41))) (.node (.node (.single 5) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 9) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 13)) (.node (.single 21) (.node (.single 17) (.single 25)))))) (.node (.node (.node (.node (.single 26) (.single 22)) (.node (.single 18) (.single 14))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 42)) (.node (.single 38) (.node (.single 34) (.single 30))))))))
def cover80 (i : Fin 76) : Fin 76 := ⟨coverData80.get i % 76, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 76) : Fin 76 := ⟨sourceData80.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 .empty (.cutX 5120 (.cutY 23552 (.cutX 4608 (.cutY 23040 (.cutX 4352 .empty (.cutY 22784 (.cutX 4480 (.cutY 22656 (.cutX 4416 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 4544 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 4576 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) (.cutX 4576 (.cutY 22624 .full .full) (.cutY 22624 .full .full)))) (.cutX 4544 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 .empty (.cutX 9216 .empty (.cutY 27648 .empty (.cutX 9728 .empty (.cutY 28160 .empty (.cutX 9984 .empty (.cutY 28416 (.cutX 10112 (.cutY 28288 (.cutX 10048 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 10176 (.cutY 28224 (.cutX 10144 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full) (.cutY 28224 (.cutX 10208 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 10176 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty))))))) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 (.cutX 23552 (.cutY 5120 (.cutX 23040 (.cutY 4608 (.cutX 22784 (.cutY 4352 .empty (.cutX 22656 (.cutY 4480 (.cutX 22592 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 22592 (.cutY 4544 .full (.cutX 22560 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full (.cutX 22624 (.cutY 4576 .full .full) (.cutY 4576 .full .full))))) (.cutY 4480 .full (.cutX 22720 (.cutY 4544 .full .full) (.cutY 4544 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 (.cutX 27648 .empty (.cutY 9216 .empty (.cutX 28160 .empty (.cutY 9728 .empty (.cutX 28416 (.cutY 9984 .empty (.cutX 28288 (.cutY 10112 (.cutX 28224 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 28224 (.cutY 10176 (.cutX 28192 (.cutY 10144 .full .full) (.cutY 10144 .full .full)) (.cutX 28192 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 28352 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty))))) .empty)) .empty) .empty))) .empty))

theorem metadata80 : 0<192153497 ∧ 17<128 ∧ 88<128 ∧ 1<4 ∧
    6135/4160=1 ∧ 6135%4160=1975 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 64,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked80_64 : ∀ i : Fin 12,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 76, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) (forallFinOffset_add (fun i => output80 i = raw80 (source80 i)) 0 64 12 (by decide) sourceChecked80_0
    sourceChecked80_64)

theorem coverChecked80_0 : ∀ i : Fin 64,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked80_64 : ∀ i : Fin 12,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 76, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
  forallFin_of_zero_offset (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (forallFinOffset_add (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) 0 64 12 (by decide) coverChecked80_0
    coverChecked80_64)

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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (192153497/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (192153497/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 6607, atom 450, type 0, source (3,75).
def leavesData81 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves81 : Fin 7 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 3 75 leaves81 i
def outputData81 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨768,896,19200,19328⟩) (.node (.single ⟨768,896,19328,19456⟩) (.single ⟨896,960,19200,19264⟩))) (.node (.node (.single ⟨896,960,19264,19328⟩) (.single ⟨960,1024,19200,19264⟩)) (.node (.single ⟨960,1024,19264,19328⟩) (.single ⟨896,1024,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,31744,31872⟩) (.node (.single ⟨13312,13440,31872,32000⟩) (.single ⟨13440,13504,31744,31808⟩))) (.node (.node (.single ⟨13440,13504,31808,31872⟩) (.single ⟨13504,13568,31744,31808⟩)) (.node (.single ⟨13504,13568,31808,31872⟩) (.single ⟨13440,13568,31872,32000⟩))))) (.node (.node (.node (.single ⟨19200,19328,768,896⟩) (.node (.single ⟨19200,19264,896,960⟩) (.single ⟨19200,19264,960,1024⟩))) (.node (.node (.single ⟨19264,19328,896,960⟩) (.single ⟨19264,19328,960,1024⟩)) (.node (.single ⟨19328,19456,768,896⟩) (.single ⟨19328,19456,896,1024⟩)))) (.node (.node (.single ⟨31744,31872,13312,13440⟩) (.node (.single ⟨31744,31808,13440,13504⟩) (.single ⟨31744,31808,13504,13568⟩))) (.node (.node (.single ⟨31808,31872,13440,13504⟩) (.single ⟨31808,31872,13504,13568⟩)) (.node (.single ⟨31872,32000,13312,13440⟩) (.single ⟨31872,32000,13440,13568⟩))))))
def output81 : Fin 28 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData81 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover81 (i : Fin 28) : Fin 28 := ⟨coverData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 28) : Fin 28 := ⟨sourceData81.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 .empty (.cutY 18944 .empty (.cutX 768 .empty (.cutY 19200 .empty (.cutX 896 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 960 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 (.cutX 13568 (.cutY 32000 (.cutX 13440 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 13504 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full)) .empty) .empty) .empty) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 .empty (.cutX 19200 .empty (.cutY 768 .empty (.cutX 19328 (.cutY 896 .full (.cutX 19264 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full)))))) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 (.cutY 13824 (.cutX 32000 (.cutY 13568 (.cutX 31872 (.cutY 13440 .full (.cutX 31808 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty))) .empty)))))) .empty))

theorem metadata81 : 0<34183877 ∧ 3<128 ∧ 75<128 ∧ 0<4 ∧
    450/4160=0 ∧ 450%4160=450 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 6608, atom 201, type 0, source (1,74).
def leavesData82 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves82 : Fin 10 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 1 74 leaves82 i
def outputData82 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨256,320,18944,19008⟩) (.single ⟨256,320,19008,19072⟩)) (.node (.single ⟨320,384,18944,19008⟩) (.node (.single ⟨320,384,19008,19072⟩) (.single ⟨256,384,19072,19200⟩)))) (.node (.node (.single ⟨384,448,18944,19008⟩) (.single ⟨384,448,19008,19072⟩)) (.node (.single ⟨448,512,18944,19008⟩) (.node (.single ⟨448,512,19008,19072⟩) (.single ⟨384,512,19072,19200⟩))))) (.node (.node (.node (.single ⟨13568,13696,32256,32384⟩) (.single ⟨13568,13696,32384,32512⟩)) (.node (.single ⟨13696,13760,32256,32320⟩) (.node (.single ⟨13696,13760,32320,32384⟩) (.single ⟨13760,13824,32256,32320⟩)))) (.node (.node (.single ⟨13760,13824,32320,32384⟩) (.single ⟨13696,13760,32384,32448⟩)) (.node (.single ⟨13696,13760,32448,32512⟩) (.node (.single ⟨13760,13824,32384,32448⟩) (.single ⟨13760,13824,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨18944,19008,256,320⟩) (.single ⟨18944,19008,320,384⟩)) (.node (.single ⟨19008,19072,256,320⟩) (.node (.single ⟨19008,19072,320,384⟩) (.single ⟨18944,19008,384,448⟩)))) (.node (.node (.single ⟨18944,19008,448,512⟩) (.single ⟨19008,19072,384,448⟩)) (.node (.single ⟨19008,19072,448,512⟩) (.node (.single ⟨19072,19200,256,384⟩) (.single ⟨19072,19200,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,13568,13696⟩) (.single ⟨32256,32320,13696,13760⟩)) (.node (.single ⟨32256,32320,13760,13824⟩) (.node (.single ⟨32320,32384,13696,13760⟩) (.single ⟨32320,32384,13760,13824⟩)))) (.node (.node (.single ⟨32384,32512,13568,13696⟩) (.single ⟨32384,32448,13696,13760⟩)) (.node (.single ⟨32384,32448,13760,13824⟩) (.node (.single ⟨32448,32512,13696,13760⟩) (.single ⟨32448,32512,13760,13824⟩)))))))
def output82 : Fin 40 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover82 (i : Fin 40) : Fin 40 := ⟨coverData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 40) : Fin 40 := ⟨sourceData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 (.cutY 18944 .empty (.cutX 256 .empty (.cutY 19200 (.cutX 384 (.cutY 19072 (.cutX 320 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full) (.cutY 19072 (.cutX 448 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 .empty (.cutX 13568 .empty (.cutY 32512 (.cutX 13696 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 13760 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 13760 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 (.cutX 19200 (.cutY 256 .empty (.cutX 19072 (.cutY 384 (.cutX 19008 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 19008 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 .empty (.cutY 13824 (.cutX 32512 (.cutY 13568 .empty (.cutX 32384 (.cutY 13696 .full (.cutX 32320 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full (.cutX 32448 (.cutY 13760 .full .full) (.cutY 13760 .full .full))))) .empty) .empty)))) .empty)))))) .empty))

theorem metadata82 : 0<34183877 ∧ 1<128 ∧ 74<128 ∧ 0<4 ∧
    201/4160=0 ∧ 201%4160=201 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 6609, atom 74, type 0, source (0,74).
def leavesData83 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves83 : Fin 4 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 74 leaves83 i
def outputData83 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,18944,19072⟩) (.single ⟨0,128,19072,19200⟩)) (.node (.single ⟨128,256,18944,19072⟩) (.single ⟨128,256,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,32512,32640⟩) (.single ⟨13568,13696,32640,32768⟩)) (.node (.single ⟨13696,13824,32512,32640⟩) (.single ⟨13696,13824,32640,32768⟩)))) (.node (.node (.node (.single ⟨18944,19072,0,128⟩) (.single ⟨18944,19072,128,256⟩)) (.node (.single ⟨19072,19200,0,128⟩) (.single ⟨19072,19200,128,256⟩))) (.node (.node (.single ⟨32512,32640,13568,13696⟩) (.single ⟨32512,32640,13696,13824⟩)) (.node (.single ⟨32640,32768,13568,13696⟩) (.single ⟨32640,32768,13696,13824⟩)))))
def output83 : Fin 16 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData83 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover83 (i : Fin 16) : Fin 16 := ⟨coverData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 16) : Fin 16 := ⟨sourceData83.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 (.cutX 512 (.cutY 18944 .empty (.cutX 256 (.cutY 19200 (.cutX 128 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 .empty (.cutX 13824 (.cutY 32256 .empty (.cutX 13568 .empty (.cutY 32512 .empty (.cutX 13696 (.cutY 32640 .full .full) (.cutY 32640 .full .full))))) .empty)))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 (.cutX 18944 .empty (.cutY 512 (.cutX 19200 (.cutY 256 (.cutX 19072 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 .empty (.cutX 32256 .empty (.cutY 13824 (.cutX 32512 .empty (.cutY 13568 .empty (.cutX 32640 (.cutY 13696 .full .full) (.cutY 13696 .full .full)))) .empty)))) .empty)))))) .empty))

theorem metadata83 : 0<34183877 ∧ 0<128 ∧ 74<128 ∧ 0<4 ∧
    74/4160=0 ∧ 74%4160=74 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 6610, atom 1038, type 0, source (8,78).
def leavesData84 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves84 : Fin 7 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 78 leaves84 i
def outputData84 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,19968,20096⟩) (.node (.single ⟨2048,2176,20096,20224⟩) (.single ⟨2176,2240,19968,20032⟩))) (.node (.node (.single ⟨2176,2240,20032,20096⟩) (.single ⟨2240,2304,19968,20032⟩)) (.node (.single ⟨2240,2304,20032,20096⟩) (.single ⟨2176,2304,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,30464,30592⟩) (.node (.single ⟨12544,12672,30592,30720⟩) (.single ⟨12672,12736,30464,30528⟩))) (.node (.node (.single ⟨12672,12736,30528,30592⟩) (.single ⟨12736,12800,30464,30528⟩)) (.node (.single ⟨12736,12800,30528,30592⟩) (.single ⟨12672,12800,30592,30720⟩))))) (.node (.node (.node (.single ⟨19968,20096,2048,2176⟩) (.node (.single ⟨19968,20032,2176,2240⟩) (.single ⟨19968,20032,2240,2304⟩))) (.node (.node (.single ⟨20032,20096,2176,2240⟩) (.single ⟨20032,20096,2240,2304⟩)) (.node (.single ⟨20096,20224,2048,2176⟩) (.single ⟨20096,20224,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,12544,12672⟩) (.node (.single ⟨30464,30528,12672,12736⟩) (.single ⟨30464,30528,12736,12800⟩))) (.node (.node (.single ⟨30528,30592,12672,12736⟩) (.single ⟨30528,30592,12736,12800⟩)) (.node (.single ⟨30592,30720,12544,12672⟩) (.single ⟨30592,30720,12672,12800⟩))))))
def output84 : Fin 28 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover84 (i : Fin 28) : Fin 28 := ⟨coverData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 28) : Fin 28 := ⟨sourceData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 .empty (.cutX 2560 (.cutY 19968 .empty (.cutX 2304 (.cutY 20224 (.cutX 2176 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 2240 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 .empty (.cutX 12800 (.cutY 30208 .empty (.cutX 12544 .empty (.cutY 30464 .empty (.cutX 12672 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 12736 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))))) .empty)) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 (.cutX 19968 .empty (.cutY 2560 (.cutX 20224 (.cutY 2304 (.cutX 20096 (.cutY 2176 .full (.cutX 20032 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty)))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 (.cutX 30208 .empty (.cutY 12800 (.cutX 30464 .empty (.cutY 12544 .empty (.cutX 30592 (.cutY 12672 .full (.cutX 30528 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty)) .empty)) .empty) .empty))))) .empty))

theorem metadata84 : 0<48363413 ∧ 8<128 ∧ 78<128 ∧ 0<4 ∧
    1038/4160=0 ∧ 1038%4160=1038 ∧ ∀ i, (leaves84 i).Valid 8 := by
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 6611, atom 5838, type 1, source (14,82).
def leavesData85 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves85 : Fin 7 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 82 leaves85 i
def outputData85 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,20992,21120⟩) (.node (.single ⟨3584,3712,21120,21248⟩) (.single ⟨3712,3776,20992,21056⟩))) (.node (.node (.single ⟨3712,3776,21056,21120⟩) (.single ⟨3776,3840,20992,21056⟩)) (.node (.single ⟨3776,3840,21056,21120⟩) (.single ⟨3712,3840,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,28928,29056⟩) (.node (.single ⟨11520,11648,29056,29184⟩) (.single ⟨11648,11712,28928,28992⟩))) (.node (.node (.single ⟨11648,11712,28992,29056⟩) (.single ⟨11712,11776,28928,28992⟩)) (.node (.single ⟨11712,11776,28992,29056⟩) (.single ⟨11648,11776,29056,29184⟩))))) (.node (.node (.node (.single ⟨20992,21120,3584,3712⟩) (.node (.single ⟨20992,21056,3712,3776⟩) (.single ⟨20992,21056,3776,3840⟩))) (.node (.node (.single ⟨21056,21120,3712,3776⟩) (.single ⟨21056,21120,3776,3840⟩)) (.node (.single ⟨21120,21248,3584,3712⟩) (.single ⟨21120,21248,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,11520,11648⟩) (.node (.single ⟨28928,28992,11648,11712⟩) (.single ⟨28928,28992,11712,11776⟩))) (.node (.node (.single ⟨28992,29056,11648,11712⟩) (.single ⟨28992,29056,11712,11776⟩)) (.node (.single ⟨29056,29184,11520,11648⟩) (.single ⟨29056,29184,11648,11776⟩))))))
def output85 : Fin 28 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData85 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover85 (i : Fin 28) : Fin 28 := ⟨coverData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 28) : Fin 28 := ⟨sourceData85.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 (.cutX 3584 .empty (.cutY 20992 .empty (.cutX 3840 (.cutY 21248 (.cutX 3712 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 3776 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty)) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 (.cutX 11776 (.cutY 29184 (.cutX 11520 .empty (.cutY 28928 .empty (.cutX 11648 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 11712 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty) .empty) .empty)) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 .empty (.cutX 20992 .empty (.cutY 3584 .empty (.cutX 21248 (.cutY 3840 (.cutX 21120 (.cutY 3712 .full (.cutX 21056 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 .empty (.cutX 29184 (.cutY 11776 (.cutX 28928 .empty (.cutY 11520 .empty (.cutX 29056 (.cutY 11648 .full (.cutX 28992 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) .empty)) .empty)) .empty) .empty)))) .empty))

theorem metadata85 : 0<139307719 ∧ 14<128 ∧ 82<128 ∧ 1<4 ∧
    5838/4160=1 ∧ 5838%4160=1678 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

-- Frozen phase 6612, atom 2343, type 0, source (21,96).
def leavesData86 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves86 : Fin 13 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 96 leaves86 i
def outputData86 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,24576,24640⟩) (.node (.single ⟨5376,5440,24640,24704⟩) (.single ⟨5440,5504,24576,24640⟩))) (.node (.single ⟨5440,5504,24640,24704⟩) (.node (.single ⟨5376,5504,24704,24832⟩) (.single ⟨5504,5568,24576,24640⟩)))) (.node (.node (.single ⟨5504,5568,24640,24704⟩) (.node (.single ⟨5568,5600,24576,24608⟩) (.single ⟨5568,5600,24608,24640⟩))) (.node (.node (.single ⟨5600,5632,24576,24608⟩) (.single ⟨5600,5632,24608,24640⟩)) (.node (.single ⟨5568,5632,24640,24704⟩) (.single ⟨5504,5632,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,27136,27264⟩) (.node (.single ⟨7936,8064,27264,27392⟩) (.single ⟨8064,8128,27136,27200⟩))) (.node (.single ⟨8064,8128,27200,27264⟩) (.node (.single ⟨8128,8160,27136,27168⟩) (.single ⟨8128,8160,27168,27200⟩)))) (.node (.node (.single ⟨8160,8192,27136,27168⟩) (.node (.single ⟨8160,8192,27168,27200⟩) (.single ⟨8128,8192,27200,27264⟩))) (.node (.node (.single ⟨8064,8128,27264,27328⟩) (.single ⟨8064,8128,27328,27392⟩)) (.node (.single ⟨8128,8192,27264,27328⟩) (.single ⟨8128,8192,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,5376,5440⟩) (.node (.single ⟨24576,24640,5440,5504⟩) (.single ⟨24640,24704,5376,5440⟩))) (.node (.single ⟨24640,24704,5440,5504⟩) (.node (.single ⟨24576,24640,5504,5568⟩) (.single ⟨24576,24608,5568,5600⟩)))) (.node (.node (.single ⟨24576,24608,5600,5632⟩) (.node (.single ⟨24608,24640,5568,5600⟩) (.single ⟨24608,24640,5600,5632⟩))) (.node (.node (.single ⟨24640,24704,5504,5568⟩) (.single ⟨24640,24704,5568,5632⟩)) (.node (.single ⟨24704,24832,5376,5504⟩) (.single ⟨24704,24832,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,7936,8064⟩) (.node (.single ⟨27136,27200,8064,8128⟩) (.single ⟨27136,27168,8128,8160⟩))) (.node (.single ⟨27136,27168,8160,8192⟩) (.node (.single ⟨27168,27200,8128,8160⟩) (.single ⟨27168,27200,8160,8192⟩)))) (.node (.node (.single ⟨27200,27264,8064,8128⟩) (.node (.single ⟨27200,27264,8128,8192⟩) (.single ⟨27264,27392,7936,8064⟩))) (.node (.node (.single ⟨27264,27328,8064,8128⟩) (.single ⟨27264,27328,8128,8192⟩)) (.node (.single ⟨27328,27392,8064,8128⟩) (.single ⟨27328,27392,8128,8192⟩)))))))
def output86 : Fin 52 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData86 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover86 (i : Fin 52) : Fin 52 := ⟨coverData86.get i % 52, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 52) : Fin 52 := ⟨sourceData86.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 (.cutX 5376 .empty (.cutY 24832 (.cutX 5504 (.cutY 24704 (.cutX 5440 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 5568 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 5600 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 .empty (.cutY 27136 .empty (.cutX 7936 .empty (.cutY 27392 (.cutX 8064 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 8128 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 8160 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 8128 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty)))) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 (.cutY 5632 (.cutX 24832 (.cutY 5376 .empty (.cutX 24704 (.cutY 5504 (.cutX 24640 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 24640 (.cutY 5568 .full (.cutX 24608 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty)) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 .empty (.cutX 27392 (.cutY 7936 .empty (.cutX 27264 (.cutY 8064 .full (.cutX 27200 (.cutY 8128 .full (.cutX 27168 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 27328 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))) .empty)))) .empty)))) .empty) .empty)) .empty))

theorem metadata86 : 0<121837468 ∧ 21<128 ∧ 96<128 ∧ 0<4 ∧
    2343/4160=0 ∧ 2343%4160=2343 ∧ ∀ i, (leaves86 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData86).mp
    (by decide +kernel)

theorem sourceChecked86_0 : ∀ i : Fin 52,
    (fun i => output86 i = raw86 (source86 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked86 : ∀ i : Fin 52, (fun i => output86 i = raw86 (source86 i)) i :=
  forallFin_of_zero_offset (fun i => output86 i = raw86 (source86 i)) sourceChecked86_0

theorem coverChecked86_0 : ∀ i : Fin 52,
    (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked86 : ∀ i : Fin 52, (fun i => (output86 (cover86 i)).ContainsBox (raw86 i)) i :=
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86].sum

theorem actual_batch_mass : batchActualMass = (5367262779/819200000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch06526
#print axioms NoThreeLine.ScheduleUnionBatch06526.actual_batch_mass
