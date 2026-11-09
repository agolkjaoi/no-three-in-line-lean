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
namespace NoThreeLine.ScheduleUnionBatch07088

-- Frozen phase 7088, atom 5638, type 1, source (12,86).
def leavesData0 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves0 : Fin 10 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 86 leaves0 i
def outputData0 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,22016,22144⟩) (.single ⟨3072,3200,22144,22272⟩)) (.node (.single ⟨3200,3264,22016,22080⟩) (.node (.single ⟨3200,3264,22080,22144⟩) (.single ⟨3264,3328,22016,22080⟩)))) (.node (.node (.single ⟨3264,3328,22080,22144⟩) (.single ⟨3200,3264,22144,22208⟩)) (.node (.single ⟨3200,3264,22208,22272⟩) (.node (.single ⟨3264,3328,22144,22208⟩) (.single ⟨3264,3328,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,29440,29504⟩) (.single ⟨10496,10560,29504,29568⟩)) (.node (.single ⟨10560,10624,29440,29504⟩) (.node (.single ⟨10560,10624,29504,29568⟩) (.single ⟨10496,10624,29568,29696⟩)))) (.node (.node (.single ⟨10624,10688,29440,29504⟩) (.single ⟨10624,10688,29504,29568⟩)) (.node (.single ⟨10688,10752,29440,29504⟩) (.node (.single ⟨10688,10752,29504,29568⟩) (.single ⟨10624,10752,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,3072,3200⟩) (.single ⟨22016,22080,3200,3264⟩)) (.node (.single ⟨22016,22080,3264,3328⟩) (.node (.single ⟨22080,22144,3200,3264⟩) (.single ⟨22080,22144,3264,3328⟩)))) (.node (.node (.single ⟨22144,22272,3072,3200⟩) (.single ⟨22144,22208,3200,3264⟩)) (.node (.single ⟨22144,22208,3264,3328⟩) (.node (.single ⟨22208,22272,3200,3264⟩) (.single ⟨22208,22272,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,10496,10560⟩) (.single ⟨29440,29504,10560,10624⟩)) (.node (.single ⟨29504,29568,10496,10560⟩) (.node (.single ⟨29504,29568,10560,10624⟩) (.single ⟨29440,29504,10624,10688⟩)))) (.node (.node (.single ⟨29440,29504,10688,10752⟩) (.single ⟨29504,29568,10624,10688⟩)) (.node (.single ⟨29504,29568,10688,10752⟩) (.node (.single ⟨29568,29696,10496,10624⟩) (.single ⟨29568,29696,10624,10752⟩)))))))
def output0 : Fin 40 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover0 (i : Fin 40) : Fin 40 := ⟨coverData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 40) : Fin 40 := ⟨sourceData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 .empty (.cutX 3328 (.cutY 22272 (.cutX 3200 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3264 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 3264 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 .empty (.cutX 10496 .empty (.cutY 29440 .empty (.cutX 10624 (.cutY 29568 (.cutX 10560 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10688 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))))) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 (.cutX 22272 (.cutY 3328 (.cutX 22144 (.cutY 3200 .full (.cutX 22080 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 22208 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty) .empty) .empty))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 (.cutX 29440 .empty (.cutY 10496 .empty (.cutX 29568 (.cutY 10624 (.cutX 29504 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 29504 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full)))) .empty)) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata0 : 0<139307719 ∧ 12<128 ∧ 86<128 ∧ 1<4 ∧
    5638/4160=1 ∧ 5638%4160=1478 ∧ ∀ i, (leaves0 i).Valid 8 := by
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 7089, atom 1266, type 0, source (10,86).
def leavesData1 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves1 : Fin 22 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 10 86 leaves1 i
def outputData1 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨2560,2624,22016,22080⟩) (.single ⟨2560,2624,22080,22144⟩)) (.node (.single ⟨2624,2688,22016,22080⟩) (.node (.single ⟨2624,2688,22080,22144⟩) (.single ⟨2560,2624,22144,22208⟩)))) (.node (.node (.single ⟨2560,2624,22208,22272⟩) (.node (.single ⟨2624,2688,22144,22208⟩) (.single ⟨2624,2688,22208,22272⟩))) (.node (.single ⟨2688,2752,22016,22080⟩) (.node (.single ⟨2688,2752,22080,22144⟩) (.single ⟨2752,2784,22016,22048⟩))))) (.node (.node (.node (.single ⟨2752,2784,22048,22080⟩) (.single ⟨2784,2816,22016,22048⟩)) (.node (.single ⟨2784,2816,22048,22080⟩) (.node (.single ⟨2752,2784,22080,22112⟩) (.single ⟨2752,2784,22112,22144⟩)))) (.node (.node (.single ⟨2784,2816,22080,22112⟩) (.node (.single ⟨2784,2816,22112,22144⟩) (.single ⟨2688,2752,22144,22208⟩))) (.node (.single ⟨2688,2752,22208,22272⟩) (.node (.single ⟨2752,2816,22144,22208⟩) (.single ⟨2752,2816,22208,22272⟩)))))) (.node (.node (.node (.node (.single ⟨10496,10560,29952,30016⟩) (.single ⟨10496,10560,30016,30080⟩)) (.node (.single ⟨10560,10624,29952,30016⟩) (.node (.single ⟨10560,10624,30016,30080⟩) (.single ⟨10496,10560,30080,30144⟩)))) (.node (.node (.single ⟨10496,10560,30144,30208⟩) (.node (.single ⟨10560,10624,30080,30144⟩) (.single ⟨10560,10624,30144,30208⟩))) (.node (.single ⟨10624,10656,29952,29984⟩) (.node (.single ⟨10624,10656,29984,30016⟩) (.single ⟨10656,10688,29952,29984⟩))))) (.node (.node (.node (.single ⟨10656,10688,29984,30016⟩) (.single ⟨10624,10688,30016,30080⟩)) (.node (.single ⟨10688,10720,29952,29984⟩) (.node (.single ⟨10688,10720,29984,30016⟩) (.single ⟨10720,10752,29952,29984⟩)))) (.node (.node (.single ⟨10720,10752,29984,30016⟩) (.node (.single ⟨10688,10752,30016,30080⟩) (.single ⟨10624,10688,30080,30144⟩))) (.node (.single ⟨10624,10688,30144,30208⟩) (.node (.single ⟨10688,10752,30080,30144⟩) (.single ⟨10688,10752,30144,30208⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22016,22080,2560,2624⟩) (.single ⟨22016,22080,2624,2688⟩)) (.node (.single ⟨22080,22144,2560,2624⟩) (.node (.single ⟨22080,22144,2624,2688⟩) (.single ⟨22016,22080,2688,2752⟩)))) (.node (.node (.single ⟨22016,22048,2752,2784⟩) (.node (.single ⟨22016,22048,2784,2816⟩) (.single ⟨22048,22080,2752,2784⟩))) (.node (.single ⟨22048,22080,2784,2816⟩) (.node (.single ⟨22080,22144,2688,2752⟩) (.single ⟨22080,22112,2752,2784⟩))))) (.node (.node (.node (.single ⟨22080,22112,2784,2816⟩) (.single ⟨22112,22144,2752,2784⟩)) (.node (.single ⟨22112,22144,2784,2816⟩) (.node (.single ⟨22144,22208,2560,2624⟩) (.single ⟨22144,22208,2624,2688⟩)))) (.node (.node (.single ⟨22208,22272,2560,2624⟩) (.node (.single ⟨22208,22272,2624,2688⟩) (.single ⟨22144,22208,2688,2752⟩))) (.node (.single ⟨22144,22208,2752,2816⟩) (.node (.single ⟨22208,22272,2688,2752⟩) (.single ⟨22208,22272,2752,2816⟩)))))) (.node (.node (.node (.node (.single ⟨29952,30016,10496,10560⟩) (.single ⟨29952,30016,10560,10624⟩)) (.node (.single ⟨30016,30080,10496,10560⟩) (.node (.single ⟨30016,30080,10560,10624⟩) (.single ⟨29952,29984,10624,10656⟩)))) (.node (.node (.single ⟨29952,29984,10656,10688⟩) (.node (.single ⟨29984,30016,10624,10656⟩) (.single ⟨29984,30016,10656,10688⟩))) (.node (.single ⟨29952,29984,10688,10720⟩) (.node (.single ⟨29952,29984,10720,10752⟩) (.single ⟨29984,30016,10688,10720⟩))))) (.node (.node (.node (.single ⟨29984,30016,10720,10752⟩) (.single ⟨30016,30080,10624,10688⟩)) (.node (.single ⟨30016,30080,10688,10752⟩) (.node (.single ⟨30080,30144,10496,10560⟩) (.single ⟨30080,30144,10560,10624⟩)))) (.node (.node (.single ⟨30144,30208,10496,10560⟩) (.node (.single ⟨30144,30208,10560,10624⟩) (.single ⟨30080,30144,10624,10688⟩))) (.node (.single ⟨30080,30144,10688,10752⟩) (.node (.single ⟨30144,30208,10624,10688⟩) (.single ⟨30144,30208,10688,10752⟩))))))))
def output1 : Fin 88 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 44)) (.node (.single 87) (.node (.single 43) (.single 1)))) (.node (.node (.single 46) (.node (.single 86) (.single 41))) (.node (.single 2) (.node (.single 45) (.single 85))))) (.node (.node (.node (.single 42) (.single 3)) (.node (.single 47) (.node (.single 84) (.single 40)))) (.node (.node (.single 8) (.node (.single 48) (.single 79))) (.node (.single 39) (.node (.single 9) (.single 53)))))) (.node (.node (.node (.node (.single 78) (.single 34)) (.node (.single 18) (.node (.single 62) (.single 69)))) (.node (.node (.single 25) (.node (.single 19) (.single 64))) (.node (.single 68) (.node (.single 23) (.single 20))))) (.node (.node (.node (.single 63) (.single 67)) (.node (.single 24) (.node (.single 21) (.single 65)))) (.node (.node (.single 66) (.node (.single 22) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 10)) (.node (.single 49) (.node (.single 77) (.single 38)))) (.node (.node (.single 11) (.node (.single 51) (.single 76))) (.node (.single 36) (.node (.single 12) (.single 50)))))) (.node (.node (.node (.node (.single 75) (.single 37)) (.node (.single 13) (.node (.single 52) (.single 74)))) (.node (.node (.single 35) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData1 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 16) (.node (.single 20) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 24))) (.node (.single 28) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 23)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.node (.single 19) (.single 15))) (.node (.single 7) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.node (.single 13) (.single 17)))) (.node (.node (.single 57) (.node (.single 65) (.single 61))) (.node (.single 69) (.node (.single 21) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 25))) (.node (.single 33) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.single 22)) (.node (.single 18) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 14))) (.node (.single 10) (.node (.single 6) (.single 2))))))))
def cover1 (i : Fin 88) : Fin 88 := ⟨coverData1.get i % 88, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 88) : Fin 88 := ⟨sourceData1.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 .empty (.cutX 2816 (.cutY 22272 (.cutX 2688 (.cutY 22144 (.cutX 2624 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 2624 (.cutY 22208 .full .full) (.cutY 22208 .full .full))) (.cutY 22144 (.cutX 2752 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 2784 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) (.cutX 2784 (.cutY 22112 .full .full) (.cutY 22112 .full .full)))) (.cutX 2752 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty) .empty)))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 (.cutY 30208 (.cutX 10496 .empty (.cutY 29952 .empty (.cutX 10624 (.cutY 30080 (.cutX 10560 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 10560 (.cutY 30144 .full .full) (.cutY 30144 .full .full))) (.cutY 30080 (.cutX 10688 (.cutY 30016 (.cutX 10656 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full) (.cutY 30016 (.cutX 10720 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full)) (.cutX 10688 (.cutY 30144 .full .full) (.cutY 30144 .full .full)))))) .empty) .empty)) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 .empty (.cutY 2560 .empty (.cutX 22272 (.cutY 2816 (.cutX 22144 (.cutY 2688 (.cutX 22080 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 22080 (.cutY 2752 .full (.cutX 22048 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full (.cutX 22112 (.cutY 2784 .full .full) (.cutY 2784 .full .full))))) (.cutY 2688 (.cutX 22208 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 22208 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 (.cutX 29952 .empty (.cutY 10496 .empty (.cutX 30080 (.cutY 10624 (.cutX 30016 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 30016 (.cutY 10688 (.cutX 29984 (.cutY 10656 .full .full) (.cutY 10656 .full .full)) (.cutX 29984 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 (.cutX 30144 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 30144 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata1 : 0<72090291 ∧ 10<128 ∧ 86<128 ∧ 0<4 ∧
    1266/4160=0 ∧ 1266%4160=1266 ∧ ∀ i, (leaves1 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData1).mp
    (by decide +kernel)

theorem sourceChecked1_0 : ∀ i : Fin 64,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked1_64 : ∀ i : Fin 24,
    (fun i => output1 i = raw1 (source1 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked1 : ∀ i : Fin 88, (fun i => output1 i = raw1 (source1 i)) i :=
  forallFin_of_zero_offset (fun i => output1 i = raw1 (source1 i)) (forallFinOffset_add (fun i => output1 i = raw1 (source1 i)) 0 64 24 (by decide) sourceChecked1_0
    sourceChecked1_64)

theorem coverChecked1_0 : ∀ i : Fin 64,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked1_64 : ∀ i : Fin 24,
    (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked1 : ∀ i : Fin 88, (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) i :=
  forallFin_of_zero_offset (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) (forallFinOffset_add (fun i => (output1 (cover1 i)).ContainsBox (raw1 i)) 0 64 24 (by decide) coverChecked1_0
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 7090, atom 1156, type 0, source (9,85).
def leavesData2 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves2 : Fin 10 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 85 leaves2 i
def outputData2 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2432,21760,21888⟩) (.single ⟨2304,2432,21888,22016⟩)) (.node (.single ⟨2432,2496,21760,21824⟩) (.node (.single ⟨2432,2496,21824,21888⟩) (.single ⟨2496,2560,21760,21824⟩)))) (.node (.node (.single ⟨2496,2560,21824,21888⟩) (.single ⟨2432,2496,21888,21952⟩)) (.node (.single ⟨2432,2496,21952,22016⟩) (.node (.single ⟨2496,2560,21888,21952⟩) (.single ⟨2496,2560,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,30208,30272⟩) (.single ⟨10752,10816,30272,30336⟩)) (.node (.single ⟨10816,10880,30208,30272⟩) (.node (.single ⟨10816,10880,30272,30336⟩) (.single ⟨10752,10880,30336,30464⟩)))) (.node (.node (.single ⟨10880,10944,30208,30272⟩) (.single ⟨10880,10944,30272,30336⟩)) (.node (.single ⟨10944,11008,30208,30272⟩) (.node (.single ⟨10944,11008,30272,30336⟩) (.single ⟨10880,11008,30336,30464⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,2304,2432⟩) (.single ⟨21760,21824,2432,2496⟩)) (.node (.single ⟨21760,21824,2496,2560⟩) (.node (.single ⟨21824,21888,2432,2496⟩) (.single ⟨21824,21888,2496,2560⟩)))) (.node (.node (.single ⟨21888,22016,2304,2432⟩) (.single ⟨21888,21952,2432,2496⟩)) (.node (.single ⟨21888,21952,2496,2560⟩) (.node (.single ⟨21952,22016,2432,2496⟩) (.single ⟨21952,22016,2496,2560⟩))))) (.node (.node (.node (.single ⟨30208,30272,10752,10816⟩) (.single ⟨30208,30272,10816,10880⟩)) (.node (.single ⟨30272,30336,10752,10816⟩) (.node (.single ⟨30272,30336,10816,10880⟩) (.single ⟨30208,30272,10880,10944⟩)))) (.node (.node (.single ⟨30208,30272,10944,11008⟩) (.single ⟨30272,30336,10880,10944⟩)) (.node (.single ⟨30272,30336,10944,11008⟩) (.node (.single ⟨30336,30464,10752,10880⟩) (.single ⟨30336,30464,10880,11008⟩)))))))
def output2 : Fin 40 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData2 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover2 (i : Fin 40) : Fin 40 := ⟨coverData2.get i % 40, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 40) : Fin 40 := ⟨sourceData2.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 (.cutY 22016 (.cutX 2304 .empty (.cutY 21760 .empty (.cutX 2432 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 2496 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) (.cutX 2496 (.cutY 21952 .full .full) (.cutY 21952 .full .full)))))) .empty) .empty)) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 .empty (.cutX 11008 (.cutY 30464 (.cutX 10880 (.cutY 30336 (.cutX 10816 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full) (.cutY 30336 (.cutX 10944 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty)))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 (.cutX 21760 .empty (.cutY 2304 .empty (.cutX 21888 (.cutY 2432 .full (.cutX 21824 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full (.cutX 21952 (.cutY 2496 .full .full) (.cutY 2496 .full .full)))))) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 .empty (.cutY 10752 .empty (.cutX 30464 (.cutY 11008 (.cutX 30336 (.cutY 10880 (.cutX 30272 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 30272 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty))) .empty) .empty)))) .empty))

theorem metadata2 : 0<72090291 ∧ 9<128 ∧ 85<128 ∧ 0<4 ∧
    1156/4160=0 ∧ 1156%4160=1156 ∧ ∀ i, (leaves2 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData2).mp
    (by decide +kernel)

theorem sourceChecked2_0 : ∀ i : Fin 40,
    (fun i => output2 i = raw2 (source2 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked2 : ∀ i : Fin 40, (fun i => output2 i = raw2 (source2 i)) i :=
  forallFin_of_zero_offset (fun i => output2 i = raw2 (source2 i)) sourceChecked2_0

theorem coverChecked2_0 : ∀ i : Fin 40,
    (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked2 : ∀ i : Fin 40, (fun i => (output2 (cover2 i)).ContainsBox (raw2 i)) i :=
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 7091, atom 5423, type 1, source (10,83).
def leavesData3 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves3 : Fin 10 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 83 leaves3 i
def outputData3 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2688,21248,21376⟩) (.single ⟨2560,2688,21376,21504⟩)) (.node (.single ⟨2688,2752,21248,21312⟩) (.node (.single ⟨2688,2752,21312,21376⟩) (.single ⟨2752,2816,21248,21312⟩)))) (.node (.node (.single ⟨2752,2816,21312,21376⟩) (.single ⟨2688,2752,21376,21440⟩)) (.node (.single ⟨2688,2752,21440,21504⟩) (.node (.single ⟨2752,2816,21376,21440⟩) (.single ⟨2752,2816,21440,21504⟩))))) (.node (.node (.node (.single ⟨11264,11328,29952,30016⟩) (.single ⟨11264,11328,30016,30080⟩)) (.node (.single ⟨11328,11392,29952,30016⟩) (.node (.single ⟨11328,11392,30016,30080⟩) (.single ⟨11264,11392,30080,30208⟩)))) (.node (.node (.single ⟨11392,11456,29952,30016⟩) (.single ⟨11392,11456,30016,30080⟩)) (.node (.single ⟨11456,11520,29952,30016⟩) (.node (.single ⟨11456,11520,30016,30080⟩) (.single ⟨11392,11520,30080,30208⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,2560,2688⟩) (.single ⟨21248,21312,2688,2752⟩)) (.node (.single ⟨21248,21312,2752,2816⟩) (.node (.single ⟨21312,21376,2688,2752⟩) (.single ⟨21312,21376,2752,2816⟩)))) (.node (.node (.single ⟨21376,21504,2560,2688⟩) (.single ⟨21376,21440,2688,2752⟩)) (.node (.single ⟨21376,21440,2752,2816⟩) (.node (.single ⟨21440,21504,2688,2752⟩) (.single ⟨21440,21504,2752,2816⟩))))) (.node (.node (.node (.single ⟨29952,30016,11264,11328⟩) (.single ⟨29952,30016,11328,11392⟩)) (.node (.single ⟨30016,30080,11264,11328⟩) (.node (.single ⟨30016,30080,11328,11392⟩) (.single ⟨29952,30016,11392,11456⟩)))) (.node (.node (.single ⟨29952,30016,11456,11520⟩) (.single ⟨30016,30080,11392,11456⟩)) (.node (.single ⟨30016,30080,11456,11520⟩) (.node (.single ⟨30080,30208,11264,11392⟩) (.single ⟨30080,30208,11392,11520⟩)))))))
def output3 : Fin 40 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData3 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover3 (i : Fin 40) : Fin 40 := ⟨coverData3.get i % 40, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 40) : Fin 40 := ⟨sourceData3.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 .empty (.cutY 20992 .empty (.cutX 2816 (.cutY 21248 .empty (.cutX 2688 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 2752 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) (.cutX 2752 (.cutY 21440 .full .full) (.cutY 21440 .full .full))))) .empty))) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 (.cutX 11520 (.cutY 29952 .empty (.cutX 11392 (.cutY 30080 (.cutX 11328 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full) (.cutY 30080 (.cutX 11456 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 .empty (.cutX 21248 .empty (.cutY 2816 (.cutX 21376 (.cutY 2688 .full (.cutX 21312 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full (.cutX 21440 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 (.cutY 11776 (.cutX 29952 .empty (.cutY 11520 (.cutX 30080 (.cutY 11392 (.cutX 30016 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 30016 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty)) .empty) .empty)))) .empty) .empty)))) .empty))

theorem metadata3 : 0<139307719 ∧ 10<128 ∧ 83<128 ∧ 1<4 ∧
    5423/4160=1 ∧ 5423%4160=1263 ∧ ∀ i, (leaves3 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData3).mp
    (by decide +kernel)

theorem sourceChecked3_0 : ∀ i : Fin 40,
    (fun i => output3 i = raw3 (source3 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked3 : ∀ i : Fin 40, (fun i => output3 i = raw3 (source3 i)) i :=
  forallFin_of_zero_offset (fun i => output3 i = raw3 (source3 i)) sourceChecked3_0

theorem coverChecked3_0 : ∀ i : Fin 40,
    (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked3 : ∀ i : Fin 40, (fun i => (output3 (cover3 i)).ContainsBox (raw3 i)) i :=
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 7092, atom 5313, type 1, source (9,82).
def leavesData4 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves4 : Fin 7 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 82 leaves4 i
def outputData4 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,20992,21120⟩) (.node (.single ⟨2304,2432,21120,21248⟩) (.single ⟨2432,2496,20992,21056⟩))) (.node (.node (.single ⟨2432,2496,21056,21120⟩) (.single ⟨2496,2560,20992,21056⟩)) (.node (.single ⟨2496,2560,21056,21120⟩) (.single ⟨2432,2560,21120,21248⟩)))) (.node (.node (.single ⟨11520,11648,30208,30336⟩) (.node (.single ⟨11520,11648,30336,30464⟩) (.single ⟨11648,11712,30208,30272⟩))) (.node (.node (.single ⟨11648,11712,30272,30336⟩) (.single ⟨11712,11776,30208,30272⟩)) (.node (.single ⟨11712,11776,30272,30336⟩) (.single ⟨11648,11776,30336,30464⟩))))) (.node (.node (.node (.single ⟨20992,21120,2304,2432⟩) (.node (.single ⟨20992,21056,2432,2496⟩) (.single ⟨20992,21056,2496,2560⟩))) (.node (.node (.single ⟨21056,21120,2432,2496⟩) (.single ⟨21056,21120,2496,2560⟩)) (.node (.single ⟨21120,21248,2304,2432⟩) (.single ⟨21120,21248,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,11520,11648⟩) (.node (.single ⟨30208,30272,11648,11712⟩) (.single ⟨30208,30272,11712,11776⟩))) (.node (.node (.single ⟨30272,30336,11648,11712⟩) (.single ⟨30272,30336,11712,11776⟩)) (.node (.single ⟨30336,30464,11520,11648⟩) (.single ⟨30336,30464,11648,11776⟩))))))
def output4 : Fin 28 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData4 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover4 (i : Fin 28) : Fin 28 := ⟨coverData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 28) : Fin 28 := ⟨sourceData4.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 .empty (.cutX 2304 .empty (.cutY 21248 (.cutX 2432 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 2496 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 .empty (.cutX 11520 .empty (.cutY 30464 (.cutX 11648 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 11712 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty))) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 (.cutX 21248 (.cutY 2304 .empty (.cutX 21120 (.cutY 2432 .full (.cutX 21056 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 (.cutX 30464 (.cutY 11520 .empty (.cutX 30336 (.cutY 11648 .full (.cutX 30272 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full .full))) .empty) .empty))))) .empty) .empty)))) .empty))

theorem metadata4 : 0<139307719 ∧ 9<128 ∧ 82<128 ∧ 1<4 ∧
    5313/4160=1 ∧ 5313%4160=1153 ∧ ∀ i, (leaves4 i).Valid 8 := by
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 7093, atom 5087, type 1, source (7,80).
def leavesData5 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves5 : Fin 10 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 7 80 leaves5 i
def outputData5 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,20480,20544⟩) (.single ⟨1792,1856,20544,20608⟩)) (.node (.single ⟨1856,1920,20480,20544⟩) (.node (.single ⟨1856,1920,20544,20608⟩) (.single ⟨1792,1920,20608,20736⟩)))) (.node (.node (.single ⟨1920,1984,20480,20544⟩) (.single ⟨1920,1984,20544,20608⟩)) (.node (.single ⟨1984,2048,20480,20544⟩) (.node (.single ⟨1984,2048,20544,20608⟩) (.single ⟨1920,2048,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,30720,30848⟩) (.single ⟨12032,12160,30848,30976⟩)) (.node (.single ⟨12160,12224,30720,30784⟩) (.node (.single ⟨12160,12224,30784,30848⟩) (.single ⟨12224,12288,30720,30784⟩)))) (.node (.node (.single ⟨12224,12288,30784,30848⟩) (.single ⟨12160,12224,30848,30912⟩)) (.node (.single ⟨12160,12224,30912,30976⟩) (.node (.single ⟨12224,12288,30848,30912⟩) (.single ⟨12224,12288,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,1792,1856⟩) (.single ⟨20480,20544,1856,1920⟩)) (.node (.single ⟨20544,20608,1792,1856⟩) (.node (.single ⟨20544,20608,1856,1920⟩) (.single ⟨20480,20544,1920,1984⟩)))) (.node (.node (.single ⟨20480,20544,1984,2048⟩) (.single ⟨20544,20608,1920,1984⟩)) (.node (.single ⟨20544,20608,1984,2048⟩) (.node (.single ⟨20608,20736,1792,1920⟩) (.single ⟨20608,20736,1920,2048⟩))))) (.node (.node (.node (.single ⟨30720,30848,12032,12160⟩) (.single ⟨30720,30784,12160,12224⟩)) (.node (.single ⟨30720,30784,12224,12288⟩) (.node (.single ⟨30784,30848,12160,12224⟩) (.single ⟨30784,30848,12224,12288⟩)))) (.node (.node (.single ⟨30848,30976,12032,12160⟩) (.single ⟨30848,30912,12160,12224⟩)) (.node (.single ⟨30848,30912,12224,12288⟩) (.node (.single ⟨30912,30976,12160,12224⟩) (.single ⟨30912,30976,12224,12288⟩)))))))
def output5 : Fin 40 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover5 (i : Fin 40) : Fin 40 := ⟨coverData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 40) : Fin 40 := ⟨sourceData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 (.cutX 1792 .empty (.cutY 20736 (.cutX 1920 (.cutY 20608 (.cutX 1856 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 1984 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty)) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 (.cutX 12032 .empty (.cutY 30976 (.cutX 12160 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 12224 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 12224 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty)) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 .empty (.cutX 20736 (.cutY 1792 .empty (.cutX 20608 (.cutY 1920 (.cutX 20544 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 20544 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 .empty (.cutX 30976 (.cutY 12032 .empty (.cutX 30848 (.cutY 12160 .full (.cutX 30784 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 30912 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)) .empty)) .empty))) .empty)))) .empty))

theorem metadata5 : 0<117939641 ∧ 7<128 ∧ 80<128 ∧ 1<4 ∧
    5087/4160=1 ∧ 5087%4160=927 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (117939641/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (117939641/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 7094, atom 2753, type 0, source (26,101).
def leavesData6 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves6 : Fin 16 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 26 101 leaves6 i
def outputData6 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,25856,25920⟩) (.single ⟨6656,6720,25920,25984⟩)) (.node (.single ⟨6720,6784,25856,25920⟩) (.single ⟨6720,6784,25920,25984⟩))) (.node (.node (.single ⟨6656,6784,25984,26112⟩) (.single ⟨6784,6848,25856,25920⟩)) (.node (.single ⟨6784,6848,25920,25984⟩) (.single ⟨6848,6880,25856,25888⟩)))) (.node (.node (.node (.single ⟨6848,6880,25888,25920⟩) (.single ⟨6880,6912,25856,25888⟩)) (.node (.single ⟨6880,6912,25888,25920⟩) (.single ⟨6848,6912,25920,25984⟩))) (.node (.node (.single ⟨6784,6848,25984,26048⟩) (.single ⟨6784,6848,26048,26112⟩)) (.node (.single ⟨6848,6912,25984,26048⟩) (.single ⟨6848,6912,26048,26112⟩))))) (.node (.node (.node (.node (.single ⟨25856,25920,6656,6720⟩) (.single ⟨25856,25920,6720,6784⟩)) (.node (.single ⟨25920,25984,6656,6720⟩) (.single ⟨25920,25984,6720,6784⟩))) (.node (.node (.single ⟨25856,25920,6784,6848⟩) (.single ⟨25856,25888,6848,6880⟩)) (.node (.single ⟨25856,25888,6880,6912⟩) (.single ⟨25888,25920,6848,6880⟩)))) (.node (.node (.node (.single ⟨25888,25920,6880,6912⟩) (.single ⟨25920,25984,6784,6848⟩)) (.node (.single ⟨25920,25984,6848,6912⟩) (.single ⟨25984,26112,6656,6784⟩))) (.node (.node (.single ⟨25984,26048,6784,6848⟩) (.single ⟨25984,26048,6848,6912⟩)) (.node (.single ⟨26048,26112,6784,6848⟩) (.single ⟨26048,26112,6848,6912⟩))))))
def output6 : Fin 32 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15)))) (.node (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13))) (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))))) (.node (.node (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3)))))) (.node (.node (.node (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData6 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))) (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 25)) (.node (.single 22) (.single 1))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6))))))
def cover6 (i : Fin 64) : Fin 32 := ⟨coverData6.get i % 32, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 32) : Fin 64 := ⟨sourceData6.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 .empty (.cutY 26112 (.cutX 6912 (.cutY 25856 .empty (.cutX 6784 (.cutY 25984 (.cutX 6720 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 6848 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 6880 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 6848 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 .empty (.cutX 25856 .empty (.cutY 6912 (.cutX 25984 (.cutY 6784 (.cutX 25920 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 25920 (.cutY 6848 .full (.cutX 25888 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 26048 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty))) .empty) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata6 : 0<31548346 ∧ 26<128 ∧ 101<128 ∧ 0<4 ∧
    2753/4160=0 ∧ 2753%4160=2753 ∧ ∀ i, (leaves6 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData6).mp
    (by decide +kernel)

theorem sourceChecked6_0 : ∀ i : Fin 32,
    (fun i => output6 i = raw6 (source6 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked6 : ∀ i : Fin 32, (fun i => output6 i = raw6 (source6 i)) i :=
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

theorem areaUnits6 : gridUnionAreaUnits output6 = 131072 := by decide +kernel

noncomputable def phaseMass6 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (15774173/1638400000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 7095, atom 2170, type 0, source (19,99).
def leavesData7 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves7 : Fin 10 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 99 leaves7 i
def outputData7 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,25344,25408⟩) (.single ⟨4864,4928,25408,25472⟩)) (.node (.single ⟨4928,4992,25344,25408⟩) (.node (.single ⟨4928,4992,25408,25472⟩) (.single ⟨4864,4992,25472,25600⟩)))) (.node (.node (.single ⟨4992,5056,25344,25408⟩) (.single ⟨4992,5056,25408,25472⟩)) (.node (.single ⟨5056,5120,25344,25408⟩) (.node (.single ⟨5056,5120,25408,25472⟩) (.single ⟨4992,5120,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,27648,27776⟩) (.single ⟨7168,7296,27776,27904⟩)) (.node (.single ⟨7296,7360,27648,27712⟩) (.node (.single ⟨7296,7360,27712,27776⟩) (.single ⟨7360,7424,27648,27712⟩)))) (.node (.node (.single ⟨7360,7424,27712,27776⟩) (.single ⟨7296,7360,27776,27840⟩)) (.node (.single ⟨7296,7360,27840,27904⟩) (.node (.single ⟨7360,7424,27776,27840⟩) (.single ⟨7360,7424,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,4864,4928⟩) (.single ⟨25344,25408,4928,4992⟩)) (.node (.single ⟨25408,25472,4864,4928⟩) (.node (.single ⟨25408,25472,4928,4992⟩) (.single ⟨25344,25408,4992,5056⟩)))) (.node (.node (.single ⟨25344,25408,5056,5120⟩) (.single ⟨25408,25472,4992,5056⟩)) (.node (.single ⟨25408,25472,5056,5120⟩) (.node (.single ⟨25472,25600,4864,4992⟩) (.single ⟨25472,25600,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,7168,7296⟩) (.single ⟨27648,27712,7296,7360⟩)) (.node (.single ⟨27648,27712,7360,7424⟩) (.node (.single ⟨27712,27776,7296,7360⟩) (.single ⟨27712,27776,7360,7424⟩)))) (.node (.node (.single ⟨27776,27904,7168,7296⟩) (.single ⟨27776,27840,7296,7360⟩)) (.node (.single ⟨27776,27840,7360,7424⟩) (.node (.single ⟨27840,27904,7296,7360⟩) (.single ⟨27840,27904,7360,7424⟩)))))))
def output7 : Fin 40 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData7 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover7 (i : Fin 40) : Fin 40 := ⟨coverData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 40) : Fin 40 := ⟨sourceData7.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 .empty (.cutX 4864 .empty (.cutY 25344 .empty (.cutX 4992 (.cutY 25472 (.cutX 4928 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 5056 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full)))))) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 (.cutX 7424 (.cutY 27904 (.cutX 7296 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 7360 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 7360 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 .empty (.cutX 25344 .empty (.cutY 4864 .empty (.cutX 25472 (.cutY 4992 (.cutX 25408 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 25408 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 (.cutX 27904 (.cutY 7424 (.cutX 27776 (.cutY 7296 .full (.cutX 27712 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 27840 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) .empty) .empty) .empty)))))) .empty) .empty)) .empty))

theorem metadata7 : 0<121837468 ∧ 19<128 ∧ 99<128 ∧ 0<4 ∧
    2170/4160=0 ∧ 2170%4160=2170 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 7096, atom 813, type 0, source (6,81).
def leavesData8 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,3,0⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves8 : Fin 13 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 6 81 leaves8 i
def outputData8 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,20736,20800⟩) (.node (.single ⟨1536,1600,20800,20864⟩) (.single ⟨1600,1664,20736,20800⟩))) (.node (.single ⟨1600,1664,20800,20864⟩) (.node (.single ⟨1536,1664,20864,20992⟩) (.single ⟨1664,1728,20736,20800⟩)))) (.node (.node (.single ⟨1664,1728,20800,20864⟩) (.node (.single ⟨1728,1792,20736,20800⟩) (.single ⟨1728,1792,20800,20864⟩))) (.node (.node (.single ⟨1664,1728,20864,20928⟩) (.single ⟨1664,1728,20928,20992⟩)) (.node (.single ⟨1728,1792,20864,20928⟩) (.single ⟨1728,1792,20928,20992⟩))))) (.node (.node (.node (.single ⟨11776,11840,30976,31040⟩) (.node (.single ⟨11776,11840,31040,31104⟩) (.single ⟨11840,11904,30976,31040⟩))) (.node (.single ⟨11840,11904,31040,31104⟩) (.node (.single ⟨11776,11904,31104,31232⟩) (.single ⟨11904,11968,30976,31040⟩)))) (.node (.node (.single ⟨11904,11968,31040,31104⟩) (.node (.single ⟨11968,12032,30976,31040⟩) (.single ⟨11968,12032,31040,31104⟩))) (.node (.node (.single ⟨11904,11968,31104,31168⟩) (.single ⟨11904,11968,31168,31232⟩)) (.node (.single ⟨11968,12032,31104,31168⟩) (.single ⟨11968,12032,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,1536,1600⟩) (.node (.single ⟨20736,20800,1600,1664⟩) (.single ⟨20800,20864,1536,1600⟩))) (.node (.single ⟨20800,20864,1600,1664⟩) (.node (.single ⟨20736,20800,1664,1728⟩) (.single ⟨20736,20800,1728,1792⟩)))) (.node (.node (.single ⟨20800,20864,1664,1728⟩) (.node (.single ⟨20800,20864,1728,1792⟩) (.single ⟨20864,20992,1536,1664⟩))) (.node (.node (.single ⟨20864,20928,1664,1728⟩) (.single ⟨20864,20928,1728,1792⟩)) (.node (.single ⟨20928,20992,1664,1728⟩) (.single ⟨20928,20992,1728,1792⟩))))) (.node (.node (.node (.single ⟨30976,31040,11776,11840⟩) (.node (.single ⟨30976,31040,11840,11904⟩) (.single ⟨31040,31104,11776,11840⟩))) (.node (.single ⟨31040,31104,11840,11904⟩) (.node (.single ⟨30976,31040,11904,11968⟩) (.single ⟨30976,31040,11968,12032⟩)))) (.node (.node (.single ⟨31040,31104,11904,11968⟩) (.node (.single ⟨31040,31104,11968,12032⟩) (.single ⟨31104,31232,11776,11904⟩))) (.node (.node (.single ⟨31104,31168,11904,11968⟩) (.single ⟨31104,31168,11968,12032⟩)) (.node (.single ⟨31168,31232,11904,11968⟩) (.single ⟨31168,31232,11968,12032⟩)))))))
def output8 : Fin 52 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 7))))) (.node (.node (.node (.single 31) (.node (.single 44) (.single 20))) (.node (.single 8) (.node (.single 33) (.single 43)))) (.node (.node (.single 18) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData8 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 19)))) (.node (.node (.single 11) (.node (.single 15) (.single 7))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 5) (.single 13)))) (.node (.node (.single 9) (.node (.single 17) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 18) (.single 14)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover8 (i : Fin 52) : Fin 52 := ⟨coverData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 52) : Fin 52 := ⟨sourceData8.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 (.cutX 1792 (.cutY 20736 .empty (.cutX 1664 (.cutY 20864 (.cutX 1600 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 1728 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) (.cutX 1728 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 (.cutX 12032 (.cutY 30976 .empty (.cutX 11904 (.cutY 31104 (.cutX 11840 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full) (.cutY 31104 (.cutX 11968 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 11968 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty)) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 .empty (.cutX 20736 .empty (.cutY 1792 (.cutX 20864 (.cutY 1664 (.cutX 20800 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 20800 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full (.cutX 20928 (.cutY 1728 .full .full) (.cutY 1728 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 .empty (.cutX 30976 .empty (.cutY 12032 (.cutX 31104 (.cutY 11904 (.cutX 31040 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 31040 (.cutY 11968 .full .full) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 31168 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))) .empty)) .empty))) .empty)))) .empty))

theorem metadata8 : 0<25614016 ∧ 6<128 ∧ 81<128 ∧ 0<4 ∧
    813/4160=0 ∧ 813%4160=813 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (400219/25600000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 7097, atom 11429, type 2, source (32,37).
def leavesData9 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves9 : Fin 4 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 37 leaves9 i
def outputData9 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,9472,9600⟩) (.single ⟨8192,8320,9600,9728⟩)) (.node (.single ⟨8320,8448,9472,9600⟩) (.single ⟨8320,8448,9600,9728⟩))) (.node (.node (.single ⟨9472,9600,8192,8320⟩) (.single ⟨9472,9600,8320,8448⟩)) (.node (.single ⟨9600,9728,8192,8320⟩) (.single ⟨9600,9728,8320,8448⟩)))) (.node (.node (.node (.single ⟨23040,23168,24320,24448⟩) (.single ⟨23040,23168,24448,24576⟩)) (.node (.single ⟨23168,23296,24320,24448⟩) (.single ⟨23168,23296,24448,24576⟩))) (.node (.node (.single ⟨24320,24448,23040,23168⟩) (.single ⟨24320,24448,23168,23296⟩)) (.node (.single ⟨24448,24576,23040,23168⟩) (.single ⟨24448,24576,23168,23296⟩)))))
def output9 : Fin 16 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData9 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover9 (i : Fin 16) : Fin 16 := ⟨coverData9.get i % 16, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 16) : Fin 16 := ⟨sourceData9.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 (.cutY 9728 (.cutX 8448 (.cutY 9472 .empty (.cutX 8320 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty) .empty)) (.cutY 9216 (.cutX 9728 (.cutY 8704 (.cutX 9472 .empty (.cutY 8448 (.cutX 9600 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 .empty (.cutY 24064 .empty (.cutX 23296 (.cutY 24320 .empty (.cutX 23168 (.cutY 24448 .full .full) (.cutY 24448 .full .full))) .empty)))) (.cutY 23552 (.cutX 24064 .empty (.cutY 23040 .empty (.cutX 24320 .empty (.cutY 23296 (.cutX 24448 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty)))) .empty)))))) .empty) .empty)))

theorem metadata9 : 0<89641976 ∧ 32<128 ∧ 37<128 ∧ 2<4 ∧
    11429/4160=2 ∧ 11429%4160=3109 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (89641976/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (11205247/204800000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 7098, atom 10137, type 2, source (16,25).
def leavesData10 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves10 : Fin 4 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 25 leaves10 i
def outputData10 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,6400,6528⟩) (.single ⟨4096,4224,6528,6656⟩)) (.node (.single ⟨4224,4352,6400,6528⟩) (.single ⟨4224,4352,6528,6656⟩))) (.node (.node (.single ⟨6400,6528,4096,4224⟩) (.single ⟨6400,6528,4224,4352⟩)) (.node (.single ⟨6528,6656,4096,4224⟩) (.single ⟨6528,6656,4224,4352⟩)))) (.node (.node (.node (.single ⟨26112,26240,28416,28544⟩) (.single ⟨26112,26240,28544,28672⟩)) (.node (.single ⟨26240,26368,28416,28544⟩) (.single ⟨26240,26368,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,26112,26240⟩) (.single ⟨28416,28544,26240,26368⟩)) (.node (.single ⟨28544,28672,26112,26240⟩) (.single ⟨28544,28672,26240,26368⟩)))))
def output10 : Fin 16 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData10 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover10 (i : Fin 16) : Fin 16 := ⟨coverData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 16) : Fin 16 := ⟨sourceData10.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 (.cutY 7168 (.cutX 4608 (.cutY 6656 (.cutX 4352 (.cutY 6400 .empty (.cutX 4224 (.cutY 6528 .full .full) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty) .empty)) (.cutY 6144 (.cutX 7168 (.cutY 5120 (.cutX 6656 (.cutY 4608 (.cutX 6400 .empty (.cutY 4352 (.cutX 6528 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 .empty (.cutX 26112 .empty (.cutY 28160 .empty (.cutX 26368 (.cutY 28416 .empty (.cutX 26240 (.cutY 28544 .full .full) (.cutY 28544 .full .full))) .empty)))))) (.cutY 26624 (.cutX 27648 .empty (.cutY 25600 .empty (.cutX 28160 .empty (.cutY 26112 .empty (.cutX 28416 .empty (.cutY 26368 (.cutX 28544 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty)))))) .empty)) .empty) .empty)))))

theorem metadata10 : 0<76869833 ∧ 16<128 ∧ 25<128 ∧ 2<4 ∧
    10137/4160=2 ∧ 10137%4160=1817 ∧ ∀ i, (leaves10 i).Valid 8 := by
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 7099, atom 11614, type 2, source (35,39).
def leavesData11 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves11 : Fin 4 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 39 leaves11 i
def outputData11 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,9984,10112⟩) (.single ⟨8960,9088,10112,10240⟩)) (.node (.single ⟨9088,9216,9984,10112⟩) (.single ⟨9088,9216,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,8960,9088⟩) (.single ⟨9984,10112,9088,9216⟩)) (.node (.single ⟨10112,10240,8960,9088⟩) (.single ⟨10112,10240,9088,9216⟩)))) (.node (.node (.node (.single ⟨22528,22656,23552,23680⟩) (.single ⟨22528,22656,23680,23808⟩)) (.node (.single ⟨22656,22784,23552,23680⟩) (.single ⟨22656,22784,23680,23808⟩))) (.node (.node (.single ⟨23552,23680,22528,22656⟩) (.single ⟨23552,23680,22656,22784⟩)) (.node (.single ⟨23680,23808,22528,22656⟩) (.single ⟨23680,23808,22656,22784⟩)))))
def output11 : Fin 16 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData11 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover11 (i : Fin 16) : Fin 16 := ⟨coverData11.get i % 16, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 16) : Fin 16 := ⟨sourceData11.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 .empty (.cutX 8960 .empty (.cutY 9984 .empty (.cutX 9088 (.cutY 10112 .full .full) (.cutY 10112 .full .full))))))) (.cutY 9216 (.cutX 9728 .empty (.cutY 8704 .empty (.cutX 9984 .empty (.cutY 8960 .empty (.cutX 10112 (.cutY 9088 .full .full) (.cutY 9088 .full .full)))))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 (.cutY 24064 (.cutX 22784 (.cutY 23808 (.cutX 22656 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty) .empty) .empty) .empty)) (.cutY 23552 (.cutX 24064 (.cutY 23040 (.cutX 23808 (.cutY 22784 (.cutX 23680 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty)))))) .empty) .empty)))

theorem metadata11 : 0<89641976 ∧ 35<128 ∧ 39<128 ∧ 2<4 ∧
    11614/4160=2 ∧ 11614%4160=3294 ∧ ∀ i, (leaves11 i).Valid 8 := by
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (89641976/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (11205247/204800000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 7100, atom 11226, type 2, source (29,35).
def leavesData12 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves12 : Fin 4 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 35 leaves12 i
def outputData12 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,8960,9088⟩) (.single ⟨7424,7552,9088,9216⟩)) (.node (.single ⟨7552,7680,8960,9088⟩) (.single ⟨7552,7680,9088,9216⟩))) (.node (.node (.single ⟨8960,9088,7424,7552⟩) (.single ⟨8960,9088,7552,7680⟩)) (.node (.single ⟨9088,9216,7424,7552⟩) (.single ⟨9088,9216,7552,7680⟩)))) (.node (.node (.node (.single ⟨23552,23680,25088,25216⟩) (.single ⟨23552,23680,25216,25344⟩)) (.node (.single ⟨23680,23808,25088,25216⟩) (.single ⟨23680,23808,25216,25344⟩))) (.node (.node (.single ⟨25088,25216,23552,23680⟩) (.single ⟨25088,25216,23680,23808⟩)) (.node (.single ⟨25216,25344,23552,23680⟩) (.single ⟨25216,25344,23680,23808⟩)))))
def output12 : Fin 16 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData12 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover12 (i : Fin 16) : Fin 16 := ⟨coverData12.get i % 16, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 16) : Fin 16 := ⟨sourceData12.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 (.cutY 8704 .empty (.cutX 7424 .empty (.cutY 8960 .empty (.cutX 7552 (.cutY 9088 .full .full) (.cutY 9088 .full .full))))) .empty) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 .empty (.cutY 7680 (.cutX 8960 .empty (.cutY 7424 .empty (.cutX 9088 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 (.cutY 25088 .empty (.cutX 23808 (.cutY 25344 (.cutX 23680 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty)) .empty) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 .empty (.cutY 24064 (.cutX 25344 (.cutY 23808 (.cutX 25216 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty) .empty) .empty))) .empty)) .empty)) .empty) .empty))))

theorem metadata12 : 0<43243096 ∧ 29<128 ∧ 35<128 ∧ 2<4 ∧
    11226/4160=2 ∧ 11226%4160=2906 ∧ ∀ i, (leaves12 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData12).mp
    (by decide +kernel)

theorem sourceChecked12_0 : ∀ i : Fin 16,
    (fun i => output12 i = raw12 (source12 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked12 : ∀ i : Fin 16, (fun i => output12 i = raw12 (source12 i)) i :=
  forallFin_of_zero_offset (fun i => output12 i = raw12 (source12 i)) sourceChecked12_0

theorem coverChecked12_0 : ∀ i : Fin 16,
    (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked12 : ∀ i : Fin 16, (fun i => (output12 (cover12 i)).ContainsBox (raw12 i)) i :=
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 7101, atom 10418, type 2, source (19,27).
def leavesData13 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves13 : Fin 4 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 27 leaves13 i
def outputData13 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,6912,7040⟩) (.single ⟨4864,4992,7040,7168⟩)) (.node (.single ⟨4992,5120,6912,7040⟩) (.single ⟨4992,5120,7040,7168⟩))) (.node (.node (.single ⟨6912,7040,4864,4992⟩) (.single ⟨6912,7040,4992,5120⟩)) (.node (.single ⟨7040,7168,4864,4992⟩) (.single ⟨7040,7168,4992,5120⟩)))) (.node (.node (.node (.single ⟨25600,25728,27648,27776⟩) (.single ⟨25600,25728,27776,27904⟩)) (.node (.single ⟨25728,25856,27648,27776⟩) (.single ⟨25728,25856,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,25600,25728⟩) (.single ⟨27648,27776,25728,25856⟩)) (.node (.single ⟨27776,27904,25600,25728⟩) (.single ⟨27776,27904,25728,25856⟩)))))
def output13 : Fin 16 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover13 (i : Fin 16) : Fin 16 := ⟨coverData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 16) : Fin 16 := ⟨sourceData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 (.cutY 7168 (.cutX 4608 .empty (.cutY 6656 .empty (.cutX 4864 .empty (.cutY 6912 .empty (.cutX 4992 (.cutY 7040 .full .full) (.cutY 7040 .full .full)))))) .empty) .empty)) (.cutY 6144 (.cutX 7168 (.cutY 5120 (.cutX 6656 .empty (.cutY 4608 .empty (.cutX 6912 .empty (.cutY 4864 .empty (.cutX 7040 (.cutY 4992 .full .full) (.cutY 4992 .full .full)))))) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 .empty (.cutX 26112 (.cutY 28160 (.cutX 25856 (.cutY 27904 (.cutX 25728 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty) .empty) .empty) .empty)))) (.cutY 26624 (.cutX 27648 .empty (.cutY 25600 .empty (.cutX 28160 (.cutY 26112 (.cutX 27904 (.cutY 25856 (.cutX 27776 (.cutY 25728 .full .full) (.cutY 25728 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty)))))

theorem metadata13 : 0<76869833 ∧ 19<128 ∧ 27<128 ∧ 2<4 ∧
    10418/4160=2 ∧ 10418%4160=2098 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 7102, atom 9516, type 2, source (10,16).
def leavesData14 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves14 : Fin 10 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 16 leaves14 i
def outputData14 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2688,4096,4224⟩) (.single ⟨2560,2688,4224,4352⟩)) (.node (.single ⟨2688,2752,4096,4160⟩) (.node (.single ⟨2688,2752,4160,4224⟩) (.single ⟨2752,2816,4096,4160⟩)))) (.node (.node (.single ⟨2752,2816,4160,4224⟩) (.single ⟨2688,2752,4224,4288⟩)) (.node (.single ⟨2688,2752,4288,4352⟩) (.node (.single ⟨2752,2816,4224,4288⟩) (.single ⟨2752,2816,4288,4352⟩))))) (.node (.node (.node (.single ⟨4096,4224,2560,2688⟩) (.single ⟨4096,4160,2688,2752⟩)) (.node (.single ⟨4096,4160,2752,2816⟩) (.node (.single ⟨4160,4224,2688,2752⟩) (.single ⟨4160,4224,2752,2816⟩)))) (.node (.node (.single ⟨4224,4352,2560,2688⟩) (.single ⟨4224,4288,2688,2752⟩)) (.node (.single ⟨4224,4288,2752,2816⟩) (.node (.single ⟨4288,4352,2688,2752⟩) (.single ⟨4288,4352,2752,2816⟩)))))) (.node (.node (.node (.node (.single ⟨28416,28480,29952,30016⟩) (.single ⟨28416,28480,30016,30080⟩)) (.node (.single ⟨28480,28544,29952,30016⟩) (.node (.single ⟨28480,28544,30016,30080⟩) (.single ⟨28416,28544,30080,30208⟩)))) (.node (.node (.single ⟨28544,28608,29952,30016⟩) (.single ⟨28544,28608,30016,30080⟩)) (.node (.single ⟨28608,28672,29952,30016⟩) (.node (.single ⟨28608,28672,30016,30080⟩) (.single ⟨28544,28672,30080,30208⟩))))) (.node (.node (.node (.single ⟨29952,30016,28416,28480⟩) (.single ⟨29952,30016,28480,28544⟩)) (.node (.single ⟨30016,30080,28416,28480⟩) (.node (.single ⟨30016,30080,28480,28544⟩) (.single ⟨29952,30016,28544,28608⟩)))) (.node (.node (.single ⟨29952,30016,28608,28672⟩) (.single ⟨30016,30080,28544,28608⟩)) (.node (.single ⟨30016,30080,28608,28672⟩) (.node (.single ⟨30080,30208,28416,28544⟩) (.single ⟨30080,30208,28544,28672⟩)))))))
def output14 : Fin 40 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 15) (.single 38)) (.node (.single 24) (.node (.single 2) (.single 11))))) (.node (.node (.node (.single 37) (.single 28)) (.node (.single 3) (.node (.single 13) (.single 36)))) (.node (.node (.single 26) (.single 4)) (.node (.single 12) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 5) (.single 14)) (.node (.single 34) (.node (.single 25) (.single 6)))) (.node (.node (.single 16) (.single 33)) (.node (.single 23) (.node (.single 7) (.single 18))))) (.node (.node (.node (.single 32) (.single 21)) (.node (.single 8) (.node (.single 17) (.single 31)))) (.node (.node (.single 22) (.single 9)) (.node (.single 19) (.node (.single 30) (.single 20)))))))
def sourceData14 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover14 (i : Fin 40) : Fin 40 := ⟨coverData14.get i % 40, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 40) : Fin 40 := ⟨sourceData14.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 (.cutX 3072 (.cutY 5120 (.cutX 2560 .empty (.cutY 4608 (.cutX 2816 (.cutY 4352 (.cutX 2688 (.cutY 4224 .full .full) (.cutY 4224 (.cutX 2752 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 2752 (.cutY 4288 .full .full) (.cutY 4288 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty))) (.cutY 4096 (.cutX 6144 (.cutY 2048 .empty (.cutX 5120 (.cutY 3072 (.cutX 4608 (.cutY 2560 .empty (.cutX 4352 (.cutY 2816 (.cutX 4224 (.cutY 2688 .full (.cutX 4160 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full (.cutX 4288 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 .empty (.cutY 30720 (.cutX 27648 .empty (.cutY 29696 .empty (.cutX 28160 .empty (.cutY 30208 (.cutX 28416 .empty (.cutY 29952 .empty (.cutX 28544 (.cutY 30080 (.cutX 28480 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full) (.cutY 30080 (.cutX 28608 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty)))) .empty))) (.cutY 28672 (.cutX 30720 (.cutY 26624 .empty (.cutX 29696 .empty (.cutY 27648 .empty (.cutX 30208 (.cutY 28160 .empty (.cutX 29952 .empty (.cutY 28416 .empty (.cutX 30080 (.cutY 28544 (.cutX 30016 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) (.cutX 30016 (.cutY 28608 .full .full) (.cutY 28608 .full .full))) (.cutY 28544 .full .full))))) .empty)))) .empty) .empty))))))

theorem metadata14 : 0<135972718 ∧ 10<128 ∧ 16<128 ∧ 2<4 ∧
    9516/4160=2 ∧ 9516%4160=1196 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (135972718/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (67986359/819200000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 7103, atom 9839, type 2, source (13,24).
def leavesData15 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves15 : Fin 4 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 24 leaves15 i
def outputData15 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,6144,6272⟩) (.single ⟨3328,3456,6272,6400⟩)) (.node (.single ⟨3456,3584,6144,6272⟩) (.single ⟨3456,3584,6272,6400⟩))) (.node (.node (.single ⟨6144,6272,3328,3456⟩) (.single ⟨6144,6272,3456,3584⟩)) (.node (.single ⟨6272,6400,3328,3456⟩) (.single ⟨6272,6400,3456,3584⟩)))) (.node (.node (.node (.single ⟨26368,26496,29184,29312⟩) (.single ⟨26368,26496,29312,29440⟩)) (.node (.single ⟨26496,26624,29184,29312⟩) (.single ⟨26496,26624,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,26368,26496⟩) (.single ⟨29184,29312,26496,26624⟩)) (.node (.single ⟨29312,29440,26368,26496⟩) (.single ⟨29312,29440,26496,26624⟩)))))
def output15 : Fin 16 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData15 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover15 (i : Fin 16) : Fin 16 := ⟨coverData15.get i % 16, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 16) : Fin 16 := ⟨sourceData15.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 .empty (.cutX 3072 .empty (.cutY 7168 (.cutX 3584 (.cutY 6656 (.cutX 3328 .empty (.cutY 6400 (.cutX 3456 (.cutY 6272 .full .full) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty))))) (.cutY 4096 (.cutX 6144 .empty (.cutY 2048 .empty (.cutX 7168 (.cutY 3072 .empty (.cutX 6656 (.cutY 3584 (.cutX 6400 (.cutY 3328 .empty (.cutX 6272 (.cutY 3456 .full .full) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty))) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 (.cutY 30720 (.cutX 25600 .empty (.cutY 29696 (.cutX 26112 .empty (.cutY 29184 .empty (.cutX 26368 .empty (.cutY 29440 (.cutX 26496 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty)))) .empty)) .empty) .empty)) (.cutY 28672 (.cutX 30720 (.cutY 26624 (.cutX 29696 (.cutY 25600 .empty (.cutX 29184 .empty (.cutY 26112 .empty (.cutX 29440 (.cutY 26368 .empty (.cutX 29312 (.cutY 26496 .full .full) (.cutY 26496 .full .full))) .empty)))) .empty) .empty) .empty) .empty))))))

theorem metadata15 : 0<82727314 ∧ 13<128 ∧ 24<128 ∧ 2<4 ∧
    9839/4160=2 ∧ 9839%4160=1519 ∧ ∀ i, (leaves15 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData15).mp
    (by decide +kernel)

theorem sourceChecked15_0 : ∀ i : Fin 16,
    (fun i => output15 i = raw15 (source15 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked15 : ∀ i : Fin 16, (fun i => output15 i = raw15 (source15 i)) i :=
  forallFin_of_zero_offset (fun i => output15 i = raw15 (source15 i)) sourceChecked15_0

theorem coverChecked15_0 : ∀ i : Fin 16,
    (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked15 : ∀ i : Fin 16, (fun i => (output15 (cover15 i)).ContainsBox (raw15 i)) i :=
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (82727314/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (41363657/819200000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 7104, atom 9521, type 2, source (10,21).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 21 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,5376,5504⟩) (.node (.single ⟨2560,2688,5504,5632⟩) (.single ⟨2688,2752,5376,5440⟩))) (.node (.node (.single ⟨2688,2752,5440,5504⟩) (.single ⟨2752,2816,5376,5440⟩)) (.node (.single ⟨2752,2816,5440,5504⟩) (.single ⟨2688,2816,5504,5632⟩)))) (.node (.node (.single ⟨5376,5504,2560,2688⟩) (.node (.single ⟨5376,5440,2688,2752⟩) (.single ⟨5376,5440,2752,2816⟩))) (.node (.node (.single ⟨5440,5504,2688,2752⟩) (.single ⟨5440,5504,2752,2816⟩)) (.node (.single ⟨5504,5632,2560,2688⟩) (.single ⟨5504,5632,2688,2816⟩))))) (.node (.node (.node (.single ⟨27136,27264,29952,30080⟩) (.node (.single ⟨27136,27264,30080,30208⟩) (.single ⟨27264,27328,29952,30016⟩))) (.node (.node (.single ⟨27264,27328,30016,30080⟩) (.single ⟨27328,27392,29952,30016⟩)) (.node (.single ⟨27328,27392,30016,30080⟩) (.single ⟨27264,27392,30080,30208⟩)))) (.node (.node (.single ⟨29952,30080,27136,27264⟩) (.node (.single ⟨29952,30016,27264,27328⟩) (.single ⟨29952,30016,27328,27392⟩))) (.node (.node (.single ⟨30016,30080,27264,27328⟩) (.single ⟨30016,30080,27328,27392⟩)) (.node (.single ⟨30080,30208,27136,27264⟩) (.single ⟨30080,30208,27264,27392⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 (.cutX 3072 (.cutY 5120 .empty (.cutX 2560 .empty (.cutY 5632 (.cutX 2816 (.cutY 5376 .empty (.cutX 2688 (.cutY 5504 .full .full) (.cutY 5504 (.cutX 2752 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) .full))) .empty) .empty))) .empty) .empty))) (.cutY 4096 (.cutX 6144 (.cutY 2048 .empty (.cutX 5120 .empty (.cutY 3072 (.cutX 5632 (.cutY 2560 .empty (.cutX 5376 .empty (.cutY 2816 (.cutX 5504 (.cutY 2688 .full (.cutX 5440 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 .empty (.cutY 30720 (.cutX 27648 (.cutY 29696 .empty (.cutX 27136 .empty (.cutY 30208 (.cutX 27392 (.cutY 29952 .empty (.cutX 27264 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 27328 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full))) .empty) .empty))) .empty) .empty))) (.cutY 28672 (.cutX 30720 (.cutY 26624 .empty (.cutX 29696 .empty (.cutY 27648 (.cutX 30208 (.cutY 27136 .empty (.cutX 29952 .empty (.cutY 27392 (.cutX 30080 (.cutY 27264 .full (.cutX 30016 (.cutY 27328 .full .full) (.cutY 27328 .full .full))) (.cutY 27264 .full .full)) .empty))) .empty) .empty))) .empty) .empty))))))

theorem metadata16 : 0<135972718 ∧ 10<128 ∧ 21<128 ∧ 2<4 ∧
    9521/4160=2 ∧ 9521%4160=1201 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (135972718/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (67986359/819200000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 7105, atom 11493, type 2, source (33,38).
def leavesData17 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves17 : Fin 4 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 38 leaves17 i
def outputData17 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,9728,9856⟩) (.single ⟨8448,8576,9856,9984⟩)) (.node (.single ⟨8576,8704,9728,9856⟩) (.single ⟨8576,8704,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,8448,8576⟩) (.single ⟨9728,9856,8576,8704⟩)) (.node (.single ⟨9856,9984,8448,8576⟩) (.single ⟨9856,9984,8576,8704⟩)))) (.node (.node (.node (.single ⟨22784,22912,24064,24192⟩) (.single ⟨22784,22912,24192,24320⟩)) (.node (.single ⟨22912,23040,24064,24192⟩) (.single ⟨22912,23040,24192,24320⟩))) (.node (.node (.single ⟨24064,24192,22784,22912⟩) (.single ⟨24064,24192,22912,23040⟩)) (.node (.single ⟨24192,24320,22784,22912⟩) (.single ⟨24192,24320,22912,23040⟩)))))
def output17 : Fin 16 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData17 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover17 (i : Fin 16) : Fin 16 := ⟨coverData17.get i % 16, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 16) : Fin 16 := ⟨sourceData17.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 (.cutY 9728 .empty (.cutX 8448 .empty (.cutY 9984 (.cutX 8576 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty))) .empty)) (.cutY 9216 (.cutX 9728 .empty (.cutY 8704 (.cutX 9984 (.cutY 8448 .empty (.cutX 9856 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 (.cutY 24064 .empty (.cutX 22784 .empty (.cutY 24320 (.cutX 22912 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))) .empty)) (.cutY 23552 (.cutX 24064 .empty (.cutY 23040 (.cutX 24320 (.cutY 22784 .empty (.cutX 24192 (.cutY 22912 .full .full) (.cutY 22912 .full .full))) .empty) .empty)) .empty)))))) .empty) .empty)))

theorem metadata17 : 0<89641976 ∧ 33<128 ∧ 38<128 ∧ 2<4 ∧
    11493/4160=2 ∧ 11493%4160=3173 ∧ ∀ i, (leaves17 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData17).mp
    (by decide +kernel)

theorem sourceChecked17_0 : ∀ i : Fin 16,
    (fun i => output17 i = raw17 (source17 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked17 : ∀ i : Fin 16, (fun i => output17 i = raw17 (source17 i)) i :=
  forallFin_of_zero_offset (fun i => output17 i = raw17 (source17 i)) sourceChecked17_0

theorem coverChecked17_0 : ∀ i : Fin 16,
    (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked17 : ∀ i : Fin 16, (fun i => (output17 (cover17 i)).ContainsBox (raw17 i)) i :=
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (89641976/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (11205247/204800000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 7106, atom 11296, type 2, source (30,36).
def leavesData18 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves18 : Fin 4 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 36 leaves18 i
def outputData18 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,9216,9344⟩) (.single ⟨7680,7808,9344,9472⟩)) (.node (.single ⟨7808,7936,9216,9344⟩) (.single ⟨7808,7936,9344,9472⟩))) (.node (.node (.single ⟨9216,9344,7680,7808⟩) (.single ⟨9216,9344,7808,7936⟩)) (.node (.single ⟨9344,9472,7680,7808⟩) (.single ⟨9344,9472,7808,7936⟩)))) (.node (.node (.node (.single ⟨23296,23424,24832,24960⟩) (.single ⟨23296,23424,24960,25088⟩)) (.node (.single ⟨23424,23552,24832,24960⟩) (.single ⟨23424,23552,24960,25088⟩))) (.node (.node (.single ⟨24832,24960,23296,23424⟩) (.single ⟨24832,24960,23424,23552⟩)) (.node (.single ⟨24960,25088,23296,23424⟩) (.single ⟨24960,25088,23424,23552⟩)))))
def output18 : Fin 16 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData18 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover18 (i : Fin 16) : Fin 16 := ⟨coverData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 16) : Fin 16 := ⟨sourceData18.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 .empty (.cutX 7680 .empty (.cutY 9728 (.cutX 7936 (.cutY 9472 (.cutX 7808 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty)))) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 .empty (.cutY 7168 .empty (.cutX 9728 (.cutY 7680 .empty (.cutX 9472 (.cutY 7936 (.cutX 9344 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty) .empty)) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 (.cutY 25600 (.cutX 23040 .empty (.cutY 25088 (.cutX 23296 .empty (.cutY 24832 .empty (.cutX 23424 (.cutY 24960 .full .full) (.cutY 24960 .full .full)))) .empty)) .empty) .empty) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 (.cutX 25088 (.cutY 23040 .empty (.cutX 24832 .empty (.cutY 23296 .empty (.cutX 24960 (.cutY 23424 .full .full) (.cutY 23424 .full .full))))) .empty) .empty) .empty)) .empty)) .empty) .empty))))

theorem metadata18 : 0<43243096 ∧ 30<128 ∧ 36<128 ∧ 2<4 ∧
    11296/4160=2 ∧ 11296%4160=2976 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 7107, atom 929, type 0, source (7,82).
def leavesData19 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves19 : Fin 13 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 7 82 leaves19 i
def outputData19 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,20992,21056⟩) (.node (.single ⟨1792,1856,21056,21120⟩) (.single ⟨1856,1920,20992,21056⟩))) (.node (.single ⟨1856,1920,21056,21120⟩) (.node (.single ⟨1792,1920,21120,21248⟩) (.single ⟨1920,1984,20992,21056⟩)))) (.node (.node (.single ⟨1920,1984,21056,21120⟩) (.node (.single ⟨1984,2048,20992,21056⟩) (.single ⟨1984,2048,21056,21120⟩))) (.node (.node (.single ⟨1920,1984,21120,21184⟩) (.single ⟨1920,1984,21184,21248⟩)) (.node (.single ⟨1984,2048,21120,21184⟩) (.single ⟨1984,2048,21184,21248⟩))))) (.node (.node (.node (.single ⟨11520,11584,30720,30784⟩) (.node (.single ⟨11520,11584,30784,30848⟩) (.single ⟨11584,11648,30720,30784⟩))) (.node (.single ⟨11584,11648,30784,30848⟩) (.node (.single ⟨11520,11648,30848,30976⟩) (.single ⟨11648,11712,30720,30784⟩)))) (.node (.node (.single ⟨11648,11712,30784,30848⟩) (.node (.single ⟨11712,11776,30720,30784⟩) (.single ⟨11712,11776,30784,30848⟩))) (.node (.node (.single ⟨11648,11712,30848,30912⟩) (.single ⟨11648,11712,30912,30976⟩)) (.node (.single ⟨11712,11776,30848,30912⟩) (.single ⟨11712,11776,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,1792,1856⟩) (.node (.single ⟨20992,21056,1856,1920⟩) (.single ⟨21056,21120,1792,1856⟩))) (.node (.single ⟨21056,21120,1856,1920⟩) (.node (.single ⟨20992,21056,1920,1984⟩) (.single ⟨20992,21056,1984,2048⟩)))) (.node (.node (.single ⟨21056,21120,1920,1984⟩) (.node (.single ⟨21056,21120,1984,2048⟩) (.single ⟨21120,21248,1792,1920⟩))) (.node (.node (.single ⟨21120,21184,1920,1984⟩) (.single ⟨21120,21184,1984,2048⟩)) (.node (.single ⟨21184,21248,1920,1984⟩) (.single ⟨21184,21248,1984,2048⟩))))) (.node (.node (.node (.single ⟨30720,30784,11520,11584⟩) (.node (.single ⟨30720,30784,11584,11648⟩) (.single ⟨30784,30848,11520,11584⟩))) (.node (.single ⟨30784,30848,11584,11648⟩) (.node (.single ⟨30720,30784,11648,11712⟩) (.single ⟨30720,30784,11712,11776⟩)))) (.node (.node (.single ⟨30784,30848,11648,11712⟩) (.node (.single ⟨30784,30848,11712,11776⟩) (.single ⟨30848,30976,11520,11648⟩))) (.node (.node (.single ⟨30848,30912,11648,11712⟩) (.single ⟨30848,30912,11712,11776⟩)) (.node (.single ⟨30912,30976,11648,11712⟩) (.single ⟨30912,30976,11712,11776⟩)))))))
def output19 : Fin 52 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 5) (.single 30)))) (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.node (.single 32) (.single 45)) (.node (.single 19) (.single 9))))) (.node (.node (.node (.single 35) (.node (.single 42) (.single 16))) (.node (.single 10) (.node (.single 37) (.single 41)))) (.node (.node (.single 14) (.node (.single 7) (.single 31))) (.node (.node (.single 44) (.single 20)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 0)) (.node (.single 26) (.single 51))))) (.node (.node (.node (.single 25) (.node (.single 1) (.single 28))) (.node (.single 50) (.node (.single 23) (.single 2)))) (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.node (.single 3) (.single 29)) (.node (.single 48) (.single 22)))))))
def sourceData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 36) (.node (.single 40) (.single 44))) (.node (.single 48) (.node (.single 0) (.single 4)))) (.node (.node (.single 8) (.node (.single 20) (.single 24))) (.node (.node (.single 12) (.single 16)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 19) (.single 31))) (.node (.single 15) (.node (.single 3) (.single 27)))) (.node (.node (.single 11) (.node (.single 23) (.single 7))) (.node (.node (.single 51) (.single 43)) (.node (.single 47) (.single 39)))))) (.node (.node (.node (.node (.single 37) (.node (.single 45) (.single 41))) (.node (.single 49) (.node (.single 5) (.single 21)))) (.node (.node (.single 9) (.node (.single 25) (.single 1))) (.node (.node (.single 13) (.single 29)) (.node (.single 17) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 18))) (.node (.single 14) (.node (.single 26) (.single 22)))) (.node (.node (.single 10) (.node (.single 6) (.single 2))) (.node (.node (.single 50) (.single 46)) (.node (.single 42) (.single 38)))))))
def cover19 (i : Fin 52) : Fin 52 := ⟨coverData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 52) : Fin 52 := ⟨sourceData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 .empty (.cutX 1792 .empty (.cutY 21248 (.cutX 1920 (.cutY 21120 (.cutX 1856 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 1984 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) (.cutX 1984 (.cutY 21184 .full .full) (.cutY 21184 .full .full)))) .empty)))) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 (.cutY 31232 (.cutX 11520 .empty (.cutY 30976 (.cutX 11648 (.cutY 30848 (.cutX 11584 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) .full) (.cutY 30848 (.cutX 11712 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 11712 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty) .empty) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 .empty (.cutY 1536 .empty (.cutX 21248 (.cutY 1792 .empty (.cutX 21120 (.cutY 1920 (.cutX 21056 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 21056 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full (.cutX 21184 (.cutY 1984 .full .full) (.cutY 1984 .full .full))))) .empty)))) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 (.cutX 30976 (.cutY 11520 .empty (.cutX 30848 (.cutY 11648 (.cutX 30784 (.cutY 11584 .full .full) (.cutY 11584 .full .full)) (.cutX 30784 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 30912 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty) .empty)) .empty))) .empty)))) .empty))

theorem metadata19 : 0<25614016 ∧ 7<128 ∧ 82<128 ∧ 0<4 ∧
    929/4160=0 ∧ 929%4160=929 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (400219/25600000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 7108, atom 695, type 0, source (5,80).
def leavesData20 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves20 : Fin 13 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 80 leaves20 i
def outputData20 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,20480,20544⟩) (.node (.single ⟨1280,1344,20544,20608⟩) (.single ⟨1344,1408,20480,20544⟩))) (.node (.single ⟨1344,1408,20544,20608⟩) (.node (.single ⟨1280,1408,20608,20736⟩) (.single ⟨1408,1472,20480,20544⟩)))) (.node (.node (.single ⟨1408,1472,20544,20608⟩) (.node (.single ⟨1472,1536,20480,20544⟩) (.single ⟨1472,1536,20544,20608⟩))) (.node (.node (.single ⟨1408,1472,20608,20672⟩) (.single ⟨1408,1472,20672,20736⟩)) (.node (.single ⟨1472,1536,20608,20672⟩) (.single ⟨1472,1536,20672,20736⟩))))) (.node (.node (.node (.single ⟨12032,12096,31232,31296⟩) (.node (.single ⟨12032,12096,31296,31360⟩) (.single ⟨12096,12160,31232,31296⟩))) (.node (.single ⟨12096,12160,31296,31360⟩) (.node (.single ⟨12032,12160,31360,31488⟩) (.single ⟨12160,12224,31232,31296⟩)))) (.node (.node (.single ⟨12160,12224,31296,31360⟩) (.node (.single ⟨12224,12288,31232,31296⟩) (.single ⟨12224,12288,31296,31360⟩))) (.node (.node (.single ⟨12160,12224,31360,31424⟩) (.single ⟨12160,12224,31424,31488⟩)) (.node (.single ⟨12224,12288,31360,31424⟩) (.single ⟨12224,12288,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,1280,1344⟩) (.node (.single ⟨20480,20544,1344,1408⟩) (.single ⟨20544,20608,1280,1344⟩))) (.node (.single ⟨20544,20608,1344,1408⟩) (.node (.single ⟨20480,20544,1408,1472⟩) (.single ⟨20480,20544,1472,1536⟩)))) (.node (.node (.single ⟨20544,20608,1408,1472⟩) (.node (.single ⟨20544,20608,1472,1536⟩) (.single ⟨20608,20736,1280,1408⟩))) (.node (.node (.single ⟨20608,20672,1408,1472⟩) (.single ⟨20608,20672,1472,1536⟩)) (.node (.single ⟨20672,20736,1408,1472⟩) (.single ⟨20672,20736,1472,1536⟩))))) (.node (.node (.node (.single ⟨31232,31296,12032,12096⟩) (.node (.single ⟨31232,31296,12096,12160⟩) (.single ⟨31296,31360,12032,12096⟩))) (.node (.single ⟨31296,31360,12096,12160⟩) (.node (.single ⟨31232,31296,12160,12224⟩) (.single ⟨31232,31296,12224,12288⟩)))) (.node (.node (.single ⟨31296,31360,12160,12224⟩) (.node (.single ⟨31296,31360,12224,12288⟩) (.single ⟨31360,31488,12032,12160⟩))) (.node (.node (.single ⟨31360,31424,12160,12224⟩) (.single ⟨31360,31424,12224,12288⟩)) (.node (.single ⟨31424,31488,12160,12224⟩) (.single ⟨31424,31488,12224,12288⟩)))))))
def output20 : Fin 52 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 9))) (.node (.single 35) (.node (.single 42) (.single 16)))) (.node (.node (.single 10) (.node (.single 37) (.single 41))) (.node (.node (.single 14) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 36) (.single 40))) (.node (.node (.single 28) (.single 32)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 35) (.single 47))) (.node (.single 31) (.node (.single 3) (.single 43)))) (.node (.node (.single 27) (.node (.single 39) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 37)))) (.node (.node (.single 25) (.node (.single 41) (.single 1))) (.node (.node (.single 29) (.single 45)) (.node (.single 33) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 34))) (.node (.single 30) (.node (.single 42) (.single 38)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover20 (i : Fin 52) : Fin 52 := ⟨coverData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 52) : Fin 52 := ⟨sourceData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 (.cutY 20992 (.cutX 1280 .empty (.cutY 20736 (.cutX 1408 (.cutY 20608 (.cutX 1344 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 1472 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) (.cutX 1472 (.cutY 20672 .full .full) (.cutY 20672 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 .empty (.cutX 12032 .empty (.cutY 31488 (.cutX 12160 (.cutY 31360 (.cutX 12096 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 12224 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 12224 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty)))) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 (.cutX 20736 (.cutY 1280 .empty (.cutX 20608 (.cutY 1408 (.cutX 20544 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 20544 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 20672 (.cutY 1472 .full .full) (.cutY 1472 .full .full))))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 .empty (.cutY 11776 .empty (.cutX 31488 (.cutY 12032 .empty (.cutX 31360 (.cutY 12160 (.cutX 31296 (.cutY 12096 .full .full) (.cutY 12096 .full .full)) (.cutX 31296 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 31424 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)))) .empty))) .empty)))) .empty))

theorem metadata20 : 0<25614016 ∧ 5<128 ∧ 80<128 ∧ 0<4 ∧
    695/4160=0 ∧ 695%4160=695 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (400219/25600000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 7109, atom 6986, type 1, source (27,99).
def leavesData21 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves21 : Fin 16 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 27 99 leaves21 i
def outputData21 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6912,6976,25344,25408⟩) (.single ⟨6912,6976,25408,25472⟩)) (.node (.single ⟨6976,7040,25344,25408⟩) (.single ⟨6976,7040,25408,25472⟩))) (.node (.node (.single ⟨6912,7040,25472,25600⟩) (.single ⟨7040,7104,25344,25408⟩)) (.node (.single ⟨7040,7104,25408,25472⟩) (.single ⟨7104,7136,25344,25376⟩)))) (.node (.node (.node (.single ⟨7104,7136,25376,25408⟩) (.single ⟨7136,7168,25344,25376⟩)) (.node (.single ⟨7136,7168,25376,25408⟩) (.single ⟨7104,7168,25408,25472⟩))) (.node (.node (.single ⟨7040,7104,25472,25536⟩) (.single ⟨7040,7104,25536,25600⟩)) (.node (.single ⟨7104,7168,25472,25536⟩) (.single ⟨7104,7168,25536,25600⟩))))) (.node (.node (.node (.node (.single ⟨7168,7232,25600,25664⟩) (.single ⟨7168,7232,25664,25728⟩)) (.node (.single ⟨7232,7296,25600,25664⟩) (.single ⟨7232,7296,25664,25728⟩))) (.node (.node (.single ⟨7168,7296,25728,25856⟩) (.single ⟨7296,7360,25600,25664⟩)) (.node (.single ⟨7296,7360,25664,25728⟩) (.single ⟨7360,7392,25600,25632⟩)))) (.node (.node (.node (.single ⟨7360,7392,25632,25664⟩) (.single ⟨7392,7424,25600,25632⟩)) (.node (.single ⟨7392,7424,25632,25664⟩) (.single ⟨7360,7424,25664,25728⟩))) (.node (.node (.single ⟨7296,7360,25728,25792⟩) (.single ⟨7296,7360,25792,25856⟩)) (.node (.single ⟨7360,7424,25728,25792⟩) (.single ⟨7360,7424,25792,25856⟩)))))) (.node (.node (.node (.node (.node (.single ⟨25344,25408,6912,6976⟩) (.single ⟨25344,25408,6976,7040⟩)) (.node (.single ⟨25408,25472,6912,6976⟩) (.single ⟨25408,25472,6976,7040⟩))) (.node (.node (.single ⟨25344,25408,7040,7104⟩) (.single ⟨25344,25376,7104,7136⟩)) (.node (.single ⟨25344,25376,7136,7168⟩) (.single ⟨25376,25408,7104,7136⟩)))) (.node (.node (.node (.single ⟨25376,25408,7136,7168⟩) (.single ⟨25408,25472,7040,7104⟩)) (.node (.single ⟨25408,25472,7104,7168⟩) (.single ⟨25472,25600,6912,7040⟩))) (.node (.node (.single ⟨25472,25536,7040,7104⟩) (.single ⟨25472,25536,7104,7168⟩)) (.node (.single ⟨25536,25600,7040,7104⟩) (.single ⟨25536,25600,7104,7168⟩))))) (.node (.node (.node (.node (.single ⟨25600,25664,7168,7232⟩) (.single ⟨25600,25664,7232,7296⟩)) (.node (.single ⟨25664,25728,7168,7232⟩) (.single ⟨25664,25728,7232,7296⟩))) (.node (.node (.single ⟨25600,25664,7296,7360⟩) (.single ⟨25600,25632,7360,7392⟩)) (.node (.single ⟨25600,25632,7392,7424⟩) (.single ⟨25632,25664,7360,7392⟩)))) (.node (.node (.node (.single ⟨25632,25664,7392,7424⟩) (.single ⟨25664,25728,7296,7360⟩)) (.node (.single ⟨25664,25728,7360,7424⟩) (.single ⟨25728,25856,7168,7296⟩))) (.node (.node (.single ⟨25728,25792,7296,7360⟩) (.single ⟨25728,25792,7360,7424⟩)) (.node (.single ⟨25792,25856,7296,7360⟩) (.single ⟨25792,25856,7360,7424⟩)))))))
def output21 : Fin 64 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21))))) (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData21 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 15)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19)))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 13) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))))))
def cover21 (i : Fin 64) : Fin 64 := ⟨coverData21.get i % 64, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 64) : Fin 64 := ⟨sourceData21.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 .empty (.cutX 6912 .empty (.cutY 25344 .empty (.cutX 7040 (.cutY 25472 (.cutX 6976 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 7104 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 7136 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 7104 (.cutY 25536 .full .full) (.cutY 25536 .full .full)))))))) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 (.cutX 7424 (.cutY 25856 (.cutX 7296 (.cutY 25728 (.cutX 7232 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 7360 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 7392 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 7360 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 .empty (.cutX 25344 .empty (.cutY 6912 .empty (.cutX 25472 (.cutY 7040 (.cutX 25408 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 25408 (.cutY 7104 .full (.cutX 25376 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 25536 (.cutY 7104 .full .full) (.cutY 7104 .full .full)))))))) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 (.cutX 25856 (.cutY 7424 (.cutX 25728 (.cutY 7296 (.cutX 25664 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 25664 (.cutY 7360 .full (.cutX 25632 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 25792 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) .empty) .empty) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata21 : 0<48020332 ∧ 27<128 ∧ 99<128 ∧ 1<4 ∧
    6986/4160=1 ∧ 6986%4160=2826 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 64,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 64, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 64,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 64, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 7110, atom 2596, type 0, source (24,100).
def leavesData22 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves22 : Fin 13 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 100 leaves22 i
def outputData22 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,25600,25664⟩) (.node (.single ⟨6144,6208,25664,25728⟩) (.single ⟨6208,6272,25600,25664⟩))) (.node (.single ⟨6208,6272,25664,25728⟩) (.node (.single ⟨6144,6272,25728,25856⟩) (.single ⟨6272,6336,25600,25664⟩)))) (.node (.node (.single ⟨6272,6336,25664,25728⟩) (.node (.single ⟨6336,6400,25600,25664⟩) (.single ⟨6336,6400,25664,25728⟩))) (.node (.node (.single ⟨6272,6336,25728,25792⟩) (.single ⟨6272,6336,25792,25856⟩)) (.node (.single ⟨6336,6400,25728,25792⟩) (.single ⟨6336,6400,25792,25856⟩))))) (.node (.node (.node (.single ⟨6912,6976,26368,26432⟩) (.node (.single ⟨6912,6976,26432,26496⟩) (.single ⟨6976,7040,26368,26432⟩))) (.node (.single ⟨6976,7040,26432,26496⟩) (.node (.single ⟨6912,7040,26496,26624⟩) (.single ⟨7040,7104,26368,26432⟩)))) (.node (.node (.single ⟨7040,7104,26432,26496⟩) (.node (.single ⟨7104,7168,26368,26432⟩) (.single ⟨7104,7168,26432,26496⟩))) (.node (.node (.single ⟨7040,7104,26496,26560⟩) (.single ⟨7040,7104,26560,26624⟩)) (.node (.single ⟨7104,7168,26496,26560⟩) (.single ⟨7104,7168,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25664,6144,6208⟩) (.node (.single ⟨25600,25664,6208,6272⟩) (.single ⟨25664,25728,6144,6208⟩))) (.node (.single ⟨25664,25728,6208,6272⟩) (.node (.single ⟨25600,25664,6272,6336⟩) (.single ⟨25600,25664,6336,6400⟩)))) (.node (.node (.single ⟨25664,25728,6272,6336⟩) (.node (.single ⟨25664,25728,6336,6400⟩) (.single ⟨25728,25856,6144,6272⟩))) (.node (.node (.single ⟨25728,25792,6272,6336⟩) (.single ⟨25728,25792,6336,6400⟩)) (.node (.single ⟨25792,25856,6272,6336⟩) (.single ⟨25792,25856,6336,6400⟩))))) (.node (.node (.node (.single ⟨26368,26432,6912,6976⟩) (.node (.single ⟨26368,26432,6976,7040⟩) (.single ⟨26432,26496,6912,6976⟩))) (.node (.single ⟨26432,26496,6976,7040⟩) (.node (.single ⟨26368,26432,7040,7104⟩) (.single ⟨26368,26432,7104,7168⟩)))) (.node (.node (.single ⟨26432,26496,7040,7104⟩) (.node (.single ⟨26432,26496,7104,7168⟩) (.single ⟨26496,26624,6912,7040⟩))) (.node (.node (.single ⟨26496,26560,7040,7104⟩) (.single ⟨26496,26560,7104,7168⟩)) (.node (.single ⟨26560,26624,7040,7104⟩) (.single ⟨26560,26624,7104,7168⟩)))))))
def output22 : Fin 52 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover22 (i : Fin 52) : Fin 52 := ⟨coverData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 52) : Fin 52 := ⟨sourceData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 (.cutY 26112 (.cutX 6400 (.cutY 25856 (.cutX 6272 (.cutY 25728 (.cutX 6208 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 6336 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) (.cutX 6336 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty) .empty) .empty) (.cutY 26112 .empty (.cutX 6912 .empty (.cutY 26368 .empty (.cutX 7040 (.cutY 26496 (.cutX 6976 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full) (.cutY 26496 (.cutX 7104 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 7104 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 (.cutX 25856 (.cutY 6400 (.cutX 25728 (.cutY 6272 (.cutX 25664 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 25664 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full (.cutX 25792 (.cutY 6336 .full .full) (.cutY 6336 .full .full)))) .empty) .empty) .empty) (.cutY 6656 .empty (.cutX 26368 .empty (.cutY 6912 .empty (.cutX 26496 (.cutY 7040 (.cutX 26432 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 26432 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 26560 (.cutY 7104 .full .full) (.cutY 7104 .full .full)))))))) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata22 : 0<31548346 ∧ 24<128 ∧ 100<128 ∧ 0<4 ∧
    2596/4160=0 ∧ 2596%4160=2596 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 7111, atom 2432, type 0, source (22,100).
def leavesData23 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves23 : Fin 10 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 100 leaves23 i
def outputData23 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,25600,25664⟩) (.single ⟨5632,5696,25664,25728⟩)) (.node (.single ⟨5696,5760,25600,25664⟩) (.node (.single ⟨5696,5760,25664,25728⟩) (.single ⟨5632,5760,25728,25856⟩)))) (.node (.node (.single ⟨5760,5824,25600,25664⟩) (.single ⟨5760,5824,25664,25728⟩)) (.node (.single ⟨5824,5888,25600,25664⟩) (.node (.single ⟨5824,5888,25664,25728⟩) (.single ⟨5760,5888,25728,25856⟩))))) (.node (.node (.node (.single ⟨6912,7040,26880,27008⟩) (.single ⟨6912,7040,27008,27136⟩)) (.node (.single ⟨7040,7104,26880,26944⟩) (.node (.single ⟨7040,7104,26944,27008⟩) (.single ⟨7104,7168,26880,26944⟩)))) (.node (.node (.single ⟨7104,7168,26944,27008⟩) (.single ⟨7040,7104,27008,27072⟩)) (.node (.single ⟨7040,7104,27072,27136⟩) (.node (.single ⟨7104,7168,27008,27072⟩) (.single ⟨7104,7168,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25664,5632,5696⟩) (.single ⟨25600,25664,5696,5760⟩)) (.node (.single ⟨25664,25728,5632,5696⟩) (.node (.single ⟨25664,25728,5696,5760⟩) (.single ⟨25600,25664,5760,5824⟩)))) (.node (.node (.single ⟨25600,25664,5824,5888⟩) (.single ⟨25664,25728,5760,5824⟩)) (.node (.single ⟨25664,25728,5824,5888⟩) (.node (.single ⟨25728,25856,5632,5760⟩) (.single ⟨25728,25856,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,6912,7040⟩) (.single ⟨26880,26944,7040,7104⟩)) (.node (.single ⟨26880,26944,7104,7168⟩) (.node (.single ⟨26944,27008,7040,7104⟩) (.single ⟨26944,27008,7104,7168⟩)))) (.node (.node (.single ⟨27008,27136,6912,7040⟩) (.single ⟨27008,27072,7040,7104⟩)) (.node (.single ⟨27008,27072,7104,7168⟩) (.node (.single ⟨27072,27136,7040,7104⟩) (.single ⟨27072,27136,7104,7168⟩)))))))
def output23 : Fin 40 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData23 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover23 (i : Fin 40) : Fin 40 := ⟨coverData23.get i % 40, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 40) : Fin 40 := ⟨sourceData23.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 .empty (.cutY 26112 (.cutX 5888 (.cutY 25856 (.cutX 5760 (.cutY 25728 (.cutX 5696 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 5824 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty)))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 (.cutX 6912 .empty (.cutY 26880 .empty (.cutX 7040 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 7104 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 7104 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 .empty (.cutX 25856 (.cutY 5888 (.cutX 25728 (.cutY 5760 (.cutX 25664 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 25664 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 (.cutY 6656 .empty (.cutX 26880 .empty (.cutY 6912 .empty (.cutX 27008 (.cutY 7040 .full (.cutX 26944 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 27072 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))))) .empty) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata23 : 0<121837468 ∧ 22<128 ∧ 100<128 ∧ 0<4 ∧
    2432/4160=0 ∧ 2432%4160=2432 ∧ ∀ i, (leaves23 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData23).mp
    (by decide +kernel)

theorem sourceChecked23_0 : ∀ i : Fin 40,
    (fun i => output23 i = raw23 (source23 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked23 : ∀ i : Fin 40, (fun i => output23 i = raw23 (source23 i)) i :=
  forallFin_of_zero_offset (fun i => output23 i = raw23 (source23 i)) sourceChecked23_0

theorem coverChecked23_0 : ∀ i : Fin 40,
    (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked23 : ∀ i : Fin 40, (fun i => (output23 (cover23 i)).ContainsBox (raw23 i)) i :=
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 7112, atom 2347, type 0, source (21,100).
def leavesData24 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves24 : Fin 10 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 100 leaves24 i
def outputData24 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,25600,25664⟩) (.single ⟨5376,5440,25664,25728⟩)) (.node (.single ⟨5440,5504,25600,25664⟩) (.node (.single ⟨5440,5504,25664,25728⟩) (.single ⟨5376,5504,25728,25856⟩)))) (.node (.node (.single ⟨5504,5568,25600,25664⟩) (.single ⟨5504,5568,25664,25728⟩)) (.node (.single ⟨5568,5632,25600,25664⟩) (.node (.single ⟨5568,5632,25664,25728⟩) (.single ⟨5504,5632,25728,25856⟩))))) (.node (.node (.node (.single ⟨6912,7040,27136,27264⟩) (.single ⟨6912,7040,27264,27392⟩)) (.node (.single ⟨7040,7104,27136,27200⟩) (.node (.single ⟨7040,7104,27200,27264⟩) (.single ⟨7104,7168,27136,27200⟩)))) (.node (.node (.single ⟨7104,7168,27200,27264⟩) (.single ⟨7040,7104,27264,27328⟩)) (.node (.single ⟨7040,7104,27328,27392⟩) (.node (.single ⟨7104,7168,27264,27328⟩) (.single ⟨7104,7168,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25664,5376,5440⟩) (.single ⟨25600,25664,5440,5504⟩)) (.node (.single ⟨25664,25728,5376,5440⟩) (.node (.single ⟨25664,25728,5440,5504⟩) (.single ⟨25600,25664,5504,5568⟩)))) (.node (.node (.single ⟨25600,25664,5568,5632⟩) (.single ⟨25664,25728,5504,5568⟩)) (.node (.single ⟨25664,25728,5568,5632⟩) (.node (.single ⟨25728,25856,5376,5504⟩) (.single ⟨25728,25856,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,6912,7040⟩) (.single ⟨27136,27200,7040,7104⟩)) (.node (.single ⟨27136,27200,7104,7168⟩) (.node (.single ⟨27200,27264,7040,7104⟩) (.single ⟨27200,27264,7104,7168⟩)))) (.node (.node (.single ⟨27264,27392,6912,7040⟩) (.single ⟨27264,27328,7040,7104⟩)) (.node (.single ⟨27264,27328,7104,7168⟩) (.node (.single ⟨27328,27392,7040,7104⟩) (.single ⟨27328,27392,7104,7168⟩)))))))
def output24 : Fin 40 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover24 (i : Fin 40) : Fin 40 := ⟨coverData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 40) : Fin 40 := ⟨sourceData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 (.cutY 26112 (.cutX 5376 .empty (.cutY 25856 (.cutX 5504 (.cutY 25728 (.cutX 5440 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 5568 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty) .empty))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 .empty (.cutX 6912 .empty (.cutY 27392 (.cutX 7040 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 7104 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 7104 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty)))) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 (.cutX 25856 (.cutY 5376 .empty (.cutX 25728 (.cutY 5504 (.cutX 25664 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 25664 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 .empty (.cutY 6656 .empty (.cutX 27392 (.cutY 6912 .empty (.cutX 27264 (.cutY 7040 .full (.cutX 27200 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 27328 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))) .empty))) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata24 : 0<121837468 ∧ 21<128 ∧ 100<128 ∧ 0<4 ∧
    2347/4160=0 ∧ 2347%4160=2347 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 7113, atom 2515, type 0, source (23,100).
def leavesData25 : FiniteInputTree DyadicLeaf 46 := (.node (.node (.node (.node (.node (.single ⟨2,0,1⟩) (.single ⟨2,0,2⟩)) (.node (.single ⟨2,0,3⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨3,0,0⟩))))) (.node (.node (.node (.single ⟨3,0,1⟩) (.node (.single ⟨3,1,0⟩) (.single ⟨3,1,1⟩))) (.node (.single ⟨3,2,0⟩) (.node (.single ⟨3,2,1⟩) (.single ⟨3,3,1⟩)))) (.node (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,1⟩))) (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,4,2⟩)))))) (.node (.node (.node (.node (.single ⟨3,4,3⟩) (.single ⟨3,5,2⟩)) (.node (.single ⟨3,5,3⟩) (.node (.single ⟨3,6,2⟩) (.single ⟨3,6,3⟩)))) (.node (.node (.single ⟨3,7,2⟩) (.node (.single ⟨3,7,3⟩) (.single ⟨4,6,0⟩))) (.node (.single ⟨4,6,1⟩) (.node (.single ⟨4,7,0⟩) (.single ⟨4,7,1⟩))))) (.node (.node (.node (.single ⟨4,8,0⟩) (.node (.single ⟨4,8,1⟩) (.single ⟨4,9,0⟩))) (.node (.single ⟨4,9,1⟩) (.node (.single ⟨4,10,0⟩) (.single ⟨4,10,1⟩)))) (.node (.node (.single ⟨4,11,0⟩) (.node (.single ⟨4,11,1⟩) (.single ⟨4,12,0⟩))) (.node (.single ⟨4,12,1⟩) (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩)))))))
def leaves25 : Fin 46 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 184) : GridBox := phaseImageBoxes 32768 8 23 100 leaves25 i
def outputData25 : FiniteInputTree GridBox 184 := (.node (.node (.node (.node (.node (.node (.node (.single ⟨5888,5920,25600,25632⟩) (.single ⟨5888,5920,25632,25664⟩)) (.node (.single ⟨5920,5952,25600,25632⟩) (.node (.single ⟨5920,5952,25632,25664⟩) (.single ⟨5888,5952,25664,25728⟩)))) (.node (.node (.single ⟨5952,5984,25600,25632⟩) (.node (.single ⟨5952,5984,25632,25664⟩) (.single ⟨5984,6000,25600,25616⟩))) (.node (.single ⟨5984,6000,25616,25632⟩) (.node (.single ⟨6000,6016,25600,25616⟩) (.single ⟨6000,6016,25616,25632⟩))))) (.node (.node (.node (.single ⟨5984,6016,25632,25664⟩) (.node (.single ⟨5952,6016,25664,25728⟩) (.single ⟨5888,5952,25728,25792⟩))) (.node (.single ⟨5888,5952,25792,25856⟩) (.node (.single ⟨5952,6016,25728,25792⟩) (.single ⟨5952,6016,25792,25856⟩)))) (.node (.node (.single ⟨6016,6032,25600,25616⟩) (.node (.single ⟨6016,6032,25616,25632⟩) (.single ⟨6032,6048,25600,25616⟩))) (.node (.single ⟨6032,6048,25616,25632⟩) (.node (.single ⟨6016,6048,25632,25664⟩) (.single ⟨6048,6064,25600,25616⟩)))))) (.node (.node (.node (.node (.single ⟨6048,6064,25616,25632⟩) (.single ⟨6064,6080,25600,25616⟩)) (.node (.single ⟨6064,6080,25616,25632⟩) (.node (.single ⟨6048,6080,25632,25664⟩) (.single ⟨6016,6048,25664,25696⟩)))) (.node (.node (.single ⟨6016,6048,25696,25728⟩) (.node (.single ⟨6048,6080,25664,25696⟩) (.single ⟨6048,6080,25696,25728⟩))) (.node (.single ⟨6080,6096,25600,25616⟩) (.node (.single ⟨6080,6096,25616,25632⟩) (.single ⟨6096,6112,25600,25616⟩))))) (.node (.node (.node (.single ⟨6096,6112,25616,25632⟩) (.node (.single ⟨6080,6112,25632,25664⟩) (.single ⟨6112,6144,25600,25632⟩))) (.node (.single ⟨6112,6144,25632,25664⟩) (.node (.single ⟨6080,6112,25664,25696⟩) (.single ⟨6080,6112,25696,25728⟩)))) (.node (.node (.single ⟨6112,6144,25664,25696⟩) (.node (.single ⟨6112,6144,25696,25728⟩) (.single ⟨6016,6080,25728,25792⟩))) (.node (.single ⟨6016,6080,25792,25856⟩) (.node (.single ⟨6080,6144,25728,25792⟩) (.single ⟨6080,6144,25792,25856⟩))))))) (.node (.node (.node (.node (.node (.single ⟨6912,6976,26624,26688⟩) (.single ⟨6912,6976,26688,26752⟩)) (.node (.single ⟨6976,7040,26624,26688⟩) (.node (.single ⟨6976,7040,26688,26752⟩) (.single ⟨6912,6976,26752,26816⟩)))) (.node (.node (.single ⟨6912,6976,26816,26880⟩) (.node (.single ⟨6976,7040,26752,26816⟩) (.single ⟨6976,7040,26816,26880⟩))) (.node (.single ⟨7040,7072,26624,26656⟩) (.node (.single ⟨7040,7072,26656,26688⟩) (.single ⟨7072,7104,26624,26656⟩))))) (.node (.node (.node (.single ⟨7072,7104,26656,26688⟩) (.node (.single ⟨7040,7072,26688,26720⟩) (.single ⟨7040,7072,26720,26752⟩))) (.node (.single ⟨7072,7104,26688,26720⟩) (.node (.single ⟨7072,7104,26720,26752⟩) (.single ⟨7104,7136,26624,26656⟩)))) (.node (.node (.single ⟨7104,7136,26656,26688⟩) (.node (.single ⟨7136,7168,26624,26656⟩) (.single ⟨7136,7152,26656,26672⟩))) (.node (.single ⟨7136,7152,26672,26688⟩) (.node (.single ⟨7152,7168,26656,26672⟩) (.single ⟨7152,7168,26672,26688⟩)))))) (.node (.node (.node (.node (.single ⟨7104,7136,26688,26720⟩) (.single ⟨7104,7136,26720,26752⟩)) (.node (.single ⟨7136,7152,26688,26704⟩) (.node (.single ⟨7136,7152,26704,26720⟩) (.single ⟨7152,7168,26688,26704⟩)))) (.node (.node (.single ⟨7152,7168,26704,26720⟩) (.node (.single ⟨7136,7152,26720,26736⟩) (.single ⟨7136,7152,26736,26752⟩))) (.node (.single ⟨7152,7168,26720,26736⟩) (.node (.single ⟨7152,7168,26736,26752⟩) (.single ⟨7040,7104,26752,26816⟩))))) (.node (.node (.node (.single ⟨7040,7104,26816,26880⟩) (.node (.single ⟨7104,7136,26752,26784⟩) (.single ⟨7104,7136,26784,26816⟩))) (.node (.single ⟨7136,7152,26752,26768⟩) (.node (.single ⟨7136,7152,26768,26784⟩) (.single ⟨7152,7168,26752,26768⟩)))) (.node (.node (.single ⟨7152,7168,26768,26784⟩) (.node (.single ⟨7136,7168,26784,26816⟩) (.single ⟨7104,7136,26816,26848⟩))) (.node (.single ⟨7104,7136,26848,26880⟩) (.node (.single ⟨7136,7168,26816,26848⟩) (.single ⟨7136,7168,26848,26880⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨25600,25632,5888,5920⟩) (.single ⟨25600,25632,5920,5952⟩)) (.node (.single ⟨25632,25664,5888,5920⟩) (.node (.single ⟨25632,25664,5920,5952⟩) (.single ⟨25600,25632,5952,5984⟩)))) (.node (.node (.single ⟨25600,25616,5984,6000⟩) (.node (.single ⟨25600,25616,6000,6016⟩) (.single ⟨25616,25632,5984,6000⟩))) (.node (.single ⟨25616,25632,6000,6016⟩) (.node (.single ⟨25632,25664,5952,5984⟩) (.single ⟨25632,25664,5984,6016⟩))))) (.node (.node (.node (.single ⟨25664,25728,5888,5952⟩) (.node (.single ⟨25664,25728,5952,6016⟩) (.single ⟨25600,25616,6016,6032⟩))) (.node (.single ⟨25600,25616,6032,6048⟩) (.node (.single ⟨25616,25632,6016,6032⟩) (.single ⟨25616,25632,6032,6048⟩)))) (.node (.node (.single ⟨25600,25616,6048,6064⟩) (.node (.single ⟨25600,25616,6064,6080⟩) (.single ⟨25616,25632,6048,6064⟩))) (.node (.single ⟨25616,25632,6064,6080⟩) (.node (.single ⟨25632,25664,6016,6048⟩) (.single ⟨25632,25664,6048,6080⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25616,6080,6096⟩) (.single ⟨25600,25616,6096,6112⟩)) (.node (.single ⟨25616,25632,6080,6096⟩) (.node (.single ⟨25616,25632,6096,6112⟩) (.single ⟨25600,25632,6112,6144⟩)))) (.node (.node (.single ⟨25632,25664,6080,6112⟩) (.node (.single ⟨25632,25664,6112,6144⟩) (.single ⟨25664,25696,6016,6048⟩))) (.node (.single ⟨25664,25696,6048,6080⟩) (.node (.single ⟨25696,25728,6016,6048⟩) (.single ⟨25696,25728,6048,6080⟩))))) (.node (.node (.node (.single ⟨25664,25696,6080,6112⟩) (.node (.single ⟨25664,25696,6112,6144⟩) (.single ⟨25696,25728,6080,6112⟩))) (.node (.single ⟨25696,25728,6112,6144⟩) (.node (.single ⟨25728,25792,5888,5952⟩) (.single ⟨25728,25792,5952,6016⟩)))) (.node (.node (.single ⟨25792,25856,5888,5952⟩) (.node (.single ⟨25792,25856,5952,6016⟩) (.single ⟨25728,25792,6016,6080⟩))) (.node (.single ⟨25728,25792,6080,6144⟩) (.node (.single ⟨25792,25856,6016,6080⟩) (.single ⟨25792,25856,6080,6144⟩))))))) (.node (.node (.node (.node (.node (.single ⟨26624,26688,6912,6976⟩) (.single ⟨26624,26688,6976,7040⟩)) (.node (.single ⟨26688,26752,6912,6976⟩) (.node (.single ⟨26688,26752,6976,7040⟩) (.single ⟨26624,26656,7040,7072⟩)))) (.node (.node (.single ⟨26624,26656,7072,7104⟩) (.node (.single ⟨26656,26688,7040,7072⟩) (.single ⟨26656,26688,7072,7104⟩))) (.node (.single ⟨26624,26656,7104,7136⟩) (.node (.single ⟨26624,26656,7136,7168⟩) (.single ⟨26656,26688,7104,7136⟩))))) (.node (.node (.node (.single ⟨26656,26672,7136,7152⟩) (.node (.single ⟨26656,26672,7152,7168⟩) (.single ⟨26672,26688,7136,7152⟩))) (.node (.single ⟨26672,26688,7152,7168⟩) (.node (.single ⟨26688,26720,7040,7072⟩) (.single ⟨26688,26720,7072,7104⟩)))) (.node (.node (.single ⟨26720,26752,7040,7072⟩) (.node (.single ⟨26720,26752,7072,7104⟩) (.single ⟨26688,26720,7104,7136⟩))) (.node (.single ⟨26688,26704,7136,7152⟩) (.node (.single ⟨26688,26704,7152,7168⟩) (.single ⟨26704,26720,7136,7152⟩)))))) (.node (.node (.node (.node (.single ⟨26704,26720,7152,7168⟩) (.single ⟨26720,26752,7104,7136⟩)) (.node (.single ⟨26720,26736,7136,7152⟩) (.node (.single ⟨26720,26736,7152,7168⟩) (.single ⟨26736,26752,7136,7152⟩)))) (.node (.node (.single ⟨26736,26752,7152,7168⟩) (.node (.single ⟨26752,26816,6912,6976⟩) (.single ⟨26752,26816,6976,7040⟩))) (.node (.single ⟨26816,26880,6912,6976⟩) (.node (.single ⟨26816,26880,6976,7040⟩) (.single ⟨26752,26816,7040,7104⟩))))) (.node (.node (.node (.single ⟨26752,26784,7104,7136⟩) (.node (.single ⟨26752,26768,7136,7152⟩) (.single ⟨26752,26768,7152,7168⟩))) (.node (.single ⟨26768,26784,7136,7152⟩) (.node (.single ⟨26768,26784,7152,7168⟩) (.single ⟨26784,26816,7104,7136⟩)))) (.node (.node (.single ⟨26784,26816,7136,7168⟩) (.node (.single ⟨26816,26880,7040,7104⟩) (.single ⟨26816,26848,7104,7136⟩))) (.node (.single ⟨26816,26848,7136,7168⟩) (.node (.single ⟨26848,26880,7104,7136⟩) (.single ⟨26848,26880,7136,7168⟩)))))))))
def output25 : Fin 184 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 184 := (.node (.node (.node (.node (.node (.node (.node (.single 4) (.single 103)) (.node (.single 179) (.node (.single 80) (.single 13)))) (.node (.node (.single 130) (.node (.single 170) (.single 53))) (.node (.single 14) (.node (.single 132) (.single 169))))) (.node (.node (.node (.single 51) (.node (.single 12) (.single 104))) (.node (.single 171) (.node (.single 79) (.single 15)))) (.node (.node (.single 131) (.node (.single 168) (.single 52))) (.node (.single 16) (.node (.single 133) (.single 167)))))) (.node (.node (.node (.node (.single 50) (.single 42)) (.node (.single 134) (.node (.single 141) (.single 49)))) (.node (.node (.single 43) (.node (.single 136) (.single 140))) (.node (.single 47) (.node (.single 44) (.single 135))))) (.node (.node (.node (.single 139) (.node (.single 48) (.single 45))) (.node (.single 137) (.node (.single 138) (.single 46)))) (.node (.node (.single 0) (.node (.single 92) (.single 183))) (.node (.single 91) (.node (.single 1) (.single 94))))))) (.node (.node (.node (.node (.node (.single 182) (.single 89)) (.node (.single 2) (.node (.single 93) (.single 181)))) (.node (.node (.single 90) (.node (.single 3) (.single 95))) (.node (.single 180) (.node (.single 88) (.single 5))))) (.node (.node (.node (.single 96) (.node (.single 178) (.single 87))) (.node (.single 6) (.node (.single 101) (.single 177)))) (.node (.node (.single 82) (.node (.single 11) (.single 102))) (.node (.single 172) (.node (.single 81) (.single 21)))))) (.node (.node (.node (.node (.single 113) (.single 162)) (.node (.single 70) (.node (.single 26) (.single 114)))) (.node (.node (.single 157) (.node (.single 69) (.single 35))) (.node (.single 120) (.node (.single 148) (.single 63))))) (.node (.node (.node (.single 36) (.node (.single 119) (.single 147))) (.node (.single 64) (.node (.single 37) (.single 121)))) (.node (.node (.single 146) (.node (.single 62) (.single 27))) (.node (.single 122) (.node (.single 156) (.single 61)))))))) (.node (.node (.node (.node (.node (.node (.single 28) (.single 124)) (.node (.single 155) (.node (.single 59) (.single 29)))) (.node (.node (.single 123) (.node (.single 154) (.single 60))) (.node (.single 30) (.node (.single 125) (.single 153))))) (.node (.node (.node (.single 58) (.node (.single 38) (.single 126))) (.node (.single 145) (.node (.single 57) (.single 39)))) (.node (.node (.single 128) (.node (.single 144) (.single 55))) (.node (.single 40) (.node (.single 127) (.single 143)))))) (.node (.node (.node (.node (.single 56) (.single 41)) (.node (.single 129) (.node (.single 142) (.single 54)))) (.node (.node (.single 7) (.node (.single 97) (.single 176))) (.node (.single 86) (.node (.single 8) (.single 99))))) (.node (.node (.node (.single 175) (.node (.single 84) (.single 9))) (.node (.single 98) (.node (.single 174) (.single 85)))) (.node (.node (.single 10) (.node (.single 100) (.single 173))) (.node (.single 83) (.node (.single 17) (.single 105))))))) (.node (.node (.node (.node (.node (.single 166) (.single 78)) (.node (.single 18) (.node (.single 107) (.single 165)))) (.node (.node (.single 76) (.node (.single 19) (.single 106))) (.node (.single 164) (.node (.single 77) (.single 20))))) (.node (.node (.node (.single 108) (.node (.single 163) (.single 75))) (.node (.single 22) (.node (.single 109) (.single 161)))) (.node (.node (.single 74) (.node (.single 23) (.single 111))) (.node (.single 160) (.node (.single 72) (.single 24)))))) (.node (.node (.node (.node (.single 110) (.single 159)) (.node (.single 73) (.node (.single 25) (.single 112)))) (.node (.node (.single 158) (.node (.single 71) (.single 31))) (.node (.single 115) (.node (.single 152) (.single 68))))) (.node (.node (.node (.single 32) (.node (.single 117) (.single 151))) (.node (.single 66) (.node (.single 33) (.single 116)))) (.node (.node (.single 150) (.node (.single 67) (.single 34))) (.node (.single 118) (.node (.single 149) (.single 65)))))))))
def sourceData25 : FiniteInputTree ℕ 184 := (.node (.node (.node (.node (.node (.node (.node (.single 40) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 0)))) (.node (.node (.single 56) (.node (.single 60) (.single 120))) (.node (.single 124) (.node (.single 128) (.single 132))))) (.node (.node (.node (.single 64) (.node (.single 12) (.single 4))) (.node (.single 8) (.node (.single 16) (.single 20)))) (.node (.node (.single 136) (.node (.single 140) (.single 144))) (.node (.single 148) (.node (.single 68) (.single 152)))))) (.node (.node (.node (.node (.single 156) (.single 160)) (.node (.single 164) (.node (.single 72) (.single 88)))) (.node (.node (.single 92) (.node (.single 96) (.single 100))) (.node (.single 168) (.node (.single 172) (.single 176))))) (.node (.node (.node (.single 180) (.node (.single 76) (.single 80))) (.node (.single 84) (.node (.single 104) (.single 108)))) (.node (.node (.single 112) (.node (.single 116) (.single 24))) (.node (.single 28) (.node (.single 32) (.single 36))))))) (.node (.node (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 23)))) (.node (.node (.single 11) (.node (.single 19) (.single 7))) (.node (.single 119) (.node (.single 111) (.single 115))))) (.node (.node (.node (.single 107) (.node (.single 103) (.single 95))) (.node (.single 99) (.node (.single 91) (.single 87)))) (.node (.node (.single 79) (.node (.single 83) (.single 183))) (.node (.single 175) (.node (.single 179) (.single 171)))))) (.node (.node (.node (.node (.single 75) (.single 71)) (.node (.single 167) (.node (.single 159) (.single 163)))) (.node (.node (.single 155) (.node (.single 151) (.single 143))) (.node (.single 147) (.node (.single 139) (.single 15))))) (.node (.node (.node (.single 3) (.node (.single 67) (.single 63))) (.node (.single 135) (.node (.single 127) (.single 131)))) (.node (.node (.single 123) (.node (.single 59) (.single 55))) (.node (.single 47) (.node (.single 51) (.single 43)))))))) (.node (.node (.node (.node (.node (.node (.single 41) (.single 49)) (.node (.single 45) (.node (.single 53) (.single 57)))) (.node (.node (.single 121) (.node (.single 129) (.single 125))) (.node (.single 133) (.node (.single 61) (.single 65))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 137))) (.node (.single 145) (.node (.single 141) (.single 149)))) (.node (.node (.single 153) (.node (.single 161) (.single 157))) (.node (.single 165) (.node (.single 69) (.single 73)))))) (.node (.node (.node (.node (.single 169) (.single 177)) (.node (.single 173) (.node (.single 181) (.single 81)))) (.node (.node (.single 77) (.node (.single 85) (.single 89))) (.node (.single 97) (.node (.single 93) (.single 101))))) (.node (.node (.node (.single 105) (.node (.single 113) (.single 109))) (.node (.single 117) (.node (.single 5) (.single 17)))) (.node (.node (.single 9) (.node (.single 21) (.single 25))) (.node (.single 33) (.node (.single 29) (.single 37))))))) (.node (.node (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 118)))) (.node (.node (.single 114) (.node (.single 110) (.single 106))) (.node (.single 86) (.node (.single 82) (.single 78))))) (.node (.node (.node (.single 182) (.node (.single 178) (.single 174))) (.node (.single 170) (.node (.single 102) (.single 98)))) (.node (.node (.single 94) (.node (.single 90) (.single 74))) (.node (.single 166) (.node (.single 162) (.single 158)))))) (.node (.node (.node (.node (.single 154) (.single 70)) (.node (.single 150) (.node (.single 146) (.single 142)))) (.node (.node (.single 138) (.node (.single 22) (.single 18))) (.node (.single 10) (.node (.single 6) (.single 14))))) (.node (.node (.node (.single 66) (.node (.single 134) (.single 130))) (.node (.single 126) (.node (.single 122) (.single 62)))) (.node (.node (.single 58) (.node (.single 2) (.single 54))) (.node (.single 50) (.node (.single 46) (.single 42)))))))))
def cover25 (i : Fin 184) : Fin 184 := ⟨coverData25.get i % 184, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 184) : Fin 184 := ⟨sourceData25.get i % 184, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 .empty (.cutY 26112 (.cutX 5888 .empty (.cutY 25856 (.cutX 6016 (.cutY 25728 (.cutX 5952 (.cutY 25664 (.cutX 5920 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full) (.cutY 25664 (.cutX 5984 (.cutY 25632 .full .full) (.cutY 25632 (.cutX 6000 (.cutY 25616 .full .full) (.cutY 25616 .full .full)) .full)) .full)) (.cutX 5952 (.cutY 25792 .full .full) (.cutY 25792 .full .full))) (.cutY 25728 (.cutX 6080 (.cutY 25664 (.cutX 6048 (.cutY 25632 (.cutX 6032 (.cutY 25616 .full .full) (.cutY 25616 .full .full)) .full) (.cutY 25632 (.cutX 6064 (.cutY 25616 .full .full) (.cutY 25616 .full .full)) .full)) (.cutX 6048 (.cutY 25696 .full .full) (.cutY 25696 .full .full))) (.cutY 25664 (.cutX 6112 (.cutY 25632 (.cutX 6096 (.cutY 25616 .full .full) (.cutY 25616 .full .full)) .full) (.cutY 25632 .full .full)) (.cutX 6112 (.cutY 25696 .full .full) (.cutY 25696 .full .full)))) (.cutX 6080 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty)))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 (.cutX 6912 .empty (.cutY 26880 (.cutX 7040 (.cutY 26752 (.cutX 6976 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 6976 (.cutY 26816 .full .full) (.cutY 26816 .full .full))) (.cutY 26752 (.cutX 7104 (.cutY 26688 (.cutX 7072 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) (.cutX 7072 (.cutY 26720 .full .full) (.cutY 26720 .full .full))) (.cutY 26688 (.cutX 7136 (.cutY 26656 .full .full) (.cutY 26656 .full (.cutX 7152 (.cutY 26672 .full .full) (.cutY 26672 .full .full)))) (.cutX 7136 (.cutY 26720 .full .full) (.cutY 26720 (.cutX 7152 (.cutY 26704 .full .full) (.cutY 26704 .full .full)) (.cutX 7152 (.cutY 26736 .full .full) (.cutY 26736 .full .full)))))) (.cutX 7104 (.cutY 26816 .full .full) (.cutY 26816 (.cutX 7136 (.cutY 26784 .full .full) (.cutY 26784 (.cutX 7152 (.cutY 26768 .full .full) (.cutY 26768 .full .full)) .full)) (.cutX 7136 (.cutY 26848 .full .full) (.cutY 26848 .full .full)))))) .empty)) .empty)) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 .empty (.cutX 25856 (.cutY 5888 .empty (.cutX 25728 (.cutY 6016 (.cutX 25664 (.cutY 5952 (.cutX 25632 (.cutY 5920 .full .full) (.cutY 5920 .full .full)) (.cutX 25632 (.cutY 5984 .full (.cutX 25616 (.cutY 6000 .full .full) (.cutY 6000 .full .full))) (.cutY 5984 .full .full))) (.cutY 5952 .full .full)) (.cutX 25664 (.cutY 6080 (.cutX 25632 (.cutY 6048 (.cutX 25616 (.cutY 6032 .full .full) (.cutY 6032 .full .full)) (.cutX 25616 (.cutY 6064 .full .full) (.cutY 6064 .full .full))) (.cutY 6048 .full .full)) (.cutX 25632 (.cutY 6112 (.cutX 25616 (.cutY 6096 .full .full) (.cutY 6096 .full .full)) .full) (.cutY 6112 .full .full))) (.cutY 6080 (.cutX 25696 (.cutY 6048 .full .full) (.cutY 6048 .full .full)) (.cutX 25696 (.cutY 6112 .full .full) (.cutY 6112 .full .full))))) (.cutY 6016 (.cutX 25792 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 25792 (.cutY 6080 .full .full) (.cutY 6080 .full .full))))) .empty)) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 (.cutY 6656 .empty (.cutX 26880 (.cutY 6912 .empty (.cutX 26752 (.cutY 7040 (.cutX 26688 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 26688 (.cutY 7104 (.cutX 26656 (.cutY 7072 .full .full) (.cutY 7072 .full .full)) (.cutX 26656 (.cutY 7136 .full .full) (.cutY 7136 .full (.cutX 26672 (.cutY 7152 .full .full) (.cutY 7152 .full .full))))) (.cutY 7104 (.cutX 26720 (.cutY 7072 .full .full) (.cutY 7072 .full .full)) (.cutX 26720 (.cutY 7136 .full (.cutX 26704 (.cutY 7152 .full .full) (.cutY 7152 .full .full))) (.cutY 7136 .full (.cutX 26736 (.cutY 7152 .full .full) (.cutY 7152 .full .full))))))) (.cutY 7040 (.cutX 26816 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 26816 (.cutY 7104 .full (.cutX 26784 (.cutY 7136 .full (.cutX 26768 (.cutY 7152 .full .full) (.cutY 7152 .full .full))) (.cutY 7136 .full .full))) (.cutY 7104 .full (.cutX 26848 (.cutY 7136 .full .full) (.cutY 7136 .full .full))))))) .empty)) .empty) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata25 : 0<121837468 ∧ 23<128 ∧ 100<128 ∧ 0<4 ∧
    2515/4160=0 ∧ 2515%4160=2515 ∧ ∀ i, (leaves25 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData25).mp
    (by decide +kernel)

theorem sourceChecked25_0 : ∀ i : Fin 64,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 184 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked25_64 : ∀ i : Fin 64,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 184 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked25_128 : ∀ i : Fin 56,
    (fun i => output25 i = raw25 (source25 i)) (finOffset 184 128 56 (by decide) i) := by decide +kernel

theorem sourceChecked25 : ∀ i : Fin 184, (fun i => output25 i = raw25 (source25 i)) i :=
  forallFin_of_zero_offset (fun i => output25 i = raw25 (source25 i)) (forallFinOffset_add (fun i => output25 i = raw25 (source25 i)) 0 64 120 (by decide) sourceChecked25_0
    (forallFinOffset_add (fun i => output25 i = raw25 (source25 i)) 64 64 56 (by decide) sourceChecked25_64
    sourceChecked25_128))

theorem coverChecked25_0 : ∀ i : Fin 64,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 184 0 64 (by decide) i) := by decide +kernel

theorem coverChecked25_64 : ∀ i : Fin 64,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 184 64 64 (by decide) i) := by decide +kernel

theorem coverChecked25_128 : ∀ i : Fin 56,
    (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (finOffset 184 128 56 (by decide) i) := by decide +kernel

theorem coverChecked25 : ∀ i : Fin 184, (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) i :=
  forallFin_of_zero_offset (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) (forallFinOffset_add (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) 0 64 120 (by decide) coverChecked25_0
    (forallFinOffset_add (fun i => (output25 (cover25 i)).ContainsBox (raw25 i)) 64 64 56 (by decide) coverChecked25_64
    coverChecked25_128))

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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 7114, atom 11005, type 2, source (26,33).
def leavesData26 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves26 : Fin 4 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 26 33 leaves26 i
def outputData26 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6656,6784,8448,8576⟩) (.single ⟨6656,6784,8576,8704⟩)) (.node (.single ⟨6784,6912,8448,8576⟩) (.single ⟨6784,6912,8576,8704⟩))) (.node (.node (.single ⟨8448,8576,6656,6784⟩) (.single ⟨8448,8576,6784,6912⟩)) (.node (.single ⟨8576,8704,6656,6784⟩) (.single ⟨8576,8704,6784,6912⟩)))) (.node (.node (.node (.single ⟨24064,24192,25856,25984⟩) (.single ⟨24064,24192,25984,26112⟩)) (.node (.single ⟨24192,24320,25856,25984⟩) (.single ⟨24192,24320,25984,26112⟩))) (.node (.node (.single ⟨25856,25984,24064,24192⟩) (.single ⟨25856,25984,24192,24320⟩)) (.node (.single ⟨25984,26112,24064,24192⟩) (.single ⟨25984,26112,24192,24320⟩)))))
def output26 : Fin 16 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData26 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover26 (i : Fin 16) : Fin 16 := ⟨coverData26.get i % 16, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 16) : Fin 16 := ⟨sourceData26.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 (.cutY 9216 (.cutX 6656 .empty (.cutY 8704 (.cutX 6912 (.cutY 8448 .empty (.cutX 6784 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty)) .empty) .empty) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 (.cutX 8704 (.cutY 6656 .empty (.cutX 8448 .empty (.cutY 6912 (.cutX 8576 (.cutY 6784 .full .full) (.cutY 6784 .full .full)) .empty))) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 .empty (.cutX 24064 .empty (.cutY 26112 (.cutX 24320 (.cutY 25856 .empty (.cutX 24192 (.cutY 25984 .full .full) (.cutY 25984 .full .full))) .empty) .empty)))) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 .empty (.cutY 23552 .empty (.cutX 26112 (.cutY 24064 .empty (.cutX 25856 .empty (.cutY 24320 (.cutX 25984 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))) .empty)))) .empty)) .empty) .empty))))

theorem metadata26 : 0<43243096 ∧ 26<128 ∧ 33<128 ∧ 2<4 ∧
    11005/4160=2 ∧ 11005%4160=2685 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 7115, atom 2079, type 0, source (18,99).
def leavesData27 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves27 : Fin 10 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 99 leaves27 i
def outputData27 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,25344,25408⟩) (.single ⟨4608,4672,25408,25472⟩)) (.node (.single ⟨4672,4736,25344,25408⟩) (.node (.single ⟨4672,4736,25408,25472⟩) (.single ⟨4608,4736,25472,25600⟩)))) (.node (.node (.single ⟨4736,4800,25344,25408⟩) (.single ⟨4736,4800,25408,25472⟩)) (.node (.single ⟨4800,4864,25344,25408⟩) (.node (.single ⟨4800,4864,25408,25472⟩) (.single ⟨4736,4864,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,27904,28032⟩) (.single ⟨7168,7296,28032,28160⟩)) (.node (.single ⟨7296,7360,27904,27968⟩) (.node (.single ⟨7296,7360,27968,28032⟩) (.single ⟨7360,7424,27904,27968⟩)))) (.node (.node (.single ⟨7360,7424,27968,28032⟩) (.single ⟨7296,7360,28032,28096⟩)) (.node (.single ⟨7296,7360,28096,28160⟩) (.node (.single ⟨7360,7424,28032,28096⟩) (.single ⟨7360,7424,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,4608,4672⟩) (.single ⟨25344,25408,4672,4736⟩)) (.node (.single ⟨25408,25472,4608,4672⟩) (.node (.single ⟨25408,25472,4672,4736⟩) (.single ⟨25344,25408,4736,4800⟩)))) (.node (.node (.single ⟨25344,25408,4800,4864⟩) (.single ⟨25408,25472,4736,4800⟩)) (.node (.single ⟨25408,25472,4800,4864⟩) (.node (.single ⟨25472,25600,4608,4736⟩) (.single ⟨25472,25600,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,7168,7296⟩) (.single ⟨27904,27968,7296,7360⟩)) (.node (.single ⟨27904,27968,7360,7424⟩) (.node (.single ⟨27968,28032,7296,7360⟩) (.single ⟨27968,28032,7360,7424⟩)))) (.node (.node (.single ⟨28032,28160,7168,7296⟩) (.single ⟨28032,28096,7296,7360⟩)) (.node (.single ⟨28032,28096,7360,7424⟩) (.node (.single ⟨28096,28160,7296,7360⟩) (.single ⟨28096,28160,7360,7424⟩)))))))
def output27 : Fin 40 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData27 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover27 (i : Fin 40) : Fin 40 := ⟨coverData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 40) : Fin 40 := ⟨sourceData27.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 .empty (.cutX 4864 (.cutY 25344 .empty (.cutX 4736 (.cutY 25472 (.cutX 4672 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 4800 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty))) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 (.cutX 7424 (.cutY 27904 .empty (.cutX 7296 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 7360 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) (.cutX 7360 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 .empty (.cutX 25344 .empty (.cutY 4864 (.cutX 25472 (.cutY 4736 (.cutX 25408 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 25408 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty)))) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 (.cutX 27904 .empty (.cutY 7424 (.cutX 28032 (.cutY 7296 .full (.cutX 27968 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 28096 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty) .empty)))))) .empty) .empty)) .empty))

theorem metadata27 : 0<121837468 ∧ 18<128 ∧ 99<128 ∧ 0<4 ∧
    2079/4160=0 ∧ 2079%4160=2079 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 7116, atom 1890, type 0, source (16,98).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 16 98 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4096,4224,25088,25216⟩) (.node (.single ⟨4096,4224,25216,25344⟩) (.single ⟨4224,4288,25088,25152⟩))) (.node (.node (.single ⟨4224,4288,25152,25216⟩) (.single ⟨4288,4352,25088,25152⟩)) (.node (.single ⟨4288,4352,25152,25216⟩) (.single ⟨4224,4352,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,28416,28544⟩) (.node (.single ⟨7424,7552,28544,28672⟩) (.single ⟨7552,7616,28416,28480⟩))) (.node (.node (.single ⟨7552,7616,28480,28544⟩) (.single ⟨7616,7680,28416,28480⟩)) (.node (.single ⟨7616,7680,28480,28544⟩) (.single ⟨7552,7680,28544,28672⟩))))) (.node (.node (.node (.single ⟨25088,25216,4096,4224⟩) (.node (.single ⟨25088,25152,4224,4288⟩) (.single ⟨25088,25152,4288,4352⟩))) (.node (.node (.single ⟨25152,25216,4224,4288⟩) (.single ⟨25152,25216,4288,4352⟩)) (.node (.single ⟨25216,25344,4096,4224⟩) (.single ⟨25216,25344,4224,4352⟩)))) (.node (.node (.single ⟨28416,28544,7424,7552⟩) (.node (.single ⟨28416,28480,7552,7616⟩) (.single ⟨28416,28480,7616,7680⟩))) (.node (.node (.single ⟨28480,28544,7552,7616⟩) (.single ⟨28480,28544,7616,7680⟩)) (.node (.single ⟨28544,28672,7424,7552⟩) (.single ⟨28544,28672,7552,7680⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 .empty (.cutX 4352 (.cutY 25344 (.cutX 4224 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 4288 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 .empty (.cutX 7424 .empty (.cutY 28416 .empty (.cutX 7552 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 7616 (.cutY 28480 .full .full) (.cutY 28480 .full .full)) .full))))) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 (.cutX 25344 (.cutY 4352 (.cutX 25216 (.cutY 4224 .full (.cutX 25152 (.cutY 4288 .full .full) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 (.cutX 28416 .empty (.cutY 7424 .empty (.cutX 28544 (.cutY 7552 .full (.cutX 28480 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))))))) .empty) .empty)) .empty))

theorem metadata28 : 0<121837468 ∧ 16<128 ∧ 98<128 ∧ 0<4 ∧
    1890/4160=0 ∧ 1890%4160=1890 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 7117, atom 6143, type 1, source (17,96).
def leavesData29 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves29 : Fin 13 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 96 leaves29 i
def outputData29 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,24576,24640⟩) (.node (.single ⟨4352,4416,24640,24704⟩) (.single ⟨4416,4480,24576,24640⟩))) (.node (.single ⟨4416,4480,24640,24704⟩) (.node (.single ⟨4352,4480,24704,24832⟩) (.single ⟨4480,4544,24576,24640⟩)))) (.node (.node (.single ⟨4480,4544,24640,24704⟩) (.node (.single ⟨4544,4576,24576,24608⟩) (.single ⟨4544,4576,24608,24640⟩))) (.node (.node (.single ⟨4576,4608,24576,24608⟩) (.single ⟨4576,4608,24608,24640⟩)) (.node (.single ⟨4544,4608,24640,24704⟩) (.single ⟨4480,4608,24704,24832⟩))))) (.node (.node (.node (.single ⟨7936,8064,28160,28288⟩) (.node (.single ⟨7936,8064,28288,28416⟩) (.single ⟨8064,8128,28160,28224⟩))) (.node (.single ⟨8064,8128,28224,28288⟩) (.node (.single ⟨8128,8160,28160,28192⟩) (.single ⟨8128,8160,28192,28224⟩)))) (.node (.node (.single ⟨8160,8192,28160,28192⟩) (.node (.single ⟨8160,8192,28192,28224⟩) (.single ⟨8128,8192,28224,28288⟩))) (.node (.node (.single ⟨8064,8128,28288,28352⟩) (.single ⟨8064,8128,28352,28416⟩)) (.node (.single ⟨8128,8192,28288,28352⟩) (.single ⟨8128,8192,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨24576,24640,4352,4416⟩) (.node (.single ⟨24576,24640,4416,4480⟩) (.single ⟨24640,24704,4352,4416⟩))) (.node (.single ⟨24640,24704,4416,4480⟩) (.node (.single ⟨24576,24640,4480,4544⟩) (.single ⟨24576,24608,4544,4576⟩)))) (.node (.node (.single ⟨24576,24608,4576,4608⟩) (.node (.single ⟨24608,24640,4544,4576⟩) (.single ⟨24608,24640,4576,4608⟩))) (.node (.node (.single ⟨24640,24704,4480,4544⟩) (.single ⟨24640,24704,4544,4608⟩)) (.node (.single ⟨24704,24832,4352,4480⟩) (.single ⟨24704,24832,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,7936,8064⟩) (.node (.single ⟨28160,28224,8064,8128⟩) (.single ⟨28160,28192,8128,8160⟩))) (.node (.single ⟨28160,28192,8160,8192⟩) (.node (.single ⟨28192,28224,8128,8160⟩) (.single ⟨28192,28224,8160,8192⟩)))) (.node (.node (.single ⟨28224,28288,8064,8128⟩) (.node (.single ⟨28224,28288,8128,8192⟩) (.single ⟨28288,28416,7936,8064⟩))) (.node (.node (.single ⟨28288,28352,8064,8128⟩) (.single ⟨28288,28352,8128,8192⟩)) (.node (.single ⟨28352,28416,8064,8128⟩) (.single ⟨28352,28416,8128,8192⟩)))))))
def output29 : Fin 52 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData29 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover29 (i : Fin 52) : Fin 52 := ⟨coverData29.get i % 52, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 52) : Fin 52 := ⟨sourceData29.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 (.cutX 4352 .empty (.cutY 24832 (.cutX 4480 (.cutY 24704 (.cutX 4416 (.cutY 24640 .full .full) (.cutY 24640 .full .full)) .full) (.cutY 24704 (.cutX 4544 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 4576 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 .empty (.cutX 7936 .empty (.cutY 28416 (.cutX 8064 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 8128 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 8160 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 8128 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty)))))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 (.cutX 24832 (.cutY 4352 .empty (.cutX 24704 (.cutY 4480 (.cutX 24640 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 24640 (.cutY 4544 .full (.cutX 24608 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 .empty (.cutX 28416 (.cutY 7936 .empty (.cutX 28288 (.cutY 8064 .full (.cutX 28224 (.cutY 8128 .full (.cutX 28192 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full (.cutX 28352 (.cutY 8128 .full .full) (.cutY 8128 .full .full))))) .empty)))))))) .empty) .empty)) .empty))

theorem metadata29 : 0<151956162 ∧ 17<128 ∧ 96<128 ∧ 1<4 ∧
    6143/4160=1 ∧ 6143%4160=1983 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 7118, atom 6673, type 1, source (23,98).
def leavesData30 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves30 : Fin 10 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 23 98 leaves30 i
def outputData30 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,25088,25152⟩) (.single ⟨5888,5952,25152,25216⟩)) (.node (.single ⟨5952,6016,25088,25152⟩) (.node (.single ⟨5952,6016,25152,25216⟩) (.single ⟨5888,6016,25216,25344⟩)))) (.node (.node (.single ⟨6016,6080,25088,25152⟩) (.single ⟨6016,6080,25152,25216⟩)) (.node (.single ⟨6080,6144,25088,25152⟩) (.node (.single ⟨6080,6144,25152,25216⟩) (.single ⟨6016,6144,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26624,26752⟩) (.single ⟨7424,7552,26752,26880⟩)) (.node (.single ⟨7552,7616,26624,26688⟩) (.node (.single ⟨7552,7616,26688,26752⟩) (.single ⟨7616,7680,26624,26688⟩)))) (.node (.node (.single ⟨7616,7680,26688,26752⟩) (.single ⟨7552,7616,26752,26816⟩)) (.node (.single ⟨7552,7616,26816,26880⟩) (.node (.single ⟨7616,7680,26752,26816⟩) (.single ⟨7616,7680,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,5888,5952⟩) (.single ⟨25088,25152,5952,6016⟩)) (.node (.single ⟨25152,25216,5888,5952⟩) (.node (.single ⟨25152,25216,5952,6016⟩) (.single ⟨25088,25152,6016,6080⟩)))) (.node (.node (.single ⟨25088,25152,6080,6144⟩) (.single ⟨25152,25216,6016,6080⟩)) (.node (.single ⟨25152,25216,6080,6144⟩) (.node (.single ⟨25216,25344,5888,6016⟩) (.single ⟨25216,25344,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,7424,7552⟩) (.single ⟨26624,26688,7552,7616⟩)) (.node (.single ⟨26624,26688,7616,7680⟩) (.node (.single ⟨26688,26752,7552,7616⟩) (.single ⟨26688,26752,7616,7680⟩)))) (.node (.node (.single ⟨26752,26880,7424,7552⟩) (.single ⟨26752,26816,7552,7616⟩)) (.node (.single ⟨26752,26816,7616,7680⟩) (.node (.single ⟨26816,26880,7552,7616⟩) (.single ⟨26816,26880,7616,7680⟩)))))))
def output30 : Fin 40 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData30 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover30 (i : Fin 40) : Fin 40 := ⟨coverData30.get i % 40, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 40) : Fin 40 := ⟨sourceData30.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 .empty (.cutY 25344 (.cutX 6016 (.cutY 25216 (.cutX 5952 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6080 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty)))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 .empty (.cutY 26880 (.cutX 7552 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 7616 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 7616 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 (.cutY 5888 .empty (.cutX 25216 (.cutY 6016 (.cutX 25152 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 25152 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 (.cutY 7424 .empty (.cutX 26752 (.cutY 7552 .full (.cutX 26688 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 26816 (.cutY 7616 .full .full) (.cutY 7616 .full .full))))) .empty) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata30 : 0<151956162 ∧ 23<128 ∧ 98<128 ∧ 1<4 ∧
    6673/4160=1 ∧ 6673%4160=2513 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

-- Frozen phase 7119, atom 6590, type 1, source (22,98).
def leavesData31 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves31 : Fin 10 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 98 leaves31 i
def outputData31 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,25088,25152⟩) (.single ⟨5632,5696,25152,25216⟩)) (.node (.single ⟨5696,5760,25088,25152⟩) (.node (.single ⟨5696,5760,25152,25216⟩) (.single ⟨5632,5760,25216,25344⟩)))) (.node (.node (.single ⟨5760,5824,25088,25152⟩) (.single ⟨5760,5824,25152,25216⟩)) (.node (.single ⟨5824,5888,25088,25152⟩) (.node (.single ⟨5824,5888,25152,25216⟩) (.single ⟨5760,5888,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26880,27008⟩) (.single ⟨7424,7552,27008,27136⟩)) (.node (.single ⟨7552,7616,26880,26944⟩) (.node (.single ⟨7552,7616,26944,27008⟩) (.single ⟨7616,7680,26880,26944⟩)))) (.node (.node (.single ⟨7616,7680,26944,27008⟩) (.single ⟨7552,7616,27008,27072⟩)) (.node (.single ⟨7552,7616,27072,27136⟩) (.node (.single ⟨7616,7680,27008,27072⟩) (.single ⟨7616,7680,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25152,5632,5696⟩) (.single ⟨25088,25152,5696,5760⟩)) (.node (.single ⟨25152,25216,5632,5696⟩) (.node (.single ⟨25152,25216,5696,5760⟩) (.single ⟨25088,25152,5760,5824⟩)))) (.node (.node (.single ⟨25088,25152,5824,5888⟩) (.single ⟨25152,25216,5760,5824⟩)) (.node (.single ⟨25152,25216,5824,5888⟩) (.node (.single ⟨25216,25344,5632,5760⟩) (.single ⟨25216,25344,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,7424,7552⟩) (.single ⟨26880,26944,7552,7616⟩)) (.node (.single ⟨26880,26944,7616,7680⟩) (.node (.single ⟨26944,27008,7552,7616⟩) (.single ⟨26944,27008,7616,7680⟩)))) (.node (.node (.single ⟨27008,27136,7424,7552⟩) (.single ⟨27008,27072,7552,7616⟩)) (.node (.single ⟨27008,27072,7616,7680⟩) (.node (.single ⟨27072,27136,7552,7616⟩) (.single ⟨27072,27136,7616,7680⟩)))))))
def output31 : Fin 40 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData31 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover31 (i : Fin 40) : Fin 40 := ⟨coverData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 40) : Fin 40 := ⟨sourceData31.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 .empty (.cutY 25088 .empty (.cutX 5888 (.cutY 25344 (.cutX 5760 (.cutY 25216 (.cutX 5696 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 5824 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty))) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 (.cutX 7424 .empty (.cutY 26880 .empty (.cutX 7552 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 7616 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 7616 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 .empty (.cutX 25344 (.cutY 5888 (.cutX 25216 (.cutY 5760 (.cutX 25152 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 25152 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 (.cutY 7680 (.cutX 26880 .empty (.cutY 7424 .empty (.cutX 27008 (.cutY 7552 .full (.cutX 26944 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 27072 (.cutY 7616 .full .full) (.cutY 7616 .full .full)))))) .empty) .empty)) .empty)))) .empty) .empty)) .empty))

theorem metadata31 : 0<151956162 ∧ 22<128 ∧ 98<128 ∧ 1<4 ∧
    6590/4160=1 ∧ 6590%4160=2430 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 7120, atom 6505, type 1, source (21,98).
def leavesData32 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves32 : Fin 7 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 98 leaves32 i
def outputData32 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,25088,25216⟩) (.node (.single ⟨5376,5504,25216,25344⟩) (.single ⟨5504,5568,25088,25152⟩))) (.node (.node (.single ⟨5504,5568,25152,25216⟩) (.single ⟨5568,5632,25088,25152⟩)) (.node (.single ⟨5568,5632,25152,25216⟩) (.single ⟨5504,5632,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,27136,27264⟩) (.node (.single ⟨7424,7552,27264,27392⟩) (.single ⟨7552,7616,27136,27200⟩))) (.node (.node (.single ⟨7552,7616,27200,27264⟩) (.single ⟨7616,7680,27136,27200⟩)) (.node (.single ⟨7616,7680,27200,27264⟩) (.single ⟨7552,7680,27264,27392⟩))))) (.node (.node (.node (.single ⟨25088,25216,5376,5504⟩) (.node (.single ⟨25088,25152,5504,5568⟩) (.single ⟨25088,25152,5568,5632⟩))) (.node (.node (.single ⟨25152,25216,5504,5568⟩) (.single ⟨25152,25216,5568,5632⟩)) (.node (.single ⟨25216,25344,5376,5504⟩) (.single ⟨25216,25344,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,7424,7552⟩) (.node (.single ⟨27136,27200,7552,7616⟩) (.single ⟨27136,27200,7616,7680⟩))) (.node (.node (.single ⟨27200,27264,7552,7616⟩) (.single ⟨27200,27264,7616,7680⟩)) (.node (.single ⟨27264,27392,7424,7552⟩) (.single ⟨27264,27392,7552,7680⟩))))))
def output32 : Fin 28 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData32 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover32 (i : Fin 28) : Fin 28 := ⟨coverData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 28) : Fin 28 := ⟨sourceData32.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 .empty (.cutX 5376 .empty (.cutY 25344 (.cutX 5504 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 5568 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty))) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 .empty (.cutX 7424 .empty (.cutY 27392 (.cutX 7552 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 7616 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty))) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 (.cutX 25344 (.cutY 5376 .empty (.cutX 25216 (.cutY 5504 .full (.cutX 25152 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 (.cutX 27392 (.cutY 7424 .empty (.cutX 27264 (.cutY 7552 .full (.cutX 27200 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty))) .empty)))) .empty) .empty)) .empty))

theorem metadata32 : 0<151956162 ∧ 21<128 ∧ 98<128 ∧ 1<4 ∧
    6505/4160=1 ∧ 6505%4160=2345 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 7121, atom 6328, type 1, source (19,97).
def leavesData33 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves33 : Fin 10 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 97 leaves33 i
def outputData33 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,24832,24896⟩) (.single ⟨4864,4928,24896,24960⟩)) (.node (.single ⟨4928,4992,24832,24896⟩) (.node (.single ⟨4928,4992,24896,24960⟩) (.single ⟨4864,4992,24960,25088⟩)))) (.node (.node (.single ⟨4992,5056,24832,24896⟩) (.single ⟨4992,5056,24896,24960⟩)) (.node (.single ⟨5056,5120,24832,24896⟩) (.node (.single ⟨5056,5120,24896,24960⟩) (.single ⟨4992,5120,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,27648,27776⟩) (.single ⟨7680,7808,27776,27904⟩)) (.node (.single ⟨7808,7872,27648,27712⟩) (.node (.single ⟨7808,7872,27712,27776⟩) (.single ⟨7872,7936,27648,27712⟩)))) (.node (.node (.single ⟨7872,7936,27712,27776⟩) (.single ⟨7808,7872,27776,27840⟩)) (.node (.single ⟨7808,7872,27840,27904⟩) (.node (.single ⟨7872,7936,27776,27840⟩) (.single ⟨7872,7936,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,4864,4928⟩) (.single ⟨24832,24896,4928,4992⟩)) (.node (.single ⟨24896,24960,4864,4928⟩) (.node (.single ⟨24896,24960,4928,4992⟩) (.single ⟨24832,24896,4992,5056⟩)))) (.node (.node (.single ⟨24832,24896,5056,5120⟩) (.single ⟨24896,24960,4992,5056⟩)) (.node (.single ⟨24896,24960,5056,5120⟩) (.node (.single ⟨24960,25088,4864,4992⟩) (.single ⟨24960,25088,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,7680,7808⟩) (.single ⟨27648,27712,7808,7872⟩)) (.node (.single ⟨27648,27712,7872,7936⟩) (.node (.single ⟨27712,27776,7808,7872⟩) (.single ⟨27712,27776,7872,7936⟩)))) (.node (.node (.single ⟨27776,27904,7680,7808⟩) (.single ⟨27776,27840,7808,7872⟩)) (.node (.single ⟨27776,27840,7872,7936⟩) (.node (.single ⟨27840,27904,7808,7872⟩) (.single ⟨27840,27904,7872,7936⟩)))))))
def output33 : Fin 40 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover33 (i : Fin 40) : Fin 40 := ⟨coverData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 40) : Fin 40 := ⟨sourceData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 (.cutX 4864 .empty (.cutY 24832 .empty (.cutX 4992 (.cutY 24960 (.cutX 4928 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 5056 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty)) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 (.cutX 7936 (.cutY 27904 (.cutX 7808 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 7872 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 7872 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty)))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 .empty (.cutX 24832 .empty (.cutY 4864 .empty (.cutX 24960 (.cutY 4992 (.cutX 24896 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 24896 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))))) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 .empty (.cutX 27904 (.cutY 7936 (.cutX 27776 (.cutY 7808 .full (.cutX 27712 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 27840 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty) .empty)) .empty)))))) .empty) .empty)) .empty))

theorem metadata33 : 0<151956162 ∧ 19<128 ∧ 97<128 ∧ 1<4 ∧
    6328/4160=1 ∧ 6328%4160=2168 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 7122, atom 6833, type 1, source (25,98).
def leavesData34 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩))) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)))) (.node (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩))) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves34 : Fin 22 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 25 98 leaves34 i
def outputData34 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨6400,6464,25088,25152⟩) (.single ⟨6400,6464,25152,25216⟩)) (.node (.single ⟨6464,6528,25088,25152⟩) (.node (.single ⟨6464,6528,25152,25216⟩) (.single ⟨6400,6528,25216,25344⟩)))) (.node (.node (.single ⟨6528,6560,25088,25120⟩) (.node (.single ⟨6528,6560,25120,25152⟩) (.single ⟨6560,6592,25088,25120⟩))) (.node (.single ⟨6560,6592,25120,25152⟩) (.node (.single ⟨6528,6592,25152,25216⟩) (.single ⟨6592,6624,25088,25120⟩))))) (.node (.node (.node (.single ⟨6592,6624,25120,25152⟩) (.single ⟨6624,6640,25088,25104⟩)) (.node (.single ⟨6624,6640,25104,25120⟩) (.node (.single ⟨6640,6656,25088,25104⟩) (.single ⟨6640,6656,25104,25120⟩)))) (.node (.node (.single ⟨6624,6656,25120,25152⟩) (.node (.single ⟨6592,6656,25152,25216⟩) (.single ⟨6528,6592,25216,25280⟩))) (.node (.single ⟨6528,6592,25280,25344⟩) (.node (.single ⟨6592,6656,25216,25280⟩) (.single ⟨6592,6656,25280,25344⟩)))))) (.node (.node (.node (.node (.single ⟨7424,7488,26112,26176⟩) (.single ⟨7424,7488,26176,26240⟩)) (.node (.single ⟨7488,7552,26112,26176⟩) (.node (.single ⟨7488,7552,26176,26240⟩) (.single ⟨7424,7552,26240,26368⟩)))) (.node (.node (.single ⟨7552,7616,26112,26176⟩) (.node (.single ⟨7552,7616,26176,26240⟩) (.single ⟨7616,7648,26112,26144⟩))) (.node (.single ⟨7616,7648,26144,26176⟩) (.node (.single ⟨7648,7664,26112,26128⟩) (.single ⟨7648,7664,26128,26144⟩))))) (.node (.node (.node (.single ⟨7664,7680,26112,26128⟩) (.single ⟨7664,7680,26128,26144⟩)) (.node (.single ⟨7648,7680,26144,26176⟩) (.node (.single ⟨7616,7648,26176,26208⟩) (.single ⟨7616,7648,26208,26240⟩)))) (.node (.node (.single ⟨7648,7680,26176,26208⟩) (.node (.single ⟨7648,7680,26208,26240⟩) (.single ⟨7552,7616,26240,26304⟩))) (.node (.single ⟨7552,7616,26304,26368⟩) (.node (.single ⟨7616,7680,26240,26304⟩) (.single ⟨7616,7680,26304,26368⟩))))))) (.node (.node (.node (.node (.node (.single ⟨25088,25152,6400,6464⟩) (.single ⟨25088,25152,6464,6528⟩)) (.node (.single ⟨25152,25216,6400,6464⟩) (.node (.single ⟨25152,25216,6464,6528⟩) (.single ⟨25088,25120,6528,6560⟩)))) (.node (.node (.single ⟨25088,25120,6560,6592⟩) (.node (.single ⟨25120,25152,6528,6560⟩) (.single ⟨25120,25152,6560,6592⟩))) (.node (.single ⟨25088,25120,6592,6624⟩) (.node (.single ⟨25088,25104,6624,6640⟩) (.single ⟨25088,25104,6640,6656⟩))))) (.node (.node (.node (.single ⟨25104,25120,6624,6640⟩) (.single ⟨25104,25120,6640,6656⟩)) (.node (.single ⟨25120,25152,6592,6624⟩) (.node (.single ⟨25120,25152,6624,6656⟩) (.single ⟨25152,25216,6528,6592⟩)))) (.node (.node (.single ⟨25152,25216,6592,6656⟩) (.node (.single ⟨25216,25344,6400,6528⟩) (.single ⟨25216,25280,6528,6592⟩))) (.node (.single ⟨25216,25280,6592,6656⟩) (.node (.single ⟨25280,25344,6528,6592⟩) (.single ⟨25280,25344,6592,6656⟩)))))) (.node (.node (.node (.node (.single ⟨26112,26176,7424,7488⟩) (.single ⟨26112,26176,7488,7552⟩)) (.node (.single ⟨26176,26240,7424,7488⟩) (.node (.single ⟨26176,26240,7488,7552⟩) (.single ⟨26112,26176,7552,7616⟩)))) (.node (.node (.single ⟨26112,26144,7616,7648⟩) (.node (.single ⟨26112,26128,7648,7664⟩) (.single ⟨26112,26128,7664,7680⟩))) (.node (.single ⟨26128,26144,7648,7664⟩) (.node (.single ⟨26128,26144,7664,7680⟩) (.single ⟨26144,26176,7616,7648⟩))))) (.node (.node (.node (.single ⟨26144,26176,7648,7680⟩) (.single ⟨26176,26240,7552,7616⟩)) (.node (.single ⟨26176,26208,7616,7648⟩) (.node (.single ⟨26176,26208,7648,7680⟩) (.single ⟨26208,26240,7616,7648⟩)))) (.node (.node (.single ⟨26208,26240,7648,7680⟩) (.node (.single ⟨26240,26368,7424,7552⟩) (.single ⟨26240,26304,7552,7616⟩))) (.node (.single ⟨26240,26304,7616,7680⟩) (.node (.single ⟨26304,26368,7552,7616⟩) (.single ⟨26304,26368,7616,7680⟩))))))))
def output34 : Fin 88 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 61)) (.node (.single 83) (.node (.single 26) (.single 0)))) (.node (.node (.single 44) (.node (.single 87) (.single 43))) (.node (.single 1) (.node (.single 46) (.single 86))))) (.node (.node (.node (.single 41) (.single 2)) (.node (.single 45) (.node (.single 85) (.single 42)))) (.node (.node (.single 3) (.node (.single 47) (.single 84))) (.node (.single 40) (.node (.single 9) (.single 59)))))) (.node (.node (.node (.node (.single 78) (.single 28)) (.node (.single 17) (.node (.single 60) (.single 70)))) (.node (.node (.single 27) (.node (.single 18) (.single 62))) (.node (.single 69) (.node (.single 25) (.single 19))))) (.node (.node (.node (.single 64) (.single 68)) (.node (.single 23) (.node (.single 20) (.single 63)))) (.node (.node (.single 67) (.node (.single 24) (.single 21))) (.node (.single 65) (.node (.single 66) (.single 22))))))) (.node (.node (.node (.node (.node (.single 10) (.single 52)) (.node (.single 77) (.node (.single 35) (.single 11)))) (.node (.node (.single 57) (.node (.single 76) (.single 30))) (.node (.single 16) (.node (.single 58) (.single 71))))) (.node (.node (.node (.single 29) (.single 5)) (.node (.single 48) (.node (.single 82) (.single 39)))) (.node (.node (.single 6) (.node (.single 50) (.single 81))) (.node (.single 37) (.node (.single 7) (.single 49)))))) (.node (.node (.node (.node (.single 80) (.single 38)) (.node (.single 8) (.node (.single 51) (.single 79)))) (.node (.node (.single 36) (.node (.single 12) (.single 53))) (.node (.single 75) (.node (.single 34) (.single 13))))) (.node (.node (.node (.single 55) (.single 74)) (.node (.single 32) (.node (.single 14) (.single 54)))) (.node (.node (.single 73) (.node (.single 33) (.single 15))) (.node (.single 56) (.node (.single 72) (.single 31))))))))
def sourceData34 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.node (.single 16) (.single 0)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 68) (.node (.single 20) (.single 44))))) (.node (.node (.node (.single 48) (.single 72)) (.node (.single 76) (.node (.single 80) (.single 84)))) (.node (.node (.single 52) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.node (.single 31) (.single 3)))) (.node (.node (.single 27) (.node (.single 23) (.single 55))) (.node (.single 51) (.node (.single 87) (.single 79))))) (.node (.node (.node (.single 83) (.single 75)) (.node (.single 47) (.node (.single 71) (.single 63)))) (.node (.node (.single 67) (.node (.single 59) (.single 19))) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.node (.single 17) (.single 57)))) (.node (.node (.single 65) (.node (.single 61) (.single 69))) (.node (.single 45) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 49) (.node (.single 53) (.single 21)))) (.node (.node (.single 25) (.node (.single 1) (.single 29))) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 54) (.node (.single 86) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 50))))) (.node (.node (.node (.single 46) (.single 22)) (.node (.single 70) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 2) (.single 18))) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover34 (i : Fin 88) : Fin 88 := ⟨coverData34.get i % 88, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 88) : Fin 88 := ⟨sourceData34.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 .empty (.cutY 25344 (.cutX 6528 (.cutY 25216 (.cutX 6464 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6592 (.cutY 25152 (.cutX 6560 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full) (.cutY 25152 (.cutX 6624 (.cutY 25120 .full .full) (.cutY 25120 (.cutX 6640 (.cutY 25104 .full .full) (.cutY 25104 .full .full)) .full)) .full)) (.cutX 6592 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty))) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 .empty (.cutY 26368 (.cutX 7552 (.cutY 26240 (.cutX 7488 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full) (.cutY 26240 (.cutX 7616 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 7648 (.cutY 26144 .full .full) (.cutY 26144 (.cutX 7664 (.cutY 26128 .full .full) (.cutY 26128 .full .full)) .full)) (.cutX 7648 (.cutY 26208 .full .full) (.cutY 26208 .full .full)))) (.cutX 7616 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 (.cutY 6400 .empty (.cutX 25216 (.cutY 6528 (.cutX 25152 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 25152 (.cutY 6592 (.cutX 25120 (.cutY 6560 .full .full) (.cutY 6560 .full .full)) (.cutX 25120 (.cutY 6624 .full (.cutX 25104 (.cutY 6640 .full .full) (.cutY 6640 .full .full))) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full (.cutX 25280 (.cutY 6592 .full .full) (.cutY 6592 .full .full))))) .empty) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 (.cutY 7424 .empty (.cutX 26240 (.cutY 7552 (.cutX 26176 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 26176 (.cutY 7616 .full (.cutX 26144 (.cutY 7648 .full (.cutX 26128 (.cutY 7664 .full .full) (.cutY 7664 .full .full))) (.cutY 7648 .full .full))) (.cutY 7616 .full (.cutX 26208 (.cutY 7648 .full .full) (.cutY 7648 .full .full))))) (.cutY 7552 .full (.cutX 26304 (.cutY 7616 .full .full) (.cutY 7616 .full .full))))) .empty) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata34 : 0<48020332 ∧ 25<128 ∧ 98<128 ∧ 1<4 ∧
    6833/4160=1 ∧ 6833%4160=2673 ∧ ∀ i, (leaves34 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData34).mp
    (by decide +kernel)

theorem sourceChecked34_0 : ∀ i : Fin 64,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked34_64 : ∀ i : Fin 24,
    (fun i => output34 i = raw34 (source34 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked34 : ∀ i : Fin 88, (fun i => output34 i = raw34 (source34 i)) i :=
  forallFin_of_zero_offset (fun i => output34 i = raw34 (source34 i)) (forallFinOffset_add (fun i => output34 i = raw34 (source34 i)) 0 64 24 (by decide) sourceChecked34_0
    sourceChecked34_64)

theorem coverChecked34_0 : ∀ i : Fin 64,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked34_64 : ∀ i : Fin 24,
    (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked34 : ∀ i : Fin 88, (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) i :=
  forallFin_of_zero_offset (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) (forallFinOffset_add (fun i => (output34 (cover34 i)).ContainsBox (raw34 i)) 0 64 24 (by decide) coverChecked34_0
    coverChecked34_64)

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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 7123, atom 6754, type 1, source (24,98).
def leavesData35 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,0,0⟩) (.single ⟨3,0,1⟩)) (.node (.single ⟨3,1,0⟩) (.single ⟨3,1,1⟩)))))
def leaves35 : Fin 13 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 98 leaves35 i
def outputData35 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6176,25088,25120⟩) (.node (.single ⟨6144,6176,25120,25152⟩) (.single ⟨6176,6208,25088,25120⟩))) (.node (.single ⟨6176,6208,25120,25152⟩) (.node (.single ⟨6144,6208,25152,25216⟩) (.single ⟨6208,6272,25088,25152⟩)))) (.node (.node (.single ⟨6208,6272,25152,25216⟩) (.node (.single ⟨6144,6272,25216,25344⟩) (.single ⟨6272,6336,25088,25152⟩))) (.node (.node (.single ⟨6272,6336,25152,25216⟩) (.single ⟨6336,6400,25088,25152⟩)) (.node (.single ⟨6336,6400,25152,25216⟩) (.single ⟨6272,6400,25216,25344⟩))))) (.node (.node (.node (.single ⟨7424,7552,26368,26496⟩) (.node (.single ⟨7424,7552,26496,26624⟩) (.single ⟨7552,7616,26368,26432⟩))) (.node (.single ⟨7552,7616,26432,26496⟩) (.node (.single ⟨7616,7680,26368,26432⟩) (.single ⟨7616,7680,26432,26496⟩)))) (.node (.node (.single ⟨7552,7616,26496,26560⟩) (.node (.single ⟨7552,7616,26560,26624⟩) (.single ⟨7616,7680,26496,26560⟩))) (.node (.node (.single ⟨7616,7648,26560,26592⟩) (.single ⟨7616,7648,26592,26624⟩)) (.node (.single ⟨7648,7680,26560,26592⟩) (.single ⟨7648,7680,26592,26624⟩)))))) (.node (.node (.node (.node (.single ⟨25088,25120,6144,6176⟩) (.node (.single ⟨25088,25120,6176,6208⟩) (.single ⟨25120,25152,6144,6176⟩))) (.node (.single ⟨25120,25152,6176,6208⟩) (.node (.single ⟨25088,25152,6208,6272⟩) (.single ⟨25152,25216,6144,6208⟩)))) (.node (.node (.single ⟨25152,25216,6208,6272⟩) (.node (.single ⟨25088,25152,6272,6336⟩) (.single ⟨25088,25152,6336,6400⟩))) (.node (.node (.single ⟨25152,25216,6272,6336⟩) (.single ⟨25152,25216,6336,6400⟩)) (.node (.single ⟨25216,25344,6144,6272⟩) (.single ⟨25216,25344,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,7424,7552⟩) (.node (.single ⟨26368,26432,7552,7616⟩) (.single ⟨26368,26432,7616,7680⟩))) (.node (.single ⟨26432,26496,7552,7616⟩) (.node (.single ⟨26432,26496,7616,7680⟩) (.single ⟨26496,26624,7424,7552⟩)))) (.node (.node (.single ⟨26496,26560,7552,7616⟩) (.node (.single ⟨26496,26560,7616,7680⟩) (.single ⟨26560,26624,7552,7616⟩))) (.node (.node (.single ⟨26560,26592,7616,7648⟩) (.single ⟨26560,26592,7648,7680⟩)) (.node (.single ⟨26592,26624,7616,7648⟩) (.single ⟨26592,26624,7648,7680⟩)))))))
def output35 : Fin 52 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 7) (.node (.single 37) (.single 44))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 4))) (.node (.node (.single 31) (.single 47)) (.node (.single 20) (.single 5))))) (.node (.node (.node (.single 30) (.node (.single 46) (.single 21))) (.node (.single 6) (.node (.single 32) (.single 45)))) (.node (.node (.single 19) (.node (.single 8) (.single 33))) (.node (.node (.single 43) (.single 18)) (.node (.single 9) (.single 35)))))) (.node (.node (.node (.node (.single 42) (.node (.single 16) (.single 10))) (.node (.single 34) (.node (.single 41) (.single 17)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 0)) (.node (.single 26) (.single 51))))) (.node (.node (.node (.single 25) (.node (.single 1) (.single 28))) (.node (.single 50) (.node (.single 23) (.single 2)))) (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.node (.single 3) (.single 29)) (.node (.single 48) (.single 22)))))))
def sourceData35 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 36) (.node (.single 40) (.single 44))) (.node (.single 48) (.node (.single 8) (.single 12)))) (.node (.node (.single 16) (.node (.single 0) (.single 20))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 27) (.node (.single 31) (.single 23)))) (.node (.node (.single 19) (.node (.single 11) (.single 15))) (.node (.node (.single 51) (.single 43)) (.node (.single 47) (.single 39)))))) (.node (.node (.node (.node (.single 37) (.node (.single 45) (.single 41))) (.node (.single 49) (.node (.single 13) (.single 9)))) (.node (.node (.single 17) (.node (.single 21) (.single 29))) (.node (.node (.single 25) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 30))) (.node (.single 26) (.node (.single 22) (.single 2)))) (.node (.node (.single 18) (.node (.single 14) (.single 10))) (.node (.node (.single 50) (.single 46)) (.node (.single 42) (.single 38)))))))
def cover35 (i : Fin 52) : Fin 52 := ⟨coverData35.get i % 52, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 52) : Fin 52 := ⟨sourceData35.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 (.cutY 25088 .empty (.cutX 6400 (.cutY 25344 (.cutX 6272 (.cutY 25216 (.cutX 6208 (.cutY 25152 (.cutX 6176 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full) (.cutY 25152 .full .full)) .full) (.cutY 25216 (.cutX 6336 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 .empty (.cutX 7424 .empty (.cutY 26368 .empty (.cutX 7552 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 7616 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 7616 (.cutY 26560 .full .full) (.cutY 26560 .full (.cutX 7648 (.cutY 26592 .full .full) (.cutY 26592 .full .full))))))))) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 (.cutX 25344 (.cutY 6400 (.cutX 25216 (.cutY 6272 (.cutX 25152 (.cutY 6208 (.cutX 25120 (.cutY 6176 .full .full) (.cutY 6176 .full .full)) .full) (.cutY 6208 .full .full)) (.cutX 25152 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty) (.cutY 7168 .empty (.cutX 26112 .empty (.cutY 7680 (.cutX 26368 .empty (.cutY 7424 .empty (.cutX 26496 (.cutY 7552 .full (.cutX 26432 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full (.cutX 26560 (.cutY 7616 .full .full) (.cutY 7616 .full (.cutX 26592 (.cutY 7648 .full .full) (.cutY 7648 .full .full)))))))) .empty))))) .empty)) .empty) .empty)) .empty))

theorem metadata35 : 0<48020332 ∧ 24<128 ∧ 98<128 ∧ 1<4 ∧
    6754/4160=1 ∧ 6754%4160=2594 ∧ ∀ i, (leaves35 i).Valid 8 := by
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 7124, atom 10508, type 2, source (20,28).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 28 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,7168,7296⟩) (.single ⟨5120,5248,7296,7424⟩)) (.node (.single ⟨5248,5376,7168,7296⟩) (.single ⟨5248,5376,7296,7424⟩))) (.node (.node (.single ⟨7168,7296,5120,5248⟩) (.single ⟨7168,7296,5248,5376⟩)) (.node (.single ⟨7296,7424,5120,5248⟩) (.single ⟨7296,7424,5248,5376⟩)))) (.node (.node (.node (.single ⟨25344,25472,27392,27520⟩) (.single ⟨25344,25472,27520,27648⟩)) (.node (.single ⟨25472,25600,27392,27520⟩) (.single ⟨25472,25600,27520,27648⟩))) (.node (.node (.single ⟨27392,27520,25344,25472⟩) (.single ⟨27392,27520,25472,25600⟩)) (.node (.single ⟨27520,27648,25344,25472⟩) (.single ⟨27520,27648,25472,25600⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 .empty (.cutX 5632 (.cutY 7680 (.cutX 5376 (.cutY 7424 (.cutX 5248 (.cutY 7296 .full .full) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)))) (.cutY 6144 (.cutX 7168 .empty (.cutY 5120 .empty (.cutX 7680 (.cutY 5632 (.cutX 7424 (.cutY 5376 (.cutX 7296 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty))) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 (.cutY 27648 (.cutX 25088 .empty (.cutY 27136 .empty (.cutX 25344 .empty (.cutY 27392 .empty (.cutX 25472 (.cutY 27520 .full .full) (.cutY 27520 .full .full)))))) .empty) .empty)) (.cutY 26624 (.cutX 27648 (.cutY 25600 (.cutX 27136 .empty (.cutY 25088 .empty (.cutX 27392 .empty (.cutY 25344 .empty (.cutX 27520 (.cutY 25472 .full .full) (.cutY 25472 .full .full)))))) .empty) .empty) .empty)) .empty) .empty)))))

theorem metadata36 : 0<76869833 ∧ 20<128 ∧ 28<128 ∧ 2<4 ∧
    10508/4160=2 ∧ 10508%4160=2188 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 7125, atom 9621, type 2, source (11,14).
def leavesData37 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,0⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))
def leaves37 : Fin 7 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 14 leaves37 i
def outputData37 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,3584,3712⟩) (.node (.single ⟨2816,2944,3712,3840⟩) (.single ⟨2944,3072,3584,3712⟩))) (.node (.node (.single ⟨2944,3008,3712,3776⟩) (.single ⟨2944,3008,3776,3840⟩)) (.node (.single ⟨3008,3072,3712,3776⟩) (.single ⟨3008,3072,3776,3840⟩)))) (.node (.node (.single ⟨3584,3712,2816,2944⟩) (.node (.single ⟨3584,3712,2944,3072⟩) (.single ⟨3712,3840,2816,2944⟩))) (.node (.node (.single ⟨3712,3776,2944,3008⟩) (.single ⟨3712,3776,3008,3072⟩)) (.node (.single ⟨3776,3840,2944,3008⟩) (.single ⟨3776,3840,3008,3072⟩))))) (.node (.node (.node (.single ⟨28928,28992,29696,29760⟩) (.node (.single ⟨28928,28992,29760,29824⟩) (.single ⟨28992,29056,29696,29760⟩))) (.node (.node (.single ⟨28992,29056,29760,29824⟩) (.single ⟨28928,29056,29824,29952⟩)) (.node (.single ⟨29056,29184,29696,29824⟩) (.single ⟨29056,29184,29824,29952⟩)))) (.node (.node (.single ⟨29696,29760,28928,28992⟩) (.node (.single ⟨29696,29760,28992,29056⟩) (.single ⟨29760,29824,28928,28992⟩))) (.node (.node (.single ⟨29760,29824,28992,29056⟩) (.single ⟨29696,29824,29056,29184⟩)) (.node (.single ⟨29824,29952,28928,29056⟩) (.single ⟨29824,29952,29056,29184⟩))))))
def output37 : Fin 28 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 9) (.single 26)))) (.node (.node (.single 18) (.node (.single 2) (.single 8))) (.node (.node (.single 25) (.single 19)) (.node (.single 3) (.single 10))))) (.node (.node (.node (.single 24) (.node (.single 17) (.single 4))) (.node (.node (.single 12) (.single 23)) (.node (.single 15) (.single 5)))) (.node (.node (.single 11) (.node (.single 22) (.single 16))) (.node (.node (.single 6) (.single 13)) (.node (.single 21) (.single 14))))))
def sourceData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.node (.single 12) (.single 16)) (.node (.single 20) (.single 24)))) (.node (.node (.single 1) (.node (.single 9) (.single 5))) (.node (.node (.single 13) (.single 21)) (.node (.single 17) (.single 25))))) (.node (.node (.node (.single 27) (.node (.single 19) (.single 23))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.single 26) (.node (.single 22) (.single 18))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2))))))
def cover37 (i : Fin 28) : Fin 28 := ⟨coverData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 28) : Fin 28 := ⟨sourceData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 (.cutX 2048 .empty (.cutY 2048 .empty (.cutX 3072 (.cutY 3072 .empty (.cutX 2560 .empty (.cutY 3584 .empty (.cutX 2816 .empty (.cutY 3840 (.cutX 2944 (.cutY 3712 .full .full) (.cutY 3712 .full (.cutX 3008 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))))) (.cutY 3072 (.cutX 3584 .empty (.cutY 2560 .empty (.cutX 3840 (.cutY 2816 .empty (.cutX 3712 (.cutY 2944 .full .full) (.cutY 2944 .full (.cutX 3776 (.cutY 3008 .full .full) (.cutY 3008 .full .full))))) .empty))) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 .empty (.cutY 28672 .empty (.cutX 30720 (.cutY 30720 (.cutX 29696 (.cutY 29696 .empty (.cutX 29184 (.cutY 30208 (.cutX 28928 .empty (.cutY 29952 (.cutX 29056 (.cutY 29824 (.cutX 28992 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full) (.cutY 29824 .full .full)) .empty)) .empty) .empty)) (.cutY 29696 (.cutX 30208 (.cutY 29184 (.cutX 29952 (.cutY 28928 .empty (.cutX 29824 (.cutY 29056 (.cutX 29760 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty)))))))

theorem metadata37 : 0<81567028 ∧ 11<128 ∧ 14<128 ∧ 2<4 ∧
    9621/4160=2 ∧ 9621%4160=1301 ∧ ∀ i, (leaves37 i).Valid 8 := by
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (81567028/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (20391757/409600000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 7126, atom 9725, type 2, source (12,13).
def leavesData38 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,0⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))
def leaves38 : Fin 7 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 13 leaves38 i
def outputData38 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,3328,3456⟩) (.node (.single ⟨3072,3200,3456,3584⟩) (.single ⟨3200,3328,3328,3456⟩))) (.node (.node (.single ⟨3200,3264,3456,3520⟩) (.single ⟨3200,3264,3520,3584⟩)) (.node (.single ⟨3264,3328,3456,3520⟩) (.single ⟨3264,3328,3520,3584⟩)))) (.node (.node (.single ⟨3328,3456,3072,3200⟩) (.node (.single ⟨3328,3456,3200,3328⟩) (.single ⟨3456,3584,3072,3200⟩))) (.node (.node (.single ⟨3456,3520,3200,3264⟩) (.single ⟨3456,3520,3264,3328⟩)) (.node (.single ⟨3520,3584,3200,3264⟩) (.single ⟨3520,3584,3264,3328⟩))))) (.node (.node (.node (.single ⟨29184,29248,29440,29504⟩) (.node (.single ⟨29184,29248,29504,29568⟩) (.single ⟨29248,29312,29440,29504⟩))) (.node (.node (.single ⟨29248,29312,29504,29568⟩) (.single ⟨29184,29312,29568,29696⟩)) (.node (.single ⟨29312,29440,29440,29568⟩) (.single ⟨29312,29440,29568,29696⟩)))) (.node (.node (.single ⟨29440,29504,29184,29248⟩) (.node (.single ⟨29440,29504,29248,29312⟩) (.single ⟨29504,29568,29184,29248⟩))) (.node (.node (.single ⟨29504,29568,29248,29312⟩) (.single ⟨29440,29568,29312,29440⟩)) (.node (.single ⟨29568,29696,29184,29312⟩) (.single ⟨29568,29696,29312,29440⟩))))))
def output38 : Fin 28 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 9) (.single 26)))) (.node (.node (.single 18) (.node (.single 2) (.single 8))) (.node (.node (.single 25) (.single 19)) (.node (.single 3) (.single 10))))) (.node (.node (.node (.single 24) (.node (.single 17) (.single 4))) (.node (.node (.single 12) (.single 23)) (.node (.single 15) (.single 5)))) (.node (.node (.single 11) (.node (.single 22) (.single 16))) (.node (.node (.single 6) (.single 13)) (.node (.single 21) (.single 14))))))
def sourceData38 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.node (.single 12) (.single 16)) (.node (.single 20) (.single 24)))) (.node (.node (.single 1) (.node (.single 9) (.single 5))) (.node (.node (.single 13) (.single 21)) (.node (.single 17) (.single 25))))) (.node (.node (.node (.single 27) (.node (.single 19) (.single 23))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.single 26) (.node (.single 22) (.single 18))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2))))))
def cover38 (i : Fin 28) : Fin 28 := ⟨coverData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 28) : Fin 28 := ⟨sourceData38.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 (.cutX 2048 .empty (.cutY 2048 .empty (.cutX 3072 .empty (.cutY 3072 .empty (.cutX 3584 (.cutY 3584 (.cutX 3328 (.cutY 3328 .empty (.cutX 3200 (.cutY 3456 .full .full) (.cutY 3456 .full (.cutX 3264 (.cutY 3520 .full .full) (.cutY 3520 .full .full))))) (.cutY 3328 (.cutX 3456 (.cutY 3200 .full .full) (.cutY 3200 .full (.cutX 3520 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 .empty (.cutY 28672 .empty (.cutX 30720 (.cutY 30720 (.cutX 29696 (.cutY 29696 (.cutX 29184 .empty (.cutY 29184 .empty (.cutX 29440 (.cutY 29440 .empty (.cutX 29312 (.cutY 29568 (.cutX 29248 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 .full .full))) (.cutY 29440 (.cutX 29568 (.cutY 29312 (.cutX 29504 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 .full .full)) .empty)))) .empty) .empty) .empty) .empty)))))))

theorem metadata38 : 0<81567028 ∧ 12<128 ∧ 13<128 ∧ 2<4 ∧
    9725/4160=2 ∧ 9725%4160=1405 ∧ ∀ i, (leaves38 i).Valid 8 := by
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (81567028/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (20391757/409600000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 7127, atom 1043, type 0, source (8,83).
def leavesData39 : FiniteInputTree DyadicLeaf 37 := (.node (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,1,2⟩) (.node (.single ⟨2,1,3⟩) (.single ⟨2,2,1⟩))))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,3⟩) (.single ⟨3,6,0⟩))) (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩)))))) (.node (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,4⟩) (.single ⟨3,6,5⟩)) (.node (.single ⟨3,7,4⟩) (.node (.single ⟨3,7,5⟩) (.single ⟨4,14,0⟩))))) (.node (.node (.node (.single ⟨4,14,1⟩) (.single ⟨4,15,1⟩)) (.node (.single ⟨4,14,2⟩) (.node (.single ⟨4,14,3⟩) (.single ⟨4,15,2⟩)))) (.node (.node (.single ⟨4,15,3⟩) (.single ⟨5,30,0⟩)) (.node (.single ⟨5,30,1⟩) (.node (.single ⟨5,31,0⟩) (.single ⟨5,31,1⟩)))))))
def leaves39 : Fin 37 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 148) : GridBox := phaseImageBoxes 32768 8 8 83 leaves39 i
def outputData39 : FiniteInputTree GridBox 148 := (.node (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,21248,21312⟩) (.single ⟨2048,2112,21312,21376⟩)) (.node (.single ⟨2112,2176,21248,21312⟩) (.single ⟨2112,2176,21312,21376⟩))) (.node (.node (.single ⟨2048,2112,21376,21440⟩) (.single ⟨2048,2112,21440,21504⟩)) (.node (.single ⟨2112,2176,21376,21440⟩) (.node (.single ⟨2112,2176,21440,21504⟩) (.single ⟨2176,2208,21248,21280⟩))))) (.node (.node (.node (.single ⟨2176,2208,21280,21312⟩) (.single ⟨2208,2240,21248,21280⟩)) (.node (.single ⟨2208,2240,21280,21312⟩) (.single ⟨2176,2240,21312,21376⟩))) (.node (.node (.single ⟨2240,2272,21248,21280⟩) (.single ⟨2240,2272,21280,21312⟩)) (.node (.single ⟨2272,2288,21248,21264⟩) (.node (.single ⟨2272,2288,21264,21280⟩) (.single ⟨2288,2296,21248,21256⟩)))))) (.node (.node (.node (.node (.single ⟨2288,2296,21256,21264⟩) (.single ⟨2296,2304,21248,21256⟩)) (.node (.single ⟨2296,2304,21256,21264⟩) (.single ⟨2288,2304,21264,21280⟩))) (.node (.node (.single ⟨2272,2288,21280,21296⟩) (.single ⟨2272,2288,21296,21312⟩)) (.node (.single ⟨2288,2304,21280,21296⟩) (.node (.single ⟨2288,2304,21296,21312⟩) (.single ⟨2240,2272,21312,21344⟩))))) (.node (.node (.node (.single ⟨2240,2272,21344,21376⟩) (.single ⟨2272,2304,21312,21344⟩)) (.node (.single ⟨2272,2304,21344,21376⟩) (.node (.single ⟨2176,2240,21376,21440⟩) (.single ⟨2176,2240,21440,21504⟩)))) (.node (.node (.single ⟨2240,2272,21376,21408⟩) (.single ⟨2240,2272,21408,21440⟩)) (.node (.single ⟨2272,2304,21376,21408⟩) (.node (.single ⟨2272,2304,21408,21440⟩) (.single ⟨2240,2304,21440,21504⟩))))))) (.node (.node (.node (.node (.node (.single ⟨11264,11328,30464,30528⟩) (.single ⟨11264,11328,30528,30592⟩)) (.node (.single ⟨11328,11360,30464,30496⟩) (.single ⟨11328,11360,30496,30528⟩))) (.node (.node (.single ⟨11360,11392,30464,30496⟩) (.single ⟨11360,11392,30496,30528⟩)) (.node (.single ⟨11328,11392,30528,30592⟩) (.node (.single ⟨11264,11328,30592,30656⟩) (.single ⟨11264,11328,30656,30720⟩))))) (.node (.node (.node (.single ⟨11328,11392,30592,30656⟩) (.single ⟨11328,11392,30656,30720⟩)) (.node (.single ⟨11392,11424,30464,30496⟩) (.single ⟨11392,11424,30496,30528⟩))) (.node (.node (.single ⟨11424,11456,30464,30496⟩) (.single ⟨11424,11456,30496,30528⟩)) (.node (.single ⟨11392,11456,30528,30592⟩) (.node (.single ⟨11456,11472,30464,30480⟩) (.single ⟨11456,11472,30480,30496⟩)))))) (.node (.node (.node (.node (.single ⟨11472,11488,30464,30480⟩) (.single ⟨11472,11488,30480,30496⟩)) (.node (.single ⟨11456,11488,30496,30528⟩) (.single ⟨11488,11504,30464,30480⟩))) (.node (.node (.single ⟨11488,11504,30480,30496⟩) (.single ⟨11504,11512,30464,30472⟩)) (.node (.single ⟨11504,11512,30472,30480⟩) (.node (.single ⟨11512,11520,30464,30472⟩) (.single ⟨11512,11520,30472,30480⟩))))) (.node (.node (.node (.single ⟨11504,11520,30480,30496⟩) (.single ⟨11488,11520,30496,30528⟩)) (.node (.single ⟨11456,11488,30528,30560⟩) (.node (.single ⟨11456,11488,30560,30592⟩) (.single ⟨11488,11520,30528,30560⟩)))) (.node (.node (.single ⟨11488,11520,30560,30592⟩) (.single ⟨11392,11456,30592,30656⟩)) (.node (.single ⟨11392,11456,30656,30720⟩) (.node (.single ⟨11456,11520,30592,30656⟩) (.single ⟨11456,11520,30656,30720⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨21248,21312,2048,2112⟩) (.single ⟨21248,21312,2112,2176⟩)) (.node (.single ⟨21312,21376,2048,2112⟩) (.single ⟨21312,21376,2112,2176⟩))) (.node (.node (.single ⟨21248,21280,2176,2208⟩) (.single ⟨21248,21280,2208,2240⟩)) (.node (.single ⟨21280,21312,2176,2208⟩) (.node (.single ⟨21280,21312,2208,2240⟩) (.single ⟨21248,21280,2240,2272⟩))))) (.node (.node (.node (.single ⟨21248,21264,2272,2288⟩) (.single ⟨21248,21256,2288,2296⟩)) (.node (.single ⟨21248,21256,2296,2304⟩) (.single ⟨21256,21264,2288,2296⟩))) (.node (.node (.single ⟨21256,21264,2296,2304⟩) (.single ⟨21264,21280,2272,2288⟩)) (.node (.single ⟨21264,21280,2288,2304⟩) (.node (.single ⟨21280,21312,2240,2272⟩) (.single ⟨21280,21296,2272,2288⟩)))))) (.node (.node (.node (.node (.single ⟨21280,21296,2288,2304⟩) (.single ⟨21296,21312,2272,2288⟩)) (.node (.single ⟨21296,21312,2288,2304⟩) (.single ⟨21312,21376,2176,2240⟩))) (.node (.node (.single ⟨21312,21344,2240,2272⟩) (.single ⟨21312,21344,2272,2304⟩)) (.node (.single ⟨21344,21376,2240,2272⟩) (.node (.single ⟨21344,21376,2272,2304⟩) (.single ⟨21376,21440,2048,2112⟩))))) (.node (.node (.node (.single ⟨21376,21440,2112,2176⟩) (.single ⟨21440,21504,2048,2112⟩)) (.node (.single ⟨21440,21504,2112,2176⟩) (.node (.single ⟨21376,21440,2176,2240⟩) (.single ⟨21376,21408,2240,2272⟩)))) (.node (.node (.single ⟨21376,21408,2272,2304⟩) (.single ⟨21408,21440,2240,2272⟩)) (.node (.single ⟨21408,21440,2272,2304⟩) (.node (.single ⟨21440,21504,2176,2240⟩) (.single ⟨21440,21504,2240,2304⟩))))))) (.node (.node (.node (.node (.node (.single ⟨30464,30528,11264,11328⟩) (.single ⟨30464,30496,11328,11360⟩)) (.node (.single ⟨30464,30496,11360,11392⟩) (.single ⟨30496,30528,11328,11360⟩))) (.node (.node (.single ⟨30496,30528,11360,11392⟩) (.single ⟨30528,30592,11264,11328⟩)) (.node (.single ⟨30528,30592,11328,11392⟩) (.node (.single ⟨30464,30496,11392,11424⟩) (.single ⟨30464,30496,11424,11456⟩))))) (.node (.node (.node (.single ⟨30496,30528,11392,11424⟩) (.single ⟨30496,30528,11424,11456⟩)) (.node (.single ⟨30464,30480,11456,11472⟩) (.single ⟨30464,30480,11472,11488⟩))) (.node (.node (.single ⟨30480,30496,11456,11472⟩) (.single ⟨30480,30496,11472,11488⟩)) (.node (.single ⟨30464,30480,11488,11504⟩) (.node (.single ⟨30464,30472,11504,11512⟩) (.single ⟨30464,30472,11512,11520⟩)))))) (.node (.node (.node (.node (.single ⟨30472,30480,11504,11512⟩) (.single ⟨30472,30480,11512,11520⟩)) (.node (.single ⟨30480,30496,11488,11504⟩) (.single ⟨30480,30496,11504,11520⟩))) (.node (.node (.single ⟨30496,30528,11456,11488⟩) (.single ⟨30496,30528,11488,11520⟩)) (.node (.single ⟨30528,30592,11392,11456⟩) (.node (.single ⟨30528,30560,11456,11488⟩) (.single ⟨30528,30560,11488,11520⟩))))) (.node (.node (.node (.single ⟨30560,30592,11456,11488⟩) (.single ⟨30560,30592,11488,11520⟩)) (.node (.single ⟨30592,30656,11264,11328⟩) (.node (.single ⟨30592,30656,11328,11392⟩) (.single ⟨30656,30720,11264,11328⟩)))) (.node (.node (.single ⟨30656,30720,11328,11392⟩) (.single ⟨30592,30656,11392,11456⟩)) (.node (.single ⟨30592,30656,11456,11520⟩) (.node (.single ⟨30656,30720,11392,11456⟩) (.single ⟨30656,30720,11456,11520⟩)))))))))
def output39 : Fin 148 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 148 := (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 74)) (.node (.single 147) (.single 73))) (.node (.node (.single 1) (.single 76)) (.node (.single 146) (.node (.single 71) (.single 4))))) (.node (.node (.node (.single 100) (.single 143)) (.node (.single 47) (.single 5))) (.node (.node (.single 102) (.single 142)) (.node (.single 45) (.node (.single 2) (.single 75)))))) (.node (.node (.node (.node (.single 145) (.single 72)) (.node (.single 3) (.single 77))) (.node (.node (.single 144) (.single 70)) (.node (.single 6) (.node (.single 101) (.single 141))))) (.node (.node (.node (.single 46) (.single 7)) (.node (.single 103) (.node (.single 140) (.single 44)))) (.node (.node (.single 12) (.single 95)) (.node (.single 135) (.node (.single 52) (.single 30))))))) (.node (.node (.node (.node (.node (.single 104) (.single 117)) (.node (.single 43) (.single 31))) (.node (.node (.single 109) (.single 116)) (.node (.single 38) (.node (.single 36) (.single 110))))) (.node (.node (.node (.single 111) (.single 37)) (.node (.single 13) (.single 82))) (.node (.node (.single 134) (.single 65)) (.node (.single 14) (.node (.single 90) (.single 133)))))) (.node (.node (.node (.node (.single 57) (.single 26)) (.node (.single 96) (.single 121))) (.node (.node (.single 51) (.single 27)) (.node (.single 98) (.node (.single 120) (.single 49))))) (.node (.node (.node (.single 28) (.single 97)) (.node (.single 119) (.node (.single 50) (.single 29)))) (.node (.node (.single 99) (.single 118)) (.node (.single 48) (.node (.single 8) (.single 78)))))))) (.node (.node (.node (.node (.node (.node (.single 139) (.single 69)) (.node (.single 9) (.single 80))) (.node (.node (.single 138) (.single 67)) (.node (.single 10) (.node (.single 79) (.single 137))))) (.node (.node (.node (.single 68) (.single 11)) (.node (.single 81) (.single 136))) (.node (.node (.single 66) (.single 32)) (.node (.single 105) (.node (.single 115) (.single 42)))))) (.node (.node (.node (.node (.single 33) (.single 107)) (.node (.single 114) (.single 40))) (.node (.node (.single 34) (.single 106)) (.node (.single 113) (.node (.single 41) (.single 35))))) (.node (.node (.node (.single 108) (.single 112)) (.node (.single 39) (.node (.single 15) (.single 83)))) (.node (.node (.single 132) (.single 64)) (.node (.single 16) (.node (.single 88) (.single 131))))))) (.node (.node (.node (.node (.node (.single 59) (.single 21)) (.node (.single 89) (.single 126))) (.node (.node (.single 58) (.single 22)) (.node (.single 91) (.node (.single 125) (.single 56))))) (.node (.node (.node (.single 23) (.single 93)) (.node (.single 124) (.single 54))) (.node (.node (.single 24) (.single 92)) (.node (.single 123) (.node (.single 55) (.single 25)))))) (.node (.node (.node (.node (.single 94) (.single 122)) (.node (.single 53) (.single 17))) (.node (.node (.single 84) (.single 130)) (.node (.single 63) (.node (.single 18) (.single 86))))) (.node (.node (.node (.single 129) (.single 61)) (.node (.single 19) (.node (.single 85) (.single 128)))) (.node (.node (.single 62) (.single 20)) (.node (.single 87) (.node (.single 127) (.single 60)))))))))
def sourceData39 : FiniteInputTree ℕ 148 := (.node (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 16) (.single 20))) (.node (.node (.single 8) (.single 12)) (.node (.single 24) (.node (.single 28) (.single 72))))) (.node (.node (.node (.single 76) (.single 80)) (.node (.single 84) (.single 32))) (.node (.node (.single 48) (.single 52)) (.node (.single 104) (.node (.single 108) (.single 132)))))) (.node (.node (.node (.node (.single 136) (.single 140)) (.node (.single 144) (.single 112))) (.node (.node (.single 116) (.single 120)) (.node (.single 124) (.node (.single 128) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 36) (.single 40)))) (.node (.node (.single 88) (.single 92)) (.node (.single 96) (.node (.single 100) (.single 44))))))) (.node (.node (.node (.node (.node (.single 47) (.single 43)) (.node (.single 103) (.single 95))) (.node (.node (.single 99) (.single 91)) (.node (.single 39) (.node (.single 31) (.single 15))))) (.node (.node (.node (.single 27) (.single 11)) (.node (.single 71) (.single 63))) (.node (.node (.single 67) (.single 59)) (.node (.single 35) (.node (.single 131) (.single 123)))))) (.node (.node (.node (.node (.single 127) (.single 119)) (.node (.single 55) (.single 115))) (.node (.node (.single 111) (.single 147)) (.node (.single 139) (.node (.single 143) (.single 135))))) (.node (.node (.node (.single 107) (.single 51)) (.node (.single 87) (.node (.single 79) (.single 83)))) (.node (.node (.single 75) (.single 23)) (.node (.single 7) (.node (.single 19) (.single 3)))))))) (.node (.node (.node (.node (.node (.node (.single 1) (.single 17)) (.node (.single 5) (.single 21))) (.node (.node (.single 73) (.single 81)) (.node (.single 77) (.node (.single 85) (.single 49))))) (.node (.node (.node (.single 105) (.single 133)) (.node (.single 141) (.single 137))) (.node (.node (.single 145) (.single 109)) (.node (.single 113) (.node (.single 53) (.single 117)))))) (.node (.node (.node (.node (.single 125) (.single 121)) (.node (.single 129) (.single 33))) (.node (.node (.single 57) (.single 65)) (.node (.single 61) (.node (.single 69) (.single 9))))) (.node (.node (.node (.single 25) (.single 13)) (.node (.single 29) (.node (.single 37) (.single 89)))) (.node (.node (.single 97) (.single 93)) (.node (.single 101) (.node (.single 41) (.single 45))))))) (.node (.node (.node (.node (.node (.single 46) (.single 102)) (.node (.single 98) (.single 94))) (.node (.node (.single 90) (.single 42)) (.node (.single 38) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.single 58)) (.node (.single 130) (.single 126))) (.node (.node (.single 122) (.single 118)) (.node (.single 114) (.node (.single 146) (.single 142)))))) (.node (.node (.node (.node (.single 138) (.single 134)) (.node (.single 110) (.single 106))) (.node (.node (.single 54) (.single 50)) (.node (.single 34) (.node (.single 86) (.single 82))))) (.node (.node (.node (.single 78) (.single 74)) (.node (.single 30) (.node (.single 26) (.single 14)))) (.node (.node (.single 10) (.single 22)) (.node (.single 18) (.node (.single 6) (.single 2)))))))))
def cover39 (i : Fin 148) : Fin 148 := ⟨coverData39.get i % 148, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 148) : Fin 148 := ⟨sourceData39.get i % 148, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 .empty (.cutX 2304 (.cutY 21248 .empty (.cutX 2176 (.cutY 21376 (.cutX 2112 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) (.cutX 2112 (.cutY 21440 .full .full) (.cutY 21440 .full .full))) (.cutY 21376 (.cutX 2240 (.cutY 21312 (.cutX 2208 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full) (.cutY 21312 (.cutX 2272 (.cutY 21280 .full .full) (.cutY 21280 (.cutX 2288 (.cutY 21264 .full .full) (.cutY 21264 (.cutX 2296 (.cutY 21256 .full .full) (.cutY 21256 .full .full)) .full)) (.cutX 2288 (.cutY 21296 .full .full) (.cutY 21296 .full .full)))) (.cutX 2272 (.cutY 21344 .full .full) (.cutY 21344 .full .full)))) (.cutX 2240 (.cutY 21440 .full .full) (.cutY 21440 (.cutX 2272 (.cutY 21408 .full .full) (.cutY 21408 .full .full)) .full))))) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 .empty (.cutX 11520 (.cutY 30464 .empty (.cutX 11392 (.cutY 30592 (.cutX 11328 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 11360 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 11328 (.cutY 30656 .full .full) (.cutY 30656 .full .full))) (.cutY 30592 (.cutX 11456 (.cutY 30528 (.cutX 11424 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full) (.cutY 30528 (.cutX 11488 (.cutY 30496 (.cutX 11472 (.cutY 30480 .full .full) (.cutY 30480 .full .full)) .full) (.cutY 30496 (.cutX 11504 (.cutY 30480 .full .full) (.cutY 30480 (.cutX 11512 (.cutY 30472 .full .full) (.cutY 30472 .full .full)) .full)) .full)) (.cutX 11488 (.cutY 30560 .full .full) (.cutY 30560 .full .full)))) (.cutX 11456 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 (.cutX 21248 .empty (.cutY 2304 (.cutX 21376 (.cutY 2176 (.cutX 21312 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 21312 (.cutY 2240 (.cutX 21280 (.cutY 2208 .full .full) (.cutY 2208 .full .full)) (.cutX 21280 (.cutY 2272 .full (.cutX 21264 (.cutY 2288 .full (.cutX 21256 (.cutY 2296 .full .full) (.cutY 2296 .full .full))) (.cutY 2288 .full .full))) (.cutY 2272 .full (.cutX 21296 (.cutY 2288 .full .full) (.cutY 2288 .full .full))))) (.cutY 2240 .full (.cutX 21344 (.cutY 2272 .full .full) (.cutY 2272 .full .full))))) (.cutY 2176 (.cutX 21440 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 21440 (.cutY 2240 .full (.cutX 21408 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 (.cutX 30464 .empty (.cutY 11520 (.cutX 30592 (.cutY 11392 (.cutX 30528 (.cutY 11328 .full (.cutX 30496 (.cutY 11360 .full .full) (.cutY 11360 .full .full))) (.cutY 11328 .full .full)) (.cutX 30528 (.cutY 11456 (.cutX 30496 (.cutY 11424 .full .full) (.cutY 11424 .full .full)) (.cutX 30496 (.cutY 11488 (.cutX 30480 (.cutY 11472 .full .full) (.cutY 11472 .full .full)) (.cutX 30480 (.cutY 11504 .full (.cutX 30472 (.cutY 11512 .full .full) (.cutY 11512 .full .full))) (.cutY 11504 .full .full))) (.cutY 11488 .full .full))) (.cutY 11456 .full (.cutX 30560 (.cutY 11488 .full .full) (.cutY 11488 .full .full))))) (.cutY 11392 (.cutX 30656 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 30656 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty))))) .empty) .empty)))) .empty))

theorem metadata39 : 0<72090291 ∧ 8<128 ∧ 83<128 ∧ 0<4 ∧
    1043/4160=0 ∧ 1043%4160=1043 ∧ ∀ i, (leaves39 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData39).mp
    (by decide +kernel)

theorem sourceChecked39_0 : ∀ i : Fin 64,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 148 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked39_64 : ∀ i : Fin 64,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 148 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked39_128 : ∀ i : Fin 20,
    (fun i => output39 i = raw39 (source39 i)) (finOffset 148 128 20 (by decide) i) := by decide +kernel

theorem sourceChecked39 : ∀ i : Fin 148, (fun i => output39 i = raw39 (source39 i)) i :=
  forallFin_of_zero_offset (fun i => output39 i = raw39 (source39 i)) (forallFinOffset_add (fun i => output39 i = raw39 (source39 i)) 0 64 84 (by decide) sourceChecked39_0
    (forallFinOffset_add (fun i => output39 i = raw39 (source39 i)) 64 64 20 (by decide) sourceChecked39_64
    sourceChecked39_128))

theorem coverChecked39_0 : ∀ i : Fin 64,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 148 0 64 (by decide) i) := by decide +kernel

theorem coverChecked39_64 : ∀ i : Fin 64,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 148 64 64 (by decide) i) := by decide +kernel

theorem coverChecked39_128 : ∀ i : Fin 20,
    (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (finOffset 148 128 20 (by decide) i) := by decide +kernel

theorem coverChecked39 : ∀ i : Fin 148, (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) i :=
  forallFin_of_zero_offset (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) (forallFinOffset_add (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) 0 64 84 (by decide) coverChecked39_0
    (forallFinOffset_add (fun i => (output39 (cover39 i)).ContainsBox (raw39 i)) 64 64 20 (by decide) coverChecked39_64
    coverChecked39_128))

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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 7128, atom 4854, type 1, source (5,79).
def leavesData40 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves40 : Fin 13 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 79 leaves40 i
def outputData40 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,20224,20288⟩) (.node (.single ⟨1280,1344,20288,20352⟩) (.single ⟨1344,1408,20224,20288⟩))) (.node (.single ⟨1344,1408,20288,20352⟩) (.node (.single ⟨1280,1408,20352,20480⟩) (.single ⟨1408,1472,20224,20288⟩)))) (.node (.node (.single ⟨1408,1472,20288,20352⟩) (.node (.single ⟨1472,1536,20224,20288⟩) (.single ⟨1472,1536,20288,20352⟩))) (.node (.node (.single ⟨1408,1472,20352,20416⟩) (.single ⟨1408,1472,20416,20480⟩)) (.node (.single ⟨1472,1536,20352,20416⟩) (.single ⟨1472,1536,20416,20480⟩))))) (.node (.node (.node (.single ⟨12288,12352,31232,31296⟩) (.node (.single ⟨12288,12352,31296,31360⟩) (.single ⟨12352,12416,31232,31296⟩))) (.node (.single ⟨12352,12416,31296,31360⟩) (.node (.single ⟨12288,12416,31360,31488⟩) (.single ⟨12416,12480,31232,31296⟩)))) (.node (.node (.single ⟨12416,12480,31296,31360⟩) (.node (.single ⟨12480,12544,31232,31296⟩) (.single ⟨12480,12544,31296,31360⟩))) (.node (.node (.single ⟨12416,12480,31360,31424⟩) (.single ⟨12416,12480,31424,31488⟩)) (.node (.single ⟨12480,12544,31360,31424⟩) (.single ⟨12480,12544,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,1280,1344⟩) (.node (.single ⟨20224,20288,1344,1408⟩) (.single ⟨20288,20352,1280,1344⟩))) (.node (.single ⟨20288,20352,1344,1408⟩) (.node (.single ⟨20224,20288,1408,1472⟩) (.single ⟨20224,20288,1472,1536⟩)))) (.node (.node (.single ⟨20288,20352,1408,1472⟩) (.node (.single ⟨20288,20352,1472,1536⟩) (.single ⟨20352,20480,1280,1408⟩))) (.node (.node (.single ⟨20352,20416,1408,1472⟩) (.single ⟨20352,20416,1472,1536⟩)) (.node (.single ⟨20416,20480,1408,1472⟩) (.single ⟨20416,20480,1472,1536⟩))))) (.node (.node (.node (.single ⟨31232,31296,12288,12352⟩) (.node (.single ⟨31232,31296,12352,12416⟩) (.single ⟨31296,31360,12288,12352⟩))) (.node (.single ⟨31296,31360,12352,12416⟩) (.node (.single ⟨31232,31296,12416,12480⟩) (.single ⟨31232,31296,12480,12544⟩)))) (.node (.node (.single ⟨31296,31360,12416,12480⟩) (.node (.single ⟨31296,31360,12480,12544⟩) (.single ⟨31360,31488,12288,12416⟩))) (.node (.node (.single ⟨31360,31424,12416,12480⟩) (.single ⟨31360,31424,12480,12544⟩)) (.node (.single ⟨31424,31488,12416,12480⟩) (.single ⟨31424,31488,12480,12544⟩)))))))
def output40 : Fin 52 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData40 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover40 (i : Fin 52) : Fin 52 := ⟨coverData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 52) : Fin 52 := ⟨sourceData40.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 .empty (.cutX 1280 .empty (.cutY 20224 .empty (.cutX 1408 (.cutY 20352 (.cutX 1344 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 1472 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) (.cutX 1472 (.cutY 20416 .full .full) (.cutY 20416 .full .full))))))) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 .empty (.cutX 12544 (.cutY 31488 (.cutX 12416 (.cutY 31360 (.cutX 12352 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full) (.cutY 31360 (.cutX 12480 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 12480 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 (.cutX 20224 .empty (.cutY 1280 .empty (.cutX 20352 (.cutY 1408 (.cutX 20288 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 20288 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full (.cutX 20416 (.cutY 1472 .full .full) (.cutY 1472 .full .full)))))) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 (.cutX 31488 (.cutY 12544 (.cutX 31360 (.cutY 12416 (.cutX 31296 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) (.cutX 31296 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 31424 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty)))))) .empty))

theorem metadata40 : 0<137362203 ∧ 5<128 ∧ 79<128 ∧ 1<4 ∧
    4854/4160=1 ∧ 4854%4160=694 ∧ ∀ i, (leaves40 i).Valid 8 := by
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 7129, atom 5201, type 1, source (8,81).
def leavesData41 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves41 : Fin 16 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 8 81 leaves41 i
def outputData41 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,20736,20800⟩) (.single ⟨2048,2112,20800,20864⟩)) (.node (.single ⟨2112,2176,20736,20800⟩) (.single ⟨2112,2176,20800,20864⟩))) (.node (.node (.single ⟨2048,2176,20864,20992⟩) (.single ⟨2176,2240,20736,20800⟩)) (.node (.single ⟨2176,2240,20800,20864⟩) (.single ⟨2240,2272,20736,20768⟩)))) (.node (.node (.node (.single ⟨2240,2272,20768,20800⟩) (.single ⟨2272,2304,20736,20768⟩)) (.node (.single ⟨2272,2304,20768,20800⟩) (.single ⟨2240,2304,20800,20864⟩))) (.node (.node (.single ⟨2176,2240,20864,20928⟩) (.single ⟨2176,2240,20928,20992⟩)) (.node (.single ⟨2240,2304,20864,20928⟩) (.single ⟨2240,2304,20928,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11840,30464,30528⟩) (.single ⟨11776,11840,30528,30592⟩)) (.node (.single ⟨11840,11904,30464,30528⟩) (.single ⟨11840,11904,30528,30592⟩))) (.node (.node (.single ⟨11776,11904,30592,30720⟩) (.single ⟨11904,11968,30464,30528⟩)) (.node (.single ⟨11904,11968,30528,30592⟩) (.single ⟨11968,12000,30464,30496⟩)))) (.node (.node (.node (.single ⟨11968,12000,30496,30528⟩) (.single ⟨12000,12032,30464,30496⟩)) (.node (.single ⟨12000,12032,30496,30528⟩) (.single ⟨11968,12032,30528,30592⟩))) (.node (.node (.single ⟨11904,11968,30592,30656⟩) (.single ⟨11904,11968,30656,30720⟩)) (.node (.single ⟨11968,12032,30592,30656⟩) (.single ⟨11968,12032,30656,30720⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,2048,2112⟩) (.single ⟨20736,20800,2112,2176⟩)) (.node (.single ⟨20800,20864,2048,2112⟩) (.single ⟨20800,20864,2112,2176⟩))) (.node (.node (.single ⟨20736,20800,2176,2240⟩) (.single ⟨20736,20768,2240,2272⟩)) (.node (.single ⟨20736,20768,2272,2304⟩) (.single ⟨20768,20800,2240,2272⟩)))) (.node (.node (.node (.single ⟨20768,20800,2272,2304⟩) (.single ⟨20800,20864,2176,2240⟩)) (.node (.single ⟨20800,20864,2240,2304⟩) (.single ⟨20864,20992,2048,2176⟩))) (.node (.node (.single ⟨20864,20928,2176,2240⟩) (.single ⟨20864,20928,2240,2304⟩)) (.node (.single ⟨20928,20992,2176,2240⟩) (.single ⟨20928,20992,2240,2304⟩))))) (.node (.node (.node (.node (.single ⟨30464,30528,11776,11840⟩) (.single ⟨30464,30528,11840,11904⟩)) (.node (.single ⟨30528,30592,11776,11840⟩) (.single ⟨30528,30592,11840,11904⟩))) (.node (.node (.single ⟨30464,30528,11904,11968⟩) (.single ⟨30464,30496,11968,12000⟩)) (.node (.single ⟨30464,30496,12000,12032⟩) (.single ⟨30496,30528,11968,12000⟩)))) (.node (.node (.node (.single ⟨30496,30528,12000,12032⟩) (.single ⟨30528,30592,11904,11968⟩)) (.node (.single ⟨30528,30592,11968,12032⟩) (.single ⟨30592,30720,11776,11904⟩))) (.node (.node (.single ⟨30592,30656,11904,11968⟩) (.single ⟨30592,30656,11968,12032⟩)) (.node (.single ⟨30656,30720,11904,11968⟩) (.single ⟨30656,30720,11968,12032⟩)))))))
def output41 : Fin 64 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData41 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover41 (i : Fin 64) : Fin 64 := ⟨coverData41.get i % 64, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 64) : Fin 64 := ⟨sourceData41.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 (.cutX 2304 (.cutY 20736 .empty (.cutX 2176 (.cutY 20864 (.cutX 2112 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 2240 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 2272 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) (.cutX 2240 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 .empty (.cutY 30208 .empty (.cutX 12032 (.cutY 30464 .empty (.cutX 11904 (.cutY 30592 (.cutX 11840 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full) (.cutY 30592 (.cutX 11968 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 12000 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 11968 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty))))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 (.cutY 2560 (.cutX 20736 .empty (.cutY 2304 (.cutX 20864 (.cutY 2176 (.cutX 20800 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 20800 (.cutY 2240 .full (.cutX 20768 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full (.cutX 20928 (.cutY 2240 .full .full) (.cutY 2240 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 .empty (.cutX 30464 .empty (.cutY 12032 (.cutX 30592 (.cutY 11904 (.cutX 30528 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 30528 (.cutY 11968 .full (.cutX 30496 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 30656 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))))))) .empty) .empty)))) .empty))

theorem metadata41 : 0<139307719 ∧ 8<128 ∧ 81<128 ∧ 1<4 ∧
    5201/4160=1 ∧ 5201%4160=1041 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 64,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 64, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 64,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 64, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 7130, atom 4972, type 1, source (6,80).
def leavesData42 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves42 : Fin 7 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 80 leaves42 i
def outputData42 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,20480,20608⟩) (.node (.single ⟨1536,1664,20608,20736⟩) (.single ⟨1664,1728,20480,20544⟩))) (.node (.node (.single ⟨1664,1728,20544,20608⟩) (.single ⟨1728,1792,20480,20544⟩)) (.node (.single ⟨1728,1792,20544,20608⟩) (.single ⟨1664,1792,20608,20736⟩)))) (.node (.node (.single ⟨12032,12160,30976,31104⟩) (.node (.single ⟨12032,12160,31104,31232⟩) (.single ⟨12160,12224,30976,31040⟩))) (.node (.node (.single ⟨12160,12224,31040,31104⟩) (.single ⟨12224,12288,30976,31040⟩)) (.node (.single ⟨12224,12288,31040,31104⟩) (.single ⟨12160,12288,31104,31232⟩))))) (.node (.node (.node (.single ⟨20480,20608,1536,1664⟩) (.node (.single ⟨20480,20544,1664,1728⟩) (.single ⟨20480,20544,1728,1792⟩))) (.node (.node (.single ⟨20544,20608,1664,1728⟩) (.single ⟨20544,20608,1728,1792⟩)) (.node (.single ⟨20608,20736,1536,1664⟩) (.single ⟨20608,20736,1664,1792⟩)))) (.node (.node (.single ⟨30976,31104,12032,12160⟩) (.node (.single ⟨30976,31040,12160,12224⟩) (.single ⟨30976,31040,12224,12288⟩))) (.node (.node (.single ⟨31040,31104,12160,12224⟩) (.single ⟨31040,31104,12224,12288⟩)) (.node (.single ⟨31104,31232,12032,12160⟩) (.single ⟨31104,31232,12160,12288⟩))))))
def output42 : Fin 28 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover42 (i : Fin 28) : Fin 28 := ⟨coverData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 28) : Fin 28 := ⟨sourceData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 .empty (.cutY 20992 (.cutX 1792 (.cutY 20736 (.cutX 1664 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 1728 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 (.cutX 12032 .empty (.cutY 30976 .empty (.cutX 12160 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 12224 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full)))) .empty)) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 .empty (.cutX 20736 (.cutY 1792 (.cutX 20608 (.cutY 1664 .full (.cutX 20544 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 (.cutY 11776 .empty (.cutX 30976 .empty (.cutY 12032 .empty (.cutX 31104 (.cutY 12160 .full (.cutX 31040 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))) .empty)) .empty))) .empty)))) .empty))

theorem metadata42 : 0<117939641 ∧ 6<128 ∧ 80<128 ∧ 1<4 ∧
    4972/4160=1 ∧ 4972%4160=812 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (117939641/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (117939641/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 7131, atom 1483, type 0, source (12,91).
def leavesData43 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves43 : Fin 16 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 12 91 leaves43 i
def outputData43 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3072,3136,23296,23360⟩) (.single ⟨3072,3136,23360,23424⟩)) (.node (.single ⟨3136,3200,23296,23360⟩) (.single ⟨3136,3200,23360,23424⟩))) (.node (.node (.single ⟨3072,3200,23424,23552⟩) (.single ⟨3200,3264,23296,23360⟩)) (.node (.single ⟨3200,3264,23360,23424⟩) (.single ⟨3264,3296,23296,23328⟩)))) (.node (.node (.node (.single ⟨3264,3296,23328,23360⟩) (.single ⟨3296,3328,23296,23328⟩)) (.node (.single ⟨3296,3328,23328,23360⟩) (.single ⟨3264,3328,23360,23424⟩))) (.node (.node (.single ⟨3200,3264,23424,23488⟩) (.single ⟨3200,3264,23488,23552⟩)) (.node (.single ⟨3264,3328,23424,23488⟩) (.single ⟨3264,3328,23488,23552⟩))))) (.node (.node (.node (.node (.single ⟨9216,9280,29440,29504⟩) (.single ⟨9216,9280,29504,29568⟩)) (.node (.single ⟨9280,9344,29440,29504⟩) (.single ⟨9280,9344,29504,29568⟩))) (.node (.node (.single ⟨9216,9344,29568,29696⟩) (.single ⟨9344,9408,29440,29504⟩)) (.node (.single ⟨9344,9408,29504,29568⟩) (.single ⟨9408,9440,29440,29472⟩)))) (.node (.node (.node (.single ⟨9408,9440,29472,29504⟩) (.single ⟨9440,9472,29440,29472⟩)) (.node (.single ⟨9440,9472,29472,29504⟩) (.single ⟨9408,9472,29504,29568⟩))) (.node (.node (.single ⟨9344,9408,29568,29632⟩) (.single ⟨9344,9408,29632,29696⟩)) (.node (.single ⟨9408,9472,29568,29632⟩) (.single ⟨9408,9472,29632,29696⟩)))))) (.node (.node (.node (.node (.node (.single ⟨23296,23360,3072,3136⟩) (.single ⟨23296,23360,3136,3200⟩)) (.node (.single ⟨23360,23424,3072,3136⟩) (.single ⟨23360,23424,3136,3200⟩))) (.node (.node (.single ⟨23296,23360,3200,3264⟩) (.single ⟨23296,23328,3264,3296⟩)) (.node (.single ⟨23296,23328,3296,3328⟩) (.single ⟨23328,23360,3264,3296⟩)))) (.node (.node (.node (.single ⟨23328,23360,3296,3328⟩) (.single ⟨23360,23424,3200,3264⟩)) (.node (.single ⟨23360,23424,3264,3328⟩) (.single ⟨23424,23552,3072,3200⟩))) (.node (.node (.single ⟨23424,23488,3200,3264⟩) (.single ⟨23424,23488,3264,3328⟩)) (.node (.single ⟨23488,23552,3200,3264⟩) (.single ⟨23488,23552,3264,3328⟩))))) (.node (.node (.node (.node (.single ⟨29440,29504,9216,9280⟩) (.single ⟨29440,29504,9280,9344⟩)) (.node (.single ⟨29504,29568,9216,9280⟩) (.single ⟨29504,29568,9280,9344⟩))) (.node (.node (.single ⟨29440,29504,9344,9408⟩) (.single ⟨29440,29472,9408,9440⟩)) (.node (.single ⟨29440,29472,9440,9472⟩) (.single ⟨29472,29504,9408,9440⟩)))) (.node (.node (.node (.single ⟨29472,29504,9440,9472⟩) (.single ⟨29504,29568,9344,9408⟩)) (.node (.single ⟨29504,29568,9408,9472⟩) (.single ⟨29568,29696,9216,9344⟩))) (.node (.node (.single ⟨29568,29632,9344,9408⟩) (.single ⟨29568,29632,9408,9472⟩)) (.node (.single ⟨29632,29696,9344,9408⟩) (.single ⟨29632,29696,9408,9472⟩)))))))
def output43 : Fin 64 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData43 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover43 (i : Fin 64) : Fin 64 := ⟨coverData43.get i % 64, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 64) : Fin 64 := ⟨sourceData43.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 .empty (.cutX 3328 (.cutY 23296 .empty (.cutX 3200 (.cutY 23424 (.cutX 3136 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 3264 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 3296 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 3264 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty)) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 .empty (.cutX 9472 (.cutY 29440 .empty (.cutX 9344 (.cutY 29568 (.cutX 9280 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 9408 (.cutY 29504 .full .full) (.cutY 29504 (.cutX 9440 (.cutY 29472 .full .full) (.cutY 29472 .full .full)) .full)) (.cutX 9408 (.cutY 29632 .full .full) (.cutY 29632 .full .full))))) .empty)) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 (.cutX 23296 .empty (.cutY 3328 (.cutX 23424 (.cutY 3200 (.cutX 23360 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 23360 (.cutY 3264 .full (.cutX 23328 (.cutY 3296 .full .full) (.cutY 3296 .full .full))) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 23488 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 (.cutX 29440 .empty (.cutY 9472 (.cutX 29568 (.cutY 9344 (.cutX 29504 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 29504 (.cutY 9408 .full (.cutX 29472 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 29632 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty)) .empty))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata43 : 0<77641223 ∧ 12<128 ∧ 91<128 ∧ 0<4 ∧
    1483/4160=0 ∧ 1483%4160=1483 ∧ ∀ i, (leaves43 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData43).mp
    (by decide +kernel)

theorem sourceChecked43_0 : ∀ i : Fin 64,
    (fun i => output43 i = raw43 (source43 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked43 : ∀ i : Fin 64, (fun i => output43 i = raw43 (source43 i)) i :=
  forallFin_of_zero_offset (fun i => output43 i = raw43 (source43 i)) sourceChecked43_0

theorem coverChecked43_0 : ∀ i : Fin 64,
    (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked43 : ∀ i : Fin 64, (fun i => (output43 (cover43 i)).ContainsBox (raw43 i)) i :=
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 7132, atom 1377, type 0, source (11,90).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 90 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,23040,23168⟩) (.node (.single ⟨2816,2944,23168,23296⟩) (.single ⟨2944,3008,23040,23104⟩))) (.node (.node (.single ⟨2944,3008,23104,23168⟩) (.single ⟨3008,3072,23040,23104⟩)) (.node (.single ⟨3008,3072,23104,23168⟩) (.single ⟨2944,3072,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,29696,29824⟩) (.node (.single ⟨9472,9600,29824,29952⟩) (.single ⟨9600,9664,29696,29760⟩))) (.node (.node (.single ⟨9600,9664,29760,29824⟩) (.single ⟨9664,9728,29696,29760⟩)) (.node (.single ⟨9664,9728,29760,29824⟩) (.single ⟨9600,9728,29824,29952⟩))))) (.node (.node (.node (.single ⟨23040,23168,2816,2944⟩) (.node (.single ⟨23040,23104,2944,3008⟩) (.single ⟨23040,23104,3008,3072⟩))) (.node (.node (.single ⟨23104,23168,2944,3008⟩) (.single ⟨23104,23168,3008,3072⟩)) (.node (.single ⟨23168,23296,2816,2944⟩) (.single ⟨23168,23296,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,9472,9600⟩) (.node (.single ⟨29696,29760,9600,9664⟩) (.single ⟨29696,29760,9664,9728⟩))) (.node (.node (.single ⟨29760,29824,9600,9664⟩) (.single ⟨29760,29824,9664,9728⟩)) (.node (.single ⟨29824,29952,9472,9600⟩) (.single ⟨29824,29952,9600,9728⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 (.cutY 23552 (.cutX 2560 .empty (.cutY 23040 .empty (.cutX 2816 .empty (.cutY 23296 (.cutX 2944 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 3008 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty)))) .empty) .empty)))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 .empty (.cutX 9728 (.cutY 30208 (.cutX 9472 .empty (.cutY 29952 (.cutX 9600 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 9664 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty))) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 (.cutX 23040 .empty (.cutY 2560 .empty (.cutX 23296 (.cutY 2816 .empty (.cutX 23168 (.cutY 2944 .full (.cutX 23104 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty))) .empty) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 .empty (.cutY 9216 .empty (.cutX 30208 (.cutY 9728 (.cutX 29952 (.cutY 9472 .empty (.cutX 29824 (.cutY 9600 .full (.cutX 29760 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty) .empty))) .empty) .empty) .empty)))) .empty))

theorem metadata44 : 0<77641223 ∧ 11<128 ∧ 90<128 ∧ 0<4 ∧
    1377/4160=0 ∧ 1377%4160=1377 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 7133, atom 5743, type 1, source (13,88).
def leavesData45 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,0⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩)) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves45 : Fin 19 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 13 88 leaves45 i
def outputData45 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨3328,3392,22528,22592⟩) (.single ⟨3328,3392,22592,22656⟩)) (.node (.single ⟨3392,3456,22528,22592⟩) (.single ⟨3392,3456,22592,22656⟩))) (.node (.node (.single ⟨3328,3456,22656,22784⟩) (.single ⟨3456,3520,22528,22592⟩)) (.node (.single ⟨3456,3520,22592,22656⟩) (.node (.single ⟨3520,3552,22528,22560⟩) (.single ⟨3520,3552,22560,22592⟩))))) (.node (.node (.node (.single ⟨3552,3584,22528,22560⟩) (.single ⟨3552,3584,22560,22592⟩)) (.node (.single ⟨3520,3552,22592,22624⟩) (.node (.single ⟨3520,3552,22624,22656⟩) (.single ⟨3552,3584,22592,22624⟩)))) (.node (.node (.single ⟨3552,3584,22624,22656⟩) (.single ⟨3456,3520,22656,22720⟩)) (.node (.single ⟨3456,3520,22720,22784⟩) (.node (.single ⟨3520,3584,22656,22720⟩) (.single ⟨3520,3584,22720,22784⟩)))))) (.node (.node (.node (.node (.single ⟨9984,10048,29184,29248⟩) (.single ⟨9984,10048,29248,29312⟩)) (.node (.single ⟨10048,10112,29184,29248⟩) (.single ⟨10048,10112,29248,29312⟩))) (.node (.node (.single ⟨9984,10112,29312,29440⟩) (.single ⟨10112,10144,29184,29216⟩)) (.node (.single ⟨10112,10144,29216,29248⟩) (.node (.single ⟨10144,10176,29184,29216⟩) (.single ⟨10144,10176,29216,29248⟩))))) (.node (.node (.node (.single ⟨10112,10176,29248,29312⟩) (.single ⟨10176,10208,29184,29216⟩)) (.node (.single ⟨10176,10208,29216,29248⟩) (.node (.single ⟨10208,10240,29184,29216⟩) (.single ⟨10208,10240,29216,29248⟩)))) (.node (.node (.single ⟨10176,10240,29248,29312⟩) (.single ⟨10112,10176,29312,29376⟩)) (.node (.single ⟨10112,10176,29376,29440⟩) (.node (.single ⟨10176,10240,29312,29376⟩) (.single ⟨10176,10240,29376,29440⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22528,22592,3328,3392⟩) (.single ⟨22528,22592,3392,3456⟩)) (.node (.single ⟨22592,22656,3328,3392⟩) (.single ⟨22592,22656,3392,3456⟩))) (.node (.node (.single ⟨22528,22592,3456,3520⟩) (.single ⟨22528,22560,3520,3552⟩)) (.node (.single ⟨22528,22560,3552,3584⟩) (.node (.single ⟨22560,22592,3520,3552⟩) (.single ⟨22560,22592,3552,3584⟩))))) (.node (.node (.node (.single ⟨22592,22656,3456,3520⟩) (.single ⟨22592,22624,3520,3552⟩)) (.node (.single ⟨22592,22624,3552,3584⟩) (.node (.single ⟨22624,22656,3520,3552⟩) (.single ⟨22624,22656,3552,3584⟩)))) (.node (.node (.single ⟨22656,22784,3328,3456⟩) (.single ⟨22656,22720,3456,3520⟩)) (.node (.single ⟨22656,22720,3520,3584⟩) (.node (.single ⟨22720,22784,3456,3520⟩) (.single ⟨22720,22784,3520,3584⟩)))))) (.node (.node (.node (.node (.single ⟨29184,29248,9984,10048⟩) (.single ⟨29184,29248,10048,10112⟩)) (.node (.single ⟨29248,29312,9984,10048⟩) (.single ⟨29248,29312,10048,10112⟩))) (.node (.node (.single ⟨29184,29216,10112,10144⟩) (.single ⟨29184,29216,10144,10176⟩)) (.node (.single ⟨29216,29248,10112,10144⟩) (.node (.single ⟨29216,29248,10144,10176⟩) (.single ⟨29184,29216,10176,10208⟩))))) (.node (.node (.node (.single ⟨29184,29216,10208,10240⟩) (.single ⟨29216,29248,10176,10208⟩)) (.node (.single ⟨29216,29248,10208,10240⟩) (.node (.single ⟨29248,29312,10112,10176⟩) (.single ⟨29248,29312,10176,10240⟩)))) (.node (.node (.single ⟨29312,29440,9984,10112⟩) (.single ⟨29312,29376,10112,10176⟩)) (.node (.single ⟨29312,29376,10176,10240⟩) (.node (.single ⟨29376,29440,10112,10176⟩) (.single ⟨29376,29440,10176,10240⟩))))))))
def output45 : Fin 76 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1))))) (.node (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39)))) (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.node (.single 41) (.single 72)))))) (.node (.node (.node (.node (.single 34) (.single 5)) (.node (.single 42) (.single 70))) (.node (.node (.single 33) (.single 6)) (.node (.single 47) (.node (.single 69) (.single 28))))) (.node (.node (.node (.single 15) (.single 53)) (.node (.single 60) (.node (.single 22) (.single 16)))) (.node (.node (.single 55) (.single 59)) (.node (.single 20) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 7) (.node (.single 43) (.single 68))))) (.node (.node (.node (.single 32) (.single 8)) (.node (.single 45) (.node (.single 67) (.single 30)))) (.node (.node (.single 9) (.single 44)) (.node (.single 66) (.node (.single 31) (.single 10)))))) (.node (.node (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.single 11))) (.node (.node (.single 48) (.single 64)) (.node (.single 27) (.node (.single 12) (.single 50))))) (.node (.node (.node (.single 63) (.single 25)) (.node (.single 13) (.node (.single 49) (.single 62)))) (.node (.node (.single 26) (.single 14)) (.node (.single 51) (.node (.single 61) (.single 24))))))))
def sourceData45 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.single 31))) (.node (.node (.single 3) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63))))) (.node (.node (.node (.single 27) (.single 59)) (.node (.single 51) (.node (.single 55) (.single 47)))) (.node (.node (.single 23) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 45)) (.node (.single 53) (.node (.single 49) (.single 57))))) (.node (.node (.node (.single 25) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73)))) (.node (.node (.single 1) (.single 29)) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 30))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.node (.single 62) (.single 58))))) (.node (.node (.node (.single 54) (.single 50)) (.node (.single 46) (.node (.single 26) (.single 22)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover45 (i : Fin 76) : Fin 76 := ⟨coverData45.get i % 76, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 76) : Fin 76 := ⟨sourceData45.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 (.cutY 23040 (.cutX 3328 .empty (.cutY 22784 (.cutX 3456 (.cutY 22656 (.cutX 3392 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 3520 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 3552 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) (.cutX 3552 (.cutY 22624 .full .full) (.cutY 22624 .full .full)))) (.cutX 3520 (.cutY 22720 .full .full) (.cutY 22720 .full .full)))) .empty)) .empty) .empty) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 .empty (.cutY 29184 .empty (.cutX 9984 .empty (.cutY 29440 (.cutX 10112 (.cutY 29312 (.cutX 10048 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full) (.cutY 29312 (.cutX 10176 (.cutY 29248 (.cutX 10144 (.cutY 29216 .full .full) (.cutY 29216 .full .full)) .full) (.cutY 29248 (.cutX 10208 (.cutY 29216 .full .full) (.cutY 29216 .full .full)) .full)) (.cutX 10176 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty)))) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 (.cutY 3584 (.cutX 22784 (.cutY 3328 .empty (.cutX 22656 (.cutY 3456 (.cutX 22592 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 22592 (.cutY 3520 .full (.cutX 22560 (.cutY 3552 .full .full) (.cutY 3552 .full .full))) (.cutY 3520 .full (.cutX 22624 (.cutY 3552 .full .full) (.cutY 3552 .full .full))))) (.cutY 3456 .full (.cutX 22720 (.cutY 3520 .full .full) (.cutY 3520 .full .full))))) .empty) .empty) .empty)) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 .empty (.cutY 9728 .empty (.cutX 29440 (.cutY 9984 .empty (.cutX 29312 (.cutY 10112 (.cutX 29248 (.cutY 10048 .full .full) (.cutY 10048 .full .full)) (.cutX 29248 (.cutY 10176 (.cutX 29216 (.cutY 10144 .full .full) (.cutY 10144 .full .full)) (.cutX 29216 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 29376 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty)))) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata45 : 0<112823226 ∧ 13<128 ∧ 88<128 ∧ 1<4 ∧
    5743/4160=1 ∧ 5743%4160=1583 ∧ ∀ i, (leaves45 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData45).mp
    (by decide +kernel)

theorem sourceChecked45_0 : ∀ i : Fin 64,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked45_64 : ∀ i : Fin 12,
    (fun i => output45 i = raw45 (source45 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked45 : ∀ i : Fin 76, (fun i => output45 i = raw45 (source45 i)) i :=
  forallFin_of_zero_offset (fun i => output45 i = raw45 (source45 i)) (forallFinOffset_add (fun i => output45 i = raw45 (source45 i)) 0 64 12 (by decide) sourceChecked45_0
    sourceChecked45_64)

theorem coverChecked45_0 : ∀ i : Fin 64,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked45_64 : ∀ i : Fin 12,
    (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked45 : ∀ i : Fin 76, (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) i :=
  forallFin_of_zero_offset (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) (forallFinOffset_add (fun i => (output45 (cover45 i)).ContainsBox (raw45 i)) 0 64 12 (by decide) coverChecked45_0
    coverChecked45_64)

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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 7134, atom 5532, type 1, source (11,85).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 11 85 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2816,2944,21760,21888⟩) (.single ⟨2816,2944,21888,22016⟩)) (.node (.single ⟨2944,3008,21760,21824⟩) (.node (.single ⟨2944,3008,21824,21888⟩) (.single ⟨3008,3072,21760,21824⟩)))) (.node (.node (.single ⟨3008,3072,21824,21888⟩) (.single ⟨2944,3008,21888,21952⟩)) (.node (.single ⟨2944,3008,21952,22016⟩) (.node (.single ⟨3008,3072,21888,21952⟩) (.single ⟨3008,3072,21952,22016⟩))))) (.node (.node (.node (.single ⟨10752,10816,29696,29760⟩) (.single ⟨10752,10816,29760,29824⟩)) (.node (.single ⟨10816,10880,29696,29760⟩) (.node (.single ⟨10816,10880,29760,29824⟩) (.single ⟨10752,10880,29824,29952⟩)))) (.node (.node (.single ⟨10880,10944,29696,29760⟩) (.single ⟨10880,10944,29760,29824⟩)) (.node (.single ⟨10944,11008,29696,29760⟩) (.node (.single ⟨10944,11008,29760,29824⟩) (.single ⟨10880,11008,29824,29952⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21888,2816,2944⟩) (.single ⟨21760,21824,2944,3008⟩)) (.node (.single ⟨21760,21824,3008,3072⟩) (.node (.single ⟨21824,21888,2944,3008⟩) (.single ⟨21824,21888,3008,3072⟩)))) (.node (.node (.single ⟨21888,22016,2816,2944⟩) (.single ⟨21888,21952,2944,3008⟩)) (.node (.single ⟨21888,21952,3008,3072⟩) (.node (.single ⟨21952,22016,2944,3008⟩) (.single ⟨21952,22016,3008,3072⟩))))) (.node (.node (.node (.single ⟨29696,29760,10752,10816⟩) (.single ⟨29696,29760,10816,10880⟩)) (.node (.single ⟨29760,29824,10752,10816⟩) (.node (.single ⟨29760,29824,10816,10880⟩) (.single ⟨29696,29760,10880,10944⟩)))) (.node (.node (.single ⟨29696,29760,10944,11008⟩) (.single ⟨29760,29824,10880,10944⟩)) (.node (.single ⟨29760,29824,10944,11008⟩) (.node (.single ⟨29824,29952,10752,10880⟩) (.single ⟨29824,29952,10880,11008⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 (.cutX 2816 .empty (.cutY 21760 .empty (.cutX 2944 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 3008 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) (.cutX 3008 (.cutY 21952 .full .full) (.cutY 21952 .full .full)))))) .empty))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 (.cutX 11008 (.cutY 29952 (.cutX 10880 (.cutY 29824 (.cutX 10816 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full) (.cutY 29824 (.cutX 10944 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 .empty (.cutX 21760 .empty (.cutY 2816 .empty (.cutX 21888 (.cutY 2944 .full (.cutX 21824 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full (.cutX 21952 (.cutY 3008 .full .full) (.cutY 3008 .full .full))))))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 .empty (.cutX 29952 (.cutY 11008 (.cutX 29824 (.cutY 10880 (.cutX 29760 (.cutY 10816 .full .full) (.cutY 10816 .full .full)) (.cutX 29760 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata46 : 0<139307719 ∧ 11<128 ∧ 85<128 ∧ 1<4 ∧
    5532/4160=1 ∧ 5532%4160=1372 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 7135, atom 454, type 0, source (3,79).
def leavesData47 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves47 : Fin 13 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 3 79 leaves47 i
def outputData47 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨768,832,20224,20288⟩) (.node (.single ⟨768,832,20288,20352⟩) (.single ⟨832,896,20224,20288⟩))) (.node (.single ⟨832,896,20288,20352⟩) (.node (.single ⟨768,896,20352,20480⟩) (.single ⟨896,960,20224,20288⟩)))) (.node (.node (.single ⟨896,960,20288,20352⟩) (.node (.single ⟨960,1024,20224,20288⟩) (.single ⟨960,1024,20288,20352⟩))) (.node (.node (.single ⟨896,960,20352,20416⟩) (.single ⟨896,960,20416,20480⟩)) (.node (.single ⟨960,1024,20352,20416⟩) (.single ⟨960,1024,20416,20480⟩))))) (.node (.node (.node (.single ⟨12288,12352,31744,31808⟩) (.node (.single ⟨12288,12352,31808,31872⟩) (.single ⟨12352,12416,31744,31808⟩))) (.node (.single ⟨12352,12416,31808,31872⟩) (.node (.single ⟨12288,12416,31872,32000⟩) (.single ⟨12416,12480,31744,31808⟩)))) (.node (.node (.single ⟨12416,12480,31808,31872⟩) (.node (.single ⟨12480,12544,31744,31808⟩) (.single ⟨12480,12544,31808,31872⟩))) (.node (.node (.single ⟨12416,12480,31872,31936⟩) (.single ⟨12416,12480,31936,32000⟩)) (.node (.single ⟨12480,12544,31872,31936⟩) (.single ⟨12480,12544,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,768,832⟩) (.node (.single ⟨20224,20288,832,896⟩) (.single ⟨20288,20352,768,832⟩))) (.node (.single ⟨20288,20352,832,896⟩) (.node (.single ⟨20224,20288,896,960⟩) (.single ⟨20224,20288,960,1024⟩)))) (.node (.node (.single ⟨20288,20352,896,960⟩) (.node (.single ⟨20288,20352,960,1024⟩) (.single ⟨20352,20480,768,896⟩))) (.node (.node (.single ⟨20352,20416,896,960⟩) (.single ⟨20352,20416,960,1024⟩)) (.node (.single ⟨20416,20480,896,960⟩) (.single ⟨20416,20480,960,1024⟩))))) (.node (.node (.node (.single ⟨31744,31808,12288,12352⟩) (.node (.single ⟨31744,31808,12352,12416⟩) (.single ⟨31808,31872,12288,12352⟩))) (.node (.single ⟨31808,31872,12352,12416⟩) (.node (.single ⟨31744,31808,12416,12480⟩) (.single ⟨31744,31808,12480,12544⟩)))) (.node (.node (.single ⟨31808,31872,12416,12480⟩) (.node (.single ⟨31808,31872,12480,12544⟩) (.single ⟨31872,32000,12288,12416⟩))) (.node (.node (.single ⟨31872,31936,12416,12480⟩) (.single ⟨31872,31936,12480,12544⟩)) (.node (.single ⟨31936,32000,12416,12480⟩) (.single ⟨31936,32000,12480,12544⟩)))))))
def output47 : Fin 52 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData47 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover47 (i : Fin 52) : Fin 52 := ⟨coverData47.get i % 52, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 52) : Fin 52 := ⟨sourceData47.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 .empty (.cutX 768 .empty (.cutY 20224 .empty (.cutX 896 (.cutY 20352 (.cutX 832 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 960 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) (.cutX 960 (.cutY 20416 .full .full) (.cutY 20416 .full .full))))))))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 (.cutX 12544 (.cutY 32000 (.cutX 12416 (.cutY 31872 (.cutX 12352 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full) (.cutY 31872 (.cutX 12480 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 12480 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 .empty (.cutX 20224 .empty (.cutY 768 .empty (.cutX 20352 (.cutY 896 (.cutX 20288 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 20288 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full (.cutX 20416 (.cutY 960 .full .full) (.cutY 960 .full .full)))))))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 (.cutX 32000 (.cutY 12544 (.cutX 31872 (.cutY 12416 (.cutX 31808 (.cutY 12352 .full .full) (.cutY 12352 .full .full)) (.cutX 31808 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 31936 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty)))))) .empty))

theorem metadata47 : 0<34183877 ∧ 3<128 ∧ 79<128 ∧ 0<4 ∧
    454/4160=0 ∧ 454%4160=454 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 7136, atom 4735, type 1, source (4,79).
def leavesData48 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves48 : Fin 7 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 79 leaves48 i
def outputData48 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,20224,20352⟩) (.node (.single ⟨1024,1152,20352,20480⟩) (.single ⟨1152,1216,20224,20288⟩))) (.node (.node (.single ⟨1152,1216,20288,20352⟩) (.single ⟨1216,1280,20224,20288⟩)) (.node (.single ⟨1216,1280,20288,20352⟩) (.single ⟨1152,1280,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,31488,31616⟩) (.node (.single ⟨12288,12416,31616,31744⟩) (.single ⟨12416,12480,31488,31552⟩))) (.node (.node (.single ⟨12416,12480,31552,31616⟩) (.single ⟨12480,12544,31488,31552⟩)) (.node (.single ⟨12480,12544,31552,31616⟩) (.single ⟨12416,12544,31616,31744⟩))))) (.node (.node (.node (.single ⟨20224,20352,1024,1152⟩) (.node (.single ⟨20224,20288,1152,1216⟩) (.single ⟨20224,20288,1216,1280⟩))) (.node (.node (.single ⟨20288,20352,1152,1216⟩) (.single ⟨20288,20352,1216,1280⟩)) (.node (.single ⟨20352,20480,1024,1152⟩) (.single ⟨20352,20480,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,12288,12416⟩) (.node (.single ⟨31488,31552,12416,12480⟩) (.single ⟨31488,31552,12480,12544⟩))) (.node (.node (.single ⟨31552,31616,12416,12480⟩) (.single ⟨31552,31616,12480,12544⟩)) (.node (.single ⟨31616,31744,12288,12416⟩) (.single ⟨31616,31744,12416,12544⟩))))))
def output48 : Fin 28 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData48 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover48 (i : Fin 28) : Fin 28 := ⟨coverData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 28) : Fin 28 := ⟨sourceData48.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 .empty (.cutX 1536 (.cutY 19968 .empty (.cutX 1280 (.cutY 20224 .empty (.cutX 1152 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 1216 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)) .empty)))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 (.cutX 12800 (.cutY 31232 .empty (.cutX 12544 (.cutY 31488 .empty (.cutX 12416 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 12480 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty)) .empty) .empty) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 .empty (.cutX 19968 .empty (.cutY 1536 (.cutX 20224 .empty (.cutY 1280 (.cutX 20352 (.cutY 1152 .full (.cutX 20288 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 (.cutX 31232 .empty (.cutY 12800 (.cutX 31488 .empty (.cutY 12544 (.cutX 31616 (.cutY 12416 .full (.cutX 31552 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty)) .empty) .empty) .empty)))))) .empty))

theorem metadata48 : 0<137362203 ∧ 4<128 ∧ 79<128 ∧ 1<4 ∧
    4735/4160=1 ∧ 4735%4160=575 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 7137, atom 4613, type 1, source (3,78).
def leavesData49 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves49 : Fin 16 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 3 78 leaves49 i
def outputData49 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,19968,20032⟩) (.single ⟨768,832,20032,20096⟩)) (.node (.single ⟨832,896,19968,20032⟩) (.single ⟨832,896,20032,20096⟩))) (.node (.node (.single ⟨768,896,20096,20224⟩) (.single ⟨896,960,19968,20032⟩)) (.node (.single ⟨896,960,20032,20096⟩) (.single ⟨960,992,19968,20000⟩)))) (.node (.node (.node (.single ⟨960,992,20000,20032⟩) (.single ⟨992,1024,19968,20000⟩)) (.node (.single ⟨992,1024,20000,20032⟩) (.single ⟨960,1024,20032,20096⟩))) (.node (.node (.single ⟨896,960,20096,20160⟩) (.single ⟨896,960,20160,20224⟩)) (.node (.single ⟨960,1024,20096,20160⟩) (.single ⟨960,1024,20160,20224⟩))))) (.node (.node (.node (.node (.single ⟨12544,12608,31744,31808⟩) (.single ⟨12544,12608,31808,31872⟩)) (.node (.single ⟨12608,12672,31744,31808⟩) (.single ⟨12608,12672,31808,31872⟩))) (.node (.node (.single ⟨12544,12672,31872,32000⟩) (.single ⟨12672,12736,31744,31808⟩)) (.node (.single ⟨12672,12736,31808,31872⟩) (.single ⟨12736,12768,31744,31776⟩)))) (.node (.node (.node (.single ⟨12736,12768,31776,31808⟩) (.single ⟨12768,12800,31744,31776⟩)) (.node (.single ⟨12768,12800,31776,31808⟩) (.single ⟨12736,12800,31808,31872⟩))) (.node (.node (.single ⟨12672,12736,31872,31936⟩) (.single ⟨12672,12736,31936,32000⟩)) (.node (.single ⟨12736,12800,31872,31936⟩) (.single ⟨12736,12800,31936,32000⟩)))))) (.node (.node (.node (.node (.node (.single ⟨19968,20032,768,832⟩) (.single ⟨19968,20032,832,896⟩)) (.node (.single ⟨20032,20096,768,832⟩) (.single ⟨20032,20096,832,896⟩))) (.node (.node (.single ⟨19968,20032,896,960⟩) (.single ⟨19968,20000,960,992⟩)) (.node (.single ⟨19968,20000,992,1024⟩) (.single ⟨20000,20032,960,992⟩)))) (.node (.node (.node (.single ⟨20000,20032,992,1024⟩) (.single ⟨20032,20096,896,960⟩)) (.node (.single ⟨20032,20096,960,1024⟩) (.single ⟨20096,20224,768,896⟩))) (.node (.node (.single ⟨20096,20160,896,960⟩) (.single ⟨20096,20160,960,1024⟩)) (.node (.single ⟨20160,20224,896,960⟩) (.single ⟨20160,20224,960,1024⟩))))) (.node (.node (.node (.node (.single ⟨31744,31808,12544,12608⟩) (.single ⟨31744,31808,12608,12672⟩)) (.node (.single ⟨31808,31872,12544,12608⟩) (.single ⟨31808,31872,12608,12672⟩))) (.node (.node (.single ⟨31744,31808,12672,12736⟩) (.single ⟨31744,31776,12736,12768⟩)) (.node (.single ⟨31744,31776,12768,12800⟩) (.single ⟨31776,31808,12736,12768⟩)))) (.node (.node (.node (.single ⟨31776,31808,12768,12800⟩) (.single ⟨31808,31872,12672,12736⟩)) (.node (.single ⟨31808,31872,12736,12800⟩) (.single ⟨31872,32000,12544,12672⟩))) (.node (.node (.single ⟨31872,31936,12672,12736⟩) (.single ⟨31872,31936,12736,12800⟩)) (.node (.single ⟨31936,32000,12672,12736⟩) (.single ⟨31936,32000,12736,12800⟩)))))))
def output49 : Fin 64 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData49 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover49 (i : Fin 64) : Fin 64 := ⟨coverData49.get i % 64, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 64) : Fin 64 := ⟨sourceData49.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 .empty (.cutX 768 .empty (.cutY 20224 (.cutX 896 (.cutY 20096 (.cutX 832 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 960 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 992 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) (.cutX 960 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty))))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 (.cutX 12544 .empty (.cutY 32000 (.cutX 12672 (.cutY 31872 (.cutX 12608 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) .full) (.cutY 31872 (.cutX 12736 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 12768 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) .full)) (.cutX 12736 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 .empty (.cutX 20224 (.cutY 768 .empty (.cutX 20096 (.cutY 896 (.cutX 20032 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 20032 (.cutY 960 .full (.cutX 20000 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full (.cutX 20160 (.cutY 960 .full .full) (.cutY 960 .full .full))))) .empty))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 (.cutX 32000 (.cutY 12544 .empty (.cutX 31872 (.cutY 12672 (.cutX 31808 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) (.cutX 31808 (.cutY 12736 .full (.cutX 31776 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 31936 (.cutY 12736 .full .full) (.cutY 12736 .full .full))))) .empty) .empty) .empty) .empty)) .empty)))))) .empty))

theorem metadata49 : 0<137362203 ∧ 3<128 ∧ 78<128 ∧ 1<4 ∧
    4613/4160=1 ∧ 4613%4160=453 ∧ ∀ i, (leaves49 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData49).mp
    (by decide +kernel)

theorem sourceChecked49_0 : ∀ i : Fin 64,
    (fun i => output49 i = raw49 (source49 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked49 : ∀ i : Fin 64, (fun i => output49 i = raw49 (source49 i)) i :=
  forallFin_of_zero_offset (fun i => output49 i = raw49 (source49 i)) sourceChecked49_0

theorem coverChecked49_0 : ∀ i : Fin 64,
    (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked49 : ∀ i : Fin 64, (fun i => (output49 (cover49 i)).ContainsBox (raw49 i)) i :=
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 7138, atom 4364, type 1, source (1,77).
def leavesData50 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves50 : Fin 16 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 1 77 leaves50 i
def outputData50 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨256,320,19712,19776⟩) (.single ⟨256,320,19776,19840⟩)) (.node (.single ⟨320,384,19712,19776⟩) (.single ⟨320,384,19776,19840⟩))) (.node (.node (.single ⟨256,384,19840,19968⟩) (.single ⟨384,448,19712,19776⟩)) (.node (.single ⟨384,448,19776,19840⟩) (.single ⟨448,480,19712,19744⟩)))) (.node (.node (.node (.single ⟨448,480,19744,19776⟩) (.single ⟨480,512,19712,19744⟩)) (.node (.single ⟨480,512,19744,19776⟩) (.single ⟨448,512,19776,19840⟩))) (.node (.node (.single ⟨384,448,19840,19904⟩) (.single ⟨384,448,19904,19968⟩)) (.node (.single ⟨448,512,19840,19904⟩) (.single ⟨448,512,19904,19968⟩))))) (.node (.node (.node (.node (.single ⟨12800,12864,32256,32320⟩) (.single ⟨12800,12864,32320,32384⟩)) (.node (.single ⟨12864,12928,32256,32320⟩) (.single ⟨12864,12928,32320,32384⟩))) (.node (.node (.single ⟨12800,12928,32384,32512⟩) (.single ⟨12928,12992,32256,32320⟩)) (.node (.single ⟨12928,12992,32320,32384⟩) (.single ⟨12992,13024,32256,32288⟩)))) (.node (.node (.node (.single ⟨12992,13024,32288,32320⟩) (.single ⟨13024,13056,32256,32288⟩)) (.node (.single ⟨13024,13056,32288,32320⟩) (.single ⟨12992,13056,32320,32384⟩))) (.node (.node (.single ⟨12928,12992,32384,32448⟩) (.single ⟨12928,12992,32448,32512⟩)) (.node (.single ⟨12992,13056,32384,32448⟩) (.single ⟨12992,13056,32448,32512⟩)))))) (.node (.node (.node (.node (.node (.single ⟨19712,19776,256,320⟩) (.single ⟨19712,19776,320,384⟩)) (.node (.single ⟨19776,19840,256,320⟩) (.single ⟨19776,19840,320,384⟩))) (.node (.node (.single ⟨19712,19776,384,448⟩) (.single ⟨19712,19744,448,480⟩)) (.node (.single ⟨19712,19744,480,512⟩) (.single ⟨19744,19776,448,480⟩)))) (.node (.node (.node (.single ⟨19744,19776,480,512⟩) (.single ⟨19776,19840,384,448⟩)) (.node (.single ⟨19776,19840,448,512⟩) (.single ⟨19840,19968,256,384⟩))) (.node (.node (.single ⟨19840,19904,384,448⟩) (.single ⟨19840,19904,448,512⟩)) (.node (.single ⟨19904,19968,384,448⟩) (.single ⟨19904,19968,448,512⟩))))) (.node (.node (.node (.node (.single ⟨32256,32320,12800,12864⟩) (.single ⟨32256,32320,12864,12928⟩)) (.node (.single ⟨32320,32384,12800,12864⟩) (.single ⟨32320,32384,12864,12928⟩))) (.node (.node (.single ⟨32256,32320,12928,12992⟩) (.single ⟨32256,32288,12992,13024⟩)) (.node (.single ⟨32256,32288,13024,13056⟩) (.single ⟨32288,32320,12992,13024⟩)))) (.node (.node (.node (.single ⟨32288,32320,13024,13056⟩) (.single ⟨32320,32384,12928,12992⟩)) (.node (.single ⟨32320,32384,12992,13056⟩) (.single ⟨32384,32512,12800,12928⟩))) (.node (.node (.single ⟨32384,32448,12928,12992⟩) (.single ⟨32384,32448,12992,13056⟩)) (.node (.single ⟨32448,32512,12928,12992⟩) (.single ⟨32448,32512,12992,13056⟩)))))))
def output50 : Fin 64 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19)))))) (.node (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData50 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover50 (i : Fin 64) : Fin 64 := ⟨coverData50.get i % 64, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 64) : Fin 64 := ⟨sourceData50.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 (.cutX 256 .empty (.cutY 19712 .empty (.cutX 384 (.cutY 19840 (.cutX 320 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 448 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 480 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) (.cutX 448 (.cutY 19904 .full .full) (.cutY 19904 .full .full)))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 .empty (.cutX 13056 (.cutY 32512 (.cutX 12928 (.cutY 32384 (.cutX 12864 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full) (.cutY 32384 (.cutX 12992 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 13024 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 12992 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty) .empty)))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 (.cutX 19712 .empty (.cutY 256 .empty (.cutX 19840 (.cutY 384 (.cutX 19776 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 19776 (.cutY 448 .full (.cutX 19744 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full (.cutX 19904 (.cutY 448 .full .full) (.cutY 448 .full .full)))))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 .empty (.cutX 32512 (.cutY 13056 (.cutX 32384 (.cutY 12928 (.cutX 32320 (.cutY 12864 .full .full) (.cutY 12864 .full .full)) (.cutX 32320 (.cutY 12992 .full (.cutX 32288 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 32448 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty) .empty))) .empty)) .empty)))))) .empty))

theorem metadata50 : 0<137362203 ∧ 1<128 ∧ 77<128 ∧ 1<4 ∧
    4364/4160=1 ∧ 4364%4160=204 ∧ ∀ i, (leaves50 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData50).mp
    (by decide +kernel)

theorem sourceChecked50_0 : ∀ i : Fin 64,
    (fun i => output50 i = raw50 (source50 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked50 : ∀ i : Fin 64, (fun i => output50 i = raw50 (source50 i)) i :=
  forallFin_of_zero_offset (fun i => output50 i = raw50 (source50 i)) sourceChecked50_0

theorem coverChecked50_0 : ∀ i : Fin 64,
    (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked50 : ∀ i : Fin 64, (fun i => (output50 (cover50 i)).ContainsBox (raw50 i)) i :=
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 7139, atom 4237, type 1, source (0,77).
def leavesData51 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves51 : Fin 10 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 77 leaves51 i
def outputData51 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,64,19712,19776⟩) (.single ⟨0,64,19776,19840⟩)) (.node (.single ⟨64,128,19712,19776⟩) (.node (.single ⟨64,128,19776,19840⟩) (.single ⟨0,128,19840,19968⟩)))) (.node (.node (.single ⟨128,192,19712,19776⟩) (.single ⟨128,192,19776,19840⟩)) (.node (.single ⟨192,256,19712,19776⟩) (.node (.single ⟨192,256,19776,19840⟩) (.single ⟨128,256,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,32512,32640⟩) (.single ⟨12800,12928,32640,32768⟩)) (.node (.single ⟨12928,12992,32512,32576⟩) (.node (.single ⟨12928,12992,32576,32640⟩) (.single ⟨12992,13056,32512,32576⟩)))) (.node (.node (.single ⟨12992,13056,32576,32640⟩) (.single ⟨12928,12992,32640,32704⟩)) (.node (.single ⟨12928,12992,32704,32768⟩) (.node (.single ⟨12992,13056,32640,32704⟩) (.single ⟨12992,13056,32704,32768⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19776,0,64⟩) (.single ⟨19712,19776,64,128⟩)) (.node (.single ⟨19776,19840,0,64⟩) (.node (.single ⟨19776,19840,64,128⟩) (.single ⟨19712,19776,128,192⟩)))) (.node (.node (.single ⟨19712,19776,192,256⟩) (.single ⟨19776,19840,128,192⟩)) (.node (.single ⟨19776,19840,192,256⟩) (.node (.single ⟨19840,19968,0,128⟩) (.single ⟨19840,19968,128,256⟩))))) (.node (.node (.node (.single ⟨32512,32640,12800,12928⟩) (.single ⟨32512,32576,12928,12992⟩)) (.node (.single ⟨32512,32576,12992,13056⟩) (.node (.single ⟨32576,32640,12928,12992⟩) (.single ⟨32576,32640,12992,13056⟩)))) (.node (.node (.single ⟨32640,32768,12800,12928⟩) (.single ⟨32640,32704,12928,12992⟩)) (.node (.single ⟨32640,32704,12992,13056⟩) (.node (.single ⟨32704,32768,12928,12992⟩) (.single ⟨32704,32768,12992,13056⟩)))))))
def output51 : Fin 40 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData51 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover51 (i : Fin 40) : Fin 40 := ⟨coverData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 40) : Fin 40 := ⟨sourceData51.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 (.cutX 256 (.cutY 19712 .empty (.cutX 128 (.cutY 19840 (.cutX 64 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 192 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 .empty (.cutY 32256 .empty (.cutX 13056 (.cutY 32512 .empty (.cutX 12928 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 12992 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 12992 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))) .empty)))) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 (.cutY 512 (.cutX 19712 .empty (.cutY 256 (.cutX 19840 (.cutY 128 (.cutX 19776 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 19776 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 .empty (.cutX 32512 .empty (.cutY 13056 (.cutX 32640 (.cutY 12928 .full (.cutX 32576 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 32704 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty)))) .empty)) .empty)))))) .empty))

theorem metadata51 : 0<137362203 ∧ 0<128 ∧ 77<128 ∧ 1<4 ∧
    4237/4160=1 ∧ 4237%4160=77 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 7140, atom 4490, type 1, source (2,78).
def leavesData52 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves52 : Fin 13 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 78 leaves52 i
def outputData52 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,19968,20032⟩) (.node (.single ⟨512,576,20032,20096⟩) (.single ⟨576,640,19968,20032⟩))) (.node (.single ⟨576,640,20032,20096⟩) (.node (.single ⟨512,640,20096,20224⟩) (.single ⟨640,704,19968,20032⟩)))) (.node (.node (.single ⟨640,704,20032,20096⟩) (.node (.single ⟨704,768,19968,20032⟩) (.single ⟨704,768,20032,20096⟩))) (.node (.node (.single ⟨640,704,20096,20160⟩) (.single ⟨640,704,20160,20224⟩)) (.node (.single ⟨704,768,20096,20160⟩) (.single ⟨704,768,20160,20224⟩))))) (.node (.node (.node (.single ⟨12544,12608,32000,32064⟩) (.node (.single ⟨12544,12608,32064,32128⟩) (.single ⟨12608,12672,32000,32064⟩))) (.node (.single ⟨12608,12672,32064,32128⟩) (.node (.single ⟨12544,12672,32128,32256⟩) (.single ⟨12672,12736,32000,32064⟩)))) (.node (.node (.single ⟨12672,12736,32064,32128⟩) (.node (.single ⟨12736,12800,32000,32064⟩) (.single ⟨12736,12800,32064,32128⟩))) (.node (.node (.single ⟨12672,12736,32128,32192⟩) (.single ⟨12672,12736,32192,32256⟩)) (.node (.single ⟨12736,12800,32128,32192⟩) (.single ⟨12736,12800,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20032,512,576⟩) (.node (.single ⟨19968,20032,576,640⟩) (.single ⟨20032,20096,512,576⟩))) (.node (.single ⟨20032,20096,576,640⟩) (.node (.single ⟨19968,20032,640,704⟩) (.single ⟨19968,20032,704,768⟩)))) (.node (.node (.single ⟨20032,20096,640,704⟩) (.node (.single ⟨20032,20096,704,768⟩) (.single ⟨20096,20224,512,640⟩))) (.node (.node (.single ⟨20096,20160,640,704⟩) (.single ⟨20096,20160,704,768⟩)) (.node (.single ⟨20160,20224,640,704⟩) (.single ⟨20160,20224,704,768⟩))))) (.node (.node (.node (.single ⟨32000,32064,12544,12608⟩) (.node (.single ⟨32000,32064,12608,12672⟩) (.single ⟨32064,32128,12544,12608⟩))) (.node (.single ⟨32064,32128,12608,12672⟩) (.node (.single ⟨32000,32064,12672,12736⟩) (.single ⟨32000,32064,12736,12800⟩)))) (.node (.node (.single ⟨32064,32128,12672,12736⟩) (.node (.single ⟨32064,32128,12736,12800⟩) (.single ⟨32128,32256,12544,12672⟩))) (.node (.node (.single ⟨32128,32192,12672,12736⟩) (.single ⟨32128,32192,12736,12800⟩)) (.node (.single ⟨32192,32256,12672,12736⟩) (.single ⟨32192,32256,12736,12800⟩)))))))
def output52 : Fin 52 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData52 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover52 (i : Fin 52) : Fin 52 := ⟨coverData52.get i % 52, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 52) : Fin 52 := ⟨sourceData52.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 .empty (.cutX 768 (.cutY 20224 (.cutX 640 (.cutY 20096 (.cutX 576 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 704 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) (.cutX 704 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty) .empty)))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 (.cutX 12544 .empty (.cutY 32000 .empty (.cutX 12672 (.cutY 32128 (.cutX 12608 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full) (.cutY 32128 (.cutX 12736 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 12736 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 .empty (.cutX 20224 (.cutY 768 (.cutX 20096 (.cutY 640 (.cutX 20032 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 20032 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full (.cutX 20160 (.cutY 704 .full .full) (.cutY 704 .full .full)))) .empty) .empty))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 (.cutX 32000 .empty (.cutY 12544 .empty (.cutX 32128 (.cutY 12672 (.cutX 32064 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) (.cutX 32064 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 32192 (.cutY 12736 .full .full) (.cutY 12736 .full .full)))))) .empty) .empty) .empty)) .empty)))))) .empty))

theorem metadata52 : 0<137362203 ∧ 2<128 ∧ 78<128 ∧ 1<4 ∧
    4490/4160=1 ∧ 4490%4160=330 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (137362203/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (137362203/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 7141, atom 205, type 0, source (1,78).
def leavesData53 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,4,0⟩))) (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))))))
def leaves53 : Fin 22 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 1 78 leaves53 i
def outputData53 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨256,320,19968,20032⟩) (.single ⟨256,320,20032,20096⟩)) (.node (.single ⟨320,384,19968,20032⟩) (.node (.single ⟨320,384,20032,20096⟩) (.single ⟨256,320,20096,20160⟩)))) (.node (.node (.single ⟨256,320,20160,20224⟩) (.node (.single ⟨320,384,20096,20160⟩) (.single ⟨320,384,20160,20224⟩))) (.node (.single ⟨384,416,19968,20000⟩) (.node (.single ⟨384,416,20000,20032⟩) (.single ⟨416,448,19968,20000⟩))))) (.node (.node (.node (.single ⟨416,448,20000,20032⟩) (.single ⟨384,448,20032,20096⟩)) (.node (.single ⟨448,480,19968,20000⟩) (.node (.single ⟨448,480,20000,20032⟩) (.single ⟨480,512,19968,20000⟩)))) (.node (.node (.single ⟨480,512,20000,20032⟩) (.node (.single ⟨448,512,20032,20096⟩) (.single ⟨384,448,20096,20160⟩))) (.node (.single ⟨384,448,20160,20224⟩) (.node (.single ⟨448,512,20096,20160⟩) (.single ⟨448,512,20160,20224⟩)))))) (.node (.node (.node (.node (.single ⟨12544,12608,32256,32320⟩) (.single ⟨12544,12608,32320,32384⟩)) (.node (.single ⟨12608,12672,32256,32320⟩) (.node (.single ⟨12608,12672,32320,32384⟩) (.single ⟨12544,12608,32384,32448⟩)))) (.node (.node (.single ⟨12544,12608,32448,32512⟩) (.node (.single ⟨12608,12672,32384,32448⟩) (.single ⟨12608,12672,32448,32512⟩))) (.node (.single ⟨12672,12736,32256,32320⟩) (.node (.single ⟨12672,12736,32320,32384⟩) (.single ⟨12736,12768,32256,32288⟩))))) (.node (.node (.node (.single ⟨12736,12768,32288,32320⟩) (.single ⟨12768,12800,32256,32288⟩)) (.node (.single ⟨12768,12800,32288,32320⟩) (.node (.single ⟨12736,12768,32320,32352⟩) (.single ⟨12736,12768,32352,32384⟩)))) (.node (.node (.single ⟨12768,12800,32320,32352⟩) (.node (.single ⟨12768,12800,32352,32384⟩) (.single ⟨12672,12736,32384,32448⟩))) (.node (.single ⟨12672,12736,32448,32512⟩) (.node (.single ⟨12736,12800,32384,32448⟩) (.single ⟨12736,12800,32448,32512⟩))))))) (.node (.node (.node (.node (.node (.single ⟨19968,20032,256,320⟩) (.single ⟨19968,20032,320,384⟩)) (.node (.single ⟨20032,20096,256,320⟩) (.node (.single ⟨20032,20096,320,384⟩) (.single ⟨19968,20000,384,416⟩)))) (.node (.node (.single ⟨19968,20000,416,448⟩) (.node (.single ⟨20000,20032,384,416⟩) (.single ⟨20000,20032,416,448⟩))) (.node (.single ⟨19968,20000,448,480⟩) (.node (.single ⟨19968,20000,480,512⟩) (.single ⟨20000,20032,448,480⟩))))) (.node (.node (.node (.single ⟨20000,20032,480,512⟩) (.single ⟨20032,20096,384,448⟩)) (.node (.single ⟨20032,20096,448,512⟩) (.node (.single ⟨20096,20160,256,320⟩) (.single ⟨20096,20160,320,384⟩)))) (.node (.node (.single ⟨20160,20224,256,320⟩) (.node (.single ⟨20160,20224,320,384⟩) (.single ⟨20096,20160,384,448⟩))) (.node (.single ⟨20096,20160,448,512⟩) (.node (.single ⟨20160,20224,384,448⟩) (.single ⟨20160,20224,448,512⟩)))))) (.node (.node (.node (.node (.single ⟨32256,32320,12544,12608⟩) (.single ⟨32256,32320,12608,12672⟩)) (.node (.single ⟨32320,32384,12544,12608⟩) (.node (.single ⟨32320,32384,12608,12672⟩) (.single ⟨32256,32320,12672,12736⟩)))) (.node (.node (.single ⟨32256,32288,12736,12768⟩) (.node (.single ⟨32256,32288,12768,12800⟩) (.single ⟨32288,32320,12736,12768⟩))) (.node (.single ⟨32288,32320,12768,12800⟩) (.node (.single ⟨32320,32384,12672,12736⟩) (.single ⟨32320,32352,12736,12768⟩))))) (.node (.node (.node (.single ⟨32320,32352,12768,12800⟩) (.single ⟨32352,32384,12736,12768⟩)) (.node (.single ⟨32352,32384,12768,12800⟩) (.node (.single ⟨32384,32448,12544,12608⟩) (.single ⟨32384,32448,12608,12672⟩)))) (.node (.node (.single ⟨32448,32512,12544,12608⟩) (.node (.single ⟨32448,32512,12608,12672⟩) (.single ⟨32384,32448,12672,12736⟩))) (.node (.single ⟨32384,32448,12736,12800⟩) (.node (.single ⟨32448,32512,12672,12736⟩) (.single ⟨32448,32512,12736,12800⟩))))))))
def output53 : Fin 88 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 44)) (.node (.single 87) (.node (.single 43) (.single 1)))) (.node (.node (.single 46) (.node (.single 86) (.single 41))) (.node (.single 2) (.node (.single 45) (.single 85))))) (.node (.node (.node (.single 42) (.single 3)) (.node (.single 47) (.node (.single 84) (.single 40)))) (.node (.node (.single 12) (.node (.single 56) (.single 75))) (.node (.single 31) (.node (.single 18) (.single 62)))))) (.node (.node (.node (.node (.single 69) (.single 25)) (.node (.single 19) (.node (.single 64) (.single 68)))) (.node (.node (.single 23) (.node (.single 17) (.single 57))) (.node (.single 70) (.node (.single 30) (.single 20))))) (.node (.node (.node (.single 63) (.single 67)) (.node (.single 24) (.node (.single 21) (.single 65)))) (.node (.node (.single 66) (.node (.single 22) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 13)) (.node (.single 52) (.node (.single 74) (.single 35)))) (.node (.node (.single 14) (.node (.single 54) (.single 73))) (.node (.single 33) (.node (.single 15) (.single 53)))))) (.node (.node (.node (.node (.single 72) (.single 34)) (.node (.single 16) (.node (.single 55) (.single 71)))) (.node (.node (.single 32) (.node (.single 8) (.single 48))) (.node (.single 79) (.node (.single 39) (.single 9))))) (.node (.node (.node (.single 50) (.single 78)) (.node (.single 37) (.node (.single 10) (.single 49)))) (.node (.node (.single 77) (.node (.single 38) (.single 11))) (.node (.single 51) (.node (.single 76) (.single 36))))))))
def sourceData53 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 72) (.node (.single 76) (.single 80))))) (.node (.node (.node (.single 84) (.single 16)) (.node (.single 56) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.node (.single 28) (.single 20))) (.node (.single 24) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.single 27)) (.node (.single 35) (.node (.single 23) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 31) (.node (.single 19) (.single 71))))) (.node (.node (.node (.single 63) (.single 67)) (.node (.single 59) (.node (.single 87) (.single 79)))) (.node (.node (.single 83) (.node (.single 75) (.single 15))) (.node (.single 7) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.node (.single 13) (.single 73)))) (.node (.node (.single 81) (.node (.single 77) (.single 85))) (.node (.single 57) (.node (.single 65) (.single 61))))) (.node (.node (.node (.single 69) (.single 17)) (.node (.single 29) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 21))) (.node (.single 33) (.node (.single 25) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.single 34)) (.node (.single 26) (.node (.single 22) (.single 30)))) (.node (.node (.single 70) (.node (.single 66) (.single 62))) (.node (.single 58) (.node (.single 18) (.single 86))))) (.node (.node (.node (.single 82) (.single 78)) (.node (.single 74) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 14))) (.node (.single 10) (.node (.single 6) (.single 2))))))))
def cover53 (i : Fin 88) : Fin 88 := ⟨coverData53.get i % 88, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 88) : Fin 88 := ⟨sourceData53.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 .empty (.cutX 256 .empty (.cutY 20224 (.cutX 384 (.cutY 20096 (.cutX 320 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) (.cutX 320 (.cutY 20160 .full .full) (.cutY 20160 .full .full))) (.cutY 20096 (.cutX 448 (.cutY 20032 (.cutX 416 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full) (.cutY 20032 (.cutX 480 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) (.cutX 448 (.cutY 20160 .full .full) (.cutY 20160 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 .empty (.cutX 12544 .empty (.cutY 32512 (.cutX 12672 (.cutY 32384 (.cutX 12608 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) (.cutX 12608 (.cutY 32448 .full .full) (.cutY 32448 .full .full))) (.cutY 32384 (.cutX 12736 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 12768 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) (.cutX 12768 (.cutY 32352 .full .full) (.cutY 32352 .full .full)))) (.cutX 12736 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 (.cutX 20224 (.cutY 256 .empty (.cutX 20096 (.cutY 384 (.cutX 20032 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 20032 (.cutY 448 (.cutX 20000 (.cutY 416 .full .full) (.cutY 416 .full .full)) (.cutX 20000 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 (.cutX 20160 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 20160 (.cutY 448 .full .full) (.cutY 448 .full .full))))) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 (.cutX 32512 (.cutY 12544 .empty (.cutX 32384 (.cutY 12672 (.cutX 32320 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) (.cutX 32320 (.cutY 12736 .full (.cutX 32288 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full (.cutX 32352 (.cutY 12768 .full .full) (.cutY 12768 .full .full))))) (.cutY 12672 (.cutX 32448 (.cutY 12608 .full .full) (.cutY 12608 .full .full)) (.cutX 32448 (.cutY 12736 .full .full) (.cutY 12736 .full .full))))) .empty) .empty)) .empty)) .empty)))))) .empty))

theorem metadata53 : 0<34183877 ∧ 1<128 ∧ 78<128 ∧ 0<4 ∧
    205/4160=0 ∧ 205%4160=205 ∧ ∀ i, (leaves53 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData53).mp
    (by decide +kernel)

theorem sourceChecked53_0 : ∀ i : Fin 64,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked53_64 : ∀ i : Fin 24,
    (fun i => output53 i = raw53 (source53 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked53 : ∀ i : Fin 88, (fun i => output53 i = raw53 (source53 i)) i :=
  forallFin_of_zero_offset (fun i => output53 i = raw53 (source53 i)) (forallFinOffset_add (fun i => output53 i = raw53 (source53 i)) 0 64 24 (by decide) sourceChecked53_0
    sourceChecked53_64)

theorem coverChecked53_0 : ∀ i : Fin 64,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked53_64 : ∀ i : Fin 24,
    (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked53 : ∀ i : Fin 88, (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) i :=
  forallFin_of_zero_offset (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) (forallFinOffset_add (fun i => (output53 (cover53 i)).ContainsBox (raw53 i)) 0 64 24 (by decide) coverChecked53_0
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 7142, atom 576, type 0, source (4,80).
def leavesData54 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves54 : Fin 13 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 4 80 leaves54 i
def outputData54 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1024,1088,20480,20544⟩) (.node (.single ⟨1024,1088,20544,20608⟩) (.single ⟨1088,1152,20480,20544⟩))) (.node (.single ⟨1088,1152,20544,20608⟩) (.node (.single ⟨1024,1152,20608,20736⟩) (.single ⟨1152,1216,20480,20544⟩)))) (.node (.node (.single ⟨1152,1216,20544,20608⟩) (.node (.single ⟨1216,1280,20480,20544⟩) (.single ⟨1216,1280,20544,20608⟩))) (.node (.node (.single ⟨1152,1216,20608,20672⟩) (.single ⟨1152,1216,20672,20736⟩)) (.node (.single ⟨1216,1280,20608,20672⟩) (.single ⟨1216,1280,20672,20736⟩))))) (.node (.node (.node (.single ⟨12032,12096,31488,31552⟩) (.node (.single ⟨12032,12096,31552,31616⟩) (.single ⟨12096,12160,31488,31552⟩))) (.node (.single ⟨12096,12160,31552,31616⟩) (.node (.single ⟨12032,12160,31616,31744⟩) (.single ⟨12160,12224,31488,31552⟩)))) (.node (.node (.single ⟨12160,12224,31552,31616⟩) (.node (.single ⟨12224,12288,31488,31552⟩) (.single ⟨12224,12288,31552,31616⟩))) (.node (.node (.single ⟨12160,12224,31616,31680⟩) (.single ⟨12160,12224,31680,31744⟩)) (.node (.single ⟨12224,12288,31616,31680⟩) (.single ⟨12224,12288,31680,31744⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,1024,1088⟩) (.node (.single ⟨20480,20544,1088,1152⟩) (.single ⟨20544,20608,1024,1088⟩))) (.node (.single ⟨20544,20608,1088,1152⟩) (.node (.single ⟨20480,20544,1152,1216⟩) (.single ⟨20480,20544,1216,1280⟩)))) (.node (.node (.single ⟨20544,20608,1152,1216⟩) (.node (.single ⟨20544,20608,1216,1280⟩) (.single ⟨20608,20736,1024,1152⟩))) (.node (.node (.single ⟨20608,20672,1152,1216⟩) (.single ⟨20608,20672,1216,1280⟩)) (.node (.single ⟨20672,20736,1152,1216⟩) (.single ⟨20672,20736,1216,1280⟩))))) (.node (.node (.node (.single ⟨31488,31552,12032,12096⟩) (.node (.single ⟨31488,31552,12096,12160⟩) (.single ⟨31552,31616,12032,12096⟩))) (.node (.single ⟨31552,31616,12096,12160⟩) (.node (.single ⟨31488,31552,12160,12224⟩) (.single ⟨31488,31552,12224,12288⟩)))) (.node (.node (.single ⟨31552,31616,12160,12224⟩) (.node (.single ⟨31552,31616,12224,12288⟩) (.single ⟨31616,31744,12032,12160⟩))) (.node (.node (.single ⟨31616,31680,12160,12224⟩) (.single ⟨31616,31680,12224,12288⟩)) (.node (.single ⟨31680,31744,12160,12224⟩) (.single ⟨31680,31744,12224,12288⟩)))))))
def output54 : Fin 52 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 34) (.single 47))) (.node (.single 17) (.node (.single 0) (.single 26)))) (.node (.node (.single 51) (.node (.single 25) (.single 1))) (.node (.node (.single 28) (.single 50)) (.node (.single 23) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 29) (.single 48)))) (.node (.node (.single 22) (.node (.single 5) (.single 30))) (.node (.node (.single 46) (.single 21)) (.node (.single 6) (.single 32)))))) (.node (.node (.node (.node (.single 45) (.node (.single 19) (.single 7))) (.node (.single 31) (.node (.single 44) (.single 20)))) (.node (.node (.single 8) (.node (.single 33) (.single 43))) (.node (.node (.single 18) (.single 9)) (.node (.single 35) (.single 42))))) (.node (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.single 41) (.node (.single 14) (.single 11)))) (.node (.node (.single 36) (.node (.single 40) (.single 15))) (.node (.node (.single 12) (.single 38)) (.node (.single 39) (.single 13)))))))
def sourceData54 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 8) (.single 12))) (.node (.single 16) (.node (.single 0) (.single 20)))) (.node (.node (.single 24) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 44) (.single 48))))) (.node (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.single 39) (.node (.single 3) (.single 35)))) (.node (.node (.single 27) (.node (.single 31) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 5) (.node (.single 13) (.single 9))) (.node (.single 17) (.node (.single 21) (.single 29)))) (.node (.node (.single 25) (.node (.single 33) (.single 1))) (.node (.node (.single 37) (.single 45)) (.node (.single 41) (.single 49))))) (.node (.node (.node (.single 50) (.node (.single 46) (.single 42))) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover54 (i : Fin 52) : Fin 52 := ⟨coverData54.get i % 52, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 52) : Fin 52 := ⟨sourceData54.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 (.cutY 22528 (.cutX 1024 .empty (.cutY 21504 (.cutX 1536 (.cutY 20992 (.cutX 1280 (.cutY 20736 (.cutX 1152 (.cutY 20608 (.cutX 1088 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 1216 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) (.cutX 1216 (.cutY 20672 .full .full) (.cutY 20672 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 .empty (.cutX 11264 .empty (.cutY 31744 (.cutX 11776 .empty (.cutY 31232 .empty (.cutX 12032 .empty (.cutY 31488 .empty (.cutX 12160 (.cutY 31616 (.cutX 12096 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full) (.cutY 31616 (.cutX 12224 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) (.cutX 12224 (.cutY 31680 .full .full) (.cutY 31680 .full .full)))))))) .empty))))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 (.cutX 21504 (.cutY 1024 .empty (.cutX 20992 (.cutY 1536 (.cutX 20736 (.cutY 1280 (.cutX 20608 (.cutY 1152 (.cutX 20544 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 20544 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full (.cutX 20672 (.cutY 1216 .full .full) (.cutY 1216 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 .empty (.cutY 10240 .empty (.cutX 31744 (.cutY 11264 .empty (.cutX 31232 .empty (.cutY 11776 .empty (.cutX 31488 .empty (.cutY 12032 .empty (.cutX 31616 (.cutY 12160 (.cutX 31552 (.cutY 12096 .full .full) (.cutY 12096 .full .full)) (.cutX 31552 (.cutY 12224 .full .full) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 31680 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))))) .empty))) .empty)))) .empty))

theorem metadata54 : 0<25614016 ∧ 4<128 ∧ 80<128 ∧ 0<4 ∧
    576/4160=0 ∧ 576%4160=576 ∧ ∀ i, (leaves54 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData54).mp
    (by decide +kernel)

theorem sourceChecked54_0 : ∀ i : Fin 52,
    (fun i => output54 i = raw54 (source54 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked54 : ∀ i : Fin 52, (fun i => output54 i = raw54 (source54 i)) i :=
  forallFin_of_zero_offset (fun i => output54 i = raw54 (source54 i)) sourceChecked54_0

theorem coverChecked54_0 : ∀ i : Fin 52,
    (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked54 : ∀ i : Fin 52, (fun i => (output54 (cover54 i)).ContainsBox (raw54 i)) i :=
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (25614016/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (400219/25600000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 7143, atom 331, type 0, source (2,79).
def leavesData55 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves55 : Fin 10 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 2 79 leaves55 i
def outputData55 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨512,576,20224,20288⟩) (.single ⟨512,576,20288,20352⟩)) (.node (.single ⟨576,640,20224,20288⟩) (.node (.single ⟨576,640,20288,20352⟩) (.single ⟨512,640,20352,20480⟩)))) (.node (.node (.single ⟨640,704,20224,20288⟩) (.single ⟨640,704,20288,20352⟩)) (.node (.single ⟨704,768,20224,20288⟩) (.node (.single ⟨704,768,20288,20352⟩) (.single ⟨640,768,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,32000,32128⟩) (.single ⟨12288,12416,32128,32256⟩)) (.node (.single ⟨12416,12480,32000,32064⟩) (.node (.single ⟨12416,12480,32064,32128⟩) (.single ⟨12480,12544,32000,32064⟩)))) (.node (.node (.single ⟨12480,12544,32064,32128⟩) (.single ⟨12416,12480,32128,32192⟩)) (.node (.single ⟨12416,12480,32192,32256⟩) (.node (.single ⟨12480,12544,32128,32192⟩) (.single ⟨12480,12544,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,512,576⟩) (.single ⟨20224,20288,576,640⟩)) (.node (.single ⟨20288,20352,512,576⟩) (.node (.single ⟨20288,20352,576,640⟩) (.single ⟨20224,20288,640,704⟩)))) (.node (.node (.single ⟨20224,20288,704,768⟩) (.single ⟨20288,20352,640,704⟩)) (.node (.single ⟨20288,20352,704,768⟩) (.node (.single ⟨20352,20480,512,640⟩) (.single ⟨20352,20480,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,12288,12416⟩) (.single ⟨32000,32064,12416,12480⟩)) (.node (.single ⟨32000,32064,12480,12544⟩) (.node (.single ⟨32064,32128,12416,12480⟩) (.single ⟨32064,32128,12480,12544⟩)))) (.node (.node (.single ⟨32128,32256,12288,12416⟩) (.single ⟨32128,32192,12416,12480⟩)) (.node (.single ⟨32128,32192,12480,12544⟩) (.node (.single ⟨32192,32256,12416,12480⟩) (.single ⟨32192,32256,12480,12544⟩)))))))
def output55 : Fin 40 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData55 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover55 (i : Fin 40) : Fin 40 := ⟨coverData55.get i % 40, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 40) : Fin 40 := ⟨sourceData55.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 .empty (.cutY 19968 .empty (.cutX 768 (.cutY 20224 .empty (.cutX 640 (.cutY 20352 (.cutX 576 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 704 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full))) .empty)))) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 (.cutX 12544 (.cutY 32000 .empty (.cutX 12416 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 12480 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) (.cutX 12480 (.cutY 32192 .full .full) (.cutY 32192 .full .full))))) .empty) .empty) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 .empty (.cutX 20224 .empty (.cutY 768 (.cutX 20352 (.cutY 640 (.cutX 20288 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 20288 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty)))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 (.cutY 12800 (.cutX 32000 .empty (.cutY 12544 (.cutX 32128 (.cutY 12416 .full (.cutX 32064 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 32192 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty)) .empty) .empty) .empty)) .empty)))))) .empty))

theorem metadata55 : 0<34183877 ∧ 2<128 ∧ 79<128 ∧ 0<4 ∧
    331/4160=0 ∧ 331%4160=331 ∧ ∀ i, (leaves55 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData55).mp
    (by decide +kernel)

theorem sourceChecked55_0 : ∀ i : Fin 40,
    (fun i => output55 i = raw55 (source55 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked55 : ∀ i : Fin 40, (fun i => output55 i = raw55 (source55 i)) i :=
  forallFin_of_zero_offset (fun i => output55 i = raw55 (source55 i)) sourceChecked55_0

theorem coverChecked55_0 : ∀ i : Fin 40,
    (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked55 : ∀ i : Fin 40, (fun i => (output55 (cover55 i)).ContainsBox (raw55 i)) i :=
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 7144, atom 10596, type 2, source (21,29).
def leavesData56 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves56 : Fin 4 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 21 29 leaves56 i
def outputData56 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5376,5504,7424,7552⟩) (.single ⟨5376,5504,7552,7680⟩)) (.node (.single ⟨5504,5632,7424,7552⟩) (.single ⟨5504,5632,7552,7680⟩))) (.node (.node (.single ⟨7424,7552,5376,5504⟩) (.single ⟨7424,7552,5504,5632⟩)) (.node (.single ⟨7552,7680,5376,5504⟩) (.single ⟨7552,7680,5504,5632⟩)))) (.node (.node (.node (.single ⟨25088,25216,27136,27264⟩) (.single ⟨25088,25216,27264,27392⟩)) (.node (.single ⟨25216,25344,27136,27264⟩) (.single ⟨25216,25344,27264,27392⟩))) (.node (.node (.single ⟨27136,27264,25088,25216⟩) (.single ⟨27136,27264,25216,25344⟩)) (.node (.single ⟨27264,27392,25088,25216⟩) (.single ⟨27264,27392,25216,25344⟩)))))
def output56 : Fin 16 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData56 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover56 (i : Fin 16) : Fin 16 := ⟨coverData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 16) : Fin 16 := ⟨sourceData56.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 .empty (.cutX 5632 (.cutY 7680 (.cutX 5376 .empty (.cutY 7424 .empty (.cutX 5504 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty) .empty)))) (.cutY 6144 (.cutX 7168 .empty (.cutY 5120 .empty (.cutX 7680 (.cutY 5632 (.cutX 7424 .empty (.cutY 5376 .empty (.cutX 7552 (.cutY 5504 .full .full) (.cutY 5504 .full .full)))) .empty) .empty))) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 (.cutY 27648 (.cutX 25088 .empty (.cutY 27136 .empty (.cutX 25344 (.cutY 27392 (.cutX 25216 (.cutY 27264 .full .full) (.cutY 27264 .full .full)) .empty) .empty))) .empty) .empty)) (.cutY 26624 (.cutX 27648 (.cutY 25600 (.cutX 27136 .empty (.cutY 25088 .empty (.cutX 27392 (.cutY 25344 (.cutX 27264 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty)))))

theorem metadata56 : 0<76869833 ∧ 21<128 ∧ 29<128 ∧ 2<4 ∧
    10596/4160=2 ∧ 10596%4160=2276 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 7145, atom 11780, type 2, source (38,40).
def leavesData57 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves57 : Fin 4 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 40 leaves57 i
def outputData57 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,10240,10368⟩) (.single ⟨9728,9856,10368,10496⟩)) (.node (.single ⟨9856,9984,10240,10368⟩) (.single ⟨9856,9984,10368,10496⟩))) (.node (.node (.single ⟨10240,10368,9728,9856⟩) (.single ⟨10240,10368,9856,9984⟩)) (.node (.single ⟨10368,10496,9728,9856⟩) (.single ⟨10368,10496,9856,9984⟩)))) (.node (.node (.node (.single ⟨22272,22400,22784,22912⟩) (.single ⟨22272,22400,22912,23040⟩)) (.node (.single ⟨22400,22528,22784,22912⟩) (.single ⟨22400,22528,22912,23040⟩))) (.node (.node (.single ⟨22784,22912,22272,22400⟩) (.single ⟨22784,22912,22400,22528⟩)) (.node (.single ⟨22912,23040,22272,22400⟩) (.single ⟨22912,23040,22400,22528⟩)))))
def output57 : Fin 16 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData57 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover57 (i : Fin 16) : Fin 16 := ⟨coverData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 16) : Fin 16 := ⟨sourceData57.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 (.cutY 10496 (.cutX 9856 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty) .empty) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 (.cutY 9984 (.cutX 10368 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 .empty (.cutY 22784 .empty (.cutX 22400 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 .empty (.cutY 22272 .empty (.cutX 22912 (.cutY 22400 .full .full) (.cutY 22400 .full .full))))) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata57 : 0<6106570 ∧ 38<128 ∧ 40<128 ∧ 2<4 ∧
    11780/4160=2 ∧ 11780%4160=3460 ∧ ∀ i, (leaves57 i).Valid 8 := by
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (6106570/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (610657/163840000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 7146, atom 11727, type 2, source (37,40).
def leavesData58 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves58 : Fin 4 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 40 leaves58 i
def outputData58 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,10240,10368⟩) (.single ⟨9472,9600,10368,10496⟩)) (.node (.single ⟨9600,9728,10240,10368⟩) (.single ⟨9600,9728,10368,10496⟩))) (.node (.node (.single ⟨10240,10368,9472,9600⟩) (.single ⟨10240,10368,9600,9728⟩)) (.node (.single ⟨10368,10496,9472,9600⟩) (.single ⟨10368,10496,9600,9728⟩)))) (.node (.node (.node (.single ⟨22272,22400,23040,23168⟩) (.single ⟨22272,22400,23168,23296⟩)) (.node (.single ⟨22400,22528,23040,23168⟩) (.single ⟨22400,22528,23168,23296⟩))) (.node (.node (.single ⟨23040,23168,22272,22400⟩) (.single ⟨23040,23168,22400,22528⟩)) (.node (.single ⟨23168,23296,22272,22400⟩) (.single ⟨23168,23296,22400,22528⟩)))))
def output58 : Fin 16 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData58 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover58 (i : Fin 16) : Fin 16 := ⟨coverData58.get i % 16, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 16) : Fin 16 := ⟨sourceData58.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 (.cutY 10752 (.cutX 9472 .empty (.cutY 10496 (.cutX 9600 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 (.cutX 10496 (.cutY 9472 .empty (.cutX 10368 (.cutY 9600 .full .full) (.cutY 9600 .full .full))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 .empty (.cutX 22272 .empty (.cutY 23296 (.cutX 22400 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty)))) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 .empty (.cutY 22016 .empty (.cutX 23296 (.cutY 22272 .empty (.cutX 23168 (.cutY 22400 .full .full) (.cutY 22400 .full .full))) .empty)))) .empty) .empty)))) .empty) .empty)))

theorem metadata58 : 0<6106570 ∧ 37<128 ∧ 40<128 ∧ 2<4 ∧
    11727/4160=2 ∧ 11727%4160=3407 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (6106570/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (610657/163840000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 7147, atom 11831, type 2, source (39,40).
def leavesData59 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves59 : Fin 4 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 39 40 leaves59 i
def outputData59 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9984,10112,10240,10368⟩) (.single ⟨9984,10112,10368,10496⟩)) (.node (.single ⟨10112,10240,10240,10368⟩) (.single ⟨10112,10240,10368,10496⟩))) (.node (.node (.single ⟨10240,10368,9984,10112⟩) (.single ⟨10240,10368,10112,10240⟩)) (.node (.single ⟨10368,10496,9984,10112⟩) (.single ⟨10368,10496,10112,10240⟩)))) (.node (.node (.node (.single ⟨22272,22400,22528,22656⟩) (.single ⟨22272,22400,22656,22784⟩)) (.node (.single ⟨22400,22528,22528,22656⟩) (.single ⟨22400,22528,22656,22784⟩))) (.node (.node (.single ⟨22528,22656,22272,22400⟩) (.single ⟨22528,22656,22400,22528⟩)) (.node (.single ⟨22656,22784,22272,22400⟩) (.single ⟨22656,22784,22400,22528⟩)))))
def output59 : Fin 16 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover59 (i : Fin 16) : Fin 16 := ⟨coverData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 16) : Fin 16 := ⟨sourceData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 .empty (.cutY 10752 (.cutX 9984 .empty (.cutY 10496 (.cutX 10112 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty)) .empty)) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 .empty (.cutX 10496 (.cutY 9984 .empty (.cutX 10368 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 (.cutX 22272 .empty (.cutY 22784 (.cutX 22400 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty)) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 (.cutY 22016 .empty (.cutX 22784 (.cutY 22272 .empty (.cutX 22656 (.cutY 22400 .full .full) (.cutY 22400 .full .full))) .empty)) .empty)) .empty) .empty)))) .empty) .empty)))

theorem metadata59 : 0<6106570 ∧ 39<128 ∧ 40<128 ∧ 2<4 ∧
    11831/4160=2 ∧ 11831%4160=3511 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (6106570/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (610657/163840000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 7148, atom 10233, type 2, source (17,26).
def leavesData60 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves60 : Fin 4 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 26 leaves60 i
def outputData60 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,6656,6784⟩) (.single ⟨4352,4480,6784,6912⟩)) (.node (.single ⟨4480,4608,6656,6784⟩) (.single ⟨4480,4608,6784,6912⟩))) (.node (.node (.single ⟨6656,6784,4352,4480⟩) (.single ⟨6656,6784,4480,4608⟩)) (.node (.single ⟨6784,6912,4352,4480⟩) (.single ⟨6784,6912,4480,4608⟩)))) (.node (.node (.node (.single ⟨25856,25984,28160,28288⟩) (.single ⟨25856,25984,28288,28416⟩)) (.node (.single ⟨25984,26112,28160,28288⟩) (.single ⟨25984,26112,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,25856,25984⟩) (.single ⟨28160,28288,25984,26112⟩)) (.node (.single ⟨28288,28416,25856,25984⟩) (.single ⟨28288,28416,25984,26112⟩)))))
def output60 : Fin 16 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover60 (i : Fin 16) : Fin 16 := ⟨coverData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 16) : Fin 16 := ⟨sourceData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 (.cutY 7168 (.cutX 4608 (.cutY 6656 .empty (.cutX 4352 .empty (.cutY 6912 (.cutX 4480 (.cutY 6784 .full .full) (.cutY 6784 .full .full)) .empty))) .empty) .empty) .empty)) (.cutY 6144 (.cutX 7168 (.cutY 5120 (.cutX 6656 .empty (.cutY 4608 (.cutX 6912 (.cutY 4352 .empty (.cutX 6784 (.cutY 4480 .full .full) (.cutY 4480 .full .full))) .empty) .empty)) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 .empty (.cutY 27648 .empty (.cutX 26112 (.cutY 28160 .empty (.cutX 25856 .empty (.cutY 28416 (.cutX 25984 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty))) .empty)))) (.cutY 26624 (.cutX 27648 .empty (.cutY 25600 .empty (.cutX 28160 .empty (.cutY 26112 (.cutX 28416 (.cutY 25856 .empty (.cutX 28288 (.cutY 25984 .full .full) (.cutY 25984 .full .full))) .empty) .empty)))) .empty)) .empty) .empty)))))

theorem metadata60 : 0<76869833 ∧ 17<128 ∧ 26<128 ∧ 2<4 ∧
    10233/4160=2 ∧ 10233%4160=1913 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 7149, atom 10040, type 2, source (15,25).
def leavesData61 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves61 : Fin 4 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 25 leaves61 i
def outputData61 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,6400,6528⟩) (.single ⟨3840,3968,6528,6656⟩)) (.node (.single ⟨3968,4096,6400,6528⟩) (.single ⟨3968,4096,6528,6656⟩))) (.node (.node (.single ⟨6400,6528,3840,3968⟩) (.single ⟨6400,6528,3968,4096⟩)) (.node (.single ⟨6528,6656,3840,3968⟩) (.single ⟨6528,6656,3968,4096⟩)))) (.node (.node (.node (.single ⟨26112,26240,28672,28800⟩) (.single ⟨26112,26240,28800,28928⟩)) (.node (.single ⟨26240,26368,28672,28800⟩) (.single ⟨26240,26368,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,26112,26240⟩) (.single ⟨28672,28800,26240,26368⟩)) (.node (.single ⟨28800,28928,26112,26240⟩) (.single ⟨28800,28928,26240,26368⟩)))))
def output61 : Fin 16 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData61 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover61 (i : Fin 16) : Fin 16 := ⟨coverData61.get i % 16, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 16) : Fin 16 := ⟨sourceData61.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 .empty (.cutX 3072 .empty (.cutY 7168 (.cutX 3584 .empty (.cutY 6656 (.cutX 3840 .empty (.cutY 6400 .empty (.cutX 3968 (.cutY 6528 .full .full) (.cutY 6528 .full .full)))) .empty)) .empty))))) (.cutY 4096 (.cutX 6144 .empty (.cutY 2048 .empty (.cutX 7168 (.cutY 3072 .empty (.cutX 6656 (.cutY 3584 .empty (.cutX 6400 .empty (.cutY 3840 .empty (.cutX 6528 (.cutY 3968 .full .full) (.cutY 3968 .full .full))))) .empty)) .empty))) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 (.cutY 30720 (.cutX 25600 .empty (.cutY 29696 (.cutX 26112 .empty (.cutY 29184 (.cutX 26368 (.cutY 28928 (.cutX 26240 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) (.cutY 28672 (.cutX 30720 (.cutY 26624 (.cutX 29696 (.cutY 25600 .empty (.cutX 29184 (.cutY 26112 .empty (.cutX 28928 (.cutY 26368 (.cutX 28800 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))))))

theorem metadata61 : 0<82727314 ∧ 15<128 ∧ 25<128 ∧ 2<4 ∧
    10040/4160=2 ∧ 10040%4160=1720 ∧ ∀ i, (leaves61 i).Valid 8 := by
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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (82727314/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (41363657/819200000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 7150, atom 11880, type 2, source (40,40).
def leavesData62 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves62 : Fin 4 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 40 40 leaves62 i
def outputData62 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨10240,10368,10240,10368⟩) (.single ⟨10240,10368,10368,10496⟩)) (.node (.single ⟨10368,10496,10240,10368⟩) (.single ⟨10368,10496,10368,10496⟩))) (.node (.node (.single ⟨22272,22400,22272,22400⟩) (.single ⟨22272,22400,22400,22528⟩)) (.node (.single ⟨22400,22528,22272,22400⟩) (.single ⟨22400,22528,22400,22528⟩))))
def output62 : Fin 8 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 0)) (.node (.single 7) (.single 7))) (.node (.node (.single 1) (.single 2)) (.node (.single 6) (.single 5)))) (.node (.node (.node (.single 2) (.single 1)) (.node (.single 5) (.single 6))) (.node (.node (.single 3) (.single 3)) (.node (.single 4) (.single 4)))))
def sourceData62 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 5) (.single 12))) (.node (.node (.single 14) (.single 7)) (.node (.single 6) (.single 2))))
def cover62 (i : Fin 16) : Fin 8 := ⟨coverData62.get i % 8, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 8) : Fin 16 := ⟨sourceData62.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 .empty (.cutY 10240 .empty (.cutX 11264 (.cutY 11264 (.cutX 10752 (.cutY 10752 (.cutX 10496 (.cutY 10496 (.cutX 10368 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 (.cutX 21504 .empty (.cutY 21504 .empty (.cutX 22016 .empty (.cutY 22016 .empty (.cutX 22272 .empty (.cutY 22272 .empty (.cutX 22400 (.cutY 22400 .full .full) (.cutY 22400 .full .full)))))))) .empty) .empty))) .empty) .empty)))

theorem metadata62 : 0<78060086 ∧ 40<128 ∧ 40<128 ∧ 2<4 ∧
    11880/4160=2 ∧ 11880%4160=3560 ∧ ∀ i, (leaves62 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData62).mp
    (by decide +kernel)

theorem sourceChecked62_0 : ∀ i : Fin 8,
    (fun i => output62 i = raw62 (source62 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked62 : ∀ i : Fin 8, (fun i => output62 i = raw62 (source62 i)) i :=
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

theorem areaUnits62 : gridUnionAreaUnits output62 = 131072 := by decide +kernel

noncomputable def phaseMass62 : ℝ := singlePhaseMass (78060086/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (39030043/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 7151, atom 11364, type 2, source (31,37).
def leavesData63 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves63 : Fin 4 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 37 leaves63 i
def outputData63 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,9472,9600⟩) (.single ⟨7936,8064,9600,9728⟩)) (.node (.single ⟨8064,8192,9472,9600⟩) (.single ⟨8064,8192,9600,9728⟩))) (.node (.node (.single ⟨9472,9600,7936,8064⟩) (.single ⟨9472,9600,8064,8192⟩)) (.node (.single ⟨9600,9728,7936,8064⟩) (.single ⟨9600,9728,8064,8192⟩)))) (.node (.node (.node (.single ⟨23040,23168,24576,24704⟩) (.single ⟨23040,23168,24704,24832⟩)) (.node (.single ⟨23168,23296,24576,24704⟩) (.single ⟨23168,23296,24704,24832⟩))) (.node (.node (.single ⟨24576,24704,23040,23168⟩) (.single ⟨24576,24704,23168,23296⟩)) (.node (.single ⟨24704,24832,23040,23168⟩) (.single ⟨24704,24832,23168,23296⟩)))))
def output63 : Fin 16 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData63 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover63 (i : Fin 16) : Fin 16 := ⟨coverData63.get i % 16, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 16) : Fin 16 := ⟨sourceData63.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 .empty (.cutX 7680 .empty (.cutY 9728 (.cutX 7936 .empty (.cutY 9472 .empty (.cutX 8064 (.cutY 9600 .full .full) (.cutY 9600 .full .full)))) .empty)))) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 .empty (.cutY 7168 .empty (.cutX 9728 (.cutY 7680 .empty (.cutX 9472 .empty (.cutY 7936 .empty (.cutX 9600 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 (.cutY 25600 (.cutX 23040 .empty (.cutY 25088 (.cutX 23296 (.cutY 24832 (.cutX 23168 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 (.cutX 25088 (.cutY 23040 .empty (.cutX 24832 (.cutY 23296 (.cutX 24704 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty))))

theorem metadata63 : 0<43243096 ∧ 31<128 ∧ 37<128 ∧ 2<4 ∧
    11364/4160=2 ∧ 11364%4160=3044 ∧ ∀ i, (leaves63 i).Valid 8 := by
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 7152, atom 11555, type 2, source (34,39).
def leavesData64 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves64 : Fin 4 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 39 leaves64 i
def outputData64 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,9984,10112⟩) (.single ⟨8704,8832,10112,10240⟩)) (.node (.single ⟨8832,8960,9984,10112⟩) (.single ⟨8832,8960,10112,10240⟩))) (.node (.node (.single ⟨9984,10112,8704,8832⟩) (.single ⟨9984,10112,8832,8960⟩)) (.node (.single ⟨10112,10240,8704,8832⟩) (.single ⟨10112,10240,8832,8960⟩)))) (.node (.node (.node (.single ⟨22528,22656,23808,23936⟩) (.single ⟨22528,22656,23936,24064⟩)) (.node (.single ⟨22656,22784,23808,23936⟩) (.single ⟨22656,22784,23936,24064⟩))) (.node (.node (.single ⟨23808,23936,22528,22656⟩) (.single ⟨23808,23936,22656,22784⟩)) (.node (.single ⟨23936,24064,22528,22656⟩) (.single ⟨23936,24064,22656,22784⟩)))))
def output64 : Fin 16 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData64 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover64 (i : Fin 16) : Fin 16 := ⟨coverData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 16) : Fin 16 := ⟨sourceData64.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 .empty (.cutY 9728 .empty (.cutX 8960 (.cutY 9984 .empty (.cutX 8832 (.cutY 10112 .full .full) (.cutY 10112 .full .full))) .empty)))) (.cutY 9216 (.cutX 9728 .empty (.cutY 8704 .empty (.cutX 9984 .empty (.cutY 8960 (.cutX 10112 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 (.cutY 24064 (.cutX 22784 (.cutY 23808 .empty (.cutX 22656 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty)) (.cutY 23552 (.cutX 24064 (.cutY 23040 (.cutX 23808 .empty (.cutY 22784 (.cutX 23936 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty)) .empty) .empty) .empty)))))) .empty) .empty)))

theorem metadata64 : 0<89641976 ∧ 34<128 ∧ 39<128 ∧ 2<4 ∧
    11555/4160=2 ∧ 11555%4160=3235 ∧ ∀ i, (leaves64 i).Valid 8 := by
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (89641976/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (11205247/204800000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 7153, atom 11081, type 2, source (27,34).
def leavesData65 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves65 : Fin 4 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 27 34 leaves65 i
def outputData65 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6912,7040,8704,8832⟩) (.single ⟨6912,7040,8832,8960⟩)) (.node (.single ⟨7040,7168,8704,8832⟩) (.single ⟨7040,7168,8832,8960⟩))) (.node (.node (.single ⟨8704,8832,6912,7040⟩) (.single ⟨8704,8832,7040,7168⟩)) (.node (.single ⟨8832,8960,6912,7040⟩) (.single ⟨8832,8960,7040,7168⟩)))) (.node (.node (.node (.single ⟨23808,23936,25600,25728⟩) (.single ⟨23808,23936,25728,25856⟩)) (.node (.single ⟨23936,24064,25600,25728⟩) (.single ⟨23936,24064,25728,25856⟩))) (.node (.node (.single ⟨25600,25728,23808,23936⟩) (.single ⟨25600,25728,23936,24064⟩)) (.node (.single ⟨25728,25856,23808,23936⟩) (.single ⟨25728,25856,23936,24064⟩)))))
def output65 : Fin 16 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData65 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover65 (i : Fin 16) : Fin 16 := ⟨coverData65.get i % 16, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 16) : Fin 16 := ⟨sourceData65.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 (.cutY 9216 (.cutX 6656 .empty (.cutY 8704 .empty (.cutX 6912 .empty (.cutY 8960 (.cutX 7040 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty) .empty) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 (.cutX 8704 .empty (.cutY 6656 .empty (.cutX 8960 (.cutY 6912 .empty (.cutX 8832 (.cutY 7040 .full .full) (.cutY 7040 .full .full))) .empty))) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 .empty (.cutX 24064 (.cutY 26112 (.cutX 23808 .empty (.cutY 25856 (.cutX 23936 (.cutY 25728 .full .full) (.cutY 25728 .full .full)) .empty)) .empty) .empty))) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 .empty (.cutY 23552 .empty (.cutX 26112 (.cutY 24064 (.cutX 25856 (.cutY 23808 .empty (.cutX 25728 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty)))) .empty)) .empty) .empty))))

theorem metadata65 : 0<43243096 ∧ 27<128 ∧ 34<128 ∧ 2<4 ∧
    11081/4160=2 ∧ 11081%4160=2761 ∧ ∀ i, (leaves65 i).Valid 8 := by
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 7154, atom 10682, type 2, source (22,30).
def leavesData66 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves66 : Fin 4 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 22 30 leaves66 i
def outputData66 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5632,5760,7680,7808⟩) (.single ⟨5632,5760,7808,7936⟩)) (.node (.single ⟨5760,5888,7680,7808⟩) (.single ⟨5760,5888,7808,7936⟩))) (.node (.node (.single ⟨7680,7808,5632,5760⟩) (.single ⟨7680,7808,5760,5888⟩)) (.node (.single ⟨7808,7936,5632,5760⟩) (.single ⟨7808,7936,5760,5888⟩)))) (.node (.node (.node (.single ⟨24832,24960,26880,27008⟩) (.single ⟨24832,24960,27008,27136⟩)) (.node (.single ⟨24960,25088,26880,27008⟩) (.single ⟨24960,25088,27008,27136⟩))) (.node (.node (.single ⟨26880,27008,24832,24960⟩) (.single ⟨26880,27008,24960,25088⟩)) (.node (.single ⟨27008,27136,24832,24960⟩) (.single ⟨27008,27136,24960,25088⟩)))))
def output66 : Fin 16 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData66 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover66 (i : Fin 16) : Fin 16 := ⟨coverData66.get i % 16, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 16) : Fin 16 := ⟨sourceData66.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 .empty (.cutX 5632 .empty (.cutY 7680 .empty (.cutX 5888 (.cutY 7936 (.cutX 5760 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty) .empty)))))) (.cutY 6144 (.cutX 7168 .empty (.cutY 5120 .empty (.cutX 7680 .empty (.cutY 5632 .empty (.cutX 7936 (.cutY 5888 (.cutX 7808 (.cutY 5760 .full .full) (.cutY 5760 .full .full)) .empty) .empty))))) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 (.cutY 27648 (.cutX 25088 (.cutY 27136 (.cutX 24832 .empty (.cutY 26880 .empty (.cutX 24960 (.cutY 27008 .full .full) (.cutY 27008 .full .full)))) .empty) .empty) .empty) .empty)) (.cutY 26624 (.cutX 27648 (.cutY 25600 (.cutX 27136 (.cutY 25088 (.cutX 26880 .empty (.cutY 24832 .empty (.cutX 27008 (.cutY 24960 .full .full) (.cutY 24960 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))))

theorem metadata66 : 0<76869833 ∧ 22<128 ∧ 30<128 ∧ 2<4 ∧
    10682/4160=2 ∧ 10682%4160=2362 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 7155, atom 10766, type 2, source (23,31).
def leavesData67 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves67 : Fin 4 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 23 31 leaves67 i
def outputData67 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5888,6016,7936,8064⟩) (.single ⟨5888,6016,8064,8192⟩)) (.node (.single ⟨6016,6144,7936,8064⟩) (.single ⟨6016,6144,8064,8192⟩))) (.node (.node (.single ⟨7936,8064,5888,6016⟩) (.single ⟨7936,8064,6016,6144⟩)) (.node (.single ⟨8064,8192,5888,6016⟩) (.single ⟨8064,8192,6016,6144⟩)))) (.node (.node (.node (.single ⟨24576,24704,26624,26752⟩) (.single ⟨24576,24704,26752,26880⟩)) (.node (.single ⟨24704,24832,26624,26752⟩) (.single ⟨24704,24832,26752,26880⟩))) (.node (.node (.single ⟨26624,26752,24576,24704⟩) (.single ⟨26624,26752,24704,24832⟩)) (.node (.single ⟨26752,26880,24576,24704⟩) (.single ⟨26752,26880,24704,24832⟩)))))
def output67 : Fin 16 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData67 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover67 (i : Fin 16) : Fin 16 := ⟨coverData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 16) : Fin 16 := ⟨sourceData67.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 .empty (.cutY 4096 .empty (.cutX 6144 (.cutY 6144 .empty (.cutX 5120 .empty (.cutY 7168 .empty (.cutX 5632 .empty (.cutY 7680 .empty (.cutX 5888 .empty (.cutY 7936 .empty (.cutX 6016 (.cutY 8064 .full .full) (.cutY 8064 .full .full))))))))) (.cutY 6144 (.cutX 7168 .empty (.cutY 5120 .empty (.cutX 7680 .empty (.cutY 5632 .empty (.cutX 7936 .empty (.cutY 5888 .empty (.cutX 8064 (.cutY 6016 .full .full) (.cutY 6016 .full .full)))))))) .empty)))) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 (.cutX 26624 (.cutY 26624 .empty (.cutX 25600 (.cutY 27648 (.cutX 25088 (.cutY 27136 (.cutX 24832 (.cutY 26880 (.cutX 24704 (.cutY 26752 .full .full) (.cutY 26752 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) (.cutY 26624 (.cutX 27648 (.cutY 25600 (.cutX 27136 (.cutY 25088 (.cutX 26880 (.cutY 24832 (.cutX 26752 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))))

theorem metadata67 : 0<76869833 ∧ 23<128 ∧ 31<128 ∧ 2<4 ∧
    10766/4160=2 ∧ 10766%4160=2446 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (76869833/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (76869833/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 7156, atom 9630, type 2, source (11,23).
def leavesData68 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves68 : Fin 4 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 23 leaves68 i
def outputData68 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,5888,6016⟩) (.single ⟨2816,2944,6016,6144⟩)) (.node (.single ⟨2944,3072,5888,6016⟩) (.single ⟨2944,3072,6016,6144⟩))) (.node (.node (.single ⟨5888,6016,2816,2944⟩) (.single ⟨5888,6016,2944,3072⟩)) (.node (.single ⟨6016,6144,2816,2944⟩) (.single ⟨6016,6144,2944,3072⟩)))) (.node (.node (.node (.single ⟨26624,26752,29696,29824⟩) (.single ⟨26624,26752,29824,29952⟩)) (.node (.single ⟨26752,26880,29696,29824⟩) (.single ⟨26752,26880,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,26624,26752⟩) (.single ⟨29696,29824,26752,26880⟩)) (.node (.single ⟨29824,29952,26624,26752⟩) (.single ⟨29824,29952,26752,26880⟩)))))
def output68 : Fin 16 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover68 (i : Fin 16) : Fin 16 := ⟨coverData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 16) : Fin 16 := ⟨sourceData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 (.cutX 4096 (.cutY 4096 .empty (.cutX 2048 .empty (.cutY 6144 (.cutX 3072 (.cutY 5120 .empty (.cutX 2560 .empty (.cutY 5632 .empty (.cutX 2816 .empty (.cutY 5888 .empty (.cutX 2944 (.cutY 6016 .full .full) (.cutY 6016 .full .full))))))) .empty) .empty))) (.cutY 4096 (.cutX 6144 (.cutY 2048 .empty (.cutX 5120 .empty (.cutY 3072 (.cutX 5632 .empty (.cutY 2560 .empty (.cutX 5888 .empty (.cutY 2816 .empty (.cutX 6016 (.cutY 2944 .full .full) (.cutY 2944 .full .full)))))) .empty))) .empty) .empty)) .empty) .empty) .empty) (.cutY 16384 .empty (.cutX 24576 .empty (.cutY 24576 .empty (.cutX 28672 (.cutY 28672 .empty (.cutX 26624 .empty (.cutY 30720 (.cutX 27648 (.cutY 29696 .empty (.cutX 27136 (.cutY 30208 (.cutX 26880 (.cutY 29952 (.cutX 26752 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty))) (.cutY 28672 (.cutX 30720 (.cutY 26624 .empty (.cutX 29696 .empty (.cutY 27648 (.cutX 30208 (.cutY 27136 (.cutX 29952 (.cutY 26880 (.cutX 29824 (.cutY 26752 .full .full) (.cutY 26752 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty))))))

theorem metadata68 : 0<135972718 ∧ 11<128 ∧ 23<128 ∧ 2<4 ∧
    9630/4160=2 ∧ 9630%4160=1310 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (135972718/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (67986359/819200000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 7157, atom 11430, type 2, source (32,38).
def leavesData69 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves69 : Fin 4 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 38 leaves69 i
def outputData69 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,9728,9856⟩) (.single ⟨8192,8320,9856,9984⟩)) (.node (.single ⟨8320,8448,9728,9856⟩) (.single ⟨8320,8448,9856,9984⟩))) (.node (.node (.single ⟨9728,9856,8192,8320⟩) (.single ⟨9728,9856,8320,8448⟩)) (.node (.single ⟨9856,9984,8192,8320⟩) (.single ⟨9856,9984,8320,8448⟩)))) (.node (.node (.node (.single ⟨22784,22912,24320,24448⟩) (.single ⟨22784,22912,24448,24576⟩)) (.node (.single ⟨22912,23040,24320,24448⟩) (.single ⟨22912,23040,24448,24576⟩))) (.node (.node (.single ⟨24320,24448,22784,22912⟩) (.single ⟨24320,24448,22912,23040⟩)) (.node (.single ⟨24448,24576,22784,22912⟩) (.single ⟨24448,24576,22912,23040⟩)))))
def output69 : Fin 16 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover69 (i : Fin 16) : Fin 16 := ⟨coverData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 16) : Fin 16 := ⟨sourceData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 (.cutX 9216 (.cutY 9216 .empty (.cutX 8704 (.cutY 9728 .empty (.cutX 8448 (.cutY 9984 (.cutX 8320 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty)) .empty)) (.cutY 9216 (.cutX 9728 .empty (.cutY 8704 (.cutX 9984 (.cutY 8448 (.cutX 9856 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 .empty (.cutY 22528 .empty (.cutX 23552 (.cutY 23552 .empty (.cutX 23040 (.cutY 24064 .empty (.cutX 22784 .empty (.cutY 24320 .empty (.cutX 22912 (.cutY 24448 .full .full) (.cutY 24448 .full .full))))) .empty)) (.cutY 23552 (.cutX 24064 .empty (.cutY 23040 (.cutX 24320 .empty (.cutY 22784 .empty (.cutX 24448 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty)) .empty)))))) .empty) .empty)))

theorem metadata69 : 0<89641976 ∧ 32<128 ∧ 38<128 ∧ 2<4 ∧
    11430/4160=2 ∧ 11430%4160=3110 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (89641976/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (11205247/204800000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 7158, atom 11672, type 2, source (36,40).
def leavesData70 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves70 : Fin 4 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 40 leaves70 i
def outputData70 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,10240,10368⟩) (.single ⟨9216,9344,10368,10496⟩)) (.node (.single ⟨9344,9472,10240,10368⟩) (.single ⟨9344,9472,10368,10496⟩))) (.node (.node (.single ⟨10240,10368,9216,9344⟩) (.single ⟨10240,10368,9344,9472⟩)) (.node (.single ⟨10368,10496,9216,9344⟩) (.single ⟨10368,10496,9344,9472⟩)))) (.node (.node (.node (.single ⟨22272,22400,23296,23424⟩) (.single ⟨22272,22400,23424,23552⟩)) (.node (.single ⟨22400,22528,23296,23424⟩) (.single ⟨22400,22528,23424,23552⟩))) (.node (.node (.single ⟨23296,23424,22272,22400⟩) (.single ⟨23296,23424,22400,22528⟩)) (.node (.single ⟨23424,23552,22272,22400⟩) (.single ⟨23424,23552,22400,22528⟩)))))
def output70 : Fin 16 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover70 (i : Fin 16) : Fin 16 := ⟨coverData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 16) : Fin 16 := ⟨sourceData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 .empty (.cutY 8192 .empty (.cutX 12288 (.cutY 12288 (.cutX 10240 (.cutY 10240 .empty (.cutX 9216 .empty (.cutY 11264 (.cutX 9728 (.cutY 10752 (.cutX 9472 (.cutY 10496 (.cutX 9344 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty))) (.cutY 10240 (.cutX 11264 (.cutY 9216 .empty (.cutX 10752 (.cutY 9728 (.cutX 10496 (.cutY 9472 (.cutX 10368 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 (.cutX 20480 .empty (.cutY 20480 .empty (.cutX 22528 (.cutY 22528 .empty (.cutX 21504 .empty (.cutY 23552 (.cutX 22016 .empty (.cutY 23040 .empty (.cutX 22272 .empty (.cutY 23296 .empty (.cutX 22400 (.cutY 23424 .full .full) (.cutY 23424 .full .full)))))) .empty))) (.cutY 22528 (.cutX 23552 (.cutY 21504 .empty (.cutX 23040 .empty (.cutY 22016 .empty (.cutX 23296 .empty (.cutY 22272 .empty (.cutX 23424 (.cutY 22400 .full .full) (.cutY 22400 .full .full))))))) .empty) .empty)))) .empty) .empty)))

theorem metadata70 : 0<6106570 ∧ 36<128 ∧ 40<128 ∧ 2<4 ∧
    11672/4160=2 ∧ 11672%4160=3352 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (6106570/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (610657/163840000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 7159, atom 11155, type 2, source (28,35).
def leavesData71 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves71 : Fin 4 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 28 35 leaves71 i
def outputData71 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7168,7296,8960,9088⟩) (.single ⟨7168,7296,9088,9216⟩)) (.node (.single ⟨7296,7424,8960,9088⟩) (.single ⟨7296,7424,9088,9216⟩))) (.node (.node (.single ⟨8960,9088,7168,7296⟩) (.single ⟨8960,9088,7296,7424⟩)) (.node (.single ⟨9088,9216,7168,7296⟩) (.single ⟨9088,9216,7296,7424⟩)))) (.node (.node (.node (.single ⟨23552,23680,25344,25472⟩) (.single ⟨23552,23680,25472,25600⟩)) (.node (.single ⟨23680,23808,25344,25472⟩) (.single ⟨23680,23808,25472,25600⟩))) (.node (.node (.single ⟨25344,25472,23552,23680⟩) (.single ⟨25344,25472,23680,23808⟩)) (.node (.single ⟨25472,25600,23552,23680⟩) (.single ⟨25472,25600,23680,23808⟩)))))
def output71 : Fin 16 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData71 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover71 (i : Fin 16) : Fin 16 := ⟨coverData71.get i % 16, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 16) : Fin 16 := ⟨sourceData71.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 (.cutX 6144 .empty (.cutY 10240 (.cutX 7168 .empty (.cutY 9216 (.cutX 7680 (.cutY 8704 .empty (.cutX 7424 (.cutY 8960 .empty (.cutX 7296 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty)) .empty))) (.cutY 8192 (.cutX 12288 (.cutY 4096 .empty (.cutX 10240 (.cutY 6144 .empty (.cutX 9216 (.cutY 7168 .empty (.cutX 8704 .empty (.cutY 7680 (.cutX 8960 .empty (.cutY 7424 (.cutX 9088 (.cutY 7296 .full .full) (.cutY 7296 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 .empty (.cutY 28672 (.cutX 22528 .empty (.cutY 26624 (.cutX 23552 .empty (.cutY 25600 (.cutX 24064 (.cutY 25088 .empty (.cutX 23808 (.cutY 25344 .empty (.cutX 23680 (.cutY 25472 .full .full) (.cutY 25472 .full .full))) .empty)) .empty) .empty)) .empty)) .empty))) (.cutY 24576 (.cutX 28672 (.cutY 20480 .empty (.cutX 26624 (.cutY 22528 .empty (.cutX 25600 (.cutY 23552 .empty (.cutX 25088 .empty (.cutY 24064 (.cutX 25344 .empty (.cutY 23808 (.cutX 25472 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty) .empty))))

theorem metadata71 : 0<43243096 ∧ 28<128 ∧ 35<128 ∧ 2<4 ∧
    11155/4160=2 ∧ 11155%4160=2835 ∧ ∀ i, (leaves71 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData71).mp
    (by decide +kernel)

theorem sourceChecked71_0 : ∀ i : Fin 16,
    (fun i => output71 i = raw71 (source71 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked71 : ∀ i : Fin 16, (fun i => output71 i = raw71 (source71 i)) i :=
  forallFin_of_zero_offset (fun i => output71 i = raw71 (source71 i)) sourceChecked71_0

theorem coverChecked71_0 : ∀ i : Fin 16,
    (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked71 : ∀ i : Fin 16, (fun i => (output71 (cover71 i)).ContainsBox (raw71 i)) i :=
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (43243096/100000000 : ℝ) (2 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (5405387/204800000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 7160, atom 78, type 0, source (0,78).
def leavesData72 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves72 : Fin 10 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 78 leaves72 i
def outputData72 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,64,19968,20032⟩) (.single ⟨0,64,20032,20096⟩)) (.node (.single ⟨64,128,19968,20032⟩) (.node (.single ⟨64,128,20032,20096⟩) (.single ⟨0,128,20096,20224⟩)))) (.node (.node (.single ⟨128,192,19968,20032⟩) (.single ⟨128,192,20032,20096⟩)) (.node (.single ⟨192,256,19968,20032⟩) (.node (.single ⟨192,256,20032,20096⟩) (.single ⟨128,256,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,32512,32640⟩) (.single ⟨12544,12672,32640,32768⟩)) (.node (.single ⟨12672,12736,32512,32576⟩) (.node (.single ⟨12672,12736,32576,32640⟩) (.single ⟨12736,12800,32512,32576⟩)))) (.node (.node (.single ⟨12736,12800,32576,32640⟩) (.single ⟨12672,12736,32640,32704⟩)) (.node (.single ⟨12672,12736,32704,32768⟩) (.node (.single ⟨12736,12800,32640,32704⟩) (.single ⟨12736,12800,32704,32768⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20032,0,64⟩) (.single ⟨19968,20032,64,128⟩)) (.node (.single ⟨20032,20096,0,64⟩) (.node (.single ⟨20032,20096,64,128⟩) (.single ⟨19968,20032,128,192⟩)))) (.node (.node (.single ⟨19968,20032,192,256⟩) (.single ⟨20032,20096,128,192⟩)) (.node (.single ⟨20032,20096,192,256⟩) (.node (.single ⟨20096,20224,0,128⟩) (.single ⟨20096,20224,128,256⟩))))) (.node (.node (.node (.single ⟨32512,32640,12544,12672⟩) (.single ⟨32512,32576,12672,12736⟩)) (.node (.single ⟨32512,32576,12736,12800⟩) (.node (.single ⟨32576,32640,12672,12736⟩) (.single ⟨32576,32640,12736,12800⟩)))) (.node (.node (.single ⟨32640,32768,12544,12672⟩) (.single ⟨32640,32704,12672,12736⟩)) (.node (.single ⟨32640,32704,12736,12800⟩) (.node (.single ⟨32704,32768,12672,12736⟩) (.single ⟨32704,32768,12736,12800⟩)))))))
def output72 : Fin 40 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData72 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover72 (i : Fin 40) : Fin 40 := ⟨coverData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 40) : Fin 40 := ⟨sourceData72.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 (.cutY 19456 .empty (.cutX 512 (.cutY 19968 .empty (.cutX 256 (.cutY 20224 (.cutX 128 (.cutY 20096 (.cutX 64 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 192 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 (.cutY 31744 .empty (.cutX 12800 (.cutY 32256 .empty (.cutX 12544 .empty (.cutY 32512 .empty (.cutX 12672 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 12736 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 12736 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))) .empty)) .empty)) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 .empty (.cutY 1024 (.cutX 19968 .empty (.cutY 512 (.cutX 20224 (.cutY 256 (.cutX 20096 (.cutY 128 (.cutX 20032 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 20032 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 .empty (.cutY 13312 (.cutX 32256 .empty (.cutY 12800 (.cutX 32512 .empty (.cutY 12544 .empty (.cutX 32640 (.cutY 12672 .full (.cutX 32576 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 32704 (.cutY 12736 .full .full) (.cutY 12736 .full .full)))))) .empty)) .empty)) .empty)))))) .empty))

theorem metadata72 : 0<34183877 ∧ 0<128 ∧ 78<128 ∧ 0<4 ∧
    78/4160=0 ∧ 78%4160=78 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 7161, atom 1267, type 0, source (10,87).
def leavesData73 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,2⟩))))) (.node (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,0⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,6,2⟩))) (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))))))
def leaves73 : Fin 22 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 10 87 leaves73 i
def outputData73 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨2560,2624,22272,22336⟩) (.single ⟨2560,2624,22336,22400⟩)) (.node (.single ⟨2624,2688,22272,22336⟩) (.node (.single ⟨2624,2688,22336,22400⟩) (.single ⟨2560,2624,22400,22464⟩)))) (.node (.node (.single ⟨2560,2624,22464,22528⟩) (.node (.single ⟨2624,2688,22400,22464⟩) (.single ⟨2624,2688,22464,22528⟩))) (.node (.single ⟨2688,2752,22272,22336⟩) (.node (.single ⟨2688,2752,22336,22400⟩) (.single ⟨2752,2784,22272,22304⟩))))) (.node (.node (.node (.single ⟨2752,2784,22304,22336⟩) (.single ⟨2784,2816,22272,22304⟩)) (.node (.single ⟨2784,2816,22304,22336⟩) (.node (.single ⟨2752,2784,22336,22368⟩) (.single ⟨2752,2784,22368,22400⟩)))) (.node (.node (.single ⟨2784,2816,22336,22368⟩) (.node (.single ⟨2784,2816,22368,22400⟩) (.single ⟨2688,2752,22400,22464⟩))) (.node (.single ⟨2688,2752,22464,22528⟩) (.node (.single ⟨2752,2816,22400,22464⟩) (.single ⟨2752,2816,22464,22528⟩)))))) (.node (.node (.node (.node (.single ⟨10240,10304,29952,30016⟩) (.single ⟨10240,10304,30016,30080⟩)) (.node (.single ⟨10304,10368,29952,30016⟩) (.node (.single ⟨10304,10368,30016,30080⟩) (.single ⟨10240,10304,30080,30144⟩)))) (.node (.node (.single ⟨10240,10304,30144,30208⟩) (.node (.single ⟨10304,10368,30080,30144⟩) (.single ⟨10304,10368,30144,30208⟩))) (.node (.single ⟨10368,10400,29952,29984⟩) (.node (.single ⟨10368,10400,29984,30016⟩) (.single ⟨10400,10432,29952,29984⟩))))) (.node (.node (.node (.single ⟨10400,10432,29984,30016⟩) (.single ⟨10368,10432,30016,30080⟩)) (.node (.single ⟨10432,10464,29952,29984⟩) (.node (.single ⟨10432,10464,29984,30016⟩) (.single ⟨10464,10496,29952,29984⟩)))) (.node (.node (.single ⟨10464,10496,29984,30016⟩) (.node (.single ⟨10432,10496,30016,30080⟩) (.single ⟨10368,10432,30080,30144⟩))) (.node (.single ⟨10368,10432,30144,30208⟩) (.node (.single ⟨10432,10496,30080,30144⟩) (.single ⟨10432,10496,30144,30208⟩))))))) (.node (.node (.node (.node (.node (.single ⟨22272,22336,2560,2624⟩) (.single ⟨22272,22336,2624,2688⟩)) (.node (.single ⟨22336,22400,2560,2624⟩) (.node (.single ⟨22336,22400,2624,2688⟩) (.single ⟨22272,22336,2688,2752⟩)))) (.node (.node (.single ⟨22272,22304,2752,2784⟩) (.node (.single ⟨22272,22304,2784,2816⟩) (.single ⟨22304,22336,2752,2784⟩))) (.node (.single ⟨22304,22336,2784,2816⟩) (.node (.single ⟨22336,22400,2688,2752⟩) (.single ⟨22336,22368,2752,2784⟩))))) (.node (.node (.node (.single ⟨22336,22368,2784,2816⟩) (.single ⟨22368,22400,2752,2784⟩)) (.node (.single ⟨22368,22400,2784,2816⟩) (.node (.single ⟨22400,22464,2560,2624⟩) (.single ⟨22400,22464,2624,2688⟩)))) (.node (.node (.single ⟨22464,22528,2560,2624⟩) (.node (.single ⟨22464,22528,2624,2688⟩) (.single ⟨22400,22464,2688,2752⟩))) (.node (.single ⟨22400,22464,2752,2816⟩) (.node (.single ⟨22464,22528,2688,2752⟩) (.single ⟨22464,22528,2752,2816⟩)))))) (.node (.node (.node (.node (.single ⟨29952,30016,10240,10304⟩) (.single ⟨29952,30016,10304,10368⟩)) (.node (.single ⟨30016,30080,10240,10304⟩) (.node (.single ⟨30016,30080,10304,10368⟩) (.single ⟨29952,29984,10368,10400⟩)))) (.node (.node (.single ⟨29952,29984,10400,10432⟩) (.node (.single ⟨29984,30016,10368,10400⟩) (.single ⟨29984,30016,10400,10432⟩))) (.node (.single ⟨29952,29984,10432,10464⟩) (.node (.single ⟨29952,29984,10464,10496⟩) (.single ⟨29984,30016,10432,10464⟩))))) (.node (.node (.node (.single ⟨29984,30016,10464,10496⟩) (.single ⟨30016,30080,10368,10432⟩)) (.node (.single ⟨30016,30080,10432,10496⟩) (.node (.single ⟨30080,30144,10240,10304⟩) (.single ⟨30080,30144,10304,10368⟩)))) (.node (.node (.single ⟨30144,30208,10240,10304⟩) (.node (.single ⟨30144,30208,10304,10368⟩) (.single ⟨30080,30144,10368,10432⟩))) (.node (.single ⟨30080,30144,10432,10496⟩) (.node (.single ⟨30144,30208,10368,10432⟩) (.single ⟨30144,30208,10432,10496⟩))))))))
def output73 : Fin 88 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 44)) (.node (.single 87) (.node (.single 43) (.single 1)))) (.node (.node (.single 46) (.node (.single 86) (.single 41))) (.node (.single 2) (.node (.single 45) (.single 85))))) (.node (.node (.node (.single 42) (.single 3)) (.node (.single 47) (.node (.single 84) (.single 40)))) (.node (.node (.single 8) (.node (.single 48) (.single 79))) (.node (.single 39) (.node (.single 9) (.single 53)))))) (.node (.node (.node (.node (.single 78) (.single 34)) (.node (.single 18) (.node (.single 62) (.single 69)))) (.node (.node (.single 25) (.node (.single 19) (.single 64))) (.node (.single 68) (.node (.single 23) (.single 20))))) (.node (.node (.node (.single 63) (.single 67)) (.node (.single 24) (.node (.single 21) (.single 65)))) (.node (.node (.single 66) (.node (.single 22) (.single 4))) (.node (.single 58) (.node (.single 83) (.single 29))))))) (.node (.node (.node (.node (.node (.single 5) (.single 60)) (.node (.single 82) (.node (.single 27) (.single 6)))) (.node (.node (.single 59) (.node (.single 81) (.single 28))) (.node (.single 7) (.node (.single 61) (.single 80))))) (.node (.node (.node (.single 26) (.single 10)) (.node (.single 49) (.node (.single 77) (.single 38)))) (.node (.node (.single 11) (.node (.single 51) (.single 76))) (.node (.single 36) (.node (.single 12) (.single 50)))))) (.node (.node (.node (.node (.single 75) (.single 37)) (.node (.single 13) (.node (.single 52) (.single 74)))) (.node (.node (.single 35) (.node (.single 14) (.single 54))) (.node (.single 73) (.node (.single 33) (.single 15))))) (.node (.node (.node (.single 56) (.single 72)) (.node (.single 31) (.node (.single 16) (.single 55)))) (.node (.node (.single 71) (.node (.single 32) (.single 17))) (.node (.single 57) (.node (.single 70) (.single 30))))))))
def sourceData73 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 16) (.node (.single 20) (.single 56))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 76)))) (.node (.node (.single 80) (.node (.single 84) (.single 24))) (.node (.single 28) (.node (.single 32) (.single 36)))))) (.node (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 55)))) (.node (.node (.single 47) (.node (.single 51) (.single 43))) (.node (.single 87) (.node (.single 79) (.single 83))))) (.node (.node (.node (.single 75) (.single 23)) (.node (.single 71) (.node (.single 63) (.single 67)))) (.node (.node (.single 59) (.node (.single 19) (.single 15))) (.node (.single 7) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.node (.single 13) (.single 17)))) (.node (.node (.single 57) (.node (.single 65) (.single 61))) (.node (.single 69) (.node (.single 21) (.single 73))))) (.node (.node (.node (.single 81) (.single 77)) (.node (.single 85) (.node (.single 41) (.single 49)))) (.node (.node (.single 45) (.node (.single 53) (.single 25))) (.node (.single 33) (.node (.single 29) (.single 37)))))) (.node (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 86)))) (.node (.node (.single 82) (.node (.single 78) (.single 74))) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 58) (.single 22)) (.node (.single 18) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 14))) (.node (.single 10) (.node (.single 6) (.single 2))))))))
def cover73 (i : Fin 88) : Fin 88 := ⟨coverData73.get i % 88, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 88) : Fin 88 := ⟨sourceData73.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 .empty (.cutX 2816 (.cutY 22272 .empty (.cutX 2688 (.cutY 22400 (.cutX 2624 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) (.cutX 2624 (.cutY 22464 .full .full) (.cutY 22464 .full .full))) (.cutY 22400 (.cutX 2752 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 2784 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) (.cutX 2784 (.cutY 22368 .full .full) (.cutY 22368 .full .full)))) (.cutX 2752 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty)))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 (.cutY 30208 (.cutX 10496 (.cutY 29952 .empty (.cutX 10368 (.cutY 30080 (.cutX 10304 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) (.cutX 10304 (.cutY 30144 .full .full) (.cutY 30144 .full .full))) (.cutY 30080 (.cutX 10432 (.cutY 30016 (.cutX 10400 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full) (.cutY 30016 (.cutX 10464 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full)) (.cutX 10432 (.cutY 30144 .full .full) (.cutY 30144 .full .full))))) .empty) .empty) .empty)) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 .empty (.cutY 2560 .empty (.cutX 22272 .empty (.cutY 2816 (.cutX 22400 (.cutY 2688 (.cutX 22336 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 22336 (.cutY 2752 .full (.cutX 22304 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full (.cutX 22368 (.cutY 2784 .full .full) (.cutY 2784 .full .full))))) (.cutY 2688 (.cutX 22464 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 22464 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty)))) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 (.cutX 29952 .empty (.cutY 10496 (.cutX 30080 (.cutY 10368 (.cutX 30016 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 30016 (.cutY 10432 (.cutX 29984 (.cutY 10400 .full .full) (.cutY 10400 .full .full)) (.cutX 29984 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 (.cutX 30144 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 30144 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata73 : 0<72090291 ∧ 10<128 ∧ 87<128 ∧ 0<4 ∧
    1267/4160=0 ∧ 1267%4160=1267 ∧ ∀ i, (leaves73 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData73).mp
    (by decide +kernel)

theorem sourceChecked73_0 : ∀ i : Fin 64,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked73_64 : ∀ i : Fin 24,
    (fun i => output73 i = raw73 (source73 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked73 : ∀ i : Fin 88, (fun i => output73 i = raw73 (source73 i)) i :=
  forallFin_of_zero_offset (fun i => output73 i = raw73 (source73 i)) (forallFinOffset_add (fun i => output73 i = raw73 (source73 i)) 0 64 24 (by decide) sourceChecked73_0
    sourceChecked73_64)

theorem coverChecked73_0 : ∀ i : Fin 64,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked73_64 : ∀ i : Fin 24,
    (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked73 : ∀ i : Fin 88, (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) i :=
  forallFin_of_zero_offset (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) (forallFinOffset_add (fun i => (output73 (cover73 i)).ContainsBox (raw73 i)) 0 64 24 (by decide) coverChecked73_0
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 7162, atom 5639, type 1, source (12,87).
def leavesData74 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves74 : Fin 16 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 12 87 leaves74 i
def outputData74 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3072,3136,22272,22336⟩) (.single ⟨3072,3136,22336,22400⟩)) (.node (.single ⟨3136,3200,22272,22336⟩) (.single ⟨3136,3200,22336,22400⟩))) (.node (.node (.single ⟨3072,3200,22400,22528⟩) (.single ⟨3200,3264,22272,22336⟩)) (.node (.single ⟨3200,3264,22336,22400⟩) (.single ⟨3264,3296,22272,22304⟩)))) (.node (.node (.node (.single ⟨3264,3296,22304,22336⟩) (.single ⟨3296,3328,22272,22304⟩)) (.node (.single ⟨3296,3328,22304,22336⟩) (.single ⟨3264,3328,22336,22400⟩))) (.node (.node (.single ⟨3200,3264,22400,22464⟩) (.single ⟨3200,3264,22464,22528⟩)) (.node (.single ⟨3264,3328,22400,22464⟩) (.single ⟨3264,3328,22464,22528⟩))))) (.node (.node (.node (.node (.single ⟨10240,10304,29440,29504⟩) (.single ⟨10240,10304,29504,29568⟩)) (.node (.single ⟨10304,10368,29440,29504⟩) (.single ⟨10304,10368,29504,29568⟩))) (.node (.node (.single ⟨10240,10368,29568,29696⟩) (.single ⟨10368,10432,29440,29504⟩)) (.node (.single ⟨10368,10432,29504,29568⟩) (.single ⟨10432,10464,29440,29472⟩)))) (.node (.node (.node (.single ⟨10432,10464,29472,29504⟩) (.single ⟨10464,10496,29440,29472⟩)) (.node (.single ⟨10464,10496,29472,29504⟩) (.single ⟨10432,10496,29504,29568⟩))) (.node (.node (.single ⟨10368,10432,29568,29632⟩) (.single ⟨10368,10432,29632,29696⟩)) (.node (.single ⟨10432,10496,29568,29632⟩) (.single ⟨10432,10496,29632,29696⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22272,22336,3072,3136⟩) (.single ⟨22272,22336,3136,3200⟩)) (.node (.single ⟨22336,22400,3072,3136⟩) (.single ⟨22336,22400,3136,3200⟩))) (.node (.node (.single ⟨22272,22336,3200,3264⟩) (.single ⟨22272,22304,3264,3296⟩)) (.node (.single ⟨22272,22304,3296,3328⟩) (.single ⟨22304,22336,3264,3296⟩)))) (.node (.node (.node (.single ⟨22304,22336,3296,3328⟩) (.single ⟨22336,22400,3200,3264⟩)) (.node (.single ⟨22336,22400,3264,3328⟩) (.single ⟨22400,22528,3072,3200⟩))) (.node (.node (.single ⟨22400,22464,3200,3264⟩) (.single ⟨22400,22464,3264,3328⟩)) (.node (.single ⟨22464,22528,3200,3264⟩) (.single ⟨22464,22528,3264,3328⟩))))) (.node (.node (.node (.node (.single ⟨29440,29504,10240,10304⟩) (.single ⟨29440,29504,10304,10368⟩)) (.node (.single ⟨29504,29568,10240,10304⟩) (.single ⟨29504,29568,10304,10368⟩))) (.node (.node (.single ⟨29440,29504,10368,10432⟩) (.single ⟨29440,29472,10432,10464⟩)) (.node (.single ⟨29440,29472,10464,10496⟩) (.single ⟨29472,29504,10432,10464⟩)))) (.node (.node (.node (.single ⟨29472,29504,10464,10496⟩) (.single ⟨29504,29568,10368,10432⟩)) (.node (.single ⟨29504,29568,10432,10496⟩) (.single ⟨29568,29696,10240,10368⟩))) (.node (.node (.single ⟨29568,29632,10368,10432⟩) (.single ⟨29568,29632,10432,10496⟩)) (.node (.single ⟨29632,29696,10368,10432⟩) (.single ⟨29632,29696,10432,10496⟩)))))))
def output74 : Fin 64 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData74 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover74 (i : Fin 64) : Fin 64 := ⟨coverData74.get i % 64, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 64) : Fin 64 := ⟨sourceData74.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 .empty (.cutY 21504 .empty (.cutX 3584 (.cutY 22016 .empty (.cutX 3328 (.cutY 22272 .empty (.cutX 3200 (.cutY 22400 (.cutX 3136 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 3264 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 3296 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) (.cutX 3264 (.cutY 22464 .full .full) (.cutY 22464 .full .full))))) .empty)) .empty))) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 (.cutX 10752 (.cutY 29184 .empty (.cutX 10496 (.cutY 29440 .empty (.cutX 10368 (.cutY 29568 (.cutX 10304 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 10432 (.cutY 29504 .full .full) (.cutY 29504 (.cutX 10464 (.cutY 29472 .full .full) (.cutY 29472 .full .full)) .full)) (.cutX 10432 (.cutY 29632 .full .full) (.cutY 29632 .full .full))))) .empty)) .empty) .empty) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 .empty (.cutX 22016 .empty (.cutY 3584 (.cutX 22272 .empty (.cutY 3328 (.cutX 22400 (.cutY 3200 (.cutX 22336 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 22336 (.cutY 3264 .full (.cutX 22304 (.cutY 3296 .full .full) (.cutY 3296 .full .full))) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 22464 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty)) .empty))))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 (.cutY 11264 (.cutX 29184 .empty (.cutY 10752 (.cutX 29440 .empty (.cutY 10496 (.cutX 29568 (.cutY 10368 (.cutX 29504 (.cutY 10304 .full .full) (.cutY 10304 .full .full)) (.cutX 29504 (.cutY 10432 .full (.cutX 29472 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 29632 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty) .empty)))) .empty))

theorem metadata74 : 0<139307719 ∧ 12<128 ∧ 87<128 ∧ 1<4 ∧
    5639/4160=1 ∧ 5639%4160=1479 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 64,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 64, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) sourceChecked74_0

theorem coverChecked74_0 : ∀ i : Fin 64,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 64, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
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

-- Frozen phase 7163, atom 5847, type 1, source (14,91).
def leavesData75 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves75 : Fin 13 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 14 91 leaves75 i
def outputData75 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3584,3712,23296,23424⟩) (.node (.single ⟨3584,3712,23424,23552⟩) (.single ⟨3712,3776,23296,23360⟩))) (.node (.single ⟨3712,3776,23360,23424⟩) (.node (.single ⟨3776,3808,23296,23328⟩) (.single ⟨3776,3808,23328,23360⟩)))) (.node (.node (.single ⟨3808,3840,23296,23328⟩) (.node (.single ⟨3808,3840,23328,23360⟩) (.single ⟨3776,3840,23360,23424⟩))) (.node (.node (.single ⟨3712,3776,23424,23488⟩) (.single ⟨3712,3776,23488,23552⟩)) (.node (.single ⟨3776,3840,23424,23488⟩) (.single ⟨3776,3840,23488,23552⟩))))) (.node (.node (.node (.single ⟨9216,9280,28928,28992⟩) (.node (.single ⟨9216,9280,28992,29056⟩) (.single ⟨9280,9344,28928,28992⟩))) (.node (.single ⟨9280,9344,28992,29056⟩) (.node (.single ⟨9216,9344,29056,29184⟩) (.single ⟨9344,9408,28928,28992⟩)))) (.node (.node (.single ⟨9344,9408,28992,29056⟩) (.node (.single ⟨9408,9440,28928,28960⟩) (.single ⟨9408,9440,28960,28992⟩))) (.node (.node (.single ⟨9440,9472,28928,28960⟩) (.single ⟨9440,9472,28960,28992⟩)) (.node (.single ⟨9408,9472,28992,29056⟩) (.single ⟨9344,9472,29056,29184⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23424,3584,3712⟩) (.node (.single ⟨23296,23360,3712,3776⟩) (.single ⟨23296,23328,3776,3808⟩))) (.node (.single ⟨23296,23328,3808,3840⟩) (.node (.single ⟨23328,23360,3776,3808⟩) (.single ⟨23328,23360,3808,3840⟩)))) (.node (.node (.single ⟨23360,23424,3712,3776⟩) (.node (.single ⟨23360,23424,3776,3840⟩) (.single ⟨23424,23552,3584,3712⟩))) (.node (.node (.single ⟨23424,23488,3712,3776⟩) (.single ⟨23424,23488,3776,3840⟩)) (.node (.single ⟨23488,23552,3712,3776⟩) (.single ⟨23488,23552,3776,3840⟩))))) (.node (.node (.node (.single ⟨28928,28992,9216,9280⟩) (.node (.single ⟨28928,28992,9280,9344⟩) (.single ⟨28992,29056,9216,9280⟩))) (.node (.single ⟨28992,29056,9280,9344⟩) (.node (.single ⟨28928,28992,9344,9408⟩) (.single ⟨28928,28960,9408,9440⟩)))) (.node (.node (.single ⟨28928,28960,9440,9472⟩) (.node (.single ⟨28960,28992,9408,9440⟩) (.single ⟨28960,28992,9440,9472⟩))) (.node (.node (.single ⟨28992,29056,9344,9408⟩) (.single ⟨28992,29056,9408,9472⟩)) (.node (.single ⟨29056,29184,9216,9344⟩) (.single ⟨29056,29184,9344,9472⟩)))))))
def output75 : Fin 52 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover75 (i : Fin 52) : Fin 52 := ⟨coverData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 52) : Fin 52 := ⟨sourceData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 (.cutX 3584 .empty (.cutY 23040 .empty (.cutX 3840 (.cutY 23296 .empty (.cutX 3712 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 3776 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 3808 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) (.cutX 3776 (.cutY 23488 .full .full) (.cutY 23488 .full .full))))) .empty))) .empty))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 .empty (.cutY 29696 (.cutX 9728 (.cutY 29184 (.cutX 9472 (.cutY 28928 .empty (.cutX 9344 (.cutY 29056 (.cutX 9280 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full) (.cutY 29056 (.cutX 9408 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 9440 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 (.cutY 3072 .empty (.cutX 23040 .empty (.cutY 3584 .empty (.cutX 23296 .empty (.cutY 3840 (.cutX 23424 (.cutY 3712 .full (.cutX 23360 (.cutY 3776 .full (.cutX 23328 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full (.cutX 23488 (.cutY 3776 .full .full) (.cutY 3776 .full .full)))) .empty))))) .empty))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 .empty (.cutX 29184 (.cutY 9728 (.cutX 28928 .empty (.cutY 9472 (.cutX 29056 (.cutY 9344 (.cutX 28992 (.cutY 9280 .full .full) (.cutY 9280 .full .full)) (.cutX 28992 (.cutY 9408 .full (.cutX 28960 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata75 : 0<112823226 ∧ 14<128 ∧ 91<128 ∧ 1<4 ∧
    5847/4160=1 ∧ 5847%4160=1687 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 7164, atom 5424, type 1, source (10,84).
def leavesData76 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves76 : Fin 10 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 10 84 leaves76 i
def outputData76 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2560,2688,21504,21632⟩) (.single ⟨2560,2688,21632,21760⟩)) (.node (.single ⟨2688,2752,21504,21568⟩) (.node (.single ⟨2688,2752,21568,21632⟩) (.single ⟨2752,2816,21504,21568⟩)))) (.node (.node (.single ⟨2752,2816,21568,21632⟩) (.single ⟨2688,2752,21632,21696⟩)) (.node (.single ⟨2688,2752,21696,21760⟩) (.node (.single ⟨2752,2816,21632,21696⟩) (.single ⟨2752,2816,21696,21760⟩))))) (.node (.node (.node (.single ⟨11008,11072,29952,30016⟩) (.single ⟨11008,11072,30016,30080⟩)) (.node (.single ⟨11072,11136,29952,30016⟩) (.node (.single ⟨11072,11136,30016,30080⟩) (.single ⟨11008,11136,30080,30208⟩)))) (.node (.node (.single ⟨11136,11200,29952,30016⟩) (.single ⟨11136,11200,30016,30080⟩)) (.node (.single ⟨11200,11264,29952,30016⟩) (.node (.single ⟨11200,11264,30016,30080⟩) (.single ⟨11136,11264,30080,30208⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21632,2560,2688⟩) (.single ⟨21504,21568,2688,2752⟩)) (.node (.single ⟨21504,21568,2752,2816⟩) (.node (.single ⟨21568,21632,2688,2752⟩) (.single ⟨21568,21632,2752,2816⟩)))) (.node (.node (.single ⟨21632,21760,2560,2688⟩) (.single ⟨21632,21696,2688,2752⟩)) (.node (.single ⟨21632,21696,2752,2816⟩) (.node (.single ⟨21696,21760,2688,2752⟩) (.single ⟨21696,21760,2752,2816⟩))))) (.node (.node (.node (.single ⟨29952,30016,11008,11072⟩) (.single ⟨29952,30016,11072,11136⟩)) (.node (.single ⟨30016,30080,11008,11072⟩) (.node (.single ⟨30016,30080,11072,11136⟩) (.single ⟨29952,30016,11136,11200⟩)))) (.node (.node (.single ⟨29952,30016,11200,11264⟩) (.single ⟨30016,30080,11136,11200⟩)) (.node (.single ⟨30016,30080,11200,11264⟩) (.node (.single ⟨30080,30208,11008,11136⟩) (.single ⟨30080,30208,11136,11264⟩)))))))
def output76 : Fin 40 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData76 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover76 (i : Fin 40) : Fin 40 := ⟨coverData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 40) : Fin 40 := ⟨sourceData76.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 (.cutX 2816 (.cutY 21760 (.cutX 2688 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 2752 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) (.cutX 2752 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty) .empty) .empty))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 (.cutX 11008 .empty (.cutY 29952 .empty (.cutX 11136 (.cutY 30080 (.cutX 11072 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full) (.cutY 30080 (.cutX 11200 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 .empty (.cutX 21760 (.cutY 2816 (.cutX 21632 (.cutY 2688 .full (.cutX 21568 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full (.cutX 21696 (.cutY 2752 .full .full) (.cutY 2752 .full .full)))) .empty) .empty)) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 .empty (.cutX 29952 .empty (.cutY 11008 .empty (.cutX 30080 (.cutY 11136 (.cutX 30016 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 30016 (.cutY 11200 .full .full) (.cutY 11200 .full .full))) (.cutY 11136 .full .full))))) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata76 : 0<139307719 ∧ 10<128 ∧ 84<128 ∧ 1<4 ∧
    5424/4160=1 ∧ 5424%4160=1264 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 7165, atom 1044, type 0, source (8,84).
def leavesData77 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩))))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨2,0,2⟩) (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)))) (.node (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves77 : Fin 19 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 8 84 leaves77 i
def outputData77 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨2048,2112,21504,21568⟩) (.single ⟨2048,2112,21568,21632⟩)) (.node (.single ⟨2112,2176,21504,21568⟩) (.single ⟨2112,2176,21568,21632⟩))) (.node (.node (.single ⟨2048,2112,21632,21696⟩) (.single ⟨2048,2112,21696,21760⟩)) (.node (.single ⟨2112,2176,21632,21696⟩) (.node (.single ⟨2112,2176,21696,21760⟩) (.single ⟨2176,2240,21504,21568⟩))))) (.node (.node (.node (.single ⟨2176,2240,21568,21632⟩) (.single ⟨2240,2272,21504,21536⟩)) (.node (.single ⟨2240,2272,21536,21568⟩) (.node (.single ⟨2272,2304,21504,21536⟩) (.single ⟨2272,2304,21536,21568⟩)))) (.node (.node (.single ⟨2240,2304,21568,21632⟩) (.single ⟨2176,2240,21632,21696⟩)) (.node (.single ⟨2176,2240,21696,21760⟩) (.node (.single ⟨2240,2304,21632,21696⟩) (.single ⟨2240,2304,21696,21760⟩)))))) (.node (.node (.node (.node (.single ⟨11008,11072,30464,30528⟩) (.single ⟨11008,11072,30528,30592⟩)) (.node (.single ⟨11072,11136,30464,30528⟩) (.single ⟨11072,11136,30528,30592⟩))) (.node (.node (.single ⟨11008,11072,30592,30656⟩) (.single ⟨11008,11072,30656,30720⟩)) (.node (.single ⟨11072,11136,30592,30656⟩) (.node (.single ⟨11072,11136,30656,30720⟩) (.single ⟨11136,11200,30464,30528⟩))))) (.node (.node (.node (.single ⟨11136,11200,30528,30592⟩) (.single ⟨11200,11232,30464,30496⟩)) (.node (.single ⟨11200,11232,30496,30528⟩) (.node (.single ⟨11232,11264,30464,30496⟩) (.single ⟨11232,11264,30496,30528⟩)))) (.node (.node (.single ⟨11200,11264,30528,30592⟩) (.single ⟨11136,11200,30592,30656⟩)) (.node (.single ⟨11136,11200,30656,30720⟩) (.node (.single ⟨11200,11264,30592,30656⟩) (.single ⟨11200,11264,30656,30720⟩))))))) (.node (.node (.node (.node (.node (.single ⟨21504,21568,2048,2112⟩) (.single ⟨21504,21568,2112,2176⟩)) (.node (.single ⟨21568,21632,2048,2112⟩) (.single ⟨21568,21632,2112,2176⟩))) (.node (.node (.single ⟨21504,21568,2176,2240⟩) (.single ⟨21504,21536,2240,2272⟩)) (.node (.single ⟨21504,21536,2272,2304⟩) (.node (.single ⟨21536,21568,2240,2272⟩) (.single ⟨21536,21568,2272,2304⟩))))) (.node (.node (.node (.single ⟨21568,21632,2176,2240⟩) (.single ⟨21568,21632,2240,2304⟩)) (.node (.single ⟨21632,21696,2048,2112⟩) (.node (.single ⟨21632,21696,2112,2176⟩) (.single ⟨21696,21760,2048,2112⟩)))) (.node (.node (.single ⟨21696,21760,2112,2176⟩) (.single ⟨21632,21696,2176,2240⟩)) (.node (.single ⟨21632,21696,2240,2304⟩) (.node (.single ⟨21696,21760,2176,2240⟩) (.single ⟨21696,21760,2240,2304⟩)))))) (.node (.node (.node (.node (.single ⟨30464,30528,11008,11072⟩) (.single ⟨30464,30528,11072,11136⟩)) (.node (.single ⟨30528,30592,11008,11072⟩) (.single ⟨30528,30592,11072,11136⟩))) (.node (.node (.single ⟨30464,30528,11136,11200⟩) (.single ⟨30464,30496,11200,11232⟩)) (.node (.single ⟨30464,30496,11232,11264⟩) (.node (.single ⟨30496,30528,11200,11232⟩) (.single ⟨30496,30528,11232,11264⟩))))) (.node (.node (.node (.single ⟨30528,30592,11136,11200⟩) (.single ⟨30528,30592,11200,11264⟩)) (.node (.single ⟨30592,30656,11008,11072⟩) (.node (.single ⟨30592,30656,11072,11136⟩) (.single ⟨30656,30720,11008,11072⟩)))) (.node (.node (.single ⟨30656,30720,11072,11136⟩) (.single ⟨30592,30656,11136,11200⟩)) (.node (.single ⟨30592,30656,11200,11264⟩) (.node (.single ⟨30656,30720,11136,11200⟩) (.single ⟨30656,30720,11200,11264⟩))))))))
def output77 : Fin 76 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.single 37))) (.node (.node (.single 1) (.single 40)) (.node (.single 74) (.node (.single 35) (.single 2))))) (.node (.node (.node (.single 39) (.single 73)) (.node (.single 36) (.node (.single 3) (.single 41)))) (.node (.node (.single 72) (.single 34)) (.node (.single 8) (.node (.single 42) (.single 67)))))) (.node (.node (.node (.node (.single 33) (.single 9)) (.node (.single 47) (.single 66))) (.node (.node (.single 28) (.single 15)) (.node (.single 53) (.node (.single 60) (.single 22))))) (.node (.node (.node (.single 16) (.single 55)) (.node (.single 59) (.node (.single 20) (.single 14)))) (.node (.node (.single 48) (.single 61)) (.node (.single 27) (.node (.single 17) (.single 54))))))) (.node (.node (.node (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.single 56))) (.node (.node (.single 57) (.single 19)) (.node (.single 4) (.node (.single 49) (.single 71))))) (.node (.node (.node (.single 26) (.single 5)) (.node (.single 51) (.node (.single 70) (.single 24)))) (.node (.node (.single 6) (.single 50)) (.node (.single 69) (.node (.single 25) (.single 7)))))) (.node (.node (.node (.node (.single 52) (.single 68)) (.node (.single 23) (.single 10))) (.node (.node (.single 43) (.single 65)) (.node (.single 32) (.node (.single 11) (.single 45))))) (.node (.node (.node (.single 64) (.single 30)) (.node (.single 12) (.node (.single 44) (.single 63)))) (.node (.node (.single 31) (.single 13)) (.node (.single 46) (.node (.single 62) (.single 29))))))))
def sourceData77 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 44) (.single 48)) (.node (.single 52) (.node (.single 56) (.single 16))))) (.node (.node (.node (.single 20) (.single 60)) (.node (.single 64) (.node (.single 68) (.single 72)))) (.node (.node (.single 32) (.single 24)) (.node (.single 28) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 31)) (.node (.single 39) (.single 27))) (.node (.node (.single 59) (.single 51)) (.node (.single 55) (.node (.single 47) (.single 35))))) (.node (.node (.node (.single 23) (.single 75)) (.node (.single 67) (.node (.single 71) (.single 63)))) (.node (.node (.single 19) (.single 15)) (.node (.single 7) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 61)) (.node (.single 69) (.node (.single 65) (.single 73))))) (.node (.node (.node (.single 21) (.single 33)) (.node (.single 45) (.node (.single 53) (.single 49)))) (.node (.node (.single 57) (.single 25)) (.node (.single 37) (.node (.single 29) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 30) (.single 26))) (.node (.node (.single 34) (.single 74)) (.node (.single 70) (.node (.single 66) (.single 62))))) (.node (.node (.node (.single 22) (.single 18)) (.node (.single 58) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2))))))))
def cover77 (i : Fin 76) : Fin 76 := ⟨coverData77.get i % 76, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 76) : Fin 76 := ⟨sourceData77.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 (.cutY 22016 (.cutX 2304 (.cutY 21760 (.cutX 2176 (.cutY 21632 (.cutX 2112 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) (.cutX 2112 (.cutY 21696 .full .full) (.cutY 21696 .full .full))) (.cutY 21632 (.cutX 2240 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 2272 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) (.cutX 2240 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 .empty (.cutY 30208 .empty (.cutX 11008 .empty (.cutY 30464 .empty (.cutX 11136 (.cutY 30592 (.cutX 11072 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 11072 (.cutY 30656 .full .full) (.cutY 30656 .full .full))) (.cutY 30592 (.cutX 11200 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 11232 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 11200 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))))) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 (.cutY 2560 (.cutX 21760 (.cutY 2304 (.cutX 21632 (.cutY 2176 (.cutX 21568 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 21568 (.cutY 2240 .full (.cutX 21536 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 (.cutX 21696 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 21696 (.cutY 2240 .full .full) (.cutY 2240 .full .full)))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 .empty (.cutY 10752 .empty (.cutX 30464 .empty (.cutY 11008 .empty (.cutX 30592 (.cutY 11136 (.cutX 30528 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 30528 (.cutY 11200 .full (.cutX 30496 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 (.cutX 30656 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 30656 (.cutY 11200 .full .full) (.cutY 11200 .full .full)))))))) .empty))) .empty) .empty)))) .empty))

theorem metadata77 : 0<72090291 ∧ 8<128 ∧ 84<128 ∧ 0<4 ∧
    1044/4160=0 ∧ 1044%4160=1044 ∧ ∀ i, (leaves77 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData77).mp
    (by decide +kernel)

theorem sourceChecked77_0 : ∀ i : Fin 64,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked77_64 : ∀ i : Fin 12,
    (fun i => output77 i = raw77 (source77 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked77 : ∀ i : Fin 76, (fun i => output77 i = raw77 (source77 i)) i :=
  forallFin_of_zero_offset (fun i => output77 i = raw77 (source77 i)) (forallFinOffset_add (fun i => output77 i = raw77 (source77 i)) 0 64 12 (by decide) sourceChecked77_0
    sourceChecked77_64)

theorem coverChecked77_0 : ∀ i : Fin 64,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked77_64 : ∀ i : Fin 12,
    (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked77 : ∀ i : Fin 76, (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) i :=
  forallFin_of_zero_offset (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) (forallFinOffset_add (fun i => (output77 (cover77 i)).ContainsBox (raw77 i)) 0 64 12 (by decide) coverChecked77_0
    coverChecked77_64)

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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 7166, atom 5314, type 1, source (9,83).
def leavesData78 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves78 : Fin 10 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 83 leaves78 i
def outputData78 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2432,21248,21376⟩) (.single ⟨2304,2432,21376,21504⟩)) (.node (.single ⟨2432,2496,21248,21312⟩) (.node (.single ⟨2432,2496,21312,21376⟩) (.single ⟨2496,2560,21248,21312⟩)))) (.node (.node (.single ⟨2496,2560,21312,21376⟩) (.single ⟨2432,2496,21376,21440⟩)) (.node (.single ⟨2432,2496,21440,21504⟩) (.node (.single ⟨2496,2560,21376,21440⟩) (.single ⟨2496,2560,21440,21504⟩))))) (.node (.node (.node (.single ⟨11264,11328,30208,30272⟩) (.single ⟨11264,11328,30272,30336⟩)) (.node (.single ⟨11328,11392,30208,30272⟩) (.node (.single ⟨11328,11392,30272,30336⟩) (.single ⟨11264,11392,30336,30464⟩)))) (.node (.node (.single ⟨11392,11456,30208,30272⟩) (.single ⟨11392,11456,30272,30336⟩)) (.node (.single ⟨11456,11520,30208,30272⟩) (.node (.single ⟨11456,11520,30272,30336⟩) (.single ⟨11392,11520,30336,30464⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21376,2304,2432⟩) (.single ⟨21248,21312,2432,2496⟩)) (.node (.single ⟨21248,21312,2496,2560⟩) (.node (.single ⟨21312,21376,2432,2496⟩) (.single ⟨21312,21376,2496,2560⟩)))) (.node (.node (.single ⟨21376,21504,2304,2432⟩) (.single ⟨21376,21440,2432,2496⟩)) (.node (.single ⟨21376,21440,2496,2560⟩) (.node (.single ⟨21440,21504,2432,2496⟩) (.single ⟨21440,21504,2496,2560⟩))))) (.node (.node (.node (.single ⟨30208,30272,11264,11328⟩) (.single ⟨30208,30272,11328,11392⟩)) (.node (.single ⟨30272,30336,11264,11328⟩) (.node (.single ⟨30272,30336,11328,11392⟩) (.single ⟨30208,30272,11392,11456⟩)))) (.node (.node (.single ⟨30208,30272,11456,11520⟩) (.single ⟨30272,30336,11392,11456⟩)) (.node (.single ⟨30272,30336,11456,11520⟩) (.node (.single ⟨30336,30464,11264,11392⟩) (.single ⟨30336,30464,11392,11520⟩)))))))
def output78 : Fin 40 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData78 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover78 (i : Fin 40) : Fin 40 := ⟨coverData78.get i % 40, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 40) : Fin 40 := ⟨sourceData78.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 (.cutX 2560 (.cutY 20992 .empty (.cutX 2304 .empty (.cutY 21248 .empty (.cutX 2432 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 2496 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) (.cutX 2496 (.cutY 21440 .full .full) (.cutY 21440 .full .full))))))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 .empty (.cutY 29696 .empty (.cutX 11776 (.cutY 30208 .empty (.cutX 11520 (.cutY 30464 (.cutX 11392 (.cutY 30336 (.cutX 11328 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full) (.cutY 30336 (.cutX 11456 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty)) .empty))) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 (.cutY 3072 (.cutX 20992 .empty (.cutY 2560 (.cutX 21248 .empty (.cutY 2304 .empty (.cutX 21376 (.cutY 2432 .full (.cutX 21312 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full (.cutX 21440 (.cutY 2496 .full .full) (.cutY 2496 .full .full)))))) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 .empty (.cutX 30208 .empty (.cutY 11776 (.cutX 30464 (.cutY 11520 (.cutX 30336 (.cutY 11392 (.cutX 30272 (.cutY 11328 .full .full) (.cutY 11328 .full .full)) (.cutX 30272 (.cutY 11456 .full .full) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty))))) .empty) .empty)))) .empty))

theorem metadata78 : 0<139307719 ∧ 9<128 ∧ 83<128 ∧ 1<4 ∧
    5314/4160=1 ∧ 5314%4160=1154 ∧ ∀ i, (leaves78 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData78).mp
    (by decide +kernel)

theorem sourceChecked78_0 : ∀ i : Fin 40,
    (fun i => output78 i = raw78 (source78 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked78 : ∀ i : Fin 40, (fun i => output78 i = raw78 (source78 i)) i :=
  forallFin_of_zero_offset (fun i => output78 i = raw78 (source78 i)) sourceChecked78_0

theorem coverChecked78_0 : ∀ i : Fin 40,
    (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked78 : ∀ i : Fin 40, (fun i => (output78 (cover78 i)).ContainsBox (raw78 i)) i :=
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 7167, atom 2260, type 0, source (20,100).
def leavesData79 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves79 : Fin 13 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 100 leaves79 i
def outputData79 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,25600,25664⟩) (.node (.single ⟨5120,5184,25664,25728⟩) (.single ⟨5184,5248,25600,25664⟩))) (.node (.single ⟨5184,5248,25664,25728⟩) (.node (.single ⟨5120,5248,25728,25856⟩) (.single ⟨5248,5312,25600,25664⟩)))) (.node (.node (.single ⟨5248,5312,25664,25728⟩) (.node (.single ⟨5312,5344,25600,25632⟩) (.single ⟨5312,5344,25632,25664⟩))) (.node (.node (.single ⟨5344,5376,25600,25632⟩) (.single ⟨5344,5376,25632,25664⟩)) (.node (.single ⟨5312,5376,25664,25728⟩) (.single ⟨5248,5376,25728,25856⟩))))) (.node (.node (.node (.single ⟨6912,7040,27392,27520⟩) (.node (.single ⟨6912,7040,27520,27648⟩) (.single ⟨7040,7104,27392,27456⟩))) (.node (.single ⟨7040,7104,27456,27520⟩) (.node (.single ⟨7104,7136,27392,27424⟩) (.single ⟨7104,7136,27424,27456⟩)))) (.node (.node (.single ⟨7136,7168,27392,27424⟩) (.node (.single ⟨7136,7168,27424,27456⟩) (.single ⟨7104,7168,27456,27520⟩))) (.node (.node (.single ⟨7040,7104,27520,27584⟩) (.single ⟨7040,7104,27584,27648⟩)) (.node (.single ⟨7104,7168,27520,27584⟩) (.single ⟨7104,7168,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25664,5120,5184⟩) (.node (.single ⟨25600,25664,5184,5248⟩) (.single ⟨25664,25728,5120,5184⟩))) (.node (.single ⟨25664,25728,5184,5248⟩) (.node (.single ⟨25600,25664,5248,5312⟩) (.single ⟨25600,25632,5312,5344⟩)))) (.node (.node (.single ⟨25600,25632,5344,5376⟩) (.node (.single ⟨25632,25664,5312,5344⟩) (.single ⟨25632,25664,5344,5376⟩))) (.node (.node (.single ⟨25664,25728,5248,5312⟩) (.single ⟨25664,25728,5312,5376⟩)) (.node (.single ⟨25728,25856,5120,5248⟩) (.single ⟨25728,25856,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,6912,7040⟩) (.node (.single ⟨27392,27456,7040,7104⟩) (.single ⟨27392,27424,7104,7136⟩))) (.node (.single ⟨27392,27424,7136,7168⟩) (.node (.single ⟨27424,27456,7104,7136⟩) (.single ⟨27424,27456,7136,7168⟩)))) (.node (.node (.single ⟨27456,27520,7040,7104⟩) (.node (.single ⟨27456,27520,7104,7168⟩) (.single ⟨27520,27648,6912,7040⟩))) (.node (.node (.single ⟨27520,27584,7040,7104⟩) (.single ⟨27520,27584,7104,7168⟩)) (.node (.single ⟨27584,27648,7040,7104⟩) (.single ⟨27584,27648,7104,7168⟩)))))))
def output79 : Fin 52 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData79 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover79 (i : Fin 52) : Fin 52 := ⟨coverData79.get i % 52, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 52) : Fin 52 := ⟨sourceData79.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 (.cutY 26112 (.cutX 5376 (.cutY 25856 (.cutX 5248 (.cutY 25728 (.cutX 5184 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 5312 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 5344 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 .empty (.cutX 6912 .empty (.cutY 27392 .empty (.cutX 7040 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 7104 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 7136 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 7104 (.cutY 27584 .full .full) (.cutY 27584 .full .full)))))))) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 (.cutX 25856 (.cutY 5376 (.cutX 25728 (.cutY 5248 (.cutX 25664 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 25664 (.cutY 5312 .full (.cutX 25632 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 .empty (.cutY 6656 .empty (.cutX 27392 .empty (.cutY 6912 .empty (.cutX 27520 (.cutY 7040 .full (.cutX 27456 (.cutY 7104 .full (.cutX 27424 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 27584 (.cutY 7104 .full .full) (.cutY 7104 .full .full)))))))) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata79 : 0<121837468 ∧ 20<128 ∧ 100<128 ∧ 0<4 ∧
    2260/4160=0 ∧ 2260%4160=2260 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 52,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 52, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 52,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 52, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 7168, atom 6418, type 1, source (20,98).
def leavesData80 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves80 : Fin 7 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 20 98 leaves80 i
def outputData80 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5120,5248,25088,25216⟩) (.node (.single ⟨5120,5248,25216,25344⟩) (.single ⟨5248,5312,25088,25152⟩))) (.node (.node (.single ⟨5248,5312,25152,25216⟩) (.single ⟨5312,5376,25088,25152⟩)) (.node (.single ⟨5312,5376,25152,25216⟩) (.single ⟨5248,5376,25216,25344⟩)))) (.node (.node (.single ⟨7424,7552,27392,27520⟩) (.node (.single ⟨7424,7552,27520,27648⟩) (.single ⟨7552,7616,27392,27456⟩))) (.node (.node (.single ⟨7552,7616,27456,27520⟩) (.single ⟨7616,7680,27392,27456⟩)) (.node (.single ⟨7616,7680,27456,27520⟩) (.single ⟨7552,7680,27520,27648⟩))))) (.node (.node (.node (.single ⟨25088,25216,5120,5248⟩) (.node (.single ⟨25088,25152,5248,5312⟩) (.single ⟨25088,25152,5312,5376⟩))) (.node (.node (.single ⟨25152,25216,5248,5312⟩) (.single ⟨25152,25216,5312,5376⟩)) (.node (.single ⟨25216,25344,5120,5248⟩) (.single ⟨25216,25344,5248,5376⟩)))) (.node (.node (.single ⟨27392,27520,7424,7552⟩) (.node (.single ⟨27392,27456,7552,7616⟩) (.single ⟨27392,27456,7616,7680⟩))) (.node (.node (.single ⟨27456,27520,7552,7616⟩) (.single ⟨27456,27520,7616,7680⟩)) (.node (.single ⟨27520,27648,7424,7552⟩) (.single ⟨27520,27648,7552,7680⟩))))))
def output80 : Fin 28 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover80 (i : Fin 28) : Fin 28 := ⟨coverData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 28) : Fin 28 := ⟨sourceData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 (.cutX 5632 (.cutY 25088 .empty (.cutX 5376 (.cutY 25344 (.cutX 5248 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 5312 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) .full)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 (.cutX 7680 (.cutY 27136 .empty (.cutX 7424 .empty (.cutY 27392 .empty (.cutX 7552 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 7616 (.cutY 27456 .full .full) (.cutY 27456 .full .full)) .full))))) .empty) .empty)))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 .empty (.cutX 25088 .empty (.cutY 5632 (.cutX 25344 (.cutY 5376 (.cutX 25216 (.cutY 5248 .full (.cutX 25152 (.cutY 5312 .full .full) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty))) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 .empty (.cutX 27136 .empty (.cutY 7680 (.cutX 27392 .empty (.cutY 7424 .empty (.cutX 27520 (.cutY 7552 .full (.cutX 27456 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))) .empty)))) .empty) .empty)) .empty))

theorem metadata80 : 0<151956162 ∧ 20<128 ∧ 98<128 ∧ 1<4 ∧
    6418/4160=1 ∧ 6418%4160=2258 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 7169, atom 6911, type 1, source (26,99).
def leavesData81 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves81 : Fin 13 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 99 leaves81 i
def outputData81 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,25344,25408⟩) (.node (.single ⟨6656,6720,25408,25472⟩) (.single ⟨6720,6784,25344,25408⟩))) (.node (.single ⟨6720,6784,25408,25472⟩) (.node (.single ⟨6656,6784,25472,25600⟩) (.single ⟨6784,6848,25344,25408⟩)))) (.node (.node (.single ⟨6784,6848,25408,25472⟩) (.node (.single ⟨6848,6880,25344,25376⟩) (.single ⟨6848,6880,25376,25408⟩))) (.node (.node (.single ⟨6880,6912,25344,25376⟩) (.single ⟨6880,6912,25376,25408⟩)) (.node (.single ⟨6848,6912,25408,25472⟩) (.single ⟨6784,6912,25472,25600⟩))))) (.node (.node (.node (.single ⟨7168,7296,25856,25984⟩) (.node (.single ⟨7168,7296,25984,26112⟩) (.single ⟨7296,7360,25856,25920⟩))) (.node (.single ⟨7296,7360,25920,25984⟩) (.node (.single ⟨7360,7392,25856,25888⟩) (.single ⟨7360,7392,25888,25920⟩)))) (.node (.node (.single ⟨7392,7424,25856,25888⟩) (.node (.single ⟨7392,7424,25888,25920⟩) (.single ⟨7360,7424,25920,25984⟩))) (.node (.node (.single ⟨7296,7360,25984,26048⟩) (.single ⟨7296,7360,26048,26112⟩)) (.node (.single ⟨7360,7424,25984,26048⟩) (.single ⟨7360,7424,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨25344,25408,6656,6720⟩) (.node (.single ⟨25344,25408,6720,6784⟩) (.single ⟨25408,25472,6656,6720⟩))) (.node (.single ⟨25408,25472,6720,6784⟩) (.node (.single ⟨25344,25408,6784,6848⟩) (.single ⟨25344,25376,6848,6880⟩)))) (.node (.node (.single ⟨25344,25376,6880,6912⟩) (.node (.single ⟨25376,25408,6848,6880⟩) (.single ⟨25376,25408,6880,6912⟩))) (.node (.node (.single ⟨25408,25472,6784,6848⟩) (.single ⟨25408,25472,6848,6912⟩)) (.node (.single ⟨25472,25600,6656,6784⟩) (.single ⟨25472,25600,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,7168,7296⟩) (.node (.single ⟨25856,25920,7296,7360⟩) (.single ⟨25856,25888,7360,7392⟩))) (.node (.single ⟨25856,25888,7392,7424⟩) (.node (.single ⟨25888,25920,7360,7392⟩) (.single ⟨25888,25920,7392,7424⟩)))) (.node (.node (.single ⟨25920,25984,7296,7360⟩) (.node (.single ⟨25920,25984,7360,7424⟩) (.single ⟨25984,26112,7168,7296⟩))) (.node (.node (.single ⟨25984,26048,7296,7360⟩) (.single ⟨25984,26048,7360,7424⟩)) (.node (.single ⟨26048,26112,7296,7360⟩) (.single ⟨26048,26112,7360,7424⟩)))))))
def output81 : Fin 52 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData81 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover81 (i : Fin 52) : Fin 52 := ⟨coverData81.get i % 52, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 52) : Fin 52 := ⟨sourceData81.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 (.cutX 6656 .empty (.cutY 25088 .empty (.cutX 6912 (.cutY 25344 .empty (.cutX 6784 (.cutY 25472 (.cutX 6720 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 6848 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 6880 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) .full))) .empty))) .empty) (.cutY 25600 .empty (.cutX 7680 (.cutY 26112 (.cutX 7424 (.cutY 25856 .empty (.cutX 7296 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 7360 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 7392 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 7360 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty))) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 (.cutY 7168 (.cutX 25088 .empty (.cutY 6656 .empty (.cutX 25344 .empty (.cutY 6912 (.cutX 25472 (.cutY 6784 (.cutX 25408 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 25408 (.cutY 6848 .full (.cutX 25376 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty) (.cutY 7168 .empty (.cutX 26112 (.cutY 7680 (.cutX 25856 .empty (.cutY 7424 (.cutX 25984 (.cutY 7296 .full (.cutX 25920 (.cutY 7360 .full (.cutX 25888 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 26048 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty)) .empty) .empty)))) .empty)) .empty) .empty)) .empty))

theorem metadata81 : 0<48020332 ∧ 26<128 ∧ 99<128 ∧ 1<4 ∧
    6911/4160=1 ∧ 6911%4160=2751 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (12005083/409600000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 7170, atom 6237, type 1, source (18,97).
def leavesData82 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves82 : Fin 10 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 97 leaves82 i
def outputData82 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,24832,24896⟩) (.single ⟨4608,4672,24896,24960⟩)) (.node (.single ⟨4672,4736,24832,24896⟩) (.node (.single ⟨4672,4736,24896,24960⟩) (.single ⟨4608,4736,24960,25088⟩)))) (.node (.node (.single ⟨4736,4800,24832,24896⟩) (.single ⟨4736,4800,24896,24960⟩)) (.node (.single ⟨4800,4864,24832,24896⟩) (.node (.single ⟨4800,4864,24896,24960⟩) (.single ⟨4736,4864,24960,25088⟩))))) (.node (.node (.node (.single ⟨7680,7808,27904,28032⟩) (.single ⟨7680,7808,28032,28160⟩)) (.node (.single ⟨7808,7872,27904,27968⟩) (.node (.single ⟨7808,7872,27968,28032⟩) (.single ⟨7872,7936,27904,27968⟩)))) (.node (.node (.single ⟨7872,7936,27968,28032⟩) (.single ⟨7808,7872,28032,28096⟩)) (.node (.single ⟨7808,7872,28096,28160⟩) (.node (.single ⟨7872,7936,28032,28096⟩) (.single ⟨7872,7936,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨24832,24896,4608,4672⟩) (.single ⟨24832,24896,4672,4736⟩)) (.node (.single ⟨24896,24960,4608,4672⟩) (.node (.single ⟨24896,24960,4672,4736⟩) (.single ⟨24832,24896,4736,4800⟩)))) (.node (.node (.single ⟨24832,24896,4800,4864⟩) (.single ⟨24896,24960,4736,4800⟩)) (.node (.single ⟨24896,24960,4800,4864⟩) (.node (.single ⟨24960,25088,4608,4736⟩) (.single ⟨24960,25088,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,7680,7808⟩) (.single ⟨27904,27968,7808,7872⟩)) (.node (.single ⟨27904,27968,7872,7936⟩) (.node (.single ⟨27968,28032,7808,7872⟩) (.single ⟨27968,28032,7872,7936⟩)))) (.node (.node (.single ⟨28032,28160,7680,7808⟩) (.single ⟨28032,28096,7808,7872⟩)) (.node (.single ⟨28032,28096,7872,7936⟩) (.node (.single ⟨28096,28160,7808,7872⟩) (.single ⟨28096,28160,7872,7936⟩)))))))
def output82 : Fin 40 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData82 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover82 (i : Fin 40) : Fin 40 := ⟨coverData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 40) : Fin 40 := ⟨sourceData82.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 .empty (.cutY 25088 (.cutX 4864 (.cutY 24832 .empty (.cutX 4736 (.cutY 24960 (.cutX 4672 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full) (.cutY 24960 (.cutX 4800 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 .empty (.cutY 28160 (.cutX 7936 (.cutY 27904 .empty (.cutX 7808 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 7872 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) (.cutX 7872 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty)))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 (.cutY 4608 .empty (.cutX 24832 .empty (.cutY 4864 (.cutX 24960 (.cutY 4736 (.cutX 24896 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 24896 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty))) .empty) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 (.cutY 7680 .empty (.cutX 27904 .empty (.cutY 7936 (.cutX 28032 (.cutY 7808 .full (.cutX 27968 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full (.cutX 28096 (.cutY 7872 .full .full) (.cutY 7872 .full .full)))) .empty))) .empty)))))) .empty) .empty)) .empty))

theorem metadata82 : 0<151956162 ∧ 18<128 ∧ 97<128 ∧ 1<4 ∧
    6237/4160=1 ∧ 6237%4160=2077 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (151956162/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (75978081/819200000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 7171, atom 5949, type 1, source (15,94).
def leavesData83 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves83 : Fin 13 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 15 94 leaves83 i
def outputData83 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,24064,24192⟩) (.node (.single ⟨3840,3968,24192,24320⟩) (.single ⟨3968,4032,24064,24128⟩))) (.node (.single ⟨3968,4032,24128,24192⟩) (.node (.single ⟨4032,4064,24064,24096⟩) (.single ⟨4032,4064,24096,24128⟩)))) (.node (.node (.single ⟨4064,4096,24064,24096⟩) (.node (.single ⟨4064,4096,24096,24128⟩) (.single ⟨4032,4096,24128,24192⟩))) (.node (.node (.single ⟨3968,4032,24192,24256⟩) (.single ⟨3968,4032,24256,24320⟩)) (.node (.single ⟨4032,4096,24192,24256⟩) (.single ⟨4032,4096,24256,24320⟩))))) (.node (.node (.node (.single ⟨8448,8512,28672,28736⟩) (.node (.single ⟨8448,8512,28736,28800⟩) (.single ⟨8512,8576,28672,28736⟩))) (.node (.single ⟨8512,8576,28736,28800⟩) (.node (.single ⟨8448,8576,28800,28928⟩) (.single ⟨8576,8640,28672,28736⟩)))) (.node (.node (.single ⟨8576,8640,28736,28800⟩) (.node (.single ⟨8640,8672,28672,28704⟩) (.single ⟨8640,8672,28704,28736⟩))) (.node (.node (.single ⟨8672,8704,28672,28704⟩) (.single ⟨8672,8704,28704,28736⟩)) (.node (.single ⟨8640,8704,28736,28800⟩) (.single ⟨8576,8704,28800,28928⟩)))))) (.node (.node (.node (.node (.single ⟨24064,24192,3840,3968⟩) (.node (.single ⟨24064,24128,3968,4032⟩) (.single ⟨24064,24096,4032,4064⟩))) (.node (.single ⟨24064,24096,4064,4096⟩) (.node (.single ⟨24096,24128,4032,4064⟩) (.single ⟨24096,24128,4064,4096⟩)))) (.node (.node (.single ⟨24128,24192,3968,4032⟩) (.node (.single ⟨24128,24192,4032,4096⟩) (.single ⟨24192,24320,3840,3968⟩))) (.node (.node (.single ⟨24192,24256,3968,4032⟩) (.single ⟨24192,24256,4032,4096⟩)) (.node (.single ⟨24256,24320,3968,4032⟩) (.single ⟨24256,24320,4032,4096⟩))))) (.node (.node (.node (.single ⟨28672,28736,8448,8512⟩) (.node (.single ⟨28672,28736,8512,8576⟩) (.single ⟨28736,28800,8448,8512⟩))) (.node (.single ⟨28736,28800,8512,8576⟩) (.node (.single ⟨28672,28736,8576,8640⟩) (.single ⟨28672,28704,8640,8672⟩)))) (.node (.node (.single ⟨28672,28704,8672,8704⟩) (.node (.single ⟨28704,28736,8640,8672⟩) (.single ⟨28704,28736,8672,8704⟩))) (.node (.node (.single ⟨28736,28800,8576,8640⟩) (.single ⟨28736,28800,8640,8704⟩)) (.node (.single ⟨28800,28928,8448,8576⟩) (.single ⟨28800,28928,8576,8704⟩)))))))
def output83 : Fin 52 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 34)))) (.node (.node (.single 50) (.node (.single 17) (.single 2))) (.node (.node (.single 27) (.single 49)) (.node (.single 24) (.single 3))))) (.node (.node (.node (.single 32) (.node (.single 48) (.single 19))) (.node (.single 9) (.node (.single 35) (.single 42)))) (.node (.node (.single 16) (.node (.single 10) (.single 37))) (.node (.node (.single 41) (.single 14)) (.node (.single 8) (.single 33)))))) (.node (.node (.node (.node (.single 43) (.node (.single 18) (.single 11))) (.node (.single 36) (.node (.single 40) (.single 15)))) (.node (.node (.single 12) (.node (.single 38) (.single 39))) (.node (.node (.single 13) (.single 4)) (.node (.single 28) (.single 47))))) (.node (.node (.node (.single 23) (.node (.single 5) (.single 30))) (.node (.single 46) (.node (.single 21) (.single 6)))) (.node (.node (.single 29) (.node (.single 45) (.single 22))) (.node (.node (.single 7) (.single 31)) (.node (.single 44) (.single 20)))))))
def sourceData83 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.single 12) (.node (.single 36) (.single 40)))) (.node (.node (.single 44) (.node (.single 48) (.single 24))) (.node (.node (.single 16) (.single 20)) (.node (.single 28) (.single 32))))) (.node (.node (.node (.single 35) (.node (.single 23) (.single 31))) (.node (.single 19) (.node (.single 7) (.single 27)))) (.node (.node (.single 15) (.node (.single 51) (.single 43))) (.node (.node (.single 47) (.single 39)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 37))) (.node (.single 45) (.node (.single 41) (.single 49)))) (.node (.node (.single 13) (.node (.single 25) (.single 5))) (.node (.node (.single 17) (.single 29)) (.node (.single 21) (.single 33))))) (.node (.node (.node (.single 34) (.node (.single 30) (.single 22))) (.node (.single 18) (.node (.single 26) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover83 (i : Fin 52) : Fin 52 := ⟨coverData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 52) : Fin 52 := ⟨sourceData83.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 .empty (.cutY 24064 .empty (.cutX 3840 .empty (.cutY 24320 (.cutX 3968 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 4032 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 4064 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 4032 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))))))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 (.cutY 29184 (.cutX 8448 .empty (.cutY 28928 (.cutX 8576 (.cutY 28800 (.cutX 8512 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full) (.cutY 28800 (.cutX 8640 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 8672 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 .empty (.cutY 3584 .empty (.cutX 24320 (.cutY 3840 .empty (.cutX 24192 (.cutY 3968 .full (.cutX 24128 (.cutY 4032 .full (.cutX 24096 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full (.cutX 24256 (.cutY 4032 .full .full) (.cutY 4032 .full .full))))) .empty))))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 (.cutY 8704 (.cutX 28928 (.cutY 8448 .empty (.cutX 28800 (.cutY 8576 (.cutX 28736 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 28736 (.cutY 8640 .full (.cutX 28704 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata83 : 0<112823226 ∧ 15<128 ∧ 94<128 ∧ 1<4 ∧
    5949/4160=1 ∧ 5949%4160=1789 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (112823226/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (56411613/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 7172, atom 2676, type 0, source (25,101).
def leavesData84 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,2⟩))) (.node (.node (.single ⟨2,0,3⟩) (.single ⟨2,1,2⟩)) (.node (.single ⟨2,1,3⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨3,4,0⟩))) (.node (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,2⟩)))) (.node (.node (.single ⟨3,6,3⟩) (.node (.single ⟨3,7,2⟩) (.single ⟨3,7,3⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves84 : Fin 28 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 25 101 leaves84 i
def outputData84 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨6400,6464,25856,25920⟩) (.node (.single ⟨6400,6464,25920,25984⟩) (.single ⟨6464,6528,25856,25920⟩))) (.node (.node (.single ⟨6464,6528,25920,25984⟩) (.single ⟨6400,6464,25984,26048⟩)) (.node (.single ⟨6400,6464,26048,26112⟩) (.single ⟨6464,6528,25984,26048⟩)))) (.node (.node (.single ⟨6464,6528,26048,26112⟩) (.node (.single ⟨6528,6560,25856,25888⟩) (.single ⟨6528,6560,25888,25920⟩))) (.node (.node (.single ⟨6560,6592,25856,25888⟩) (.single ⟨6560,6592,25888,25920⟩)) (.node (.single ⟨6528,6592,25920,25984⟩) (.single ⟨6592,6624,25856,25888⟩))))) (.node (.node (.node (.single ⟨6592,6624,25888,25920⟩) (.node (.single ⟨6624,6640,25856,25872⟩) (.single ⟨6624,6640,25872,25888⟩))) (.node (.node (.single ⟨6640,6656,25856,25872⟩) (.single ⟨6640,6656,25872,25888⟩)) (.node (.single ⟨6624,6656,25888,25920⟩) (.single ⟨6592,6624,25920,25952⟩)))) (.node (.node (.single ⟨6592,6624,25952,25984⟩) (.node (.single ⟨6624,6656,25920,25952⟩) (.single ⟨6624,6656,25952,25984⟩))) (.node (.node (.single ⟨6528,6592,25984,26048⟩) (.single ⟨6528,6592,26048,26112⟩)) (.node (.single ⟨6592,6656,25984,26048⟩) (.single ⟨6592,6656,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨6656,6720,26112,26176⟩) (.node (.single ⟨6656,6720,26176,26240⟩) (.single ⟨6720,6784,26112,26176⟩))) (.node (.node (.single ⟨6720,6784,26176,26240⟩) (.single ⟨6656,6720,26240,26304⟩)) (.node (.single ⟨6656,6720,26304,26368⟩) (.single ⟨6720,6784,26240,26304⟩)))) (.node (.node (.single ⟨6720,6784,26304,26368⟩) (.node (.single ⟨6784,6816,26112,26144⟩) (.single ⟨6784,6816,26144,26176⟩))) (.node (.node (.single ⟨6816,6848,26112,26144⟩) (.single ⟨6816,6848,26144,26176⟩)) (.node (.single ⟨6784,6848,26176,26240⟩) (.single ⟨6848,6880,26112,26144⟩))))) (.node (.node (.node (.single ⟨6848,6880,26144,26176⟩) (.node (.single ⟨6880,6896,26112,26128⟩) (.single ⟨6880,6896,26128,26144⟩))) (.node (.node (.single ⟨6896,6912,26112,26128⟩) (.single ⟨6896,6912,26128,26144⟩)) (.node (.single ⟨6880,6912,26144,26176⟩) (.single ⟨6848,6880,26176,26208⟩)))) (.node (.node (.single ⟨6848,6880,26208,26240⟩) (.node (.single ⟨6880,6912,26176,26208⟩) (.single ⟨6880,6912,26208,26240⟩))) (.node (.node (.single ⟨6784,6848,26240,26304⟩) (.single ⟨6784,6848,26304,26368⟩)) (.node (.single ⟨6848,6912,26240,26304⟩) (.single ⟨6848,6912,26304,26368⟩))))))) (.node (.node (.node (.node (.node (.single ⟨25856,25920,6400,6464⟩) (.node (.single ⟨25856,25920,6464,6528⟩) (.single ⟨25920,25984,6400,6464⟩))) (.node (.node (.single ⟨25920,25984,6464,6528⟩) (.single ⟨25856,25888,6528,6560⟩)) (.node (.single ⟨25856,25888,6560,6592⟩) (.single ⟨25888,25920,6528,6560⟩)))) (.node (.node (.single ⟨25888,25920,6560,6592⟩) (.node (.single ⟨25856,25888,6592,6624⟩) (.single ⟨25856,25872,6624,6640⟩))) (.node (.node (.single ⟨25856,25872,6640,6656⟩) (.single ⟨25872,25888,6624,6640⟩)) (.node (.single ⟨25872,25888,6640,6656⟩) (.single ⟨25888,25920,6592,6624⟩))))) (.node (.node (.node (.single ⟨25888,25920,6624,6656⟩) (.node (.single ⟨25920,25984,6528,6592⟩) (.single ⟨25920,25952,6592,6624⟩))) (.node (.node (.single ⟨25920,25952,6624,6656⟩) (.single ⟨25952,25984,6592,6624⟩)) (.node (.single ⟨25952,25984,6624,6656⟩) (.single ⟨25984,26048,6400,6464⟩)))) (.node (.node (.single ⟨25984,26048,6464,6528⟩) (.node (.single ⟨26048,26112,6400,6464⟩) (.single ⟨26048,26112,6464,6528⟩))) (.node (.node (.single ⟨25984,26048,6528,6592⟩) (.single ⟨25984,26048,6592,6656⟩)) (.node (.single ⟨26048,26112,6528,6592⟩) (.single ⟨26048,26112,6592,6656⟩)))))) (.node (.node (.node (.node (.single ⟨26112,26176,6656,6720⟩) (.node (.single ⟨26112,26176,6720,6784⟩) (.single ⟨26176,26240,6656,6720⟩))) (.node (.node (.single ⟨26176,26240,6720,6784⟩) (.single ⟨26112,26144,6784,6816⟩)) (.node (.single ⟨26112,26144,6816,6848⟩) (.single ⟨26144,26176,6784,6816⟩)))) (.node (.node (.single ⟨26144,26176,6816,6848⟩) (.node (.single ⟨26112,26144,6848,6880⟩) (.single ⟨26112,26128,6880,6896⟩))) (.node (.node (.single ⟨26112,26128,6896,6912⟩) (.single ⟨26128,26144,6880,6896⟩)) (.node (.single ⟨26128,26144,6896,6912⟩) (.single ⟨26144,26176,6848,6880⟩))))) (.node (.node (.node (.single ⟨26144,26176,6880,6912⟩) (.node (.single ⟨26176,26240,6784,6848⟩) (.single ⟨26176,26208,6848,6880⟩))) (.node (.node (.single ⟨26176,26208,6880,6912⟩) (.single ⟨26208,26240,6848,6880⟩)) (.node (.single ⟨26208,26240,6880,6912⟩) (.single ⟨26240,26304,6656,6720⟩)))) (.node (.node (.single ⟨26240,26304,6720,6784⟩) (.node (.single ⟨26304,26368,6656,6720⟩) (.single ⟨26304,26368,6720,6784⟩))) (.node (.node (.single ⟨26240,26304,6784,6848⟩) (.single ⟨26240,26304,6848,6912⟩)) (.node (.single ⟨26304,26368,6784,6848⟩) (.single ⟨26304,26368,6848,6912⟩))))))))
def output84 : Fin 112 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 56) (.single 111))) (.node (.node (.single 55) (.single 1)) (.node (.single 58) (.single 110)))) (.node (.node (.single 53) (.node (.single 2) (.single 57))) (.node (.node (.single 109) (.single 54)) (.node (.single 3) (.single 59))))) (.node (.node (.node (.single 108) (.node (.single 52) (.single 12))) (.node (.node (.single 71) (.single 99)) (.node (.single 40) (.single 24)))) (.node (.node (.single 80) (.node (.single 87) (.single 31))) (.node (.node (.single 25) (.single 82)) (.node (.single 86) (.single 29)))))) (.node (.node (.node (.node (.single 26) (.node (.single 81) (.single 85))) (.node (.node (.single 30) (.single 27)) (.node (.single 83) (.single 84)))) (.node (.node (.single 28) (.node (.single 4) (.single 76))) (.node (.node (.single 107) (.single 35)) (.node (.single 5) (.single 78))))) (.node (.node (.node (.single 106) (.node (.single 33) (.single 6))) (.node (.node (.single 77) (.single 105)) (.node (.single 34) (.single 7)))) (.node (.node (.single 79) (.node (.single 104) (.single 32))) (.node (.node (.single 13) (.single 64)) (.node (.single 98) (.single 47))))))) (.node (.node (.node (.node (.node (.single 14) (.node (.single 69) (.single 97))) (.node (.node (.single 42) (.single 19)) (.node (.single 70) (.single 92)))) (.node (.node (.single 41) (.node (.single 8) (.single 60))) (.node (.node (.single 103) (.single 51)) (.node (.single 9) (.single 62))))) (.node (.node (.node (.single 102) (.node (.single 49) (.single 10))) (.node (.node (.single 61) (.single 101)) (.node (.single 50) (.single 11)))) (.node (.node (.single 63) (.node (.single 100) (.single 48))) (.node (.node (.single 20) (.single 72)) (.node (.single 91) (.single 39)))))) (.node (.node (.node (.node (.single 21) (.node (.single 74) (.single 90))) (.node (.node (.single 37) (.single 22)) (.node (.single 73) (.single 89)))) (.node (.node (.single 38) (.node (.single 23) (.single 75))) (.node (.node (.single 88) (.single 36)) (.node (.single 15) (.single 65))))) (.node (.node (.node (.single 96) (.node (.single 46) (.single 16))) (.node (.node (.single 67) (.single 95)) (.node (.single 44) (.single 17)))) (.node (.node (.single 66) (.node (.single 94) (.single 45))) (.node (.node (.single 18) (.single 68)) (.node (.single 93) (.single 43))))))))
def sourceData84 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 8))) (.node (.node (.single 12) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.single 48) (.node (.single 64) (.single 68))) (.node (.node (.single 72) (.single 76)) (.node (.single 16) (.single 52))))) (.node (.node (.node (.single 56) (.node (.single 96) (.single 100))) (.node (.node (.single 104) (.single 108)) (.node (.single 60) (.single 80)))) (.node (.node (.single 84) (.node (.single 88) (.single 92))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32)))))) (.node (.node (.node (.node (.single 35) (.node (.single 27) (.single 31))) (.node (.node (.single 23) (.single 51)) (.node (.single 43) (.single 47)))) (.node (.node (.single 39) (.node (.single 95) (.single 87))) (.node (.node (.single 91) (.single 83)) (.node (.single 19) (.single 63))))) (.node (.node (.node (.single 59) (.node (.single 111) (.single 103))) (.node (.node (.single 107) (.single 99)) (.node (.single 55) (.single 79)))) (.node (.node (.single 71) (.node (.single 75) (.single 67))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))))))) (.node (.node (.node (.node (.node (.single 1) (.node (.single 9) (.single 5))) (.node (.node (.single 13) (.single 65)) (.node (.single 73) (.single 69)))) (.node (.node (.single 77) (.node (.single 53) (.single 97))) (.node (.node (.single 105) (.single 101)) (.node (.single 109) (.single 57))))) (.node (.node (.node (.single 61) (.node (.single 17) (.single 81))) (.node (.node (.single 89) (.single 85)) (.node (.single 93) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33)))))) (.node (.node (.node (.node (.single 34) (.node (.single 30) (.single 26))) (.node (.node (.single 22) (.single 94)) (.node (.single 90) (.single 86)))) (.node (.node (.single 82) (.node (.single 62) (.single 110))) (.node (.node (.single 106) (.single 102)) (.node (.single 98) (.single 58))))) (.node (.node (.node (.single 54) (.node (.single 18) (.single 78))) (.node (.node (.single 74) (.single 70)) (.node (.single 66) (.single 50)))) (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2))))))))
def cover84 (i : Fin 112) : Fin 112 := ⟨coverData84.get i % 112, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 112) : Fin 112 := ⟨sourceData84.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 (.cutY 26112 (.cutX 6400 .empty (.cutY 25856 .empty (.cutX 6528 (.cutY 25984 (.cutX 6464 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 6464 (.cutY 26048 .full .full) (.cutY 26048 .full .full))) (.cutY 25984 (.cutX 6592 (.cutY 25920 (.cutX 6560 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full) (.cutY 25920 (.cutX 6624 (.cutY 25888 .full .full) (.cutY 25888 (.cutX 6640 (.cutY 25872 .full .full) (.cutY 25872 .full .full)) .full)) (.cutX 6624 (.cutY 25952 .full .full) (.cutY 25952 .full .full)))) (.cutX 6592 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty) (.cutY 26112 .empty (.cutX 6912 (.cutY 26368 (.cutX 6784 (.cutY 26240 (.cutX 6720 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 6720 (.cutY 26304 .full .full) (.cutY 26304 .full .full))) (.cutY 26240 (.cutX 6848 (.cutY 26176 (.cutX 6816 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full) (.cutY 26176 (.cutX 6880 (.cutY 26144 .full .full) (.cutY 26144 (.cutX 6896 (.cutY 26128 .full .full) (.cutY 26128 .full .full)) .full)) (.cutX 6880 (.cutY 26208 .full .full) (.cutY 26208 .full .full)))) (.cutX 6848 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 (.cutX 25856 .empty (.cutY 6400 .empty (.cutX 25984 (.cutY 6528 (.cutX 25920 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 25920 (.cutY 6592 (.cutX 25888 (.cutY 6560 .full .full) (.cutY 6560 .full .full)) (.cutX 25888 (.cutY 6624 .full (.cutX 25872 (.cutY 6640 .full .full) (.cutY 6640 .full .full))) (.cutY 6624 .full .full))) (.cutY 6592 .full (.cutX 25952 (.cutY 6624 .full .full) (.cutY 6624 .full .full))))) (.cutY 6528 (.cutX 26048 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 26048 (.cutY 6592 .full .full) (.cutY 6592 .full .full)))))) .empty) (.cutY 6656 .empty (.cutX 26368 (.cutY 6912 (.cutX 26240 (.cutY 6784 (.cutX 26176 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26176 (.cutY 6848 (.cutX 26144 (.cutY 6816 .full .full) (.cutY 6816 .full .full)) (.cutX 26144 (.cutY 6880 .full (.cutX 26128 (.cutY 6896 .full .full) (.cutY 6896 .full .full))) (.cutY 6880 .full .full))) (.cutY 6848 .full (.cutX 26208 (.cutY 6880 .full .full) (.cutY 6880 .full .full))))) (.cutY 6784 (.cutX 26304 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26304 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty) .empty))) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata84 : 0<31548346 ∧ 25<128 ∧ 101<128 ∧ 0<4 ∧
    2676/4160=0 ∧ 2676%4160=2676 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 64,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked84_64 : ∀ i : Fin 48,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 112, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) (forallFinOffset_add (fun i => output84 i = raw84 (source84 i)) 0 64 48 (by decide) sourceChecked84_0
    sourceChecked84_64)

theorem coverChecked84_0 : ∀ i : Fin 64,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked84_64 : ∀ i : Fin 48,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 112, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
  forallFin_of_zero_offset (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (forallFinOffset_add (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) 0 64 48 (by decide) coverChecked84_0
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 7173, atom 6987, type 1, source (27,100).
def leavesData85 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves85 : Fin 16 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 27 100 leaves85 i
def outputData85 : FiniteInputTree GridBox 32 := (.node (.node (.node (.node (.node (.single ⟨6912,6976,25600,25664⟩) (.single ⟨6912,6976,25664,25728⟩)) (.node (.single ⟨6976,7040,25600,25664⟩) (.single ⟨6976,7040,25664,25728⟩))) (.node (.node (.single ⟨6912,7040,25728,25856⟩) (.single ⟨7040,7104,25600,25664⟩)) (.node (.single ⟨7040,7104,25664,25728⟩) (.single ⟨7104,7136,25600,25632⟩)))) (.node (.node (.node (.single ⟨7104,7136,25632,25664⟩) (.single ⟨7136,7168,25600,25632⟩)) (.node (.single ⟨7136,7168,25632,25664⟩) (.single ⟨7104,7168,25664,25728⟩))) (.node (.node (.single ⟨7040,7104,25728,25792⟩) (.single ⟨7040,7104,25792,25856⟩)) (.node (.single ⟨7104,7168,25728,25792⟩) (.single ⟨7104,7168,25792,25856⟩))))) (.node (.node (.node (.node (.single ⟨25600,25664,6912,6976⟩) (.single ⟨25600,25664,6976,7040⟩)) (.node (.single ⟨25664,25728,6912,6976⟩) (.single ⟨25664,25728,6976,7040⟩))) (.node (.node (.single ⟨25600,25664,7040,7104⟩) (.single ⟨25600,25632,7104,7136⟩)) (.node (.single ⟨25600,25632,7136,7168⟩) (.single ⟨25632,25664,7104,7136⟩)))) (.node (.node (.node (.single ⟨25632,25664,7136,7168⟩) (.single ⟨25664,25728,7040,7104⟩)) (.node (.single ⟨25664,25728,7104,7168⟩) (.single ⟨25728,25856,6912,7040⟩))) (.node (.node (.single ⟨25728,25792,7040,7104⟩) (.single ⟨25728,25792,7104,7168⟩)) (.node (.single ⟨25792,25856,7040,7104⟩) (.single ⟨25792,25856,7104,7168⟩))))))
def output85 : Fin 32 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 27) (.single 4))) (.node (.node (.single 5) (.single 20)) (.node (.single 26) (.single 11)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 25) (.single 6))) (.node (.node (.single 11) (.single 26)) (.node (.single 20) (.single 5))))) (.node (.node (.node (.node (.single 0) (.single 16)) (.node (.single 31) (.single 15))) (.node (.node (.single 1) (.single 18)) (.node (.single 30) (.single 13)))) (.node (.node (.node (.single 2) (.single 17)) (.node (.single 29) (.single 14))) (.node (.node (.single 3) (.single 19)) (.node (.single 28) (.single 12)))))) (.node (.node (.node (.node (.node (.single 12) (.single 28)) (.node (.single 19) (.single 3))) (.node (.node (.single 13) (.single 30)) (.node (.single 18) (.single 1)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 17) (.single 2))) (.node (.node (.single 15) (.single 31)) (.node (.single 16) (.single 0))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 24) (.single 10))) (.node (.node (.single 8) (.single 23)) (.node (.single 23) (.single 8)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 22) (.single 9))) (.node (.node (.single 10) (.single 24)) (.node (.single 21) (.single 7)))))))
def sourceData85 : FiniteInputTree ℕ 32 := (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))))) (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 50) (.single 9)) (.node (.single 6) (.single 1))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18))))))
def cover85 (i : Fin 64) : Fin 32 := ⟨coverData85.get i % 32, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 32) : Fin 64 := ⟨sourceData85.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 .empty (.cutY 26112 (.cutX 6912 .empty (.cutY 25856 (.cutX 7040 (.cutY 25728 (.cutX 6976 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 7104 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 7136 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 7104 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 .empty (.cutX 25856 (.cutY 6912 .empty (.cutX 25728 (.cutY 7040 (.cutX 25664 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 25664 (.cutY 7104 .full (.cutX 25632 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 25792 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))) .empty)) .empty) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata85 : 0<48020332 ∧ 27<128 ∧ 100<128 ∧ 1<4 ∧
    6987/4160=1 ∧ 6987%4160=2827 ∧ ∀ i, (leaves85 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData85).mp
    (by decide +kernel)

theorem sourceChecked85_0 : ∀ i : Fin 32,
    (fun i => output85 i = raw85 (source85 i)) (finOffset 32 0 32 (by decide) i) := by decide +kernel

theorem sourceChecked85 : ∀ i : Fin 32, (fun i => output85 i = raw85 (source85 i)) i :=
  forallFin_of_zero_offset (fun i => output85 i = raw85 (source85 i)) sourceChecked85_0

theorem coverChecked85_0 : ∀ i : Fin 64,
    (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked85 : ∀ i : Fin 64, (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) i :=
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

theorem areaUnits85 : gridUnionAreaUnits output85 = 131072 := by decide +kernel

noncomputable def phaseMass85 : ℝ := singlePhaseMass (48020332/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (12005083/819200000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 7174, atom 1484, type 0, source (12,92).
def leavesData86 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩)) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves86 : Fin 10 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 12 92 leaves86 i
def outputData86 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3072,3200,23552,23680⟩) (.single ⟨3072,3200,23680,23808⟩)) (.node (.single ⟨3200,3264,23552,23616⟩) (.node (.single ⟨3200,3264,23616,23680⟩) (.single ⟨3264,3328,23552,23616⟩)))) (.node (.node (.single ⟨3264,3328,23616,23680⟩) (.single ⟨3200,3264,23680,23744⟩)) (.node (.single ⟨3200,3264,23744,23808⟩) (.node (.single ⟨3264,3328,23680,23744⟩) (.single ⟨3264,3328,23744,23808⟩))))) (.node (.node (.node (.single ⟨8960,9024,29440,29504⟩) (.single ⟨8960,9024,29504,29568⟩)) (.node (.single ⟨9024,9088,29440,29504⟩) (.node (.single ⟨9024,9088,29504,29568⟩) (.single ⟨8960,9088,29568,29696⟩)))) (.node (.node (.single ⟨9088,9152,29440,29504⟩) (.single ⟨9088,9152,29504,29568⟩)) (.node (.single ⟨9152,9216,29440,29504⟩) (.node (.single ⟨9152,9216,29504,29568⟩) (.single ⟨9088,9216,29568,29696⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23680,3072,3200⟩) (.single ⟨23552,23616,3200,3264⟩)) (.node (.single ⟨23552,23616,3264,3328⟩) (.node (.single ⟨23616,23680,3200,3264⟩) (.single ⟨23616,23680,3264,3328⟩)))) (.node (.node (.single ⟨23680,23808,3072,3200⟩) (.single ⟨23680,23744,3200,3264⟩)) (.node (.single ⟨23680,23744,3264,3328⟩) (.node (.single ⟨23744,23808,3200,3264⟩) (.single ⟨23744,23808,3264,3328⟩))))) (.node (.node (.node (.single ⟨29440,29504,8960,9024⟩) (.single ⟨29440,29504,9024,9088⟩)) (.node (.single ⟨29504,29568,8960,9024⟩) (.node (.single ⟨29504,29568,9024,9088⟩) (.single ⟨29440,29504,9088,9152⟩)))) (.node (.node (.single ⟨29440,29504,9152,9216⟩) (.single ⟨29504,29568,9088,9152⟩)) (.node (.single ⟨29504,29568,9152,9216⟩) (.node (.single ⟨29568,29696,8960,9088⟩) (.single ⟨29568,29696,9088,9216⟩)))))))
def output86 : Fin 40 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 4)) (.node (.single 22) (.node (.single 35) (.single 17)))))) (.node (.node (.node (.node (.single 5) (.single 24)) (.node (.single 34) (.node (.single 15) (.single 6)))) (.node (.node (.single 26) (.single 33)) (.node (.single 13) (.node (.single 7) (.single 28))))) (.node (.node (.node (.single 32) (.single 11)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData86 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 16)))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.node (.single 27) (.single 7)))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 17) (.node (.single 13) (.single 21)))) (.node (.node (.single 5) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 26) (.single 22)))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover86 (i : Fin 40) : Fin 40 := ⟨coverData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 40) : Fin 40 := ⟨sourceData86.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 .empty (.cutX 3072 .empty (.cutY 23552 .empty (.cutX 3584 (.cutY 24064 (.cutX 3328 (.cutY 23808 (.cutX 3200 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 3264 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) (.cutX 3264 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty) .empty) .empty) .empty)))))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 (.cutY 30720 (.cutX 9216 (.cutY 29696 (.cutX 8704 .empty (.cutY 29184 .empty (.cutX 8960 .empty (.cutY 29440 .empty (.cutX 9088 (.cutY 29568 (.cutX 9024 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full) (.cutY 29568 (.cutX 9152 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full)))))) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 .empty (.cutY 2048 .empty (.cutX 23552 .empty (.cutY 3072 .empty (.cutX 24064 (.cutY 3584 (.cutX 23808 (.cutY 3328 (.cutX 23680 (.cutY 3200 .full (.cutX 23616 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full (.cutX 23744 (.cutY 3264 .full .full) (.cutY 3264 .full .full)))) .empty) .empty) .empty) .empty))))) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 (.cutX 29696 (.cutY 9216 (.cutX 29184 .empty (.cutY 8704 .empty (.cutX 29440 .empty (.cutY 8960 .empty (.cutX 29568 (.cutY 9088 (.cutX 29504 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 29504 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full)))))) .empty) .empty) .empty) .empty) .empty)))) .empty))

theorem metadata86 : 0<77641223 ∧ 12<128 ∧ 92<128 ∧ 0<4 ∧
    1484/4160=0 ∧ 1484%4160=1484 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (77641223/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (77641223/1638400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 7175, atom 2171, type 0, source (19,100).
def leavesData87 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves87 : Fin 10 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 100 leaves87 i
def outputData87 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,25600,25664⟩) (.single ⟨4864,4928,25664,25728⟩)) (.node (.single ⟨4928,4992,25600,25664⟩) (.node (.single ⟨4928,4992,25664,25728⟩) (.single ⟨4864,4992,25728,25856⟩)))) (.node (.node (.single ⟨4992,5056,25600,25664⟩) (.single ⟨4992,5056,25664,25728⟩)) (.node (.single ⟨5056,5120,25600,25664⟩) (.node (.single ⟨5056,5120,25664,25728⟩) (.single ⟨4992,5120,25728,25856⟩))))) (.node (.node (.node (.single ⟨6912,7040,27648,27776⟩) (.single ⟨6912,7040,27776,27904⟩)) (.node (.single ⟨7040,7104,27648,27712⟩) (.node (.single ⟨7040,7104,27712,27776⟩) (.single ⟨7104,7168,27648,27712⟩)))) (.node (.node (.single ⟨7104,7168,27712,27776⟩) (.single ⟨7040,7104,27776,27840⟩)) (.node (.single ⟨7040,7104,27840,27904⟩) (.node (.single ⟨7104,7168,27776,27840⟩) (.single ⟨7104,7168,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨25600,25664,4864,4928⟩) (.single ⟨25600,25664,4928,4992⟩)) (.node (.single ⟨25664,25728,4864,4928⟩) (.node (.single ⟨25664,25728,4928,4992⟩) (.single ⟨25600,25664,4992,5056⟩)))) (.node (.node (.single ⟨25600,25664,5056,5120⟩) (.single ⟨25664,25728,4992,5056⟩)) (.node (.single ⟨25664,25728,5056,5120⟩) (.node (.single ⟨25728,25856,4864,4992⟩) (.single ⟨25728,25856,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,6912,7040⟩) (.single ⟨27648,27712,7040,7104⟩)) (.node (.single ⟨27648,27712,7104,7168⟩) (.node (.single ⟨27712,27776,7040,7104⟩) (.single ⟨27712,27776,7104,7168⟩)))) (.node (.node (.single ⟨27776,27904,6912,7040⟩) (.single ⟨27776,27840,7040,7104⟩)) (.node (.single ⟨27776,27840,7104,7168⟩) (.node (.single ⟨27840,27904,7040,7104⟩) (.single ⟨27840,27904,7104,7168⟩)))))))
def output87 : Fin 40 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData87 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover87 (i : Fin 40) : Fin 40 := ⟨coverData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 40) : Fin 40 := ⟨sourceData87.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 .empty (.cutX 4608 .empty (.cutY 26112 (.cutX 4864 .empty (.cutY 25856 (.cutX 4992 (.cutY 25728 (.cutX 4928 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full) (.cutY 25728 (.cutX 5056 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty)) .empty))) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 .empty (.cutX 6656 .empty (.cutY 28160 (.cutX 6912 .empty (.cutY 27904 (.cutX 7040 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 7104 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) (.cutX 7104 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty))) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 (.cutX 26112 (.cutY 4608 .empty (.cutX 25856 (.cutY 4864 .empty (.cutX 25728 (.cutY 4992 (.cutX 25664 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 25664 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty)) .empty) .empty)) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 (.cutX 28160 (.cutY 6656 .empty (.cutX 27904 (.cutY 6912 .empty (.cutX 27776 (.cutY 7040 .full (.cutX 27712 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full (.cutX 27840 (.cutY 7104 .full .full) (.cutY 7104 .full .full))))) .empty)) .empty) .empty))))) .empty) .empty)) .empty))

theorem metadata87 : 0<121837468 ∧ 19<128 ∧ 100<128 ∧ 0<4 ∧
    2171/4160=0 ∧ 2171%4160=2171 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 7176, atom 2433, type 0, source (22,101).
def leavesData88 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves88 : Fin 10 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 22 101 leaves88 i
def outputData88 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,25856,25920⟩) (.single ⟨5632,5696,25920,25984⟩)) (.node (.single ⟨5696,5760,25856,25920⟩) (.node (.single ⟨5696,5760,25920,25984⟩) (.single ⟨5632,5760,25984,26112⟩)))) (.node (.node (.single ⟨5760,5824,25856,25920⟩) (.single ⟨5760,5824,25920,25984⟩)) (.node (.single ⟨5824,5888,25856,25920⟩) (.node (.single ⟨5824,5888,25920,25984⟩) (.single ⟨5760,5888,25984,26112⟩))))) (.node (.node (.node (.single ⟨6656,6784,26880,27008⟩) (.single ⟨6656,6784,27008,27136⟩)) (.node (.single ⟨6784,6848,26880,26944⟩) (.node (.single ⟨6784,6848,26944,27008⟩) (.single ⟨6848,6912,26880,26944⟩)))) (.node (.node (.single ⟨6848,6912,26944,27008⟩) (.single ⟨6784,6848,27008,27072⟩)) (.node (.single ⟨6784,6848,27072,27136⟩) (.node (.single ⟨6848,6912,27008,27072⟩) (.single ⟨6848,6912,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨25856,25920,5632,5696⟩) (.single ⟨25856,25920,5696,5760⟩)) (.node (.single ⟨25920,25984,5632,5696⟩) (.node (.single ⟨25920,25984,5696,5760⟩) (.single ⟨25856,25920,5760,5824⟩)))) (.node (.node (.single ⟨25856,25920,5824,5888⟩) (.single ⟨25920,25984,5760,5824⟩)) (.node (.single ⟨25920,25984,5824,5888⟩) (.node (.single ⟨25984,26112,5632,5760⟩) (.single ⟨25984,26112,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,6656,6784⟩) (.single ⟨26880,26944,6784,6848⟩)) (.node (.single ⟨26880,26944,6848,6912⟩) (.node (.single ⟨26944,27008,6784,6848⟩) (.single ⟨26944,27008,6848,6912⟩)))) (.node (.node (.single ⟨27008,27136,6656,6784⟩) (.single ⟨27008,27072,6784,6848⟩)) (.node (.single ⟨27008,27072,6848,6912⟩) (.node (.single ⟨27072,27136,6784,6848⟩) (.single ⟨27072,27136,6848,6912⟩)))))))
def output88 : Fin 40 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData88 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover88 (i : Fin 40) : Fin 40 := ⟨coverData88.get i % 40, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 40) : Fin 40 := ⟨sourceData88.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 .empty (.cutY 26112 (.cutX 5888 (.cutY 25856 .empty (.cutX 5760 (.cutY 25984 (.cutX 5696 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 5824 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full))) .empty) .empty)))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 (.cutX 6912 (.cutY 26880 .empty (.cutX 6784 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 6848 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) (.cutX 6848 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty)) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 .empty (.cutX 25856 .empty (.cutY 5888 (.cutX 25984 (.cutY 5760 (.cutX 25920 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 25920 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 (.cutY 6656 .empty (.cutX 26880 .empty (.cutY 6912 (.cutX 27008 (.cutY 6784 .full (.cutX 26944 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 27072 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty))) .empty) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata88 : 0<121837468 ∧ 22<128 ∧ 101<128 ∧ 0<4 ∧
    2433/4160=0 ∧ 2433%4160=2433 ∧ ∀ i, (leaves88 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData88).mp
    (by decide +kernel)

theorem sourceChecked88_0 : ∀ i : Fin 40,
    (fun i => output88 i = raw88 (source88 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked88 : ∀ i : Fin 40, (fun i => output88 i = raw88 (source88 i)) i :=
  forallFin_of_zero_offset (fun i => output88 i = raw88 (source88 i)) sourceChecked88_0

theorem coverChecked88_0 : ∀ i : Fin 40,
    (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked88 : ∀ i : Fin 40, (fun i => (output88 (cover88 i)).ContainsBox (raw88 i)) i :=
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 7177, atom 2348, type 0, source (21,101).
def leavesData89 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves89 : Fin 10 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 21 101 leaves89 i
def outputData89 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,25856,25920⟩) (.single ⟨5376,5440,25920,25984⟩)) (.node (.single ⟨5440,5504,25856,25920⟩) (.node (.single ⟨5440,5504,25920,25984⟩) (.single ⟨5376,5504,25984,26112⟩)))) (.node (.node (.single ⟨5504,5568,25856,25920⟩) (.single ⟨5504,5568,25920,25984⟩)) (.node (.single ⟨5568,5632,25856,25920⟩) (.node (.single ⟨5568,5632,25920,25984⟩) (.single ⟨5504,5632,25984,26112⟩))))) (.node (.node (.node (.single ⟨6656,6784,27136,27264⟩) (.single ⟨6656,6784,27264,27392⟩)) (.node (.single ⟨6784,6848,27136,27200⟩) (.node (.single ⟨6784,6848,27200,27264⟩) (.single ⟨6848,6912,27136,27200⟩)))) (.node (.node (.single ⟨6848,6912,27200,27264⟩) (.single ⟨6784,6848,27264,27328⟩)) (.node (.single ⟨6784,6848,27328,27392⟩) (.node (.single ⟨6848,6912,27264,27328⟩) (.single ⟨6848,6912,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨25856,25920,5376,5440⟩) (.single ⟨25856,25920,5440,5504⟩)) (.node (.single ⟨25920,25984,5376,5440⟩) (.node (.single ⟨25920,25984,5440,5504⟩) (.single ⟨25856,25920,5504,5568⟩)))) (.node (.node (.single ⟨25856,25920,5568,5632⟩) (.single ⟨25920,25984,5504,5568⟩)) (.node (.single ⟨25920,25984,5568,5632⟩) (.node (.single ⟨25984,26112,5376,5504⟩) (.single ⟨25984,26112,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,6656,6784⟩) (.single ⟨27136,27200,6784,6848⟩)) (.node (.single ⟨27136,27200,6848,6912⟩) (.node (.single ⟨27200,27264,6784,6848⟩) (.single ⟨27200,27264,6848,6912⟩)))) (.node (.node (.single ⟨27264,27392,6656,6784⟩) (.single ⟨27264,27328,6784,6848⟩)) (.node (.single ⟨27264,27328,6848,6912⟩) (.node (.single ⟨27328,27392,6784,6848⟩) (.single ⟨27328,27392,6848,6912⟩)))))))
def output89 : Fin 40 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData89 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover89 (i : Fin 40) : Fin 40 := ⟨coverData89.get i % 40, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 40) : Fin 40 := ⟨sourceData89.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 (.cutY 26112 (.cutX 5376 .empty (.cutY 25856 .empty (.cutX 5504 (.cutY 25984 (.cutX 5440 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 5568 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty) .empty))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 .empty (.cutX 6912 (.cutY 27392 (.cutX 6784 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 6848 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) (.cutX 6848 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty))) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 (.cutX 25856 .empty (.cutY 5376 .empty (.cutX 25984 (.cutY 5504 (.cutX 25920 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 25920 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 .empty (.cutY 6656 .empty (.cutX 27392 (.cutY 6912 (.cutX 27264 (.cutY 6784 .full (.cutX 27200 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 27328 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty) .empty))) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata89 : 0<121837468 ∧ 21<128 ∧ 101<128 ∧ 0<4 ∧
    2348/4160=0 ∧ 2348%4160=2348 ∧ ∀ i, (leaves89 i).Valid 8 := by
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 7178, atom 2597, type 0, source (24,101).
def leavesData90 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩)) (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves90 : Fin 16 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 24 101 leaves90 i
def outputData90 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6144,6208,25856,25920⟩) (.single ⟨6144,6208,25920,25984⟩)) (.node (.single ⟨6208,6272,25856,25920⟩) (.single ⟨6208,6272,25920,25984⟩))) (.node (.node (.single ⟨6144,6208,25984,26048⟩) (.single ⟨6144,6208,26048,26112⟩)) (.node (.single ⟨6208,6272,25984,26048⟩) (.single ⟨6208,6272,26048,26112⟩)))) (.node (.node (.node (.single ⟨6272,6336,25856,25920⟩) (.single ⟨6272,6336,25920,25984⟩)) (.node (.single ⟨6336,6400,25856,25920⟩) (.single ⟨6336,6400,25920,25984⟩))) (.node (.node (.single ⟨6272,6336,25984,26048⟩) (.single ⟨6272,6336,26048,26112⟩)) (.node (.single ⟨6336,6400,25984,26048⟩) (.single ⟨6336,6400,26048,26112⟩))))) (.node (.node (.node (.node (.single ⟨6656,6720,26368,26432⟩) (.single ⟨6656,6720,26432,26496⟩)) (.node (.single ⟨6720,6784,26368,26432⟩) (.single ⟨6720,6784,26432,26496⟩))) (.node (.node (.single ⟨6656,6720,26496,26560⟩) (.single ⟨6656,6720,26560,26624⟩)) (.node (.single ⟨6720,6784,26496,26560⟩) (.single ⟨6720,6784,26560,26624⟩)))) (.node (.node (.node (.single ⟨6784,6848,26368,26432⟩) (.single ⟨6784,6848,26432,26496⟩)) (.node (.single ⟨6848,6912,26368,26432⟩) (.single ⟨6848,6912,26432,26496⟩))) (.node (.node (.single ⟨6784,6848,26496,26560⟩) (.single ⟨6784,6848,26560,26624⟩)) (.node (.single ⟨6848,6912,26496,26560⟩) (.single ⟨6848,6912,26560,26624⟩)))))) (.node (.node (.node (.node (.node (.single ⟨25856,25920,6144,6208⟩) (.single ⟨25856,25920,6208,6272⟩)) (.node (.single ⟨25920,25984,6144,6208⟩) (.single ⟨25920,25984,6208,6272⟩))) (.node (.node (.single ⟨25856,25920,6272,6336⟩) (.single ⟨25856,25920,6336,6400⟩)) (.node (.single ⟨25920,25984,6272,6336⟩) (.single ⟨25920,25984,6336,6400⟩)))) (.node (.node (.node (.single ⟨25984,26048,6144,6208⟩) (.single ⟨25984,26048,6208,6272⟩)) (.node (.single ⟨26048,26112,6144,6208⟩) (.single ⟨26048,26112,6208,6272⟩))) (.node (.node (.single ⟨25984,26048,6272,6336⟩) (.single ⟨25984,26048,6336,6400⟩)) (.node (.single ⟨26048,26112,6272,6336⟩) (.single ⟨26048,26112,6336,6400⟩))))) (.node (.node (.node (.node (.single ⟨26368,26432,6656,6720⟩) (.single ⟨26368,26432,6720,6784⟩)) (.node (.single ⟨26432,26496,6656,6720⟩) (.single ⟨26432,26496,6720,6784⟩))) (.node (.node (.single ⟨26368,26432,6784,6848⟩) (.single ⟨26368,26432,6848,6912⟩)) (.node (.single ⟨26432,26496,6784,6848⟩) (.single ⟨26432,26496,6848,6912⟩)))) (.node (.node (.node (.single ⟨26496,26560,6656,6720⟩) (.single ⟨26496,26560,6720,6784⟩)) (.node (.single ⟨26560,26624,6656,6720⟩) (.single ⟨26560,26624,6720,6784⟩))) (.node (.node (.single ⟨26496,26560,6784,6848⟩) (.single ⟨26496,26560,6848,6912⟩)) (.node (.single ⟨26560,26624,6784,6848⟩) (.single ⟨26560,26624,6848,6912⟩)))))))
def output90 : Fin 64 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 8) (.single 36)) (.node (.single 55) (.single 27))) (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25)))) (.node (.node (.node (.single 10) (.single 37)) (.node (.single 53) (.single 26))) (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24)))))) (.node (.node (.node (.node (.node (.single 4) (.single 40)) (.node (.single 59) (.single 23))) (.node (.node (.single 5) (.single 42)) (.node (.single 58) (.single 21)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 7) (.single 43)) (.node (.single 56) (.single 20))))) (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))))
def sourceData90 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44)))) (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.single 60))))) (.node (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))))) (.node (.node (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))) (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))))
def cover90 (i : Fin 64) : Fin 64 := ⟨coverData90.get i % 64, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 64) : Fin 64 := ⟨sourceData90.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 .empty (.cutY 26624 (.cutX 7168 (.cutY 25600 .empty (.cutX 6656 (.cutY 26112 (.cutX 6400 (.cutY 25856 .empty (.cutX 6272 (.cutY 25984 (.cutX 6208 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 6208 (.cutY 26048 .full .full) (.cutY 26048 .full .full))) (.cutY 25984 (.cutX 6336 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 6336 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) (.cutY 26112 .empty (.cutX 6912 (.cutY 26368 .empty (.cutX 6784 (.cutY 26496 (.cutX 6720 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 6720 (.cutY 26560 .full .full) (.cutY 26560 .full .full))) (.cutY 26496 (.cutX 6848 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 6848 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)))) .empty) .empty)) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 .empty (.cutX 25600 .empty (.cutY 7168 (.cutX 26112 (.cutY 6656 (.cutX 25856 .empty (.cutY 6400 (.cutX 25984 (.cutY 6272 (.cutX 25920 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 25920 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 (.cutX 26048 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 26048 (.cutY 6336 .full .full) (.cutY 6336 .full .full)))) .empty)) .empty) (.cutY 6656 .empty (.cutX 26368 .empty (.cutY 6912 (.cutX 26496 (.cutY 6784 (.cutX 26432 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26432 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 (.cutX 26560 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26560 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty)))) .empty))) .empty)) .empty) .empty)) .empty))

theorem metadata90 : 0<31548346 ∧ 24<128 ∧ 101<128 ∧ 0<4 ∧
    2597/4160=0 ∧ 2597%4160=2597 ∧ ∀ i, (leaves90 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData90).mp
    (by decide +kernel)

theorem sourceChecked90_0 : ∀ i : Fin 64,
    (fun i => output90 i = raw90 (source90 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked90 : ∀ i : Fin 64, (fun i => output90 i = raw90 (source90 i)) i :=
  forallFin_of_zero_offset (fun i => output90 i = raw90 (source90 i)) sourceChecked90_0

theorem coverChecked90_0 : ∀ i : Fin 64,
    (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked90 : ∀ i : Fin 64, (fun i => (output90 (cover90 i)).ContainsBox (raw90 i)) i :=
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (31548346/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (15774173/819200000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 7179, atom 2516, type 0, source (23,101).
def leavesData91 : FiniteInputTree DyadicLeaf 28 := (.node (.node (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,1⟩) (.single ⟨2,3,2⟩)))) (.node (.node (.single ⟨2,3,3⟩) (.node (.single ⟨2,0,2⟩) (.single ⟨2,0,3⟩))) (.node (.node (.single ⟨2,1,2⟩) (.single ⟨2,1,3⟩)) (.node (.single ⟨3,0,0⟩) (.single ⟨3,0,1⟩))))) (.node (.node (.node (.single ⟨3,1,0⟩) (.node (.single ⟨3,1,1⟩) (.single ⟨3,2,0⟩))) (.node (.node (.single ⟨3,2,1⟩) (.single ⟨3,3,0⟩)) (.node (.single ⟨3,3,1⟩) (.single ⟨3,4,0⟩)))) (.node (.node (.single ⟨3,4,1⟩) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves91 : Fin 28 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 112) : GridBox := phaseImageBoxes 32768 8 23 101 leaves91 i
def outputData91 : FiniteInputTree GridBox 112 := (.node (.node (.node (.node (.node (.node (.single ⟨5888,5920,25856,25888⟩) (.node (.single ⟨5888,5920,25888,25920⟩) (.single ⟨5920,5952,25856,25888⟩))) (.node (.node (.single ⟨5920,5952,25888,25920⟩) (.single ⟨5888,5952,25920,25984⟩)) (.node (.single ⟨5952,5984,25856,25888⟩) (.single ⟨5952,5984,25888,25920⟩)))) (.node (.node (.single ⟨5984,6016,25856,25888⟩) (.node (.single ⟨5984,6016,25888,25920⟩) (.single ⟨5952,6016,25920,25984⟩))) (.node (.node (.single ⟨5888,5952,25984,26048⟩) (.single ⟨5888,5952,26048,26112⟩)) (.node (.single ⟨5952,6016,25984,26048⟩) (.single ⟨5952,6016,26048,26112⟩))))) (.node (.node (.node (.single ⟨6016,6048,25856,25888⟩) (.node (.single ⟨6016,6048,25888,25920⟩) (.single ⟨6048,6080,25856,25888⟩))) (.node (.node (.single ⟨6048,6080,25888,25920⟩) (.single ⟨6016,6080,25920,25984⟩)) (.node (.single ⟨6080,6112,25856,25888⟩) (.single ⟨6080,6112,25888,25920⟩)))) (.node (.node (.single ⟨6112,6144,25856,25888⟩) (.node (.single ⟨6112,6144,25888,25920⟩) (.single ⟨6080,6144,25920,25984⟩))) (.node (.node (.single ⟨6016,6080,25984,26048⟩) (.single ⟨6016,6080,26048,26112⟩)) (.node (.single ⟨6080,6144,25984,26048⟩) (.single ⟨6080,6144,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨6656,6720,26624,26688⟩) (.node (.single ⟨6656,6720,26688,26752⟩) (.single ⟨6720,6784,26624,26688⟩))) (.node (.node (.single ⟨6720,6784,26688,26752⟩) (.single ⟨6656,6720,26752,26816⟩)) (.node (.single ⟨6656,6720,26816,26880⟩) (.single ⟨6720,6784,26752,26816⟩)))) (.node (.node (.single ⟨6720,6784,26816,26880⟩) (.node (.single ⟨6784,6848,26624,26688⟩) (.single ⟨6784,6848,26688,26752⟩))) (.node (.node (.single ⟨6848,6880,26624,26656⟩) (.single ⟨6848,6880,26656,26688⟩)) (.node (.single ⟨6880,6912,26624,26656⟩) (.single ⟨6880,6912,26656,26688⟩))))) (.node (.node (.node (.single ⟨6848,6880,26688,26720⟩) (.node (.single ⟨6848,6880,26720,26752⟩) (.single ⟨6880,6912,26688,26720⟩))) (.node (.node (.single ⟨6880,6912,26720,26752⟩) (.single ⟨6784,6848,26752,26816⟩)) (.node (.single ⟨6784,6848,26816,26880⟩) (.single ⟨6848,6880,26752,26784⟩)))) (.node (.node (.single ⟨6848,6880,26784,26816⟩) (.node (.single ⟨6880,6912,26752,26784⟩) (.single ⟨6880,6912,26784,26816⟩))) (.node (.node (.single ⟨6848,6880,26816,26848⟩) (.single ⟨6848,6880,26848,26880⟩)) (.node (.single ⟨6880,6912,26816,26848⟩) (.single ⟨6880,6912,26848,26880⟩))))))) (.node (.node (.node (.node (.node (.single ⟨25856,25888,5888,5920⟩) (.node (.single ⟨25856,25888,5920,5952⟩) (.single ⟨25888,25920,5888,5920⟩))) (.node (.node (.single ⟨25888,25920,5920,5952⟩) (.single ⟨25856,25888,5952,5984⟩)) (.node (.single ⟨25856,25888,5984,6016⟩) (.single ⟨25888,25920,5952,5984⟩)))) (.node (.node (.single ⟨25888,25920,5984,6016⟩) (.node (.single ⟨25920,25984,5888,5952⟩) (.single ⟨25920,25984,5952,6016⟩))) (.node (.node (.single ⟨25856,25888,6016,6048⟩) (.single ⟨25856,25888,6048,6080⟩)) (.node (.single ⟨25888,25920,6016,6048⟩) (.single ⟨25888,25920,6048,6080⟩))))) (.node (.node (.node (.single ⟨25856,25888,6080,6112⟩) (.node (.single ⟨25856,25888,6112,6144⟩) (.single ⟨25888,25920,6080,6112⟩))) (.node (.node (.single ⟨25888,25920,6112,6144⟩) (.single ⟨25920,25984,6016,6080⟩)) (.node (.single ⟨25920,25984,6080,6144⟩) (.single ⟨25984,26048,5888,5952⟩)))) (.node (.node (.single ⟨25984,26048,5952,6016⟩) (.node (.single ⟨26048,26112,5888,5952⟩) (.single ⟨26048,26112,5952,6016⟩))) (.node (.node (.single ⟨25984,26048,6016,6080⟩) (.single ⟨25984,26048,6080,6144⟩)) (.node (.single ⟨26048,26112,6016,6080⟩) (.single ⟨26048,26112,6080,6144⟩)))))) (.node (.node (.node (.node (.single ⟨26624,26688,6656,6720⟩) (.node (.single ⟨26624,26688,6720,6784⟩) (.single ⟨26688,26752,6656,6720⟩))) (.node (.node (.single ⟨26688,26752,6720,6784⟩) (.single ⟨26624,26688,6784,6848⟩)) (.node (.single ⟨26624,26656,6848,6880⟩) (.single ⟨26624,26656,6880,6912⟩)))) (.node (.node (.single ⟨26656,26688,6848,6880⟩) (.node (.single ⟨26656,26688,6880,6912⟩) (.single ⟨26688,26752,6784,6848⟩))) (.node (.node (.single ⟨26688,26720,6848,6880⟩) (.single ⟨26688,26720,6880,6912⟩)) (.node (.single ⟨26720,26752,6848,6880⟩) (.single ⟨26720,26752,6880,6912⟩))))) (.node (.node (.node (.single ⟨26752,26816,6656,6720⟩) (.node (.single ⟨26752,26816,6720,6784⟩) (.single ⟨26816,26880,6656,6720⟩))) (.node (.node (.single ⟨26816,26880,6720,6784⟩) (.single ⟨26752,26816,6784,6848⟩)) (.node (.single ⟨26752,26784,6848,6880⟩) (.single ⟨26752,26784,6880,6912⟩)))) (.node (.node (.single ⟨26784,26816,6848,6880⟩) (.node (.single ⟨26784,26816,6880,6912⟩) (.single ⟨26816,26880,6784,6848⟩))) (.node (.node (.single ⟨26816,26848,6848,6880⟩) (.single ⟨26816,26848,6880,6912⟩)) (.node (.single ⟨26848,26880,6848,6880⟩) (.single ⟨26848,26880,6880,6912⟩))))))))
def output91 : Fin 112 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 4) (.node (.single 64) (.single 107))) (.node (.node (.single 47) (.single 9)) (.node (.single 65) (.single 102)))) (.node (.node (.single 46) (.node (.single 18) (.single 74))) (.node (.node (.single 93) (.single 37)) (.node (.single 24) (.single 80))))) (.node (.node (.node (.single 87) (.node (.single 31) (.single 25))) (.node (.node (.single 82) (.single 86)) (.node (.single 29) (.single 23)))) (.node (.node (.single 75) (.node (.single 88) (.single 36))) (.node (.node (.single 26) (.single 81)) (.node (.single 85) (.single 30)))))) (.node (.node (.node (.node (.single 27) (.node (.single 83) (.single 84))) (.node (.node (.single 28) (.single 10)) (.node (.single 76) (.single 101)))) (.node (.node (.single 35) (.node (.single 11) (.single 78))) (.node (.node (.single 100) (.single 33)) (.node (.single 12) (.single 77))))) (.node (.node (.node (.single 99) (.node (.single 34) (.single 13))) (.node (.node (.single 79) (.single 98)) (.node (.single 32) (.single 0)))) (.node (.node (.single 56) (.node (.single 111) (.single 55))) (.node (.node (.single 1) (.single 58)) (.node (.single 110) (.single 53))))))) (.node (.node (.node (.node (.node (.single 2) (.node (.single 57) (.single 109))) (.node (.node (.single 54) (.single 3)) (.node (.single 59) (.single 108)))) (.node (.node (.single 52) (.node (.single 5) (.single 60))) (.node (.node (.single 106) (.single 51)) (.node (.single 6) (.single 62))))) (.node (.node (.node (.single 105) (.node (.single 49) (.single 7))) (.node (.node (.single 61) (.single 104)) (.node (.single 50) (.single 8)))) (.node (.node (.single 63) (.node (.single 103) (.single 48))) (.node (.node (.single 14) (.single 66)) (.node (.single 97) (.single 45)))))) (.node (.node (.node (.node (.single 15) (.node (.single 68) (.single 96))) (.node (.node (.single 43) (.single 16)) (.node (.single 67) (.single 95)))) (.node (.node (.single 44) (.node (.single 17) (.single 69))) (.node (.node (.single 94) (.single 42)) (.node (.single 19) (.single 70))))) (.node (.node (.node (.single 92) (.node (.single 41) (.single 20))) (.node (.node (.single 72) (.single 91)) (.node (.single 39) (.single 21)))) (.node (.node (.single 71) (.node (.single 90) (.single 40))) (.node (.node (.single 22) (.single 73)) (.node (.single 89) (.single 38))))))))
def sourceData91 : FiniteInputTree ℕ 112 := (.node (.node (.node (.node (.node (.node (.single 48) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 0)) (.node (.single 64) (.single 68)))) (.node (.node (.single 72) (.node (.single 76) (.single 4))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.single 80) (.node (.single 84) (.single 88))) (.node (.node (.single 92) (.single 8)) (.node (.single 96) (.single 100)))) (.node (.node (.single 104) (.node (.single 108) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28)))))) (.node (.node (.node (.node (.single 31) (.node (.single 19) (.single 27))) (.node (.node (.single 15) (.single 47)) (.node (.single 39) (.single 43)))) (.node (.node (.single 35) (.node (.single 23) (.single 11))) (.node (.node (.single 111) (.single 103)) (.node (.single 107) (.single 99))))) (.node (.node (.node (.single 95) (.node (.single 87) (.single 91))) (.node (.node (.single 83) (.single 7)) (.node (.single 3) (.single 79)))) (.node (.node (.single 71) (.node (.single 75) (.single 67))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))))))) (.node (.node (.node (.node (.node (.single 49) (.node (.single 57) (.single 53))) (.node (.node (.single 61) (.single 65)) (.node (.single 73) (.single 69)))) (.node (.node (.single 77) (.node (.single 1) (.single 5))) (.node (.node (.single 81) (.single 89)) (.node (.single 85) (.single 93))))) (.node (.node (.node (.single 97) (.node (.single 105) (.single 101))) (.node (.node (.single 109) (.single 9)) (.node (.single 21) (.single 33)))) (.node (.node (.single 41) (.node (.single 37) (.single 45))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29)))))) (.node (.node (.node (.node (.single 30) (.node (.single 26) (.single 18))) (.node (.node (.single 14) (.single 22)) (.node (.single 110) (.single 106)))) (.node (.node (.single 102) (.node (.single 98) (.single 10))) (.node (.node (.single 94) (.single 90)) (.node (.single 86) (.single 82))))) (.node (.node (.node (.single 46) (.node (.single 42) (.single 38))) (.node (.node (.single 34) (.single 6)) (.node (.single 78) (.single 74)))) (.node (.node (.single 70) (.node (.single 66) (.single 2))) (.node (.node (.single 62) (.single 58)) (.node (.single 54) (.single 50))))))))
def cover91 (i : Fin 112) : Fin 112 := ⟨coverData91.get i % 112, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 112) : Fin 112 := ⟨sourceData91.get i % 112, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 .empty (.cutY 25600 .empty (.cutX 5632 .empty (.cutY 26112 (.cutX 5888 .empty (.cutY 25856 .empty (.cutX 6016 (.cutY 25984 (.cutX 5952 (.cutY 25920 (.cutX 5920 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full) (.cutY 25920 (.cutX 5984 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 5952 (.cutY 26048 .full .full) (.cutY 26048 .full .full))) (.cutY 25984 (.cutX 6080 (.cutY 25920 (.cutX 6048 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full) (.cutY 25920 (.cutX 6112 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 6080 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty)))) .empty) (.cutY 26624 .empty (.cutX 7168 (.cutY 27648 (.cutX 6656 .empty (.cutY 27136 (.cutX 6912 (.cutY 26880 (.cutX 6784 (.cutY 26752 (.cutX 6720 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) (.cutX 6720 (.cutY 26816 .full .full) (.cutY 26816 .full .full))) (.cutY 26752 (.cutX 6848 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 6880 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) (.cutX 6880 (.cutY 26720 .full .full) (.cutY 26720 .full .full)))) (.cutX 6848 (.cutY 26816 .full .full) (.cutY 26816 (.cutX 6880 (.cutY 26784 .full .full) (.cutY 26784 .full .full)) (.cutX 6880 (.cutY 26848 .full .full) (.cutY 26848 .full .full)))))) .empty) .empty) .empty)) .empty) .empty))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 .empty (.cutY 5120 .empty (.cutX 26112 (.cutY 5632 .empty (.cutX 25856 .empty (.cutY 5888 .empty (.cutX 25984 (.cutY 6016 (.cutX 25920 (.cutY 5952 (.cutX 25888 (.cutY 5920 .full .full) (.cutY 5920 .full .full)) (.cutX 25888 (.cutY 5984 .full .full) (.cutY 5984 .full .full))) (.cutY 5952 .full .full)) (.cutX 25920 (.cutY 6080 (.cutX 25888 (.cutY 6048 .full .full) (.cutY 6048 .full .full)) (.cutX 25888 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 (.cutX 26048 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 26048 (.cutY 6080 .full .full) (.cutY 6080 .full .full))))))) .empty))) .empty) (.cutY 6144 .empty (.cutX 27648 (.cutY 7168 (.cutX 27136 (.cutY 6656 .empty (.cutX 26880 (.cutY 6912 (.cutX 26752 (.cutY 6784 (.cutX 26688 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26688 (.cutY 6848 .full (.cutX 26656 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full (.cutX 26720 (.cutY 6880 .full .full) (.cutY 6880 .full .full))))) (.cutY 6784 (.cutX 26816 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 26816 (.cutY 6848 .full (.cutX 26784 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full (.cutX 26848 (.cutY 6880 .full .full) (.cutY 6880 .full .full)))))) .empty) .empty)) .empty) .empty) .empty)))) .empty) .empty)) .empty))

theorem metadata91 : 0<121837468 ∧ 23<128 ∧ 101<128 ∧ 0<4 ∧
    2516/4160=0 ∧ 2516%4160=2516 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 64,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked91_64 : ∀ i : Fin 48,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 112, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) (forallFinOffset_add (fun i => output91 i = raw91 (source91 i)) 0 64 48 (by decide) sourceChecked91_0
    sourceChecked91_64)

theorem coverChecked91_0 : ∀ i : Fin 64,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 112 0 64 (by decide) i) := by decide +kernel

theorem coverChecked91_64 : ∀ i : Fin 48,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 112 64 48 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 112, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
  forallFin_of_zero_offset (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (forallFinOffset_add (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) 0 64 48 (by decide) coverChecked91_0
    coverChecked91_64)

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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 7180, atom 1986, type 0, source (17,99).
def leavesData92 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves92 : Fin 16 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 17 99 leaves92 i
def outputData92 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4352,4416,25344,25408⟩) (.single ⟨4352,4416,25408,25472⟩)) (.node (.single ⟨4416,4480,25344,25408⟩) (.single ⟨4416,4480,25408,25472⟩))) (.node (.node (.single ⟨4352,4480,25472,25600⟩) (.single ⟨4480,4544,25344,25408⟩)) (.node (.single ⟨4480,4544,25408,25472⟩) (.single ⟨4544,4576,25344,25376⟩)))) (.node (.node (.node (.single ⟨4544,4576,25376,25408⟩) (.single ⟨4576,4608,25344,25376⟩)) (.node (.single ⟨4576,4608,25376,25408⟩) (.single ⟨4544,4608,25408,25472⟩))) (.node (.node (.single ⟨4480,4544,25472,25536⟩) (.single ⟨4480,4544,25536,25600⟩)) (.node (.single ⟨4544,4608,25472,25536⟩) (.single ⟨4544,4608,25536,25600⟩))))) (.node (.node (.node (.node (.single ⟨7168,7232,28160,28224⟩) (.single ⟨7168,7232,28224,28288⟩)) (.node (.single ⟨7232,7296,28160,28224⟩) (.single ⟨7232,7296,28224,28288⟩))) (.node (.node (.single ⟨7168,7296,28288,28416⟩) (.single ⟨7296,7360,28160,28224⟩)) (.node (.single ⟨7296,7360,28224,28288⟩) (.single ⟨7360,7392,28160,28192⟩)))) (.node (.node (.node (.single ⟨7360,7392,28192,28224⟩) (.single ⟨7392,7424,28160,28192⟩)) (.node (.single ⟨7392,7424,28192,28224⟩) (.single ⟨7360,7424,28224,28288⟩))) (.node (.node (.single ⟨7296,7360,28288,28352⟩) (.single ⟨7296,7360,28352,28416⟩)) (.node (.single ⟨7360,7424,28288,28352⟩) (.single ⟨7360,7424,28352,28416⟩)))))) (.node (.node (.node (.node (.node (.single ⟨25344,25408,4352,4416⟩) (.single ⟨25344,25408,4416,4480⟩)) (.node (.single ⟨25408,25472,4352,4416⟩) (.single ⟨25408,25472,4416,4480⟩))) (.node (.node (.single ⟨25344,25408,4480,4544⟩) (.single ⟨25344,25376,4544,4576⟩)) (.node (.single ⟨25344,25376,4576,4608⟩) (.single ⟨25376,25408,4544,4576⟩)))) (.node (.node (.node (.single ⟨25376,25408,4576,4608⟩) (.single ⟨25408,25472,4480,4544⟩)) (.node (.single ⟨25408,25472,4544,4608⟩) (.single ⟨25472,25600,4352,4480⟩))) (.node (.node (.single ⟨25472,25536,4480,4544⟩) (.single ⟨25472,25536,4544,4608⟩)) (.node (.single ⟨25536,25600,4480,4544⟩) (.single ⟨25536,25600,4544,4608⟩))))) (.node (.node (.node (.node (.single ⟨28160,28224,7168,7232⟩) (.single ⟨28160,28224,7232,7296⟩)) (.node (.single ⟨28224,28288,7168,7232⟩) (.single ⟨28224,28288,7232,7296⟩))) (.node (.node (.single ⟨28160,28224,7296,7360⟩) (.single ⟨28160,28192,7360,7392⟩)) (.node (.single ⟨28160,28192,7392,7424⟩) (.single ⟨28192,28224,7360,7392⟩)))) (.node (.node (.node (.single ⟨28192,28224,7392,7424⟩) (.single ⟨28224,28288,7296,7360⟩)) (.node (.single ⟨28224,28288,7360,7424⟩) (.single ⟨28288,28416,7168,7296⟩))) (.node (.node (.single ⟨28288,28352,7296,7360⟩) (.single ⟨28288,28352,7360,7424⟩)) (.node (.single ⟨28352,28416,7296,7360⟩) (.single ⟨28352,28416,7360,7424⟩)))))))
def output92 : Fin 64 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21))))) (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData92 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 15)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19)))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 13) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))))))
def cover92 (i : Fin 64) : Fin 64 := ⟨coverData92.get i % 64, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 64) : Fin 64 := ⟨sourceData92.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 .empty (.cutX 4096 .empty (.cutY 28672 (.cutX 6144 (.cutY 26624 (.cutX 5120 (.cutY 25600 (.cutX 4608 (.cutY 25088 .empty (.cutX 4352 .empty (.cutY 25344 .empty (.cutX 4480 (.cutY 25472 (.cutX 4416 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full) (.cutY 25472 (.cutX 4544 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 4576 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 4544 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))))) .empty) .empty) .empty) .empty) (.cutY 26624 .empty (.cutX 7168 .empty (.cutY 27648 .empty (.cutX 7680 (.cutY 28160 .empty (.cutX 7424 (.cutY 28416 (.cutX 7296 (.cutY 28288 (.cutX 7232 (.cutY 28224 .full .full) (.cutY 28224 .full .full)) .full) (.cutY 28288 (.cutX 7360 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 7392 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 7360 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)) .empty))))) .empty))) .empty)) (.cutY 16384 (.cutX 24576 .empty (.cutY 8192 (.cutX 28672 (.cutY 4096 .empty (.cutX 26624 (.cutY 6144 (.cutX 25600 (.cutY 5120 (.cutX 25088 .empty (.cutY 4608 (.cutX 25344 .empty (.cutY 4352 .empty (.cutX 25472 (.cutY 4480 (.cutX 25408 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 25408 (.cutY 4544 .full (.cutX 25376 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full (.cutX 25536 (.cutY 4544 .full .full) (.cutY 4544 .full .full)))))) .empty)) .empty) .empty) .empty) (.cutY 6144 .empty (.cutX 27648 .empty (.cutY 7168 .empty (.cutX 28160 .empty (.cutY 7680 (.cutX 28416 (.cutY 7424 (.cutX 28288 (.cutY 7296 (.cutX 28224 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 28224 (.cutY 7360 .full (.cutX 28192 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full (.cutX 28352 (.cutY 7360 .full .full) (.cutY 7360 .full .full)))) .empty) .empty) .empty))))))) .empty) .empty)) .empty))

theorem metadata92 : 0<121837468 ∧ 17<128 ∧ 99<128 ∧ 0<4 ∧
    1986/4160=0 ∧ 1986%4160=1986 ∧ ∀ i, (leaves92 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData92).mp
    (by decide +kernel)

theorem sourceChecked92_0 : ∀ i : Fin 64,
    (fun i => output92 i = raw92 (source92 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked92 : ∀ i : Fin 64, (fun i => output92 i = raw92 (source92 i)) i :=
  forallFin_of_zero_offset (fun i => output92 i = raw92 (source92 i)) sourceChecked92_0

theorem coverChecked92_0 : ∀ i : Fin 64,
    (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked92 : ∀ i : Fin 64, (fun i => (output92 (cover92 i)).ContainsBox (raw92 i)) i :=
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (121837468/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (30459367/409600000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 7181, atom 1157, type 0, source (9,86).
def leavesData93 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))) (.node (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves93 : Fin 16 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 9 86 leaves93 i
def outputData93 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨2304,2368,22016,22080⟩) (.single ⟨2304,2368,22080,22144⟩)) (.node (.single ⟨2368,2432,22016,22080⟩) (.single ⟨2368,2432,22080,22144⟩))) (.node (.node (.single ⟨2304,2432,22144,22272⟩) (.single ⟨2432,2496,22016,22080⟩)) (.node (.single ⟨2432,2496,22080,22144⟩) (.single ⟨2496,2528,22016,22048⟩)))) (.node (.node (.node (.single ⟨2496,2528,22048,22080⟩) (.single ⟨2528,2560,22016,22048⟩)) (.node (.single ⟨2528,2560,22048,22080⟩) (.single ⟨2496,2560,22080,22144⟩))) (.node (.node (.single ⟨2432,2496,22144,22208⟩) (.single ⟨2432,2496,22208,22272⟩)) (.node (.single ⟨2496,2560,22144,22208⟩) (.single ⟨2496,2560,22208,22272⟩))))) (.node (.node (.node (.node (.single ⟨10496,10560,30208,30272⟩) (.single ⟨10496,10560,30272,30336⟩)) (.node (.single ⟨10560,10624,30208,30272⟩) (.single ⟨10560,10624,30272,30336⟩))) (.node (.node (.single ⟨10496,10624,30336,30464⟩) (.single ⟨10624,10688,30208,30272⟩)) (.node (.single ⟨10624,10688,30272,30336⟩) (.single ⟨10688,10720,30208,30240⟩)))) (.node (.node (.node (.single ⟨10688,10720,30240,30272⟩) (.single ⟨10720,10752,30208,30240⟩)) (.node (.single ⟨10720,10752,30240,30272⟩) (.single ⟨10688,10752,30272,30336⟩))) (.node (.node (.single ⟨10624,10688,30336,30400⟩) (.single ⟨10624,10688,30400,30464⟩)) (.node (.single ⟨10688,10752,30336,30400⟩) (.single ⟨10688,10752,30400,30464⟩)))))) (.node (.node (.node (.node (.node (.single ⟨22016,22080,2304,2368⟩) (.single ⟨22016,22080,2368,2432⟩)) (.node (.single ⟨22080,22144,2304,2368⟩) (.single ⟨22080,22144,2368,2432⟩))) (.node (.node (.single ⟨22016,22080,2432,2496⟩) (.single ⟨22016,22048,2496,2528⟩)) (.node (.single ⟨22016,22048,2528,2560⟩) (.single ⟨22048,22080,2496,2528⟩)))) (.node (.node (.node (.single ⟨22048,22080,2528,2560⟩) (.single ⟨22080,22144,2432,2496⟩)) (.node (.single ⟨22080,22144,2496,2560⟩) (.single ⟨22144,22272,2304,2432⟩))) (.node (.node (.single ⟨22144,22208,2432,2496⟩) (.single ⟨22144,22208,2496,2560⟩)) (.node (.single ⟨22208,22272,2432,2496⟩) (.single ⟨22208,22272,2496,2560⟩))))) (.node (.node (.node (.node (.single ⟨30208,30272,10496,10560⟩) (.single ⟨30208,30272,10560,10624⟩)) (.node (.single ⟨30272,30336,10496,10560⟩) (.single ⟨30272,30336,10560,10624⟩))) (.node (.node (.single ⟨30208,30272,10624,10688⟩) (.single ⟨30208,30240,10688,10720⟩)) (.node (.single ⟨30208,30240,10720,10752⟩) (.single ⟨30240,30272,10688,10720⟩)))) (.node (.node (.node (.single ⟨30240,30272,10720,10752⟩) (.single ⟨30272,30336,10624,10688⟩)) (.node (.single ⟨30272,30336,10688,10752⟩) (.single ⟨30336,30464,10496,10624⟩))) (.node (.node (.single ⟨30336,30400,10624,10688⟩) (.single ⟨30336,30400,10688,10752⟩)) (.node (.single ⟨30400,30464,10624,10688⟩) (.single ⟨30400,30464,10688,10752⟩)))))))
def output93 : Fin 64 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))))) (.node (.node (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))))) (.node (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData93 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 20))) (.node (.node (.single 12) (.single 16)) (.node (.single 24) (.single 28))))) (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 21) (.single 1))) (.node (.node (.single 13) (.single 25)) (.node (.single 17) (.single 29))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34)))))))
def cover93 (i : Fin 64) : Fin 64 := ⟨coverData93.get i % 64, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 64) : Fin 64 := ⟨sourceData93.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 (.cutY 22016 .empty (.cutX 2304 .empty (.cutY 22272 (.cutX 2432 (.cutY 22144 (.cutX 2368 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 2496 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 2528 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) (.cutX 2496 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty))) .empty)) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 (.cutY 30208 .empty (.cutX 10496 .empty (.cutY 30464 (.cutX 10624 (.cutY 30336 (.cutX 10560 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full) (.cutY 30336 (.cutX 10688 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 10720 (.cutY 30240 .full .full) (.cutY 30240 .full .full)) .full)) (.cutX 10688 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty)) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 .empty (.cutY 2560 (.cutX 22272 (.cutY 2304 .empty (.cutX 22144 (.cutY 2432 (.cutX 22080 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 22080 (.cutY 2496 .full (.cutX 22048 (.cutY 2528 .full .full) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 .full (.cutX 22208 (.cutY 2496 .full .full) (.cutY 2496 .full .full))))) .empty) .empty)) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 .empty (.cutY 10752 (.cutX 30464 (.cutY 10496 .empty (.cutX 30336 (.cutY 10624 (.cutX 30272 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 30272 (.cutY 10688 .full (.cutX 30240 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 30400 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty)) .empty))) .empty) .empty)))) .empty))

theorem metadata93 : 0<72090291 ∧ 9<128 ∧ 86<128 ∧ 0<4 ∧
    1157/4160=0 ∧ 1157%4160=1157 ∧ ∀ i, (leaves93 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData93).mp
    (by decide +kernel)

theorem sourceChecked93_0 : ∀ i : Fin 64,
    (fun i => output93 i = raw93 (source93 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked93 : ∀ i : Fin 64, (fun i => output93 i = raw93 (source93 i)) i :=
  forallFin_of_zero_offset (fun i => output93 i = raw93 (source93 i)) sourceChecked93_0

theorem coverChecked93_0 : ∀ i : Fin 64,
    (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked93 : ∀ i : Fin 64, (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) i :=
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (72090291/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (72090291/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 7182, atom 5533, type 1, source (11,86).
def leavesData94 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,0⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)))))
def leaves94 : Fin 10 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 11 86 leaves94 i
def outputData94 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2816,2944,22016,22144⟩) (.single ⟨2816,2944,22144,22272⟩)) (.node (.single ⟨2944,3008,22016,22080⟩) (.node (.single ⟨2944,3008,22080,22144⟩) (.single ⟨3008,3072,22016,22080⟩)))) (.node (.node (.single ⟨3008,3072,22080,22144⟩) (.single ⟨2944,3008,22144,22208⟩)) (.node (.single ⟨2944,3008,22208,22272⟩) (.node (.single ⟨3008,3072,22144,22208⟩) (.single ⟨3008,3072,22208,22272⟩))))) (.node (.node (.node (.single ⟨10496,10560,29696,29760⟩) (.single ⟨10496,10560,29760,29824⟩)) (.node (.single ⟨10560,10624,29696,29760⟩) (.node (.single ⟨10560,10624,29760,29824⟩) (.single ⟨10496,10624,29824,29952⟩)))) (.node (.node (.single ⟨10624,10688,29696,29760⟩) (.single ⟨10624,10688,29760,29824⟩)) (.node (.single ⟨10688,10752,29696,29760⟩) (.node (.single ⟨10688,10752,29760,29824⟩) (.single ⟨10624,10752,29824,29952⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22144,2816,2944⟩) (.single ⟨22016,22080,2944,3008⟩)) (.node (.single ⟨22016,22080,3008,3072⟩) (.node (.single ⟨22080,22144,2944,3008⟩) (.single ⟨22080,22144,3008,3072⟩)))) (.node (.node (.single ⟨22144,22272,2816,2944⟩) (.single ⟨22144,22208,2944,3008⟩)) (.node (.single ⟨22144,22208,3008,3072⟩) (.node (.single ⟨22208,22272,2944,3008⟩) (.single ⟨22208,22272,3008,3072⟩))))) (.node (.node (.node (.single ⟨29696,29760,10496,10560⟩) (.single ⟨29696,29760,10560,10624⟩)) (.node (.single ⟨29760,29824,10496,10560⟩) (.node (.single ⟨29760,29824,10560,10624⟩) (.single ⟨29696,29760,10624,10688⟩)))) (.node (.node (.single ⟨29696,29760,10688,10752⟩) (.single ⟨29760,29824,10624,10688⟩)) (.node (.single ⟨29760,29824,10688,10752⟩) (.node (.single ⟨29824,29952,10496,10624⟩) (.single ⟨29824,29952,10624,10752⟩)))))))
def output94 : Fin 40 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 25) (.single 38)) (.node (.single 14) (.node (.single 2) (.single 21))))) (.node (.node (.node (.single 37) (.single 18)) (.node (.single 3) (.node (.single 23) (.single 36)))) (.node (.node (.single 16) (.single 6)) (.node (.single 26) (.node (.single 33) (.single 13)))))) (.node (.node (.node (.node (.single 7) (.single 28)) (.node (.single 32) (.node (.single 11) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 8) (.node (.single 27) (.single 31)))) (.node (.node (.single 12) (.single 9)) (.node (.single 29) (.node (.single 30) (.single 10)))))))
def sourceData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 12) (.single 24)))) (.node (.node (.single 28) (.single 16)) (.node (.single 20) (.node (.single 32) (.single 36))))) (.node (.node (.node (.single 39) (.single 23)) (.node (.single 35) (.node (.single 19) (.single 7)))) (.node (.node (.single 31) (.single 15)) (.node (.single 27) (.node (.single 11) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 9)) (.node (.single 25) (.node (.single 13) (.single 29)))) (.node (.node (.single 5) (.single 17)) (.node (.single 33) (.node (.single 21) (.single 37))))) (.node (.node (.node (.single 38) (.single 34)) (.node (.single 22) (.node (.single 18) (.single 30)))) (.node (.node (.single 26) (.single 14)) (.node (.single 10) (.node (.single 6) (.single 2)))))))
def cover94 (i : Fin 40) : Fin 40 := ⟨coverData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 40) : Fin 40 := ⟨sourceData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 .empty (.cutX 2048 .empty (.cutY 22528 (.cutX 3072 (.cutY 21504 .empty (.cutX 2560 .empty (.cutY 22016 .empty (.cutX 2816 .empty (.cutY 22272 (.cutX 2944 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 3008 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) (.cutX 3008 (.cutY 22208 .full .full) (.cutY 22208 .full .full)))) .empty))))) .empty) .empty))) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 .empty (.cutX 10240 .empty (.cutY 30720 (.cutX 11264 (.cutY 29696 .empty (.cutX 10752 (.cutY 30208 (.cutX 10496 .empty (.cutY 29952 (.cutX 10624 (.cutY 29824 (.cutX 10560 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full) (.cutY 29824 (.cutX 10688 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty) .empty)) .empty) .empty))) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 (.cutX 22528 (.cutY 2048 .empty (.cutX 21504 .empty (.cutY 3072 (.cutX 22016 .empty (.cutY 2560 .empty (.cutX 22272 (.cutY 2816 .empty (.cutX 22144 (.cutY 2944 .full (.cutX 22080 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full (.cutX 22208 (.cutY 3008 .full .full) (.cutY 3008 .full .full))))) .empty))) .empty))) .empty) .empty)) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 (.cutX 30720 (.cutY 10240 .empty (.cutX 29696 .empty (.cutY 11264 (.cutX 30208 (.cutY 10752 (.cutX 29952 (.cutY 10496 .empty (.cutX 29824 (.cutY 10624 (.cutX 29760 (.cutY 10560 .full .full) (.cutY 10560 .full .full)) (.cutX 29760 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty) .empty) .empty))) .empty) .empty)))) .empty))

theorem metadata94 : 0<139307719 ∧ 11<128 ∧ 86<128 ∧ 1<4 ∧
    5533/4160=1 ∧ 5533%4160=1373 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (139307719/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (139307719/1638400000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94].sum

theorem actual_batch_mass : batchActualMass = (8454922539/1638400000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch07088
#print axioms NoThreeLine.ScheduleUnionBatch07088.actual_batch_mass
