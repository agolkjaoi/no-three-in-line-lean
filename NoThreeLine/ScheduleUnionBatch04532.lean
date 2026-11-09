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
namespace NoThreeLine.ScheduleUnionBatch04532

-- Frozen phase 4532, atom 7427, type 1, source (34,71).
def leavesData0 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves0 : Fin 10 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 34 71 leaves0 i
def outputData0 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8704,8832,18176,18304⟩) (.single ⟨8704,8832,18304,18432⟩)) (.node (.single ⟨8832,8896,18176,18240⟩) (.node (.single ⟨8832,8896,18240,18304⟩) (.single ⟨8896,8928,18176,18208⟩)))) (.node (.node (.single ⟨8896,8928,18208,18240⟩) (.single ⟨8928,8960,18176,18208⟩)) (.node (.single ⟨8928,8960,18208,18240⟩) (.node (.single ⟨8896,8960,18240,18304⟩) (.single ⟨8832,8960,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,23808,23936⟩) (.single ⟨14336,14464,23936,24064⟩)) (.node (.single ⟨14464,14528,23808,23872⟩) (.node (.single ⟨14464,14528,23872,23936⟩) (.single ⟨14528,14560,23808,23840⟩)))) (.node (.node (.single ⟨14528,14560,23840,23872⟩) (.single ⟨14560,14592,23808,23840⟩)) (.node (.single ⟨14560,14592,23840,23872⟩) (.node (.single ⟨14528,14592,23872,23936⟩) (.single ⟨14464,14592,23936,24064⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,8704,8832⟩) (.single ⟨18176,18240,8832,8896⟩)) (.node (.single ⟨18176,18208,8896,8928⟩) (.node (.single ⟨18176,18208,8928,8960⟩) (.single ⟨18208,18240,8896,8928⟩)))) (.node (.node (.single ⟨18208,18240,8928,8960⟩) (.single ⟨18240,18304,8832,8896⟩)) (.node (.single ⟨18240,18304,8896,8960⟩) (.node (.single ⟨18304,18432,8704,8832⟩) (.single ⟨18304,18432,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,14336,14464⟩) (.single ⟨23808,23872,14464,14528⟩)) (.node (.single ⟨23808,23840,14528,14560⟩) (.node (.single ⟨23808,23840,14560,14592⟩) (.single ⟨23840,23872,14528,14560⟩)))) (.node (.node (.single ⟨23840,23872,14560,14592⟩) (.single ⟨23872,23936,14464,14528⟩)) (.node (.single ⟨23872,23936,14528,14592⟩) (.node (.single ⟨23936,24064,14336,14464⟩) (.single ⟨23936,24064,14464,14592⟩)))))))
def output0 : Fin 40 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData0 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover0 (i : Fin 40) : Fin 40 := ⟨coverData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 40) : Fin 40 := ⟨sourceData0.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 .empty (.cutY 17920 .empty (.cutX 8960 (.cutY 18176 .empty (.cutX 8832 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 8896 (.cutY 18240 .full .full) (.cutY 18240 (.cutX 8928 (.cutY 18208 .full .full) (.cutY 18208 .full .full)) .full)) .full))) .empty)))) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 (.cutY 24064 (.cutX 14592 (.cutY 23808 .empty (.cutX 14464 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 14528 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 14560 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 .empty (.cutY 8704 .empty (.cutX 18176 .empty (.cutY 8960 (.cutX 18304 (.cutY 8832 .full (.cutX 18240 (.cutY 8896 .full (.cutX 18208 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty)))) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 (.cutY 14848 (.cutX 23808 .empty (.cutY 14592 (.cutX 23936 (.cutY 14464 .full (.cutX 23872 (.cutY 14528 .full (.cutX 23840 (.cutY 14560 .full .full) (.cutY 14560 .full .full))) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty))))))) .empty) .empty))

theorem metadata0 : 0<182398684 ∧ 34<128 ∧ 71<128 ∧ 1<4 ∧
    7427/4160=1 ∧ 7427%4160=3267 ∧ ∀ i, (leaves0 i).Valid 8 := by
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 4533, atom 7850, type 1, source (42,78).
def leavesData1 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves1 : Fin 13 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 42 78 leaves1 i
def outputData1 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨10752,10880,19968,20096⟩) (.node (.single ⟨10752,10880,20096,20224⟩) (.single ⟨10880,10944,19968,20032⟩))) (.node (.single ⟨10880,10944,20032,20096⟩) (.node (.single ⟨10944,10976,19968,20000⟩) (.single ⟨10944,10976,20000,20032⟩)))) (.node (.node (.single ⟨10976,10992,19968,19984⟩) (.node (.single ⟨10976,10992,19984,20000⟩) (.single ⟨10992,11008,19968,19984⟩))) (.node (.node (.single ⟨10992,11008,19984,20000⟩) (.single ⟨10976,11008,20000,20032⟩)) (.node (.single ⟨10944,11008,20032,20096⟩) (.single ⟨10880,11008,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,21760,21888⟩) (.node (.single ⟨12544,12672,21888,22016⟩) (.single ⟨12672,12736,21760,21824⟩))) (.node (.single ⟨12672,12736,21824,21888⟩) (.node (.single ⟨12736,12768,21760,21792⟩) (.single ⟨12736,12768,21792,21824⟩)))) (.node (.node (.single ⟨12768,12784,21760,21776⟩) (.node (.single ⟨12768,12784,21776,21792⟩) (.single ⟨12784,12800,21760,21776⟩))) (.node (.node (.single ⟨12784,12800,21776,21792⟩) (.single ⟨12768,12800,21792,21824⟩)) (.node (.single ⟨12736,12800,21824,21888⟩) (.single ⟨12672,12800,21888,22016⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,10752,10880⟩) (.node (.single ⟨19968,20032,10880,10944⟩) (.single ⟨19968,20000,10944,10976⟩))) (.node (.single ⟨19968,19984,10976,10992⟩) (.node (.single ⟨19968,19984,10992,11008⟩) (.single ⟨19984,20000,10976,10992⟩)))) (.node (.node (.single ⟨19984,20000,10992,11008⟩) (.node (.single ⟨20000,20032,10944,10976⟩) (.single ⟨20000,20032,10976,11008⟩))) (.node (.node (.single ⟨20032,20096,10880,10944⟩) (.single ⟨20032,20096,10944,11008⟩)) (.node (.single ⟨20096,20224,10752,10880⟩) (.single ⟨20096,20224,10880,11008⟩))))) (.node (.node (.node (.single ⟨21760,21888,12544,12672⟩) (.node (.single ⟨21760,21824,12672,12736⟩) (.single ⟨21760,21792,12736,12768⟩))) (.node (.single ⟨21760,21776,12768,12784⟩) (.node (.single ⟨21760,21776,12784,12800⟩) (.single ⟨21776,21792,12768,12784⟩)))) (.node (.node (.single ⟨21776,21792,12784,12800⟩) (.node (.single ⟨21792,21824,12736,12768⟩) (.single ⟨21792,21824,12768,12800⟩))) (.node (.node (.single ⟨21824,21888,12672,12736⟩) (.single ⟨21824,21888,12736,12800⟩)) (.node (.single ⟨21888,22016,12544,12672⟩) (.single ⟨21888,22016,12672,12800⟩)))))))
def output1 : Fin 52 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 37)))) (.node (.node (.single 50) (.node (.single 14) (.single 12))) (.node (.node (.single 38) (.single 39)) (.node (.single 13) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 35) (.single 48)))) (.node (.node (.single 16) (.node (.single 11) (.single 36))) (.node (.node (.single 40) (.single 15)) (.node (.single 4) (.single 28)))))) (.node (.node (.node (.node (.single 47) (.node (.single 23) (.single 5))) (.node (.single 33) (.node (.single 46) (.single 18)))) (.node (.node (.single 10) (.node (.single 34) (.single 41))) (.node (.node (.single 17) (.single 6)) (.node (.single 29) (.single 45))))) (.node (.node (.node (.single 22) (.node (.single 7) (.single 31))) (.node (.single 44) (.node (.single 20) (.single 8)))) (.node (.node (.single 30) (.node (.single 43) (.single 21))) (.node (.node (.single 9) (.single 32)) (.node (.single 42) (.single 19)))))))
def sourceData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.single 16) (.node (.single 24) (.single 28)))) (.node (.node (.single 36) (.node (.single 40) (.single 44))) (.node (.node (.single 48) (.single 32)) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 23))) (.node (.single 19) (.node (.single 35) (.single 31)))) (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.node (.single 39) (.single 27)) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 13) (.single 25))) (.node (.single 37) (.node (.single 45) (.single 41)))) (.node (.node (.single 49) (.node (.single 29) (.single 33))) (.node (.node (.single 17) (.single 21)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.node (.single 22) (.single 34))) (.node (.single 50) (.node (.single 46) (.single 42)))) (.node (.node (.single 38) (.node (.single 30) (.single 26))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2)))))))
def cover1 (i : Fin 52) : Fin 52 := ⟨coverData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 52) : Fin 52 := ⟨sourceData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 .empty (.cutY 19968 .empty (.cutX 11008 (.cutY 20224 (.cutX 10880 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 10944 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 10976 (.cutY 20000 .full .full) (.cutY 20000 (.cutX 10992 (.cutY 19984 .full .full) (.cutY 19984 .full .full)) .full)) .full)) .full)) .empty) .empty)))) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 (.cutY 22016 (.cutX 12544 .empty (.cutY 21760 .empty (.cutX 12672 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 12736 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 12768 (.cutY 21792 .full .full) (.cutY 21792 (.cutX 12784 (.cutY 21776 .full .full) (.cutY 21776 .full .full)) .full)) .full)) .full)))) .empty) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 .empty (.cutY 10752 .empty (.cutX 20224 (.cutY 11008 (.cutX 20096 (.cutY 10880 .full (.cutX 20032 (.cutY 10944 .full (.cutX 20000 (.cutY 10976 .full (.cutX 19984 (.cutY 10992 .full .full) (.cutY 10992 .full .full))) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty))) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 (.cutY 12800 (.cutX 21760 .empty (.cutY 12544 .empty (.cutX 21888 (.cutY 12672 .full (.cutX 21824 (.cutY 12736 .full (.cutX 21792 (.cutY 12768 .full (.cutX 21776 (.cutY 12784 .full .full) (.cutY 12784 .full .full))) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata1 : 0<177315334 ∧ 42<128 ∧ 78<128 ∧ 1<4 ∧
    7850/4160=1 ∧ 7850%4160=3690 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 4534, atom 6009, type 1, source (16,57).
def leavesData2 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves2 : Fin 13 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 57 leaves2 i
def outputData2 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,14592,14656⟩) (.node (.single ⟨4096,4160,14656,14720⟩) (.single ⟨4160,4224,14592,14656⟩))) (.node (.single ⟨4160,4224,14656,14720⟩) (.node (.single ⟨4096,4224,14720,14848⟩) (.single ⟨4224,4288,14592,14656⟩)))) (.node (.node (.single ⟨4224,4288,14656,14720⟩) (.node (.single ⟨4288,4320,14592,14624⟩) (.single ⟨4288,4320,14624,14656⟩))) (.node (.node (.single ⟨4320,4352,14592,14624⟩) (.single ⟨4320,4352,14624,14656⟩)) (.node (.single ⟨4288,4352,14656,14720⟩) (.single ⟨4224,4352,14720,14848⟩))))) (.node (.node (.node (.single ⟨14592,14656,4096,4160⟩) (.node (.single ⟨14592,14656,4160,4224⟩) (.single ⟨14656,14720,4096,4160⟩))) (.node (.single ⟨14656,14720,4160,4224⟩) (.node (.single ⟨14592,14656,4224,4288⟩) (.single ⟨14592,14624,4288,4320⟩)))) (.node (.node (.single ⟨14592,14624,4320,4352⟩) (.node (.single ⟨14624,14656,4288,4320⟩) (.single ⟨14624,14656,4320,4352⟩))) (.node (.node (.single ⟨14656,14720,4224,4288⟩) (.single ⟨14656,14720,4288,4352⟩)) (.node (.single ⟨14720,14848,4096,4224⟩) (.single ⟨14720,14848,4224,4352⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,28416,28544⟩) (.node (.single ⟨17920,18048,28544,28672⟩) (.single ⟨18048,18112,28416,28480⟩))) (.node (.single ⟨18048,18112,28480,28544⟩) (.node (.single ⟨18112,18144,28416,28448⟩) (.single ⟨18112,18144,28448,28480⟩)))) (.node (.node (.single ⟨18144,18176,28416,28448⟩) (.node (.single ⟨18144,18176,28448,28480⟩) (.single ⟨18112,18176,28480,28544⟩))) (.node (.node (.single ⟨18048,18112,28544,28608⟩) (.single ⟨18048,18112,28608,28672⟩)) (.node (.single ⟨18112,18176,28544,28608⟩) (.single ⟨18112,18176,28608,28672⟩))))) (.node (.node (.node (.single ⟨28416,28544,17920,18048⟩) (.node (.single ⟨28416,28480,18048,18112⟩) (.single ⟨28416,28448,18112,18144⟩))) (.node (.single ⟨28416,28448,18144,18176⟩) (.node (.single ⟨28448,28480,18112,18144⟩) (.single ⟨28448,28480,18144,18176⟩)))) (.node (.node (.single ⟨28480,28544,18048,18112⟩) (.node (.single ⟨28480,28544,18112,18176⟩) (.single ⟨28544,28672,17920,18048⟩))) (.node (.node (.single ⟨28544,28608,18048,18112⟩) (.single ⟨28544,28608,18112,18176⟩)) (.node (.single ⟨28608,28672,18048,18112⟩) (.single ⟨28608,28672,18112,18176⟩)))))))
def output2 : Fin 52 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData2 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover2 (i : Fin 52) : Fin 52 := ⟨coverData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 52) : Fin 52 := ⟨sourceData2.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 (.cutY 14848 (.cutX 4352 (.cutY 14592 .empty (.cutX 4224 (.cutY 14720 (.cutX 4160 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) .full) (.cutY 14720 (.cutX 4288 (.cutY 14656 .full .full) (.cutY 14656 (.cutX 4320 (.cutY 14624 .full .full) (.cutY 14624 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 (.cutY 4608 (.cutX 14592 .empty (.cutY 4352 (.cutX 14720 (.cutY 4224 (.cutX 14656 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 14656 (.cutY 4288 .full (.cutX 14624 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 .empty (.cutY 28160 .empty (.cutX 18176 (.cutY 28416 .empty (.cutX 18048 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 18112 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 18144 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 18112 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))) .empty)))))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 .empty (.cutY 17920 .empty (.cutX 28416 .empty (.cutY 18176 (.cutX 28544 (.cutY 18048 .full (.cutX 28480 (.cutY 18112 .full (.cutX 28448 (.cutY 18144 .full .full) (.cutY 18144 .full .full))) (.cutY 18112 .full .full))) (.cutY 18048 .full (.cutX 28608 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty)))))) .empty)) .empty) .empty) .empty))))

theorem metadata2 : 0<166308920 ∧ 16<128 ∧ 57<128 ∧ 1<4 ∧
    6009/4160=1 ∧ 6009%4160=1849 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 4535, atom 5173, type 1, source (8,53).
def leavesData3 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves3 : Fin 13 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 8 53 leaves3 i
def outputData3 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,13568,13632⟩) (.node (.single ⟨2048,2112,13632,13696⟩) (.single ⟨2112,2176,13568,13632⟩))) (.node (.single ⟨2112,2176,13632,13696⟩) (.node (.single ⟨2048,2176,13696,13824⟩) (.single ⟨2176,2240,13568,13632⟩)))) (.node (.node (.single ⟨2176,2240,13632,13696⟩) (.node (.single ⟨2240,2272,13568,13600⟩) (.single ⟨2240,2272,13600,13632⟩))) (.node (.node (.single ⟨2272,2304,13568,13600⟩) (.single ⟨2272,2304,13600,13632⟩)) (.node (.single ⟨2240,2304,13632,13696⟩) (.single ⟨2176,2304,13696,13824⟩))))) (.node (.node (.node (.single ⟨13568,13632,2048,2112⟩) (.node (.single ⟨13568,13632,2112,2176⟩) (.single ⟨13632,13696,2048,2112⟩))) (.node (.single ⟨13632,13696,2112,2176⟩) (.node (.single ⟨13568,13632,2176,2240⟩) (.single ⟨13568,13600,2240,2272⟩)))) (.node (.node (.single ⟨13568,13600,2272,2304⟩) (.node (.single ⟨13600,13632,2240,2272⟩) (.single ⟨13600,13632,2272,2304⟩))) (.node (.node (.single ⟨13632,13696,2176,2240⟩) (.single ⟨13632,13696,2240,2304⟩)) (.node (.single ⟨13696,13824,2048,2176⟩) (.single ⟨13696,13824,2176,2304⟩)))))) (.node (.node (.node (.node (.single ⟨18944,19072,30464,30592⟩) (.node (.single ⟨18944,19072,30592,30720⟩) (.single ⟨19072,19136,30464,30528⟩))) (.node (.single ⟨19072,19136,30528,30592⟩) (.node (.single ⟨19136,19168,30464,30496⟩) (.single ⟨19136,19168,30496,30528⟩)))) (.node (.node (.single ⟨19168,19200,30464,30496⟩) (.node (.single ⟨19168,19200,30496,30528⟩) (.single ⟨19136,19200,30528,30592⟩))) (.node (.node (.single ⟨19072,19136,30592,30656⟩) (.single ⟨19072,19136,30656,30720⟩)) (.node (.single ⟨19136,19200,30592,30656⟩) (.single ⟨19136,19200,30656,30720⟩))))) (.node (.node (.node (.single ⟨30464,30592,18944,19072⟩) (.node (.single ⟨30464,30528,19072,19136⟩) (.single ⟨30464,30496,19136,19168⟩))) (.node (.single ⟨30464,30496,19168,19200⟩) (.node (.single ⟨30496,30528,19136,19168⟩) (.single ⟨30496,30528,19168,19200⟩)))) (.node (.node (.single ⟨30528,30592,19072,19136⟩) (.node (.single ⟨30528,30592,19136,19200⟩) (.single ⟨30592,30720,18944,19072⟩))) (.node (.node (.single ⟨30592,30656,19072,19136⟩) (.single ⟨30592,30656,19136,19200⟩)) (.node (.single ⟨30656,30720,19072,19136⟩) (.single ⟨30656,30720,19136,19200⟩)))))))
def output3 : Fin 52 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData3 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover3 (i : Fin 52) : Fin 52 := ⟨coverData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 52) : Fin 52 := ⟨sourceData3.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 (.cutY 13824 (.cutX 2304 (.cutY 13568 .empty (.cutX 2176 (.cutY 13696 (.cutX 2112 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full) (.cutY 13696 (.cutX 2240 (.cutY 13632 .full .full) (.cutY 13632 (.cutX 2272 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 (.cutY 2560 (.cutX 13568 .empty (.cutY 2304 (.cutX 13696 (.cutY 2176 (.cutX 13632 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 13632 (.cutY 2240 .full (.cutX 13600 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 .empty (.cutY 30208 .empty (.cutX 19200 (.cutY 30464 .empty (.cutX 19072 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 19136 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 19168 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 19136 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)))) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 .empty (.cutY 18944 .empty (.cutX 30464 .empty (.cutY 19200 (.cutX 30592 (.cutY 19072 .full (.cutX 30528 (.cutY 19136 .full (.cutX 30496 (.cutY 19168 .full .full) (.cutY 19168 .full .full))) (.cutY 19136 .full .full))) (.cutY 19072 .full (.cutX 30656 (.cutY 19136 .full .full) (.cutY 19136 .full .full)))) .empty)))) .empty))) .empty) .empty)) .empty))))

theorem metadata3 : 0<144841863 ∧ 8<128 ∧ 53<128 ∧ 1<4 ∧
    5173/4160=1 ∧ 5173%4160=1013 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 4536, atom 6636, type 1, source (23,61).
def leavesData4 : FiniteInputTree DyadicLeaf 45 := (.node (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,2,2⟩) (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,2⟩))) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,1⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,2,0⟩) (.node (.single ⟨3,2,1⟩) (.single ⟨3,3,0⟩)))) (.node (.node (.single ⟨3,3,1⟩) (.node (.single ⟨3,6,2⟩) (.single ⟨3,6,3⟩))) (.node (.single ⟨3,7,2⟩) (.node (.single ⟨3,7,3⟩) (.single ⟨4,8,0⟩)))))) (.node (.node (.node (.node (.single ⟨4,8,1⟩) (.single ⟨4,9,0⟩)) (.node (.single ⟨4,9,1⟩) (.node (.single ⟨4,10,0⟩) (.single ⟨4,10,1⟩)))) (.node (.node (.single ⟨4,11,0⟩) (.node (.single ⟨4,11,1⟩) (.single ⟨4,12,1⟩))) (.node (.single ⟨4,13,1⟩) (.node (.single ⟨4,14,1⟩) (.single ⟨4,15,1⟩))))) (.node (.node (.node (.single ⟨5,24,0⟩) (.node (.single ⟨5,24,1⟩) (.single ⟨5,25,0⟩))) (.node (.single ⟨5,25,1⟩) (.node (.single ⟨5,26,0⟩) (.single ⟨5,26,1⟩)))) (.node (.node (.single ⟨5,27,0⟩) (.node (.single ⟨5,27,1⟩) (.single ⟨5,28,1⟩))) (.node (.single ⟨5,29,1⟩) (.node (.single ⟨5,30,1⟩) (.single ⟨5,31,1⟩)))))))
def leaves4 : Fin 45 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 180) : GridBox := phaseImageBoxes 32768 8 23 61 leaves4 i
def outputData4 : FiniteInputTree GridBox 180 := (.node (.node (.node (.node (.node (.node (.node (.single ⟨5888,5952,15616,15680⟩) (.single ⟨5888,5952,15680,15744⟩)) (.node (.single ⟨5952,5984,15616,15648⟩) (.node (.single ⟨5952,5984,15648,15680⟩) (.single ⟨5984,6016,15616,15648⟩)))) (.node (.node (.single ⟨5984,6016,15648,15680⟩) (.node (.single ⟨5952,6016,15680,15744⟩) (.single ⟨5888,6016,15744,15872⟩))) (.node (.single ⟨6016,6032,15616,15632⟩) (.node (.single ⟨6016,6032,15632,15648⟩) (.single ⟨6032,6048,15616,15632⟩))))) (.node (.node (.node (.single ⟨6032,6048,15632,15648⟩) (.single ⟨6016,6048,15648,15680⟩)) (.node (.single ⟨6048,6064,15616,15632⟩) (.node (.single ⟨6048,6064,15632,15648⟩) (.single ⟨6064,6080,15616,15632⟩)))) (.node (.node (.single ⟨6064,6080,15632,15648⟩) (.node (.single ⟨6048,6080,15648,15680⟩) (.single ⟨6016,6080,15680,15744⟩))) (.node (.single ⟨6080,6088,15616,15624⟩) (.node (.single ⟨6080,6088,15624,15632⟩) (.single ⟨6088,6096,15616,15624⟩)))))) (.node (.node (.node (.node (.single ⟨6088,6096,15624,15632⟩) (.single ⟨6080,6096,15632,15648⟩)) (.node (.single ⟨6096,6104,15616,15624⟩) (.node (.single ⟨6096,6104,15624,15632⟩) (.single ⟨6104,6112,15616,15624⟩)))) (.node (.node (.single ⟨6104,6112,15624,15632⟩) (.node (.single ⟨6096,6112,15632,15648⟩) (.single ⟨6080,6112,15648,15680⟩))) (.node (.single ⟨6112,6120,15624,15632⟩) (.node (.single ⟨6120,6128,15624,15632⟩) (.single ⟨6112,6128,15632,15648⟩))))) (.node (.node (.node (.single ⟨6128,6136,15624,15632⟩) (.node (.single ⟨6136,6144,15624,15632⟩) (.single ⟨6128,6144,15632,15648⟩))) (.node (.single ⟨6112,6144,15648,15680⟩) (.node (.single ⟨6080,6112,15680,15712⟩) (.single ⟨6080,6112,15712,15744⟩)))) (.node (.node (.single ⟨6112,6144,15680,15712⟩) (.node (.single ⟨6112,6144,15712,15744⟩) (.single ⟨6016,6080,15744,15808⟩))) (.node (.single ⟨6016,6080,15808,15872⟩) (.node (.single ⟨6080,6144,15744,15808⟩) (.single ⟨6080,6144,15808,15872⟩))))))) (.node (.node (.node (.node (.node (.single ⟨15616,15680,5888,5952⟩) (.single ⟨15616,15648,5952,5984⟩)) (.node (.single ⟨15616,15648,5984,6016⟩) (.node (.single ⟨15648,15680,5952,5984⟩) (.single ⟨15648,15680,5984,6016⟩)))) (.node (.node (.single ⟨15680,15744,5888,5952⟩) (.node (.single ⟨15680,15744,5952,6016⟩) (.single ⟨15616,15632,6016,6032⟩))) (.node (.single ⟨15616,15632,6032,6048⟩) (.node (.single ⟨15632,15648,6016,6032⟩) (.single ⟨15632,15648,6032,6048⟩))))) (.node (.node (.node (.single ⟨15616,15632,6048,6064⟩) (.single ⟨15616,15632,6064,6080⟩)) (.node (.single ⟨15632,15648,6048,6064⟩) (.node (.single ⟨15632,15648,6064,6080⟩) (.single ⟨15648,15680,6016,6048⟩)))) (.node (.node (.single ⟨15648,15680,6048,6080⟩) (.node (.single ⟨15616,15624,6080,6088⟩) (.single ⟨15616,15624,6088,6096⟩))) (.node (.single ⟨15624,15632,6080,6088⟩) (.node (.single ⟨15624,15632,6088,6096⟩) (.single ⟨15616,15624,6096,6104⟩)))))) (.node (.node (.node (.node (.single ⟨15616,15624,6104,6112⟩) (.single ⟨15624,15632,6096,6104⟩)) (.node (.single ⟨15624,15632,6104,6112⟩) (.node (.single ⟨15632,15648,6080,6096⟩) (.single ⟨15632,15648,6096,6112⟩)))) (.node (.node (.single ⟨15624,15632,6112,6120⟩) (.node (.single ⟨15624,15632,6120,6128⟩) (.single ⟨15624,15632,6128,6136⟩))) (.node (.single ⟨15624,15632,6136,6144⟩) (.node (.single ⟨15632,15648,6112,6128⟩) (.single ⟨15632,15648,6128,6144⟩))))) (.node (.node (.node (.single ⟨15648,15680,6080,6112⟩) (.node (.single ⟨15648,15680,6112,6144⟩) (.single ⟨15680,15744,6016,6080⟩))) (.node (.single ⟨15680,15712,6080,6112⟩) (.node (.single ⟨15680,15712,6112,6144⟩) (.single ⟨15712,15744,6080,6112⟩)))) (.node (.node (.single ⟨15712,15744,6112,6144⟩) (.node (.single ⟨15744,15872,5888,6016⟩) (.single ⟨15744,15808,6016,6080⟩))) (.node (.single ⟨15744,15808,6080,6144⟩) (.node (.single ⟨15808,15872,6016,6080⟩) (.single ⟨15808,15872,6080,6144⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨16896,16960,26624,26688⟩) (.single ⟨16896,16960,26688,26752⟩)) (.node (.single ⟨16960,17024,26624,26688⟩) (.node (.single ⟨16960,17024,26688,26752⟩) (.single ⟨16896,17024,26752,26880⟩)))) (.node (.node (.single ⟨17024,17056,26624,26656⟩) (.node (.single ⟨17024,17056,26656,26688⟩) (.single ⟨17056,17088,26624,26656⟩))) (.node (.single ⟨17056,17088,26656,26688⟩) (.node (.single ⟨17024,17088,26688,26752⟩) (.single ⟨17088,17120,26624,26656⟩))))) (.node (.node (.node (.single ⟨17088,17120,26656,26688⟩) (.single ⟨17120,17136,26624,26640⟩)) (.node (.single ⟨17120,17136,26640,26656⟩) (.node (.single ⟨17136,17144,26624,26632⟩) (.single ⟨17136,17144,26632,26640⟩)))) (.node (.node (.single ⟨17136,17144,26640,26648⟩) (.node (.single ⟨17136,17144,26648,26656⟩) (.single ⟨17120,17136,26656,26672⟩))) (.node (.single ⟨17120,17136,26672,26688⟩) (.node (.single ⟨17136,17144,26656,26664⟩) (.single ⟨17136,17144,26664,26672⟩)))))) (.node (.node (.node (.node (.single ⟨17144,17152,26656,26664⟩) (.single ⟨17144,17152,26664,26672⟩)) (.node (.single ⟨17136,17144,26672,26680⟩) (.node (.single ⟨17136,17144,26680,26688⟩) (.single ⟨17144,17152,26672,26680⟩)))) (.node (.node (.single ⟨17144,17152,26680,26688⟩) (.node (.single ⟨17088,17120,26688,26720⟩) (.single ⟨17088,17120,26720,26752⟩))) (.node (.single ⟨17120,17136,26688,26704⟩) (.node (.single ⟨17120,17136,26704,26720⟩) (.single ⟨17136,17152,26688,26704⟩))))) (.node (.node (.node (.single ⟨17136,17152,26704,26720⟩) (.node (.single ⟨17120,17136,26720,26736⟩) (.single ⟨17120,17136,26736,26752⟩))) (.node (.single ⟨17136,17152,26720,26736⟩) (.node (.single ⟨17136,17152,26736,26752⟩) (.single ⟨17024,17088,26752,26816⟩)))) (.node (.node (.single ⟨17024,17088,26816,26880⟩) (.node (.single ⟨17088,17120,26752,26784⟩) (.single ⟨17088,17120,26784,26816⟩))) (.node (.single ⟨17120,17152,26752,26784⟩) (.node (.single ⟨17120,17152,26784,26816⟩) (.single ⟨17088,17152,26816,26880⟩))))))) (.node (.node (.node (.node (.node (.single ⟨26624,26688,16896,16960⟩) (.single ⟨26624,26688,16960,17024⟩)) (.node (.single ⟨26688,26752,16896,16960⟩) (.node (.single ⟨26688,26752,16960,17024⟩) (.single ⟨26624,26656,17024,17056⟩)))) (.node (.node (.single ⟨26624,26656,17056,17088⟩) (.node (.single ⟨26656,26688,17024,17056⟩) (.single ⟨26656,26688,17056,17088⟩))) (.node (.single ⟨26624,26656,17088,17120⟩) (.node (.single ⟨26624,26640,17120,17136⟩) (.single ⟨26624,26632,17136,17144⟩))))) (.node (.node (.node (.single ⟨26632,26640,17136,17144⟩) (.single ⟨26640,26656,17120,17136⟩)) (.node (.single ⟨26640,26648,17136,17144⟩) (.node (.single ⟨26648,26656,17136,17144⟩) (.single ⟨26656,26688,17088,17120⟩)))) (.node (.node (.single ⟨26656,26672,17120,17136⟩) (.node (.single ⟨26656,26664,17136,17144⟩) (.single ⟨26656,26664,17144,17152⟩))) (.node (.single ⟨26664,26672,17136,17144⟩) (.node (.single ⟨26664,26672,17144,17152⟩) (.single ⟨26672,26688,17120,17136⟩)))))) (.node (.node (.node (.node (.single ⟨26672,26680,17136,17144⟩) (.single ⟨26672,26680,17144,17152⟩)) (.node (.single ⟨26680,26688,17136,17144⟩) (.node (.single ⟨26680,26688,17144,17152⟩) (.single ⟨26688,26752,17024,17088⟩)))) (.node (.node (.single ⟨26688,26720,17088,17120⟩) (.node (.single ⟨26688,26704,17120,17136⟩) (.single ⟨26688,26704,17136,17152⟩))) (.node (.single ⟨26704,26720,17120,17136⟩) (.node (.single ⟨26704,26720,17136,17152⟩) (.single ⟨26720,26752,17088,17120⟩))))) (.node (.node (.node (.single ⟨26720,26736,17120,17136⟩) (.node (.single ⟨26720,26736,17136,17152⟩) (.single ⟨26736,26752,17120,17136⟩))) (.node (.single ⟨26736,26752,17136,17152⟩) (.node (.single ⟨26752,26880,16896,17024⟩) (.single ⟨26752,26816,17024,17088⟩)))) (.node (.node (.single ⟨26752,26784,17088,17120⟩) (.node (.single ⟨26752,26784,17120,17152⟩) (.single ⟨26784,26816,17088,17120⟩))) (.node (.single ⟨26784,26816,17120,17152⟩) (.node (.single ⟨26816,26880,17024,17088⟩) (.single ⟨26816,26880,17088,17152⟩)))))))))
def output4 : Fin 180 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 180 := (.node (.node (.node (.node (.node (.node (.node (.single 7) (.single 85)) (.node (.single 172) (.node (.single 94) (.single 0)))) (.node (.node (.single 45) (.node (.single 179) (.single 134))) (.node (.single 1) (.node (.single 50) (.single 178))))) (.node (.node (.node (.single 129) (.single 6)) (.node (.single 51) (.node (.single 173) (.single 128)))) (.node (.node (.single 18) (.node (.single 80) (.single 161))) (.node (.single 99) (.node (.single 41) (.single 86)))))) (.node (.node (.node (.node (.single 138) (.single 93)) (.node (.single 42) (.node (.single 88) (.single 137)))) (.node (.node (.single 91) (.node (.single 43) (.single 87))) (.node (.single 136) (.node (.single 92) (.single 44))))) (.node (.node (.node (.single 89) (.node (.single 135) (.single 90))) (.node (.single 12) (.node (.single 60) (.single 167)))) (.node (.node (.single 119) (.node (.single 17) (.single 61))) (.node (.single 162) (.node (.single 118) (.single 29))))))) (.node (.node (.node (.node (.node (.single 78) (.single 150)) (.node (.single 101) (.node (.single 36) (.single 79)))) (.node (.node (.single 143) (.node (.single 100) (.single 2))) (.node (.single 46) (.node (.single 177) (.single 133))))) (.node (.node (.node (.single 3) (.single 48)) (.node (.single 176) (.node (.single 131) (.single 4)))) (.node (.node (.single 47) (.node (.single 175) (.single 132))) (.node (.single 5) (.node (.single 49) (.single 174)))))) (.node (.node (.node (.node (.single 130) (.single 37)) (.node (.single 81) (.node (.single 142) (.single 98)))) (.node (.node (.single 38) (.node (.single 83) (.single 141))) (.node (.single 96) (.node (.single 39) (.single 82))))) (.node (.node (.node (.single 140) (.node (.single 97) (.single 40))) (.node (.single 84) (.node (.single 139) (.single 95)))) (.node (.node (.single 8) (.node (.single 52) (.single 171))) (.node (.single 127) (.node (.single 9) (.single 54)))))))) (.node (.node (.node (.node (.node (.node (.single 170) (.single 125)) (.node (.single 10) (.node (.single 53) (.single 169)))) (.node (.node (.single 126) (.node (.single 11) (.single 55))) (.node (.single 168) (.node (.single 124) (.single 13))))) (.node (.node (.node (.single 56) (.single 166)) (.node (.single 123) (.node (.single 14) (.single 58)))) (.node (.node (.single 165) (.node (.single 121) (.single 15))) (.node (.single 57) (.node (.single 164) (.single 122)))))) (.node (.node (.node (.node (.single 16) (.single 59)) (.node (.single 163) (.node (.single 120) (.single 23)))) (.node (.node (.single 70) (.node (.single 156) (.single 109))) (.node (.single 28) (.node (.single 71) (.single 151))))) (.node (.node (.node (.single 108) (.node (.single 32) (.single 76))) (.node (.single 147) (.node (.single 103) (.single 35)))) (.node (.node (.single 77) (.node (.single 144) (.single 102))) (.node (.single 19) (.node (.single 62) (.single 160))))))) (.node (.node (.node (.node (.node (.single 117) (.single 20)) (.node (.single 64) (.node (.single 159) (.single 115)))) (.node (.node (.single 21) (.node (.single 63) (.single 158))) (.node (.single 116) (.node (.single 22) (.single 65))))) (.node (.node (.node (.single 157) (.single 114)) (.node (.single 24) (.node (.single 66) (.single 155)))) (.node (.node (.single 113) (.node (.single 25) (.single 68))) (.node (.single 154) (.node (.single 111) (.single 26)))))) (.node (.node (.node (.node (.single 67) (.single 153)) (.node (.single 112) (.node (.single 27) (.single 69)))) (.node (.node (.single 152) (.node (.single 110) (.single 30))) (.node (.single 72) (.node (.single 149) (.single 107))))) (.node (.node (.node (.single 31) (.node (.single 73) (.single 148))) (.node (.single 106) (.node (.single 33) (.single 74)))) (.node (.node (.single 146) (.node (.single 105) (.single 34))) (.node (.single 75) (.node (.single 145) (.single 104)))))))))
def sourceData4 : FiniteInputTree ℕ 180 := (.node (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 52) (.node (.single 56) (.single 60)))) (.node (.node (.single 64) (.node (.single 12) (.single 0))) (.node (.single 84) (.node (.single 88) (.single 92))))) (.node (.node (.node (.single 96) (.single 36)) (.node (.single 100) (.node (.single 104) (.single 108)))) (.node (.node (.single 112) (.node (.single 40) (.single 16))) (.node (.single 132) (.node (.single 136) (.single 140)))))) (.node (.node (.node (.node (.single 144) (.single 116)) (.node (.single 148) (.node (.single 152) (.single 156)))) (.node (.node (.single 160) (.node (.single 120) (.single 44))) (.node (.single 164) (.node (.single 168) (.single 124))))) (.node (.node (.node (.single 172) (.node (.single 176) (.single 128))) (.node (.single 48) (.node (.single 68) (.single 72)))) (.node (.node (.single 76) (.node (.single 80) (.single 20))) (.node (.single 24) (.node (.single 28) (.single 32))))))) (.node (.node (.node (.node (.node (.single 5) (.single 53)) (.node (.single 61) (.node (.single 57) (.single 65)))) (.node (.node (.single 9) (.node (.single 13) (.single 85))) (.node (.single 93) (.node (.single 89) (.single 97))))) (.node (.node (.node (.single 101) (.single 109)) (.node (.single 105) (.node (.single 113) (.single 37)))) (.node (.node (.single 41) (.node (.single 133) (.single 141))) (.node (.single 137) (.node (.single 145) (.single 149)))))) (.node (.node (.node (.node (.single 157) (.single 153)) (.node (.single 161) (.node (.single 117) (.single 121)))) (.node (.node (.single 165) (.node (.single 169) (.single 173))) (.node (.single 177) (.node (.single 125) (.single 129))))) (.node (.node (.node (.single 45) (.node (.single 49) (.single 17))) (.node (.single 69) (.node (.single 77) (.single 73)))) (.node (.node (.single 81) (.node (.single 1) (.single 21))) (.node (.single 29) (.node (.single 25) (.single 33)))))))) (.node (.node (.node (.node (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.node (.single 23) (.single 3)))) (.node (.node (.single 83) (.node (.single 75) (.single 79))) (.node (.single 71) (.node (.single 19) (.single 51))))) (.node (.node (.node (.single 47) (.single 131)) (.node (.single 127) (.node (.single 179) (.single 175)))) (.node (.node (.single 171) (.node (.single 167) (.single 123))) (.node (.single 119) (.node (.single 163) (.single 155)))))) (.node (.node (.node (.node (.single 159) (.single 151)) (.node (.single 147) (.node (.single 139) (.single 143)))) (.node (.node (.single 135) (.node (.single 43) (.single 39))) (.node (.single 115) (.node (.single 107) (.single 111))))) (.node (.node (.node (.single 103) (.node (.single 99) (.single 91))) (.node (.single 95) (.node (.single 87) (.single 15)))) (.node (.node (.single 11) (.node (.single 67) (.single 59))) (.node (.single 63) (.node (.single 55) (.single 7))))))) (.node (.node (.node (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.node (.single 22) (.single 82)))) (.node (.node (.single 78) (.node (.single 74) (.single 70))) (.node (.single 50) (.node (.single 130) (.single 178))))) (.node (.node (.node (.single 174) (.single 126)) (.node (.single 170) (.node (.single 166) (.single 46)))) (.node (.node (.single 122) (.node (.single 162) (.single 158))) (.node (.single 154) (.node (.single 150) (.single 118)))))) (.node (.node (.node (.node (.single 146) (.single 142)) (.node (.single 138) (.node (.single 134) (.single 18)))) (.node (.node (.single 42) (.node (.single 114) (.single 110))) (.node (.single 106) (.node (.single 102) (.single 38))))) (.node (.node (.node (.single 98) (.node (.single 94) (.single 90))) (.node (.single 86) (.node (.single 2) (.single 14)))) (.node (.node (.single 66) (.node (.single 62) (.single 58))) (.node (.single 54) (.node (.single 10) (.single 6)))))))))
def cover4 (i : Fin 180) : Fin 180 := ⟨coverData4.get i % 180, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 180) : Fin 180 := ⟨sourceData4.get i % 180, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 .empty (.cutY 15872 (.cutX 5888 .empty (.cutY 15616 .empty (.cutX 6016 (.cutY 15744 (.cutX 5952 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 5984 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full) (.cutY 15744 (.cutX 6080 (.cutY 15680 (.cutX 6048 (.cutY 15648 (.cutX 6032 (.cutY 15632 .full .full) (.cutY 15632 .full .full)) .full) (.cutY 15648 (.cutX 6064 (.cutY 15632 .full .full) (.cutY 15632 .full .full)) .full)) .full) (.cutY 15680 (.cutX 6112 (.cutY 15648 (.cutX 6096 (.cutY 15632 (.cutX 6088 (.cutY 15624 .full .full) (.cutY 15624 .full .full)) .full) (.cutY 15632 (.cutX 6104 (.cutY 15624 .full .full) (.cutY 15624 .full .full)) .full)) .full) (.cutY 15648 (.cutX 6128 (.cutY 15632 (.cutX 6120 (.cutY 15624 .empty .full) (.cutY 15624 .empty .full)) .full) (.cutY 15632 (.cutX 6136 (.cutY 15624 .empty .full) (.cutY 15624 .empty .full)) .full)) .full)) (.cutX 6112 (.cutY 15712 .full .full) (.cutY 15712 .full .full)))) (.cutX 6080 (.cutY 15808 .full .full) (.cutY 15808 .full .full)))))) .empty))))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 (.cutY 5632 .empty (.cutX 15616 .empty (.cutY 5888 .empty (.cutX 15744 (.cutY 6016 (.cutX 15680 (.cutY 5952 .full (.cutX 15648 (.cutY 5984 .full .full) (.cutY 5984 .full .full))) (.cutY 5952 .full .full)) (.cutX 15680 (.cutY 6080 (.cutX 15648 (.cutY 6048 (.cutX 15632 (.cutY 6032 .full .full) (.cutY 6032 .full .full)) (.cutX 15632 (.cutY 6064 .full .full) (.cutY 6064 .full .full))) (.cutY 6048 .full .full)) (.cutX 15648 (.cutY 6112 (.cutX 15632 (.cutY 6096 (.cutX 15624 (.cutY 6088 .full .full) (.cutY 6088 .full .full)) (.cutX 15624 (.cutY 6104 .full .full) (.cutY 6104 .full .full))) (.cutY 6096 .full .full)) (.cutX 15632 (.cutY 6128 (.cutX 15624 .empty (.cutY 6120 .full .full)) (.cutX 15624 .empty (.cutY 6136 .full .full))) (.cutY 6128 .full .full))) (.cutY 6112 .full .full))) (.cutY 6080 .full (.cutX 15712 (.cutY 6112 .full .full) (.cutY 6112 .full .full))))) (.cutY 6016 .full (.cutX 15808 (.cutY 6080 .full .full) (.cutY 6080 .full .full))))))) .empty))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 .empty (.cutY 27136 (.cutX 17152 (.cutY 26880 (.cutX 17024 (.cutY 26752 (.cutX 16960 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full) (.cutY 26752 (.cutX 17088 (.cutY 26688 (.cutX 17056 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full) (.cutY 26688 (.cutX 17120 (.cutY 26656 .full .full) (.cutY 26656 (.cutX 17136 (.cutY 26640 .full .full) (.cutY 26640 (.cutX 17144 (.cutY 26632 .full .full) .empty) (.cutX 17144 (.cutY 26648 .full .full) .empty))) (.cutX 17136 (.cutY 26672 .full .full) (.cutY 26672 (.cutX 17144 (.cutY 26664 .full .full) (.cutY 26664 .full .full)) (.cutX 17144 (.cutY 26680 .full .full) (.cutY 26680 .full .full)))))) (.cutX 17120 (.cutY 26720 .full .full) (.cutY 26720 (.cutX 17136 (.cutY 26704 .full .full) (.cutY 26704 .full .full)) (.cutX 17136 (.cutY 26736 .full .full) (.cutY 26736 .full .full)))))) (.cutX 17088 (.cutY 26816 .full .full) (.cutY 26816 (.cutX 17120 (.cutY 26784 .full .full) (.cutY 26784 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 (.cutY 16896 .empty (.cutX 26880 (.cutY 17152 (.cutX 26752 (.cutY 17024 (.cutX 26688 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) (.cutX 26688 (.cutY 17088 (.cutX 26656 (.cutY 17056 .full .full) (.cutY 17056 .full .full)) (.cutX 26656 (.cutY 17120 .full (.cutX 26640 (.cutY 17136 .full (.cutX 26632 (.cutY 17144 .full .empty) (.cutY 17144 .full .empty))) (.cutY 17136 .full (.cutX 26648 (.cutY 17144 .full .empty) (.cutY 17144 .full .empty))))) (.cutY 17120 .full (.cutX 26672 (.cutY 17136 .full (.cutX 26664 (.cutY 17144 .full .full) (.cutY 17144 .full .full))) (.cutY 17136 .full (.cutX 26680 (.cutY 17144 .full .full) (.cutY 17144 .full .full))))))) (.cutY 17088 .full (.cutX 26720 (.cutY 17120 .full (.cutX 26704 (.cutY 17136 .full .full) (.cutY 17136 .full .full))) (.cutY 17120 .full (.cutX 26736 (.cutY 17136 .full .full) (.cutY 17136 .full .full))))))) (.cutY 17024 .full (.cutX 26816 (.cutY 17088 .full (.cutX 26784 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata4 : 0<166308920 ∧ 23<128 ∧ 61<128 ∧ 1<4 ∧
    6636/4160=1 ∧ 6636%4160=2476 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 64,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 180 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked4_64 : ∀ i : Fin 64,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 180 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked4_128 : ∀ i : Fin 52,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 180 128 52 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 180, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) (forallFinOffset_add (fun i => output4 i = raw4 (source4 i)) 0 64 116 (by decide) sourceChecked4_0
    (forallFinOffset_add (fun i => output4 i = raw4 (source4 i)) 64 64 52 (by decide) sourceChecked4_64
    sourceChecked4_128))

theorem coverChecked4_0 : ∀ i : Fin 64,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 180 0 64 (by decide) i) := by decide +kernel

theorem coverChecked4_64 : ∀ i : Fin 64,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 180 64 64 (by decide) i) := by decide +kernel

theorem coverChecked4_128 : ∀ i : Fin 52,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 180 128 52 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 180, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
  forallFin_of_zero_offset (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (forallFinOffset_add (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) 0 64 116 (by decide) coverChecked4_0
    (forallFinOffset_add (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) 64 64 52 (by decide) coverChecked4_64
    coverChecked4_128))

theorem treeChecked4 : tree4.check ⟨0,32768,0,32768⟩ = true := by decide +kernel

theorem treeLeaves4 : List.ofFn output4 = tree4.leaves ⟨0,32768,0,32768⟩ := by
  unfold output4
  rw [FiniteInputTree.ofFn_get]
  rfl

theorem checked4 : gridTreeUnionCheck 32768 raw4 output4 cover4 source4 tree4 = true := by
  unfold gridTreeUnionCheck
  apply decide_eq_true_eq.mpr
  exact ⟨sourceChecked4, coverChecked4, treeChecked4, treeLeaves4⟩

theorem areaUnits4 : gridUnionAreaUnits output4 = 261120 := by decide +kernel

noncomputable def phaseMass4 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (212043873/2097152000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 4537, atom 6290, type 1, source (19,59).
def leavesData5 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves5 : Fin 10 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 19 59 leaves5 i
def outputData5 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4864,4992,15104,15232⟩) (.single ⟨4864,4992,15232,15360⟩)) (.node (.single ⟨4992,5056,15104,15168⟩) (.node (.single ⟨4992,5056,15168,15232⟩) (.single ⟨5056,5088,15104,15136⟩)))) (.node (.node (.single ⟨5056,5088,15136,15168⟩) (.single ⟨5088,5120,15104,15136⟩)) (.node (.single ⟨5088,5120,15136,15168⟩) (.node (.single ⟨5056,5120,15168,15232⟩) (.single ⟨4992,5120,15232,15360⟩))))) (.node (.node (.node (.single ⟨15104,15232,4864,4992⟩) (.single ⟨15104,15168,4992,5056⟩)) (.node (.single ⟨15104,15136,5056,5088⟩) (.node (.single ⟨15104,15136,5088,5120⟩) (.single ⟨15136,15168,5056,5088⟩)))) (.node (.node (.single ⟨15136,15168,5088,5120⟩) (.single ⟨15168,15232,4992,5056⟩)) (.node (.single ⟨15168,15232,5056,5120⟩) (.node (.single ⟨15232,15360,4864,4992⟩) (.single ⟨15232,15360,4992,5120⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17536,27648,27776⟩) (.single ⟨17408,17536,27776,27904⟩)) (.node (.single ⟨17536,17600,27648,27712⟩) (.node (.single ⟨17536,17600,27712,27776⟩) (.single ⟨17600,17632,27648,27680⟩)))) (.node (.node (.single ⟨17600,17632,27680,27712⟩) (.single ⟨17632,17664,27648,27680⟩)) (.node (.single ⟨17632,17664,27680,27712⟩) (.node (.single ⟨17600,17664,27712,27776⟩) (.single ⟨17536,17664,27776,27904⟩))))) (.node (.node (.node (.single ⟨27648,27776,17408,17536⟩) (.single ⟨27648,27712,17536,17600⟩)) (.node (.single ⟨27648,27680,17600,17632⟩) (.node (.single ⟨27648,27680,17632,17664⟩) (.single ⟨27680,27712,17600,17632⟩)))) (.node (.node (.single ⟨27680,27712,17632,17664⟩) (.single ⟨27712,27776,17536,17600⟩)) (.node (.single ⟨27712,27776,17600,17664⟩) (.node (.single ⟨27776,27904,17408,17536⟩) (.single ⟨27776,27904,17536,17664⟩)))))))
def output5 : Fin 40 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData5 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover5 (i : Fin 40) : Fin 40 := ⟨coverData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 40) : Fin 40 := ⟨sourceData5.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 .empty (.cutY 14848 .empty (.cutX 4864 .empty (.cutY 15104 .empty (.cutX 4992 (.cutY 15232 .full .full) (.cutY 15232 (.cutX 5056 (.cutY 15168 .full .full) (.cutY 15168 (.cutX 5088 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full)) .full)))))) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 .empty (.cutY 4608 .empty (.cutX 15104 .empty (.cutY 4864 .empty (.cutX 15232 (.cutY 4992 .full (.cutX 15168 (.cutY 5056 .full (.cutX 15136 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 (.cutY 28160 (.cutX 17664 (.cutY 27904 (.cutX 17536 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 17600 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 17632 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 (.cutY 17920 (.cutX 27904 (.cutY 17664 (.cutX 27776 (.cutY 17536 .full (.cutX 27712 (.cutY 17600 .full (.cutX 27680 (.cutY 17632 .full .full) (.cutY 17632 .full .full))) (.cutY 17600 .full .full))) (.cutY 17536 .full .full)) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty) .empty))))

theorem metadata5 : 0<166308920 ∧ 19<128 ∧ 59<128 ∧ 1<4 ∧
    6290/4160=1 ∧ 6290%4160=2130 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 4538, atom 2562, type 0, source (24,66).
def leavesData6 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves6 : Fin 7 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 66 leaves6 i
def outputData6 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,16896,17024⟩) (.node (.single ⟨6144,6272,17024,17152⟩) (.single ⟨6272,6336,16896,16960⟩))) (.node (.node (.single ⟨6272,6336,16960,17024⟩) (.single ⟨6336,6400,16896,16960⟩)) (.node (.single ⟨6336,6400,16960,17024⟩) (.single ⟨6272,6400,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,26368,26496⟩) (.node (.single ⟨15616,15744,26496,26624⟩) (.single ⟨15744,15808,26368,26432⟩))) (.node (.node (.single ⟨15744,15808,26432,26496⟩) (.single ⟨15808,15872,26368,26432⟩)) (.node (.single ⟨15808,15872,26432,26496⟩) (.single ⟨15744,15872,26496,26624⟩))))) (.node (.node (.node (.single ⟨16896,17024,6144,6272⟩) (.node (.single ⟨16896,16960,6272,6336⟩) (.single ⟨16896,16960,6336,6400⟩))) (.node (.node (.single ⟨16960,17024,6272,6336⟩) (.single ⟨16960,17024,6336,6400⟩)) (.node (.single ⟨17024,17152,6144,6272⟩) (.single ⟨17024,17152,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,15616,15744⟩) (.node (.single ⟨26368,26432,15744,15808⟩) (.single ⟨26368,26432,15808,15872⟩))) (.node (.node (.single ⟨26432,26496,15744,15808⟩) (.single ⟨26432,26496,15808,15872⟩)) (.node (.single ⟨26496,26624,15616,15744⟩) (.single ⟨26496,26624,15744,15872⟩))))))
def output6 : Fin 28 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover6 (i : Fin 28) : Fin 28 := ⟨coverData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 28) : Fin 28 := ⟨sourceData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 (.cutY 16896 .empty (.cutX 6400 (.cutY 17152 (.cutX 6272 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 6336 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 (.cutY 26112 .empty (.cutX 15616 .empty (.cutY 26368 .empty (.cutX 15744 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 15808 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full))))) .empty))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 .empty (.cutY 6656 (.cutX 17152 (.cutY 6400 (.cutX 17024 (.cutY 6272 .full (.cutX 16960 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 .empty (.cutY 15872 (.cutX 26368 .empty (.cutY 15616 .empty (.cutX 26496 (.cutY 15744 .full (.cutX 26432 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty))))) .empty)) .empty))) .empty))

theorem metadata6 : 0<170092456 ∧ 24<128 ∧ 66<128 ∧ 0<4 ∧
    2562/4160=0 ∧ 2562%4160=2562 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

noncomputable def phaseMass6 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw6 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass6_eq : phaseMass6 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass6
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw6 output6 cover6 source6
    (gridTreeUnionCheck_sound 32768 raw6 output6 cover6 source6 tree6 checked6)
    _ (by norm_num) _, areaUnits6]
  norm_num

-- Frozen phase 4539, atom 2941, type 0, source (29,70).
def leavesData7 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves7 : Fin 4 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 70 leaves7 i
def outputData7 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,17920,18048⟩) (.single ⟨7424,7552,18048,18176⟩)) (.node (.single ⟨7552,7680,17920,18048⟩) (.single ⟨7552,7680,18048,18176⟩))) (.node (.node (.single ⟨14592,14720,25088,25216⟩) (.single ⟨14592,14720,25216,25344⟩)) (.node (.single ⟨14720,14848,25088,25216⟩) (.single ⟨14720,14848,25216,25344⟩)))) (.node (.node (.node (.single ⟨17920,18048,7424,7552⟩) (.single ⟨17920,18048,7552,7680⟩)) (.node (.single ⟨18048,18176,7424,7552⟩) (.single ⟨18048,18176,7552,7680⟩))) (.node (.node (.single ⟨25088,25216,14592,14720⟩) (.single ⟨25088,25216,14720,14848⟩)) (.node (.single ⟨25216,25344,14592,14720⟩) (.single ⟨25216,25344,14720,14848⟩)))))
def output7 : Fin 16 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData7 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover7 (i : Fin 16) : Fin 16 := ⟨coverData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 16) : Fin 16 := ⟨sourceData7.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 (.cutY 17920 .empty (.cutX 7424 .empty (.cutY 18176 (.cutX 7552 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty))) .empty))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 (.cutY 25088 .empty (.cutX 14592 .empty (.cutY 25344 (.cutX 14720 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty))) .empty) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 .empty (.cutY 7680 (.cutX 18176 (.cutY 7424 .empty (.cutX 18048 (.cutY 7552 .full .full) (.cutY 7552 .full .full))) .empty) .empty))))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 .empty (.cutY 14848 (.cutX 25344 (.cutY 14592 .empty (.cutX 25216 (.cutY 14720 .full .full) (.cutY 14720 .full .full))) .empty) .empty)) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata7 : 0<170092456 ∧ 29<128 ∧ 70<128 ∧ 0<4 ∧
    2941/4160=0 ∧ 2941%4160=2941 ∧ ∀ i, (leaves7 i).Valid 8 := by
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 4540, atom 1853, type 0, source (16,61).
def leavesData8 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves8 : Fin 4 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 61 leaves8 i
def outputData8 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,15616,15744⟩) (.single ⟨4096,4224,15744,15872⟩)) (.node (.single ⟨4224,4352,15616,15744⟩) (.single ⟨4224,4352,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,4096,4224⟩) (.single ⟨15616,15744,4224,4352⟩)) (.node (.single ⟨15744,15872,4096,4224⟩) (.single ⟨15744,15872,4224,4352⟩)))) (.node (.node (.node (.single ⟨16896,17024,28416,28544⟩) (.single ⟨16896,17024,28544,28672⟩)) (.node (.single ⟨17024,17152,28416,28544⟩) (.single ⟨17024,17152,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,16896,17024⟩) (.single ⟨28416,28544,17024,17152⟩)) (.node (.single ⟨28544,28672,16896,17024⟩) (.single ⟨28544,28672,17024,17152⟩)))))
def output8 : Fin 16 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData8 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover8 (i : Fin 16) : Fin 16 := ⟨coverData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 16) : Fin 16 := ⟨sourceData8.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 (.cutY 15872 (.cutX 4352 (.cutY 15616 .empty (.cutX 4224 (.cutY 15744 .full .full) (.cutY 15744 .full .full))) .empty) .empty) .empty)) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 (.cutY 4608 (.cutX 15616 .empty (.cutY 4352 (.cutX 15744 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 .empty (.cutY 28160 .empty (.cutX 17152 (.cutY 28416 .empty (.cutX 17024 (.cutY 28544 .full .full) (.cutY 28544 .full .full))) .empty)))) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 .empty (.cutY 16896 .empty (.cutX 28416 .empty (.cutY 17152 (.cutX 28544 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty)))) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata8 : 0<185830537 ∧ 16<128 ∧ 61<128 ∧ 0<4 ∧
    1853/4160=0 ∧ 1853%4160=1853 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 4541, atom 7487, type 1, source (35,72).
def leavesData9 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves9 : Fin 7 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 72 leaves9 i
def outputData9 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,18432,18560⟩) (.node (.single ⟨8960,9088,18560,18688⟩) (.single ⟨9088,9152,18432,18496⟩))) (.node (.node (.single ⟨9088,9152,18496,18560⟩) (.single ⟨9152,9216,18432,18496⟩)) (.node (.single ⟨9152,9216,18496,18560⟩) (.single ⟨9088,9216,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,23552,23680⟩) (.node (.single ⟨14080,14208,23680,23808⟩) (.single ⟨14208,14272,23552,23616⟩))) (.node (.node (.single ⟨14208,14272,23616,23680⟩) (.single ⟨14272,14336,23552,23616⟩)) (.node (.single ⟨14272,14336,23616,23680⟩) (.single ⟨14208,14336,23680,23808⟩))))) (.node (.node (.node (.single ⟨18432,18560,8960,9088⟩) (.node (.single ⟨18432,18496,9088,9152⟩) (.single ⟨18432,18496,9152,9216⟩))) (.node (.node (.single ⟨18496,18560,9088,9152⟩) (.single ⟨18496,18560,9152,9216⟩)) (.node (.single ⟨18560,18688,8960,9088⟩) (.single ⟨18560,18688,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,14080,14208⟩) (.node (.single ⟨23552,23616,14208,14272⟩) (.single ⟨23552,23616,14272,14336⟩))) (.node (.node (.single ⟨23616,23680,14208,14272⟩) (.single ⟨23616,23680,14272,14336⟩)) (.node (.single ⟨23680,23808,14080,14208⟩) (.single ⟨23680,23808,14208,14336⟩))))))
def output9 : Fin 28 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData9 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover9 (i : Fin 28) : Fin 28 := ⟨coverData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 28) : Fin 28 := ⟨sourceData9.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 .empty (.cutY 18944 (.cutX 8960 .empty (.cutY 18688 (.cutX 9088 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 9152 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 .empty (.cutY 24064 (.cutX 14080 .empty (.cutY 23808 (.cutX 14208 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 14272 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty)) .empty))))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 (.cutY 8704 .empty (.cutX 18688 (.cutY 8960 .empty (.cutX 18560 (.cutY 9088 .full (.cutX 18496 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 (.cutY 13824 .empty (.cutX 23808 (.cutY 14080 .empty (.cutX 23680 (.cutY 14208 .full (.cutX 23616 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty))) .empty))))) .empty) .empty))

theorem metadata9 : 0<167101800 ∧ 35<128 ∧ 72<128 ∧ 1<4 ∧
    7487/4160=1 ∧ 7487%4160=3327 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

noncomputable def phaseMass9 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw9 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass9_eq : phaseMass9 = (835509/8192000000 : ℝ) := by
  unfold phaseMass9
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw9 output9 cover9 source9
    (gridTreeUnionCheck_sound 32768 raw9 output9 cover9 source9 tree9 checked9)
    _ (by norm_num) _, areaUnits9]
  norm_num

-- Frozen phase 4542, atom 7894, type 1, source (43,79).
def leavesData10 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves10 : Fin 10 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 43 79 leaves10 i
def outputData10 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨11008,11136,20224,20352⟩) (.single ⟨11008,11136,20352,20480⟩)) (.node (.single ⟨11136,11200,20224,20288⟩) (.node (.single ⟨11136,11200,20288,20352⟩) (.single ⟨11200,11232,20224,20256⟩)))) (.node (.node (.single ⟨11200,11232,20256,20288⟩) (.single ⟨11232,11264,20224,20256⟩)) (.node (.single ⟨11232,11264,20256,20288⟩) (.node (.single ⟨11200,11264,20288,20352⟩) (.single ⟨11136,11264,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,21504,21632⟩) (.single ⟨12288,12416,21632,21760⟩)) (.node (.single ⟨12416,12480,21504,21568⟩) (.node (.single ⟨12416,12480,21568,21632⟩) (.single ⟨12480,12512,21504,21536⟩)))) (.node (.node (.single ⟨12480,12512,21536,21568⟩) (.single ⟨12512,12544,21504,21536⟩)) (.node (.single ⟨12512,12544,21536,21568⟩) (.node (.single ⟨12480,12544,21568,21632⟩) (.single ⟨12416,12544,21632,21760⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20352,11008,11136⟩) (.single ⟨20224,20288,11136,11200⟩)) (.node (.single ⟨20224,20256,11200,11232⟩) (.node (.single ⟨20224,20256,11232,11264⟩) (.single ⟨20256,20288,11200,11232⟩)))) (.node (.node (.single ⟨20256,20288,11232,11264⟩) (.single ⟨20288,20352,11136,11200⟩)) (.node (.single ⟨20288,20352,11200,11264⟩) (.node (.single ⟨20352,20480,11008,11136⟩) (.single ⟨20352,20480,11136,11264⟩))))) (.node (.node (.node (.single ⟨21504,21632,12288,12416⟩) (.single ⟨21504,21568,12416,12480⟩)) (.node (.single ⟨21504,21536,12480,12512⟩) (.node (.single ⟨21504,21536,12512,12544⟩) (.single ⟨21536,21568,12480,12512⟩)))) (.node (.node (.single ⟨21536,21568,12512,12544⟩) (.single ⟨21568,21632,12416,12480⟩)) (.node (.single ⟨21568,21632,12480,12544⟩) (.node (.single ⟨21632,21760,12288,12416⟩) (.single ⟨21632,21760,12416,12544⟩)))))))
def output10 : Fin 40 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData10 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover10 (i : Fin 40) : Fin 40 := ⟨coverData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 40) : Fin 40 := ⟨sourceData10.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 .empty (.cutY 19968 .empty (.cutX 11008 .empty (.cutY 20224 .empty (.cutX 11136 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 11200 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 11232 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))))))) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 (.cutY 22016 (.cutX 12544 (.cutY 21760 (.cutX 12416 (.cutY 21632 .full .full) (.cutY 21632 (.cutX 12480 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 12512 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 .empty (.cutY 10752 .empty (.cutX 20224 .empty (.cutY 11008 .empty (.cutX 20352 (.cutY 11136 .full (.cutX 20288 (.cutY 11200 .full (.cutX 20256 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full .full)))))) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 (.cutY 12800 (.cutX 21760 (.cutY 12544 (.cutX 21632 (.cutY 12416 .full (.cutX 21568 (.cutY 12480 .full (.cutX 21536 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata10 : 0<177315334 ∧ 43<128 ∧ 79<128 ∧ 1<4 ∧
    7894/4160=1 ∧ 7894%4160=3734 ∧ ∀ i, (leaves10 i).Valid 8 := by
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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 4543, atom 6875, type 1, source (26,63).
def leavesData11 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩))) (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.node (.single ⟨2,3,3⟩) (.single ⟨2,0,0⟩))))) (.node (.node (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)) (.node (.single ⟨2,1,1⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves11 : Fin 19 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 26 63 leaves11 i
def outputData11 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨6656,6720,16128,16192⟩) (.single ⟨6656,6720,16192,16256⟩)) (.node (.single ⟨6720,6784,16128,16192⟩) (.single ⟨6720,6784,16192,16256⟩))) (.node (.node (.single ⟨6656,6784,16256,16384⟩) (.single ⟨6784,6848,16128,16192⟩)) (.node (.single ⟨6784,6848,16192,16256⟩) (.node (.single ⟨6848,6880,16128,16160⟩) (.single ⟨6848,6880,16160,16192⟩))))) (.node (.node (.node (.single ⟨6880,6896,16128,16144⟩) (.single ⟨6880,6896,16144,16160⟩)) (.node (.single ⟨6896,6912,16128,16144⟩) (.node (.single ⟨6896,6912,16144,16160⟩) (.single ⟨6880,6912,16160,16192⟩)))) (.node (.node (.single ⟨6848,6912,16192,16256⟩) (.single ⟨6784,6848,16256,16320⟩)) (.node (.single ⟨6784,6848,16320,16384⟩) (.node (.single ⟨6848,6912,16256,16320⟩) (.single ⟨6848,6912,16320,16384⟩)))))) (.node (.node (.node (.node (.single ⟨16128,16192,6656,6720⟩) (.single ⟨16128,16192,6720,6784⟩)) (.node (.single ⟨16192,16256,6656,6720⟩) (.single ⟨16192,16256,6720,6784⟩))) (.node (.node (.single ⟨16128,16192,6784,6848⟩) (.single ⟨16128,16160,6848,6880⟩)) (.node (.single ⟨16128,16144,6880,6896⟩) (.node (.single ⟨16128,16144,6896,6912⟩) (.single ⟨16144,16160,6880,6896⟩))))) (.node (.node (.node (.single ⟨16144,16160,6896,6912⟩) (.single ⟨16160,16192,6848,6880⟩)) (.node (.single ⟨16160,16192,6880,6912⟩) (.node (.single ⟨16192,16256,6784,6848⟩) (.single ⟨16192,16256,6848,6912⟩)))) (.node (.node (.single ⟨16256,16384,6656,6784⟩) (.single ⟨16256,16320,6784,6848⟩)) (.node (.single ⟨16256,16320,6848,6912⟩) (.node (.single ⟨16320,16384,6784,6848⟩) (.single ⟨16320,16384,6848,6912⟩))))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,25856,25920⟩) (.single ⟨16384,16448,25920,25984⟩)) (.node (.single ⟨16448,16512,25856,25920⟩) (.single ⟨16448,16512,25920,25984⟩))) (.node (.node (.single ⟨16384,16512,25984,26112⟩) (.single ⟨16512,16576,25856,25920⟩)) (.node (.single ⟨16512,16576,25920,25984⟩) (.node (.single ⟨16576,16608,25856,25888⟩) (.single ⟨16576,16608,25888,25920⟩))))) (.node (.node (.node (.single ⟨16608,16624,25856,25872⟩) (.single ⟨16608,16624,25872,25888⟩)) (.node (.single ⟨16624,16640,25856,25872⟩) (.node (.single ⟨16624,16640,25872,25888⟩) (.single ⟨16608,16640,25888,25920⟩)))) (.node (.node (.single ⟨16576,16640,25920,25984⟩) (.single ⟨16512,16576,25984,26048⟩)) (.node (.single ⟨16512,16576,26048,26112⟩) (.node (.single ⟨16576,16640,25984,26048⟩) (.single ⟨16576,16640,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨25856,25920,16384,16448⟩) (.single ⟨25856,25920,16448,16512⟩)) (.node (.single ⟨25920,25984,16384,16448⟩) (.single ⟨25920,25984,16448,16512⟩))) (.node (.node (.single ⟨25856,25920,16512,16576⟩) (.single ⟨25856,25888,16576,16608⟩)) (.node (.single ⟨25856,25872,16608,16624⟩) (.node (.single ⟨25856,25872,16624,16640⟩) (.single ⟨25872,25888,16608,16624⟩))))) (.node (.node (.node (.single ⟨25872,25888,16624,16640⟩) (.single ⟨25888,25920,16576,16608⟩)) (.node (.single ⟨25888,25920,16608,16640⟩) (.node (.single ⟨25920,25984,16512,16576⟩) (.single ⟨25920,25984,16576,16640⟩)))) (.node (.node (.single ⟨25984,26112,16384,16512⟩) (.single ⟨25984,26048,16512,16576⟩)) (.node (.single ⟨25984,26048,16576,16640⟩) (.node (.single ⟨26048,26112,16512,16576⟩) (.single ⟨26048,26112,16576,16640⟩))))))))
def output11 : Fin 76 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 33)) (.node (.single 71) (.single 42))) (.node (.node (.single 5) (.single 23)) (.node (.single 70) (.node (.single 52) (.single 6))))) (.node (.node (.node (.single 31) (.single 69)) (.node (.single 44) (.node (.single 15) (.single 34)))) (.node (.node (.single 60) (.single 41)) (.node (.single 16) (.node (.single 36) (.single 59)))))) (.node (.node (.node (.node (.single 39) (.single 14)) (.node (.single 32) (.single 61))) (.node (.node (.single 43) (.single 17)) (.node (.single 35) (.node (.single 58) (.single 40))))) (.node (.node (.node (.single 18) (.single 37)) (.node (.single 57) (.node (.single 38) (.single 0)))) (.node (.node (.single 19) (.single 75)) (.node (.single 56) (.node (.single 1) (.single 21))))))) (.node (.node (.node (.node (.node (.single 74) (.single 54)) (.node (.single 2) (.single 20))) (.node (.node (.single 73) (.single 55)) (.node (.single 3) (.node (.single 22) (.single 72))))) (.node (.node (.node (.single 53) (.single 7)) (.node (.single 24) (.node (.single 68) (.single 51)))) (.node (.node (.single 8) (.single 29)) (.node (.single 67) (.node (.single 46) (.single 13)))))) (.node (.node (.node (.node (.single 30) (.single 62)) (.node (.single 45) (.single 9))) (.node (.node (.single 25) (.single 66)) (.node (.single 50) (.node (.single 10) (.single 27))))) (.node (.node (.node (.single 65) (.single 48)) (.node (.single 11) (.node (.single 26) (.single 64)))) (.node (.node (.single 49) (.single 12)) (.node (.single 28) (.node (.single 63) (.single 47))))))))
def sourceData11 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.node (.single 48) (.single 52))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 56)))) (.node (.node (.single 20) (.single 12)) (.node (.single 16) (.node (.single 24) (.single 28)))))) (.node (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 5) (.single 49)) (.node (.single 61) (.node (.single 69) (.single 65))))) (.node (.node (.node (.single 73) (.single 53)) (.node (.single 57) (.node (.single 9) (.single 21)))) (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 17) (.single 29))))))) (.node (.node (.node (.node (.node (.single 31) (.single 19)) (.node (.single 27) (.single 15))) (.node (.node (.single 3) (.single 23)) (.node (.single 11) (.node (.single 59) (.single 55))))) (.node (.node (.node (.single 75) (.single 67)) (.node (.single 71) (.node (.single 63) (.single 51)))) (.node (.node (.single 7) (.single 47)) (.node (.single 39) (.node (.single 43) (.single 35)))))) (.node (.node (.node (.node (.single 30) (.single 26)) (.node (.single 18) (.single 14))) (.node (.node (.single 22) (.single 58)) (.node (.single 74) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.single 54)) (.node (.single 50) (.node (.single 10) (.single 6)))) (.node (.node (.single 2) (.single 46)) (.node (.single 42) (.node (.single 38) (.single 34))))))))
def cover11 (i : Fin 76) : Fin 76 := ⟨coverData11.get i % 76, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 76) : Fin 76 := ⟨sourceData11.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 .empty (.cutY 15872 .empty (.cutX 6912 (.cutY 16128 .empty (.cutX 6784 (.cutY 16256 (.cutX 6720 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 6848 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 6880 (.cutY 16160 .full .full) (.cutY 16160 (.cutX 6896 (.cutY 16144 .full .full) (.cutY 16144 .full .full)) .full)) .full)) (.cutX 6848 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))) .empty)))) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 .empty (.cutY 6656 .empty (.cutX 16128 .empty (.cutY 6912 (.cutX 16256 (.cutY 6784 (.cutX 16192 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 16192 (.cutY 6848 .full (.cutX 16160 (.cutY 6880 .full (.cutX 16144 (.cutY 6896 .full .full) (.cutY 6896 .full .full))) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 16320 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty)))) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 (.cutY 26112 (.cutX 16640 (.cutY 25856 .empty (.cutX 16512 (.cutY 25984 (.cutX 16448 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 16576 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 16608 (.cutY 25888 .full .full) (.cutY 25888 (.cutX 16624 (.cutY 25872 .full .full) (.cutY 25872 .full .full)) .full)) .full)) (.cutX 16576 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 (.cutY 16896 (.cutX 25856 .empty (.cutY 16640 (.cutX 25984 (.cutY 16512 (.cutX 25920 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) (.cutX 25920 (.cutY 16576 .full (.cutX 25888 (.cutY 16608 .full (.cutX 25872 (.cutY 16624 .full .full) (.cutY 16624 .full .full))) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 26048 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata11 : 0<69455300 ∧ 26<128 ∧ 63<128 ∧ 1<4 ∧
    6875/4160=1 ∧ 6875%4160=2715 ∧ ∀ i, (leaves11 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData11).mp
    (by decide +kernel)

theorem sourceChecked11_0 : ∀ i : Fin 64,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked11_64 : ∀ i : Fin 12,
    (fun i => output11 i = raw11 (source11 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked11 : ∀ i : Fin 76, (fun i => output11 i = raw11 (source11 i)) i :=
  forallFin_of_zero_offset (fun i => output11 i = raw11 (source11 i)) (forallFinOffset_add (fun i => output11 i = raw11 (source11 i)) 0 64 12 (by decide) sourceChecked11_0
    sourceChecked11_64)

theorem coverChecked11_0 : ∀ i : Fin 64,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked11_64 : ∀ i : Fin 12,
    (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked11 : ∀ i : Fin 76, (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) i :=
  forallFin_of_zero_offset (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) (forallFinOffset_add (fun i => (output11 (cover11 i)).ContainsBox (raw11 i)) 0 64 12 (by decide) coverChecked11_0
    coverChecked11_64)

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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (694553/16384000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 4544, atom 2134, type 0, source (19,63).
def leavesData12 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves12 : Fin 4 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 19 63 leaves12 i
def outputData12 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4864,4992,16128,16256⟩) (.single ⟨4864,4992,16256,16384⟩)) (.node (.single ⟨4992,5120,16128,16256⟩) (.single ⟨4992,5120,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,4864,4992⟩) (.single ⟨16128,16256,4992,5120⟩)) (.node (.single ⟨16256,16384,4864,4992⟩) (.single ⟨16256,16384,4992,5120⟩)))) (.node (.node (.node (.single ⟨16384,16512,27648,27776⟩) (.single ⟨16384,16512,27776,27904⟩)) (.node (.single ⟨16512,16640,27648,27776⟩) (.single ⟨16512,16640,27776,27904⟩))) (.node (.node (.single ⟨27648,27776,16384,16512⟩) (.single ⟨27648,27776,16512,16640⟩)) (.node (.single ⟨27776,27904,16384,16512⟩) (.single ⟨27776,27904,16512,16640⟩)))))
def output12 : Fin 16 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData12 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover12 (i : Fin 16) : Fin 16 := ⟨coverData12.get i % 16, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 16) : Fin 16 := ⟨sourceData12.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 .empty (.cutY 15872 .empty (.cutX 4864 .empty (.cutY 16128 .empty (.cutX 4992 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))))) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 .empty (.cutY 4608 .empty (.cutX 16128 .empty (.cutY 4864 .empty (.cutX 16256 (.cutY 4992 .full .full) (.cutY 4992 .full .full)))))) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 (.cutY 28160 (.cutX 16640 (.cutY 27904 (.cutX 16512 (.cutY 27776 .full .full) (.cutY 27776 .full .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 (.cutY 16896 (.cutX 27904 (.cutY 16640 (.cutX 27776 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata12 : 0<185830537 ∧ 19<128 ∧ 63<128 ∧ 0<4 ∧
    2134/4160=0 ∧ 2134%4160=2134 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 4545, atom 3011, type 0, source (30,71).
def leavesData13 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves13 : Fin 4 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 71 leaves13 i
def outputData13 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,18176,18304⟩) (.single ⟨7680,7808,18304,18432⟩)) (.node (.single ⟨7808,7936,18176,18304⟩) (.single ⟨7808,7936,18304,18432⟩))) (.node (.node (.single ⟨14336,14464,24832,24960⟩) (.single ⟨14336,14464,24960,25088⟩)) (.node (.single ⟨14464,14592,24832,24960⟩) (.single ⟨14464,14592,24960,25088⟩)))) (.node (.node (.node (.single ⟨18176,18304,7680,7808⟩) (.single ⟨18176,18304,7808,7936⟩)) (.node (.single ⟨18304,18432,7680,7808⟩) (.single ⟨18304,18432,7808,7936⟩))) (.node (.node (.single ⟨24832,24960,14336,14464⟩) (.single ⟨24832,24960,14464,14592⟩)) (.node (.single ⟨24960,25088,14336,14464⟩) (.single ⟨24960,25088,14464,14592⟩)))))
def output13 : Fin 16 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData13 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover13 (i : Fin 16) : Fin 16 := ⟨coverData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 16) : Fin 16 := ⟨sourceData13.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 .empty (.cutY 17920 .empty (.cutX 7936 (.cutY 18176 .empty (.cutX 7808 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty))))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 (.cutY 25088 (.cutX 14592 (.cutY 24832 .empty (.cutX 14464 (.cutY 24960 .full .full) (.cutY 24960 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 .empty (.cutY 7680 .empty (.cutX 18176 .empty (.cutY 7936 (.cutX 18304 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty))))))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 (.cutY 14848 (.cutX 24832 .empty (.cutY 14592 (.cutX 24960 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata13 : 0<170092456 ∧ 30<128 ∧ 71<128 ∧ 0<4 ∧
    3011/4160=0 ∧ 3011%4160=3011 ∧ ∀ i, (leaves13 i).Valid 8 := by
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 4546, atom 1128, type 0, source (9,57).
def leavesData14 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves14 : Fin 4 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 57 leaves14 i
def outputData14 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,14592,14720⟩) (.single ⟨2304,2432,14720,14848⟩)) (.node (.single ⟨2432,2560,14592,14720⟩) (.single ⟨2432,2560,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,2304,2432⟩) (.single ⟨14592,14720,2432,2560⟩)) (.node (.single ⟨14720,14848,2304,2432⟩) (.single ⟨14720,14848,2432,2560⟩)))) (.node (.node (.node (.single ⟨17920,18048,30208,30336⟩) (.single ⟨17920,18048,30336,30464⟩)) (.node (.single ⟨18048,18176,30208,30336⟩) (.single ⟨18048,18176,30336,30464⟩))) (.node (.node (.single ⟨30208,30336,17920,18048⟩) (.single ⟨30208,30336,18048,18176⟩)) (.node (.single ⟨30336,30464,17920,18048⟩) (.single ⟨30336,30464,18048,18176⟩)))))
def output14 : Fin 16 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData14 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover14 (i : Fin 16) : Fin 16 := ⟨coverData14.get i % 16, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 16) : Fin 16 := ⟨sourceData14.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 (.cutY 14848 (.cutX 2304 .empty (.cutY 14592 .empty (.cutX 2432 (.cutY 14720 .full .full) (.cutY 14720 .full .full)))) .empty) .empty) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 (.cutY 2560 (.cutX 14592 .empty (.cutY 2304 .empty (.cutX 14720 (.cutY 2432 .full .full) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 .empty (.cutY 30208 .empty (.cutX 18176 (.cutY 30464 (.cutX 18048 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty) .empty))))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 .empty (.cutY 17920 .empty (.cutX 30464 (.cutY 18176 (.cutX 30336 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty) .empty))))) .empty) .empty) .empty)) .empty))))

theorem metadata14 : 0<116912559 ∧ 9<128 ∧ 57<128 ∧ 0<4 ∧
    1128/4160=0 ∧ 1128%4160=1128 ∧ ∀ i, (leaves14 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData14).mp
    (by decide +kernel)

theorem sourceChecked14_0 : ∀ i : Fin 16,
    (fun i => output14 i = raw14 (source14 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked14 : ∀ i : Fin 16, (fun i => output14 i = raw14 (source14 i)) i :=
  forallFin_of_zero_offset (fun i => output14 i = raw14 (source14 i)) sourceChecked14_0

theorem coverChecked14_0 : ∀ i : Fin 16,
    (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked14 : ∀ i : Fin 16, (fun i => (output14 (cover14 i)).ContainsBox (raw14 i)) i :=
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 4547, atom 788, type 0, source (6,56).
def leavesData15 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves15 : Fin 4 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 6 56 leaves15 i
def outputData15 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1536,1664,14336,14464⟩) (.single ⟨1536,1664,14464,14592⟩)) (.node (.single ⟨1664,1792,14336,14464⟩) (.single ⟨1664,1792,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,1536,1664⟩) (.single ⟨14336,14464,1664,1792⟩)) (.node (.single ⟨14464,14592,1536,1664⟩) (.single ⟨14464,14592,1664,1792⟩)))) (.node (.node (.node (.single ⟨18176,18304,30976,31104⟩) (.single ⟨18176,18304,31104,31232⟩)) (.node (.single ⟨18304,18432,30976,31104⟩) (.single ⟨18304,18432,31104,31232⟩))) (.node (.node (.single ⟨30976,31104,18176,18304⟩) (.single ⟨30976,31104,18304,18432⟩)) (.node (.single ⟨31104,31232,18176,18304⟩) (.single ⟨31104,31232,18304,18432⟩)))))
def output15 : Fin 16 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData15 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover15 (i : Fin 16) : Fin 16 := ⟨coverData15.get i % 16, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 16) : Fin 16 := ⟨sourceData15.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 .empty (.cutY 14848 (.cutX 1792 (.cutY 14592 (.cutX 1664 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 .empty (.cutX 14592 (.cutY 1792 (.cutX 14464 (.cutY 1664 .full .full) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 (.cutX 18176 .empty (.cutY 30976 .empty (.cutX 18304 (.cutY 31104 .full .full) (.cutY 31104 .full .full)))) .empty)) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 (.cutY 17920 .empty (.cutX 30976 .empty (.cutY 18176 .empty (.cutX 31104 (.cutY 18304 .full .full) (.cutY 18304 .full .full))))) .empty)) .empty) .empty)) .empty)) .empty))))

theorem metadata15 : 0<89519217 ∧ 6<128 ∧ 56<128 ∧ 0<4 ∧
    788/4160=0 ∧ 788%4160=788 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 4548, atom 1554, type 0, source (13,59).
def leavesData16 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves16 : Fin 4 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 59 leaves16 i
def outputData16 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,15104,15232⟩) (.single ⟨3328,3456,15232,15360⟩)) (.node (.single ⟨3456,3584,15104,15232⟩) (.single ⟨3456,3584,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,3328,3456⟩) (.single ⟨15104,15232,3456,3584⟩)) (.node (.single ⟨15232,15360,3328,3456⟩) (.single ⟨15232,15360,3456,3584⟩)))) (.node (.node (.node (.single ⟨17408,17536,29184,29312⟩) (.single ⟨17408,17536,29312,29440⟩)) (.node (.single ⟨17536,17664,29184,29312⟩) (.single ⟨17536,17664,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,17408,17536⟩) (.single ⟨29184,29312,17536,17664⟩)) (.node (.single ⟨29312,29440,17408,17536⟩) (.single ⟨29312,29440,17536,17664⟩)))))
def output16 : Fin 16 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData16 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover16 (i : Fin 16) : Fin 16 := ⟨coverData16.get i % 16, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 16) : Fin 16 := ⟨sourceData16.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 (.cutX 3584 (.cutY 14848 .empty (.cutX 3328 .empty (.cutY 15104 .empty (.cutX 3456 (.cutY 15232 .full .full) (.cutY 15232 .full .full))))) .empty) .empty))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 .empty (.cutX 14848 .empty (.cutY 3584 (.cutX 15104 .empty (.cutY 3328 .empty (.cutX 15232 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty))) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 (.cutX 17920 (.cutY 29184 .empty (.cutX 17664 (.cutY 29440 (.cutX 17536 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 .empty (.cutX 29184 .empty (.cutY 17920 (.cutX 29440 (.cutY 17664 (.cutX 29312 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata16 : 0<116912559 ∧ 13<128 ∧ 59<128 ∧ 0<4 ∧
    1554/4160=0 ∧ 1554%4160=1554 ∧ ∀ i, (leaves16 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData16).mp
    (by decide +kernel)

theorem sourceChecked16_0 : ∀ i : Fin 16,
    (fun i => output16 i = raw16 (source16 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked16 : ∀ i : Fin 16, (fun i => output16 i = raw16 (source16 i)) i :=
  forallFin_of_zero_offset (fun i => output16 i = raw16 (source16 i)) sourceChecked16_0

theorem coverChecked16_0 : ∀ i : Fin 16,
    (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked16 : ∀ i : Fin 16, (fun i => (output16 (cover16 i)).ContainsBox (raw16 i)) i :=
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 4549, atom 3444, type 0, source (37,77).
def leavesData17 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves17 : Fin 4 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 37 77 leaves17 i
def outputData17 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9472,9600,19712,19840⟩) (.single ⟨9472,9600,19840,19968⟩)) (.node (.single ⟨9600,9728,19712,19840⟩) (.single ⟨9600,9728,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,23040,23168⟩) (.single ⟨12800,12928,23168,23296⟩)) (.node (.single ⟨12928,13056,23040,23168⟩) (.single ⟨12928,13056,23168,23296⟩)))) (.node (.node (.node (.single ⟨19712,19840,9472,9600⟩) (.single ⟨19712,19840,9600,9728⟩)) (.node (.single ⟨19840,19968,9472,9600⟩) (.single ⟨19840,19968,9600,9728⟩))) (.node (.node (.single ⟨23040,23168,12800,12928⟩) (.single ⟨23040,23168,12928,13056⟩)) (.node (.single ⟨23168,23296,12800,12928⟩) (.single ⟨23168,23296,12928,13056⟩)))))
def output17 : Fin 16 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData17 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover17 (i : Fin 16) : Fin 16 := ⟨coverData17.get i % 16, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 16) : Fin 16 := ⟨sourceData17.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 (.cutY 19968 (.cutX 9472 .empty (.cutY 19712 .empty (.cutX 9600 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty) .empty)))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 .empty (.cutY 23040 .empty (.cutX 13056 (.cutY 23296 (.cutX 12928 (.cutY 23168 .full .full) (.cutY 23168 .full .full)) .empty) .empty))) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 (.cutY 9728 (.cutX 19712 .empty (.cutY 9472 .empty (.cutX 19840 (.cutY 9600 .full .full) (.cutY 9600 .full .full)))) .empty) .empty))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 .empty (.cutY 12800 .empty (.cutX 23296 (.cutY 13056 (.cutX 23168 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty))) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata17 : 0<109574533 ∧ 37<128 ∧ 77<128 ∧ 0<4 ∧
    3444/4160=0 ∧ 3444%4160=3444 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 4550, atom 2642, type 0, source (25,67).
def leavesData18 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves18 : Fin 7 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 25 67 leaves18 i
def outputData18 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6400,6528,17152,17280⟩) (.node (.single ⟨6400,6528,17280,17408⟩) (.single ⟨6528,6592,17152,17216⟩))) (.node (.node (.single ⟨6528,6592,17216,17280⟩) (.single ⟨6592,6656,17152,17216⟩)) (.node (.single ⟨6592,6656,17216,17280⟩) (.single ⟨6528,6656,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,26112,26240⟩) (.node (.single ⟨15360,15488,26240,26368⟩) (.single ⟨15488,15552,26112,26176⟩))) (.node (.node (.single ⟨15488,15552,26176,26240⟩) (.single ⟨15552,15616,26112,26176⟩)) (.node (.single ⟨15552,15616,26176,26240⟩) (.single ⟨15488,15616,26240,26368⟩))))) (.node (.node (.node (.single ⟨17152,17280,6400,6528⟩) (.node (.single ⟨17152,17216,6528,6592⟩) (.single ⟨17152,17216,6592,6656⟩))) (.node (.node (.single ⟨17216,17280,6528,6592⟩) (.single ⟨17216,17280,6592,6656⟩)) (.node (.single ⟨17280,17408,6400,6528⟩) (.single ⟨17280,17408,6528,6656⟩)))) (.node (.node (.single ⟨26112,26240,15360,15488⟩) (.node (.single ⟨26112,26176,15488,15552⟩) (.single ⟨26112,26176,15552,15616⟩))) (.node (.node (.single ⟨26176,26240,15488,15552⟩) (.single ⟨26176,26240,15552,15616⟩)) (.node (.single ⟨26240,26368,15360,15488⟩) (.single ⟨26240,26368,15488,15616⟩))))))
def output18 : Fin 28 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData18 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover18 (i : Fin 28) : Fin 28 := ⟨coverData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 28) : Fin 28 := ⟨sourceData18.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 (.cutY 16896 .empty (.cutX 6400 .empty (.cutY 17152 .empty (.cutX 6528 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 6592 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))))) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 (.cutY 26112 .empty (.cutX 15616 (.cutY 26368 (.cutX 15488 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 15552 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full)) .empty) .empty)) .empty))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 .empty (.cutY 6656 (.cutX 17152 .empty (.cutY 6400 .empty (.cutX 17280 (.cutY 6528 .full (.cutX 17216 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 .empty (.cutY 15872 (.cutX 26368 (.cutY 15616 (.cutX 26240 (.cutY 15488 .full (.cutX 26176 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty))))) .empty)) .empty))) .empty))

theorem metadata18 : 0<170092456 ∧ 25<128 ∧ 67<128 ∧ 0<4 ∧
    2642/4160=0 ∧ 2642%4160=2642 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 4551, atom 2397, type 0, source (22,65).
def leavesData19 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves19 : Fin 7 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 22 65 leaves19 i
def outputData19 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5632,5760,16640,16768⟩) (.node (.single ⟨5632,5760,16768,16896⟩) (.single ⟨5760,5824,16640,16704⟩))) (.node (.node (.single ⟨5760,5824,16704,16768⟩) (.single ⟨5824,5888,16640,16704⟩)) (.node (.single ⟨5824,5888,16704,16768⟩) (.single ⟨5760,5888,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,26880,27008⟩) (.node (.single ⟨15872,16000,27008,27136⟩) (.single ⟨16000,16064,26880,26944⟩))) (.node (.node (.single ⟨16000,16064,26944,27008⟩) (.single ⟨16064,16128,26880,26944⟩)) (.node (.single ⟨16064,16128,26944,27008⟩) (.single ⟨16000,16128,27008,27136⟩))))) (.node (.node (.node (.single ⟨16640,16768,5632,5760⟩) (.node (.single ⟨16640,16704,5760,5824⟩) (.single ⟨16640,16704,5824,5888⟩))) (.node (.node (.single ⟨16704,16768,5760,5824⟩) (.single ⟨16704,16768,5824,5888⟩)) (.node (.single ⟨16768,16896,5632,5760⟩) (.single ⟨16768,16896,5760,5888⟩)))) (.node (.node (.single ⟨26880,27008,15872,16000⟩) (.node (.single ⟨26880,26944,16000,16064⟩) (.single ⟨26880,26944,16064,16128⟩))) (.node (.node (.single ⟨26944,27008,16000,16064⟩) (.single ⟨26944,27008,16064,16128⟩)) (.node (.single ⟨27008,27136,15872,16000⟩) (.single ⟨27008,27136,16000,16128⟩))))))
def output19 : Fin 28 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData19 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover19 (i : Fin 28) : Fin 28 := ⟨coverData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 28) : Fin 28 := ⟨sourceData19.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 .empty (.cutY 16896 (.cutX 5888 (.cutY 16640 .empty (.cutX 5760 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 5824 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full))) .empty) .empty)) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 .empty (.cutY 27136 (.cutX 16128 (.cutY 26880 .empty (.cutX 16000 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 16064 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full))) .empty) .empty)) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 (.cutY 5632 .empty (.cutX 16640 .empty (.cutY 5888 (.cutX 16768 (.cutY 5760 .full (.cutX 16704 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))) .empty)) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 (.cutY 15872 .empty (.cutX 26880 .empty (.cutY 16128 (.cutX 27008 (.cutY 16000 .full (.cutX 26944 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))) .empty)) .empty)))) .empty))) .empty))

theorem metadata19 : 0<191564598 ∧ 22<128 ∧ 65<128 ∧ 0<4 ∧
    2397/4160=0 ∧ 2397%4160=2397 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 4552, atom 182, type 0, source (1,55).
def leavesData20 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves20 : Fin 4 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 1 55 leaves20 i
def outputData20 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨256,384,14080,14208⟩) (.single ⟨256,384,14208,14336⟩)) (.node (.single ⟨384,512,14080,14208⟩) (.single ⟨384,512,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,256,384⟩) (.single ⟨14080,14208,384,512⟩)) (.node (.single ⟨14208,14336,256,384⟩) (.single ⟨14208,14336,384,512⟩)))) (.node (.node (.node (.single ⟨18432,18560,32256,32384⟩) (.single ⟨18432,18560,32384,32512⟩)) (.node (.single ⟨18560,18688,32256,32384⟩) (.single ⟨18560,18688,32384,32512⟩))) (.node (.node (.single ⟨32256,32384,18432,18560⟩) (.single ⟨32256,32384,18560,18688⟩)) (.node (.single ⟨32384,32512,18432,18560⟩) (.single ⟨32384,32512,18560,18688⟩)))))
def output20 : Fin 16 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData20 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover20 (i : Fin 16) : Fin 16 := ⟨coverData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 16) : Fin 16 := ⟨sourceData20.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 .empty (.cutX 512 (.cutY 13824 .empty (.cutX 256 .empty (.cutY 14080 .empty (.cutX 384 (.cutY 14208 .full .full) (.cutY 14208 .full .full))))) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 (.cutX 13824 .empty (.cutY 512 (.cutX 14080 .empty (.cutY 256 .empty (.cutX 14208 (.cutY 384 .full .full) (.cutY 384 .full .full)))) .empty)) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 .empty (.cutX 18944 (.cutY 32256 .empty (.cutX 18688 (.cutY 32512 (.cutX 18560 (.cutY 32384 .full .full) (.cutY 32384 .full .full)) .empty) .empty)) .empty)) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 (.cutX 32256 .empty (.cutY 18944 (.cutX 32512 (.cutY 18688 (.cutX 32384 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty)))) .empty)) .empty))))

theorem metadata20 : 0<214747992 ∧ 1<128 ∧ 55<128 ∧ 0<4 ∧
    182/4160=0 ∧ 182%4160=182 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 4553, atom 1345, type 0, source (11,58).
def leavesData21 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves21 : Fin 4 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 58 leaves21 i
def outputData21 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,14848,14976⟩) (.single ⟨2816,2944,14976,15104⟩)) (.node (.single ⟨2944,3072,14848,14976⟩) (.single ⟨2944,3072,14976,15104⟩))) (.node (.node (.single ⟨14848,14976,2816,2944⟩) (.single ⟨14848,14976,2944,3072⟩)) (.node (.single ⟨14976,15104,2816,2944⟩) (.single ⟨14976,15104,2944,3072⟩)))) (.node (.node (.node (.single ⟨17664,17792,29696,29824⟩) (.single ⟨17664,17792,29824,29952⟩)) (.node (.single ⟨17792,17920,29696,29824⟩) (.single ⟨17792,17920,29824,29952⟩))) (.node (.node (.single ⟨29696,29824,17664,17792⟩) (.single ⟨29696,29824,17792,17920⟩)) (.node (.single ⟨29824,29952,17664,17792⟩) (.single ⟨29824,29952,17792,17920⟩)))))
def output21 : Fin 16 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData21 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover21 (i : Fin 16) : Fin 16 := ⟨coverData21.get i % 16, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 16) : Fin 16 := ⟨sourceData21.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 .empty (.cutY 14848 .empty (.cutX 2816 .empty (.cutY 15104 (.cutX 2944 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty)))) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 .empty (.cutX 15104 (.cutY 2816 .empty (.cutX 14976 (.cutY 2944 .full .full) (.cutY 2944 .full .full))) .empty))) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 (.cutX 17664 .empty (.cutY 29952 (.cutX 17792 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty)) .empty) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 (.cutY 17920 (.cutX 29952 (.cutY 17664 .empty (.cutX 29824 (.cutY 17792 .full .full) (.cutY 17792 .full .full))) .empty) .empty) .empty))) .empty) .empty) .empty)) .empty))))

theorem metadata21 : 0<116912559 ∧ 11<128 ∧ 58<128 ∧ 0<4 ∧
    1345/4160=0 ∧ 1345%4160=1345 ∧ ∀ i, (leaves21 i).Valid 8 := by
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

noncomputable def phaseMass21 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw21 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass21_eq : phaseMass21 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass21
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw21 output21 cover21 source21
    (gridTreeUnionCheck_sound 32768 raw21 output21 cover21 source21 tree21 checked21)
    _ (by norm_num) _, areaUnits21]
  norm_num

-- Frozen phase 4554, atom 4587, type 1, source (3,52).
def leavesData22 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves22 : Fin 13 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 3 52 leaves22 i
def outputData22 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨768,832,13312,13376⟩) (.node (.single ⟨768,832,13376,13440⟩) (.single ⟨832,896,13312,13376⟩))) (.node (.single ⟨832,896,13376,13440⟩) (.node (.single ⟨768,896,13440,13568⟩) (.single ⟨896,960,13312,13376⟩)))) (.node (.node (.single ⟨896,960,13376,13440⟩) (.node (.single ⟨960,992,13312,13344⟩) (.single ⟨960,992,13344,13376⟩))) (.node (.node (.single ⟨992,1024,13312,13344⟩) (.single ⟨992,1024,13344,13376⟩)) (.node (.single ⟨960,1024,13376,13440⟩) (.single ⟨896,1024,13440,13568⟩))))) (.node (.node (.node (.single ⟨13312,13376,768,832⟩) (.node (.single ⟨13312,13376,832,896⟩) (.single ⟨13376,13440,768,832⟩))) (.node (.single ⟨13376,13440,832,896⟩) (.node (.single ⟨13312,13376,896,960⟩) (.single ⟨13312,13344,960,992⟩)))) (.node (.node (.single ⟨13312,13344,992,1024⟩) (.node (.single ⟨13344,13376,960,992⟩) (.single ⟨13344,13376,992,1024⟩))) (.node (.node (.single ⟨13376,13440,896,960⟩) (.single ⟨13376,13440,960,1024⟩)) (.node (.single ⟨13440,13568,768,896⟩) (.single ⟨13440,13568,896,1024⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,31744,31872⟩) (.node (.single ⟨19200,19328,31872,32000⟩) (.single ⟨19328,19392,31744,31808⟩))) (.node (.single ⟨19328,19392,31808,31872⟩) (.node (.single ⟨19392,19424,31744,31776⟩) (.single ⟨19392,19424,31776,31808⟩)))) (.node (.node (.single ⟨19424,19456,31744,31776⟩) (.node (.single ⟨19424,19456,31776,31808⟩) (.single ⟨19392,19456,31808,31872⟩))) (.node (.node (.single ⟨19328,19392,31872,31936⟩) (.single ⟨19328,19392,31936,32000⟩)) (.node (.single ⟨19392,19456,31872,31936⟩) (.single ⟨19392,19456,31936,32000⟩))))) (.node (.node (.node (.single ⟨31744,31872,19200,19328⟩) (.node (.single ⟨31744,31808,19328,19392⟩) (.single ⟨31744,31776,19392,19424⟩))) (.node (.single ⟨31744,31776,19424,19456⟩) (.node (.single ⟨31776,31808,19392,19424⟩) (.single ⟨31776,31808,19424,19456⟩)))) (.node (.node (.single ⟨31808,31872,19328,19392⟩) (.node (.single ⟨31808,31872,19392,19456⟩) (.single ⟨31872,32000,19200,19328⟩))) (.node (.node (.single ⟨31872,31936,19328,19392⟩) (.single ⟨31872,31936,19392,19456⟩)) (.node (.single ⟨31936,32000,19328,19392⟩) (.single ⟨31936,32000,19392,19456⟩)))))))
def output22 : Fin 52 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData22 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover22 (i : Fin 52) : Fin 52 := ⟨coverData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 52) : Fin 52 := ⟨sourceData22.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 .empty (.cutX 512 .empty (.cutY 13824 (.cutX 768 .empty (.cutY 13568 (.cutX 896 (.cutY 13440 (.cutX 832 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full) (.cutY 13440 (.cutX 960 (.cutY 13376 .full .full) (.cutY 13376 (.cutX 992 (.cutY 13344 .full .full) (.cutY 13344 .full .full)) .full)) .full)) .empty)) .empty))) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 (.cutX 13824 (.cutY 512 .empty (.cutX 13568 (.cutY 768 .empty (.cutX 13440 (.cutY 896 (.cutX 13376 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 13376 (.cutY 960 .full (.cutX 13344 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 .empty (.cutX 18944 .empty (.cutY 32256 (.cutX 19200 .empty (.cutY 32000 (.cutX 19328 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 19392 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 19424 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) .full)) (.cutX 19392 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty))) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 (.cutX 32256 (.cutY 18944 .empty (.cutX 32000 (.cutY 19200 .empty (.cutX 31872 (.cutY 19328 .full (.cutX 31808 (.cutY 19392 .full (.cutX 31776 (.cutY 19424 .full .full) (.cutY 19424 .full .full))) (.cutY 19392 .full .full))) (.cutY 19328 .full (.cutX 31936 (.cutY 19392 .full .full) (.cutY 19392 .full .full))))) .empty)) .empty) .empty)))) .empty)) .empty))))

theorem metadata22 : 0<234882010 ∧ 3<128 ∧ 52<128 ∧ 1<4 ∧
    4587/4160=1 ∧ 4587%4160=427 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 4555, atom 4211, type 1, source (0,51).
def leavesData23 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves23 : Fin 7 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 51 leaves23 i
def outputData23 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,13056,13184⟩) (.node (.single ⟨0,128,13184,13312⟩) (.single ⟨128,192,13056,13120⟩))) (.node (.node (.single ⟨128,192,13120,13184⟩) (.single ⟨192,256,13056,13120⟩)) (.node (.single ⟨192,256,13120,13184⟩) (.single ⟨128,256,13184,13312⟩)))) (.node (.node (.single ⟨13056,13184,0,128⟩) (.node (.single ⟨13056,13120,128,192⟩) (.single ⟨13056,13120,192,256⟩))) (.node (.node (.single ⟨13120,13184,128,192⟩) (.single ⟨13120,13184,192,256⟩)) (.node (.single ⟨13184,13312,0,128⟩) (.single ⟨13184,13312,128,256⟩))))) (.node (.node (.node (.single ⟨19456,19584,32512,32640⟩) (.node (.single ⟨19456,19584,32640,32768⟩) (.single ⟨19584,19648,32512,32576⟩))) (.node (.node (.single ⟨19584,19648,32576,32640⟩) (.single ⟨19648,19712,32512,32576⟩)) (.node (.single ⟨19648,19712,32576,32640⟩) (.single ⟨19584,19712,32640,32768⟩)))) (.node (.node (.single ⟨32512,32640,19456,19584⟩) (.node (.single ⟨32512,32576,19584,19648⟩) (.single ⟨32512,32576,19648,19712⟩))) (.node (.node (.single ⟨32576,32640,19584,19648⟩) (.single ⟨32576,32640,19648,19712⟩)) (.node (.single ⟨32640,32768,19456,19584⟩) (.single ⟨32640,32768,19584,19712⟩))))))
def output23 : Fin 28 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 27))) (.node (.node (.single 20) (.single 1)) (.node (.single 12) (.single 26)))) (.node (.node (.single 15) (.node (.single 6) (.single 13))) (.node (.node (.single 21) (.single 14)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 25) (.node (.single 19) (.single 3))) (.node (.node (.single 10) (.single 24)) (.node (.single 17) (.single 4)))) (.node (.node (.single 9) (.node (.single 23) (.single 18))) (.node (.node (.single 5) (.single 11)) (.node (.single 22) (.single 16))))))
def sourceData23 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover23 (i : Fin 28) : Fin 28 := ⟨coverData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 28) : Fin 28 := ⟨sourceData23.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 (.cutX 512 (.cutY 12800 .empty (.cutX 256 (.cutY 13056 .empty (.cutX 128 (.cutY 13184 .full .full) (.cutY 13184 (.cutX 192 (.cutY 13120 .full .full) (.cutY 13120 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 (.cutY 1024 (.cutX 12800 .empty (.cutY 512 (.cutX 13056 .empty (.cutY 256 (.cutX 13184 (.cutY 128 .full (.cutX 13120 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 .empty (.cutY 31744 .empty (.cutX 19968 (.cutY 32256 .empty (.cutX 19712 (.cutY 32512 .empty (.cutX 19584 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 19648 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)) .empty)))))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 .empty (.cutX 32256 .empty (.cutY 19968 (.cutX 32512 .empty (.cutY 19712 (.cutX 32640 (.cutY 19584 .full (.cutX 32576 (.cutY 19648 .full .full) (.cutY 19648 .full .full))) (.cutY 19584 .full .full)) .empty)) .empty)))))) .empty)) .empty))))

theorem metadata23 : 0<234882010 ∧ 0<128 ∧ 51<128 ∧ 1<4 ∧
    4211/4160=1 ∧ 4211%4160=51 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 4556, atom 5060, type 1, source (7,53).
def leavesData24 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨3,2,0⟩) (.single ⟨3,2,1⟩))))) (.node (.node (.node (.single ⟨3,3,0⟩) (.single ⟨3,3,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))))))
def leaves24 : Fin 19 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 7 53 leaves24 i
def outputData24 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨1792,1856,13568,13632⟩) (.single ⟨1792,1856,13632,13696⟩)) (.node (.single ⟨1856,1888,13568,13600⟩) (.single ⟨1856,1888,13600,13632⟩))) (.node (.node (.single ⟨1888,1920,13568,13600⟩) (.single ⟨1888,1920,13600,13632⟩)) (.node (.single ⟨1856,1920,13632,13696⟩) (.node (.single ⟨1792,1920,13696,13824⟩) (.single ⟨1920,1952,13568,13600⟩))))) (.node (.node (.node (.single ⟨1920,1952,13600,13632⟩) (.single ⟨1952,1984,13568,13600⟩)) (.node (.single ⟨1952,1984,13600,13632⟩) (.node (.single ⟨1920,1984,13632,13696⟩) (.single ⟨1984,2016,13568,13600⟩)))) (.node (.node (.single ⟨1984,2016,13600,13632⟩) (.single ⟨2016,2048,13568,13600⟩)) (.node (.single ⟨2016,2048,13600,13632⟩) (.node (.single ⟨1984,2048,13632,13696⟩) (.single ⟨1920,2048,13696,13824⟩)))))) (.node (.node (.node (.node (.single ⟨13568,13632,1792,1856⟩) (.single ⟨13568,13600,1856,1888⟩)) (.node (.single ⟨13568,13600,1888,1920⟩) (.single ⟨13600,13632,1856,1888⟩))) (.node (.node (.single ⟨13600,13632,1888,1920⟩) (.single ⟨13632,13696,1792,1856⟩)) (.node (.single ⟨13632,13696,1856,1920⟩) (.node (.single ⟨13568,13600,1920,1952⟩) (.single ⟨13568,13600,1952,1984⟩))))) (.node (.node (.node (.single ⟨13600,13632,1920,1952⟩) (.single ⟨13600,13632,1952,1984⟩)) (.node (.single ⟨13568,13600,1984,2016⟩) (.node (.single ⟨13568,13600,2016,2048⟩) (.single ⟨13600,13632,1984,2016⟩)))) (.node (.node (.single ⟨13600,13632,2016,2048⟩) (.single ⟨13632,13696,1920,1984⟩)) (.node (.single ⟨13632,13696,1984,2048⟩) (.node (.single ⟨13696,13824,1792,1920⟩) (.single ⟨13696,13824,1920,2048⟩))))))) (.node (.node (.node (.node (.node (.single ⟨18944,19072,30720,30848⟩) (.single ⟨18944,19072,30848,30976⟩)) (.node (.single ⟨19072,19136,30720,30784⟩) (.single ⟨19072,19136,30784,30848⟩))) (.node (.node (.single ⟨19136,19168,30720,30752⟩) (.single ⟨19136,19168,30752,30784⟩)) (.node (.single ⟨19168,19200,30720,30752⟩) (.node (.single ⟨19168,19200,30752,30784⟩) (.single ⟨19136,19168,30784,30816⟩))))) (.node (.node (.node (.single ⟨19136,19168,30816,30848⟩) (.single ⟨19168,19200,30784,30816⟩)) (.node (.single ⟨19168,19200,30816,30848⟩) (.node (.single ⟨19072,19136,30848,30912⟩) (.single ⟨19072,19136,30912,30976⟩)))) (.node (.node (.single ⟨19136,19168,30848,30880⟩) (.single ⟨19136,19168,30880,30912⟩)) (.node (.single ⟨19168,19200,30848,30880⟩) (.node (.single ⟨19168,19200,30880,30912⟩) (.single ⟨19136,19200,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨30720,30848,18944,19072⟩) (.single ⟨30720,30784,19072,19136⟩)) (.node (.single ⟨30720,30752,19136,19168⟩) (.single ⟨30720,30752,19168,19200⟩))) (.node (.node (.single ⟨30752,30784,19136,19168⟩) (.single ⟨30752,30784,19168,19200⟩)) (.node (.single ⟨30784,30848,19072,19136⟩) (.node (.single ⟨30784,30816,19136,19168⟩) (.single ⟨30784,30816,19168,19200⟩))))) (.node (.node (.node (.single ⟨30816,30848,19136,19168⟩) (.single ⟨30816,30848,19168,19200⟩)) (.node (.single ⟨30848,30976,18944,19072⟩) (.node (.single ⟨30848,30912,19072,19136⟩) (.single ⟨30848,30880,19136,19168⟩)))) (.node (.node (.single ⟨30848,30880,19168,19200⟩) (.single ⟨30880,30912,19136,19168⟩)) (.node (.single ⟨30880,30912,19168,19200⟩) (.node (.single ⟨30912,30976,19072,19136⟩) (.single ⟨30912,30976,19136,19200⟩))))))))
def output24 : Fin 76 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 7) (.single 36)) (.node (.single 68) (.single 39))) (.node (.node (.single 18) (.single 37)) (.node (.single 57) (.node (.single 38) (.single 0))))) (.node (.node (.node (.single 19) (.single 75)) (.node (.single 56) (.node (.single 1) (.single 24)))) (.node (.node (.single 74) (.single 51)) (.node (.single 6) (.node (.single 25) (.single 69)))))) (.node (.node (.node (.node (.single 50) (.single 12)) (.node (.single 34) (.single 63))) (.node (.node (.single 41) (.single 17)) (.node (.single 35) (.node (.single 58) (.single 40))))) (.node (.node (.node (.single 2) (.single 20)) (.node (.single 73) (.node (.single 55) (.single 3)))) (.node (.node (.single 22) (.single 72)) (.node (.single 53) (.node (.single 4) (.single 21))))))) (.node (.node (.node (.node (.node (.single 71) (.single 54)) (.node (.single 5) (.single 23))) (.node (.node (.single 70) (.single 52)) (.node (.single 8) (.node (.single 26) (.single 67))))) (.node (.node (.node (.single 49) (.single 9)) (.node (.single 28) (.node (.single 66) (.single 47)))) (.node (.node (.single 10) (.single 27)) (.node (.single 65) (.node (.single 48) (.single 11)))))) (.node (.node (.node (.node (.single 29) (.single 64)) (.node (.single 46) (.single 13))) (.node (.node (.single 30) (.single 62)) (.node (.single 45) (.node (.single 14) (.single 32))))) (.node (.node (.node (.single 61) (.single 43)) (.node (.single 15) (.node (.single 31) (.single 60)))) (.node (.node (.single 44) (.single 16)) (.node (.single 33) (.node (.single 59) (.single 42))))))))
def sourceData24 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 28) (.single 32))) (.node (.node (.single 36) (.single 40)) (.node (.single 16) (.node (.single 0) (.single 44))))) (.node (.node (.node (.single 48) (.single 52)) (.node (.single 56) (.node (.single 20) (.single 60)))) (.node (.node (.single 64) (.single 68)) (.node (.single 72) (.node (.single 24) (.single 4)))))) (.node (.node (.node (.node (.single 9) (.single 29)) (.node (.single 37) (.single 33))) (.node (.node (.single 41) (.single 13)) (.node (.single 17) (.node (.single 45) (.single 53))))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 61) (.node (.single 69) (.single 65)))) (.node (.node (.single 73) (.single 21)) (.node (.single 25) (.node (.single 1) (.single 5))))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 27) (.single 23))) (.node (.node (.single 75) (.single 67)) (.node (.single 71) (.node (.single 63) (.single 59))))) (.node (.node (.node (.single 51) (.single 55)) (.node (.single 47) (.node (.single 19) (.single 15)))) (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.node (.single 31) (.single 11)))))) (.node (.node (.node (.node (.single 6) (.single 26)) (.node (.single 74) (.single 70))) (.node (.node (.single 66) (.single 62)) (.node (.single 22) (.node (.single 58) (.single 54))))) (.node (.node (.node (.single 50) (.single 46)) (.node (.single 2) (.node (.single 18) (.single 42)))) (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.node (.single 14) (.single 10))))))))
def cover24 (i : Fin 76) : Fin 76 := ⟨coverData24.get i % 76, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 76) : Fin 76 := ⟨sourceData24.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 .empty (.cutX 1536 .empty (.cutY 13824 (.cutX 1792 .empty (.cutY 13568 .empty (.cutX 1920 (.cutY 13696 (.cutX 1856 (.cutY 13632 .full .full) (.cutY 13632 (.cutX 1888 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full)) .full) (.cutY 13696 (.cutX 1984 (.cutY 13632 (.cutX 1952 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full) (.cutY 13632 (.cutX 2016 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full)) .full)))) .empty)))) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 .empty (.cutX 13824 (.cutY 1536 .empty (.cutX 13568 .empty (.cutY 1792 .empty (.cutX 13696 (.cutY 1920 (.cutX 13632 (.cutY 1856 .full (.cutX 13600 (.cutY 1888 .full .full) (.cutY 1888 .full .full))) (.cutY 1856 .full .full)) (.cutX 13632 (.cutY 1984 (.cutX 13600 (.cutY 1952 .full .full) (.cutY 1952 .full .full)) (.cutX 13600 (.cutY 2016 .full .full) (.cutY 2016 .full .full))) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))))) .empty))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 (.cutX 18944 .empty (.cutY 31232 (.cutX 19200 (.cutY 30976 (.cutX 19072 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 19136 (.cutY 30784 .full .full) (.cutY 30784 (.cutX 19168 (.cutY 30752 .full .full) (.cutY 30752 .full .full)) (.cutX 19168 (.cutY 30816 .full .full) (.cutY 30816 .full .full)))) (.cutX 19136 (.cutY 30912 .full .full) (.cutY 30912 (.cutX 19168 (.cutY 30880 .full .full) (.cutY 30880 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 (.cutX 31232 (.cutY 18944 .empty (.cutX 30976 (.cutY 19200 (.cutX 30848 (.cutY 19072 .full (.cutX 30784 (.cutY 19136 .full (.cutX 30752 (.cutY 19168 .full .full) (.cutY 19168 .full .full))) (.cutY 19136 .full (.cutX 30816 (.cutY 19168 .full .full) (.cutY 19168 .full .full))))) (.cutY 19072 .full (.cutX 30912 (.cutY 19136 .full (.cutX 30880 (.cutY 19168 .full .full) (.cutY 19168 .full .full))) (.cutY 19136 .full .full)))) .empty) .empty)) .empty) .empty) .empty))) .empty)) .empty))))

theorem metadata24 : 0<234882010 ∧ 7<128 ∧ 53<128 ∧ 1<4 ∧
    5060/4160=1 ∧ 5060%4160=900 ∧ ∀ i, (leaves24 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData24).mp
    (by decide +kernel)

theorem sourceChecked24_0 : ∀ i : Fin 64,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked24_64 : ∀ i : Fin 12,
    (fun i => output24 i = raw24 (source24 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked24 : ∀ i : Fin 76, (fun i => output24 i = raw24 (source24 i)) i :=
  forallFin_of_zero_offset (fun i => output24 i = raw24 (source24 i)) (forallFinOffset_add (fun i => output24 i = raw24 (source24 i)) 0 64 12 (by decide) sourceChecked24_0
    sourceChecked24_64)

theorem coverChecked24_0 : ∀ i : Fin 64,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked24_64 : ∀ i : Fin 12,
    (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked24 : ∀ i : Fin 76, (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) i :=
  forallFin_of_zero_offset (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) (forallFinOffset_add (fun i => (output24 (cover24 i)).ContainsBox (raw24 i)) 0 64 12 (by decide) coverChecked24_0
    coverChecked24_64)

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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 4557, atom 6553, type 1, source (22,61).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 61 leaves25 i
def outputData25 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,15616,15680⟩) (.node (.single ⟨5632,5696,15680,15744⟩) (.single ⟨5696,5760,15616,15680⟩))) (.node (.single ⟨5696,5760,15680,15744⟩) (.node (.single ⟨5632,5760,15744,15872⟩) (.single ⟨5760,5824,15616,15680⟩)))) (.node (.node (.single ⟨5760,5824,15680,15744⟩) (.node (.single ⟨5824,5856,15616,15648⟩) (.single ⟨5824,5856,15648,15680⟩))) (.node (.node (.single ⟨5856,5888,15616,15648⟩) (.single ⟨5856,5888,15648,15680⟩)) (.node (.single ⟨5824,5888,15680,15744⟩) (.single ⟨5760,5888,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15680,5632,5696⟩) (.node (.single ⟨15616,15680,5696,5760⟩) (.single ⟨15680,15744,5632,5696⟩))) (.node (.single ⟨15680,15744,5696,5760⟩) (.node (.single ⟨15616,15680,5760,5824⟩) (.single ⟨15616,15648,5824,5856⟩)))) (.node (.node (.single ⟨15616,15648,5856,5888⟩) (.node (.single ⟨15648,15680,5824,5856⟩) (.single ⟨15648,15680,5856,5888⟩))) (.node (.node (.single ⟨15680,15744,5760,5824⟩) (.single ⟨15680,15744,5824,5888⟩)) (.node (.single ⟨15744,15872,5632,5760⟩) (.single ⟨15744,15872,5760,5888⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,26880,27008⟩) (.node (.single ⟨16896,17024,27008,27136⟩) (.single ⟨17024,17088,26880,26944⟩))) (.node (.single ⟨17024,17088,26944,27008⟩) (.node (.single ⟨17088,17120,26880,26912⟩) (.single ⟨17088,17120,26912,26944⟩)))) (.node (.node (.single ⟨17120,17152,26880,26912⟩) (.node (.single ⟨17120,17152,26912,26944⟩) (.single ⟨17088,17152,26944,27008⟩))) (.node (.node (.single ⟨17024,17088,27008,27072⟩) (.single ⟨17024,17088,27072,27136⟩)) (.node (.single ⟨17088,17152,27008,27072⟩) (.single ⟨17088,17152,27072,27136⟩))))) (.node (.node (.node (.single ⟨26880,27008,16896,17024⟩) (.node (.single ⟨26880,26944,17024,17088⟩) (.single ⟨26880,26912,17088,17120⟩))) (.node (.single ⟨26880,26912,17120,17152⟩) (.node (.single ⟨26912,26944,17088,17120⟩) (.single ⟨26912,26944,17120,17152⟩)))) (.node (.node (.single ⟨26944,27008,17024,17088⟩) (.node (.single ⟨26944,27008,17088,17152⟩) (.single ⟨27008,27136,16896,17024⟩))) (.node (.node (.single ⟨27008,27072,17024,17088⟩) (.single ⟨27008,27072,17088,17152⟩)) (.node (.single ⟨27072,27136,17024,17088⟩) (.single ⟨27072,27136,17088,17152⟩)))))))
def output25 : Fin 52 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover25 (i : Fin 52) : Fin 52 := ⟨coverData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 52) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 .empty (.cutY 15872 (.cutX 5888 (.cutY 15616 .empty (.cutX 5760 (.cutY 15744 (.cutX 5696 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 5824 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 5856 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full))) .empty) .empty))))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 (.cutY 5632 .empty (.cutX 15616 .empty (.cutY 5888 (.cutX 15744 (.cutY 5760 (.cutX 15680 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 15680 (.cutY 5824 .full (.cutX 15648 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty))) .empty))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 .empty (.cutY 27136 (.cutX 17152 (.cutY 26880 .empty (.cutX 17024 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 17088 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 17120 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 17088 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 (.cutY 16896 .empty (.cutX 26880 .empty (.cutY 17152 (.cutX 27008 (.cutY 17024 .full (.cutX 26944 (.cutY 17088 .full (.cutX 26912 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full (.cutX 27072 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata25 : 0<166308920 ∧ 22<128 ∧ 61<128 ∧ 1<4 ∧
    6553/4160=1 ∧ 6553%4160=2393 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 4558, atom 5394, type 1, source (10,54).
def leavesData26 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves26 : Fin 13 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 10 54 leaves26 i
def outputData26 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2560,2624,13824,13888⟩) (.node (.single ⟨2560,2624,13888,13952⟩) (.single ⟨2624,2688,13824,13888⟩))) (.node (.single ⟨2624,2688,13888,13952⟩) (.node (.single ⟨2560,2688,13952,14080⟩) (.single ⟨2688,2752,13824,13888⟩)))) (.node (.node (.single ⟨2688,2752,13888,13952⟩) (.node (.single ⟨2752,2784,13824,13856⟩) (.single ⟨2752,2784,13856,13888⟩))) (.node (.node (.single ⟨2784,2816,13824,13856⟩) (.single ⟨2784,2816,13856,13888⟩)) (.node (.single ⟨2752,2816,13888,13952⟩) (.single ⟨2688,2816,13952,14080⟩))))) (.node (.node (.node (.single ⟨13824,13888,2560,2624⟩) (.node (.single ⟨13824,13888,2624,2688⟩) (.single ⟨13888,13952,2560,2624⟩))) (.node (.single ⟨13888,13952,2624,2688⟩) (.node (.single ⟨13824,13888,2688,2752⟩) (.single ⟨13824,13856,2752,2784⟩)))) (.node (.node (.single ⟨13824,13856,2784,2816⟩) (.node (.single ⟨13856,13888,2752,2784⟩) (.single ⟨13856,13888,2784,2816⟩))) (.node (.node (.single ⟨13888,13952,2688,2752⟩) (.single ⟨13888,13952,2752,2816⟩)) (.node (.single ⟨13952,14080,2560,2688⟩) (.single ⟨13952,14080,2688,2816⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18816,29952,30080⟩) (.node (.single ⟨18688,18816,30080,30208⟩) (.single ⟨18816,18880,29952,30016⟩))) (.node (.single ⟨18816,18880,30016,30080⟩) (.node (.single ⟨18880,18912,29952,29984⟩) (.single ⟨18880,18912,29984,30016⟩)))) (.node (.node (.single ⟨18912,18944,29952,29984⟩) (.node (.single ⟨18912,18944,29984,30016⟩) (.single ⟨18880,18944,30016,30080⟩))) (.node (.node (.single ⟨18816,18880,30080,30144⟩) (.single ⟨18816,18880,30144,30208⟩)) (.node (.single ⟨18880,18944,30080,30144⟩) (.single ⟨18880,18944,30144,30208⟩))))) (.node (.node (.node (.single ⟨29952,30080,18688,18816⟩) (.node (.single ⟨29952,30016,18816,18880⟩) (.single ⟨29952,29984,18880,18912⟩))) (.node (.single ⟨29952,29984,18912,18944⟩) (.node (.single ⟨29984,30016,18880,18912⟩) (.single ⟨29984,30016,18912,18944⟩)))) (.node (.node (.single ⟨30016,30080,18816,18880⟩) (.node (.single ⟨30016,30080,18880,18944⟩) (.single ⟨30080,30208,18688,18816⟩))) (.node (.node (.single ⟨30080,30144,18816,18880⟩) (.single ⟨30080,30144,18880,18944⟩)) (.node (.single ⟨30144,30208,18816,18880⟩) (.single ⟨30144,30208,18880,18944⟩)))))))
def output26 : Fin 52 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData26 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover26 (i : Fin 52) : Fin 52 := ⟨coverData26.get i % 52, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 52) : Fin 52 := ⟨sourceData26.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 .empty (.cutY 13824 .empty (.cutX 2816 (.cutY 14080 (.cutX 2688 (.cutY 13952 (.cutX 2624 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full) (.cutY 13952 (.cutX 2752 (.cutY 13888 .full .full) (.cutY 13888 (.cutX 2784 (.cutY 13856 .full .full) (.cutY 13856 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 .empty (.cutY 2560 .empty (.cutX 14080 (.cutY 2816 (.cutX 13952 (.cutY 2688 (.cutX 13888 (.cutY 2624 .full .full) (.cutY 2624 .full .full)) (.cutX 13888 (.cutY 2752 .full (.cutX 13856 (.cutY 2784 .full .full) (.cutY 2784 .full .full))) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 (.cutY 30208 (.cutX 18688 .empty (.cutY 29952 .empty (.cutX 18816 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 18880 (.cutY 30016 .full .full) (.cutY 30016 (.cutX 18912 (.cutY 29984 .full .full) (.cutY 29984 .full .full)) .full)) (.cutX 18880 (.cutY 30144 .full .full) (.cutY 30144 .full .full)))))) .empty) .empty)) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 (.cutY 18944 (.cutX 29952 .empty (.cutY 18688 .empty (.cutX 30080 (.cutY 18816 .full (.cutX 30016 (.cutY 18880 .full (.cutX 29984 (.cutY 18912 .full .full) (.cutY 18912 .full .full))) (.cutY 18880 .full .full))) (.cutY 18816 .full (.cutX 30144 (.cutY 18880 .full .full) (.cutY 18880 .full .full)))))) .empty) .empty) .empty))) .empty) .empty)) .empty))))

theorem metadata26 : 0<144841863 ∧ 10<128 ∧ 54<128 ∧ 1<4 ∧
    5394/4160=1 ∧ 5394%4160=1234 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 4559, atom 5812, type 1, source (14,56).
def leavesData27 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves27 : Fin 13 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 14 56 leaves27 i
def outputData27 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3584,3648,14336,14400⟩) (.node (.single ⟨3584,3648,14400,14464⟩) (.single ⟨3648,3712,14336,14400⟩))) (.node (.single ⟨3648,3712,14400,14464⟩) (.node (.single ⟨3584,3712,14464,14592⟩) (.single ⟨3712,3776,14336,14400⟩)))) (.node (.node (.single ⟨3712,3776,14400,14464⟩) (.node (.single ⟨3776,3808,14336,14368⟩) (.single ⟨3776,3808,14368,14400⟩))) (.node (.node (.single ⟨3808,3840,14336,14368⟩) (.single ⟨3808,3840,14368,14400⟩)) (.node (.single ⟨3776,3840,14400,14464⟩) (.single ⟨3712,3840,14464,14592⟩))))) (.node (.node (.node (.single ⟨14336,14400,3584,3648⟩) (.node (.single ⟨14336,14400,3648,3712⟩) (.single ⟨14400,14464,3584,3648⟩))) (.node (.single ⟨14400,14464,3648,3712⟩) (.node (.single ⟨14336,14400,3712,3776⟩) (.single ⟨14336,14368,3776,3808⟩)))) (.node (.node (.single ⟨14336,14368,3808,3840⟩) (.node (.single ⟨14368,14400,3776,3808⟩) (.single ⟨14368,14400,3808,3840⟩))) (.node (.node (.single ⟨14400,14464,3712,3776⟩) (.single ⟨14400,14464,3776,3840⟩)) (.node (.single ⟨14464,14592,3584,3712⟩) (.single ⟨14464,14592,3712,3840⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,28928,29056⟩) (.node (.single ⟨18176,18304,29056,29184⟩) (.single ⟨18304,18368,28928,28992⟩))) (.node (.single ⟨18304,18368,28992,29056⟩) (.node (.single ⟨18368,18400,28928,28960⟩) (.single ⟨18368,18400,28960,28992⟩)))) (.node (.node (.single ⟨18400,18432,28928,28960⟩) (.node (.single ⟨18400,18432,28960,28992⟩) (.single ⟨18368,18432,28992,29056⟩))) (.node (.node (.single ⟨18304,18368,29056,29120⟩) (.single ⟨18304,18368,29120,29184⟩)) (.node (.single ⟨18368,18432,29056,29120⟩) (.single ⟨18368,18432,29120,29184⟩))))) (.node (.node (.node (.single ⟨28928,29056,18176,18304⟩) (.node (.single ⟨28928,28992,18304,18368⟩) (.single ⟨28928,28960,18368,18400⟩))) (.node (.single ⟨28928,28960,18400,18432⟩) (.node (.single ⟨28960,28992,18368,18400⟩) (.single ⟨28960,28992,18400,18432⟩)))) (.node (.node (.single ⟨28992,29056,18304,18368⟩) (.node (.single ⟨28992,29056,18368,18432⟩) (.single ⟨29056,29184,18176,18304⟩))) (.node (.node (.single ⟨29056,29120,18304,18368⟩) (.single ⟨29056,29120,18368,18432⟩)) (.node (.single ⟨29120,29184,18304,18368⟩) (.single ⟨29120,29184,18368,18432⟩)))))))
def output27 : Fin 52 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover27 (i : Fin 52) : Fin 52 := ⟨coverData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 52) : Fin 52 := ⟨sourceData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 (.cutX 3584 .empty (.cutY 14848 (.cutX 3840 (.cutY 14592 (.cutX 3712 (.cutY 14464 (.cutX 3648 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full) (.cutY 14464 (.cutX 3776 (.cutY 14400 .full .full) (.cutY 14400 (.cutX 3808 (.cutY 14368 .full .full) (.cutY 14368 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 .empty (.cutX 14848 (.cutY 3584 .empty (.cutX 14592 (.cutY 3840 (.cutX 14464 (.cutY 3712 (.cutX 14400 (.cutY 3648 .full .full) (.cutY 3648 .full .full)) (.cutX 14400 (.cutY 3776 .full (.cutX 14368 (.cutY 3808 .full .full) (.cutY 3808 .full .full))) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)) .empty)) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 (.cutX 17920 .empty (.cutY 29184 (.cutX 18176 .empty (.cutY 28928 .empty (.cutX 18304 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 18368 (.cutY 28992 .full .full) (.cutY 28992 (.cutX 18400 (.cutY 28960 .full .full) (.cutY 28960 .full .full)) .full)) (.cutX 18368 (.cutY 29120 .full .full) (.cutY 29120 .full .full)))))) .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 .empty (.cutX 29184 (.cutY 17920 .empty (.cutX 28928 .empty (.cutY 18176 .empty (.cutX 29056 (.cutY 18304 .full (.cutX 28992 (.cutY 18368 .full (.cutX 28960 (.cutY 18400 .full .full) (.cutY 18400 .full .full))) (.cutY 18368 .full .full))) (.cutY 18304 .full (.cutX 29120 (.cutY 18368 .full .full) (.cutY 18368 .full .full))))))) .empty)) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata27 : 0<163200014 ∧ 14<128 ∧ 56<128 ∧ 1<4 ∧
    5812/4160=1 ∧ 5812%4160=1652 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 4560, atom 671, type 0, source (5,56).
def leavesData28 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves28 : Fin 4 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 5 56 leaves28 i
def outputData28 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1280,1408,14336,14464⟩) (.single ⟨1280,1408,14464,14592⟩)) (.node (.single ⟨1408,1536,14336,14464⟩) (.single ⟨1408,1536,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,1280,1408⟩) (.single ⟨14336,14464,1408,1536⟩)) (.node (.single ⟨14464,14592,1280,1408⟩) (.single ⟨14464,14592,1408,1536⟩)))) (.node (.node (.node (.single ⟨18176,18304,31232,31360⟩) (.single ⟨18176,18304,31360,31488⟩)) (.node (.single ⟨18304,18432,31232,31360⟩) (.single ⟨18304,18432,31360,31488⟩))) (.node (.node (.single ⟨31232,31360,18176,18304⟩) (.single ⟨31232,31360,18304,18432⟩)) (.node (.single ⟨31360,31488,18176,18304⟩) (.single ⟨31360,31488,18304,18432⟩)))))
def output28 : Fin 16 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData28 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover28 (i : Fin 16) : Fin 16 := ⟨coverData28.get i % 16, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 16) : Fin 16 := ⟨sourceData28.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 (.cutY 14848 (.cutX 1280 .empty (.cutY 14592 (.cutX 1408 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 (.cutX 14592 (.cutY 1280 .empty (.cutX 14464 (.cutY 1408 .full .full) (.cutY 1408 .full .full))) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 .empty (.cutX 18176 .empty (.cutY 31488 (.cutX 18304 (.cutY 31360 .full .full) (.cutY 31360 .full .full)) .empty)))) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 .empty (.cutY 17920 .empty (.cutX 31488 (.cutY 18176 .empty (.cutX 31360 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)))) .empty) .empty)) .empty)) .empty))))

theorem metadata28 : 0<89519217 ∧ 5<128 ∧ 56<128 ∧ 0<4 ∧
    671/4160=0 ∧ 671%4160=671 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 4561, atom 3498, type 0, source (38,78).
def leavesData29 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves29 : Fin 4 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 38 78 leaves29 i
def outputData29 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9728,9856,19968,20096⟩) (.single ⟨9728,9856,20096,20224⟩)) (.node (.single ⟨9856,9984,19968,20096⟩) (.single ⟨9856,9984,20096,20224⟩))) (.node (.node (.single ⟨12544,12672,22784,22912⟩) (.single ⟨12544,12672,22912,23040⟩)) (.node (.single ⟨12672,12800,22784,22912⟩) (.single ⟨12672,12800,22912,23040⟩)))) (.node (.node (.node (.single ⟨19968,20096,9728,9856⟩) (.single ⟨19968,20096,9856,9984⟩)) (.node (.single ⟨20096,20224,9728,9856⟩) (.single ⟨20096,20224,9856,9984⟩))) (.node (.node (.single ⟨22784,22912,12544,12672⟩) (.single ⟨22784,22912,12672,12800⟩)) (.node (.single ⟨22912,23040,12544,12672⟩) (.single ⟨22912,23040,12672,12800⟩)))))
def output29 : Fin 16 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData29 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover29 (i : Fin 16) : Fin 16 := ⟨coverData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 16) : Fin 16 := ⟨sourceData29.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 .empty (.cutY 19968 .empty (.cutX 9984 (.cutY 20224 (.cutX 9856 (.cutY 20096 .full .full) (.cutY 20096 .full .full)) .empty) .empty)))))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 (.cutY 23040 (.cutX 12544 .empty (.cutY 22784 .empty (.cutX 12672 (.cutY 22912 .full .full) (.cutY 22912 .full .full)))) .empty) .empty) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 .empty (.cutY 9728 .empty (.cutX 20224 (.cutY 9984 (.cutX 20096 (.cutY 9856 .full .full) (.cutY 9856 .full .full)) .empty) .empty))))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 (.cutY 12800 (.cutX 22784 .empty (.cutY 12544 .empty (.cutX 22912 (.cutY 12672 .full .full) (.cutY 12672 .full .full)))) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata29 : 0<109574533 ∧ 38<128 ∧ 78<128 ∧ 0<4 ∧
    3498/4160=0 ∧ 3498%4160=3498 ∧ ∀ i, (leaves29 i).Valid 8 := by
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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 4562, atom 3693, type 0, source (42,81).
def leavesData30 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves30 : Fin 4 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 42 81 leaves30 i
def outputData30 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10752,10880,20736,20864⟩) (.single ⟨10752,10880,20864,20992⟩)) (.node (.single ⟨10880,11008,20736,20864⟩) (.single ⟨10880,11008,20864,20992⟩))) (.node (.node (.single ⟨11776,11904,21760,21888⟩) (.single ⟨11776,11904,21888,22016⟩)) (.node (.single ⟨11904,12032,21760,21888⟩) (.single ⟨11904,12032,21888,22016⟩)))) (.node (.node (.node (.single ⟨20736,20864,10752,10880⟩) (.single ⟨20736,20864,10880,11008⟩)) (.node (.single ⟨20864,20992,10752,10880⟩) (.single ⟨20864,20992,10880,11008⟩))) (.node (.node (.single ⟨21760,21888,11776,11904⟩) (.single ⟨21760,21888,11904,12032⟩)) (.node (.single ⟨21888,22016,11776,11904⟩) (.single ⟨21888,22016,11904,12032⟩)))))
def output30 : Fin 16 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData30 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover30 (i : Fin 16) : Fin 16 := ⟨coverData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 16) : Fin 16 := ⟨sourceData30.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 .empty (.cutY 20992 (.cutX 11008 (.cutY 20736 .empty (.cutX 10880 (.cutY 20864 .full .full) (.cutY 20864 .full .full))) .empty) .empty)) .empty) (.cutY 21504 .empty (.cutX 11776 .empty (.cutY 22016 (.cutX 12032 (.cutY 21760 .empty (.cutX 11904 (.cutY 21888 .full .full) (.cutY 21888 .full .full))) .empty) .empty)))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 (.cutY 10752 .empty (.cutX 20736 .empty (.cutY 11008 (.cutX 20864 (.cutY 10880 .full .full) (.cutY 10880 .full .full)) .empty))) .empty) .empty) (.cutY 11264 .empty (.cutX 22016 (.cutY 11776 .empty (.cutX 21760 .empty (.cutY 12032 (.cutX 21888 (.cutY 11904 .full .full) (.cutY 11904 .full .full)) .empty))) .empty)))) .empty) .empty))) .empty) .empty))

theorem metadata30 : 0<1701312 ∧ 42<128 ∧ 81<128 ∧ 0<4 ∧
    3693/4160=0 ∧ 3693%4160=3693 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (26583/25600000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 4563, atom 3550, type 0, source (39,79).
def leavesData31 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves31 : Fin 4 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 39 79 leaves31 i
def outputData31 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9984,10112,20224,20352⟩) (.single ⟨9984,10112,20352,20480⟩)) (.node (.single ⟨10112,10240,20224,20352⟩) (.single ⟨10112,10240,20352,20480⟩))) (.node (.node (.single ⟨12288,12416,22528,22656⟩) (.single ⟨12288,12416,22656,22784⟩)) (.node (.single ⟨12416,12544,22528,22656⟩) (.single ⟨12416,12544,22656,22784⟩)))) (.node (.node (.node (.single ⟨20224,20352,9984,10112⟩) (.single ⟨20224,20352,10112,10240⟩)) (.node (.single ⟨20352,20480,9984,10112⟩) (.single ⟨20352,20480,10112,10240⟩))) (.node (.node (.single ⟨22528,22656,12288,12416⟩) (.single ⟨22528,22656,12416,12544⟩)) (.node (.single ⟨22656,22784,12288,12416⟩) (.single ⟨22656,22784,12416,12544⟩)))))
def output31 : Fin 16 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData31 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover31 (i : Fin 16) : Fin 16 := ⟨coverData31.get i % 16, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 16) : Fin 16 := ⟨sourceData31.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 .empty (.cutY 19968 .empty (.cutX 9984 .empty (.cutY 20224 .empty (.cutX 10112 (.cutY 20352 .full .full) (.cutY 20352 .full .full))))))))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 (.cutY 23040 (.cutX 12544 (.cutY 22784 (.cutX 12416 (.cutY 22656 .full .full) (.cutY 22656 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 .empty (.cutY 9728 .empty (.cutX 20224 .empty (.cutY 9984 .empty (.cutX 20352 (.cutY 10112 .full .full) (.cutY 10112 .full .full)))))))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 (.cutY 12800 (.cutX 22784 (.cutY 12544 (.cutX 22656 (.cutY 12416 .full .full) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata31 : 0<109574533 ∧ 39<128 ∧ 79<128 ∧ 0<4 ∧
    3550/4160=0 ∧ 3550%4160=3550 ∧ ∀ i, (leaves31 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData31).mp
    (by decide +kernel)

theorem sourceChecked31_0 : ∀ i : Fin 16,
    (fun i => output31 i = raw31 (source31 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked31 : ∀ i : Fin 16, (fun i => output31 i = raw31 (source31 i)) i :=
  forallFin_of_zero_offset (fun i => output31 i = raw31 (source31 i)) sourceChecked31_0

theorem coverChecked31_0 : ∀ i : Fin 16,
    (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked31 : ∀ i : Fin 16, (fun i => (output31 (cover31 i)).ContainsBox (raw31 i)) i :=
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

noncomputable def phaseMass31 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw31 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass31_eq : phaseMass31 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass31
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw31 output31 cover31 source31
    (gridTreeUnionCheck_sound 32768 raw31 output31 cover31 source31 tree31 checked31)
    _ (by norm_num) _, areaUnits31]
  norm_num

-- Frozen phase 4564, atom 3079, type 0, source (31,72).
def leavesData32 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves32 : Fin 4 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 31 72 leaves32 i
def outputData32 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7936,8064,18432,18560⟩) (.single ⟨7936,8064,18560,18688⟩)) (.node (.single ⟨8064,8192,18432,18560⟩) (.single ⟨8064,8192,18560,18688⟩))) (.node (.node (.single ⟨14080,14208,24576,24704⟩) (.single ⟨14080,14208,24704,24832⟩)) (.node (.single ⟨14208,14336,24576,24704⟩) (.single ⟨14208,14336,24704,24832⟩)))) (.node (.node (.node (.single ⟨18432,18560,7936,8064⟩) (.single ⟨18432,18560,8064,8192⟩)) (.node (.single ⟨18560,18688,7936,8064⟩) (.single ⟨18560,18688,8064,8192⟩))) (.node (.node (.single ⟨24576,24704,14080,14208⟩) (.single ⟨24576,24704,14208,14336⟩)) (.node (.single ⟨24704,24832,14080,14208⟩) (.single ⟨24704,24832,14208,14336⟩)))))
def output32 : Fin 16 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData32 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover32 (i : Fin 16) : Fin 16 := ⟨coverData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 16) : Fin 16 := ⟨sourceData32.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 (.cutX 7936 .empty (.cutY 18688 (.cutX 8064 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty)) .empty)) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 .empty (.cutY 25088 (.cutX 14080 .empty (.cutY 24832 (.cutX 14208 (.cutY 24704 .full .full) (.cutY 24704 .full .full)) .empty)) .empty)) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 (.cutY 7680 .empty (.cutX 18688 (.cutY 7936 .empty (.cutX 18560 (.cutY 8064 .full .full) (.cutY 8064 .full .full))) .empty)) .empty)) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 .empty (.cutX 24832 (.cutY 14080 .empty (.cutX 24704 (.cutY 14208 .full .full) (.cutY 14208 .full .full))) .empty)) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata32 : 0<177866497 ∧ 31<128 ∧ 72<128 ∧ 0<4 ∧
    3079/4160=0 ∧ 3079%4160=3079 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 4565, atom 1949, type 0, source (17,62).
def leavesData33 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves33 : Fin 4 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 17 62 leaves33 i
def outputData33 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4352,4480,15872,16000⟩) (.single ⟨4352,4480,16000,16128⟩)) (.node (.single ⟨4480,4608,15872,16000⟩) (.single ⟨4480,4608,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,4352,4480⟩) (.single ⟨15872,16000,4480,4608⟩)) (.node (.single ⟨16000,16128,4352,4480⟩) (.single ⟨16000,16128,4480,4608⟩)))) (.node (.node (.node (.single ⟨16640,16768,28160,28288⟩) (.single ⟨16640,16768,28288,28416⟩)) (.node (.single ⟨16768,16896,28160,28288⟩) (.single ⟨16768,16896,28288,28416⟩))) (.node (.node (.single ⟨28160,28288,16640,16768⟩) (.single ⟨28160,28288,16768,16896⟩)) (.node (.single ⟨28288,28416,16640,16768⟩) (.single ⟨28288,28416,16768,16896⟩)))))
def output33 : Fin 16 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData33 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover33 (i : Fin 16) : Fin 16 := ⟨coverData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 16) : Fin 16 := ⟨sourceData33.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 (.cutY 15872 .empty (.cutX 4352 .empty (.cutY 16128 (.cutX 4480 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty))) .empty)) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 .empty (.cutY 4608 (.cutX 16128 (.cutY 4352 .empty (.cutX 16000 (.cutY 4480 .full .full) (.cutY 4480 .full .full))) .empty) .empty)) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 (.cutY 28160 .empty (.cutX 16640 .empty (.cutY 28416 (.cutX 16768 (.cutY 28288 .full .full) (.cutY 28288 .full .full)) .empty))) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 .empty (.cutY 16896 (.cutX 28416 (.cutY 16640 .empty (.cutX 28288 (.cutY 16768 .full .full) (.cutY 16768 .full .full))) .empty) .empty)) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata33 : 0<185830537 ∧ 17<128 ∧ 62<128 ∧ 0<4 ∧
    1949/4160=0 ∧ 1949%4160=1949 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 4566, atom 6105, type 1, source (17,58).
def leavesData34 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves34 : Fin 10 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 17 58 leaves34 i
def outputData34 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4352,4480,14848,14976⟩) (.single ⟨4352,4480,14976,15104⟩)) (.node (.single ⟨4480,4544,14848,14912⟩) (.node (.single ⟨4480,4544,14912,14976⟩) (.single ⟨4544,4576,14848,14880⟩)))) (.node (.node (.single ⟨4544,4576,14880,14912⟩) (.single ⟨4576,4608,14848,14880⟩)) (.node (.single ⟨4576,4608,14880,14912⟩) (.node (.single ⟨4544,4608,14912,14976⟩) (.single ⟨4480,4608,14976,15104⟩))))) (.node (.node (.node (.single ⟨14848,14976,4352,4480⟩) (.single ⟨14848,14912,4480,4544⟩)) (.node (.single ⟨14848,14880,4544,4576⟩) (.node (.single ⟨14848,14880,4576,4608⟩) (.single ⟨14880,14912,4544,4576⟩)))) (.node (.node (.single ⟨14880,14912,4576,4608⟩) (.single ⟨14912,14976,4480,4544⟩)) (.node (.single ⟨14912,14976,4544,4608⟩) (.node (.single ⟨14976,15104,4352,4480⟩) (.single ⟨14976,15104,4480,4608⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17792,28160,28288⟩) (.single ⟨17664,17792,28288,28416⟩)) (.node (.single ⟨17792,17856,28160,28224⟩) (.node (.single ⟨17792,17856,28224,28288⟩) (.single ⟨17856,17888,28160,28192⟩)))) (.node (.node (.single ⟨17856,17888,28192,28224⟩) (.single ⟨17888,17920,28160,28192⟩)) (.node (.single ⟨17888,17920,28192,28224⟩) (.node (.single ⟨17856,17920,28224,28288⟩) (.single ⟨17792,17920,28288,28416⟩))))) (.node (.node (.node (.single ⟨28160,28288,17664,17792⟩) (.single ⟨28160,28224,17792,17856⟩)) (.node (.single ⟨28160,28192,17856,17888⟩) (.node (.single ⟨28160,28192,17888,17920⟩) (.single ⟨28192,28224,17856,17888⟩)))) (.node (.node (.single ⟨28192,28224,17888,17920⟩) (.single ⟨28224,28288,17792,17856⟩)) (.node (.single ⟨28224,28288,17856,17920⟩) (.node (.single ⟨28288,28416,17664,17792⟩) (.single ⟨28288,28416,17792,17920⟩)))))))
def output34 : Fin 40 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData34 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover34 (i : Fin 40) : Fin 40 := ⟨coverData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 40) : Fin 40 := ⟨sourceData34.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 (.cutY 14848 .empty (.cutX 4352 .empty (.cutY 15104 (.cutX 4480 (.cutY 14976 .full .full) (.cutY 14976 (.cutX 4544 (.cutY 14912 .full .full) (.cutY 14912 (.cutX 4576 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full)) .full)) .empty))) .empty) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 .empty (.cutY 4608 (.cutX 15104 (.cutY 4352 .empty (.cutX 14976 (.cutY 4480 .full (.cutX 14912 (.cutY 4544 .full (.cutX 14880 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty)) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 (.cutY 28160 .empty (.cutX 17664 .empty (.cutY 28416 (.cutX 17792 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 17856 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 17888 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) .full)) .empty))) .empty)))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 .empty (.cutY 17920 (.cutX 28416 (.cutY 17664 .empty (.cutX 28288 (.cutY 17792 .full (.cutX 28224 (.cutY 17856 .full (.cutX 28192 (.cutY 17888 .full .full) (.cutY 17888 .full .full))) (.cutY 17856 .full .full))) (.cutY 17792 .full .full))) .empty) .empty)))) .empty)) .empty) .empty) .empty))))

theorem metadata34 : 0<166308920 ∧ 17<128 ∧ 58<128 ∧ 1<4 ∧
    6105/4160=1 ∧ 6105%4160=1945 ∧ ∀ i, (leaves34 i).Valid 8 := by
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 4567, atom 7545, type 1, source (36,73).
def leavesData35 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves35 : Fin 7 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 36 73 leaves35 i
def outputData35 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9216,9344,18688,18816⟩) (.node (.single ⟨9216,9344,18816,18944⟩) (.single ⟨9344,9408,18688,18752⟩))) (.node (.node (.single ⟨9344,9408,18752,18816⟩) (.single ⟨9408,9472,18688,18752⟩)) (.node (.single ⟨9408,9472,18752,18816⟩) (.single ⟨9344,9472,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,23296,23424⟩) (.node (.single ⟨13824,13952,23424,23552⟩) (.single ⟨13952,14016,23296,23360⟩))) (.node (.node (.single ⟨13952,14016,23360,23424⟩) (.single ⟨14016,14080,23296,23360⟩)) (.node (.single ⟨14016,14080,23360,23424⟩) (.single ⟨13952,14080,23424,23552⟩))))) (.node (.node (.node (.single ⟨18688,18816,9216,9344⟩) (.node (.single ⟨18688,18752,9344,9408⟩) (.single ⟨18688,18752,9408,9472⟩))) (.node (.node (.single ⟨18752,18816,9344,9408⟩) (.single ⟨18752,18816,9408,9472⟩)) (.node (.single ⟨18816,18944,9216,9344⟩) (.single ⟨18816,18944,9344,9472⟩)))) (.node (.node (.single ⟨23296,23424,13824,13952⟩) (.node (.single ⟨23296,23360,13952,14016⟩) (.single ⟨23296,23360,14016,14080⟩))) (.node (.node (.single ⟨23360,23424,13952,14016⟩) (.single ⟨23360,23424,14016,14080⟩)) (.node (.single ⟨23424,23552,13824,13952⟩) (.single ⟨23424,23552,13952,14080⟩))))))
def output35 : Fin 28 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData35 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover35 (i : Fin 28) : Fin 28 := ⟨coverData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 28) : Fin 28 := ⟨sourceData35.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 (.cutX 9728 (.cutY 18944 (.cutX 9472 (.cutY 18688 .empty (.cutX 9344 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 9408 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty) .empty) .empty))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 (.cutX 13824 .empty (.cutY 23040 .empty (.cutX 14080 (.cutY 23296 .empty (.cutX 13952 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 14016 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty))) .empty))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 .empty (.cutX 18944 (.cutY 9728 (.cutX 18688 .empty (.cutY 9472 (.cutX 18816 (.cutY 9344 .full (.cutX 18752 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 .empty (.cutX 23040 .empty (.cutY 13824 .empty (.cutX 23296 .empty (.cutY 14080 (.cutX 23424 (.cutY 13952 .full (.cutX 23360 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))))) .empty) .empty))))) .empty) .empty))

theorem metadata35 : 0<167101800 ∧ 36<128 ∧ 73<128 ∧ 1<4 ∧
    7545/4160=1 ∧ 7545%4160=3385 ∧ ∀ i, (leaves35 i).Valid 8 := by
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

noncomputable def phaseMass35 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (835509/8192000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 4568, atom 3737, type 0, source (43,82).
def leavesData36 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves36 : Fin 4 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 43 82 leaves36 i
def outputData36 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨11008,11136,20992,21120⟩) (.single ⟨11008,11136,21120,21248⟩)) (.node (.single ⟨11136,11264,20992,21120⟩) (.single ⟨11136,11264,21120,21248⟩))) (.node (.node (.single ⟨11520,11648,21504,21632⟩) (.single ⟨11520,11648,21632,21760⟩)) (.node (.single ⟨11648,11776,21504,21632⟩) (.single ⟨11648,11776,21632,21760⟩)))) (.node (.node (.node (.single ⟨20992,21120,11008,11136⟩) (.single ⟨20992,21120,11136,11264⟩)) (.node (.single ⟨21120,21248,11008,11136⟩) (.single ⟨21120,21248,11136,11264⟩))) (.node (.node (.single ⟨21504,21632,11520,11648⟩) (.single ⟨21504,21632,11648,11776⟩)) (.node (.single ⟨21632,21760,11520,11648⟩) (.single ⟨21632,21760,11648,11776⟩)))))
def output36 : Fin 16 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData36 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover36 (i : Fin 16) : Fin 16 := ⟨coverData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 16) : Fin 16 := ⟨sourceData36.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 .empty (.cutY 20992 .empty (.cutX 11008 .empty (.cutY 21248 (.cutX 11136 (.cutY 21120 .full .full) (.cutY 21120 .full .full)) .empty)))) .empty) (.cutY 21504 .empty (.cutX 11776 (.cutY 22016 (.cutX 11520 .empty (.cutY 21760 (.cutX 11648 (.cutY 21632 .full .full) (.cutY 21632 .full .full)) .empty)) .empty) .empty))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 .empty (.cutY 10752 .empty (.cutX 21248 (.cutY 11008 .empty (.cutX 21120 (.cutY 11136 .full .full) (.cutY 11136 .full .full))) .empty))) .empty) (.cutY 11264 .empty (.cutX 22016 (.cutY 11776 (.cutX 21760 (.cutY 11520 .empty (.cutX 21632 (.cutY 11648 .full .full) (.cutY 11648 .full .full))) .empty) .empty) .empty)))) .empty) .empty))) .empty) .empty))

theorem metadata36 : 0<1701312 ∧ 43<128 ∧ 82<128 ∧ 0<4 ∧
    3737/4160=0 ∧ 3737%4160=3737 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (26583/25600000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 4569, atom 2224, type 0, source (20,64).
def leavesData37 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves37 : Fin 4 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 20 64 leaves37 i
def outputData37 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨5120,5248,16384,16512⟩) (.single ⟨5120,5248,16512,16640⟩)) (.node (.single ⟨5248,5376,16384,16512⟩) (.single ⟨5248,5376,16512,16640⟩))) (.node (.node (.single ⟨16128,16256,27392,27520⟩) (.single ⟨16128,16256,27520,27648⟩)) (.node (.single ⟨16256,16384,27392,27520⟩) (.single ⟨16256,16384,27520,27648⟩)))) (.node (.node (.node (.single ⟨16384,16512,5120,5248⟩) (.single ⟨16384,16512,5248,5376⟩)) (.node (.single ⟨16512,16640,5120,5248⟩) (.single ⟨16512,16640,5248,5376⟩))) (.node (.node (.single ⟨27392,27520,16128,16256⟩) (.single ⟨27392,27520,16256,16384⟩)) (.node (.single ⟨27520,27648,16128,16256⟩) (.single ⟨27520,27648,16256,16384⟩)))))
def output37 : Fin 16 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData37 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover37 (i : Fin 16) : Fin 16 := ⟨coverData37.get i % 16, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 16) : Fin 16 := ⟨sourceData37.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 (.cutY 16896 (.cutX 5376 (.cutY 16640 (.cutX 5248 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 .empty (.cutY 27136 .empty (.cutX 16128 .empty (.cutY 27392 .empty (.cutX 16256 (.cutY 27520 .full .full) (.cutY 27520 .full .full)))))) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 (.cutY 5632 (.cutX 16640 (.cutY 5376 (.cutX 16512 (.cutY 5248 .full .full) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 .empty (.cutY 15872 .empty (.cutX 27392 .empty (.cutY 16128 .empty (.cutX 27520 (.cutY 16256 .full .full) (.cutY 16256 .full .full))))))) .empty)))) .empty))) .empty))

theorem metadata37 : 0<191564598 ∧ 20<128 ∧ 64<128 ∧ 0<4 ∧
    2224/4160=0 ∧ 2224%4160=2224 ∧ ∀ i, (leaves37 i).Valid 8 := by
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 4570, atom 5607, type 1, source (12,55).
def leavesData38 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves38 : Fin 16 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 12 55 leaves38 i
def outputData38 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨3072,3136,14080,14144⟩) (.single ⟨3072,3136,14144,14208⟩)) (.node (.single ⟨3136,3200,14080,14144⟩) (.single ⟨3136,3200,14144,14208⟩))) (.node (.node (.single ⟨3072,3200,14208,14336⟩) (.single ⟨3200,3264,14080,14144⟩)) (.node (.single ⟨3200,3264,14144,14208⟩) (.single ⟨3264,3296,14080,14112⟩)))) (.node (.node (.node (.single ⟨3264,3296,14112,14144⟩) (.single ⟨3296,3312,14080,14096⟩)) (.node (.single ⟨3296,3312,14096,14112⟩) (.single ⟨3312,3328,14080,14096⟩))) (.node (.node (.single ⟨3312,3328,14096,14112⟩) (.single ⟨3296,3328,14112,14144⟩)) (.node (.single ⟨3264,3328,14144,14208⟩) (.single ⟨3200,3328,14208,14336⟩))))) (.node (.node (.node (.node (.single ⟨14080,14144,3072,3136⟩) (.single ⟨14080,14144,3136,3200⟩)) (.node (.single ⟨14144,14208,3072,3136⟩) (.single ⟨14144,14208,3136,3200⟩))) (.node (.node (.single ⟨14080,14144,3200,3264⟩) (.single ⟨14080,14112,3264,3296⟩)) (.node (.single ⟨14080,14096,3296,3312⟩) (.single ⟨14080,14096,3312,3328⟩)))) (.node (.node (.node (.single ⟨14096,14112,3296,3312⟩) (.single ⟨14096,14112,3312,3328⟩)) (.node (.single ⟨14112,14144,3264,3296⟩) (.single ⟨14112,14144,3296,3328⟩))) (.node (.node (.single ⟨14144,14208,3200,3264⟩) (.single ⟨14144,14208,3264,3328⟩)) (.node (.single ⟨14208,14336,3072,3200⟩) (.single ⟨14208,14336,3200,3328⟩)))))) (.node (.node (.node (.node (.node (.single ⟨18432,18560,29440,29568⟩) (.single ⟨18432,18560,29568,29696⟩)) (.node (.single ⟨18560,18624,29440,29504⟩) (.single ⟨18560,18624,29504,29568⟩))) (.node (.node (.single ⟨18624,18656,29440,29472⟩) (.single ⟨18624,18656,29472,29504⟩)) (.node (.single ⟨18656,18672,29440,29456⟩) (.single ⟨18656,18672,29456,29472⟩)))) (.node (.node (.node (.single ⟨18672,18688,29440,29456⟩) (.single ⟨18672,18688,29456,29472⟩)) (.node (.single ⟨18656,18688,29472,29504⟩) (.single ⟨18624,18688,29504,29568⟩))) (.node (.node (.single ⟨18560,18624,29568,29632⟩) (.single ⟨18560,18624,29632,29696⟩)) (.node (.single ⟨18624,18688,29568,29632⟩) (.single ⟨18624,18688,29632,29696⟩))))) (.node (.node (.node (.node (.single ⟨29440,29568,18432,18560⟩) (.single ⟨29440,29504,18560,18624⟩)) (.node (.single ⟨29440,29472,18624,18656⟩) (.single ⟨29440,29456,18656,18672⟩))) (.node (.node (.single ⟨29440,29456,18672,18688⟩) (.single ⟨29456,29472,18656,18672⟩)) (.node (.single ⟨29456,29472,18672,18688⟩) (.single ⟨29472,29504,18624,18656⟩)))) (.node (.node (.node (.single ⟨29472,29504,18656,18688⟩) (.single ⟨29504,29568,18560,18624⟩)) (.node (.single ⟨29504,29568,18624,18688⟩) (.single ⟨29568,29696,18432,18560⟩))) (.node (.node (.single ⟨29568,29632,18560,18624⟩) (.single ⟨29568,29632,18624,18688⟩)) (.node (.single ⟨29632,29696,18560,18624⟩) (.single ⟨29632,29696,18624,18688⟩)))))))
def output38 : Fin 64 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 28)) (.node (.single 57) (.single 35)))))) (.node (.node (.node (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34))) (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42)))) (.node (.node (.node (.single 8) (.single 26)) (.node (.single 55) (.single 37))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36))))) (.node (.node (.node (.node (.single 9) (.single 22)) (.node (.single 54) (.single 41))) (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39)))) (.node (.node (.node (.single 11) (.single 23)) (.node (.single 52) (.single 40))) (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38)))))))
def sourceData38 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 24)) (.node (.single 28) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 25) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 35) (.single 31))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 34)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 30)) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover38 (i : Fin 64) : Fin 64 := ⟨coverData38.get i % 64, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 64) : Fin 64 := ⟨sourceData38.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 .empty (.cutY 13312 .empty (.cutX 3584 (.cutY 13824 .empty (.cutX 3328 (.cutY 14080 .empty (.cutX 3200 (.cutY 14208 (.cutX 3136 (.cutY 14144 .full .full) (.cutY 14144 .full .full)) .full) (.cutY 14208 (.cutX 3264 (.cutY 14144 .full .full) (.cutY 14144 (.cutX 3296 (.cutY 14112 .full .full) (.cutY 14112 (.cutX 3312 (.cutY 14096 .full .full) (.cutY 14096 .full .full)) .full)) .full)) .full))) .empty)) .empty))) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 .empty (.cutX 13824 .empty (.cutY 3584 (.cutX 14080 .empty (.cutY 3328 (.cutX 14208 (.cutY 3200 (.cutX 14144 (.cutY 3136 .full .full) (.cutY 3136 .full .full)) (.cutX 14144 (.cutY 3264 .full (.cutX 14112 (.cutY 3296 .full (.cutX 14096 (.cutY 3312 .full .full) (.cutY 3312 .full .full))) (.cutY 3296 .full .full))) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty))))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 (.cutX 18944 (.cutY 29184 .empty (.cutX 18688 (.cutY 29440 .empty (.cutX 18560 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 18624 (.cutY 29504 .full .full) (.cutY 29504 (.cutX 18656 (.cutY 29472 .full .full) (.cutY 29472 (.cutX 18672 (.cutY 29456 .full .full) (.cutY 29456 .full .full)) .full)) .full)) (.cutX 18624 (.cutY 29632 .full .full) (.cutY 29632 .full .full))))) .empty)) .empty) .empty) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 (.cutY 19456 (.cutX 29184 .empty (.cutY 18944 (.cutX 29440 .empty (.cutY 18688 (.cutX 29568 (.cutY 18560 .full (.cutX 29504 (.cutY 18624 .full (.cutX 29472 (.cutY 18656 .full (.cutX 29456 (.cutY 18672 .full .full) (.cutY 18672 .full .full))) (.cutY 18656 .full .full))) (.cutY 18624 .full .full))) (.cutY 18560 .full (.cutX 29632 (.cutY 18624 .full .full) (.cutY 18624 .full .full)))) .empty)) .empty)) .empty) .empty)) .empty) .empty)) .empty))))

theorem metadata38 : 0<144841863 ∧ 12<128 ∧ 55<128 ∧ 1<4 ∧
    5607/4160=1 ∧ 5607%4160=1447 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 64,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 64, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 64,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 64, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 4571, atom 6380, type 1, source (20,60).
def leavesData39 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves39 : Fin 13 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 60 leaves39 i
def outputData39 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,15360,15424⟩) (.node (.single ⟨5120,5184,15424,15488⟩) (.single ⟨5184,5248,15360,15424⟩))) (.node (.single ⟨5184,5248,15424,15488⟩) (.node (.single ⟨5120,5248,15488,15616⟩) (.single ⟨5248,5312,15360,15424⟩)))) (.node (.node (.single ⟨5248,5312,15424,15488⟩) (.node (.single ⟨5312,5344,15360,15392⟩) (.single ⟨5312,5344,15392,15424⟩))) (.node (.node (.single ⟨5344,5376,15360,15392⟩) (.single ⟨5344,5376,15392,15424⟩)) (.node (.single ⟨5312,5376,15424,15488⟩) (.single ⟨5248,5376,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,5120,5184⟩) (.node (.single ⟨15360,15424,5184,5248⟩) (.single ⟨15424,15488,5120,5184⟩))) (.node (.single ⟨15424,15488,5184,5248⟩) (.node (.single ⟨15360,15424,5248,5312⟩) (.single ⟨15360,15392,5312,5344⟩)))) (.node (.node (.single ⟨15360,15392,5344,5376⟩) (.node (.single ⟨15392,15424,5312,5344⟩) (.single ⟨15392,15424,5344,5376⟩))) (.node (.node (.single ⟨15424,15488,5248,5312⟩) (.single ⟨15424,15488,5312,5376⟩)) (.node (.single ⟨15488,15616,5120,5248⟩) (.single ⟨15488,15616,5248,5376⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,27392,27520⟩) (.node (.single ⟨17152,17280,27520,27648⟩) (.single ⟨17280,17344,27392,27456⟩))) (.node (.single ⟨17280,17344,27456,27520⟩) (.node (.single ⟨17344,17376,27392,27424⟩) (.single ⟨17344,17376,27424,27456⟩)))) (.node (.node (.single ⟨17376,17408,27392,27424⟩) (.node (.single ⟨17376,17408,27424,27456⟩) (.single ⟨17344,17408,27456,27520⟩))) (.node (.node (.single ⟨17280,17344,27520,27584⟩) (.single ⟨17280,17344,27584,27648⟩)) (.node (.single ⟨17344,17408,27520,27584⟩) (.single ⟨17344,17408,27584,27648⟩))))) (.node (.node (.node (.single ⟨27392,27520,17152,17280⟩) (.node (.single ⟨27392,27456,17280,17344⟩) (.single ⟨27392,27424,17344,17376⟩))) (.node (.single ⟨27392,27424,17376,17408⟩) (.node (.single ⟨27424,27456,17344,17376⟩) (.single ⟨27424,27456,17376,17408⟩)))) (.node (.node (.single ⟨27456,27520,17280,17344⟩) (.node (.single ⟨27456,27520,17344,17408⟩) (.single ⟨27520,27648,17152,17280⟩))) (.node (.node (.single ⟨27520,27584,17280,17344⟩) (.single ⟨27520,27584,17344,17408⟩)) (.node (.single ⟨27584,27648,17280,17344⟩) (.single ⟨27584,27648,17344,17408⟩)))))))
def output39 : Fin 52 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData39 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover39 (i : Fin 52) : Fin 52 := ⟨coverData39.get i % 52, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 52) : Fin 52 := ⟨sourceData39.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 (.cutY 15872 (.cutX 5376 (.cutY 15616 (.cutX 5248 (.cutY 15488 (.cutX 5184 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 5312 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 5344 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 (.cutY 5632 (.cutX 15616 (.cutY 5376 (.cutX 15488 (.cutY 5248 (.cutX 15424 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 15424 (.cutY 5312 .full (.cutX 15392 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 .empty (.cutY 27136 .empty (.cutX 17152 .empty (.cutY 27392 .empty (.cutX 17280 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 17344 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 17376 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 17344 (.cutY 27584 .full .full) (.cutY 27584 .full .full)))))))) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 .empty (.cutY 16896 .empty (.cutX 27392 .empty (.cutY 17152 .empty (.cutX 27520 (.cutY 17280 .full (.cutX 27456 (.cutY 17344 .full (.cutX 27424 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 27584 (.cutY 17344 .full .full) (.cutY 17344 .full .full)))))))) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata39 : 0<166308920 ∧ 20<128 ∧ 60<128 ∧ 1<4 ∧
    6380/4160=1 ∧ 6380%4160=2220 ∧ ∀ i, (leaves39 i).Valid 8 := by
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 4572, atom 4945, type 1, source (6,53).
def leavesData40 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves40 : Fin 19 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 6 53 leaves40 i
def outputData40 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨1536,1600,13568,13632⟩) (.single ⟨1536,1600,13632,13696⟩)) (.node (.single ⟨1600,1664,13568,13632⟩) (.single ⟨1600,1664,13632,13696⟩))) (.node (.node (.single ⟨1536,1664,13696,13824⟩) (.single ⟨1664,1696,13568,13600⟩)) (.node (.single ⟨1664,1696,13600,13632⟩) (.node (.single ⟨1696,1728,13568,13600⟩) (.single ⟨1696,1728,13600,13632⟩))))) (.node (.node (.node (.single ⟨1664,1728,13632,13696⟩) (.single ⟨1728,1760,13568,13600⟩)) (.node (.single ⟨1728,1760,13600,13632⟩) (.node (.single ⟨1760,1776,13568,13584⟩) (.single ⟨1760,1776,13584,13600⟩)))) (.node (.node (.single ⟨1776,1792,13568,13584⟩) (.single ⟨1776,1792,13584,13600⟩)) (.node (.single ⟨1760,1792,13600,13632⟩) (.node (.single ⟨1728,1792,13632,13696⟩) (.single ⟨1664,1792,13696,13824⟩)))))) (.node (.node (.node (.node (.single ⟨13568,13632,1536,1600⟩) (.single ⟨13568,13632,1600,1664⟩)) (.node (.single ⟨13632,13696,1536,1600⟩) (.single ⟨13632,13696,1600,1664⟩))) (.node (.node (.single ⟨13568,13600,1664,1696⟩) (.single ⟨13568,13600,1696,1728⟩)) (.node (.single ⟨13600,13632,1664,1696⟩) (.node (.single ⟨13600,13632,1696,1728⟩) (.single ⟨13568,13600,1728,1760⟩))))) (.node (.node (.node (.single ⟨13568,13584,1760,1776⟩) (.single ⟨13568,13584,1776,1792⟩)) (.node (.single ⟨13584,13600,1760,1776⟩) (.node (.single ⟨13584,13600,1776,1792⟩) (.single ⟨13600,13632,1728,1760⟩)))) (.node (.node (.single ⟨13600,13632,1760,1792⟩) (.single ⟨13632,13696,1664,1728⟩)) (.node (.single ⟨13632,13696,1728,1792⟩) (.node (.single ⟨13696,13824,1536,1664⟩) (.single ⟨13696,13824,1664,1792⟩))))))) (.node (.node (.node (.node (.node (.single ⟨18944,19072,30976,31104⟩) (.single ⟨18944,19072,31104,31232⟩)) (.node (.single ⟨19072,19136,30976,31040⟩) (.single ⟨19072,19136,31040,31104⟩))) (.node (.node (.single ⟨19136,19168,30976,31008⟩) (.single ⟨19136,19168,31008,31040⟩)) (.node (.single ⟨19168,19184,30976,30992⟩) (.node (.single ⟨19168,19184,30992,31008⟩) (.single ⟨19184,19200,30976,30992⟩))))) (.node (.node (.node (.single ⟨19184,19200,30992,31008⟩) (.single ⟨19168,19200,31008,31040⟩)) (.node (.single ⟨19136,19168,31040,31072⟩) (.node (.single ⟨19136,19168,31072,31104⟩) (.single ⟨19168,19200,31040,31072⟩)))) (.node (.node (.single ⟨19168,19200,31072,31104⟩) (.single ⟨19072,19136,31104,31168⟩)) (.node (.single ⟨19072,19136,31168,31232⟩) (.node (.single ⟨19136,19200,31104,31168⟩) (.single ⟨19136,19200,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨30976,31104,18944,19072⟩) (.single ⟨30976,31040,19072,19136⟩)) (.node (.single ⟨30976,31008,19136,19168⟩) (.single ⟨30976,30992,19168,19184⟩))) (.node (.node (.single ⟨30976,30992,19184,19200⟩) (.single ⟨30992,31008,19168,19184⟩)) (.node (.single ⟨30992,31008,19184,19200⟩) (.node (.single ⟨31008,31040,19136,19168⟩) (.single ⟨31008,31040,19168,19200⟩))))) (.node (.node (.node (.single ⟨31040,31104,19072,19136⟩) (.single ⟨31040,31072,19136,19168⟩)) (.node (.single ⟨31040,31072,19168,19200⟩) (.node (.single ⟨31072,31104,19136,19168⟩) (.single ⟨31072,31104,19168,19200⟩)))) (.node (.node (.single ⟨31104,31232,18944,19072⟩) (.single ⟨31104,31168,19072,19136⟩)) (.node (.single ⟨31104,31168,19136,19200⟩) (.node (.single ⟨31168,31232,19072,19136⟩) (.single ⟨31168,31232,19136,19200⟩))))))))
def output40 : Fin 76 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 36)) (.node (.single 71) (.single 39))) (.node (.node (.single 18) (.single 37)) (.node (.single 57) (.node (.single 38) (.single 0))))) (.node (.node (.node (.single 19) (.single 75)) (.node (.single 56) (.node (.single 1) (.single 21)))) (.node (.node (.single 74) (.single 54)) (.node (.single 2) (.node (.single 20) (.single 73)))))) (.node (.node (.node (.node (.single 55) (.single 3)) (.node (.single 22) (.single 72))) (.node (.node (.single 53) (.single 9)) (.node (.single 34) (.node (.single 66) (.single 41))))) (.node (.node (.node (.single 17) (.single 35)) (.node (.single 58) (.node (.single 40) (.single 10)))) (.node (.node (.single 27) (.single 65)) (.node (.single 48) (.node (.single 11) (.single 32))))))) (.node (.node (.node (.node (.node (.single 64) (.single 43)) (.node (.single 16) (.single 33))) (.node (.node (.single 59) (.single 42)) (.node (.single 5) (.node (.single 23) (.single 70))))) (.node (.node (.node (.single 52) (.single 6)) (.node (.single 25) (.node (.single 69) (.single 50)))) (.node (.node (.single 7) (.single 24)) (.node (.single 68) (.node (.single 51) (.single 8)))))) (.node (.node (.node (.node (.single 26) (.single 67)) (.node (.single 49) (.single 12))) (.node (.node (.single 28) (.single 63)) (.node (.single 47) (.node (.single 13) (.single 30))))) (.node (.node (.node (.single 62) (.single 45)) (.node (.single 14) (.node (.single 29) (.single 61)))) (.node (.node (.single 46) (.single 15)) (.node (.single 31) (.node (.single 60) (.single 44))))))))
def sourceData40 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 24) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 28) (.single 4)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 25)) (.node (.single 29) (.node (.single 1) (.single 5))))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 26) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10))))))))
def cover40 (i : Fin 76) : Fin 76 := ⟨coverData40.get i % 76, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 76) : Fin 76 := ⟨sourceData40.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 .empty (.cutX 1536 .empty (.cutY 13824 (.cutX 1792 (.cutY 13568 .empty (.cutX 1664 (.cutY 13696 (.cutX 1600 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full) (.cutY 13696 (.cutX 1728 (.cutY 13632 (.cutX 1696 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full) (.cutY 13632 (.cutX 1760 (.cutY 13600 .full .full) (.cutY 13600 (.cutX 1776 (.cutY 13584 .full .full) (.cutY 13584 .full .full)) .full)) .full)) .full))) .empty) .empty)))) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 .empty (.cutX 13824 (.cutY 1536 .empty (.cutX 13568 .empty (.cutY 1792 (.cutX 13696 (.cutY 1664 (.cutX 13632 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 13632 (.cutY 1728 (.cutX 13600 (.cutY 1696 .full .full) (.cutY 1696 .full .full)) (.cutX 13600 (.cutY 1760 .full (.cutX 13584 (.cutY 1776 .full .full) (.cutY 1776 .full .full))) (.cutY 1760 .full .full))) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty))) .empty))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 (.cutX 18944 .empty (.cutY 31232 (.cutX 19200 (.cutY 30976 .empty (.cutX 19072 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 19136 (.cutY 31040 .full .full) (.cutY 31040 (.cutX 19168 (.cutY 31008 .full .full) (.cutY 31008 (.cutX 19184 (.cutY 30992 .full .full) (.cutY 30992 .full .full)) .full)) (.cutX 19168 (.cutY 31072 .full .full) (.cutY 31072 .full .full)))) (.cutX 19136 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty)) .empty) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 (.cutX 31232 (.cutY 18944 .empty (.cutX 30976 .empty (.cutY 19200 (.cutX 31104 (.cutY 19072 .full (.cutX 31040 (.cutY 19136 .full (.cutX 31008 (.cutY 19168 .full (.cutX 30992 (.cutY 19184 .full .full) (.cutY 19184 .full .full))) (.cutY 19168 .full .full))) (.cutY 19136 .full (.cutX 31072 (.cutY 19168 .full .full) (.cutY 19168 .full .full))))) (.cutY 19072 .full (.cutX 31168 (.cutY 19136 .full .full) (.cutY 19136 .full .full)))) .empty))) .empty) .empty) .empty))) .empty)) .empty))))

theorem metadata40 : 0<234882010 ∧ 6<128 ∧ 53<128 ∧ 1<4 ∧
    4945/4160=1 ∧ 4945%4160=785 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 64,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked40_64 : ∀ i : Fin 12,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 76, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) (forallFinOffset_add (fun i => output40 i = raw40 (source40 i)) 0 64 12 (by decide) sourceChecked40_0
    sourceChecked40_64)

theorem coverChecked40_0 : ∀ i : Fin 64,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked40_64 : ∀ i : Fin 12,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 76, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
  forallFin_of_zero_offset (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (forallFinOffset_add (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) 0 64 12 (by decide) coverChecked40_0
    coverChecked40_64)

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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 4573, atom 1017, type 0, source (8,57).
def leavesData41 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves41 : Fin 4 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 8 57 leaves41 i
def outputData41 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2048,2176,14592,14720⟩) (.single ⟨2048,2176,14720,14848⟩)) (.node (.single ⟨2176,2304,14592,14720⟩) (.single ⟨2176,2304,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,2048,2176⟩) (.single ⟨14592,14720,2176,2304⟩)) (.node (.single ⟨14720,14848,2048,2176⟩) (.single ⟨14720,14848,2176,2304⟩)))) (.node (.node (.node (.single ⟨17920,18048,30464,30592⟩) (.single ⟨17920,18048,30592,30720⟩)) (.node (.single ⟨18048,18176,30464,30592⟩) (.single ⟨18048,18176,30592,30720⟩))) (.node (.node (.single ⟨30464,30592,17920,18048⟩) (.single ⟨30464,30592,18048,18176⟩)) (.node (.single ⟨30592,30720,17920,18048⟩) (.single ⟨30592,30720,18048,18176⟩)))))
def output41 : Fin 16 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData41 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover41 (i : Fin 16) : Fin 16 := ⟨coverData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 16) : Fin 16 := ⟨sourceData41.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 (.cutY 14848 (.cutX 2304 (.cutY 14592 .empty (.cutX 2176 (.cutY 14720 .full .full) (.cutY 14720 .full .full))) .empty) .empty) .empty) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 (.cutY 2560 (.cutX 14592 .empty (.cutY 2304 (.cutX 14720 (.cutY 2176 .full .full) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 .empty (.cutY 30208 .empty (.cutX 18176 (.cutY 30464 .empty (.cutX 18048 (.cutY 30592 .full .full) (.cutY 30592 .full .full))) .empty))))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 .empty (.cutY 17920 .empty (.cutX 30464 .empty (.cutY 18176 (.cutX 30592 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty)))))) .empty) .empty) .empty)) .empty))))

theorem metadata41 : 0<116912559 ∧ 8<128 ∧ 57<128 ∧ 0<4 ∧
    1017/4160=0 ∧ 1017%4160=1017 ∧ ∀ i, (leaves41 i).Valid 8 := by
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 4574, atom 4464, type 1, source (2,52).
def leavesData42 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves42 : Fin 13 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 52 leaves42 i
def outputData42 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,13312,13376⟩) (.node (.single ⟨512,576,13376,13440⟩) (.single ⟨576,640,13312,13376⟩))) (.node (.single ⟨576,640,13376,13440⟩) (.node (.single ⟨512,640,13440,13568⟩) (.single ⟨640,704,13312,13376⟩)))) (.node (.node (.single ⟨640,704,13376,13440⟩) (.node (.single ⟨704,736,13312,13344⟩) (.single ⟨704,736,13344,13376⟩))) (.node (.node (.single ⟨736,768,13312,13344⟩) (.single ⟨736,768,13344,13376⟩)) (.node (.single ⟨704,768,13376,13440⟩) (.single ⟨640,768,13440,13568⟩))))) (.node (.node (.node (.single ⟨13312,13376,512,576⟩) (.node (.single ⟨13312,13376,576,640⟩) (.single ⟨13376,13440,512,576⟩))) (.node (.single ⟨13376,13440,576,640⟩) (.node (.single ⟨13312,13376,640,704⟩) (.single ⟨13312,13344,704,736⟩)))) (.node (.node (.single ⟨13312,13344,736,768⟩) (.node (.single ⟨13344,13376,704,736⟩) (.single ⟨13344,13376,736,768⟩))) (.node (.node (.single ⟨13376,13440,640,704⟩) (.single ⟨13376,13440,704,768⟩)) (.node (.single ⟨13440,13568,512,640⟩) (.single ⟨13440,13568,640,768⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,32000,32128⟩) (.node (.single ⟨19200,19328,32128,32256⟩) (.single ⟨19328,19392,32000,32064⟩))) (.node (.single ⟨19328,19392,32064,32128⟩) (.node (.single ⟨19392,19424,32000,32032⟩) (.single ⟨19392,19424,32032,32064⟩)))) (.node (.node (.single ⟨19424,19456,32000,32032⟩) (.node (.single ⟨19424,19456,32032,32064⟩) (.single ⟨19392,19456,32064,32128⟩))) (.node (.node (.single ⟨19328,19392,32128,32192⟩) (.single ⟨19328,19392,32192,32256⟩)) (.node (.single ⟨19392,19456,32128,32192⟩) (.single ⟨19392,19456,32192,32256⟩))))) (.node (.node (.node (.single ⟨32000,32128,19200,19328⟩) (.node (.single ⟨32000,32064,19328,19392⟩) (.single ⟨32000,32032,19392,19424⟩))) (.node (.single ⟨32000,32032,19424,19456⟩) (.node (.single ⟨32032,32064,19392,19424⟩) (.single ⟨32032,32064,19424,19456⟩)))) (.node (.node (.single ⟨32064,32128,19328,19392⟩) (.node (.single ⟨32064,32128,19392,19456⟩) (.single ⟨32128,32256,19200,19328⟩))) (.node (.node (.single ⟨32128,32192,19328,19392⟩) (.single ⟨32128,32192,19392,19456⟩)) (.node (.single ⟨32192,32256,19328,19392⟩) (.single ⟨32192,32256,19392,19456⟩)))))))
def output42 : Fin 52 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData42 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover42 (i : Fin 52) : Fin 52 := ⟨coverData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 52) : Fin 52 := ⟨sourceData42.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 .empty (.cutX 512 .empty (.cutY 13824 (.cutX 768 (.cutY 13568 (.cutX 640 (.cutY 13440 (.cutX 576 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full) (.cutY 13440 (.cutX 704 (.cutY 13376 .full .full) (.cutY 13376 (.cutX 736 (.cutY 13344 .full .full) (.cutY 13344 .full .full)) .full)) .full)) .empty) .empty) .empty))) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 (.cutX 13824 (.cutY 512 .empty (.cutX 13568 (.cutY 768 (.cutX 13440 (.cutY 640 (.cutX 13376 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 13376 (.cutY 704 .full (.cutX 13344 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 .empty (.cutX 18944 .empty (.cutY 32256 (.cutX 19200 .empty (.cutY 32000 .empty (.cutX 19328 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 19392 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 19424 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 19392 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty))) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 (.cutX 32256 (.cutY 18944 .empty (.cutX 32000 .empty (.cutY 19200 .empty (.cutX 32128 (.cutY 19328 .full (.cutX 32064 (.cutY 19392 .full (.cutX 32032 (.cutY 19424 .full .full) (.cutY 19424 .full .full))) (.cutY 19392 .full .full))) (.cutY 19328 .full (.cutX 32192 (.cutY 19392 .full .full) (.cutY 19392 .full .full))))))) .empty) .empty)))) .empty)) .empty))))

theorem metadata42 : 0<234882010 ∧ 2<128 ∧ 52<128 ∧ 1<4 ∧
    4464/4160=1 ∧ 4464%4160=304 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 4575, atom 2720, type 0, source (26,68).
def leavesData43 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves43 : Fin 7 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 26 68 leaves43 i
def outputData43 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6656,6784,17408,17536⟩) (.node (.single ⟨6656,6784,17536,17664⟩) (.single ⟨6784,6848,17408,17472⟩))) (.node (.node (.single ⟨6784,6848,17472,17536⟩) (.single ⟨6848,6912,17408,17472⟩)) (.node (.single ⟨6848,6912,17472,17536⟩) (.single ⟨6784,6912,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,25856,25984⟩) (.node (.single ⟨15104,15232,25984,26112⟩) (.single ⟨15232,15296,25856,25920⟩))) (.node (.node (.single ⟨15232,15296,25920,25984⟩) (.single ⟨15296,15360,25856,25920⟩)) (.node (.single ⟨15296,15360,25920,25984⟩) (.single ⟨15232,15360,25984,26112⟩))))) (.node (.node (.node (.single ⟨17408,17536,6656,6784⟩) (.node (.single ⟨17408,17472,6784,6848⟩) (.single ⟨17408,17472,6848,6912⟩))) (.node (.node (.single ⟨17472,17536,6784,6848⟩) (.single ⟨17472,17536,6848,6912⟩)) (.node (.single ⟨17536,17664,6656,6784⟩) (.single ⟨17536,17664,6784,6912⟩)))) (.node (.node (.single ⟨25856,25984,15104,15232⟩) (.node (.single ⟨25856,25920,15232,15296⟩) (.single ⟨25856,25920,15296,15360⟩))) (.node (.node (.single ⟨25920,25984,15232,15296⟩) (.single ⟨25920,25984,15296,15360⟩)) (.node (.single ⟨25984,26112,15104,15232⟩) (.single ⟨25984,26112,15232,15360⟩))))))
def output43 : Fin 28 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData43 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover43 (i : Fin 28) : Fin 28 := ⟨coverData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 28) : Fin 28 := ⟨sourceData43.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 .empty (.cutY 17920 (.cutX 6912 (.cutY 17664 (.cutX 6784 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 6848 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 .empty (.cutY 26112 (.cutX 15104 .empty (.cutY 25856 .empty (.cutX 15232 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 15296 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full)))) .empty))) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 (.cutY 6656 .empty (.cutX 17664 (.cutY 6912 (.cutX 17536 (.cutY 6784 .full (.cutX 17472 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty)) .empty) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 (.cutY 14848 .empty (.cutX 25856 .empty (.cutY 15104 .empty (.cutX 25984 (.cutY 15232 .full (.cutX 25920 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))))) .empty) .empty))) .empty)) .empty))) .empty))

theorem metadata43 : 0<170092456 ∧ 26<128 ∧ 68<128 ∧ 0<4 ∧
    2720/4160=0 ∧ 2720%4160=2720 ∧ ∀ i, (leaves43 i).Valid 8 := by
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 4576, atom 55, type 0, source (0,55).
def leavesData44 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves44 : Fin 4 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 55 leaves44 i
def outputData44 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,14080,14208⟩) (.single ⟨0,128,14208,14336⟩)) (.node (.single ⟨128,256,14080,14208⟩) (.single ⟨128,256,14208,14336⟩))) (.node (.node (.single ⟨14080,14208,0,128⟩) (.single ⟨14080,14208,128,256⟩)) (.node (.single ⟨14208,14336,0,128⟩) (.single ⟨14208,14336,128,256⟩)))) (.node (.node (.node (.single ⟨18432,18560,32512,32640⟩) (.single ⟨18432,18560,32640,32768⟩)) (.node (.single ⟨18560,18688,32512,32640⟩) (.single ⟨18560,18688,32640,32768⟩))) (.node (.node (.single ⟨32512,32640,18432,18560⟩) (.single ⟨32512,32640,18560,18688⟩)) (.node (.single ⟨32640,32768,18432,18560⟩) (.single ⟨32640,32768,18560,18688⟩)))))
def output44 : Fin 16 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData44 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover44 (i : Fin 16) : Fin 16 := ⟨coverData44.get i % 16, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 16) : Fin 16 := ⟨sourceData44.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 .empty (.cutX 512 (.cutY 13824 .empty (.cutX 256 (.cutY 14080 .empty (.cutX 128 (.cutY 14208 .full .full) (.cutY 14208 .full .full))) .empty)) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 (.cutX 13824 .empty (.cutY 512 (.cutX 14080 .empty (.cutY 256 (.cutX 14208 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 .empty (.cutX 18944 (.cutY 32256 .empty (.cutX 18688 (.cutY 32512 .empty (.cutX 18560 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 (.cutX 32256 .empty (.cutY 18944 (.cutX 32512 .empty (.cutY 18688 (.cutX 32640 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty)) .empty)) .empty)))) .empty)) .empty))))

theorem metadata44 : 0<214747992 ∧ 0<128 ∧ 55<128 ∧ 0<4 ∧
    55/4160=0 ∧ 55%4160=55 ∧ ∀ i, (leaves44 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData44).mp
    (by decide +kernel)

theorem sourceChecked44_0 : ∀ i : Fin 16,
    (fun i => output44 i = raw44 (source44 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked44 : ∀ i : Fin 16, (fun i => output44 i = raw44 (source44 i)) i :=
  forallFin_of_zero_offset (fun i => output44 i = raw44 (source44 i)) sourceChecked44_0

theorem coverChecked44_0 : ∀ i : Fin 16,
    (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked44 : ∀ i : Fin 16, (fun i => (output44 (cover44 i)).ContainsBox (raw44 i)) i :=
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

noncomputable def phaseMass44 : ℝ := singlePhaseMass (214747992/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw44 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass44_eq : phaseMass44 = (26843499/204800000000 : ℝ) := by
  unfold phaseMass44
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw44 output44 cover44 source44
    (gridTreeUnionCheck_sound 32768 raw44 output44 cover44 source44 tree44 checked44)
    _ (by norm_num) _, areaUnits44]
  norm_num

-- Frozen phase 4577, atom 7601, type 1, source (37,74).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 37 74 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨9472,9600,18944,19072⟩) (.node (.single ⟨9472,9600,19072,19200⟩) (.single ⟨9600,9664,18944,19008⟩))) (.node (.node (.single ⟨9600,9664,19008,19072⟩) (.single ⟨9664,9728,18944,19008⟩)) (.node (.single ⟨9664,9728,19008,19072⟩) (.single ⟨9600,9728,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,23040,23168⟩) (.node (.single ⟨13568,13696,23168,23296⟩) (.single ⟨13696,13760,23040,23104⟩))) (.node (.node (.single ⟨13696,13760,23104,23168⟩) (.single ⟨13760,13824,23040,23104⟩)) (.node (.single ⟨13760,13824,23104,23168⟩) (.single ⟨13696,13824,23168,23296⟩))))) (.node (.node (.node (.single ⟨18944,19072,9472,9600⟩) (.node (.single ⟨18944,19008,9600,9664⟩) (.single ⟨18944,19008,9664,9728⟩))) (.node (.node (.single ⟨19008,19072,9600,9664⟩) (.single ⟨19008,19072,9664,9728⟩)) (.node (.single ⟨19072,19200,9472,9600⟩) (.single ⟨19072,19200,9600,9728⟩)))) (.node (.node (.single ⟨23040,23168,13568,13696⟩) (.node (.single ⟨23040,23104,13696,13760⟩) (.single ⟨23040,23104,13760,13824⟩))) (.node (.node (.single ⟨23104,23168,13696,13760⟩) (.single ⟨23104,23168,13760,13824⟩)) (.node (.single ⟨23168,23296,13568,13696⟩) (.single ⟨23168,23296,13696,13824⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 (.cutX 9728 (.cutY 18944 .empty (.cutX 9472 .empty (.cutY 19200 (.cutX 9600 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 9664 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 (.cutX 13824 (.cutY 23040 .empty (.cutX 13568 .empty (.cutY 23296 (.cutX 13696 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 13760 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty))) .empty) .empty))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 .empty (.cutX 18944 .empty (.cutY 9728 (.cutX 19200 (.cutY 9472 .empty (.cutX 19072 (.cutY 9600 .full (.cutX 19008 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full))) .empty) .empty))) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 .empty (.cutX 23040 .empty (.cutY 13824 (.cutX 23296 (.cutY 13568 .empty (.cutX 23168 (.cutY 13696 .full (.cutX 23104 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty))) .empty) .empty))))) .empty) .empty))

theorem metadata45 : 0<167101800 ∧ 37<128 ∧ 74<128 ∧ 1<4 ∧
    7601/4160=1 ∧ 7601%4160=3441 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (835509/8192000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 4578, atom 6952, type 1, source (27,65).
def leavesData46 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves46 : Fin 7 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 65 leaves46 i
def outputData46 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,16640,16768⟩) (.node (.single ⟨6912,7040,16768,16896⟩) (.single ⟨7040,7104,16640,16704⟩))) (.node (.node (.single ⟨7040,7104,16704,16768⟩) (.single ⟨7104,7168,16640,16704⟩)) (.node (.single ⟨7104,7168,16704,16768⟩) (.single ⟨7040,7168,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,25600,25728⟩) (.node (.single ⟨15872,16000,25728,25856⟩) (.single ⟨16000,16064,25600,25664⟩))) (.node (.node (.single ⟨16000,16064,25664,25728⟩) (.single ⟨16064,16128,25600,25664⟩)) (.node (.single ⟨16064,16128,25664,25728⟩) (.single ⟨16000,16128,25728,25856⟩))))) (.node (.node (.node (.single ⟨16640,16768,6912,7040⟩) (.node (.single ⟨16640,16704,7040,7104⟩) (.single ⟨16640,16704,7104,7168⟩))) (.node (.node (.single ⟨16704,16768,7040,7104⟩) (.single ⟨16704,16768,7104,7168⟩)) (.node (.single ⟨16768,16896,6912,7040⟩) (.single ⟨16768,16896,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,15872,16000⟩) (.node (.single ⟨25600,25664,16000,16064⟩) (.single ⟨25600,25664,16064,16128⟩))) (.node (.node (.single ⟨25664,25728,16000,16064⟩) (.single ⟨25664,25728,16064,16128⟩)) (.node (.single ⟨25728,25856,15872,16000⟩) (.single ⟨25728,25856,16000,16128⟩))))))
def output46 : Fin 28 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData46 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover46 (i : Fin 28) : Fin 28 := ⟨coverData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 28) : Fin 28 := ⟨sourceData46.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 .empty (.cutY 16896 (.cutX 6912 .empty (.cutY 16640 .empty (.cutX 7040 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 7104 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 .empty (.cutY 26112 (.cutX 16128 (.cutY 25856 (.cutX 16000 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 16064 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty)))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 (.cutY 6656 .empty (.cutX 16640 .empty (.cutY 6912 .empty (.cutX 16768 (.cutY 7040 .full (.cutX 16704 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))))) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 (.cutY 15872 .empty (.cutX 25856 (.cutY 16128 (.cutX 25728 (.cutY 16000 .full (.cutX 25664 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty) .empty)) .empty)))) .empty)) .empty))) .empty))

theorem metadata46 : 0<175587969 ∧ 27<128 ∧ 65<128 ∧ 1<4 ∧
    6952/4160=1 ∧ 6952%4160=2792 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 4579, atom 7026, type 1, source (28,66).
def leavesData47 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves47 : Fin 10 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 28 66 leaves47 i
def outputData47 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7168,7296,16896,17024⟩) (.single ⟨7168,7296,17024,17152⟩)) (.node (.single ⟨7296,7360,16896,16960⟩) (.node (.single ⟨7296,7360,16960,17024⟩) (.single ⟨7360,7392,16896,16928⟩)))) (.node (.node (.single ⟨7360,7392,16928,16960⟩) (.single ⟨7392,7424,16896,16928⟩)) (.node (.single ⟨7392,7424,16928,16960⟩) (.node (.single ⟨7360,7424,16960,17024⟩) (.single ⟨7296,7424,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,25344,25472⟩) (.single ⟨15616,15744,25472,25600⟩)) (.node (.single ⟨15744,15808,25344,25408⟩) (.node (.single ⟨15744,15808,25408,25472⟩) (.single ⟨15808,15840,25344,25376⟩)))) (.node (.node (.single ⟨15808,15840,25376,25408⟩) (.single ⟨15840,15872,25344,25376⟩)) (.node (.single ⟨15840,15872,25376,25408⟩) (.node (.single ⟨15808,15872,25408,25472⟩) (.single ⟨15744,15872,25472,25600⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,7168,7296⟩) (.single ⟨16896,16960,7296,7360⟩)) (.node (.single ⟨16896,16928,7360,7392⟩) (.node (.single ⟨16896,16928,7392,7424⟩) (.single ⟨16928,16960,7360,7392⟩)))) (.node (.node (.single ⟨16928,16960,7392,7424⟩) (.single ⟨16960,17024,7296,7360⟩)) (.node (.single ⟨16960,17024,7360,7424⟩) (.node (.single ⟨17024,17152,7168,7296⟩) (.single ⟨17024,17152,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,15616,15744⟩) (.single ⟨25344,25408,15744,15808⟩)) (.node (.single ⟨25344,25376,15808,15840⟩) (.node (.single ⟨25344,25376,15840,15872⟩) (.single ⟨25376,25408,15808,15840⟩)))) (.node (.node (.single ⟨25376,25408,15840,15872⟩) (.single ⟨25408,25472,15744,15808⟩)) (.node (.single ⟨25408,25472,15808,15872⟩) (.node (.single ⟨25472,25600,15616,15744⟩) (.single ⟨25472,25600,15744,15872⟩)))))))
def output47 : Fin 40 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover47 (i : Fin 40) : Fin 40 := ⟨coverData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 40) : Fin 40 := ⟨sourceData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 (.cutY 16896 .empty (.cutX 7424 (.cutY 17152 (.cutX 7296 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 7360 (.cutY 16960 .full .full) (.cutY 16960 (.cutX 7392 (.cutY 16928 .full .full) (.cutY 16928 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 (.cutY 25088 .empty (.cutX 15616 .empty (.cutY 25344 .empty (.cutX 15744 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 15808 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 15840 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) .full))))) .empty) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 .empty (.cutY 7680 (.cutX 17152 (.cutY 7424 (.cutX 17024 (.cutY 7296 .full (.cutX 16960 (.cutY 7360 .full (.cutX 16928 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty))) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 .empty (.cutY 15872 (.cutX 25344 .empty (.cutY 15616 .empty (.cutX 25472 (.cutY 15744 .full (.cutX 25408 (.cutY 15808 .full (.cutX 25376 (.cutY 15840 .full .full) (.cutY 15840 .full .full))) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty))) .empty)) .empty)) .empty))) .empty))

theorem metadata47 : 0<175587969 ∧ 28<128 ∧ 66<128 ∧ 1<4 ∧
    7026/4160=1 ∧ 7026%4160=2866 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 4580, atom 7098, type 1, source (29,67).
def leavesData48 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves48 : Fin 10 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 29 67 leaves48 i
def outputData48 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7424,7552,17152,17280⟩) (.single ⟨7424,7552,17280,17408⟩)) (.node (.single ⟨7552,7616,17152,17216⟩) (.node (.single ⟨7552,7616,17216,17280⟩) (.single ⟨7616,7648,17152,17184⟩)))) (.node (.node (.single ⟨7616,7648,17184,17216⟩) (.single ⟨7648,7680,17152,17184⟩)) (.node (.single ⟨7648,7680,17184,17216⟩) (.node (.single ⟨7616,7680,17216,17280⟩) (.single ⟨7552,7680,17280,17408⟩))))) (.node (.node (.node (.single ⟨15360,15488,25088,25216⟩) (.single ⟨15360,15488,25216,25344⟩)) (.node (.single ⟨15488,15552,25088,25152⟩) (.node (.single ⟨15488,15552,25152,25216⟩) (.single ⟨15552,15584,25088,25120⟩)))) (.node (.node (.single ⟨15552,15584,25120,25152⟩) (.single ⟨15584,15616,25088,25120⟩)) (.node (.single ⟨15584,15616,25120,25152⟩) (.node (.single ⟨15552,15616,25152,25216⟩) (.single ⟨15488,15616,25216,25344⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,7424,7552⟩) (.single ⟨17152,17216,7552,7616⟩)) (.node (.single ⟨17152,17184,7616,7648⟩) (.node (.single ⟨17152,17184,7648,7680⟩) (.single ⟨17184,17216,7616,7648⟩)))) (.node (.node (.single ⟨17184,17216,7648,7680⟩) (.single ⟨17216,17280,7552,7616⟩)) (.node (.single ⟨17216,17280,7616,7680⟩) (.node (.single ⟨17280,17408,7424,7552⟩) (.single ⟨17280,17408,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,15360,15488⟩) (.single ⟨25088,25152,15488,15552⟩)) (.node (.single ⟨25088,25120,15552,15584⟩) (.node (.single ⟨25088,25120,15584,15616⟩) (.single ⟨25120,25152,15552,15584⟩)))) (.node (.node (.single ⟨25120,25152,15584,15616⟩) (.single ⟨25152,25216,15488,15552⟩)) (.node (.single ⟨25152,25216,15552,15616⟩) (.node (.single ⟨25216,25344,15360,15488⟩) (.single ⟨25216,25344,15488,15616⟩)))))))
def output48 : Fin 40 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData48 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover48 (i : Fin 40) : Fin 40 := ⟨coverData48.get i % 40, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 40) : Fin 40 := ⟨sourceData48.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 (.cutY 16896 .empty (.cutX 7424 .empty (.cutY 17152 .empty (.cutX 7552 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 7616 (.cutY 17216 .full .full) (.cutY 17216 (.cutX 7648 (.cutY 17184 .full .full) (.cutY 17184 .full .full)) .full)) .full))))) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 (.cutY 25088 .empty (.cutX 15616 (.cutY 25344 (.cutX 15488 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 15552 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 15584 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 .empty (.cutY 7680 (.cutX 17152 .empty (.cutY 7424 .empty (.cutX 17280 (.cutY 7552 .full (.cutX 17216 (.cutY 7616 .full (.cutX 17184 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 .empty (.cutY 15872 (.cutX 25344 (.cutY 15616 (.cutX 25216 (.cutY 15488 .full (.cutX 25152 (.cutY 15552 .full (.cutX 25120 (.cutY 15584 .full .full) (.cutY 15584 .full .full))) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty) .empty) .empty))) .empty)) .empty)) .empty))) .empty))

theorem metadata48 : 0<175587969 ∧ 29<128 ∧ 67<128 ∧ 1<4 ∧
    7098/4160=1 ∧ 7098%4160=2938 ∧ ∀ i, (leaves48 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData48).mp
    (by decide +kernel)

theorem sourceChecked48_0 : ∀ i : Fin 40,
    (fun i => output48 i = raw48 (source48 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked48 : ∀ i : Fin 40, (fun i => output48 i = raw48 (source48 i)) i :=
  forallFin_of_zero_offset (fun i => output48 i = raw48 (source48 i)) sourceChecked48_0

theorem coverChecked48_0 : ∀ i : Fin 40,
    (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked48 : ∀ i : Fin 40, (fun i => (output48 (cover48 i)).ContainsBox (raw48 i)) i :=
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 4581, atom 7168, type 1, source (30,68).
def leavesData49 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves49 : Fin 7 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 68 leaves49 i
def outputData49 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,17408,17536⟩) (.node (.single ⟨7680,7808,17536,17664⟩) (.single ⟨7808,7872,17408,17472⟩))) (.node (.node (.single ⟨7808,7872,17472,17536⟩) (.single ⟨7872,7936,17408,17472⟩)) (.node (.single ⟨7872,7936,17472,17536⟩) (.single ⟨7808,7936,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,24832,24960⟩) (.node (.single ⟨15104,15232,24960,25088⟩) (.single ⟨15232,15296,24832,24896⟩))) (.node (.node (.single ⟨15232,15296,24896,24960⟩) (.single ⟨15296,15360,24832,24896⟩)) (.node (.single ⟨15296,15360,24896,24960⟩) (.single ⟨15232,15360,24960,25088⟩))))) (.node (.node (.node (.single ⟨17408,17536,7680,7808⟩) (.node (.single ⟨17408,17472,7808,7872⟩) (.single ⟨17408,17472,7872,7936⟩))) (.node (.node (.single ⟨17472,17536,7808,7872⟩) (.single ⟨17472,17536,7872,7936⟩)) (.node (.single ⟨17536,17664,7680,7808⟩) (.single ⟨17536,17664,7808,7936⟩)))) (.node (.node (.single ⟨24832,24960,15104,15232⟩) (.node (.single ⟨24832,24896,15232,15296⟩) (.single ⟨24832,24896,15296,15360⟩))) (.node (.node (.single ⟨24896,24960,15232,15296⟩) (.single ⟨24896,24960,15296,15360⟩)) (.node (.single ⟨24960,25088,15104,15232⟩) (.single ⟨24960,25088,15232,15360⟩))))))
def output49 : Fin 28 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData49 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover49 (i : Fin 28) : Fin 28 := ⟨coverData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 28) : Fin 28 := ⟨sourceData49.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 .empty (.cutY 17920 (.cutX 7936 (.cutY 17664 (.cutX 7808 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 7872 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty)))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 .empty (.cutY 25088 (.cutX 15104 .empty (.cutY 24832 .empty (.cutX 15232 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 15296 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty)) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 (.cutY 7680 .empty (.cutX 17664 (.cutY 7936 (.cutX 17536 (.cutY 7808 .full (.cutX 17472 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)) .empty)))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 (.cutY 14848 .empty (.cutX 24832 .empty (.cutY 15104 .empty (.cutX 24960 (.cutY 15232 .full (.cutX 24896 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full))))) .empty) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata49 : 0<175587969 ∧ 30<128 ∧ 68<128 ∧ 1<4 ∧
    7168/4160=1 ∧ 7168%4160=3008 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 4582, atom 6718, type 1, source (24,62).
def leavesData50 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves50 : Fin 16 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 24 62 leaves50 i
def outputData50 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6144,6208,15872,15936⟩) (.single ⟨6144,6208,15936,16000⟩)) (.node (.single ⟨6208,6272,15872,15936⟩) (.single ⟨6208,6272,15936,16000⟩))) (.node (.node (.single ⟨6144,6272,16000,16128⟩) (.single ⟨6272,6304,15872,15904⟩)) (.node (.single ⟨6272,6304,15904,15936⟩) (.single ⟨6304,6336,15872,15904⟩)))) (.node (.node (.node (.single ⟨6304,6336,15904,15936⟩) (.single ⟨6272,6336,15936,16000⟩)) (.node (.single ⟨6336,6368,15872,15904⟩) (.single ⟨6336,6368,15904,15936⟩))) (.node (.node (.single ⟨6368,6400,15872,15904⟩) (.single ⟨6368,6400,15904,15936⟩)) (.node (.single ⟨6336,6400,15936,16000⟩) (.single ⟨6272,6400,16000,16128⟩))))) (.node (.node (.node (.node (.single ⟨15872,15936,6144,6208⟩) (.single ⟨15872,15936,6208,6272⟩)) (.node (.single ⟨15936,16000,6144,6208⟩) (.single ⟨15936,16000,6208,6272⟩))) (.node (.node (.single ⟨15872,15904,6272,6304⟩) (.single ⟨15872,15904,6304,6336⟩)) (.node (.single ⟨15904,15936,6272,6304⟩) (.single ⟨15904,15936,6304,6336⟩)))) (.node (.node (.node (.single ⟨15872,15904,6336,6368⟩) (.single ⟨15872,15904,6368,6400⟩)) (.node (.single ⟨15904,15936,6336,6368⟩) (.single ⟨15904,15936,6368,6400⟩))) (.node (.node (.single ⟨15936,16000,6272,6336⟩) (.single ⟨15936,16000,6336,6400⟩)) (.node (.single ⟨16000,16128,6144,6272⟩) (.single ⟨16000,16128,6272,6400⟩)))))) (.node (.node (.node (.node (.node (.single ⟨16640,16768,26368,26496⟩) (.single ⟨16640,16768,26496,26624⟩)) (.node (.single ⟨16768,16832,26368,26432⟩) (.single ⟨16768,16832,26432,26496⟩))) (.node (.node (.single ⟨16832,16864,26368,26400⟩) (.single ⟨16832,16864,26400,26432⟩)) (.node (.single ⟨16864,16896,26368,26400⟩) (.single ⟨16864,16896,26400,26432⟩)))) (.node (.node (.node (.single ⟨16832,16864,26432,26464⟩) (.single ⟨16832,16864,26464,26496⟩)) (.node (.single ⟨16864,16896,26432,26464⟩) (.single ⟨16864,16896,26464,26496⟩))) (.node (.node (.single ⟨16768,16832,26496,26560⟩) (.single ⟨16768,16832,26560,26624⟩)) (.node (.single ⟨16832,16896,26496,26560⟩) (.single ⟨16832,16896,26560,26624⟩))))) (.node (.node (.node (.node (.single ⟨26368,26496,16640,16768⟩) (.single ⟨26368,26432,16768,16832⟩)) (.node (.single ⟨26368,26400,16832,16864⟩) (.single ⟨26368,26400,16864,16896⟩))) (.node (.node (.single ⟨26400,26432,16832,16864⟩) (.single ⟨26400,26432,16864,16896⟩)) (.node (.single ⟨26432,26496,16768,16832⟩) (.single ⟨26432,26464,16832,16864⟩)))) (.node (.node (.node (.single ⟨26432,26464,16864,16896⟩) (.single ⟨26464,26496,16832,16864⟩)) (.node (.single ⟨26464,26496,16864,16896⟩) (.single ⟨26496,26624,16640,16768⟩))) (.node (.node (.single ⟨26496,26560,16768,16832⟩) (.single ⟨26496,26560,16832,16896⟩)) (.node (.single ⟨26560,26624,16768,16832⟩) (.single ⟨26560,26624,16832,16896⟩)))))))
def output50 : Fin 64 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData50 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover50 (i : Fin 64) : Fin 64 := ⟨coverData50.get i % 64, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 64) : Fin 64 := ⟨sourceData50.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 (.cutY 15872 .empty (.cutX 6400 (.cutY 16128 (.cutX 6272 (.cutY 16000 (.cutX 6208 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 6336 (.cutY 15936 (.cutX 6304 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full) (.cutY 15936 (.cutX 6368 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 .empty (.cutY 6656 (.cutX 16128 (.cutY 6400 (.cutX 16000 (.cutY 6272 (.cutX 15936 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 15936 (.cutY 6336 (.cutX 15904 (.cutY 6304 .full .full) (.cutY 6304 .full .full)) (.cutX 15904 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 (.cutY 26112 .empty (.cutX 16640 .empty (.cutY 26368 .empty (.cutX 16768 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 16832 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 16864 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) (.cutX 16864 (.cutY 26464 .full .full) (.cutY 26464 .full .full)))) (.cutX 16832 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 .empty (.cutY 16896 (.cutX 26368 .empty (.cutY 16640 .empty (.cutX 26496 (.cutY 16768 .full (.cutX 26432 (.cutY 16832 .full (.cutX 26400 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full (.cutX 26464 (.cutY 16864 .full .full) (.cutY 16864 .full .full))))) (.cutY 16768 .full (.cutX 26560 (.cutY 16832 .full .full) (.cutY 16832 .full .full)))))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata50 : 0<69455300 ∧ 24<128 ∧ 62<128 ∧ 1<4 ∧
    6718/4160=1 ∧ 6718%4160=2558 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (694553/16384000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 4583, atom 4828, type 1, source (5,53).
def leavesData51 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves51 : Fin 13 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 5 53 leaves51 i
def outputData51 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,13568,13632⟩) (.node (.single ⟨1280,1344,13632,13696⟩) (.single ⟨1344,1408,13568,13632⟩))) (.node (.single ⟨1344,1408,13632,13696⟩) (.node (.single ⟨1280,1408,13696,13824⟩) (.single ⟨1408,1472,13568,13632⟩)))) (.node (.node (.single ⟨1408,1472,13632,13696⟩) (.node (.single ⟨1472,1504,13568,13600⟩) (.single ⟨1472,1504,13600,13632⟩))) (.node (.node (.single ⟨1504,1536,13568,13600⟩) (.single ⟨1504,1536,13600,13632⟩)) (.node (.single ⟨1472,1536,13632,13696⟩) (.single ⟨1408,1536,13696,13824⟩))))) (.node (.node (.node (.single ⟨13568,13632,1280,1344⟩) (.node (.single ⟨13568,13632,1344,1408⟩) (.single ⟨13632,13696,1280,1344⟩))) (.node (.single ⟨13632,13696,1344,1408⟩) (.node (.single ⟨13568,13632,1408,1472⟩) (.single ⟨13568,13600,1472,1504⟩)))) (.node (.node (.single ⟨13568,13600,1504,1536⟩) (.node (.single ⟨13600,13632,1472,1504⟩) (.single ⟨13600,13632,1504,1536⟩))) (.node (.node (.single ⟨13632,13696,1408,1472⟩) (.single ⟨13632,13696,1472,1536⟩)) (.node (.single ⟨13696,13824,1280,1408⟩) (.single ⟨13696,13824,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨18944,19072,31232,31360⟩) (.node (.single ⟨18944,19072,31360,31488⟩) (.single ⟨19072,19136,31232,31296⟩))) (.node (.single ⟨19072,19136,31296,31360⟩) (.node (.single ⟨19136,19168,31232,31264⟩) (.single ⟨19136,19168,31264,31296⟩)))) (.node (.node (.single ⟨19168,19200,31232,31264⟩) (.node (.single ⟨19168,19200,31264,31296⟩) (.single ⟨19136,19200,31296,31360⟩))) (.node (.node (.single ⟨19072,19136,31360,31424⟩) (.single ⟨19072,19136,31424,31488⟩)) (.node (.single ⟨19136,19200,31360,31424⟩) (.single ⟨19136,19200,31424,31488⟩))))) (.node (.node (.node (.single ⟨31232,31360,18944,19072⟩) (.node (.single ⟨31232,31296,19072,19136⟩) (.single ⟨31232,31264,19136,19168⟩))) (.node (.single ⟨31232,31264,19168,19200⟩) (.node (.single ⟨31264,31296,19136,19168⟩) (.single ⟨31264,31296,19168,19200⟩)))) (.node (.node (.single ⟨31296,31360,19072,19136⟩) (.node (.single ⟨31296,31360,19136,19200⟩) (.single ⟨31360,31488,18944,19072⟩))) (.node (.node (.single ⟨31360,31424,19072,19136⟩) (.single ⟨31360,31424,19136,19200⟩)) (.node (.single ⟨31424,31488,19072,19136⟩) (.single ⟨31424,31488,19136,19200⟩)))))))
def output51 : Fin 52 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData51 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover51 (i : Fin 52) : Fin 52 := ⟨coverData51.get i % 52, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 52) : Fin 52 := ⟨sourceData51.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 .empty (.cutX 1536 (.cutY 13824 (.cutX 1280 .empty (.cutY 13568 .empty (.cutX 1408 (.cutY 13696 (.cutX 1344 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full) (.cutY 13696 (.cutX 1472 (.cutY 13632 .full .full) (.cutY 13632 (.cutX 1504 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full)) .full)))) .empty) .empty))) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 .empty (.cutX 13824 (.cutY 1536 (.cutX 13568 .empty (.cutY 1280 .empty (.cutX 13696 (.cutY 1408 (.cutX 13632 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 13632 (.cutY 1472 .full (.cutX 13600 (.cutY 1504 .full .full) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty) .empty))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 (.cutX 18944 .empty (.cutY 31232 .empty (.cutX 19200 (.cutY 31488 (.cutX 19072 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 19136 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 19168 (.cutY 31264 .full .full) (.cutY 31264 .full .full)) .full)) (.cutX 19136 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty))) .empty) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 (.cutX 31232 .empty (.cutY 18944 .empty (.cutX 31488 (.cutY 19200 (.cutX 31360 (.cutY 19072 .full (.cutX 31296 (.cutY 19136 .full (.cutX 31264 (.cutY 19168 .full .full) (.cutY 19168 .full .full))) (.cutY 19136 .full .full))) (.cutY 19072 .full (.cutX 31424 (.cutY 19136 .full .full) (.cutY 19136 .full .full)))) .empty) .empty))) .empty) .empty))) .empty)) .empty))))

theorem metadata51 : 0<234882010 ∧ 5<128 ∧ 53<128 ∧ 1<4 ∧
    4828/4160=1 ∧ 4828%4160=668 ∧ ∀ i, (leaves51 i).Valid 8 := by
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 4584, atom 1656, type 0, source (14,60).
def leavesData52 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves52 : Fin 4 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 60 leaves52 i
def outputData52 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,15360,15488⟩) (.single ⟨3584,3712,15488,15616⟩)) (.node (.single ⟨3712,3840,15360,15488⟩) (.single ⟨3712,3840,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,3584,3712⟩) (.single ⟨15360,15488,3712,3840⟩)) (.node (.single ⟨15488,15616,3584,3712⟩) (.single ⟨15488,15616,3712,3840⟩)))) (.node (.node (.node (.single ⟨17152,17280,28928,29056⟩) (.single ⟨17152,17280,29056,29184⟩)) (.node (.single ⟨17280,17408,28928,29056⟩) (.single ⟨17280,17408,29056,29184⟩))) (.node (.node (.single ⟨28928,29056,17152,17280⟩) (.single ⟨28928,29056,17280,17408⟩)) (.node (.single ⟨29056,29184,17152,17280⟩) (.single ⟨29056,29184,17280,17408⟩)))))
def output52 : Fin 16 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData52 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover52 (i : Fin 16) : Fin 16 := ⟨coverData52.get i % 16, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 16) : Fin 16 := ⟨sourceData52.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 .empty (.cutY 15872 (.cutX 3840 (.cutY 15616 (.cutX 3712 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty) .empty) .empty))))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 .empty (.cutX 15616 (.cutY 3840 (.cutX 15488 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty) .empty)) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 (.cutX 17152 .empty (.cutY 28928 .empty (.cutX 17280 (.cutY 29056 .full .full) (.cutY 29056 .full .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 (.cutY 16896 .empty (.cutX 28928 .empty (.cutY 17152 .empty (.cutX 29056 (.cutY 17280 .full .full) (.cutY 17280 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata52 : 0<116912559 ∧ 14<128 ∧ 60<128 ∧ 0<4 ∧
    1656/4160=0 ∧ 1656%4160=1656 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 4585, atom 2481, type 0, source (23,66).
def leavesData53 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves53 : Fin 7 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 23 66 leaves53 i
def outputData53 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5888,6016,16896,17024⟩) (.node (.single ⟨5888,6016,17024,17152⟩) (.single ⟨6016,6080,16896,16960⟩))) (.node (.node (.single ⟨6016,6080,16960,17024⟩) (.single ⟨6080,6144,16896,16960⟩)) (.node (.single ⟨6080,6144,16960,17024⟩) (.single ⟨6016,6144,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,26624,26752⟩) (.node (.single ⟨15616,15744,26752,26880⟩) (.single ⟨15744,15808,26624,26688⟩))) (.node (.node (.single ⟨15744,15808,26688,26752⟩) (.single ⟨15808,15872,26624,26688⟩)) (.node (.single ⟨15808,15872,26688,26752⟩) (.single ⟨15744,15872,26752,26880⟩))))) (.node (.node (.node (.single ⟨16896,17024,5888,6016⟩) (.node (.single ⟨16896,16960,6016,6080⟩) (.single ⟨16896,16960,6080,6144⟩))) (.node (.node (.single ⟨16960,17024,6016,6080⟩) (.single ⟨16960,17024,6080,6144⟩)) (.node (.single ⟨17024,17152,5888,6016⟩) (.single ⟨17024,17152,6016,6144⟩)))) (.node (.node (.single ⟨26624,26752,15616,15744⟩) (.node (.single ⟨26624,26688,15744,15808⟩) (.single ⟨26624,26688,15808,15872⟩))) (.node (.node (.single ⟨26688,26752,15744,15808⟩) (.single ⟨26688,26752,15808,15872⟩)) (.node (.single ⟨26752,26880,15616,15744⟩) (.single ⟨26752,26880,15744,15872⟩))))))
def output53 : Fin 28 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData53 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover53 (i : Fin 28) : Fin 28 := ⟨coverData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 28) : Fin 28 := ⟨sourceData53.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 .empty (.cutY 16896 .empty (.cutX 5888 .empty (.cutY 17152 (.cutX 6016 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 6080 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty)))) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 (.cutY 27136 (.cutX 15616 .empty (.cutY 26880 (.cutX 15744 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 15808 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full)) .empty)) .empty) .empty) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 .empty (.cutY 5632 .empty (.cutX 17152 (.cutY 5888 .empty (.cutX 17024 (.cutY 6016 .full (.cutX 16960 (.cutY 6080 .full .full) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)))) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 (.cutY 15872 (.cutX 26880 (.cutY 15616 .empty (.cutX 26752 (.cutY 15744 .full (.cutX 26688 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full))) .empty) .empty) .empty)) .empty)))) .empty))) .empty))

theorem metadata53 : 0<191564598 ∧ 23<128 ∧ 66<128 ∧ 0<4 ∧
    2481/4160=0 ∧ 2481%4160=2481 ∧ ∀ i, (leaves53 i).Valid 8 := by
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 4586, atom 2796, type 0, source (27,69).
def leavesData54 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves54 : Fin 4 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 27 69 leaves54 i
def outputData54 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6912,7040,17664,17792⟩) (.single ⟨6912,7040,17792,17920⟩)) (.node (.single ⟨7040,7168,17664,17792⟩) (.single ⟨7040,7168,17792,17920⟩))) (.node (.node (.single ⟨14848,14976,25600,25728⟩) (.single ⟨14848,14976,25728,25856⟩)) (.node (.single ⟨14976,15104,25600,25728⟩) (.single ⟨14976,15104,25728,25856⟩)))) (.node (.node (.node (.single ⟨17664,17792,6912,7040⟩) (.single ⟨17664,17792,7040,7168⟩)) (.node (.single ⟨17792,17920,6912,7040⟩) (.single ⟨17792,17920,7040,7168⟩))) (.node (.node (.single ⟨25600,25728,14848,14976⟩) (.single ⟨25600,25728,14976,15104⟩)) (.node (.single ⟨25728,25856,14848,14976⟩) (.single ⟨25728,25856,14976,15104⟩)))))
def output54 : Fin 16 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData54 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover54 (i : Fin 16) : Fin 16 := ⟨coverData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 16) : Fin 16 := ⟨sourceData54.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 .empty (.cutY 17920 (.cutX 6912 .empty (.cutY 17664 .empty (.cutX 7040 (.cutY 17792 .full .full) (.cutY 17792 .full .full)))) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 .empty (.cutY 26112 (.cutX 15104 (.cutY 25856 (.cutX 14976 (.cutY 25728 .full .full) (.cutY 25728 .full .full)) .empty) .empty) .empty))) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 (.cutY 6656 .empty (.cutX 17664 .empty (.cutY 6912 .empty (.cutX 17792 (.cutY 7040 .full .full) (.cutY 7040 .full .full))))) .empty) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 (.cutY 14848 .empty (.cutX 25856 (.cutY 15104 (.cutX 25728 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty) .empty)) .empty) .empty))) .empty)) .empty))) .empty))

theorem metadata54 : 0<170092456 ∧ 27<128 ∧ 69<128 ∧ 0<4 ∧
    2796/4160=0 ∧ 2796%4160=2796 ∧ ∀ i, (leaves54 i).Valid 8 := by
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 4587, atom 6876, type 1, source (26,64).
def leavesData55 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩)) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves55 : Fin 16 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 26 64 leaves55 i
def outputData55 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6656,6720,16384,16448⟩) (.single ⟨6656,6720,16448,16512⟩)) (.node (.single ⟨6720,6784,16384,16448⟩) (.single ⟨6720,6784,16448,16512⟩))) (.node (.node (.single ⟨6656,6784,16512,16640⟩) (.single ⟨6784,6848,16384,16448⟩)) (.node (.single ⟨6784,6848,16448,16512⟩) (.single ⟨6848,6880,16384,16416⟩)))) (.node (.node (.node (.single ⟨6848,6880,16416,16448⟩) (.single ⟨6880,6912,16384,16416⟩)) (.node (.single ⟨6880,6912,16416,16448⟩) (.single ⟨6848,6912,16448,16512⟩))) (.node (.node (.single ⟨6784,6848,16512,16576⟩) (.single ⟨6784,6848,16576,16640⟩)) (.node (.single ⟨6848,6912,16512,16576⟩) (.single ⟨6848,6912,16576,16640⟩))))) (.node (.node (.node (.node (.single ⟨16128,16192,25856,25920⟩) (.single ⟨16128,16192,25920,25984⟩)) (.node (.single ⟨16192,16256,25856,25920⟩) (.single ⟨16192,16256,25920,25984⟩))) (.node (.node (.single ⟨16128,16256,25984,26112⟩) (.single ⟨16256,16320,25856,25920⟩)) (.node (.single ⟨16256,16320,25920,25984⟩) (.single ⟨16320,16352,25856,25888⟩)))) (.node (.node (.node (.single ⟨16320,16352,25888,25920⟩) (.single ⟨16352,16384,25856,25888⟩)) (.node (.single ⟨16352,16384,25888,25920⟩) (.single ⟨16320,16384,25920,25984⟩))) (.node (.node (.single ⟨16256,16320,25984,26048⟩) (.single ⟨16256,16320,26048,26112⟩)) (.node (.single ⟨16320,16384,25984,26048⟩) (.single ⟨16320,16384,26048,26112⟩)))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,6656,6720⟩) (.single ⟨16384,16448,6720,6784⟩)) (.node (.single ⟨16448,16512,6656,6720⟩) (.single ⟨16448,16512,6720,6784⟩))) (.node (.node (.single ⟨16384,16448,6784,6848⟩) (.single ⟨16384,16416,6848,6880⟩)) (.node (.single ⟨16384,16416,6880,6912⟩) (.single ⟨16416,16448,6848,6880⟩)))) (.node (.node (.node (.single ⟨16416,16448,6880,6912⟩) (.single ⟨16448,16512,6784,6848⟩)) (.node (.single ⟨16448,16512,6848,6912⟩) (.single ⟨16512,16640,6656,6784⟩))) (.node (.node (.single ⟨16512,16576,6784,6848⟩) (.single ⟨16512,16576,6848,6912⟩)) (.node (.single ⟨16576,16640,6784,6848⟩) (.single ⟨16576,16640,6848,6912⟩))))) (.node (.node (.node (.node (.single ⟨25856,25920,16128,16192⟩) (.single ⟨25856,25920,16192,16256⟩)) (.node (.single ⟨25920,25984,16128,16192⟩) (.single ⟨25920,25984,16192,16256⟩))) (.node (.node (.single ⟨25856,25920,16256,16320⟩) (.single ⟨25856,25888,16320,16352⟩)) (.node (.single ⟨25856,25888,16352,16384⟩) (.single ⟨25888,25920,16320,16352⟩)))) (.node (.node (.node (.single ⟨25888,25920,16352,16384⟩) (.single ⟨25920,25984,16256,16320⟩)) (.node (.single ⟨25920,25984,16320,16384⟩) (.single ⟨25984,26112,16128,16256⟩))) (.node (.node (.single ⟨25984,26048,16256,16320⟩) (.single ⟨25984,26048,16320,16384⟩)) (.node (.single ⟨26048,26112,16256,16320⟩) (.single ⟨26048,26112,16320,16384⟩)))))))
def output55 : Fin 64 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21))))) (.node (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29)))) (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData55 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 28))) (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 12))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 15)) (.node (.single 11) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 7))) (.node (.node (.single 31) (.single 23)) (.node (.single 27) (.single 19)))))) (.node (.node (.node (.node (.node (.single 17) (.single 25)) (.node (.single 21) (.single 29))) (.node (.node (.single 5) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 9)) (.node (.single 13) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 14) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 10)) (.node (.single 6) (.single 2))) (.node (.node (.single 30) (.single 26)) (.node (.single 22) (.single 18)))))))
def cover55 (i : Fin 64) : Fin 64 := ⟨coverData55.get i % 64, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 64) : Fin 64 := ⟨sourceData55.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 .empty (.cutY 16896 (.cutX 6912 (.cutY 16640 (.cutX 6784 (.cutY 16512 (.cutX 6720 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full) (.cutY 16512 (.cutX 6848 (.cutY 16448 .full .full) (.cutY 16448 (.cutX 6880 (.cutY 16416 .full .full) (.cutY 16416 .full .full)) .full)) (.cutX 6848 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 .empty (.cutY 26112 (.cutX 16128 .empty (.cutY 25856 .empty (.cutX 16256 (.cutY 25984 (.cutX 16192 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) .full) (.cutY 25984 (.cutX 16320 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 16352 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 16320 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty)))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 (.cutY 6656 .empty (.cutX 16640 (.cutY 6912 (.cutX 16512 (.cutY 6784 (.cutX 16448 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 16448 (.cutY 6848 .full (.cutX 16416 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full (.cutX 16576 (.cutY 6848 .full .full) (.cutY 6848 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 (.cutY 15872 .empty (.cutX 25856 .empty (.cutY 16128 .empty (.cutX 25984 (.cutY 16256 (.cutX 25920 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) (.cutX 25920 (.cutY 16320 .full (.cutX 25888 (.cutY 16352 .full .full) (.cutY 16352 .full .full))) (.cutY 16320 .full .full))) (.cutY 16256 .full (.cutX 26048 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))))) .empty)))) .empty)) .empty))) .empty))

theorem metadata55 : 0<175587969 ∧ 26<128 ∧ 64<128 ∧ 1<4 ∧
    6876/4160=1 ∧ 6876%4160=2716 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 4588, atom 5912, type 1, source (15,57).
def leavesData56 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves56 : Fin 10 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 15 57 leaves56 i
def outputData56 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨3840,3968,14592,14720⟩) (.single ⟨3840,3968,14720,14848⟩)) (.node (.single ⟨3968,4032,14592,14656⟩) (.node (.single ⟨3968,4032,14656,14720⟩) (.single ⟨4032,4064,14592,14624⟩)))) (.node (.node (.single ⟨4032,4064,14624,14656⟩) (.single ⟨4064,4096,14592,14624⟩)) (.node (.single ⟨4064,4096,14624,14656⟩) (.node (.single ⟨4032,4096,14656,14720⟩) (.single ⟨3968,4096,14720,14848⟩))))) (.node (.node (.node (.single ⟨14592,14720,3840,3968⟩) (.single ⟨14592,14656,3968,4032⟩)) (.node (.single ⟨14592,14624,4032,4064⟩) (.node (.single ⟨14592,14624,4064,4096⟩) (.single ⟨14624,14656,4032,4064⟩)))) (.node (.node (.single ⟨14624,14656,4064,4096⟩) (.single ⟨14656,14720,3968,4032⟩)) (.node (.single ⟨14656,14720,4032,4096⟩) (.node (.single ⟨14720,14848,3840,3968⟩) (.single ⟨14720,14848,3968,4096⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,28672,28800⟩) (.single ⟨17920,18048,28800,28928⟩)) (.node (.single ⟨18048,18112,28672,28736⟩) (.node (.single ⟨18048,18112,28736,28800⟩) (.single ⟨18112,18144,28672,28704⟩)))) (.node (.node (.single ⟨18112,18144,28704,28736⟩) (.single ⟨18144,18176,28672,28704⟩)) (.node (.single ⟨18144,18176,28704,28736⟩) (.node (.single ⟨18112,18176,28736,28800⟩) (.single ⟨18048,18176,28800,28928⟩))))) (.node (.node (.node (.single ⟨28672,28800,17920,18048⟩) (.single ⟨28672,28736,18048,18112⟩)) (.node (.single ⟨28672,28704,18112,18144⟩) (.node (.single ⟨28672,28704,18144,18176⟩) (.single ⟨28704,28736,18112,18144⟩)))) (.node (.node (.single ⟨28704,28736,18144,18176⟩) (.single ⟨28736,28800,18048,18112⟩)) (.node (.single ⟨28736,28800,18112,18176⟩) (.node (.single ⟨28800,28928,17920,18048⟩) (.single ⟨28800,28928,18048,18176⟩)))))))
def output56 : Fin 40 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData56 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover56 (i : Fin 40) : Fin 40 := ⟨coverData56.get i % 40, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 40) : Fin 40 := ⟨sourceData56.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 (.cutX 3584 .empty (.cutY 14848 (.cutX 3840 .empty (.cutY 14592 .empty (.cutX 3968 (.cutY 14720 .full .full) (.cutY 14720 (.cutX 4032 (.cutY 14656 .full .full) (.cutY 14656 (.cutX 4064 (.cutY 14624 .full .full) (.cutY 14624 .full .full)) .full)) .full)))) .empty)) .empty))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 .empty (.cutX 14848 (.cutY 3584 .empty (.cutX 14592 .empty (.cutY 3840 .empty (.cutX 14720 (.cutY 3968 .full (.cutX 14656 (.cutY 4032 .full (.cutX 14624 (.cutY 4064 .full .full) (.cutY 4064 .full .full))) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))) .empty)) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 (.cutX 17920 .empty (.cutY 29184 (.cutX 18176 (.cutY 28928 (.cutX 18048 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 18112 (.cutY 28736 .full .full) (.cutY 28736 (.cutX 18144 (.cutY 28704 .full .full) (.cutY 28704 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 .empty (.cutX 29184 (.cutY 17920 .empty (.cutX 28928 (.cutY 18176 (.cutX 28800 (.cutY 18048 .full (.cutX 28736 (.cutY 18112 .full (.cutX 28704 (.cutY 18144 .full .full) (.cutY 18144 .full .full))) (.cutY 18112 .full .full))) (.cutY 18048 .full .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata56 : 0<163200014 ∧ 15<128 ∧ 57<128 ∧ 1<4 ∧
    5912/4160=1 ∧ 5912%4160=1752 ∧ ∀ i, (leaves56 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData56).mp
    (by decide +kernel)

theorem sourceChecked56_0 : ∀ i : Fin 40,
    (fun i => output56 i = raw56 (source56 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked56 : ∀ i : Fin 40, (fun i => output56 i = raw56 (source56 i)) i :=
  forallFin_of_zero_offset (fun i => output56 i = raw56 (source56 i)) sourceChecked56_0

theorem coverChecked56_0 : ∀ i : Fin 40,
    (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked56 : ∀ i : Fin 40, (fun i => (output56 (cover56 i)).ContainsBox (raw56 i)) i :=
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

noncomputable def phaseMass56 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw56 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass56_eq : phaseMass56 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass56
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw56 output56 cover56 source56
    (gridTreeUnionCheck_sound 32768 raw56 output56 cover56 source56 tree56 checked56)
    _ (by norm_num) _, areaUnits56]
  norm_num

-- Frozen phase 4589, atom 7236, type 1, source (31,69).
def leavesData57 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves57 : Fin 10 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 31 69 leaves57 i
def outputData57 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7936,8064,17664,17792⟩) (.single ⟨7936,8064,17792,17920⟩)) (.node (.single ⟨8064,8128,17664,17728⟩) (.node (.single ⟨8064,8128,17728,17792⟩) (.single ⟨8128,8160,17664,17696⟩)))) (.node (.node (.single ⟨8128,8160,17696,17728⟩) (.single ⟨8160,8192,17664,17696⟩)) (.node (.single ⟨8160,8192,17696,17728⟩) (.node (.single ⟨8128,8192,17728,17792⟩) (.single ⟨8064,8192,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,24576,24704⟩) (.single ⟨14848,14976,24704,24832⟩)) (.node (.single ⟨14976,15040,24576,24640⟩) (.node (.single ⟨14976,15040,24640,24704⟩) (.single ⟨15040,15072,24576,24608⟩)))) (.node (.node (.single ⟨15040,15072,24608,24640⟩) (.single ⟨15072,15104,24576,24608⟩)) (.node (.single ⟨15072,15104,24608,24640⟩) (.node (.single ⟨15040,15104,24640,24704⟩) (.single ⟨14976,15104,24704,24832⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17792,7936,8064⟩) (.single ⟨17664,17728,8064,8128⟩)) (.node (.single ⟨17664,17696,8128,8160⟩) (.node (.single ⟨17664,17696,8160,8192⟩) (.single ⟨17696,17728,8128,8160⟩)))) (.node (.node (.single ⟨17696,17728,8160,8192⟩) (.single ⟨17728,17792,8064,8128⟩)) (.node (.single ⟨17728,17792,8128,8192⟩) (.node (.single ⟨17792,17920,7936,8064⟩) (.single ⟨17792,17920,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,14848,14976⟩) (.single ⟨24576,24640,14976,15040⟩)) (.node (.single ⟨24576,24608,15040,15072⟩) (.node (.single ⟨24576,24608,15072,15104⟩) (.single ⟨24608,24640,15040,15072⟩)))) (.node (.node (.single ⟨24608,24640,15072,15104⟩) (.single ⟨24640,24704,14976,15040⟩)) (.node (.single ⟨24640,24704,15040,15104⟩) (.node (.single ⟨24704,24832,14848,14976⟩) (.single ⟨24704,24832,14976,15104⟩)))))))
def output57 : Fin 40 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData57 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover57 (i : Fin 40) : Fin 40 := ⟨coverData57.get i % 40, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 40) : Fin 40 := ⟨sourceData57.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 .empty (.cutY 17920 (.cutX 7936 .empty (.cutY 17664 .empty (.cutX 8064 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 8128 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 8160 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty)))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 .empty (.cutY 25088 (.cutX 15104 (.cutY 24832 (.cutX 14976 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 15040 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 15072 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 (.cutY 7680 .empty (.cutX 17664 .empty (.cutY 7936 .empty (.cutX 17792 (.cutY 8064 .full (.cutX 17728 (.cutY 8128 .full (.cutX 17696 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))))) .empty)))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 (.cutY 14848 .empty (.cutX 24832 (.cutY 15104 (.cutX 24704 (.cutY 14976 .full (.cutX 24640 (.cutY 15040 .full (.cutX 24608 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata57 : 0<175587969 ∧ 31<128 ∧ 69<128 ∧ 1<4 ∧
    7236/4160=1 ∧ 7236%4160=3076 ∧ ∀ i, (leaves57 i).Valid 8 := by
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 4590, atom 7655, type 1, source (38,75).
def leavesData58 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves58 : Fin 10 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 38 75 leaves58 i
def outputData58 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨9728,9856,19200,19328⟩) (.single ⟨9728,9856,19328,19456⟩)) (.node (.single ⟨9856,9920,19200,19264⟩) (.node (.single ⟨9856,9920,19264,19328⟩) (.single ⟨9920,9952,19200,19232⟩)))) (.node (.node (.single ⟨9920,9952,19232,19264⟩) (.single ⟨9952,9984,19200,19232⟩)) (.node (.single ⟨9952,9984,19232,19264⟩) (.node (.single ⟨9920,9984,19264,19328⟩) (.single ⟨9856,9984,19328,19456⟩))))) (.node (.node (.node (.single ⟨13312,13440,22784,22912⟩) (.single ⟨13312,13440,22912,23040⟩)) (.node (.single ⟨13440,13504,22784,22848⟩) (.node (.single ⟨13440,13504,22848,22912⟩) (.single ⟨13504,13536,22784,22816⟩)))) (.node (.node (.single ⟨13504,13536,22816,22848⟩) (.single ⟨13536,13568,22784,22816⟩)) (.node (.single ⟨13536,13568,22816,22848⟩) (.node (.single ⟨13504,13568,22848,22912⟩) (.single ⟨13440,13568,22912,23040⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,9728,9856⟩) (.single ⟨19200,19264,9856,9920⟩)) (.node (.single ⟨19200,19232,9920,9952⟩) (.node (.single ⟨19200,19232,9952,9984⟩) (.single ⟨19232,19264,9920,9952⟩)))) (.node (.node (.single ⟨19232,19264,9952,9984⟩) (.single ⟨19264,19328,9856,9920⟩)) (.node (.single ⟨19264,19328,9920,9984⟩) (.node (.single ⟨19328,19456,9728,9856⟩) (.single ⟨19328,19456,9856,9984⟩))))) (.node (.node (.node (.single ⟨22784,22912,13312,13440⟩) (.single ⟨22784,22848,13440,13504⟩)) (.node (.single ⟨22784,22816,13504,13536⟩) (.node (.single ⟨22784,22816,13536,13568⟩) (.single ⟨22816,22848,13504,13536⟩)))) (.node (.node (.single ⟨22816,22848,13536,13568⟩) (.single ⟨22848,22912,13440,13504⟩)) (.node (.single ⟨22848,22912,13504,13568⟩) (.node (.single ⟨22912,23040,13312,13440⟩) (.single ⟨22912,23040,13440,13568⟩)))))))
def output58 : Fin 40 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover58 (i : Fin 40) : Fin 40 := ⟨coverData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 40) : Fin 40 := ⟨sourceData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 (.cutX 9728 .empty (.cutY 18944 .empty (.cutX 9984 (.cutY 19200 .empty (.cutX 9856 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 9920 (.cutY 19264 .full .full) (.cutY 19264 (.cutX 9952 (.cutY 19232 .full .full) (.cutY 19232 .full .full)) .full)) .full))) .empty))) .empty))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 (.cutX 13824 (.cutY 23040 (.cutX 13568 (.cutY 22784 .empty (.cutX 13440 (.cutY 22912 .full .full) (.cutY 22912 (.cutX 13504 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 13536 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 .empty (.cutX 18944 .empty (.cutY 9728 .empty (.cutX 19200 .empty (.cutY 9984 (.cutX 19328 (.cutY 9856 .full (.cutX 19264 (.cutY 9920 .full (.cutX 19232 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full .full)) .empty))))) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 .empty (.cutX 23040 (.cutY 13824 (.cutX 22784 .empty (.cutY 13568 (.cutX 22912 (.cutY 13440 .full (.cutX 22848 (.cutY 13504 .full (.cutX 22816 (.cutY 13536 .full .full) (.cutY 13536 .full .full))) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty)) .empty) .empty)) .empty) .empty))))) .empty) .empty))

theorem metadata58 : 0<167101800 ∧ 38<128 ∧ 75<128 ∧ 1<4 ∧
    7655/4160=1 ∧ 7655%4160=3495 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (835509/8192000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 4591, atom 3145, type 0, source (32,73).
def leavesData59 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves59 : Fin 4 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 32 73 leaves59 i
def outputData59 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8192,8320,18688,18816⟩) (.single ⟨8192,8320,18816,18944⟩)) (.node (.single ⟨8320,8448,18688,18816⟩) (.single ⟨8320,8448,18816,18944⟩))) (.node (.node (.single ⟨13824,13952,24320,24448⟩) (.single ⟨13824,13952,24448,24576⟩)) (.node (.single ⟨13952,14080,24320,24448⟩) (.single ⟨13952,14080,24448,24576⟩)))) (.node (.node (.node (.single ⟨18688,18816,8192,8320⟩) (.single ⟨18688,18816,8320,8448⟩)) (.node (.single ⟨18816,18944,8192,8320⟩) (.single ⟨18816,18944,8320,8448⟩))) (.node (.node (.single ⟨24320,24448,13824,13952⟩) (.single ⟨24320,24448,13952,14080⟩)) (.node (.single ⟨24448,24576,13824,13952⟩) (.single ⟨24448,24576,13952,14080⟩)))))
def output59 : Fin 16 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData59 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover59 (i : Fin 16) : Fin 16 := ⟨coverData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 16) : Fin 16 := ⟨sourceData59.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 (.cutY 18944 (.cutX 8448 (.cutY 18688 .empty (.cutX 8320 (.cutY 18816 .full .full) (.cutY 18816 .full .full))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 .empty (.cutY 24064 .empty (.cutX 14080 (.cutY 24320 .empty (.cutX 13952 (.cutY 24448 .full .full) (.cutY 24448 .full .full))) .empty)))))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 (.cutY 8704 (.cutX 18688 .empty (.cutY 8448 (.cutX 18816 (.cutY 8320 .full .full) (.cutY 8320 .full .full)) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 .empty (.cutY 13824 .empty (.cutX 24320 .empty (.cutY 14080 (.cutX 24448 (.cutY 13952 .full .full) (.cutY 13952 .full .full)) .empty)))))) .empty))))) .empty) .empty))

theorem metadata59 : 0<109574533 ∧ 32<128 ∧ 73<128 ∧ 0<4 ∧
    3145/4160=0 ∧ 3145%4160=3145 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 4592, atom 3209, type 0, source (33,74).
def leavesData60 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves60 : Fin 4 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 33 74 leaves60 i
def outputData60 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8448,8576,18944,19072⟩) (.single ⟨8448,8576,19072,19200⟩)) (.node (.single ⟨8576,8704,18944,19072⟩) (.single ⟨8576,8704,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,24064,24192⟩) (.single ⟨13568,13696,24192,24320⟩)) (.node (.single ⟨13696,13824,24064,24192⟩) (.single ⟨13696,13824,24192,24320⟩)))) (.node (.node (.node (.single ⟨18944,19072,8448,8576⟩) (.single ⟨18944,19072,8576,8704⟩)) (.node (.single ⟨19072,19200,8448,8576⟩) (.single ⟨19072,19200,8576,8704⟩))) (.node (.node (.single ⟨24064,24192,13568,13696⟩) (.single ⟨24064,24192,13696,13824⟩)) (.node (.single ⟨24192,24320,13568,13696⟩) (.single ⟨24192,24320,13696,13824⟩)))))
def output60 : Fin 16 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData60 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover60 (i : Fin 16) : Fin 16 := ⟨coverData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 16) : Fin 16 := ⟨sourceData60.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 (.cutY 18944 .empty (.cutX 8448 .empty (.cutY 19200 (.cutX 8576 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty))) .empty) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 (.cutY 24064 .empty (.cutX 13568 .empty (.cutY 24320 (.cutX 13696 (.cutY 24192 .full .full) (.cutY 24192 .full .full)) .empty))) .empty)))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 .empty (.cutY 8704 (.cutX 19200 (.cutY 8448 .empty (.cutX 19072 (.cutY 8576 .full .full) (.cutY 8576 .full .full))) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 .empty (.cutY 13824 (.cutX 24320 (.cutY 13568 .empty (.cutX 24192 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty)))) .empty))))) .empty) .empty))

theorem metadata60 : 0<109574533 ∧ 33<128 ∧ 74<128 ∧ 0<4 ∧
    3209/4160=0 ∧ 3209%4160=3209 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 4593, atom 3779, type 0, source (44,83).
def leavesData61 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves61 : Fin 4 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 44 83 leaves61 i
def outputData61 : FiniteInputTree GridBox 8 := (.node (.node (.node (.single ⟨11264,11392,21248,21376⟩) (.single ⟨11264,11392,21376,21504⟩)) (.node (.single ⟨11392,11520,21248,21376⟩) (.single ⟨11392,11520,21376,21504⟩))) (.node (.node (.single ⟨21248,21376,11264,11392⟩) (.single ⟨21248,21376,11392,11520⟩)) (.node (.single ⟨21376,21504,11264,11392⟩) (.single ⟨21376,21504,11392,11520⟩))))
def output61 : Fin 8 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 7) (.single 3))) (.node (.node (.single 1) (.single 6)) (.node (.single 6) (.single 1)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 5) (.single 2))) (.node (.node (.single 3) (.single 7)) (.node (.single 4) (.single 0)))))
def sourceData61 : FiniteInputTree ℕ 8 := (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 3))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 2))))
def cover61 (i : Fin 16) : Fin 8 := ⟨coverData61.get i % 8, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 8) : Fin 16 := ⟨sourceData61.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 .empty (.cutY 21504 (.cutX 11776 (.cutY 20992 .empty (.cutX 11520 (.cutY 21248 .empty (.cutX 11392 (.cutY 21376 .full .full) (.cutY 21376 .full .full))) .empty)) .empty) .empty)) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 .empty (.cutX 20992 .empty (.cutY 11776 (.cutX 21248 .empty (.cutY 11520 (.cutX 21376 (.cutY 11392 .full .full) (.cutY 11392 .full .full)) .empty)) .empty))) .empty)) .empty) .empty))) .empty) .empty))

theorem metadata61 : 0<1701312 ∧ 44<128 ∧ 83<128 ∧ 0<4 ∧
    3779/4160=0 ∧ 3779%4160=3779 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 8,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 8 0 8 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 8, (fun i => output61 i = raw61 (source61 i)) i :=
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

theorem areaUnits61 : gridUnionAreaUnits output61 = 131072 := by decide +kernel

noncomputable def phaseMass61 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (26583/51200000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 4594, atom 7707, type 1, source (39,76).
def leavesData62 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves62 : Fin 10 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 39 76 leaves62 i
def outputData62 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨9984,10112,19456,19584⟩) (.single ⟨9984,10112,19584,19712⟩)) (.node (.single ⟨10112,10176,19456,19520⟩) (.node (.single ⟨10112,10176,19520,19584⟩) (.single ⟨10176,10208,19456,19488⟩)))) (.node (.node (.single ⟨10176,10208,19488,19520⟩) (.single ⟨10208,10240,19456,19488⟩)) (.node (.single ⟨10208,10240,19488,19520⟩) (.node (.single ⟨10176,10240,19520,19584⟩) (.single ⟨10112,10240,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,22528,22656⟩) (.single ⟨13056,13184,22656,22784⟩)) (.node (.single ⟨13184,13248,22528,22592⟩) (.node (.single ⟨13184,13248,22592,22656⟩) (.single ⟨13248,13280,22528,22560⟩)))) (.node (.node (.single ⟨13248,13280,22560,22592⟩) (.single ⟨13280,13312,22528,22560⟩)) (.node (.single ⟨13280,13312,22560,22592⟩) (.node (.single ⟨13248,13312,22592,22656⟩) (.single ⟨13184,13312,22656,22784⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19584,9984,10112⟩) (.single ⟨19456,19520,10112,10176⟩)) (.node (.single ⟨19456,19488,10176,10208⟩) (.node (.single ⟨19456,19488,10208,10240⟩) (.single ⟨19488,19520,10176,10208⟩)))) (.node (.node (.single ⟨19488,19520,10208,10240⟩) (.single ⟨19520,19584,10112,10176⟩)) (.node (.single ⟨19520,19584,10176,10240⟩) (.node (.single ⟨19584,19712,9984,10112⟩) (.single ⟨19584,19712,10112,10240⟩))))) (.node (.node (.node (.single ⟨22528,22656,13056,13184⟩) (.single ⟨22528,22592,13184,13248⟩)) (.node (.single ⟨22528,22560,13248,13280⟩) (.node (.single ⟨22528,22560,13280,13312⟩) (.single ⟨22560,22592,13248,13280⟩)))) (.node (.node (.single ⟨22560,22592,13280,13312⟩) (.single ⟨22592,22656,13184,13248⟩)) (.node (.single ⟨22592,22656,13248,13312⟩) (.node (.single ⟨22656,22784,13056,13184⟩) (.single ⟨22656,22784,13184,13312⟩)))))))
def output62 : Fin 40 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData62 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover62 (i : Fin 40) : Fin 40 := ⟨coverData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 40) : Fin 40 := ⟨sourceData62.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 .empty (.cutY 19968 (.cutX 9984 .empty (.cutY 19712 (.cutX 10112 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 10176 (.cutY 19520 .full .full) (.cutY 19520 (.cutX 10208 (.cutY 19488 .full .full) (.cutY 19488 .full .full)) .full)) .full)) .empty)) .empty))))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 .empty (.cutY 23040 (.cutX 13056 .empty (.cutY 22784 (.cutX 13184 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 13248 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 13280 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) .full)) .empty)) .empty)) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 (.cutY 9728 .empty (.cutX 19712 (.cutY 9984 .empty (.cutX 19584 (.cutY 10112 .full (.cutX 19520 (.cutY 10176 .full (.cutX 19488 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full .full))) .empty)) .empty))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 (.cutY 12800 .empty (.cutX 22784 (.cutY 13056 .empty (.cutX 22656 (.cutY 13184 .full (.cutX 22592 (.cutY 13248 .full (.cutX 22560 (.cutY 13280 .full .full) (.cutY 13280 .full .full))) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty)) .empty) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata62 : 0<167101800 ∧ 39<128 ∧ 76<128 ∧ 1<4 ∧
    7707/4160=1 ∧ 7707%4160=3547 ∧ ∀ i, (leaves62 i).Valid 8 := by
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (835509/8192000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 4595, atom 6199, type 1, source (18,59).
def leavesData63 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves63 : Fin 13 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 59 leaves63 i
def outputData63 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,15104,15168⟩) (.node (.single ⟨4608,4672,15168,15232⟩) (.single ⟨4672,4736,15104,15168⟩))) (.node (.single ⟨4672,4736,15168,15232⟩) (.node (.single ⟨4608,4736,15232,15360⟩) (.single ⟨4736,4800,15104,15168⟩)))) (.node (.node (.single ⟨4736,4800,15168,15232⟩) (.node (.single ⟨4800,4832,15104,15136⟩) (.single ⟨4800,4832,15136,15168⟩))) (.node (.node (.single ⟨4832,4864,15104,15136⟩) (.single ⟨4832,4864,15136,15168⟩)) (.node (.single ⟨4800,4864,15168,15232⟩) (.single ⟨4736,4864,15232,15360⟩))))) (.node (.node (.node (.single ⟨15104,15168,4608,4672⟩) (.node (.single ⟨15104,15168,4672,4736⟩) (.single ⟨15168,15232,4608,4672⟩))) (.node (.single ⟨15168,15232,4672,4736⟩) (.node (.single ⟨15104,15168,4736,4800⟩) (.single ⟨15104,15136,4800,4832⟩)))) (.node (.node (.single ⟨15104,15136,4832,4864⟩) (.node (.single ⟨15136,15168,4800,4832⟩) (.single ⟨15136,15168,4832,4864⟩))) (.node (.node (.single ⟨15168,15232,4736,4800⟩) (.single ⟨15168,15232,4800,4864⟩)) (.node (.single ⟨15232,15360,4608,4736⟩) (.single ⟨15232,15360,4736,4864⟩)))))) (.node (.node (.node (.node (.single ⟨17408,17536,27904,28032⟩) (.node (.single ⟨17408,17536,28032,28160⟩) (.single ⟨17536,17600,27904,27968⟩))) (.node (.single ⟨17536,17600,27968,28032⟩) (.node (.single ⟨17600,17632,27904,27936⟩) (.single ⟨17600,17632,27936,27968⟩)))) (.node (.node (.single ⟨17632,17664,27904,27936⟩) (.node (.single ⟨17632,17664,27936,27968⟩) (.single ⟨17600,17664,27968,28032⟩))) (.node (.node (.single ⟨17536,17600,28032,28096⟩) (.single ⟨17536,17600,28096,28160⟩)) (.node (.single ⟨17600,17664,28032,28096⟩) (.single ⟨17600,17664,28096,28160⟩))))) (.node (.node (.node (.single ⟨27904,28032,17408,17536⟩) (.node (.single ⟨27904,27968,17536,17600⟩) (.single ⟨27904,27936,17600,17632⟩))) (.node (.single ⟨27904,27936,17632,17664⟩) (.node (.single ⟨27936,27968,17600,17632⟩) (.single ⟨27936,27968,17632,17664⟩)))) (.node (.node (.single ⟨27968,28032,17536,17600⟩) (.node (.single ⟨27968,28032,17600,17664⟩) (.single ⟨28032,28160,17408,17536⟩))) (.node (.node (.single ⟨28032,28096,17536,17600⟩) (.single ⟨28032,28096,17600,17664⟩)) (.node (.single ⟨28096,28160,17536,17600⟩) (.single ⟨28096,28160,17600,17664⟩)))))))
def output63 : Fin 52 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData63 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover63 (i : Fin 52) : Fin 52 := ⟨coverData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 52) : Fin 52 := ⟨sourceData63.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 .empty (.cutY 14848 .empty (.cutX 4864 (.cutY 15104 .empty (.cutX 4736 (.cutY 15232 (.cutX 4672 (.cutY 15168 .full .full) (.cutY 15168 .full .full)) .full) (.cutY 15232 (.cutX 4800 (.cutY 15168 .full .full) (.cutY 15168 (.cutX 4832 (.cutY 15136 .full .full) (.cutY 15136 .full .full)) .full)) .full))) .empty))) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 .empty (.cutY 4608 .empty (.cutX 15104 .empty (.cutY 4864 (.cutX 15232 (.cutY 4736 (.cutX 15168 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 15168 (.cutY 4800 .full (.cutX 15136 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty)))) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 (.cutY 28160 (.cutX 17664 (.cutY 27904 .empty (.cutX 17536 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 17600 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 17632 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 17600 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty) .empty)))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 (.cutY 17920 (.cutX 27904 .empty (.cutY 17664 (.cutX 28032 (.cutY 17536 .full (.cutX 27968 (.cutY 17600 .full (.cutX 27936 (.cutY 17632 .full .full) (.cutY 17632 .full .full))) (.cutY 17600 .full .full))) (.cutY 17536 .full (.cutX 28096 (.cutY 17600 .full .full) (.cutY 17600 .full .full)))) .empty)) .empty) .empty))) .empty)) .empty) .empty) .empty))))

theorem metadata63 : 0<166308920 ∧ 18<128 ∧ 59<128 ∧ 1<4 ∧
    6199/4160=1 ∧ 6199%4160=2039 ∧ ∀ i, (leaves63 i).Valid 8 := by
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

noncomputable def phaseMass63 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 4596, atom 7936, type 1, source (44,80).
def leavesData64 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves64 : Fin 10 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 44 80 leaves64 i
def outputData64 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨11264,11392,20480,20608⟩) (.single ⟨11264,11392,20608,20736⟩)) (.node (.single ⟨11392,11456,20480,20544⟩) (.node (.single ⟨11392,11456,20544,20608⟩) (.single ⟨11456,11488,20480,20512⟩)))) (.node (.node (.single ⟨11456,11488,20512,20544⟩) (.single ⟨11488,11520,20480,20512⟩)) (.node (.single ⟨11488,11520,20512,20544⟩) (.node (.single ⟨11456,11520,20544,20608⟩) (.single ⟨11392,11520,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,21248,21376⟩) (.single ⟨12032,12160,21376,21504⟩)) (.node (.single ⟨12160,12224,21248,21312⟩) (.node (.single ⟨12160,12224,21312,21376⟩) (.single ⟨12224,12256,21248,21280⟩)))) (.node (.node (.single ⟨12224,12256,21280,21312⟩) (.single ⟨12256,12288,21248,21280⟩)) (.node (.single ⟨12256,12288,21280,21312⟩) (.node (.single ⟨12224,12288,21312,21376⟩) (.single ⟨12160,12288,21376,21504⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20608,11264,11392⟩) (.single ⟨20480,20544,11392,11456⟩)) (.node (.single ⟨20480,20512,11456,11488⟩) (.node (.single ⟨20480,20512,11488,11520⟩) (.single ⟨20512,20544,11456,11488⟩)))) (.node (.node (.single ⟨20512,20544,11488,11520⟩) (.single ⟨20544,20608,11392,11456⟩)) (.node (.single ⟨20544,20608,11456,11520⟩) (.node (.single ⟨20608,20736,11264,11392⟩) (.single ⟨20608,20736,11392,11520⟩))))) (.node (.node (.node (.single ⟨21248,21376,12032,12160⟩) (.single ⟨21248,21312,12160,12224⟩)) (.node (.single ⟨21248,21280,12224,12256⟩) (.node (.single ⟨21248,21280,12256,12288⟩) (.single ⟨21280,21312,12224,12256⟩)))) (.node (.node (.single ⟨21280,21312,12256,12288⟩) (.single ⟨21312,21376,12160,12224⟩)) (.node (.single ⟨21312,21376,12224,12288⟩) (.node (.single ⟨21376,21504,12032,12160⟩) (.single ⟨21376,21504,12160,12288⟩)))))))
def output64 : Fin 40 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData64 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover64 (i : Fin 40) : Fin 40 := ⟨coverData64.get i % 40, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 40) : Fin 40 := ⟨sourceData64.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 .empty (.cutY 21504 (.cutX 11776 (.cutY 20992 (.cutX 11520 (.cutY 20736 (.cutX 11392 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 11456 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 11488 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty) (.cutY 20992 .empty (.cutX 12032 .empty (.cutY 21248 .empty (.cutX 12160 (.cutY 21376 .full .full) (.cutY 21376 (.cutX 12224 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 12256 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full)))))) .empty)) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 .empty (.cutX 20992 (.cutY 11776 (.cutX 20736 (.cutY 11520 (.cutX 20608 (.cutY 11392 .full (.cutX 20544 (.cutY 11456 .full (.cutX 20512 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full .full)) .empty) .empty) .empty) (.cutY 11776 .empty (.cutX 21248 .empty (.cutY 12032 .empty (.cutX 21376 (.cutY 12160 .full (.cutX 21312 (.cutY 12224 .full (.cutX 21280 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full .full))))))) .empty)) .empty) .empty))) .empty) .empty))

theorem metadata64 : 0<56923454 ∧ 44<128 ∧ 80<128 ∧ 1<4 ∧
    7936/4160=1 ∧ 7936%4160=3776 ∧ ∀ i, (leaves64 i).Valid 8 := by
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 4597, atom 7757, type 1, source (40,77).
def leavesData65 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves65 : Fin 10 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 40 77 leaves65 i
def outputData65 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10240,10368,19712,19840⟩) (.single ⟨10240,10368,19840,19968⟩)) (.node (.single ⟨10368,10432,19712,19776⟩) (.node (.single ⟨10368,10432,19776,19840⟩) (.single ⟨10432,10464,19712,19744⟩)))) (.node (.node (.single ⟨10432,10464,19744,19776⟩) (.single ⟨10464,10496,19712,19744⟩)) (.node (.single ⟨10464,10496,19744,19776⟩) (.node (.single ⟨10432,10496,19776,19840⟩) (.single ⟨10368,10496,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,22272,22400⟩) (.single ⟨12800,12928,22400,22528⟩)) (.node (.single ⟨12928,12992,22272,22336⟩) (.node (.single ⟨12928,12992,22336,22400⟩) (.single ⟨12992,13024,22272,22304⟩)))) (.node (.node (.single ⟨12992,13024,22304,22336⟩) (.single ⟨13024,13056,22272,22304⟩)) (.node (.single ⟨13024,13056,22304,22336⟩) (.node (.single ⟨12992,13056,22336,22400⟩) (.single ⟨12928,13056,22400,22528⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19840,10240,10368⟩) (.single ⟨19712,19776,10368,10432⟩)) (.node (.single ⟨19712,19744,10432,10464⟩) (.node (.single ⟨19712,19744,10464,10496⟩) (.single ⟨19744,19776,10432,10464⟩)))) (.node (.node (.single ⟨19744,19776,10464,10496⟩) (.single ⟨19776,19840,10368,10432⟩)) (.node (.single ⟨19776,19840,10432,10496⟩) (.node (.single ⟨19840,19968,10240,10368⟩) (.single ⟨19840,19968,10368,10496⟩))))) (.node (.node (.node (.single ⟨22272,22400,12800,12928⟩) (.single ⟨22272,22336,12928,12992⟩)) (.node (.single ⟨22272,22304,12992,13024⟩) (.node (.single ⟨22272,22304,13024,13056⟩) (.single ⟨22304,22336,12992,13024⟩)))) (.node (.node (.single ⟨22304,22336,13024,13056⟩) (.single ⟨22336,22400,12928,12992⟩)) (.node (.single ⟨22336,22400,12992,13056⟩) (.node (.single ⟨22400,22528,12800,12928⟩) (.single ⟨22400,22528,12928,13056⟩)))))))
def output65 : Fin 40 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover65 (i : Fin 40) : Fin 40 := ⟨coverData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 40) : Fin 40 := ⟨sourceData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 (.cutY 19968 (.cutX 10496 (.cutY 19712 .empty (.cutX 10368 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 10432 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 10464 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 .empty (.cutY 22016 .empty (.cutX 13056 (.cutY 22272 .empty (.cutX 12928 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 12992 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 13024 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) .full))) .empty)))) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 (.cutY 10752 (.cutX 19712 .empty (.cutY 10496 (.cutX 19840 (.cutY 10368 .full (.cutX 19776 (.cutY 10432 .full (.cutX 19744 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 .empty (.cutY 12800 .empty (.cutX 22272 .empty (.cutY 13056 (.cutX 22400 (.cutY 12928 .full (.cutX 22336 (.cutY 12992 .full (.cutX 22304 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata65 : 0<177315334 ∧ 40<128 ∧ 77<128 ∧ 1<4 ∧
    7757/4160=1 ∧ 7757%4160=3597 ∧ ∀ i, (leaves65 i).Valid 8 := by
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 4598, atom 7302, type 1, source (32,70).
def leavesData66 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves66 : Fin 10 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 70 leaves66 i
def outputData66 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8320,17920,18048⟩) (.single ⟨8192,8320,18048,18176⟩)) (.node (.single ⟨8320,8384,17920,17984⟩) (.node (.single ⟨8320,8384,17984,18048⟩) (.single ⟨8384,8416,17920,17952⟩)))) (.node (.node (.single ⟨8384,8416,17952,17984⟩) (.single ⟨8416,8448,17920,17952⟩)) (.node (.single ⟨8416,8448,17952,17984⟩) (.node (.single ⟨8384,8448,17984,18048⟩) (.single ⟨8320,8448,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,24320,24448⟩) (.single ⟨14592,14720,24448,24576⟩)) (.node (.single ⟨14720,14784,24320,24384⟩) (.node (.single ⟨14720,14784,24384,24448⟩) (.single ⟨14784,14816,24320,24352⟩)))) (.node (.node (.single ⟨14784,14816,24352,24384⟩) (.single ⟨14816,14848,24320,24352⟩)) (.node (.single ⟨14816,14848,24352,24384⟩) (.node (.single ⟨14784,14848,24384,24448⟩) (.single ⟨14720,14848,24448,24576⟩)))))) (.node (.node (.node (.node (.single ⟨17920,18048,8192,8320⟩) (.single ⟨17920,17984,8320,8384⟩)) (.node (.single ⟨17920,17952,8384,8416⟩) (.node (.single ⟨17920,17952,8416,8448⟩) (.single ⟨17952,17984,8384,8416⟩)))) (.node (.node (.single ⟨17952,17984,8416,8448⟩) (.single ⟨17984,18048,8320,8384⟩)) (.node (.single ⟨17984,18048,8384,8448⟩) (.node (.single ⟨18048,18176,8192,8320⟩) (.single ⟨18048,18176,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,14592,14720⟩) (.single ⟨24320,24384,14720,14784⟩)) (.node (.single ⟨24320,24352,14784,14816⟩) (.node (.single ⟨24320,24352,14816,14848⟩) (.single ⟨24352,24384,14784,14816⟩)))) (.node (.node (.single ⟨24352,24384,14816,14848⟩) (.single ⟨24384,24448,14720,14784⟩)) (.node (.single ⟨24384,24448,14784,14848⟩) (.node (.single ⟨24448,24576,14592,14720⟩) (.single ⟨24448,24576,14720,14848⟩)))))))
def output66 : Fin 40 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData66 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover66 (i : Fin 40) : Fin 40 := ⟨coverData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 40) : Fin 40 := ⟨sourceData66.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 (.cutY 17920 .empty (.cutX 8448 (.cutY 18176 (.cutX 8320 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 8384 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 8416 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 (.cutY 24064 .empty (.cutX 14592 .empty (.cutY 24320 .empty (.cutX 14720 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 14784 (.cutY 24384 .full .full) (.cutY 24384 (.cutX 14816 (.cutY 24352 .full .full) (.cutY 24352 .full .full)) .full)) .full))))) .empty)) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 .empty (.cutY 8704 (.cutX 18176 (.cutY 8448 (.cutX 18048 (.cutY 8320 .full (.cutX 17984 (.cutY 8384 .full (.cutX 17952 (.cutY 8416 .full .full) (.cutY 8416 .full .full))) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 .empty (.cutY 14848 (.cutX 24320 .empty (.cutY 14592 .empty (.cutX 24448 (.cutY 14720 .full (.cutX 24384 (.cutY 14784 .full (.cutX 24352 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty)) .empty))))))) .empty) .empty))

theorem metadata66 : 0<182398684 ∧ 32<128 ∧ 70<128 ∧ 1<4 ∧
    7302/4160=1 ∧ 7302%4160=3142 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 4599, atom 7366, type 1, source (33,71).
def leavesData67 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves67 : Fin 7 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 33 71 leaves67 i
def outputData67 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8448,8576,18176,18304⟩) (.node (.single ⟨8448,8576,18304,18432⟩) (.single ⟨8576,8640,18176,18240⟩))) (.node (.node (.single ⟨8576,8640,18240,18304⟩) (.single ⟨8640,8704,18176,18240⟩)) (.node (.single ⟨8640,8704,18240,18304⟩) (.single ⟨8576,8704,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,24064,24192⟩) (.node (.single ⟨14336,14464,24192,24320⟩) (.single ⟨14464,14528,24064,24128⟩))) (.node (.node (.single ⟨14464,14528,24128,24192⟩) (.single ⟨14528,14592,24064,24128⟩)) (.node (.single ⟨14528,14592,24128,24192⟩) (.single ⟨14464,14592,24192,24320⟩))))) (.node (.node (.node (.single ⟨18176,18304,8448,8576⟩) (.node (.single ⟨18176,18240,8576,8640⟩) (.single ⟨18176,18240,8640,8704⟩))) (.node (.node (.single ⟨18240,18304,8576,8640⟩) (.single ⟨18240,18304,8640,8704⟩)) (.node (.single ⟨18304,18432,8448,8576⟩) (.single ⟨18304,18432,8576,8704⟩)))) (.node (.node (.single ⟨24064,24192,14336,14464⟩) (.node (.single ⟨24064,24128,14464,14528⟩) (.single ⟨24064,24128,14528,14592⟩))) (.node (.node (.single ⟨24128,24192,14464,14528⟩) (.single ⟨24128,24192,14528,14592⟩)) (.node (.single ⟨24192,24320,14336,14464⟩) (.single ⟨24192,24320,14464,14592⟩))))))
def output67 : Fin 28 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData67 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover67 (i : Fin 28) : Fin 28 := ⟨coverData67.get i % 28, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 28) : Fin 28 := ⟨sourceData67.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 (.cutX 9216 (.cutY 17408 .empty (.cutX 8704 (.cutY 17920 .empty (.cutX 8448 .empty (.cutY 18176 .empty (.cutX 8576 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 8640 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty)) .empty) .empty) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 .empty (.cutY 22528 .empty (.cutX 15360 (.cutY 23552 .empty (.cutX 14848 (.cutY 24064 .empty (.cutX 14592 (.cutY 24320 (.cutX 14464 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 14528 (.cutY 24128 .full .full) (.cutY 24128 .full .full)) .full)) .empty) .empty)) .empty)) .empty))))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 (.cutY 10240 (.cutX 17408 .empty (.cutY 9216 (.cutX 17920 .empty (.cutY 8704 (.cutX 18176 .empty (.cutY 8448 .empty (.cutX 18304 (.cutY 8576 .full (.cutX 18240 (.cutY 8640 .full .full) (.cutY 8640 .full .full))) (.cutY 8576 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 .empty (.cutX 23552 .empty (.cutY 15360 (.cutX 24064 .empty (.cutY 14848 (.cutX 24320 (.cutY 14592 (.cutX 24192 (.cutY 14464 .full (.cutX 24128 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty))))))) .empty) .empty))

theorem metadata67 : 0<182398684 ∧ 33<128 ∧ 71<128 ∧ 1<4 ∧
    7366/4160=1 ∧ 7366%4160=3206 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (182398684/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (45599671/409600000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 4600, atom 552, type 0, source (4,56).
def leavesData68 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves68 : Fin 4 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 4 56 leaves68 i
def outputData68 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1024,1152,14336,14464⟩) (.single ⟨1024,1152,14464,14592⟩)) (.node (.single ⟨1152,1280,14336,14464⟩) (.single ⟨1152,1280,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,1024,1152⟩) (.single ⟨14336,14464,1152,1280⟩)) (.node (.single ⟨14464,14592,1024,1152⟩) (.single ⟨14464,14592,1152,1280⟩)))) (.node (.node (.node (.single ⟨18176,18304,31488,31616⟩) (.single ⟨18176,18304,31616,31744⟩)) (.node (.single ⟨18304,18432,31488,31616⟩) (.single ⟨18304,18432,31616,31744⟩))) (.node (.node (.single ⟨31488,31616,18176,18304⟩) (.single ⟨31488,31616,18304,18432⟩)) (.node (.single ⟨31616,31744,18176,18304⟩) (.single ⟨31616,31744,18304,18432⟩)))))
def output68 : Fin 16 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData68 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover68 (i : Fin 16) : Fin 16 := ⟨coverData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 16) : Fin 16 := ⟨sourceData68.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 (.cutY 14848 (.cutX 1280 (.cutY 14592 (.cutX 1152 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 (.cutX 14592 (.cutY 1280 (.cutX 14464 (.cutY 1152 .full .full) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 .empty (.cutX 18176 .empty (.cutY 31488 .empty (.cutX 18304 (.cutY 31616 .full .full) (.cutY 31616 .full .full)))))) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 .empty (.cutY 17920 .empty (.cutX 31488 .empty (.cutY 18176 .empty (.cutX 31616 (.cutY 18304 .full .full) (.cutY 18304 .full .full))))))) .empty) .empty)) .empty)) .empty))))

theorem metadata68 : 0<89519217 ∧ 4<128 ∧ 56<128 ∧ 0<4 ∧
    552/4160=0 ∧ 552%4160=552 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

-- Frozen phase 4601, atom 2043, type 0, source (18,63).
def leavesData69 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves69 : Fin 4 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 18 63 leaves69 i
def outputData69 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4608,4736,16128,16256⟩) (.single ⟨4608,4736,16256,16384⟩)) (.node (.single ⟨4736,4864,16128,16256⟩) (.single ⟨4736,4864,16256,16384⟩))) (.node (.node (.single ⟨16128,16256,4608,4736⟩) (.single ⟨16128,16256,4736,4864⟩)) (.node (.single ⟨16256,16384,4608,4736⟩) (.single ⟨16256,16384,4736,4864⟩)))) (.node (.node (.node (.single ⟨16384,16512,27904,28032⟩) (.single ⟨16384,16512,28032,28160⟩)) (.node (.single ⟨16512,16640,27904,28032⟩) (.single ⟨16512,16640,28032,28160⟩))) (.node (.node (.single ⟨27904,28032,16384,16512⟩) (.single ⟨27904,28032,16512,16640⟩)) (.node (.single ⟨28032,28160,16384,16512⟩) (.single ⟨28032,28160,16512,16640⟩)))))
def output69 : Fin 16 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData69 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover69 (i : Fin 16) : Fin 16 := ⟨coverData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 16) : Fin 16 := ⟨sourceData69.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 .empty (.cutY 15872 .empty (.cutX 4864 (.cutY 16128 .empty (.cutX 4736 (.cutY 16256 .full .full) (.cutY 16256 .full .full))) .empty)))) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 .empty (.cutY 4608 .empty (.cutX 16128 .empty (.cutY 4864 (.cutX 16256 (.cutY 4736 .full .full) (.cutY 4736 .full .full)) .empty)))) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 (.cutY 28160 (.cutX 16640 (.cutY 27904 .empty (.cutX 16512 (.cutY 28032 .full .full) (.cutY 28032 .full .full))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 (.cutY 16896 (.cutX 27904 .empty (.cutY 16640 (.cutX 28032 (.cutY 16512 .full .full) (.cutY 16512 .full .full)) .empty)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata69 : 0<185830537 ∧ 18<128 ∧ 63<128 ∧ 0<4 ∧
    2043/4160=0 ∧ 2043%4160=2043 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 4602, atom 1756, type 0, source (15,61).
def leavesData70 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves70 : Fin 4 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 15 61 leaves70 i
def outputData70 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3840,3968,15616,15744⟩) (.single ⟨3840,3968,15744,15872⟩)) (.node (.single ⟨3968,4096,15616,15744⟩) (.single ⟨3968,4096,15744,15872⟩))) (.node (.node (.single ⟨15616,15744,3840,3968⟩) (.single ⟨15616,15744,3968,4096⟩)) (.node (.single ⟨15744,15872,3840,3968⟩) (.single ⟨15744,15872,3968,4096⟩)))) (.node (.node (.node (.single ⟨16896,17024,28672,28800⟩) (.single ⟨16896,17024,28800,28928⟩)) (.node (.single ⟨17024,17152,28672,28800⟩) (.single ⟨17024,17152,28800,28928⟩))) (.node (.node (.single ⟨28672,28800,16896,17024⟩) (.single ⟨28672,28800,17024,17152⟩)) (.node (.single ⟨28800,28928,16896,17024⟩) (.single ⟨28800,28928,17024,17152⟩)))))
def output70 : Fin 16 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData70 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover70 (i : Fin 16) : Fin 16 := ⟨coverData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 16) : Fin 16 := ⟨sourceData70.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 .empty (.cutY 15872 (.cutX 3840 .empty (.cutY 15616 .empty (.cutX 3968 (.cutY 15744 .full .full) (.cutY 15744 .full .full)))) .empty))))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 .empty (.cutX 15616 .empty (.cutY 3840 .empty (.cutX 15744 (.cutY 3968 .full .full) (.cutY 3968 .full .full))))) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 (.cutX 17152 (.cutY 28928 (.cutX 17024 (.cutY 28800 .full .full) (.cutY 28800 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 (.cutY 16896 .empty (.cutX 28928 (.cutY 17152 (.cutX 28800 (.cutY 17024 .full .full) (.cutY 17024 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata70 : 0<116912559 ∧ 15<128 ∧ 61<128 ∧ 0<4 ∧
    1756/4160=0 ∧ 1756%4160=1756 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 4603, atom 1451, type 0, source (12,59).
def leavesData71 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves71 : Fin 4 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 59 leaves71 i
def outputData71 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,15104,15232⟩) (.single ⟨3072,3200,15232,15360⟩)) (.node (.single ⟨3200,3328,15104,15232⟩) (.single ⟨3200,3328,15232,15360⟩))) (.node (.node (.single ⟨15104,15232,3072,3200⟩) (.single ⟨15104,15232,3200,3328⟩)) (.node (.single ⟨15232,15360,3072,3200⟩) (.single ⟨15232,15360,3200,3328⟩)))) (.node (.node (.node (.single ⟨17408,17536,29440,29568⟩) (.single ⟨17408,17536,29568,29696⟩)) (.node (.single ⟨17536,17664,29440,29568⟩) (.single ⟨17536,17664,29568,29696⟩))) (.node (.node (.single ⟨29440,29568,17408,17536⟩) (.single ⟨29440,29568,17536,17664⟩)) (.node (.single ⟨29568,29696,17408,17536⟩) (.single ⟨29568,29696,17536,17664⟩)))))
def output71 : Fin 16 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData71 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover71 (i : Fin 16) : Fin 16 := ⟨coverData71.get i % 16, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 16) : Fin 16 := ⟨sourceData71.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 (.cutX 3584 (.cutY 14848 .empty (.cutX 3328 (.cutY 15104 .empty (.cutX 3200 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty)) .empty) .empty))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 .empty (.cutX 14848 .empty (.cutY 3584 (.cutX 15104 .empty (.cutY 3328 (.cutX 15232 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty)) .empty))) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 (.cutX 17920 (.cutY 29184 .empty (.cutX 17664 (.cutY 29440 .empty (.cutX 17536 (.cutY 29568 .full .full) (.cutY 29568 .full .full))) .empty)) .empty) .empty)) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 .empty (.cutX 29184 .empty (.cutY 17920 (.cutX 29440 .empty (.cutY 17664 (.cutX 29568 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty))) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata71 : 0<116912559 ∧ 12<128 ∧ 59<128 ∧ 0<4 ∧
    1451/4160=0 ∧ 1451%4160=1451 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 4604, atom 1238, type 0, source (10,58).
def leavesData72 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves72 : Fin 4 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 10 58 leaves72 i
def outputData72 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2560,2688,14848,14976⟩) (.single ⟨2560,2688,14976,15104⟩)) (.node (.single ⟨2688,2816,14848,14976⟩) (.single ⟨2688,2816,14976,15104⟩))) (.node (.node (.single ⟨14848,14976,2560,2688⟩) (.single ⟨14848,14976,2688,2816⟩)) (.node (.single ⟨14976,15104,2560,2688⟩) (.single ⟨14976,15104,2688,2816⟩)))) (.node (.node (.node (.single ⟨17664,17792,29952,30080⟩) (.single ⟨17664,17792,30080,30208⟩)) (.node (.single ⟨17792,17920,29952,30080⟩) (.single ⟨17792,17920,30080,30208⟩))) (.node (.node (.single ⟨29952,30080,17664,17792⟩) (.single ⟨29952,30080,17792,17920⟩)) (.node (.single ⟨30080,30208,17664,17792⟩) (.single ⟨30080,30208,17792,17920⟩)))))
def output72 : Fin 16 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData72 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover72 (i : Fin 16) : Fin 16 := ⟨coverData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 16) : Fin 16 := ⟨sourceData72.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 (.cutY 15360 (.cutX 2560 .empty (.cutY 14848 .empty (.cutX 2816 (.cutY 15104 (.cutX 2688 (.cutY 14976 .full .full) (.cutY 14976 .full .full)) .empty) .empty))) .empty) .empty)))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 (.cutX 14848 .empty (.cutY 2560 .empty (.cutX 15104 (.cutY 2816 (.cutX 14976 (.cutY 2688 .full .full) (.cutY 2688 .full .full)) .empty) .empty))) .empty) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 .empty (.cutX 17920 (.cutY 30208 (.cutX 17664 .empty (.cutY 29952 .empty (.cutX 17792 (.cutY 30080 .full .full) (.cutY 30080 .full .full)))) .empty) .empty))) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 .empty (.cutY 17408 .empty (.cutX 30208 (.cutY 17920 (.cutX 29952 .empty (.cutY 17664 .empty (.cutX 30080 (.cutY 17792 .full .full) (.cutY 17792 .full .full)))) .empty) .empty))) .empty) .empty) .empty)) .empty))))

theorem metadata72 : 0<116912559 ∧ 10<128 ∧ 58<128 ∧ 0<4 ∧
    1238/4160=0 ∧ 1238%4160=1238 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 4605, atom 6798, type 1, source (25,63).
def leavesData73 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves73 : Fin 19 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 25 63 leaves73 i
def outputData73 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨6400,6464,16128,16192⟩) (.single ⟨6400,6464,16192,16256⟩)) (.node (.single ⟨6464,6528,16128,16192⟩) (.single ⟨6464,6528,16192,16256⟩))) (.node (.node (.single ⟨6400,6528,16256,16384⟩) (.single ⟨6528,6592,16128,16192⟩)) (.node (.single ⟨6528,6592,16192,16256⟩) (.node (.single ⟨6592,6624,16128,16160⟩) (.single ⟨6592,6624,16160,16192⟩))))) (.node (.node (.node (.single ⟨6624,6640,16128,16144⟩) (.single ⟨6624,6640,16144,16160⟩)) (.node (.single ⟨6640,6656,16128,16144⟩) (.node (.single ⟨6640,6656,16144,16160⟩) (.single ⟨6624,6656,16160,16192⟩)))) (.node (.node (.single ⟨6592,6656,16192,16256⟩) (.single ⟨6528,6592,16256,16320⟩)) (.node (.single ⟨6528,6592,16320,16384⟩) (.node (.single ⟨6592,6656,16256,16320⟩) (.single ⟨6592,6656,16320,16384⟩)))))) (.node (.node (.node (.node (.single ⟨16128,16192,6400,6464⟩) (.single ⟨16128,16192,6464,6528⟩)) (.node (.single ⟨16192,16256,6400,6464⟩) (.single ⟨16192,16256,6464,6528⟩))) (.node (.node (.single ⟨16128,16192,6528,6592⟩) (.single ⟨16128,16160,6592,6624⟩)) (.node (.single ⟨16128,16144,6624,6640⟩) (.node (.single ⟨16128,16144,6640,6656⟩) (.single ⟨16144,16160,6624,6640⟩))))) (.node (.node (.node (.single ⟨16144,16160,6640,6656⟩) (.single ⟨16160,16192,6592,6624⟩)) (.node (.single ⟨16160,16192,6624,6656⟩) (.node (.single ⟨16192,16256,6528,6592⟩) (.single ⟨16192,16256,6592,6656⟩)))) (.node (.node (.single ⟨16256,16384,6400,6528⟩) (.single ⟨16256,16320,6528,6592⟩)) (.node (.single ⟨16256,16320,6592,6656⟩) (.node (.single ⟨16320,16384,6528,6592⟩) (.single ⟨16320,16384,6592,6656⟩))))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,26112,26176⟩) (.single ⟨16384,16448,26176,26240⟩)) (.node (.single ⟨16448,16512,26112,26176⟩) (.single ⟨16448,16512,26176,26240⟩))) (.node (.node (.single ⟨16384,16512,26240,26368⟩) (.single ⟨16512,16576,26112,26176⟩)) (.node (.single ⟨16512,16576,26176,26240⟩) (.node (.single ⟨16576,16608,26112,26144⟩) (.single ⟨16576,16608,26144,26176⟩))))) (.node (.node (.node (.single ⟨16608,16624,26112,26128⟩) (.single ⟨16608,16624,26128,26144⟩)) (.node (.single ⟨16624,16640,26112,26128⟩) (.node (.single ⟨16624,16640,26128,26144⟩) (.single ⟨16608,16640,26144,26176⟩)))) (.node (.node (.single ⟨16576,16640,26176,26240⟩) (.single ⟨16512,16576,26240,26304⟩)) (.node (.single ⟨16512,16576,26304,26368⟩) (.node (.single ⟨16576,16640,26240,26304⟩) (.single ⟨16576,16640,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨26112,26176,16384,16448⟩) (.single ⟨26112,26176,16448,16512⟩)) (.node (.single ⟨26176,26240,16384,16448⟩) (.single ⟨26176,26240,16448,16512⟩))) (.node (.node (.single ⟨26112,26176,16512,16576⟩) (.single ⟨26112,26144,16576,16608⟩)) (.node (.single ⟨26112,26128,16608,16624⟩) (.node (.single ⟨26112,26128,16624,16640⟩) (.single ⟨26128,26144,16608,16624⟩))))) (.node (.node (.node (.single ⟨26128,26144,16624,16640⟩) (.single ⟨26144,26176,16576,16608⟩)) (.node (.single ⟨26144,26176,16608,16640⟩) (.node (.single ⟨26176,26240,16512,16576⟩) (.single ⟨26176,26240,16576,16640⟩)))) (.node (.node (.single ⟨26240,26368,16384,16512⟩) (.single ⟨26240,26304,16512,16576⟩)) (.node (.single ⟨26240,26304,16576,16640⟩) (.node (.single ⟨26304,26368,16512,16576⟩) (.single ⟨26304,26368,16576,16640⟩))))))))
def output73 : Fin 76 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 33)) (.node (.single 71) (.single 42))) (.node (.node (.single 0) (.single 19)) (.node (.single 75) (.node (.single 56) (.single 1))))) (.node (.node (.node (.single 21) (.single 74)) (.node (.single 54) (.node (.single 2) (.single 20)))) (.node (.node (.single 73) (.single 55)) (.node (.single 3) (.node (.single 22) (.single 72)))))) (.node (.node (.node (.node (.single 53) (.single 5)) (.node (.single 23) (.single 70))) (.node (.node (.single 52) (.single 6)) (.node (.single 31) (.node (.single 69) (.single 44))))) (.node (.node (.node (.single 15) (.single 34)) (.node (.single 60) (.node (.single 41) (.single 16)))) (.node (.node (.single 36) (.single 59)) (.node (.single 39) (.node (.single 14) (.single 32))))))) (.node (.node (.node (.node (.node (.single 61) (.single 43)) (.node (.single 17) (.single 35))) (.node (.node (.single 58) (.single 40)) (.node (.single 18) (.node (.single 37) (.single 57))))) (.node (.node (.node (.single 38) (.single 7)) (.node (.single 24) (.node (.single 68) (.single 51)))) (.node (.node (.single 8) (.single 29)) (.node (.single 67) (.node (.single 46) (.single 13)))))) (.node (.node (.node (.node (.single 30) (.single 62)) (.node (.single 45) (.single 9))) (.node (.node (.single 25) (.single 66)) (.node (.single 50) (.node (.single 10) (.single 27))))) (.node (.node (.node (.single 65) (.single 48)) (.node (.single 11) (.node (.single 26) (.single 64)))) (.node (.node (.single 49) (.single 12)) (.node (.single 28) (.node (.single 63) (.single 47))))))))
def sourceData73 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.node (.single 48) (.single 52))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 56)))) (.node (.node (.single 36) (.single 28)) (.node (.single 32) (.node (.single 40) (.single 44)))))) (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 61) (.node (.single 69) (.single 65))))) (.node (.node (.node (.single 73) (.single 53)) (.node (.single 57) (.node (.single 25) (.single 37)))) (.node (.node (.single 1) (.single 29)) (.node (.single 41) (.node (.single 33) (.single 45))))))) (.node (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.node (.single 59) (.single 55))))) (.node (.node (.node (.single 75) (.single 67)) (.node (.single 71) (.node (.single 63) (.single 51)))) (.node (.node (.single 23) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 58)) (.node (.single 74) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.single 54)) (.node (.single 50) (.node (.single 26) (.single 22)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover73 (i : Fin 76) : Fin 76 := ⟨coverData73.get i % 76, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 76) : Fin 76 := ⟨sourceData73.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 (.cutY 15872 .empty (.cutX 6400 .empty (.cutY 16128 .empty (.cutX 6528 (.cutY 16256 (.cutX 6464 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 6592 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 6624 (.cutY 16160 .full .full) (.cutY 16160 (.cutX 6640 (.cutY 16144 .full .full) (.cutY 16144 .full .full)) .full)) .full)) (.cutX 6592 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))))) .empty)) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 .empty (.cutY 6656 (.cutX 16128 .empty (.cutY 6400 .empty (.cutX 16256 (.cutY 6528 (.cutX 16192 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 16192 (.cutY 6592 .full (.cutX 16160 (.cutY 6624 .full (.cutX 16144 (.cutY 6640 .full .full) (.cutY 6640 .full .full))) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full (.cutX 16320 (.cutY 6592 .full .full) (.cutY 6592 .full .full)))))) .empty)) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 (.cutY 26112 .empty (.cutX 16640 (.cutY 26368 (.cutX 16512 (.cutY 26240 (.cutX 16448 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full) (.cutY 26240 (.cutX 16576 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 16608 (.cutY 26144 .full .full) (.cutY 26144 (.cutX 16624 (.cutY 26128 .full .full) (.cutY 26128 .full .full)) .full)) .full)) (.cutX 16576 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 .empty (.cutY 16896 (.cutX 26368 (.cutY 16640 (.cutX 26240 (.cutY 16512 (.cutX 26176 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) (.cutX 26176 (.cutY 16576 .full (.cutX 26144 (.cutY 16608 .full (.cutX 26128 (.cutY 16624 .full .full) (.cutY 16624 .full .full))) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 26304 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata73 : 0<69455300 ∧ 25<128 ∧ 63<128 ∧ 1<4 ∧
    6798/4160=1 ∧ 6798%4160=2638 ∧ ∀ i, (leaves73 i).Valid 8 := by
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (694553/16384000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 4606, atom 5285, type 1, source (9,54).
def leavesData74 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves74 : Fin 19 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 9 54 leaves74 i
def outputData74 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨2304,2368,13824,13888⟩) (.single ⟨2304,2368,13888,13952⟩)) (.node (.single ⟨2368,2432,13824,13888⟩) (.single ⟨2368,2432,13888,13952⟩))) (.node (.node (.single ⟨2304,2432,13952,14080⟩) (.single ⟨2432,2464,13824,13856⟩)) (.node (.single ⟨2432,2464,13856,13888⟩) (.node (.single ⟨2464,2496,13824,13856⟩) (.single ⟨2464,2496,13856,13888⟩))))) (.node (.node (.node (.single ⟨2432,2496,13888,13952⟩) (.single ⟨2496,2528,13824,13856⟩)) (.node (.single ⟨2496,2528,13856,13888⟩) (.node (.single ⟨2528,2544,13824,13840⟩) (.single ⟨2528,2544,13840,13856⟩)))) (.node (.node (.single ⟨2544,2560,13824,13840⟩) (.single ⟨2544,2560,13840,13856⟩)) (.node (.single ⟨2528,2560,13856,13888⟩) (.node (.single ⟨2496,2560,13888,13952⟩) (.single ⟨2432,2560,13952,14080⟩)))))) (.node (.node (.node (.node (.single ⟨13824,13888,2304,2368⟩) (.single ⟨13824,13888,2368,2432⟩)) (.node (.single ⟨13888,13952,2304,2368⟩) (.single ⟨13888,13952,2368,2432⟩))) (.node (.node (.single ⟨13824,13856,2432,2464⟩) (.single ⟨13824,13856,2464,2496⟩)) (.node (.single ⟨13856,13888,2432,2464⟩) (.node (.single ⟨13856,13888,2464,2496⟩) (.single ⟨13824,13856,2496,2528⟩))))) (.node (.node (.node (.single ⟨13824,13840,2528,2544⟩) (.single ⟨13824,13840,2544,2560⟩)) (.node (.single ⟨13840,13856,2528,2544⟩) (.node (.single ⟨13840,13856,2544,2560⟩) (.single ⟨13856,13888,2496,2528⟩)))) (.node (.node (.single ⟨13856,13888,2528,2560⟩) (.single ⟨13888,13952,2432,2496⟩)) (.node (.single ⟨13888,13952,2496,2560⟩) (.node (.single ⟨13952,14080,2304,2432⟩) (.single ⟨13952,14080,2432,2560⟩))))))) (.node (.node (.node (.node (.node (.single ⟨18688,18816,30208,30336⟩) (.single ⟨18688,18816,30336,30464⟩)) (.node (.single ⟨18816,18880,30208,30272⟩) (.single ⟨18816,18880,30272,30336⟩))) (.node (.node (.single ⟨18880,18912,30208,30240⟩) (.single ⟨18880,18912,30240,30272⟩)) (.node (.single ⟨18912,18928,30208,30224⟩) (.node (.single ⟨18912,18928,30224,30240⟩) (.single ⟨18928,18944,30208,30224⟩))))) (.node (.node (.node (.single ⟨18928,18944,30224,30240⟩) (.single ⟨18912,18944,30240,30272⟩)) (.node (.single ⟨18880,18912,30272,30304⟩) (.node (.single ⟨18880,18912,30304,30336⟩) (.single ⟨18912,18944,30272,30304⟩)))) (.node (.node (.single ⟨18912,18944,30304,30336⟩) (.single ⟨18816,18880,30336,30400⟩)) (.node (.single ⟨18816,18880,30400,30464⟩) (.node (.single ⟨18880,18944,30336,30400⟩) (.single ⟨18880,18944,30400,30464⟩)))))) (.node (.node (.node (.node (.single ⟨30208,30336,18688,18816⟩) (.single ⟨30208,30272,18816,18880⟩)) (.node (.single ⟨30208,30240,18880,18912⟩) (.single ⟨30208,30224,18912,18928⟩))) (.node (.node (.single ⟨30208,30224,18928,18944⟩) (.single ⟨30224,30240,18912,18928⟩)) (.node (.single ⟨30224,30240,18928,18944⟩) (.node (.single ⟨30240,30272,18880,18912⟩) (.single ⟨30240,30272,18912,18944⟩))))) (.node (.node (.node (.single ⟨30272,30336,18816,18880⟩) (.single ⟨30272,30304,18880,18912⟩)) (.node (.single ⟨30272,30304,18912,18944⟩) (.node (.single ⟨30304,30336,18880,18912⟩) (.single ⟨30304,30336,18912,18944⟩)))) (.node (.node (.single ⟨30336,30464,18688,18816⟩) (.single ⟨30336,30400,18816,18880⟩)) (.node (.single ⟨30336,30400,18880,18944⟩) (.node (.single ⟨30400,30464,18816,18880⟩) (.single ⟨30400,30464,18880,18944⟩))))))))
def output74 : Fin 76 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 36)) (.node (.single 71) (.single 39))) (.node (.node (.single 18) (.single 37)) (.node (.single 57) (.node (.single 38) (.single 0))))) (.node (.node (.node (.single 19) (.single 75)) (.node (.single 56) (.node (.single 1) (.single 21)))) (.node (.node (.single 74) (.single 54)) (.node (.single 2) (.node (.single 20) (.single 73)))))) (.node (.node (.node (.node (.single 55) (.single 3)) (.node (.single 22) (.single 72))) (.node (.node (.single 53) (.single 9)) (.node (.single 34) (.node (.single 66) (.single 41))))) (.node (.node (.node (.single 17) (.single 35)) (.node (.single 58) (.node (.single 40) (.single 10)))) (.node (.node (.single 27) (.single 65)) (.node (.single 48) (.node (.single 11) (.single 32))))))) (.node (.node (.node (.node (.node (.single 64) (.single 43)) (.node (.single 16) (.single 33))) (.node (.node (.single 59) (.single 42)) (.node (.single 5) (.node (.single 23) (.single 70))))) (.node (.node (.node (.single 52) (.single 6)) (.node (.single 25) (.node (.single 69) (.single 50)))) (.node (.node (.single 7) (.single 24)) (.node (.single 68) (.node (.single 51) (.single 8)))))) (.node (.node (.node (.node (.single 26) (.single 67)) (.node (.single 49) (.single 12))) (.node (.node (.single 28) (.single 63)) (.node (.single 47) (.node (.single 13) (.single 30))))) (.node (.node (.node (.single 62) (.single 45)) (.node (.single 14) (.node (.single 29) (.single 61)))) (.node (.node (.single 46) (.single 15)) (.node (.single 31) (.node (.single 60) (.single 44))))))))
def sourceData74 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 24) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 28) (.single 4)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 25)) (.node (.single 29) (.node (.single 1) (.single 5))))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 26) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10))))))))
def cover74 (i : Fin 76) : Fin 76 := ⟨coverData74.get i % 76, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 76) : Fin 76 := ⟨sourceData74.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 (.cutY 13824 .empty (.cutX 2304 .empty (.cutY 14080 (.cutX 2432 (.cutY 13952 (.cutX 2368 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full) (.cutY 13952 (.cutX 2496 (.cutY 13888 (.cutX 2464 (.cutY 13856 .full .full) (.cutY 13856 .full .full)) .full) (.cutY 13888 (.cutX 2528 (.cutY 13856 .full .full) (.cutY 13856 (.cutX 2544 (.cutY 13840 .full .full) (.cutY 13840 .full .full)) .full)) .full)) .full)) .empty))) .empty)) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 .empty (.cutY 2560 (.cutX 14080 (.cutY 2304 .empty (.cutX 13952 (.cutY 2432 (.cutX 13888 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 13888 (.cutY 2496 (.cutX 13856 (.cutY 2464 .full .full) (.cutY 2464 .full .full)) (.cutX 13856 (.cutY 2528 .full (.cutX 13840 (.cutY 2544 .full .full) (.cutY 2544 .full .full))) (.cutY 2528 .full .full))) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty)) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 (.cutY 30208 .empty (.cutX 18688 .empty (.cutY 30464 (.cutX 18816 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 18880 (.cutY 30272 .full .full) (.cutY 30272 (.cutX 18912 (.cutY 30240 .full .full) (.cutY 30240 (.cutX 18928 (.cutY 30224 .full .full) (.cutY 30224 .full .full)) .full)) (.cutX 18912 (.cutY 30304 .full .full) (.cutY 30304 .full .full)))) (.cutX 18880 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty))) .empty)) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 .empty (.cutY 18944 (.cutX 30464 (.cutY 18688 .empty (.cutX 30336 (.cutY 18816 .full (.cutX 30272 (.cutY 18880 .full (.cutX 30240 (.cutY 18912 .full (.cutX 30224 (.cutY 18928 .full .full) (.cutY 18928 .full .full))) (.cutY 18912 .full .full))) (.cutY 18880 .full (.cutX 30304 (.cutY 18912 .full .full) (.cutY 18912 .full .full))))) (.cutY 18816 .full (.cutX 30400 (.cutY 18880 .full .full) (.cutY 18880 .full .full))))) .empty) .empty)) .empty))) .empty) .empty)) .empty))))

theorem metadata74 : 0<144841863 ∧ 9<128 ∧ 54<128 ∧ 1<4 ∧
    5285/4160=1 ∧ 5285%4160=1125 ∧ ∀ i, (leaves74 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData74).mp
    (by decide +kernel)

theorem sourceChecked74_0 : ∀ i : Fin 64,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked74_64 : ∀ i : Fin 12,
    (fun i => output74 i = raw74 (source74 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked74 : ∀ i : Fin 76, (fun i => output74 i = raw74 (source74 i)) i :=
  forallFin_of_zero_offset (fun i => output74 i = raw74 (source74 i)) (forallFinOffset_add (fun i => output74 i = raw74 (source74 i)) 0 64 12 (by decide) sourceChecked74_0
    sourceChecked74_64)

theorem coverChecked74_0 : ∀ i : Fin 64,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked74_64 : ∀ i : Fin 12,
    (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked74 : ∀ i : Fin 76, (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) i :=
  forallFin_of_zero_offset (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) (forallFinOffset_add (fun i => (output74 (cover74 i)).ContainsBox (raw74 i)) 0 64 12 (by decide) coverChecked74_0
    coverChecked74_64)

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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 4607, atom 6468, type 1, source (21,61).
def leavesData75 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves75 : Fin 13 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 61 leaves75 i
def outputData75 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,15616,15680⟩) (.node (.single ⟨5376,5440,15680,15744⟩) (.single ⟨5440,5504,15616,15680⟩))) (.node (.single ⟨5440,5504,15680,15744⟩) (.node (.single ⟨5376,5504,15744,15872⟩) (.single ⟨5504,5568,15616,15680⟩)))) (.node (.node (.single ⟨5504,5568,15680,15744⟩) (.node (.single ⟨5568,5600,15616,15648⟩) (.single ⟨5568,5600,15648,15680⟩))) (.node (.node (.single ⟨5600,5632,15616,15648⟩) (.single ⟨5600,5632,15648,15680⟩)) (.node (.single ⟨5568,5632,15680,15744⟩) (.single ⟨5504,5632,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15680,5376,5440⟩) (.node (.single ⟨15616,15680,5440,5504⟩) (.single ⟨15680,15744,5376,5440⟩))) (.node (.single ⟨15680,15744,5440,5504⟩) (.node (.single ⟨15616,15680,5504,5568⟩) (.single ⟨15616,15648,5568,5600⟩)))) (.node (.node (.single ⟨15616,15648,5600,5632⟩) (.node (.single ⟨15648,15680,5568,5600⟩) (.single ⟨15648,15680,5600,5632⟩))) (.node (.node (.single ⟨15680,15744,5504,5568⟩) (.single ⟨15680,15744,5568,5632⟩)) (.node (.single ⟨15744,15872,5376,5504⟩) (.single ⟨15744,15872,5504,5632⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,27136,27264⟩) (.node (.single ⟨16896,17024,27264,27392⟩) (.single ⟨17024,17088,27136,27200⟩))) (.node (.single ⟨17024,17088,27200,27264⟩) (.node (.single ⟨17088,17120,27136,27168⟩) (.single ⟨17088,17120,27168,27200⟩)))) (.node (.node (.single ⟨17120,17152,27136,27168⟩) (.node (.single ⟨17120,17152,27168,27200⟩) (.single ⟨17088,17152,27200,27264⟩))) (.node (.node (.single ⟨17024,17088,27264,27328⟩) (.single ⟨17024,17088,27328,27392⟩)) (.node (.single ⟨17088,17152,27264,27328⟩) (.single ⟨17088,17152,27328,27392⟩))))) (.node (.node (.node (.single ⟨27136,27264,16896,17024⟩) (.node (.single ⟨27136,27200,17024,17088⟩) (.single ⟨27136,27168,17088,17120⟩))) (.node (.single ⟨27136,27168,17120,17152⟩) (.node (.single ⟨27168,27200,17088,17120⟩) (.single ⟨27168,27200,17120,17152⟩)))) (.node (.node (.single ⟨27200,27264,17024,17088⟩) (.node (.single ⟨27200,27264,17088,17152⟩) (.single ⟨27264,27392,16896,17024⟩))) (.node (.node (.single ⟨27264,27328,17024,17088⟩) (.single ⟨27264,27328,17088,17152⟩)) (.node (.single ⟨27328,27392,17024,17088⟩) (.single ⟨27328,27392,17088,17152⟩)))))))
def output75 : Fin 52 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData75 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover75 (i : Fin 52) : Fin 52 := ⟨coverData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 52) : Fin 52 := ⟨sourceData75.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 (.cutY 15872 (.cutX 5376 .empty (.cutY 15616 .empty (.cutX 5504 (.cutY 15744 (.cutX 5440 (.cutY 15680 .full .full) (.cutY 15680 .full .full)) .full) (.cutY 15744 (.cutX 5568 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 5600 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full)))) .empty) .empty)))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 (.cutY 5632 (.cutX 15616 .empty (.cutY 5376 .empty (.cutX 15744 (.cutY 5504 (.cutX 15680 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 15680 (.cutY 5568 .full (.cutX 15648 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty) .empty))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 .empty (.cutY 27136 .empty (.cutX 17152 (.cutY 27392 (.cutX 17024 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 17088 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 17120 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 17088 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty))) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 .empty (.cutY 16896 .empty (.cutX 27392 (.cutY 17152 (.cutX 27264 (.cutY 17024 .full (.cutX 27200 (.cutY 17088 .full (.cutX 27168 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full (.cutX 27328 (.cutY 17088 .full .full) (.cutY 17088 .full .full)))) .empty) .empty))) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata75 : 0<166308920 ∧ 21<128 ∧ 61<128 ∧ 1<4 ∧
    6468/4160=1 ∧ 6468%4160=2308 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 4608, atom 6637, type 1, source (23,62).
def leavesData76 : FiniteInputTree DyadicLeaf 34 := (.node (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)))) (.node (.node (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩)) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,2,0⟩) (.single ⟨3,2,1⟩)))))) (.node (.node (.node (.node (.single ⟨3,3,0⟩) (.single ⟨3,3,1⟩)) (.node (.single ⟨4,10,0⟩) (.single ⟨4,10,1⟩))) (.node (.node (.single ⟨4,11,0⟩) (.single ⟨4,11,1⟩)) (.node (.single ⟨4,12,0⟩) (.single ⟨4,12,1⟩)))) (.node (.node (.node (.single ⟨4,13,0⟩) (.single ⟨4,13,1⟩)) (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩))) (.node (.node (.single ⟨4,15,1⟩) (.single ⟨5,30,0⟩)) (.node (.single ⟨5,30,1⟩) (.node (.single ⟨5,31,0⟩) (.single ⟨5,31,1⟩)))))))
def leaves76 : Fin 34 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 136) : GridBox := phaseImageBoxes 32768 8 23 62 leaves76 i
def outputData76 : FiniteInputTree GridBox 136 := (.node (.node (.node (.node (.node (.node (.node (.single ⟨5888,5952,15872,15936⟩) (.single ⟨5888,5952,15936,16000⟩)) (.node (.single ⟨5952,5984,15872,15904⟩) (.single ⟨5952,5984,15904,15936⟩))) (.node (.node (.single ⟨5984,6016,15872,15904⟩) (.single ⟨5984,6016,15904,15936⟩)) (.node (.single ⟨5952,6016,15936,16000⟩) (.single ⟨5888,6016,16000,16128⟩)))) (.node (.node (.node (.single ⟨6016,6048,15872,15904⟩) (.single ⟨6016,6048,15904,15936⟩)) (.node (.single ⟨6048,6064,15872,15888⟩) (.single ⟨6048,6064,15888,15904⟩))) (.node (.node (.single ⟨6064,6080,15872,15888⟩) (.single ⟨6064,6080,15888,15904⟩)) (.node (.single ⟨6048,6080,15904,15936⟩) (.node (.single ⟨6016,6080,15936,16000⟩) (.single ⟨6080,6096,15872,15888⟩)))))) (.node (.node (.node (.node (.single ⟨6080,6096,15888,15904⟩) (.single ⟨6096,6112,15872,15888⟩)) (.node (.single ⟨6096,6112,15888,15904⟩) (.single ⟨6080,6112,15904,15936⟩))) (.node (.node (.single ⟨6112,6128,15872,15888⟩) (.single ⟨6112,6128,15888,15904⟩)) (.node (.single ⟨6128,6136,15872,15880⟩) (.single ⟨6128,6136,15880,15888⟩)))) (.node (.node (.node (.single ⟨6136,6144,15872,15880⟩) (.single ⟨6136,6144,15880,15888⟩)) (.node (.single ⟨6128,6144,15888,15904⟩) (.single ⟨6112,6144,15904,15936⟩))) (.node (.node (.single ⟨6080,6144,15936,16000⟩) (.single ⟨6016,6080,16000,16064⟩)) (.node (.single ⟨6016,6080,16064,16128⟩) (.node (.single ⟨6080,6144,16000,16064⟩) (.single ⟨6080,6144,16064,16128⟩))))))) (.node (.node (.node (.node (.node (.single ⟨15872,15936,5888,5952⟩) (.single ⟨15872,15904,5952,5984⟩)) (.node (.single ⟨15872,15904,5984,6016⟩) (.single ⟨15904,15936,5952,5984⟩))) (.node (.node (.single ⟨15904,15936,5984,6016⟩) (.single ⟨15936,16000,5888,5952⟩)) (.node (.single ⟨15936,16000,5952,6016⟩) (.single ⟨15872,15904,6016,6048⟩)))) (.node (.node (.node (.single ⟨15872,15888,6048,6064⟩) (.single ⟨15872,15888,6064,6080⟩)) (.node (.single ⟨15888,15904,6048,6064⟩) (.single ⟨15888,15904,6064,6080⟩))) (.node (.node (.single ⟨15904,15936,6016,6048⟩) (.single ⟨15904,15936,6048,6080⟩)) (.node (.single ⟨15872,15888,6080,6096⟩) (.node (.single ⟨15872,15888,6096,6112⟩) (.single ⟨15888,15904,6080,6096⟩)))))) (.node (.node (.node (.node (.single ⟨15888,15904,6096,6112⟩) (.single ⟨15872,15888,6112,6128⟩)) (.node (.single ⟨15872,15880,6128,6136⟩) (.single ⟨15872,15880,6136,6144⟩))) (.node (.node (.single ⟨15880,15888,6128,6136⟩) (.single ⟨15880,15888,6136,6144⟩)) (.node (.single ⟨15888,15904,6112,6128⟩) (.single ⟨15888,15904,6128,6144⟩)))) (.node (.node (.node (.single ⟨15904,15936,6080,6112⟩) (.single ⟨15904,15936,6112,6144⟩)) (.node (.single ⟨15936,16000,6016,6080⟩) (.single ⟨15936,16000,6080,6144⟩))) (.node (.node (.single ⟨16000,16128,5888,6016⟩) (.single ⟨16000,16064,6016,6080⟩)) (.node (.single ⟨16000,16064,6080,6144⟩) (.node (.single ⟨16064,16128,6016,6080⟩) (.single ⟨16064,16128,6080,6144⟩)))))))) (.node (.node (.node (.node (.node (.node (.single ⟨16640,16704,26624,26688⟩) (.single ⟨16640,16704,26688,26752⟩)) (.node (.single ⟨16704,16768,26624,26688⟩) (.single ⟨16704,16768,26688,26752⟩))) (.node (.node (.single ⟨16640,16768,26752,26880⟩) (.single ⟨16768,16832,26624,26688⟩)) (.node (.single ⟨16768,16832,26688,26752⟩) (.single ⟨16832,16864,26624,26656⟩)))) (.node (.node (.node (.single ⟨16832,16864,26656,26688⟩) (.single ⟨16864,16880,26624,26640⟩)) (.node (.single ⟨16864,16880,26640,26656⟩) (.single ⟨16880,16888,26624,26632⟩))) (.node (.node (.single ⟨16880,16888,26632,26640⟩) (.single ⟨16888,16896,26624,26632⟩)) (.node (.single ⟨16888,16896,26632,26640⟩) (.node (.single ⟨16880,16896,26640,26656⟩) (.single ⟨16864,16880,26656,26672⟩)))))) (.node (.node (.node (.node (.single ⟨16864,16880,26672,26688⟩) (.single ⟨16880,16896,26656,26672⟩)) (.node (.single ⟨16880,16896,26672,26688⟩) (.single ⟨16832,16864,26688,26720⟩))) (.node (.node (.single ⟨16832,16864,26720,26752⟩) (.single ⟨16864,16880,26688,26704⟩)) (.node (.single ⟨16864,16880,26704,26720⟩) (.single ⟨16880,16896,26688,26704⟩)))) (.node (.node (.node (.single ⟨16880,16896,26704,26720⟩) (.single ⟨16864,16896,26720,26752⟩)) (.node (.single ⟨16768,16832,26752,26816⟩) (.single ⟨16768,16832,26816,26880⟩))) (.node (.node (.single ⟨16832,16864,26752,26784⟩) (.single ⟨16832,16864,26784,26816⟩)) (.node (.single ⟨16864,16896,26752,26784⟩) (.node (.single ⟨16864,16896,26784,26816⟩) (.single ⟨16832,16896,26816,26880⟩))))))) (.node (.node (.node (.node (.node (.single ⟨26624,26688,16640,16704⟩) (.single ⟨26624,26688,16704,16768⟩)) (.node (.single ⟨26688,26752,16640,16704⟩) (.single ⟨26688,26752,16704,16768⟩))) (.node (.node (.single ⟨26624,26688,16768,16832⟩) (.single ⟨26624,26656,16832,16864⟩)) (.node (.single ⟨26624,26640,16864,16880⟩) (.single ⟨26624,26632,16880,16888⟩)))) (.node (.node (.node (.single ⟨26624,26632,16888,16896⟩) (.single ⟨26632,26640,16880,16888⟩)) (.node (.single ⟨26632,26640,16888,16896⟩) (.single ⟨26640,26656,16864,16880⟩))) (.node (.node (.single ⟨26640,26656,16880,16896⟩) (.single ⟨26656,26688,16832,16864⟩)) (.node (.single ⟨26656,26672,16864,16880⟩) (.node (.single ⟨26656,26672,16880,16896⟩) (.single ⟨26672,26688,16864,16880⟩)))))) (.node (.node (.node (.node (.single ⟨26672,26688,16880,16896⟩) (.single ⟨26688,26752,16768,16832⟩)) (.node (.single ⟨26688,26720,16832,16864⟩) (.single ⟨26688,26704,16864,16880⟩))) (.node (.node (.single ⟨26688,26704,16880,16896⟩) (.single ⟨26704,26720,16864,16880⟩)) (.node (.single ⟨26704,26720,16880,16896⟩) (.single ⟨26720,26752,16832,16864⟩)))) (.node (.node (.node (.single ⟨26720,26752,16864,16896⟩) (.single ⟨26752,26880,16640,16768⟩)) (.node (.single ⟨26752,26816,16768,16832⟩) (.single ⟨26752,26784,16832,16864⟩))) (.node (.node (.single ⟨26752,26784,16864,16896⟩) (.single ⟨26784,26816,16832,16864⟩)) (.node (.single ⟨26784,26816,16864,16896⟩) (.node (.single ⟨26816,26880,16768,16832⟩) (.single ⟨26816,26880,16832,16896⟩)))))))))
def output76 : Fin 136 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 136 := (.node (.node (.node (.node (.node (.node (.node (.single 7) (.single 63)) (.node (.single 128) (.single 72))) (.node (.node (.single 0) (.single 34)) (.node (.single 135) (.single 101)))) (.node (.node (.node (.single 1) (.single 39)) (.node (.single 134) (.single 96))) (.node (.node (.single 6) (.single 40)) (.node (.single 129) (.node (.single 95) (.single 15)))))) (.node (.node (.node (.node (.single 61) (.single 120)) (.node (.single 74) (.single 29))) (.node (.node (.single 62) (.single 106)) (.node (.single 73) (.single 30)))) (.node (.node (.node (.single 64) (.single 105)) (.node (.single 71) (.single 31))) (.node (.node (.single 66) (.single 104)) (.node (.single 69) (.node (.single 32) (.single 65))))))) (.node (.node (.node (.node (.node (.single 103) (.single 70)) (.node (.single 33) (.single 67))) (.node (.node (.single 102) (.single 68)) (.node (.single 8) (.single 41)))) (.node (.node (.node (.single 127) (.single 94)) (.node (.single 9) (.single 46))) (.node (.node (.single 126) (.single 89)) (.node (.single 14) (.node (.single 47) (.single 121)))))) (.node (.node (.node (.node (.single 88) (.single 20)) (.node (.single 59) (.single 115))) (.node (.node (.single 76) (.single 28)) (.node (.single 60) (.single 107)))) (.node (.node (.node (.single 75) (.single 2)) (.node (.single 35) (.single 133))) (.node (.node (.single 100) (.single 3)) (.node (.single 37) (.node (.single 132) (.single 98)))))))) (.node (.node (.node (.node (.node (.node (.single 4) (.single 36)) (.node (.single 131) (.single 99))) (.node (.node (.single 5) (.single 38)) (.node (.single 130) (.single 97)))) (.node (.node (.node (.single 10) (.single 42)) (.node (.single 125) (.single 93))) (.node (.node (.single 11) (.single 44)) (.node (.single 124) (.node (.single 91) (.single 12)))))) (.node (.node (.node (.node (.single 43) (.single 123)) (.node (.single 92) (.single 13))) (.node (.node (.single 45) (.single 122)) (.node (.single 90) (.single 16)))) (.node (.node (.node (.single 48) (.single 119)) (.node (.single 87) (.single 17))) (.node (.node (.single 50) (.single 118)) (.node (.single 85) (.node (.single 18) (.single 49))))))) (.node (.node (.node (.node (.node (.single 117) (.single 86)) (.node (.single 19) (.single 51))) (.node (.node (.single 116) (.single 84)) (.node (.single 21) (.single 52)))) (.node (.node (.node (.single 114) (.single 83)) (.node (.single 22) (.single 57))) (.node (.node (.single 113) (.single 78)) (.node (.single 27) (.node (.single 58) (.single 108)))))) (.node (.node (.node (.node (.single 77) (.single 23)) (.node (.single 53) (.single 112))) (.node (.node (.single 82) (.single 24)) (.node (.single 55) (.single 111)))) (.node (.node (.node (.single 80) (.single 25)) (.node (.single 54) (.single 110))) (.node (.node (.single 81) (.single 26)) (.node (.single 56) (.node (.single 109) (.single 79)))))))))
def sourceData76 : FiniteInputTree ℕ 136 := (.node (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 60) (.single 64))) (.node (.node (.single 68) (.single 72)) (.node (.single 12) (.single 0)))) (.node (.node (.node (.single 40) (.single 44)) (.node (.single 76) (.single 80))) (.node (.node (.single 84) (.single 88)) (.node (.single 48) (.node (.single 16) (.single 92)))))) (.node (.node (.node (.node (.single 96) (.single 100)) (.node (.single 104) (.single 52))) (.node (.node (.single 108) (.single 112)) (.node (.single 120) (.single 124)))) (.node (.node (.node (.single 128) (.single 132)) (.node (.single 116) (.single 56))) (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.node (.single 32) (.single 36))))))) (.node (.node (.node (.node (.node (.single 5) (.single 61)) (.node (.single 69) (.single 65))) (.node (.node (.single 73) (.single 9)) (.node (.single 13) (.single 41)))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 81) (.single 89))) (.node (.node (.single 45) (.single 49)) (.node (.single 93) (.node (.single 101) (.single 97)))))) (.node (.node (.node (.node (.single 105) (.single 109)) (.node (.single 121) (.single 129))) (.node (.node (.single 125) (.single 133)) (.node (.single 113) (.single 117)))) (.node (.node (.node (.single 53) (.single 57)) (.node (.single 17) (.single 21))) (.node (.node (.single 1) (.single 25)) (.node (.single 33) (.node (.single 29) (.single 37)))))))) (.node (.node (.node (.node (.node (.node (.single 39) (.single 31)) (.node (.single 35) (.single 27))) (.node (.node (.single 3) (.single 23)) (.node (.single 19) (.single 59)))) (.node (.node (.node (.single 55) (.single 119)) (.node (.single 115) (.single 135))) (.node (.node (.single 127) (.single 131)) (.node (.single 123) (.node (.single 111) (.single 107)))))) (.node (.node (.node (.node (.single 99) (.single 103)) (.node (.single 95) (.single 51))) (.node (.node (.single 47) (.single 91)) (.node (.single 83) (.single 87)))) (.node (.node (.node (.single 79) (.single 43)) (.node (.single 15) (.single 11))) (.node (.node (.single 75) (.single 67)) (.node (.single 71) (.node (.single 63) (.single 7))))))) (.node (.node (.node (.node (.node (.single 38) (.single 34)) (.node (.single 30) (.single 26))) (.node (.node (.single 22) (.single 58)) (.node (.single 118) (.single 134)))) (.node (.node (.node (.single 130) (.single 126)) (.node (.single 122) (.single 114))) (.node (.node (.single 110) (.single 54)) (.node (.single 106) (.node (.single 102) (.single 98)))))) (.node (.node (.node (.node (.single 94) (.single 18)) (.node (.single 50) (.single 90))) (.node (.node (.single 86) (.single 82)) (.node (.single 78) (.single 46)))) (.node (.node (.node (.single 42) (.single 2)) (.node (.single 14) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 10) (.single 6)))))))))
def cover76 (i : Fin 136) : Fin 136 := ⟨coverData76.get i % 136, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 136) : Fin 136 := ⟨sourceData76.get i % 136, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 .empty (.cutY 15872 .empty (.cutX 5888 .empty (.cutY 16128 (.cutX 6016 (.cutY 16000 (.cutX 5952 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 5984 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full) (.cutY 16000 (.cutX 6080 (.cutY 15936 (.cutX 6048 (.cutY 15904 .full .full) (.cutY 15904 (.cutX 6064 (.cutY 15888 .full .full) (.cutY 15888 .full .full)) .full)) .full) (.cutY 15936 (.cutX 6112 (.cutY 15904 (.cutX 6096 (.cutY 15888 .full .full) (.cutY 15888 .full .full)) .full) (.cutY 15904 (.cutX 6128 (.cutY 15888 .full .full) (.cutY 15888 (.cutX 6136 (.cutY 15880 .full .full) (.cutY 15880 .full .full)) .full)) .full)) .full)) (.cutX 6080 (.cutY 16064 .full .full) (.cutY 16064 .full .full)))) .empty))))))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 .empty (.cutY 5632 .empty (.cutX 16128 (.cutY 5888 .empty (.cutX 16000 (.cutY 6016 (.cutX 15936 (.cutY 5952 .full (.cutX 15904 (.cutY 5984 .full .full) (.cutY 5984 .full .full))) (.cutY 5952 .full .full)) (.cutX 15936 (.cutY 6080 (.cutX 15904 (.cutY 6048 .full (.cutX 15888 (.cutY 6064 .full .full) (.cutY 6064 .full .full))) (.cutY 6048 .full .full)) (.cutX 15904 (.cutY 6112 (.cutX 15888 (.cutY 6096 .full .full) (.cutY 6096 .full .full)) (.cutX 15888 (.cutY 6128 .full (.cutX 15880 (.cutY 6136 .full .full) (.cutY 6136 .full .full))) (.cutY 6128 .full .full))) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full (.cutX 16064 (.cutY 6080 .full .full) (.cutY 6080 .full .full))))) .empty))))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 (.cutY 27136 (.cutX 16640 .empty (.cutY 26880 (.cutX 16768 (.cutY 26752 (.cutX 16704 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full) (.cutY 26752 (.cutX 16832 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 16864 (.cutY 26656 .full .full) (.cutY 26656 (.cutX 16880 (.cutY 26640 .full .full) (.cutY 26640 (.cutX 16888 (.cutY 26632 .full .full) (.cutY 26632 .full .full)) .full)) (.cutX 16880 (.cutY 26672 .full .full) (.cutY 26672 .full .full)))) (.cutX 16864 (.cutY 26720 .full .full) (.cutY 26720 (.cutX 16880 (.cutY 26704 .full .full) (.cutY 26704 .full .full)) .full)))) (.cutX 16832 (.cutY 26816 .full .full) (.cutY 26816 (.cutX 16864 (.cutY 26784 .full .full) (.cutY 26784 .full .full)) .full)))) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 (.cutY 16896 (.cutX 26880 (.cutY 16640 .empty (.cutX 26752 (.cutY 16768 (.cutX 26688 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) (.cutX 26688 (.cutY 16832 .full (.cutX 26656 (.cutY 16864 .full (.cutX 26640 (.cutY 16880 .full (.cutX 26632 (.cutY 16888 .full .full) (.cutY 16888 .full .full))) (.cutY 16880 .full .full))) (.cutY 16864 .full (.cutX 26672 (.cutY 16880 .full .full) (.cutY 16880 .full .full))))) (.cutY 16832 .full (.cutX 26720 (.cutY 16864 .full (.cutX 26704 (.cutY 16880 .full .full) (.cutY 16880 .full .full))) (.cutY 16864 .full .full))))) (.cutY 16768 .full (.cutX 26816 (.cutY 16832 .full (.cutX 26784 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata76 : 0<166308920 ∧ 23<128 ∧ 62<128 ∧ 1<4 ∧
    6637/4160=1 ∧ 6637%4160=2477 ∧ ∀ i, (leaves76 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData76).mp
    (by decide +kernel)

theorem sourceChecked76_0 : ∀ i : Fin 64,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 136 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked76_64 : ∀ i : Fin 64,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 136 64 64 (by decide) i) := by decide +kernel

theorem sourceChecked76_128 : ∀ i : Fin 8,
    (fun i => output76 i = raw76 (source76 i)) (finOffset 136 128 8 (by decide) i) := by decide +kernel

theorem sourceChecked76 : ∀ i : Fin 136, (fun i => output76 i = raw76 (source76 i)) i :=
  forallFin_of_zero_offset (fun i => output76 i = raw76 (source76 i)) (forallFinOffset_add (fun i => output76 i = raw76 (source76 i)) 0 64 72 (by decide) sourceChecked76_0
    (forallFinOffset_add (fun i => output76 i = raw76 (source76 i)) 64 64 8 (by decide) sourceChecked76_64
    sourceChecked76_128))

theorem coverChecked76_0 : ∀ i : Fin 64,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 136 0 64 (by decide) i) := by decide +kernel

theorem coverChecked76_64 : ∀ i : Fin 64,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 136 64 64 (by decide) i) := by decide +kernel

theorem coverChecked76_128 : ∀ i : Fin 8,
    (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (finOffset 136 128 8 (by decide) i) := by decide +kernel

theorem coverChecked76 : ∀ i : Fin 136, (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) i :=
  forallFin_of_zero_offset (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) (forallFinOffset_add (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) 0 64 72 (by decide) coverChecked76_0
    (forallFinOffset_add (fun i => (output76 (cover76 i)).ContainsBox (raw76 i)) 64 64 8 (by decide) coverChecked76_64
    coverChecked76_128))

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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 4609, atom 5711, type 1, source (13,56).
def leavesData77 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves77 : Fin 13 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 13 56 leaves77 i
def outputData77 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨3328,3392,14336,14400⟩) (.node (.single ⟨3328,3392,14400,14464⟩) (.single ⟨3392,3456,14336,14400⟩))) (.node (.single ⟨3392,3456,14400,14464⟩) (.node (.single ⟨3328,3456,14464,14592⟩) (.single ⟨3456,3520,14336,14400⟩)))) (.node (.node (.single ⟨3456,3520,14400,14464⟩) (.node (.single ⟨3520,3552,14336,14368⟩) (.single ⟨3520,3552,14368,14400⟩))) (.node (.node (.single ⟨3552,3584,14336,14368⟩) (.single ⟨3552,3584,14368,14400⟩)) (.node (.single ⟨3520,3584,14400,14464⟩) (.single ⟨3456,3584,14464,14592⟩))))) (.node (.node (.node (.single ⟨14336,14400,3328,3392⟩) (.node (.single ⟨14336,14400,3392,3456⟩) (.single ⟨14400,14464,3328,3392⟩))) (.node (.single ⟨14400,14464,3392,3456⟩) (.node (.single ⟨14336,14400,3456,3520⟩) (.single ⟨14336,14368,3520,3552⟩)))) (.node (.node (.single ⟨14336,14368,3552,3584⟩) (.node (.single ⟨14368,14400,3520,3552⟩) (.single ⟨14368,14400,3552,3584⟩))) (.node (.node (.single ⟨14400,14464,3456,3520⟩) (.single ⟨14400,14464,3520,3584⟩)) (.node (.single ⟨14464,14592,3328,3456⟩) (.single ⟨14464,14592,3456,3584⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18304,29184,29312⟩) (.node (.single ⟨18176,18304,29312,29440⟩) (.single ⟨18304,18368,29184,29248⟩))) (.node (.single ⟨18304,18368,29248,29312⟩) (.node (.single ⟨18368,18400,29184,29216⟩) (.single ⟨18368,18400,29216,29248⟩)))) (.node (.node (.single ⟨18400,18432,29184,29216⟩) (.node (.single ⟨18400,18432,29216,29248⟩) (.single ⟨18368,18432,29248,29312⟩))) (.node (.node (.single ⟨18304,18368,29312,29376⟩) (.single ⟨18304,18368,29376,29440⟩)) (.node (.single ⟨18368,18432,29312,29376⟩) (.single ⟨18368,18432,29376,29440⟩))))) (.node (.node (.node (.single ⟨29184,29312,18176,18304⟩) (.node (.single ⟨29184,29248,18304,18368⟩) (.single ⟨29184,29216,18368,18400⟩))) (.node (.single ⟨29184,29216,18400,18432⟩) (.node (.single ⟨29216,29248,18368,18400⟩) (.single ⟨29216,29248,18400,18432⟩)))) (.node (.node (.single ⟨29248,29312,18304,18368⟩) (.node (.single ⟨29248,29312,18368,18432⟩) (.single ⟨29312,29440,18176,18304⟩))) (.node (.node (.single ⟨29312,29376,18304,18368⟩) (.single ⟨29312,29376,18368,18432⟩)) (.node (.single ⟨29376,29440,18304,18368⟩) (.single ⟨29376,29440,18368,18432⟩)))))))
def output77 : Fin 52 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData77 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover77 (i : Fin 52) : Fin 52 := ⟨coverData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 52) : Fin 52 := ⟨sourceData77.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 (.cutX 3584 (.cutY 14848 (.cutX 3328 .empty (.cutY 14592 (.cutX 3456 (.cutY 14464 (.cutX 3392 (.cutY 14400 .full .full) (.cutY 14400 .full .full)) .full) (.cutY 14464 (.cutX 3520 (.cutY 14400 .full .full) (.cutY 14400 (.cutX 3552 (.cutY 14368 .full .full) (.cutY 14368 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 (.cutY 3072 .empty (.cutX 14848 (.cutY 3584 (.cutX 14592 (.cutY 3328 .empty (.cutX 14464 (.cutY 3456 (.cutX 14400 (.cutY 3392 .full .full) (.cutY 3392 .full .full)) (.cutX 14400 (.cutY 3520 .full (.cutX 14368 (.cutY 3552 .full .full) (.cutY 3552 .full .full))) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty)) .empty))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 .empty (.cutY 29696 (.cutX 17920 .empty (.cutY 29184 .empty (.cutX 18176 .empty (.cutY 29440 (.cutX 18304 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 18368 (.cutY 29248 .full .full) (.cutY 29248 (.cutX 18400 (.cutY 29216 .full .full) (.cutY 29216 .full .full)) .full)) (.cutX 18368 (.cutY 29376 .full .full) (.cutY 29376 .full .full)))) .empty)))) .empty)) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 .empty (.cutX 29184 .empty (.cutY 17920 .empty (.cutX 29440 (.cutY 18176 .empty (.cutX 29312 (.cutY 18304 .full (.cutX 29248 (.cutY 18368 .full (.cutX 29216 (.cutY 18400 .full .full) (.cutY 18400 .full .full))) (.cutY 18368 .full .full))) (.cutY 18304 .full (.cutX 29376 (.cutY 18368 .full .full) (.cutY 18368 .full .full))))) .empty)))) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata77 : 0<163200014 ∧ 13<128 ∧ 56<128 ∧ 1<4 ∧
    5711/4160=1 ∧ 5711%4160=1551 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (163200014/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (81600007/819200000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 4610, atom 4339, type 1, source (1,52).
def leavesData78 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves78 : Fin 13 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 1 52 leaves78 i
def outputData78 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨256,320,13312,13376⟩) (.node (.single ⟨256,320,13376,13440⟩) (.single ⟨320,384,13312,13376⟩))) (.node (.single ⟨320,384,13376,13440⟩) (.node (.single ⟨256,384,13440,13568⟩) (.single ⟨384,448,13312,13376⟩)))) (.node (.node (.single ⟨384,448,13376,13440⟩) (.node (.single ⟨448,480,13312,13344⟩) (.single ⟨448,480,13344,13376⟩))) (.node (.node (.single ⟨480,512,13312,13344⟩) (.single ⟨480,512,13344,13376⟩)) (.node (.single ⟨448,512,13376,13440⟩) (.single ⟨384,512,13440,13568⟩))))) (.node (.node (.node (.single ⟨13312,13376,256,320⟩) (.node (.single ⟨13312,13376,320,384⟩) (.single ⟨13376,13440,256,320⟩))) (.node (.single ⟨13376,13440,320,384⟩) (.node (.single ⟨13312,13376,384,448⟩) (.single ⟨13312,13344,448,480⟩)))) (.node (.node (.single ⟨13312,13344,480,512⟩) (.node (.single ⟨13344,13376,448,480⟩) (.single ⟨13344,13376,480,512⟩))) (.node (.node (.single ⟨13376,13440,384,448⟩) (.single ⟨13376,13440,448,512⟩)) (.node (.single ⟨13440,13568,256,384⟩) (.single ⟨13440,13568,384,512⟩)))))) (.node (.node (.node (.node (.single ⟨19200,19328,32256,32384⟩) (.node (.single ⟨19200,19328,32384,32512⟩) (.single ⟨19328,19392,32256,32320⟩))) (.node (.single ⟨19328,19392,32320,32384⟩) (.node (.single ⟨19392,19424,32256,32288⟩) (.single ⟨19392,19424,32288,32320⟩)))) (.node (.node (.single ⟨19424,19456,32256,32288⟩) (.node (.single ⟨19424,19456,32288,32320⟩) (.single ⟨19392,19456,32320,32384⟩))) (.node (.node (.single ⟨19328,19392,32384,32448⟩) (.single ⟨19328,19392,32448,32512⟩)) (.node (.single ⟨19392,19456,32384,32448⟩) (.single ⟨19392,19456,32448,32512⟩))))) (.node (.node (.node (.single ⟨32256,32384,19200,19328⟩) (.node (.single ⟨32256,32320,19328,19392⟩) (.single ⟨32256,32288,19392,19424⟩))) (.node (.single ⟨32256,32288,19424,19456⟩) (.node (.single ⟨32288,32320,19392,19424⟩) (.single ⟨32288,32320,19424,19456⟩)))) (.node (.node (.single ⟨32320,32384,19328,19392⟩) (.node (.single ⟨32320,32384,19392,19456⟩) (.single ⟨32384,32512,19200,19328⟩))) (.node (.node (.single ⟨32384,32448,19328,19392⟩) (.single ⟨32384,32448,19392,19456⟩)) (.node (.single ⟨32448,32512,19328,19392⟩) (.single ⟨32448,32512,19392,19456⟩)))))))
def output78 : Fin 52 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData78 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover78 (i : Fin 52) : Fin 52 := ⟨coverData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 52) : Fin 52 := ⟨sourceData78.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 (.cutY 13312 .empty (.cutX 512 (.cutY 13824 (.cutX 256 .empty (.cutY 13568 (.cutX 384 (.cutY 13440 (.cutX 320 (.cutY 13376 .full .full) (.cutY 13376 .full .full)) .full) (.cutY 13440 (.cutX 448 (.cutY 13376 .full .full) (.cutY 13376 (.cutX 480 (.cutY 13344 .full .full) (.cutY 13344 .full .full)) .full)) .full)) .empty)) .empty) .empty)) .empty) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 (.cutX 13824 (.cutY 512 (.cutX 13568 (.cutY 256 .empty (.cutX 13440 (.cutY 384 (.cutX 13376 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 13376 (.cutY 448 .full (.cutX 13344 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 .empty (.cutX 18944 .empty (.cutY 32256 .empty (.cutX 19200 .empty (.cutY 32512 (.cutX 19328 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 19392 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 19424 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 19392 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))))) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 .empty (.cutY 19456 (.cutX 32256 .empty (.cutY 18944 .empty (.cutX 32512 (.cutY 19200 .empty (.cutX 32384 (.cutY 19328 .full (.cutX 32320 (.cutY 19392 .full (.cutX 32288 (.cutY 19424 .full .full) (.cutY 19424 .full .full))) (.cutY 19392 .full .full))) (.cutY 19328 .full (.cutX 32448 (.cutY 19392 .full .full) (.cutY 19392 .full .full))))) .empty))) .empty)))) .empty)) .empty))))

theorem metadata78 : 0<234882010 ∧ 1<128 ∧ 52<128 ∧ 1<4 ∧
    4339/4160=1 ∧ 4339%4160=179 ∧ ∀ i, (leaves78 i).Valid 8 := by
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 4611, atom 5502, type 1, source (11,55).
def leavesData79 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves79 : Fin 13 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 11 55 leaves79 i
def outputData79 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2816,2880,14080,14144⟩) (.node (.single ⟨2816,2880,14144,14208⟩) (.single ⟨2880,2944,14080,14144⟩))) (.node (.single ⟨2880,2944,14144,14208⟩) (.node (.single ⟨2816,2944,14208,14336⟩) (.single ⟨2944,3008,14080,14144⟩)))) (.node (.node (.single ⟨2944,3008,14144,14208⟩) (.node (.single ⟨3008,3040,14080,14112⟩) (.single ⟨3008,3040,14112,14144⟩))) (.node (.node (.single ⟨3040,3072,14080,14112⟩) (.single ⟨3040,3072,14112,14144⟩)) (.node (.single ⟨3008,3072,14144,14208⟩) (.single ⟨2944,3072,14208,14336⟩))))) (.node (.node (.node (.single ⟨14080,14144,2816,2880⟩) (.node (.single ⟨14080,14144,2880,2944⟩) (.single ⟨14144,14208,2816,2880⟩))) (.node (.single ⟨14144,14208,2880,2944⟩) (.node (.single ⟨14080,14144,2944,3008⟩) (.single ⟨14080,14112,3008,3040⟩)))) (.node (.node (.single ⟨14080,14112,3040,3072⟩) (.node (.single ⟨14112,14144,3008,3040⟩) (.single ⟨14112,14144,3040,3072⟩))) (.node (.node (.single ⟨14144,14208,2944,3008⟩) (.single ⟨14144,14208,3008,3072⟩)) (.node (.single ⟨14208,14336,2816,2944⟩) (.single ⟨14208,14336,2944,3072⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18560,29696,29824⟩) (.node (.single ⟨18432,18560,29824,29952⟩) (.single ⟨18560,18624,29696,29760⟩))) (.node (.single ⟨18560,18624,29760,29824⟩) (.node (.single ⟨18624,18656,29696,29728⟩) (.single ⟨18624,18656,29728,29760⟩)))) (.node (.node (.single ⟨18656,18688,29696,29728⟩) (.node (.single ⟨18656,18688,29728,29760⟩) (.single ⟨18624,18688,29760,29824⟩))) (.node (.node (.single ⟨18560,18624,29824,29888⟩) (.single ⟨18560,18624,29888,29952⟩)) (.node (.single ⟨18624,18688,29824,29888⟩) (.single ⟨18624,18688,29888,29952⟩))))) (.node (.node (.node (.single ⟨29696,29824,18432,18560⟩) (.node (.single ⟨29696,29760,18560,18624⟩) (.single ⟨29696,29728,18624,18656⟩))) (.node (.single ⟨29696,29728,18656,18688⟩) (.node (.single ⟨29728,29760,18624,18656⟩) (.single ⟨29728,29760,18656,18688⟩)))) (.node (.node (.single ⟨29760,29824,18560,18624⟩) (.node (.single ⟨29760,29824,18624,18688⟩) (.single ⟨29824,29952,18432,18560⟩))) (.node (.node (.single ⟨29824,29888,18560,18624⟩) (.single ⟨29824,29888,18624,18688⟩)) (.node (.single ⟨29888,29952,18560,18624⟩) (.single ⟨29888,29952,18624,18688⟩)))))))
def output79 : Fin 52 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData79 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover79 (i : Fin 52) : Fin 52 := ⟨coverData79.get i % 52, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 52) : Fin 52 := ⟨sourceData79.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 .empty (.cutY 13824 .empty (.cutX 2816 .empty (.cutY 14080 .empty (.cutX 2944 (.cutY 14208 (.cutX 2880 (.cutY 14144 .full .full) (.cutY 14144 .full .full)) .full) (.cutY 14208 (.cutX 3008 (.cutY 14144 .full .full) (.cutY 14144 (.cutX 3040 (.cutY 14112 .full .full) (.cutY 14112 .full .full)) .full)) .full))))))) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 .empty (.cutY 2560 .empty (.cutX 14080 .empty (.cutY 2816 .empty (.cutX 14208 (.cutY 2944 (.cutX 14144 (.cutY 2880 .full .full) (.cutY 2880 .full .full)) (.cutX 14144 (.cutY 3008 .full (.cutX 14112 (.cutY 3040 .full .full) (.cutY 3040 .full .full))) (.cutY 3008 .full .full))) (.cutY 2944 .full .full)))))) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 (.cutY 30208 (.cutX 18688 (.cutY 29952 (.cutX 18560 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 18624 (.cutY 29760 .full .full) (.cutY 29760 (.cutX 18656 (.cutY 29728 .full .full) (.cutY 29728 .full .full)) .full)) (.cutX 18624 (.cutY 29888 .full .full) (.cutY 29888 .full .full)))) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 (.cutY 18944 (.cutX 29952 (.cutY 18688 (.cutX 29824 (.cutY 18560 .full (.cutX 29760 (.cutY 18624 .full (.cutX 29728 (.cutY 18656 .full .full) (.cutY 18656 .full .full))) (.cutY 18624 .full .full))) (.cutY 18560 .full (.cutX 29888 (.cutY 18624 .full .full) (.cutY 18624 .full .full)))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty)) .empty))))

theorem metadata79 : 0<144841863 ∧ 11<128 ∧ 55<128 ∧ 1<4 ∧
    5502/4160=1 ∧ 5502%4160=1342 ∧ ∀ i, (leaves79 i).Valid 8 := by
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 4612, atom 4709, type 1, source (4,53).
def leavesData80 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves80 : Fin 16 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 4 53 leaves80 i
def outputData80 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨1024,1088,13568,13632⟩) (.single ⟨1024,1088,13632,13696⟩)) (.node (.single ⟨1088,1152,13568,13632⟩) (.single ⟨1088,1152,13632,13696⟩))) (.node (.node (.single ⟨1024,1152,13696,13824⟩) (.single ⟨1152,1184,13568,13600⟩)) (.node (.single ⟨1152,1184,13600,13632⟩) (.single ⟨1184,1216,13568,13600⟩)))) (.node (.node (.node (.single ⟨1184,1216,13600,13632⟩) (.single ⟨1152,1216,13632,13696⟩)) (.node (.single ⟨1216,1248,13568,13600⟩) (.single ⟨1216,1248,13600,13632⟩))) (.node (.node (.single ⟨1248,1280,13568,13600⟩) (.single ⟨1248,1280,13600,13632⟩)) (.node (.single ⟨1216,1280,13632,13696⟩) (.single ⟨1152,1280,13696,13824⟩))))) (.node (.node (.node (.node (.single ⟨13568,13632,1024,1088⟩) (.single ⟨13568,13632,1088,1152⟩)) (.node (.single ⟨13632,13696,1024,1088⟩) (.single ⟨13632,13696,1088,1152⟩))) (.node (.node (.single ⟨13568,13600,1152,1184⟩) (.single ⟨13568,13600,1184,1216⟩)) (.node (.single ⟨13600,13632,1152,1184⟩) (.single ⟨13600,13632,1184,1216⟩)))) (.node (.node (.node (.single ⟨13568,13600,1216,1248⟩) (.single ⟨13568,13600,1248,1280⟩)) (.node (.single ⟨13600,13632,1216,1248⟩) (.single ⟨13600,13632,1248,1280⟩))) (.node (.node (.single ⟨13632,13696,1152,1216⟩) (.single ⟨13632,13696,1216,1280⟩)) (.node (.single ⟨13696,13824,1024,1152⟩) (.single ⟨13696,13824,1152,1280⟩)))))) (.node (.node (.node (.node (.node (.single ⟨18944,19072,31488,31616⟩) (.single ⟨18944,19072,31616,31744⟩)) (.node (.single ⟨19072,19136,31488,31552⟩) (.single ⟨19072,19136,31552,31616⟩))) (.node (.node (.single ⟨19136,19168,31488,31520⟩) (.single ⟨19136,19168,31520,31552⟩)) (.node (.single ⟨19168,19200,31488,31520⟩) (.single ⟨19168,19200,31520,31552⟩)))) (.node (.node (.node (.single ⟨19136,19168,31552,31584⟩) (.single ⟨19136,19168,31584,31616⟩)) (.node (.single ⟨19168,19200,31552,31584⟩) (.single ⟨19168,19200,31584,31616⟩))) (.node (.node (.single ⟨19072,19136,31616,31680⟩) (.single ⟨19072,19136,31680,31744⟩)) (.node (.single ⟨19136,19200,31616,31680⟩) (.single ⟨19136,19200,31680,31744⟩))))) (.node (.node (.node (.node (.single ⟨31488,31616,18944,19072⟩) (.single ⟨31488,31552,19072,19136⟩)) (.node (.single ⟨31488,31520,19136,19168⟩) (.single ⟨31488,31520,19168,19200⟩))) (.node (.node (.single ⟨31520,31552,19136,19168⟩) (.single ⟨31520,31552,19168,19200⟩)) (.node (.single ⟨31552,31616,19072,19136⟩) (.single ⟨31552,31584,19136,19168⟩)))) (.node (.node (.node (.single ⟨31552,31584,19168,19200⟩) (.single ⟨31584,31616,19136,19168⟩)) (.node (.single ⟨31584,31616,19168,19200⟩) (.single ⟨31616,31744,18944,19072⟩))) (.node (.node (.single ⟨31616,31680,19072,19136⟩) (.single ⟨31616,31680,19136,19200⟩)) (.node (.single ⟨31680,31744,19072,19136⟩) (.single ⟨31680,31744,19136,19200⟩)))))))
def output80 : Fin 64 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 30)) (.node (.single 59) (.single 33))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32)))) (.node (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47))) (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))))) (.node (.node (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))) (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44)))) (.node (.node (.node (.single 9) (.single 28)) (.node (.single 54) (.single 35))) (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34)))))) (.node (.node (.node (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43))) (.node (.node (.single 6) (.single 22)) (.node (.single 57) (.single 41)))) (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40))))) (.node (.node (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 12) (.single 25)) (.node (.single 51) (.single 38))) (.node (.node (.single 13) (.single 27)) (.node (.single 50) (.single 36)))))))
def sourceData80 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 36) (.single 40)))) (.node (.node (.node (.single 44) (.single 24)) (.node (.single 48) (.single 52))) (.node (.node (.single 56) (.single 60)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45)))) (.node (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51)))) (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 62) (.single 58))) (.node (.node (.single 54) (.single 50)) (.node (.single 26) (.single 46)))) (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover80 (i : Fin 64) : Fin 64 := ⟨coverData80.get i % 64, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 64) : Fin 64 := ⟨sourceData80.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 (.cutX 1024 .empty (.cutY 13312 .empty (.cutX 1536 (.cutY 13824 (.cutX 1280 (.cutY 13568 .empty (.cutX 1152 (.cutY 13696 (.cutX 1088 (.cutY 13632 .full .full) (.cutY 13632 .full .full)) .full) (.cutY 13696 (.cutX 1216 (.cutY 13632 (.cutX 1184 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full) (.cutY 13632 (.cutX 1248 (.cutY 13600 .full .full) (.cutY 13600 .full .full)) .full)) .full))) .empty) .empty) .empty))) .empty) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 (.cutX 13312 .empty (.cutY 1024 .empty (.cutX 13824 (.cutY 1536 (.cutX 13568 .empty (.cutY 1280 (.cutX 13696 (.cutY 1152 (.cutX 13632 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 13632 (.cutY 1216 (.cutX 13600 (.cutY 1184 .full .full) (.cutY 1184 .full .full)) (.cutX 13600 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty) .empty))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 .empty (.cutX 19456 (.cutY 31744 (.cutX 18944 .empty (.cutY 31232 .empty (.cutX 19200 (.cutY 31488 .empty (.cutX 19072 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 19136 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 19168 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) (.cutX 19168 (.cutY 31584 .full .full) (.cutY 31584 .full .full)))) (.cutX 19136 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))) .empty))) .empty) .empty)))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 .empty (.cutX 31744 (.cutY 19456 (.cutX 31232 .empty (.cutY 18944 .empty (.cutX 31488 .empty (.cutY 19200 (.cutX 31616 (.cutY 19072 .full (.cutX 31552 (.cutY 19136 .full (.cutX 31520 (.cutY 19168 .full .full) (.cutY 19168 .full .full))) (.cutY 19136 .full (.cutX 31584 (.cutY 19168 .full .full) (.cutY 19168 .full .full))))) (.cutY 19072 .full (.cutX 31680 (.cutY 19136 .full .full) (.cutY 19136 .full .full)))) .empty)))) .empty) .empty))) .empty)) .empty))))

theorem metadata80 : 0<234882010 ∧ 4<128 ∧ 53<128 ∧ 1<4 ∧
    4709/4160=1 ∧ 4709%4160=549 ∧ ∀ i, (leaves80 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData80).mp
    (by decide +kernel)

theorem sourceChecked80_0 : ∀ i : Fin 64,
    (fun i => output80 i = raw80 (source80 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked80 : ∀ i : Fin 64, (fun i => output80 i = raw80 (source80 i)) i :=
  forallFin_of_zero_offset (fun i => output80 i = raw80 (source80 i)) sourceChecked80_0

theorem coverChecked80_0 : ∀ i : Fin 64,
    (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked80 : ∀ i : Fin 64, (fun i => (output80 (cover80 i)).ContainsBox (raw80 i)) i :=
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (234882010/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (23488201/163840000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 4613, atom 7805, type 1, source (41,78).
def leavesData81 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves81 : Fin 10 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 41 78 leaves81 i
def outputData81 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10496,10624,19968,20096⟩) (.single ⟨10496,10624,20096,20224⟩)) (.node (.single ⟨10624,10688,19968,20032⟩) (.node (.single ⟨10624,10688,20032,20096⟩) (.single ⟨10688,10720,19968,20000⟩)))) (.node (.node (.single ⟨10688,10720,20000,20032⟩) (.single ⟨10720,10752,19968,20000⟩)) (.node (.single ⟨10720,10752,20000,20032⟩) (.node (.single ⟨10688,10752,20032,20096⟩) (.single ⟨10624,10752,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,22016,22144⟩) (.single ⟨12544,12672,22144,22272⟩)) (.node (.single ⟨12672,12736,22016,22080⟩) (.node (.single ⟨12672,12736,22080,22144⟩) (.single ⟨12736,12768,22016,22048⟩)))) (.node (.node (.single ⟨12736,12768,22048,22080⟩) (.single ⟨12768,12800,22016,22048⟩)) (.node (.single ⟨12768,12800,22048,22080⟩) (.node (.single ⟨12736,12800,22080,22144⟩) (.single ⟨12672,12800,22144,22272⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20096,10496,10624⟩) (.single ⟨19968,20032,10624,10688⟩)) (.node (.single ⟨19968,20000,10688,10720⟩) (.node (.single ⟨19968,20000,10720,10752⟩) (.single ⟨20000,20032,10688,10720⟩)))) (.node (.node (.single ⟨20000,20032,10720,10752⟩) (.single ⟨20032,20096,10624,10688⟩)) (.node (.single ⟨20032,20096,10688,10752⟩) (.node (.single ⟨20096,20224,10496,10624⟩) (.single ⟨20096,20224,10624,10752⟩))))) (.node (.node (.node (.single ⟨22016,22144,12544,12672⟩) (.single ⟨22016,22080,12672,12736⟩)) (.node (.single ⟨22016,22048,12736,12768⟩) (.node (.single ⟨22016,22048,12768,12800⟩) (.single ⟨22048,22080,12736,12768⟩)))) (.node (.node (.single ⟨22048,22080,12768,12800⟩) (.single ⟨22080,22144,12672,12736⟩)) (.node (.single ⟨22080,22144,12736,12800⟩) (.node (.single ⟨22144,22272,12544,12672⟩) (.single ⟨22144,22272,12672,12800⟩)))))))
def output81 : Fin 40 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData81 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover81 (i : Fin 40) : Fin 40 := ⟨coverData81.get i % 40, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 40) : Fin 40 := ⟨sourceData81.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 (.cutY 19968 .empty (.cutX 10496 .empty (.cutY 20224 (.cutX 10624 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 10688 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 10720 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty))) .empty)) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 (.cutY 22016 .empty (.cutX 12544 .empty (.cutY 22272 (.cutX 12672 (.cutY 22144 .full .full) (.cutY 22144 (.cutX 12736 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 12768 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty))) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 .empty (.cutY 10752 (.cutX 20224 (.cutY 10496 .empty (.cutX 20096 (.cutY 10624 .full (.cutX 20032 (.cutY 10688 .full (.cutX 20000 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full .full))) .empty) .empty)) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 .empty (.cutY 12800 (.cutX 22272 (.cutY 12544 .empty (.cutX 22144 (.cutY 12672 .full (.cutX 22080 (.cutY 12736 .full (.cutX 22048 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty)) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata81 : 0<177315334 ∧ 41<128 ∧ 78<128 ∧ 1<4 ∧
    7805/4160=1 ∧ 7805%4160=3645 ∧ ∀ i, (leaves81 i).Valid 8 := by
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

noncomputable def phaseMass81 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw81 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass81_eq : phaseMass81 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass81
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw81 output81 cover81 source81
    (gridTreeUnionCheck_sound 32768 raw81 output81 cover81 source81 tree81 checked81)
    _ (by norm_num) _, areaUnits81]
  norm_num

-- Frozen phase 4614, atom 2870, type 0, source (28,70).
def leavesData82 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves82 : Fin 7 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 70 leaves82 i
def outputData82 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,17920,18048⟩) (.node (.single ⟨7168,7296,18048,18176⟩) (.single ⟨7296,7360,17920,17984⟩))) (.node (.node (.single ⟨7296,7360,17984,18048⟩) (.single ⟨7360,7424,17920,17984⟩)) (.node (.single ⟨7360,7424,17984,18048⟩) (.single ⟨7296,7424,18048,18176⟩)))) (.node (.node (.single ⟨14592,14720,25344,25472⟩) (.node (.single ⟨14592,14720,25472,25600⟩) (.single ⟨14720,14784,25344,25408⟩))) (.node (.node (.single ⟨14720,14784,25408,25472⟩) (.single ⟨14784,14848,25344,25408⟩)) (.node (.single ⟨14784,14848,25408,25472⟩) (.single ⟨14720,14848,25472,25600⟩))))) (.node (.node (.node (.single ⟨17920,18048,7168,7296⟩) (.node (.single ⟨17920,17984,7296,7360⟩) (.single ⟨17920,17984,7360,7424⟩))) (.node (.node (.single ⟨17984,18048,7296,7360⟩) (.single ⟨17984,18048,7360,7424⟩)) (.node (.single ⟨18048,18176,7168,7296⟩) (.single ⟨18048,18176,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,14592,14720⟩) (.node (.single ⟨25344,25408,14720,14784⟩) (.single ⟨25344,25408,14784,14848⟩))) (.node (.node (.single ⟨25408,25472,14720,14784⟩) (.single ⟨25408,25472,14784,14848⟩)) (.node (.single ⟨25472,25600,14592,14720⟩) (.single ⟨25472,25600,14720,14848⟩))))))
def output82 : Fin 28 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover82 (i : Fin 28) : Fin 28 := ⟨coverData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 28) : Fin 28 := ⟨sourceData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 (.cutY 17920 .empty (.cutX 7424 (.cutY 18176 (.cutX 7296 (.cutY 18048 .full .full) (.cutY 18048 (.cutX 7360 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)) .empty))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 (.cutY 25088 .empty (.cutX 14592 .empty (.cutY 25344 .empty (.cutX 14720 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 14784 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))))) .empty) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 .empty (.cutY 7680 (.cutX 18176 (.cutY 7424 (.cutX 18048 (.cutY 7296 .full (.cutX 17984 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty))))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 .empty (.cutY 14848 (.cutX 25344 .empty (.cutY 14592 .empty (.cutX 25472 (.cutY 14720 .full (.cutX 25408 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full .full)))) .empty)) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata82 : 0<170092456 ∧ 28<128 ∧ 70<128 ∧ 0<4 ∧
    2870/4160=0 ∧ 2870%4160=2870 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 4615, atom 2312, type 0, source (21,65).
def leavesData83 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves83 : Fin 7 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 21 65 leaves83 i
def outputData83 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5376,5504,16640,16768⟩) (.node (.single ⟨5376,5504,16768,16896⟩) (.single ⟨5504,5568,16640,16704⟩))) (.node (.node (.single ⟨5504,5568,16704,16768⟩) (.single ⟨5568,5632,16640,16704⟩)) (.node (.single ⟨5568,5632,16704,16768⟩) (.single ⟨5504,5632,16768,16896⟩)))) (.node (.node (.single ⟨15872,16000,27136,27264⟩) (.node (.single ⟨15872,16000,27264,27392⟩) (.single ⟨16000,16064,27136,27200⟩))) (.node (.node (.single ⟨16000,16064,27200,27264⟩) (.single ⟨16064,16128,27136,27200⟩)) (.node (.single ⟨16064,16128,27200,27264⟩) (.single ⟨16000,16128,27264,27392⟩))))) (.node (.node (.node (.single ⟨16640,16768,5376,5504⟩) (.node (.single ⟨16640,16704,5504,5568⟩) (.single ⟨16640,16704,5568,5632⟩))) (.node (.node (.single ⟨16704,16768,5504,5568⟩) (.single ⟨16704,16768,5568,5632⟩)) (.node (.single ⟨16768,16896,5376,5504⟩) (.single ⟨16768,16896,5504,5632⟩)))) (.node (.node (.single ⟨27136,27264,15872,16000⟩) (.node (.single ⟨27136,27200,16000,16064⟩) (.single ⟨27136,27200,16064,16128⟩))) (.node (.node (.single ⟨27200,27264,16000,16064⟩) (.single ⟨27200,27264,16064,16128⟩)) (.node (.single ⟨27264,27392,15872,16000⟩) (.single ⟨27264,27392,16000,16128⟩))))))
def output83 : Fin 28 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData83 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover83 (i : Fin 28) : Fin 28 := ⟨coverData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 28) : Fin 28 := ⟨sourceData83.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 (.cutY 16896 (.cutX 5376 .empty (.cutY 16640 .empty (.cutX 5504 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 5568 (.cutY 16704 .full .full) (.cutY 16704 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 .empty (.cutY 27136 .empty (.cutX 16128 (.cutY 27392 (.cutX 16000 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 16064 (.cutY 27200 .full .full) (.cutY 27200 .full .full)) .full)) .empty) .empty))) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 (.cutY 5632 (.cutX 16640 .empty (.cutY 5376 .empty (.cutX 16768 (.cutY 5504 .full (.cutX 16704 (.cutY 5568 .full .full) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty) .empty)) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 .empty (.cutY 15872 .empty (.cutX 27392 (.cutY 16128 (.cutX 27264 (.cutY 16000 .full (.cutX 27200 (.cutY 16064 .full .full) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty) .empty)))) .empty)))) .empty))) .empty))

theorem metadata83 : 0<191564598 ∧ 21<128 ∧ 65<128 ∧ 0<4 ∧
    2312/4160=0 ∧ 2312%4160=2312 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 4616, atom 6010, type 1, source (16,58).
def leavesData84 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves84 : Fin 10 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 58 leaves84 i
def outputData84 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,14848,14976⟩) (.single ⟨4096,4224,14976,15104⟩)) (.node (.single ⟨4224,4288,14848,14912⟩) (.node (.single ⟨4224,4288,14912,14976⟩) (.single ⟨4288,4320,14848,14880⟩)))) (.node (.node (.single ⟨4288,4320,14880,14912⟩) (.single ⟨4320,4352,14848,14880⟩)) (.node (.single ⟨4320,4352,14880,14912⟩) (.node (.single ⟨4288,4352,14912,14976⟩) (.single ⟨4224,4352,14976,15104⟩))))) (.node (.node (.node (.single ⟨14848,14976,4096,4224⟩) (.single ⟨14848,14912,4224,4288⟩)) (.node (.single ⟨14848,14880,4288,4320⟩) (.node (.single ⟨14848,14880,4320,4352⟩) (.single ⟨14880,14912,4288,4320⟩)))) (.node (.node (.single ⟨14880,14912,4320,4352⟩) (.single ⟨14912,14976,4224,4288⟩)) (.node (.single ⟨14912,14976,4288,4352⟩) (.node (.single ⟨14976,15104,4096,4224⟩) (.single ⟨14976,15104,4224,4352⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17792,28416,28544⟩) (.single ⟨17664,17792,28544,28672⟩)) (.node (.single ⟨17792,17856,28416,28480⟩) (.node (.single ⟨17792,17856,28480,28544⟩) (.single ⟨17856,17888,28416,28448⟩)))) (.node (.node (.single ⟨17856,17888,28448,28480⟩) (.single ⟨17888,17920,28416,28448⟩)) (.node (.single ⟨17888,17920,28448,28480⟩) (.node (.single ⟨17856,17920,28480,28544⟩) (.single ⟨17792,17920,28544,28672⟩))))) (.node (.node (.node (.single ⟨28416,28544,17664,17792⟩) (.single ⟨28416,28480,17792,17856⟩)) (.node (.single ⟨28416,28448,17856,17888⟩) (.node (.single ⟨28416,28448,17888,17920⟩) (.single ⟨28448,28480,17856,17888⟩)))) (.node (.node (.single ⟨28448,28480,17888,17920⟩) (.single ⟨28480,28544,17792,17856⟩)) (.node (.single ⟨28480,28544,17856,17920⟩) (.node (.single ⟨28544,28672,17664,17792⟩) (.single ⟨28544,28672,17792,17920⟩)))))))
def output84 : Fin 40 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData84 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover84 (i : Fin 40) : Fin 40 := ⟨coverData84.get i % 40, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 40) : Fin 40 := ⟨sourceData84.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 (.cutX 4608 (.cutY 14848 .empty (.cutX 4352 (.cutY 15104 (.cutX 4224 (.cutY 14976 .full .full) (.cutY 14976 (.cutX 4288 (.cutY 14912 .full .full) (.cutY 14912 (.cutX 4320 (.cutY 14880 .full .full) (.cutY 14880 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 (.cutY 5120 (.cutX 14848 .empty (.cutY 4608 (.cutX 15104 (.cutY 4352 (.cutX 14976 (.cutY 4224 .full (.cutX 14912 (.cutY 4288 .full (.cutX 14880 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty) .empty) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 .empty (.cutY 27648 .empty (.cutX 17920 (.cutY 28160 .empty (.cutX 17664 .empty (.cutY 28416 .empty (.cutX 17792 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 17856 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 17888 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))))) .empty)))) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 .empty (.cutX 28160 .empty (.cutY 17920 (.cutX 28416 .empty (.cutY 17664 .empty (.cutX 28544 (.cutY 17792 .full (.cutX 28480 (.cutY 17856 .full (.cutX 28448 (.cutY 17888 .full .full) (.cutY 17888 .full .full))) (.cutY 17856 .full .full))) (.cutY 17792 .full .full)))) .empty)))) .empty)) .empty) .empty) .empty))))

theorem metadata84 : 0<166308920 ∧ 16<128 ∧ 58<128 ∧ 1<4 ∧
    6010/4160=1 ∧ 6010%4160=1850 ∧ ∀ i, (leaves84 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData84).mp
    (by decide +kernel)

theorem sourceChecked84_0 : ∀ i : Fin 40,
    (fun i => output84 i = raw84 (source84 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked84 : ∀ i : Fin 40, (fun i => output84 i = raw84 (source84 i)) i :=
  forallFin_of_zero_offset (fun i => output84 i = raw84 (source84 i)) sourceChecked84_0

theorem coverChecked84_0 : ∀ i : Fin 40,
    (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked84 : ∀ i : Fin 40, (fun i => (output84 (cover84 i)).ContainsBox (raw84 i)) i :=
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 4617, atom 6291, type 1, source (19,60).
def leavesData85 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves85 : Fin 13 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 60 leaves85 i
def outputData85 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,15360,15424⟩) (.node (.single ⟨4864,4928,15424,15488⟩) (.single ⟨4928,4992,15360,15424⟩))) (.node (.single ⟨4928,4992,15424,15488⟩) (.node (.single ⟨4864,4992,15488,15616⟩) (.single ⟨4992,5056,15360,15424⟩)))) (.node (.node (.single ⟨4992,5056,15424,15488⟩) (.node (.single ⟨5056,5088,15360,15392⟩) (.single ⟨5056,5088,15392,15424⟩))) (.node (.node (.single ⟨5088,5120,15360,15392⟩) (.single ⟨5088,5120,15392,15424⟩)) (.node (.single ⟨5056,5120,15424,15488⟩) (.single ⟨4992,5120,15488,15616⟩))))) (.node (.node (.node (.single ⟨15360,15424,4864,4928⟩) (.node (.single ⟨15360,15424,4928,4992⟩) (.single ⟨15424,15488,4864,4928⟩))) (.node (.single ⟨15424,15488,4928,4992⟩) (.node (.single ⟨15360,15424,4992,5056⟩) (.single ⟨15360,15392,5056,5088⟩)))) (.node (.node (.single ⟨15360,15392,5088,5120⟩) (.node (.single ⟨15392,15424,5056,5088⟩) (.single ⟨15392,15424,5088,5120⟩))) (.node (.node (.single ⟨15424,15488,4992,5056⟩) (.single ⟨15424,15488,5056,5120⟩)) (.node (.single ⟨15488,15616,4864,4992⟩) (.single ⟨15488,15616,4992,5120⟩)))))) (.node (.node (.node (.node (.single ⟨17152,17280,27648,27776⟩) (.node (.single ⟨17152,17280,27776,27904⟩) (.single ⟨17280,17344,27648,27712⟩))) (.node (.single ⟨17280,17344,27712,27776⟩) (.node (.single ⟨17344,17376,27648,27680⟩) (.single ⟨17344,17376,27680,27712⟩)))) (.node (.node (.single ⟨17376,17408,27648,27680⟩) (.node (.single ⟨17376,17408,27680,27712⟩) (.single ⟨17344,17408,27712,27776⟩))) (.node (.node (.single ⟨17280,17344,27776,27840⟩) (.single ⟨17280,17344,27840,27904⟩)) (.node (.single ⟨17344,17408,27776,27840⟩) (.single ⟨17344,17408,27840,27904⟩))))) (.node (.node (.node (.single ⟨27648,27776,17152,17280⟩) (.node (.single ⟨27648,27712,17280,17344⟩) (.single ⟨27648,27680,17344,17376⟩))) (.node (.single ⟨27648,27680,17376,17408⟩) (.node (.single ⟨27680,27712,17344,17376⟩) (.single ⟨27680,27712,17376,17408⟩)))) (.node (.node (.single ⟨27712,27776,17280,17344⟩) (.node (.single ⟨27712,27776,17344,17408⟩) (.single ⟨27776,27904,17152,17280⟩))) (.node (.node (.single ⟨27776,27840,17280,17344⟩) (.single ⟨27776,27840,17344,17408⟩)) (.node (.single ⟨27840,27904,17280,17344⟩) (.single ⟨27840,27904,17344,17408⟩)))))))
def output85 : Fin 52 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData85 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover85 (i : Fin 52) : Fin 52 := ⟨coverData85.get i % 52, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 52) : Fin 52 := ⟨sourceData85.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 .empty (.cutY 15872 (.cutX 4864 .empty (.cutY 15616 (.cutX 4992 (.cutY 15488 (.cutX 4928 (.cutY 15424 .full .full) (.cutY 15424 .full .full)) .full) (.cutY 15488 (.cutX 5056 (.cutY 15424 .full .full) (.cutY 15424 (.cutX 5088 (.cutY 15392 .full .full) (.cutY 15392 .full .full)) .full)) .full)) .empty)) .empty))) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 (.cutY 4608 .empty (.cutX 15616 (.cutY 4864 .empty (.cutX 15488 (.cutY 4992 (.cutX 15424 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 15424 (.cutY 5056 .full (.cutX 15392 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty)) .empty) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 .empty (.cutY 28160 (.cutX 17152 .empty (.cutY 27904 (.cutX 17280 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 17344 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 17376 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 17344 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty))) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 (.cutY 16896 .empty (.cutX 27904 (.cutY 17152 .empty (.cutX 27776 (.cutY 17280 .full (.cutX 27712 (.cutY 17344 .full (.cutX 27680 (.cutY 17376 .full .full) (.cutY 17376 .full .full))) (.cutY 17344 .full .full))) (.cutY 17280 .full (.cutX 27840 (.cutY 17344 .full .full) (.cutY 17344 .full .full))))) .empty)) .empty) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata85 : 0<166308920 ∧ 19<128 ∧ 60<128 ∧ 1<4 ∧
    6291/4160=1 ∧ 6291%4160=2131 ∧ ∀ i, (leaves85 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData85).mp
    (by decide +kernel)

theorem sourceChecked85_0 : ∀ i : Fin 52,
    (fun i => output85 i = raw85 (source85 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked85 : ∀ i : Fin 52, (fun i => output85 i = raw85 (source85 i)) i :=
  forallFin_of_zero_offset (fun i => output85 i = raw85 (source85 i)) sourceChecked85_0

theorem coverChecked85_0 : ∀ i : Fin 52,
    (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked85 : ∀ i : Fin 52, (fun i => (output85 (cover85 i)).ContainsBox (raw85 i)) i :=
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 4618, atom 2563, type 0, source (24,67).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 24 67 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6144,6272,17152,17280⟩) (.node (.single ⟨6144,6272,17280,17408⟩) (.single ⟨6272,6336,17152,17216⟩))) (.node (.node (.single ⟨6272,6336,17216,17280⟩) (.single ⟨6336,6400,17152,17216⟩)) (.node (.single ⟨6336,6400,17216,17280⟩) (.single ⟨6272,6400,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,26368,26496⟩) (.node (.single ⟨15360,15488,26496,26624⟩) (.single ⟨15488,15552,26368,26432⟩))) (.node (.node (.single ⟨15488,15552,26432,26496⟩) (.single ⟨15552,15616,26368,26432⟩)) (.node (.single ⟨15552,15616,26432,26496⟩) (.single ⟨15488,15616,26496,26624⟩))))) (.node (.node (.node (.single ⟨17152,17280,6144,6272⟩) (.node (.single ⟨17152,17216,6272,6336⟩) (.single ⟨17152,17216,6336,6400⟩))) (.node (.node (.single ⟨17216,17280,6272,6336⟩) (.single ⟨17216,17280,6336,6400⟩)) (.node (.single ⟨17280,17408,6144,6272⟩) (.single ⟨17280,17408,6272,6400⟩)))) (.node (.node (.single ⟨26368,26496,15360,15488⟩) (.node (.single ⟨26368,26432,15488,15552⟩) (.single ⟨26368,26432,15552,15616⟩))) (.node (.node (.single ⟨26432,26496,15488,15552⟩) (.single ⟨26432,26496,15552,15616⟩)) (.node (.single ⟨26496,26624,15360,15488⟩) (.single ⟨26496,26624,15488,15616⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 (.cutY 16896 .empty (.cutX 6400 (.cutY 17152 .empty (.cutX 6272 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 6336 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 (.cutY 26112 .empty (.cutX 15616 (.cutY 26368 .empty (.cutX 15488 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 15552 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full))) .empty)) .empty))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 .empty (.cutY 6656 (.cutX 17152 .empty (.cutY 6400 (.cutX 17280 (.cutY 6272 .full (.cutX 17216 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty)) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 .empty (.cutY 15872 (.cutX 26368 .empty (.cutY 15616 (.cutX 26496 (.cutY 15488 .full (.cutX 26432 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty))))) .empty)) .empty))) .empty))

theorem metadata86 : 0<170092456 ∧ 24<128 ∧ 67<128 ∧ 0<4 ∧
    2563/4160=0 ∧ 2563%4160=2563 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 4619, atom 3271, type 0, source (34,75).
def leavesData87 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves87 : Fin 4 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 34 75 leaves87 i
def outputData87 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8704,8832,19200,19328⟩) (.single ⟨8704,8832,19328,19456⟩)) (.node (.single ⟨8832,8960,19200,19328⟩) (.single ⟨8832,8960,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,23808,23936⟩) (.single ⟨13312,13440,23936,24064⟩)) (.node (.single ⟨13440,13568,23808,23936⟩) (.single ⟨13440,13568,23936,24064⟩)))) (.node (.node (.node (.single ⟨19200,19328,8704,8832⟩) (.single ⟨19200,19328,8832,8960⟩)) (.node (.single ⟨19328,19456,8704,8832⟩) (.single ⟨19328,19456,8832,8960⟩))) (.node (.node (.single ⟨23808,23936,13312,13440⟩) (.single ⟨23808,23936,13440,13568⟩)) (.node (.single ⟨23936,24064,13312,13440⟩) (.single ⟨23936,24064,13440,13568⟩)))))
def output87 : Fin 16 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData87 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover87 (i : Fin 16) : Fin 16 := ⟨coverData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 16) : Fin 16 := ⟨sourceData87.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 .empty (.cutY 18944 .empty (.cutX 8960 (.cutY 19200 .empty (.cutX 8832 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty))) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 (.cutY 24064 (.cutX 13568 (.cutY 23808 .empty (.cutX 13440 (.cutY 23936 .full .full) (.cutY 23936 .full .full))) .empty) .empty) .empty)))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 .empty (.cutY 8704 .empty (.cutX 19200 .empty (.cutY 8960 (.cutX 19328 (.cutY 8832 .full .full) (.cutY 8832 .full .full)) .empty)))) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 (.cutY 13824 (.cutX 23808 .empty (.cutY 13568 (.cutX 23936 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty) .empty))) .empty))))) .empty) .empty))

theorem metadata87 : 0<109574533 ∧ 34<128 ∧ 75<128 ∧ 0<4 ∧
    3271/4160=0 ∧ 3271%4160=3271 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 4620, atom 2942, type 0, source (29,71).
def leavesData88 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves88 : Fin 4 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 29 71 leaves88 i
def outputData88 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7424,7552,18176,18304⟩) (.single ⟨7424,7552,18304,18432⟩)) (.node (.single ⟨7552,7680,18176,18304⟩) (.single ⟨7552,7680,18304,18432⟩))) (.node (.node (.single ⟨14336,14464,25088,25216⟩) (.single ⟨14336,14464,25216,25344⟩)) (.node (.single ⟨14464,14592,25088,25216⟩) (.single ⟨14464,14592,25216,25344⟩)))) (.node (.node (.node (.single ⟨18176,18304,7424,7552⟩) (.single ⟨18176,18304,7552,7680⟩)) (.node (.single ⟨18304,18432,7424,7552⟩) (.single ⟨18304,18432,7552,7680⟩))) (.node (.node (.single ⟨25088,25216,14336,14464⟩) (.single ⟨25088,25216,14464,14592⟩)) (.node (.single ⟨25216,25344,14336,14464⟩) (.single ⟨25216,25344,14464,14592⟩)))))
def output88 : Fin 16 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover88 (i : Fin 16) : Fin 16 := ⟨coverData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 16) : Fin 16 := ⟨sourceData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 .empty (.cutX 7680 (.cutY 17920 .empty (.cutX 7424 .empty (.cutY 18176 .empty (.cutX 7552 (.cutY 18304 .full .full) (.cutY 18304 .full .full))))) .empty))) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 (.cutX 14848 (.cutY 25088 .empty (.cutX 14592 (.cutY 25344 (.cutX 14464 (.cutY 25216 .full .full) (.cutY 25216 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 .empty (.cutX 17920 .empty (.cutY 7680 (.cutX 18176 .empty (.cutY 7424 .empty (.cutX 18304 (.cutY 7552 .full .full) (.cutY 7552 .full .full)))) .empty))))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 (.cutX 25088 .empty (.cutY 14848 (.cutX 25344 (.cutY 14592 (.cutX 25216 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty)) .empty))) .empty))

theorem metadata88 : 0<170092456 ∧ 29<128 ∧ 71<128 ∧ 0<4 ∧
    2942/4160=0 ∧ 2942%4160=2942 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 4621, atom 3600, type 0, source (40,80).
def leavesData89 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves89 : Fin 4 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 40 80 leaves89 i
def outputData89 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨10240,10368,20480,20608⟩) (.single ⟨10240,10368,20608,20736⟩)) (.node (.single ⟨10368,10496,20480,20608⟩) (.single ⟨10368,10496,20608,20736⟩))) (.node (.node (.single ⟨12032,12160,22272,22400⟩) (.single ⟨12032,12160,22400,22528⟩)) (.node (.single ⟨12160,12288,22272,22400⟩) (.single ⟨12160,12288,22400,22528⟩)))) (.node (.node (.node (.single ⟨20480,20608,10240,10368⟩) (.single ⟨20480,20608,10368,10496⟩)) (.node (.single ⟨20608,20736,10240,10368⟩) (.single ⟨20608,20736,10368,10496⟩))) (.node (.node (.single ⟨22272,22400,12032,12160⟩) (.single ⟨22272,22400,12160,12288⟩)) (.node (.single ⟨22400,22528,12032,12160⟩) (.single ⟨22400,22528,12160,12288⟩)))))
def output89 : Fin 16 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData89 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover89 (i : Fin 16) : Fin 16 := ⟨coverData89.get i % 16, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 16) : Fin 16 := ⟨sourceData89.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 (.cutY 21504 (.cutX 10752 (.cutY 20992 (.cutX 10496 (.cutY 20736 (.cutX 10368 (.cutY 20608 .full .full) (.cutY 20608 .full .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 21504 .empty (.cutX 11776 .empty (.cutY 22016 .empty (.cutX 12032 .empty (.cutY 22272 .empty (.cutX 12160 (.cutY 22400 .full .full) (.cutY 22400 .full .full)))))))) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 (.cutX 20992 (.cutY 10752 (.cutX 20736 (.cutY 10496 (.cutX 20608 (.cutY 10368 .full .full) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 11264 .empty (.cutX 22016 .empty (.cutY 11776 .empty (.cutX 22272 .empty (.cutY 12032 .empty (.cutX 22400 (.cutY 12160 .full .full) (.cutY 12160 .full .full))))))))) .empty) .empty))) .empty) .empty))

theorem metadata89 : 0<1701312 ∧ 40<128 ∧ 80<128 ∧ 0<4 ∧
    3600/4160=0 ∧ 3600%4160=3600 ∧ ∀ i, (leaves89 i).Valid 8 := by
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (1701312/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (26583/25600000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 4622, atom 3331, type 0, source (35,76).
def leavesData90 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves90 : Fin 4 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 35 76 leaves90 i
def outputData90 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨8960,9088,19456,19584⟩) (.single ⟨8960,9088,19584,19712⟩)) (.node (.single ⟨9088,9216,19456,19584⟩) (.single ⟨9088,9216,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,23552,23680⟩) (.single ⟨13056,13184,23680,23808⟩)) (.node (.single ⟨13184,13312,23552,23680⟩) (.single ⟨13184,13312,23680,23808⟩)))) (.node (.node (.node (.single ⟨19456,19584,8960,9088⟩) (.single ⟨19456,19584,9088,9216⟩)) (.node (.single ⟨19584,19712,8960,9088⟩) (.single ⟨19584,19712,9088,9216⟩))) (.node (.node (.single ⟨23552,23680,13056,13184⟩) (.single ⟨23552,23680,13184,13312⟩)) (.node (.single ⟨23680,23808,13056,13184⟩) (.single ⟨23680,23808,13184,13312⟩)))))
def output90 : Fin 16 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData90 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover90 (i : Fin 16) : Fin 16 := ⟨coverData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 16) : Fin 16 := ⟨sourceData90.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 .empty (.cutX 8704 .empty (.cutY 19968 (.cutX 8960 .empty (.cutY 19712 (.cutX 9088 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty)) .empty))) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 .empty (.cutX 12800 .empty (.cutY 24064 (.cutX 13056 .empty (.cutY 23808 (.cutX 13184 (.cutY 23680 .full .full) (.cutY 23680 .full .full)) .empty)) .empty))) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 (.cutX 19968 (.cutY 8704 .empty (.cutX 19712 (.cutY 8960 .empty (.cutX 19584 (.cutY 9088 .full .full) (.cutY 9088 .full .full))) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 (.cutX 24064 (.cutY 12800 .empty (.cutX 23808 (.cutY 13056 .empty (.cutX 23680 (.cutY 13184 .full .full) (.cutY 13184 .full .full))) .empty)) .empty) .empty)) .empty))))) .empty) .empty))

theorem metadata90 : 0<109574533 ∧ 35<128 ∧ 76<128 ∧ 0<4 ∧
    3331/4160=0 ∧ 3331%4160=3331 ∧ ∀ i, (leaves90 i).Valid 8 := by
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 4623, atom 5174, type 1, source (8,54).
def leavesData91 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves91 : Fin 13 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 8 54 leaves91 i
def outputData91 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,13824,13888⟩) (.node (.single ⟨2048,2112,13888,13952⟩) (.single ⟨2112,2176,13824,13888⟩))) (.node (.single ⟨2112,2176,13888,13952⟩) (.node (.single ⟨2048,2176,13952,14080⟩) (.single ⟨2176,2240,13824,13888⟩)))) (.node (.node (.single ⟨2176,2240,13888,13952⟩) (.node (.single ⟨2240,2272,13824,13856⟩) (.single ⟨2240,2272,13856,13888⟩))) (.node (.node (.single ⟨2272,2304,13824,13856⟩) (.single ⟨2272,2304,13856,13888⟩)) (.node (.single ⟨2240,2304,13888,13952⟩) (.single ⟨2176,2304,13952,14080⟩))))) (.node (.node (.node (.single ⟨13824,13888,2048,2112⟩) (.node (.single ⟨13824,13888,2112,2176⟩) (.single ⟨13888,13952,2048,2112⟩))) (.node (.single ⟨13888,13952,2112,2176⟩) (.node (.single ⟨13824,13888,2176,2240⟩) (.single ⟨13824,13856,2240,2272⟩)))) (.node (.node (.single ⟨13824,13856,2272,2304⟩) (.node (.single ⟨13856,13888,2240,2272⟩) (.single ⟨13856,13888,2272,2304⟩))) (.node (.node (.single ⟨13888,13952,2176,2240⟩) (.single ⟨13888,13952,2240,2304⟩)) (.node (.single ⟨13952,14080,2048,2176⟩) (.single ⟨13952,14080,2176,2304⟩)))))) (.node (.node (.node (.node (.single ⟨18688,18816,30464,30592⟩) (.node (.single ⟨18688,18816,30592,30720⟩) (.single ⟨18816,18880,30464,30528⟩))) (.node (.single ⟨18816,18880,30528,30592⟩) (.node (.single ⟨18880,18912,30464,30496⟩) (.single ⟨18880,18912,30496,30528⟩)))) (.node (.node (.single ⟨18912,18944,30464,30496⟩) (.node (.single ⟨18912,18944,30496,30528⟩) (.single ⟨18880,18944,30528,30592⟩))) (.node (.node (.single ⟨18816,18880,30592,30656⟩) (.single ⟨18816,18880,30656,30720⟩)) (.node (.single ⟨18880,18944,30592,30656⟩) (.single ⟨18880,18944,30656,30720⟩))))) (.node (.node (.node (.single ⟨30464,30592,18688,18816⟩) (.node (.single ⟨30464,30528,18816,18880⟩) (.single ⟨30464,30496,18880,18912⟩))) (.node (.single ⟨30464,30496,18912,18944⟩) (.node (.single ⟨30496,30528,18880,18912⟩) (.single ⟨30496,30528,18912,18944⟩)))) (.node (.node (.single ⟨30528,30592,18816,18880⟩) (.node (.single ⟨30528,30592,18880,18944⟩) (.single ⟨30592,30720,18688,18816⟩))) (.node (.node (.single ⟨30592,30656,18816,18880⟩) (.single ⟨30592,30656,18880,18944⟩)) (.node (.single ⟨30656,30720,18816,18880⟩) (.single ⟨30656,30720,18880,18944⟩)))))))
def output91 : Fin 52 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 0))) (.node (.node (.single 13) (.single 51)) (.node (.single 38) (.single 1))))) (.node (.node (.node (.single 15) (.node (.single 50) (.single 36))) (.node (.single 2) (.node (.single 14) (.single 49)))) (.node (.node (.single 37) (.node (.single 3) (.single 16))) (.node (.node (.single 48) (.single 35)) (.node (.single 5) (.single 17)))))) (.node (.node (.node (.node (.single 46) (.node (.single 34) (.single 6))) (.node (.single 22) (.node (.single 45) (.single 29)))) (.node (.node (.single 11) (.node (.single 23) (.single 40))) (.node (.node (.single 28) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData91 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover91 (i : Fin 52) : Fin 52 := ⟨coverData91.get i % 52, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 52) : Fin 52 := ⟨sourceData91.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 (.cutX 3072 (.cutY 13312 .empty (.cutX 2560 (.cutY 13824 .empty (.cutX 2304 (.cutY 14080 (.cutX 2176 (.cutY 13952 (.cutX 2112 (.cutY 13888 .full .full) (.cutY 13888 .full .full)) .full) (.cutY 13952 (.cutX 2240 (.cutY 13888 .full .full) (.cutY 13888 (.cutX 2272 (.cutY 13856 .full .full) (.cutY 13856 .full .full)) .full)) .full)) .empty) .empty)) .empty)) .empty) .empty))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 (.cutY 2048 .empty (.cutX 13312 .empty (.cutY 3072 (.cutX 13824 .empty (.cutY 2560 (.cutX 14080 (.cutY 2304 (.cutX 13952 (.cutY 2176 (.cutX 13888 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 13888 (.cutY 2240 .full (.cutX 13856 (.cutY 2272 .full .full) (.cutY 2272 .full .full))) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty) .empty) .empty)) .empty))) .empty) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 .empty (.cutY 30720 (.cutX 19456 (.cutY 29696 .empty (.cutX 18944 (.cutY 30208 .empty (.cutX 18688 .empty (.cutY 30464 .empty (.cutX 18816 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 18880 (.cutY 30528 .full .full) (.cutY 30528 (.cutX 18912 (.cutY 30496 .full .full) (.cutY 30496 .full .full)) .full)) (.cutX 18880 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))))) .empty)) .empty) .empty))) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 .empty (.cutX 29696 .empty (.cutY 19456 (.cutX 30208 .empty (.cutY 18944 (.cutX 30464 .empty (.cutY 18688 .empty (.cutX 30592 (.cutY 18816 .full (.cutX 30528 (.cutY 18880 .full (.cutX 30496 (.cutY 18912 .full .full) (.cutY 18912 .full .full))) (.cutY 18880 .full .full))) (.cutY 18816 .full (.cutX 30656 (.cutY 18880 .full .full) (.cutY 18880 .full .full)))))) .empty)) .empty))) .empty) .empty)) .empty))))

theorem metadata91 : 0<144841863 ∧ 8<128 ∧ 54<128 ∧ 1<4 ∧
    5174/4160=1 ∧ 5174%4160=1014 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 52,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 52, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) sourceChecked91_0

theorem coverChecked91_0 : ∀ i : Fin 52,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 52, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (144841863/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (144841863/1638400000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 4624, atom 431, type 0, source (3,56).
def leavesData92 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves92 : Fin 4 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 3 56 leaves92 i
def outputData92 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨768,896,14336,14464⟩) (.single ⟨768,896,14464,14592⟩)) (.node (.single ⟨896,1024,14336,14464⟩) (.single ⟨896,1024,14464,14592⟩))) (.node (.node (.single ⟨14336,14464,768,896⟩) (.single ⟨14336,14464,896,1024⟩)) (.node (.single ⟨14464,14592,768,896⟩) (.single ⟨14464,14592,896,1024⟩)))) (.node (.node (.node (.single ⟨18176,18304,31744,31872⟩) (.single ⟨18176,18304,31872,32000⟩)) (.node (.single ⟨18304,18432,31744,31872⟩) (.single ⟨18304,18432,31872,32000⟩))) (.node (.node (.single ⟨31744,31872,18176,18304⟩) (.single ⟨31744,31872,18304,18432⟩)) (.node (.single ⟨31872,32000,18176,18304⟩) (.single ⟨31872,32000,18304,18432⟩)))))
def output92 : Fin 16 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData92 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover92 (i : Fin 16) : Fin 16 := ⟨coverData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 16) : Fin 16 := ⟨sourceData92.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 (.cutY 15360 (.cutX 512 .empty (.cutY 14848 (.cutX 768 .empty (.cutY 14592 (.cutX 896 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty)) .empty) .empty)) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 (.cutX 14848 (.cutY 512 .empty (.cutX 14592 (.cutY 768 .empty (.cutX 14464 (.cutY 896 .full .full) (.cutY 896 .full .full))) .empty)) .empty) .empty) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 .empty (.cutX 17920 .empty (.cutY 32256 (.cutX 18176 .empty (.cutY 32000 (.cutX 18304 (.cutY 31872 .full .full) (.cutY 31872 .full .full)) .empty)) .empty))))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 .empty (.cutY 17408 .empty (.cutX 32256 (.cutY 17920 .empty (.cutX 32000 (.cutY 18176 .empty (.cutX 31872 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)) .empty))) .empty)) .empty)) .empty))))

theorem metadata92 : 0<89519217 ∧ 3<128 ∧ 56<128 ∧ 0<4 ∧
    431/4160=0 ∧ 431%4160=431 ∧ ∀ i, (leaves92 i).Valid 8 := by
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (89519217/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (89519217/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 4625, atom 904, type 0, source (7,57).
def leavesData93 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves93 : Fin 4 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 7 57 leaves93 i
def outputData93 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨1792,1920,14592,14720⟩) (.single ⟨1792,1920,14720,14848⟩)) (.node (.single ⟨1920,2048,14592,14720⟩) (.single ⟨1920,2048,14720,14848⟩))) (.node (.node (.single ⟨14592,14720,1792,1920⟩) (.single ⟨14592,14720,1920,2048⟩)) (.node (.single ⟨14720,14848,1792,1920⟩) (.single ⟨14720,14848,1920,2048⟩)))) (.node (.node (.node (.single ⟨17920,18048,30720,30848⟩) (.single ⟨17920,18048,30848,30976⟩)) (.node (.single ⟨18048,18176,30720,30848⟩) (.single ⟨18048,18176,30848,30976⟩))) (.node (.node (.single ⟨30720,30848,17920,18048⟩) (.single ⟨30720,30848,18048,18176⟩)) (.node (.single ⟨30848,30976,17920,18048⟩) (.single ⟨30848,30976,18048,18176⟩)))))
def output93 : Fin 16 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData93 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover93 (i : Fin 16) : Fin 16 := ⟨coverData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 16) : Fin 16 := ⟨sourceData93.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 (.cutY 14336 .empty (.cutX 1024 .empty (.cutY 15360 (.cutX 1536 .empty (.cutY 14848 (.cutX 1792 .empty (.cutY 14592 .empty (.cutX 1920 (.cutY 14720 .full .full) (.cutY 14720 .full .full)))) .empty)) .empty))) .empty)) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 (.cutX 15360 (.cutY 1024 .empty (.cutX 14848 (.cutY 1536 .empty (.cutX 14592 .empty (.cutY 1792 .empty (.cutX 14720 (.cutY 1920 .full .full) (.cutY 1920 .full .full))))) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 .empty (.cutX 17408 .empty (.cutY 31744 (.cutX 17920 .empty (.cutY 31232 (.cutX 18176 (.cutY 30976 (.cutX 18048 (.cutY 30848 .full .full) (.cutY 30848 .full .full)) .empty) .empty) .empty)) .empty))) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 .empty (.cutY 18432 (.cutX 31744 (.cutY 17408 .empty (.cutX 31232 (.cutY 17920 .empty (.cutX 30976 (.cutY 18176 (.cutX 30848 (.cutY 18048 .full .full) (.cutY 18048 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty)) .empty))))

theorem metadata93 : 0<89519217 ∧ 7<128 ∧ 57<128 ∧ 0<4 ∧
    904/4160=0 ∧ 904%4160=904 ∧ ∀ i, (leaves93 i).Valid 8 := by
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

-- Frozen phase 4626, atom 7428, type 1, source (34,72).
def leavesData94 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves94 : Fin 10 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 34 72 leaves94 i
def outputData94 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8704,8832,18432,18560⟩) (.single ⟨8704,8832,18560,18688⟩)) (.node (.single ⟨8832,8896,18432,18496⟩) (.node (.single ⟨8832,8896,18496,18560⟩) (.single ⟨8896,8928,18432,18464⟩)))) (.node (.node (.single ⟨8896,8928,18464,18496⟩) (.single ⟨8928,8960,18432,18464⟩)) (.node (.single ⟨8928,8960,18464,18496⟩) (.node (.single ⟨8896,8960,18496,18560⟩) (.single ⟨8832,8960,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,23808,23936⟩) (.single ⟨14080,14208,23936,24064⟩)) (.node (.single ⟨14208,14272,23808,23872⟩) (.node (.single ⟨14208,14272,23872,23936⟩) (.single ⟨14272,14304,23808,23840⟩)))) (.node (.node (.single ⟨14272,14304,23840,23872⟩) (.single ⟨14304,14336,23808,23840⟩)) (.node (.single ⟨14304,14336,23840,23872⟩) (.node (.single ⟨14272,14336,23872,23936⟩) (.single ⟨14208,14336,23936,24064⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18560,8704,8832⟩) (.single ⟨18432,18496,8832,8896⟩)) (.node (.single ⟨18432,18464,8896,8928⟩) (.node (.single ⟨18432,18464,8928,8960⟩) (.single ⟨18464,18496,8896,8928⟩)))) (.node (.node (.single ⟨18464,18496,8928,8960⟩) (.single ⟨18496,18560,8832,8896⟩)) (.node (.single ⟨18496,18560,8896,8960⟩) (.node (.single ⟨18560,18688,8704,8832⟩) (.single ⟨18560,18688,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,14080,14208⟩) (.single ⟨23808,23872,14208,14272⟩)) (.node (.single ⟨23808,23840,14272,14304⟩) (.node (.single ⟨23808,23840,14304,14336⟩) (.single ⟨23840,23872,14272,14304⟩)))) (.node (.node (.single ⟨23840,23872,14304,14336⟩) (.single ⟨23872,23936,14208,14272⟩)) (.node (.single ⟨23872,23936,14272,14336⟩) (.node (.single ⟨23936,24064,14080,14208⟩) (.single ⟨23936,24064,14208,14336⟩)))))))
def output94 : Fin 40 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover94 (i : Fin 40) : Fin 40 := ⟨coverData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 40) : Fin 40 := ⟨sourceData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 .empty (.cutY 18944 (.cutX 8960 (.cutY 18688 (.cutX 8832 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 8896 (.cutY 18496 .full .full) (.cutY 18496 (.cutX 8928 (.cutY 18464 .full .full) (.cutY 18464 .full .full)) .full)) .full)) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 .empty (.cutY 24064 (.cutX 14080 .empty (.cutY 23808 .empty (.cutX 14208 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 14272 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 14304 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) .full)))) .empty))))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 (.cutY 8704 .empty (.cutX 18688 (.cutY 8960 (.cutX 18560 (.cutY 8832 .full (.cutX 18496 (.cutY 8896 .full (.cutX 18464 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty) .empty)) .empty) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 (.cutY 13824 .empty (.cutX 23808 .empty (.cutY 14080 .empty (.cutX 23936 (.cutY 14208 .full (.cutX 23872 (.cutY 14272 .full (.cutX 23840 (.cutY 14304 .full .full) (.cutY 14304 .full .full))) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))) .empty))) .empty))))) .empty) .empty))

theorem metadata94 : 0<167101800 ∧ 34<128 ∧ 72<128 ∧ 1<4 ∧
    7428/4160=1 ∧ 7428%4160=3268 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (835509/8192000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 4627, atom 1854, type 0, source (16,62).
def leavesData95 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves95 : Fin 4 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 16 62 leaves95 i
def outputData95 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨4096,4224,15872,16000⟩) (.single ⟨4096,4224,16000,16128⟩)) (.node (.single ⟨4224,4352,15872,16000⟩) (.single ⟨4224,4352,16000,16128⟩))) (.node (.node (.single ⟨15872,16000,4096,4224⟩) (.single ⟨15872,16000,4224,4352⟩)) (.node (.single ⟨16000,16128,4096,4224⟩) (.single ⟨16000,16128,4224,4352⟩)))) (.node (.node (.node (.single ⟨16640,16768,28416,28544⟩) (.single ⟨16640,16768,28544,28672⟩)) (.node (.single ⟨16768,16896,28416,28544⟩) (.single ⟨16768,16896,28544,28672⟩))) (.node (.node (.single ⟨28416,28544,16640,16768⟩) (.single ⟨28416,28544,16768,16896⟩)) (.node (.single ⟨28544,28672,16640,16768⟩) (.single ⟨28544,28672,16768,16896⟩)))))
def output95 : Fin 16 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData95 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover95 (i : Fin 16) : Fin 16 := ⟨coverData95.get i % 16, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 16) : Fin 16 := ⟨sourceData95.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 (.cutY 15360 .empty (.cutX 4608 (.cutY 15872 .empty (.cutX 4352 (.cutY 16128 (.cutX 4224 (.cutY 16000 .full .full) (.cutY 16000 .full .full)) .empty) .empty)) .empty)) .empty)) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 (.cutX 15872 .empty (.cutY 4608 (.cutX 16128 (.cutY 4352 (.cutX 16000 (.cutY 4224 .full .full) (.cutY 4224 .full .full)) .empty) .empty) .empty)) .empty)) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 .empty (.cutX 16896 (.cutY 28160 .empty (.cutX 16640 .empty (.cutY 28416 .empty (.cutX 16768 (.cutY 28544 .full .full) (.cutY 28544 .full .full))))) .empty)) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 .empty (.cutY 17408 (.cutX 28160 .empty (.cutY 16896 (.cutX 28416 .empty (.cutY 16640 .empty (.cutX 28544 (.cutY 16768 .full .full) (.cutY 16768 .full .full)))) .empty)) .empty)) .empty)) .empty) .empty) .empty))))

theorem metadata95 : 0<185830537 ∧ 16<128 ∧ 62<128 ∧ 0<4 ∧
    1854/4160=0 ∧ 1854%4160=1854 ∧ ∀ i, (leaves95 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData95).mp
    (by decide +kernel)

theorem sourceChecked95_0 : ∀ i : Fin 16,
    (fun i => output95 i = raw95 (source95 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked95 : ∀ i : Fin 16, (fun i => output95 i = raw95 (source95 i)) i :=
  forallFin_of_zero_offset (fun i => output95 i = raw95 (source95 i)) sourceChecked95_0

theorem coverChecked95_0 : ∀ i : Fin 16,
    (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked95 : ∀ i : Fin 16, (fun i => (output95 (cover95 i)).ContainsBox (raw95 i)) i :=
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (185830537/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (185830537/1638400000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 4628, atom 2135, type 0, source (19,64).
def leavesData96 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves96 : Fin 7 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 19 64 leaves96 i
def outputData96 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨4864,4992,16384,16512⟩) (.node (.single ⟨4864,4992,16512,16640⟩) (.single ⟨4992,5056,16384,16448⟩))) (.node (.node (.single ⟨4992,5056,16448,16512⟩) (.single ⟨5056,5120,16384,16448⟩)) (.node (.single ⟨5056,5120,16448,16512⟩) (.single ⟨4992,5120,16512,16640⟩)))) (.node (.node (.single ⟨16128,16256,27648,27776⟩) (.node (.single ⟨16128,16256,27776,27904⟩) (.single ⟨16256,16320,27648,27712⟩))) (.node (.node (.single ⟨16256,16320,27712,27776⟩) (.single ⟨16320,16384,27648,27712⟩)) (.node (.single ⟨16320,16384,27712,27776⟩) (.single ⟨16256,16384,27776,27904⟩))))) (.node (.node (.node (.single ⟨16384,16512,4864,4992⟩) (.node (.single ⟨16384,16448,4992,5056⟩) (.single ⟨16384,16448,5056,5120⟩))) (.node (.node (.single ⟨16448,16512,4992,5056⟩) (.single ⟨16448,16512,5056,5120⟩)) (.node (.single ⟨16512,16640,4864,4992⟩) (.single ⟨16512,16640,4992,5120⟩)))) (.node (.node (.single ⟨27648,27776,16128,16256⟩) (.node (.single ⟨27648,27712,16256,16320⟩) (.single ⟨27648,27712,16320,16384⟩))) (.node (.node (.single ⟨27712,27776,16256,16320⟩) (.single ⟨27712,27776,16320,16384⟩)) (.node (.single ⟨27776,27904,16128,16256⟩) (.single ⟨27776,27904,16256,16384⟩))))))
def output96 : Fin 28 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData96 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover96 (i : Fin 28) : Fin 28 := ⟨coverData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 28) : Fin 28 := ⟨sourceData96.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 (.cutY 17408 (.cutX 4608 .empty (.cutY 16896 (.cutX 4864 .empty (.cutY 16640 (.cutX 4992 (.cutY 16512 .full .full) (.cutY 16512 (.cutX 5056 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 .empty (.cutX 15872 .empty (.cutY 28160 (.cutX 16128 .empty (.cutY 27904 (.cutX 16256 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 16320 (.cutY 27712 .full .full) (.cutY 27712 .full .full)) .full)) .empty)) .empty)))))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 (.cutX 16896 (.cutY 4608 .empty (.cutX 16640 (.cutY 4864 .empty (.cutX 16512 (.cutY 4992 .full (.cutX 16448 (.cutY 5056 .full .full) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 .empty (.cutY 15360 .empty (.cutX 28160 (.cutY 15872 .empty (.cutX 27904 (.cutY 16128 .empty (.cutX 27776 (.cutY 16256 .full (.cutX 27712 (.cutY 16320 .full .full) (.cutY 16320 .full .full))) (.cutY 16256 .full .full))) .empty)) .empty)))))) .empty))) .empty))

theorem metadata96 : 0<191564598 ∧ 19<128 ∧ 64<128 ∧ 0<4 ∧
    2135/4160=0 ∧ 2135%4160=2135 ∧ ∀ i, (leaves96 i).Valid 8 := by
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 4629, atom 6554, type 1, source (22,62).
def leavesData97 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves97 : Fin 13 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 62 leaves97 i
def outputData97 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,15872,15936⟩) (.node (.single ⟨5632,5696,15936,16000⟩) (.single ⟨5696,5760,15872,15936⟩))) (.node (.single ⟨5696,5760,15936,16000⟩) (.node (.single ⟨5632,5760,16000,16128⟩) (.single ⟨5760,5824,15872,15936⟩)))) (.node (.node (.single ⟨5760,5824,15936,16000⟩) (.node (.single ⟨5824,5856,15872,15904⟩) (.single ⟨5824,5856,15904,15936⟩))) (.node (.node (.single ⟨5856,5888,15872,15904⟩) (.single ⟨5856,5888,15904,15936⟩)) (.node (.single ⟨5824,5888,15936,16000⟩) (.single ⟨5760,5888,16000,16128⟩))))) (.node (.node (.node (.single ⟨15872,15936,5632,5696⟩) (.node (.single ⟨15872,15936,5696,5760⟩) (.single ⟨15936,16000,5632,5696⟩))) (.node (.single ⟨15936,16000,5696,5760⟩) (.node (.single ⟨15872,15936,5760,5824⟩) (.single ⟨15872,15904,5824,5856⟩)))) (.node (.node (.single ⟨15872,15904,5856,5888⟩) (.node (.single ⟨15904,15936,5824,5856⟩) (.single ⟨15904,15936,5856,5888⟩))) (.node (.node (.single ⟨15936,16000,5760,5824⟩) (.single ⟨15936,16000,5824,5888⟩)) (.node (.single ⟨16000,16128,5632,5760⟩) (.single ⟨16000,16128,5760,5888⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,26880,27008⟩) (.node (.single ⟨16640,16768,27008,27136⟩) (.single ⟨16768,16832,26880,26944⟩))) (.node (.single ⟨16768,16832,26944,27008⟩) (.node (.single ⟨16832,16864,26880,26912⟩) (.single ⟨16832,16864,26912,26944⟩)))) (.node (.node (.single ⟨16864,16896,26880,26912⟩) (.node (.single ⟨16864,16896,26912,26944⟩) (.single ⟨16832,16896,26944,27008⟩))) (.node (.node (.single ⟨16768,16832,27008,27072⟩) (.single ⟨16768,16832,27072,27136⟩)) (.node (.single ⟨16832,16896,27008,27072⟩) (.single ⟨16832,16896,27072,27136⟩))))) (.node (.node (.node (.single ⟨26880,27008,16640,16768⟩) (.node (.single ⟨26880,26944,16768,16832⟩) (.single ⟨26880,26912,16832,16864⟩))) (.node (.single ⟨26880,26912,16864,16896⟩) (.node (.single ⟨26912,26944,16832,16864⟩) (.single ⟨26912,26944,16864,16896⟩)))) (.node (.node (.single ⟨26944,27008,16768,16832⟩) (.node (.single ⟨26944,27008,16832,16896⟩) (.single ⟨27008,27136,16640,16768⟩))) (.node (.node (.single ⟨27008,27072,16768,16832⟩) (.single ⟨27008,27072,16832,16896⟩)) (.node (.single ⟨27072,27136,16768,16832⟩) (.single ⟨27072,27136,16832,16896⟩)))))))
def output97 : Fin 52 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 24) (.single 47))) (.node (.single 27) (.node (.single 12) (.single 25)))) (.node (.node (.single 39) (.node (.single 26) (.single 5))) (.node (.node (.single 17) (.single 46)) (.node (.single 34) (.single 6))))) (.node (.node (.node (.single 22) (.node (.single 45) (.single 29))) (.node (.single 11) (.node (.single 23) (.single 40)))) (.node (.node (.single 28) (.node (.single 0) (.single 13))) (.node (.node (.single 51) (.single 38)) (.node (.single 1) (.single 15)))))) (.node (.node (.node (.node (.single 50) (.node (.single 36) (.single 2))) (.node (.single 14) (.node (.single 49) (.single 37)))) (.node (.node (.single 3) (.node (.single 16) (.single 48))) (.node (.node (.single 35) (.single 7)) (.node (.single 18) (.single 44))))) (.node (.node (.node (.single 33) (.node (.single 8) (.single 20))) (.node (.single 43) (.node (.single 31) (.single 9)))) (.node (.node (.single 19) (.node (.single 42) (.single 32))) (.node (.node (.single 10) (.single 21)) (.node (.single 41) (.single 30)))))))
def sourceData97 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover97 (i : Fin 52) : Fin 52 := ⟨coverData97.get i % 52, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 52) : Fin 52 := ⟨sourceData97.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 .empty (.cutY 15872 .empty (.cutX 5888 (.cutY 16128 (.cutX 5760 (.cutY 16000 (.cutX 5696 (.cutY 15936 .full .full) (.cutY 15936 .full .full)) .full) (.cutY 16000 (.cutX 5824 (.cutY 15936 .full .full) (.cutY 15936 (.cutX 5856 (.cutY 15904 .full .full) (.cutY 15904 .full .full)) .full)) .full)) .empty) .empty)))))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 .empty (.cutY 5632 .empty (.cutX 16128 (.cutY 5888 (.cutX 16000 (.cutY 5760 (.cutX 15936 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 15936 (.cutY 5824 .full (.cutX 15904 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty))))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 (.cutY 27136 (.cutX 16640 .empty (.cutY 26880 .empty (.cutX 16768 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 16832 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 16864 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 16832 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty) .empty) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 (.cutY 16896 (.cutX 26880 .empty (.cutY 16640 .empty (.cutX 27008 (.cutY 16768 .full (.cutX 26944 (.cutY 16832 .full (.cutX 26912 (.cutY 16864 .full .full) (.cutY 16864 .full .full))) (.cutY 16832 .full .full))) (.cutY 16768 .full (.cutX 27072 (.cutY 16832 .full .full) (.cutY 16832 .full .full)))))) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata97 : 0<166308920 ∧ 22<128 ∧ 62<128 ∧ 1<4 ∧
    6554/4160=1 ∧ 6554%4160=2394 ∧ ∀ i, (leaves97 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData97).mp
    (by decide +kernel)

theorem sourceChecked97_0 : ∀ i : Fin 52,
    (fun i => output97 i = raw97 (source97 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked97 : ∀ i : Fin 52, (fun i => output97 i = raw97 (source97 i)) i :=
  forallFin_of_zero_offset (fun i => output97 i = raw97 (source97 i)) sourceChecked97_0

theorem coverChecked97_0 : ∀ i : Fin 52,
    (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked97 : ∀ i : Fin 52, (fun i => (output97 (cover97 i)).ContainsBox (raw97 i)) i :=
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

-- Frozen phase 4630, atom 7851, type 1, source (42,79).
def leavesData98 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves98 : Fin 10 → DyadicLeaf := leavesData98.get
def raw98 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 42 79 leaves98 i
def outputData98 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨10752,10880,20224,20352⟩) (.single ⟨10752,10880,20352,20480⟩)) (.node (.single ⟨10880,10944,20224,20288⟩) (.node (.single ⟨10880,10944,20288,20352⟩) (.single ⟨10944,10976,20224,20256⟩)))) (.node (.node (.single ⟨10944,10976,20256,20288⟩) (.single ⟨10976,11008,20224,20256⟩)) (.node (.single ⟨10976,11008,20256,20288⟩) (.node (.single ⟨10944,11008,20288,20352⟩) (.single ⟨10880,11008,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,21760,21888⟩) (.single ⟨12288,12416,21888,22016⟩)) (.node (.single ⟨12416,12480,21760,21824⟩) (.node (.single ⟨12416,12480,21824,21888⟩) (.single ⟨12480,12512,21760,21792⟩)))) (.node (.node (.single ⟨12480,12512,21792,21824⟩) (.single ⟨12512,12544,21760,21792⟩)) (.node (.single ⟨12512,12544,21792,21824⟩) (.node (.single ⟨12480,12544,21824,21888⟩) (.single ⟨12416,12544,21888,22016⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20352,10752,10880⟩) (.single ⟨20224,20288,10880,10944⟩)) (.node (.single ⟨20224,20256,10944,10976⟩) (.node (.single ⟨20224,20256,10976,11008⟩) (.single ⟨20256,20288,10944,10976⟩)))) (.node (.node (.single ⟨20256,20288,10976,11008⟩) (.single ⟨20288,20352,10880,10944⟩)) (.node (.single ⟨20288,20352,10944,11008⟩) (.node (.single ⟨20352,20480,10752,10880⟩) (.single ⟨20352,20480,10880,11008⟩))))) (.node (.node (.node (.single ⟨21760,21888,12288,12416⟩) (.single ⟨21760,21824,12416,12480⟩)) (.node (.single ⟨21760,21792,12480,12512⟩) (.node (.single ⟨21760,21792,12512,12544⟩) (.single ⟨21792,21824,12480,12512⟩)))) (.node (.node (.single ⟨21792,21824,12512,12544⟩) (.single ⟨21824,21888,12416,12480⟩)) (.node (.single ⟨21824,21888,12480,12544⟩) (.node (.single ⟨21888,22016,12288,12416⟩) (.single ⟨21888,22016,12416,12544⟩)))))))
def output98 : Fin 40 → GridBox := outputData98.get
def coverData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData98 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover98 (i : Fin 40) : Fin 40 := ⟨coverData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def source98 (i : Fin 40) : Fin 40 := ⟨sourceData98.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree98 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 .empty (.cutY 18432 .empty (.cutX 11264 (.cutY 19456 .empty (.cutX 10752 .empty (.cutY 19968 .empty (.cutX 11008 (.cutY 20224 .empty (.cutX 10880 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 10944 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 10976 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))) .empty)))) .empty))) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 (.cutX 13312 (.cutY 21504 .empty (.cutX 12800 (.cutY 22016 (.cutX 12544 (.cutY 21760 .empty (.cutX 12416 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 12480 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 12512 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 .empty (.cutX 19456 .empty (.cutY 11264 (.cutX 19968 .empty (.cutY 10752 .empty (.cutX 20224 .empty (.cutY 11008 (.cutX 20352 (.cutY 10880 .full (.cutX 20288 (.cutY 10944 .full (.cutX 20256 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty)))) .empty)))) .empty) (.cutY 12288 .empty (.cutX 22528 (.cutY 14336 (.cutX 21504 .empty (.cutY 13312 (.cutX 22016 (.cutY 12800 (.cutX 21760 .empty (.cutY 12544 (.cutX 21888 (.cutY 12416 .full (.cutX 21824 (.cutY 12480 .full (.cutX 21792 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty)))) .empty) .empty))

theorem metadata98 : 0<177315334 ∧ 42<128 ∧ 79<128 ∧ 1<4 ∧
    7851/4160=1 ∧ 7851%4160=3691 ∧ ∀ i, (leaves98 i).Valid 8 := by
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

noncomputable def phaseMass98 : ℝ := singlePhaseMass (177315334/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw98 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass98_eq : phaseMass98 = (88657667/819200000000 : ℝ) := by
  unfold phaseMass98
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw98 output98 cover98 source98
    (gridTreeUnionCheck_sound 32768 raw98 output98 cover98 source98 tree98 checked98)
    _ (by norm_num) _, areaUnits98]
  norm_num

-- Frozen phase 4631, atom 7976, type 1, source (45,81).
def leavesData99 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.single ⟨3,6,0⟩) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves99 : Fin 13 → DyadicLeaf := leavesData99.get
def raw99 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 45 81 leaves99 i
def outputData99 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨11520,11648,20736,20864⟩) (.node (.single ⟨11520,11648,20864,20992⟩) (.single ⟨11648,11712,20736,20800⟩))) (.node (.single ⟨11648,11712,20800,20864⟩) (.node (.single ⟨11712,11744,20736,20768⟩) (.single ⟨11712,11744,20768,20800⟩)))) (.node (.node (.single ⟨11744,11760,20736,20752⟩) (.node (.single ⟨11744,11760,20752,20768⟩) (.single ⟨11760,11776,20736,20752⟩))) (.node (.node (.single ⟨11760,11776,20752,20768⟩) (.single ⟨11744,11776,20768,20800⟩)) (.node (.single ⟨11712,11776,20800,20864⟩) (.single ⟨11648,11776,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,20992,21120⟩) (.node (.single ⟨11776,11904,21120,21248⟩) (.single ⟨11904,11968,20992,21056⟩))) (.node (.single ⟨11904,11968,21056,21120⟩) (.node (.single ⟨11968,12000,20992,21024⟩) (.single ⟨11968,12000,21024,21056⟩)))) (.node (.node (.single ⟨12000,12016,20992,21008⟩) (.node (.single ⟨12000,12016,21008,21024⟩) (.single ⟨12016,12032,20992,21008⟩))) (.node (.node (.single ⟨12016,12032,21008,21024⟩) (.single ⟨12000,12032,21024,21056⟩)) (.node (.single ⟨11968,12032,21056,21120⟩) (.single ⟨11904,12032,21120,21248⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20864,11520,11648⟩) (.node (.single ⟨20736,20800,11648,11712⟩) (.single ⟨20736,20768,11712,11744⟩))) (.node (.single ⟨20736,20752,11744,11760⟩) (.node (.single ⟨20736,20752,11760,11776⟩) (.single ⟨20752,20768,11744,11760⟩)))) (.node (.node (.single ⟨20752,20768,11760,11776⟩) (.node (.single ⟨20768,20800,11712,11744⟩) (.single ⟨20768,20800,11744,11776⟩))) (.node (.node (.single ⟨20800,20864,11648,11712⟩) (.single ⟨20800,20864,11712,11776⟩)) (.node (.single ⟨20864,20992,11520,11648⟩) (.single ⟨20864,20992,11648,11776⟩))))) (.node (.node (.node (.single ⟨20992,21120,11776,11904⟩) (.node (.single ⟨20992,21056,11904,11968⟩) (.single ⟨20992,21024,11968,12000⟩))) (.node (.single ⟨20992,21008,12000,12016⟩) (.node (.single ⟨20992,21008,12016,12032⟩) (.single ⟨21008,21024,12000,12016⟩)))) (.node (.node (.single ⟨21008,21024,12016,12032⟩) (.node (.single ⟨21024,21056,11968,12000⟩) (.single ⟨21024,21056,12000,12032⟩))) (.node (.node (.single ⟨21056,21120,11904,11968⟩) (.single ⟨21056,21120,11968,12032⟩)) (.node (.single ⟨21120,21248,11776,11904⟩) (.single ⟨21120,21248,11904,12032⟩)))))))
def output99 : Fin 52 → GridBox := outputData99.get
def coverData99 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 26) (.single 51))) (.node (.single 25) (.node (.single 1) (.single 37)))) (.node (.node (.single 50) (.node (.single 14) (.single 12))) (.node (.node (.single 38) (.single 39)) (.node (.single 13) (.single 2))))) (.node (.node (.node (.single 27) (.node (.single 49) (.single 24))) (.node (.single 3) (.node (.single 35) (.single 48)))) (.node (.node (.single 16) (.node (.single 11) (.single 36))) (.node (.node (.single 40) (.single 15)) (.node (.single 4) (.single 28)))))) (.node (.node (.node (.node (.single 47) (.node (.single 23) (.single 5))) (.node (.single 33) (.node (.single 46) (.single 18)))) (.node (.node (.single 10) (.node (.single 34) (.single 41))) (.node (.node (.single 17) (.single 6)) (.node (.single 29) (.single 45))))) (.node (.node (.node (.single 22) (.node (.single 7) (.single 31))) (.node (.single 44) (.node (.single 20) (.single 8)))) (.node (.node (.single 30) (.node (.single 43) (.single 21))) (.node (.node (.single 9) (.single 32)) (.node (.single 42) (.single 19)))))))
def sourceData99 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.single 16) (.node (.single 24) (.single 28)))) (.node (.node (.single 36) (.node (.single 40) (.single 44))) (.node (.node (.single 48) (.single 32)) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 7) (.single 23))) (.node (.single 19) (.node (.single 35) (.single 31)))) (.node (.node (.single 51) (.node (.single 43) (.single 47))) (.node (.node (.single 39) (.single 27)) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.node (.single 13) (.single 25))) (.node (.single 37) (.node (.single 45) (.single 41)))) (.node (.node (.single 49) (.node (.single 29) (.single 33))) (.node (.node (.single 17) (.single 21)) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.node (.single 22) (.single 34))) (.node (.single 50) (.node (.single 46) (.single 42)))) (.node (.node (.single 38) (.node (.single 30) (.single 26))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2)))))))
def cover99 (i : Fin 52) : Fin 52 := ⟨coverData99.get i % 52, Nat.mod_lt _ (by decide)⟩
def source99 (i : Fin 52) : Fin 52 := ⟨sourceData99.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree99 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 .empty (.cutY 22528 (.cutX 11264 .empty (.cutY 21504 (.cutX 11776 (.cutY 20992 (.cutX 11520 .empty (.cutY 20736 .empty (.cutX 11648 (.cutY 20864 .full .full) (.cutY 20864 (.cutX 11712 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 11744 (.cutY 20768 .full .full) (.cutY 20768 (.cutX 11760 (.cutY 20752 .full .full) (.cutY 20752 .full .full)) .full)) .full)) .full)))) .empty) (.cutY 20992 .empty (.cutX 12032 (.cutY 21248 (.cutX 11904 (.cutY 21120 .full .full) (.cutY 21120 (.cutX 11968 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 12000 (.cutY 21024 .full .full) (.cutY 21024 (.cutX 12016 (.cutY 21008 .full .full) (.cutY 21008 .full .full)) .full)) .full)) .full)) .empty) .empty))) .empty)) .empty))) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 (.cutY 10240 .empty (.cutX 21504 (.cutY 11264 .empty (.cutX 20992 (.cutY 11776 (.cutX 20736 .empty (.cutY 11520 .empty (.cutX 20864 (.cutY 11648 .full (.cutX 20800 (.cutY 11712 .full (.cutX 20768 (.cutY 11744 .full (.cutX 20752 (.cutY 11760 .full .full) (.cutY 11760 .full .full))) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full .full)))) .empty) (.cutY 11776 .empty (.cutX 21248 (.cutY 12032 (.cutX 21120 (.cutY 11904 .full (.cutX 21056 (.cutY 11968 .full (.cutX 21024 (.cutY 12000 .full (.cutX 21008 (.cutY 12016 .full .full) (.cutY 12016 .full .full))) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full .full)) .empty) .empty)))) .empty)) .empty) .empty))) .empty) .empty))

theorem metadata99 : 0<56923454 ∧ 45<128 ∧ 81<128 ∧ 1<4 ∧
    7976/4160=1 ∧ 7976%4160=3816 ∧ ∀ i, (leaves99 i).Valid 8 := by
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

noncomputable def phaseMass99 : ℝ := singlePhaseMass (56923454/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw99 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass99_eq : phaseMass99 = (28461727/819200000000 : ℝ) := by
  unfold phaseMass99
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw99 output99 cover99 source99
    (gridTreeUnionCheck_sound 32768 raw99 output99 cover99 source99 tree99 checked99)
    _ (by norm_num) _, areaUnits99]
  norm_num

-- Frozen phase 4632, atom 3389, type 0, source (36,77).
def leavesData100 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves100 : Fin 4 → DyadicLeaf := leavesData100.get
def raw100 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 36 77 leaves100 i
def outputData100 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨9216,9344,19712,19840⟩) (.single ⟨9216,9344,19840,19968⟩)) (.node (.single ⟨9344,9472,19712,19840⟩) (.single ⟨9344,9472,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,23296,23424⟩) (.single ⟨12800,12928,23424,23552⟩)) (.node (.single ⟨12928,13056,23296,23424⟩) (.single ⟨12928,13056,23424,23552⟩)))) (.node (.node (.node (.single ⟨19712,19840,9216,9344⟩) (.single ⟨19712,19840,9344,9472⟩)) (.node (.single ⟨19840,19968,9216,9344⟩) (.single ⟨19840,19968,9344,9472⟩))) (.node (.node (.single ⟨23296,23424,12800,12928⟩) (.single ⟨23296,23424,12928,13056⟩)) (.node (.single ⟨23424,23552,12800,12928⟩) (.single ⟨23424,23552,12928,13056⟩)))))
def output100 : Fin 16 → GridBox := outputData100.get
def coverData100 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData100 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover100 (i : Fin 16) : Fin 16 := ⟨coverData100.get i % 16, Nat.mod_lt _ (by decide)⟩
def source100 (i : Fin 16) : Fin 16 := ⟨sourceData100.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree100 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 .empty (.cutY 19456 .empty (.cutX 9728 (.cutY 19968 (.cutX 9472 (.cutY 19712 .empty (.cutX 9344 (.cutY 19840 .full .full) (.cutY 19840 .full .full))) .empty) .empty) .empty)))) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 (.cutY 23552 (.cutX 12800 .empty (.cutY 23040 .empty (.cutX 13056 (.cutY 23296 .empty (.cutX 12928 (.cutY 23424 .full .full) (.cutY 23424 .full .full))) .empty))) .empty) .empty)) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 .empty (.cutY 9216 .empty (.cutX 19968 (.cutY 9728 (.cutX 19712 .empty (.cutY 9472 (.cutX 19840 (.cutY 9344 .full .full) (.cutY 9344 .full .full)) .empty)) .empty) .empty))) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 (.cutY 13312 (.cutX 23040 .empty (.cutY 12800 .empty (.cutX 23296 .empty (.cutY 13056 (.cutX 23424 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty)))) .empty) .empty) .empty))))) .empty) .empty))

theorem metadata100 : 0<109574533 ∧ 36<128 ∧ 77<128 ∧ 0<4 ∧
    3389/4160=0 ∧ 3389%4160=3389 ∧ ∀ i, (leaves100 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData100).mp
    (by decide +kernel)

theorem sourceChecked100_0 : ∀ i : Fin 16,
    (fun i => output100 i = raw100 (source100 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked100 : ∀ i : Fin 16, (fun i => output100 i = raw100 (source100 i)) i :=
  forallFin_of_zero_offset (fun i => output100 i = raw100 (source100 i)) sourceChecked100_0

theorem coverChecked100_0 : ∀ i : Fin 16,
    (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked100 : ∀ i : Fin 16, (fun i => (output100 (cover100 i)).ContainsBox (raw100 i)) i :=
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

noncomputable def phaseMass100 : ℝ := singlePhaseMass (109574533/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw100 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass100_eq : phaseMass100 = (109574533/1638400000000 : ℝ) := by
  unfold phaseMass100
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw100 output100 cover100 source100
    (gridTreeUnionCheck_sound 32768 raw100 output100 cover100 source100 tree100 checked100)
    _ (by norm_num) _, areaUnits100]
  norm_num

-- Frozen phase 4633, atom 2643, type 0, source (25,68).
def leavesData101 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves101 : Fin 4 → DyadicLeaf := leavesData101.get
def raw101 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 25 68 leaves101 i
def outputData101 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨6400,6528,17408,17536⟩) (.single ⟨6400,6528,17536,17664⟩)) (.node (.single ⟨6528,6656,17408,17536⟩) (.single ⟨6528,6656,17536,17664⟩))) (.node (.node (.single ⟨15104,15232,26112,26240⟩) (.single ⟨15104,15232,26240,26368⟩)) (.node (.single ⟨15232,15360,26112,26240⟩) (.single ⟨15232,15360,26240,26368⟩)))) (.node (.node (.node (.single ⟨17408,17536,6400,6528⟩) (.single ⟨17408,17536,6528,6656⟩)) (.node (.single ⟨17536,17664,6400,6528⟩) (.single ⟨17536,17664,6528,6656⟩))) (.node (.node (.single ⟨26112,26240,15104,15232⟩) (.single ⟨26112,26240,15232,15360⟩)) (.node (.single ⟨26240,26368,15104,15232⟩) (.single ⟨26240,26368,15232,15360⟩)))))
def output101 : Fin 16 → GridBox := outputData101.get
def coverData101 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData101 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover101 (i : Fin 16) : Fin 16 := ⟨coverData101.get i % 16, Nat.mod_lt _ (by decide)⟩
def source101 (i : Fin 16) : Fin 16 := ⟨sourceData101.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree101 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 .empty (.cutX 6656 (.cutY 17920 (.cutX 6400 .empty (.cutY 17664 (.cutX 6528 (.cutY 17536 .full .full) (.cutY 17536 .full .full)) .empty)) .empty) .empty)) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 (.cutY 25600 .empty (.cutX 14848 .empty (.cutY 26112 .empty (.cutX 15104 .empty (.cutY 26368 (.cutX 15232 (.cutY 26240 .full .full) (.cutY 26240 .full .full)) .empty))))) .empty) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 .empty (.cutY 7168 (.cutX 17920 (.cutY 6656 (.cutX 17664 (.cutY 6400 .empty (.cutX 17536 (.cutY 6528 .full .full) (.cutY 6528 .full .full))) .empty) .empty) .empty) .empty))) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 (.cutX 26112 .empty (.cutY 14848 .empty (.cutX 26368 (.cutY 15104 .empty (.cutX 26240 (.cutY 15232 .full .full) (.cutY 15232 .full .full))) .empty))) .empty))) .empty)) .empty))) .empty))

theorem metadata101 : 0<170092456 ∧ 25<128 ∧ 68<128 ∧ 0<4 ∧
    2643/4160=0 ∧ 2643%4160=2643 ∧ ∀ i, (leaves101 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData101).mp
    (by decide +kernel)

theorem sourceChecked101_0 : ∀ i : Fin 16,
    (fun i => output101 i = raw101 (source101 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked101 : ∀ i : Fin 16, (fun i => output101 i = raw101 (source101 i)) i :=
  forallFin_of_zero_offset (fun i => output101 i = raw101 (source101 i)) sourceChecked101_0

theorem coverChecked101_0 : ∀ i : Fin 16,
    (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked101 : ∀ i : Fin 16, (fun i => (output101 (cover101 i)).ContainsBox (raw101 i)) i :=
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

noncomputable def phaseMass101 : ℝ := singlePhaseMass (170092456/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw101 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass101_eq : phaseMass101 = (21261557/204800000000 : ℝ) := by
  unfold phaseMass101
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw101 output101 cover101 source101
    (gridTreeUnionCheck_sound 32768 raw101 output101 cover101 source101 tree101 checked101)
    _ (by norm_num) _, areaUnits101]
  norm_num

-- Frozen phase 4634, atom 3012, type 0, source (30,72).
def leavesData102 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves102 : Fin 4 → DyadicLeaf := leavesData102.get
def raw102 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 30 72 leaves102 i
def outputData102 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨7680,7808,18432,18560⟩) (.single ⟨7680,7808,18560,18688⟩)) (.node (.single ⟨7808,7936,18432,18560⟩) (.single ⟨7808,7936,18560,18688⟩))) (.node (.node (.single ⟨14080,14208,24832,24960⟩) (.single ⟨14080,14208,24960,25088⟩)) (.node (.single ⟨14208,14336,24832,24960⟩) (.single ⟨14208,14336,24960,25088⟩)))) (.node (.node (.node (.single ⟨18432,18560,7680,7808⟩) (.single ⟨18432,18560,7808,7936⟩)) (.node (.single ⟨18560,18688,7680,7808⟩) (.single ⟨18560,18688,7808,7936⟩))) (.node (.node (.single ⟨24832,24960,14080,14208⟩) (.single ⟨24832,24960,14208,14336⟩)) (.node (.single ⟨24960,25088,14080,14208⟩) (.single ⟨24960,25088,14208,14336⟩)))))
def output102 : Fin 16 → GridBox := outputData102.get
def coverData102 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData102 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover102 (i : Fin 16) : Fin 16 := ⟨coverData102.get i % 16, Nat.mod_lt _ (by decide)⟩
def source102 (i : Fin 16) : Fin 16 := ⟨sourceData102.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree102 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 .empty (.cutX 7168 .empty (.cutY 19456 (.cutX 7680 .empty (.cutY 18944 (.cutX 7936 (.cutY 18688 (.cutX 7808 (.cutY 18560 .full .full) (.cutY 18560 .full .full)) .empty) .empty) .empty)) .empty)))) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 (.cutX 13312 .empty (.cutY 25600 (.cutX 13824 .empty (.cutY 25088 (.cutX 14080 .empty (.cutY 24832 .empty (.cutX 14208 (.cutY 24960 .full .full) (.cutY 24960 .full .full)))) .empty)) .empty)) .empty) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 .empty (.cutX 19456 (.cutY 7168 .empty (.cutX 18944 (.cutY 7680 .empty (.cutX 18688 (.cutY 7936 (.cutX 18560 (.cutY 7808 .full .full) (.cutY 7808 .full .full)) .empty) .empty)) .empty)) .empty)))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 (.cutX 25600 (.cutY 13312 .empty (.cutX 25088 (.cutY 13824 .empty (.cutX 24832 .empty (.cutY 14080 .empty (.cutX 24960 (.cutY 14208 .full .full) (.cutY 14208 .full .full))))) .empty)) .empty) .empty) .empty)) .empty))) .empty))

theorem metadata102 : 0<177866497 ∧ 30<128 ∧ 72<128 ∧ 0<4 ∧
    3012/4160=0 ∧ 3012%4160=3012 ∧ ∀ i, (leaves102 i).Valid 8 := by
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

noncomputable def phaseMass102 : ℝ := singlePhaseMass (177866497/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw102 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass102_eq : phaseMass102 = (177866497/1638400000000 : ℝ) := by
  unfold phaseMass102
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw102 output102 cover102 source102
    (gridTreeUnionCheck_sound 32768 raw102 output102 cover102 source102 tree102 checked102)
    _ (by norm_num) _, areaUnits102]
  norm_num

-- Frozen phase 4635, atom 7488, type 1, source (35,73).
def leavesData103 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves103 : Fin 7 → DyadicLeaf := leavesData103.get
def raw103 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 35 73 leaves103 i
def outputData103 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8960,9088,18688,18816⟩) (.node (.single ⟨8960,9088,18816,18944⟩) (.single ⟨9088,9152,18688,18752⟩))) (.node (.node (.single ⟨9088,9152,18752,18816⟩) (.single ⟨9152,9216,18688,18752⟩)) (.node (.single ⟨9152,9216,18752,18816⟩) (.single ⟨9088,9216,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,23552,23680⟩) (.node (.single ⟨13824,13952,23680,23808⟩) (.single ⟨13952,14016,23552,23616⟩))) (.node (.node (.single ⟨13952,14016,23616,23680⟩) (.single ⟨14016,14080,23552,23616⟩)) (.node (.single ⟨14016,14080,23616,23680⟩) (.single ⟨13952,14080,23680,23808⟩))))) (.node (.node (.node (.single ⟨18688,18816,8960,9088⟩) (.node (.single ⟨18688,18752,9088,9152⟩) (.single ⟨18688,18752,9152,9216⟩))) (.node (.node (.single ⟨18752,18816,9088,9152⟩) (.single ⟨18752,18816,9152,9216⟩)) (.node (.single ⟨18816,18944,8960,9088⟩) (.single ⟨18816,18944,9088,9216⟩)))) (.node (.node (.single ⟨23552,23680,13824,13952⟩) (.node (.single ⟨23552,23616,13952,14016⟩) (.single ⟨23552,23616,14016,14080⟩))) (.node (.node (.single ⟨23616,23680,13952,14016⟩) (.single ⟨23616,23680,14016,14080⟩)) (.node (.single ⟨23680,23808,13824,13952⟩) (.single ⟨23680,23808,13952,14080⟩))))))
def output103 : Fin 28 → GridBox := outputData103.get
def coverData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData103 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover103 (i : Fin 28) : Fin 28 := ⟨coverData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def source103 (i : Fin 28) : Fin 28 := ⟨sourceData103.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree103 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 (.cutX 10240 (.cutY 18432 .empty (.cutX 9216 (.cutY 19456 (.cutX 8704 .empty (.cutY 18944 (.cutX 8960 .empty (.cutY 18688 .empty (.cutX 9088 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 9152 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty) .empty)) .empty) .empty) (.cutY 20480 .empty (.cutX 14336 (.cutY 22528 .empty (.cutX 13312 .empty (.cutY 23552 .empty (.cutX 13824 .empty (.cutY 24064 (.cutX 14080 (.cutY 23808 (.cutX 13952 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 14016 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full)) .empty) .empty) .empty))))) .empty))) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 (.cutY 12288 (.cutX 18432 .empty (.cutY 10240 (.cutX 19456 (.cutY 9216 (.cutX 18944 (.cutY 8704 .empty (.cutX 18688 .empty (.cutY 8960 .empty (.cutX 18816 (.cutY 9088 .full (.cutX 18752 (.cutY 9152 .full .full) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))))) .empty) .empty) .empty) .empty)) .empty) (.cutY 12288 .empty (.cutX 22528 .empty (.cutY 14336 (.cutX 23552 .empty (.cutY 13312 .empty (.cutX 24064 (.cutY 13824 .empty (.cutX 23808 (.cutY 14080 (.cutX 23680 (.cutY 13952 .full (.cutX 23616 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)) .empty))) .empty))))) .empty) .empty))

theorem metadata103 : 0<167101800 ∧ 35<128 ∧ 73<128 ∧ 1<4 ∧
    7488/4160=1 ∧ 7488%4160=3328 ∧ ∀ i, (leaves103 i).Valid 8 := by
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

noncomputable def phaseMass103 : ℝ := singlePhaseMass (167101800/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw103 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass103_eq : phaseMass103 = (835509/8192000000 : ℝ) := by
  unfold phaseMass103
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw103 output103 cover103 source103
    (gridTreeUnionCheck_sound 32768 raw103 output103 cover103 source103 tree103 checked103)
    _ (by norm_num) _, areaUnits103]
  norm_num

-- Frozen phase 4636, atom 2398, type 0, source (22,66).
def leavesData104 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves104 : Fin 7 → DyadicLeaf := leavesData104.get
def raw104 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 22 66 leaves104 i
def outputData104 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨5632,5760,16896,17024⟩) (.node (.single ⟨5632,5760,17024,17152⟩) (.single ⟨5760,5824,16896,16960⟩))) (.node (.node (.single ⟨5760,5824,16960,17024⟩) (.single ⟨5824,5888,16896,16960⟩)) (.node (.single ⟨5824,5888,16960,17024⟩) (.single ⟨5760,5888,17024,17152⟩)))) (.node (.node (.single ⟨15616,15744,26880,27008⟩) (.node (.single ⟨15616,15744,27008,27136⟩) (.single ⟨15744,15808,26880,26944⟩))) (.node (.node (.single ⟨15744,15808,26944,27008⟩) (.single ⟨15808,15872,26880,26944⟩)) (.node (.single ⟨15808,15872,26944,27008⟩) (.single ⟨15744,15872,27008,27136⟩))))) (.node (.node (.node (.single ⟨16896,17024,5632,5760⟩) (.node (.single ⟨16896,16960,5760,5824⟩) (.single ⟨16896,16960,5824,5888⟩))) (.node (.node (.single ⟨16960,17024,5760,5824⟩) (.single ⟨16960,17024,5824,5888⟩)) (.node (.single ⟨17024,17152,5632,5760⟩) (.single ⟨17024,17152,5760,5888⟩)))) (.node (.node (.single ⟨26880,27008,15616,15744⟩) (.node (.single ⟨26880,26944,15744,15808⟩) (.single ⟨26880,26944,15808,15872⟩))) (.node (.node (.single ⟨26944,27008,15744,15808⟩) (.single ⟨26944,27008,15808,15872⟩)) (.node (.single ⟨27008,27136,15616,15744⟩) (.single ⟨27008,27136,15744,15872⟩))))))
def output104 : Fin 28 → GridBox := outputData104.get
def coverData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData104 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover104 (i : Fin 28) : Fin 28 := ⟨coverData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def source104 (i : Fin 28) : Fin 28 := ⟨sourceData104.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree104 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 (.cutX 5120 .empty (.cutY 17408 (.cutX 5632 .empty (.cutY 16896 .empty (.cutX 5888 (.cutY 17152 (.cutX 5760 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 5824 (.cutY 16960 .full .full) (.cutY 16960 .full .full)) .full)) .empty) .empty))) .empty)) .empty) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 .empty (.cutX 15360 .empty (.cutY 27648 (.cutX 15872 (.cutY 27136 (.cutX 15616 .empty (.cutY 26880 .empty (.cutX 15744 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 15808 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full)))) .empty) .empty) .empty)))) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 (.cutX 17408 (.cutY 5120 .empty (.cutX 16896 .empty (.cutY 5632 .empty (.cutX 17152 (.cutY 5888 (.cutX 17024 (.cutY 5760 .full (.cutX 16960 (.cutY 5824 .full .full) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)))) .empty) .empty) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 .empty (.cutX 27648 (.cutY 15360 .empty (.cutX 27136 (.cutY 15872 (.cutX 26880 .empty (.cutY 15616 .empty (.cutX 27008 (.cutY 15744 .full (.cutX 26944 (.cutY 15808 .full .full) (.cutY 15808 .full .full))) (.cutY 15744 .full .full)))) .empty) .empty)) .empty)))) .empty))) .empty))

theorem metadata104 : 0<191564598 ∧ 22<128 ∧ 66<128 ∧ 0<4 ∧
    2398/4160=0 ∧ 2398%4160=2398 ∧ ∀ i, (leaves104 i).Valid 8 := by
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

noncomputable def phaseMass104 : ℝ := singlePhaseMass (191564598/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw104 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass104_eq : phaseMass104 = (95782299/819200000000 : ℝ) := by
  unfold phaseMass104
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw104 output104 cover104 source104
    (gridTreeUnionCheck_sound 32768 raw104 output104 cover104 source104 tree104 checked104)
    _ (by norm_num) _, areaUnits104]
  norm_num

-- Frozen phase 4637, atom 6877, type 1, source (26,65).
def leavesData105 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves105 : Fin 10 → DyadicLeaf := leavesData105.get
def raw105 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 65 leaves105 i
def outputData105 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6784,16640,16768⟩) (.single ⟨6656,6784,16768,16896⟩)) (.node (.single ⟨6784,6848,16640,16704⟩) (.node (.single ⟨6784,6848,16704,16768⟩) (.single ⟨6848,6880,16640,16672⟩)))) (.node (.node (.single ⟨6848,6880,16672,16704⟩) (.single ⟨6880,6912,16640,16672⟩)) (.node (.single ⟨6880,6912,16672,16704⟩) (.node (.single ⟨6848,6912,16704,16768⟩) (.single ⟨6784,6912,16768,16896⟩))))) (.node (.node (.node (.single ⟨15872,16000,25856,25984⟩) (.single ⟨15872,16000,25984,26112⟩)) (.node (.single ⟨16000,16064,25856,25920⟩) (.node (.single ⟨16000,16064,25920,25984⟩) (.single ⟨16064,16096,25856,25888⟩)))) (.node (.node (.single ⟨16064,16096,25888,25920⟩) (.single ⟨16096,16128,25856,25888⟩)) (.node (.single ⟨16096,16128,25888,25920⟩) (.node (.single ⟨16064,16128,25920,25984⟩) (.single ⟨16000,16128,25984,26112⟩)))))) (.node (.node (.node (.node (.single ⟨16640,16768,6656,6784⟩) (.single ⟨16640,16704,6784,6848⟩)) (.node (.single ⟨16640,16672,6848,6880⟩) (.node (.single ⟨16640,16672,6880,6912⟩) (.single ⟨16672,16704,6848,6880⟩)))) (.node (.node (.single ⟨16672,16704,6880,6912⟩) (.single ⟨16704,16768,6784,6848⟩)) (.node (.single ⟨16704,16768,6848,6912⟩) (.node (.single ⟨16768,16896,6656,6784⟩) (.single ⟨16768,16896,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,15872,16000⟩) (.single ⟨25856,25920,16000,16064⟩)) (.node (.single ⟨25856,25888,16064,16096⟩) (.node (.single ⟨25856,25888,16096,16128⟩) (.single ⟨25888,25920,16064,16096⟩)))) (.node (.node (.single ⟨25888,25920,16096,16128⟩) (.single ⟨25920,25984,16000,16064⟩)) (.node (.single ⟨25920,25984,16064,16128⟩) (.node (.single ⟨25984,26112,15872,16000⟩) (.single ⟨25984,26112,16000,16128⟩)))))))
def output105 : Fin 40 → GridBox := outputData105.get
def coverData105 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData105 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover105 (i : Fin 40) : Fin 40 := ⟨coverData105.get i % 40, Nat.mod_lt _ (by decide)⟩
def source105 (i : Fin 40) : Fin 40 := ⟨sourceData105.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree105 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 .empty (.cutY 16896 (.cutX 6912 (.cutY 16640 .empty (.cutX 6784 (.cutY 16768 .full .full) (.cutY 16768 (.cutX 6848 (.cutY 16704 .full .full) (.cutY 16704 (.cutX 6880 (.cutY 16672 .full .full) (.cutY 16672 .full .full)) .full)) .full))) .empty) .empty)) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 .empty (.cutY 26112 (.cutX 16128 (.cutY 25856 .empty (.cutX 16000 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 16064 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 16096 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) .full))) .empty) .empty)))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 (.cutY 6656 .empty (.cutX 16640 .empty (.cutY 6912 (.cutX 16768 (.cutY 6784 .full (.cutX 16704 (.cutY 6848 .full (.cutX 16672 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty))) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 (.cutY 15872 .empty (.cutX 25856 .empty (.cutY 16128 (.cutX 25984 (.cutY 16000 .full (.cutX 25920 (.cutY 16064 .full (.cutX 25888 (.cutY 16096 .full .full) (.cutY 16096 .full .full))) (.cutY 16064 .full .full))) (.cutY 16000 .full .full)) .empty))) .empty)))) .empty)) .empty))) .empty))

theorem metadata105 : 0<175587969 ∧ 26<128 ∧ 65<128 ∧ 1<4 ∧
    6877/4160=1 ∧ 6877%4160=2717 ∧ ∀ i, (leaves105 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData105).mp
    (by decide +kernel)

theorem sourceChecked105_0 : ∀ i : Fin 40,
    (fun i => output105 i = raw105 (source105 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked105 : ∀ i : Fin 40, (fun i => output105 i = raw105 (source105 i)) i :=
  forallFin_of_zero_offset (fun i => output105 i = raw105 (source105 i)) sourceChecked105_0

theorem coverChecked105_0 : ∀ i : Fin 40,
    (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked105 : ∀ i : Fin 40, (fun i => (output105 (cover105 i)).ContainsBox (raw105 i)) i :=
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

noncomputable def phaseMass105 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw105 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass105_eq : phaseMass105 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass105
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw105 output105 cover105 source105
    (gridTreeUnionCheck_sound 32768 raw105 output105 cover105 source105 tree105 checked105)
    _ (by norm_num) _, areaUnits105]
  norm_num

-- Frozen phase 4638, atom 6953, type 1, source (27,66).
def leavesData106 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves106 : Fin 10 → DyadicLeaf := leavesData106.get
def raw106 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 27 66 leaves106 i
def outputData106 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6912,7040,16896,17024⟩) (.single ⟨6912,7040,17024,17152⟩)) (.node (.single ⟨7040,7104,16896,16960⟩) (.node (.single ⟨7040,7104,16960,17024⟩) (.single ⟨7104,7136,16896,16928⟩)))) (.node (.node (.single ⟨7104,7136,16928,16960⟩) (.single ⟨7136,7168,16896,16928⟩)) (.node (.single ⟨7136,7168,16928,16960⟩) (.node (.single ⟨7104,7168,16960,17024⟩) (.single ⟨7040,7168,17024,17152⟩))))) (.node (.node (.node (.single ⟨15616,15744,25600,25728⟩) (.single ⟨15616,15744,25728,25856⟩)) (.node (.single ⟨15744,15808,25600,25664⟩) (.node (.single ⟨15744,15808,25664,25728⟩) (.single ⟨15808,15840,25600,25632⟩)))) (.node (.node (.single ⟨15808,15840,25632,25664⟩) (.single ⟨15840,15872,25600,25632⟩)) (.node (.single ⟨15840,15872,25632,25664⟩) (.node (.single ⟨15808,15872,25664,25728⟩) (.single ⟨15744,15872,25728,25856⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,6912,7040⟩) (.single ⟨16896,16960,7040,7104⟩)) (.node (.single ⟨16896,16928,7104,7136⟩) (.node (.single ⟨16896,16928,7136,7168⟩) (.single ⟨16928,16960,7104,7136⟩)))) (.node (.node (.single ⟨16928,16960,7136,7168⟩) (.single ⟨16960,17024,7040,7104⟩)) (.node (.single ⟨16960,17024,7104,7168⟩) (.node (.single ⟨17024,17152,6912,7040⟩) (.single ⟨17024,17152,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,15616,15744⟩) (.single ⟨25600,25664,15744,15808⟩)) (.node (.single ⟨25600,25632,15808,15840⟩) (.node (.single ⟨25600,25632,15840,15872⟩) (.single ⟨25632,25664,15808,15840⟩)))) (.node (.node (.single ⟨25632,25664,15840,15872⟩) (.single ⟨25664,25728,15744,15808⟩)) (.node (.single ⟨25664,25728,15808,15872⟩) (.node (.single ⟨25728,25856,15616,15744⟩) (.single ⟨25728,25856,15744,15872⟩)))))))
def output106 : Fin 40 → GridBox := outputData106.get
def coverData106 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData106 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover106 (i : Fin 40) : Fin 40 := ⟨coverData106.get i % 40, Nat.mod_lt _ (by decide)⟩
def source106 (i : Fin 40) : Fin 40 := ⟨sourceData106.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree106 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 .empty (.cutY 16896 .empty (.cutX 6912 .empty (.cutY 17152 (.cutX 7040 (.cutY 17024 .full .full) (.cutY 17024 (.cutX 7104 (.cutY 16960 .full .full) (.cutY 16960 (.cutX 7136 (.cutY 16928 .full .full) (.cutY 16928 .full .full)) .full)) .full)) .empty)))) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 (.cutY 26112 (.cutX 15616 .empty (.cutY 25856 (.cutX 15744 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 15808 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 15840 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) .full)) .empty)) .empty) .empty))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 .empty (.cutY 6656 .empty (.cutX 17152 (.cutY 6912 .empty (.cutX 17024 (.cutY 7040 .full (.cutX 16960 (.cutY 7104 .full (.cutX 16928 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty))) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 (.cutY 15872 (.cutX 25856 (.cutY 15616 .empty (.cutX 25728 (.cutY 15744 .full (.cutX 25664 (.cutY 15808 .full (.cutX 25632 (.cutY 15840 .full .full) (.cutY 15840 .full .full))) (.cutY 15808 .full .full))) (.cutY 15744 .full .full))) .empty) .empty) .empty)))) .empty)) .empty))) .empty))

theorem metadata106 : 0<175587969 ∧ 27<128 ∧ 66<128 ∧ 1<4 ∧
    6953/4160=1 ∧ 6953%4160=2793 ∧ ∀ i, (leaves106 i).Valid 8 := by
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

noncomputable def phaseMass106 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw106 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass106_eq : phaseMass106 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass106
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw106 output106 cover106 source106
    (gridTreeUnionCheck_sound 32768 raw106 output106 cover106 source106 tree106 checked106)
    _ (by norm_num) _, areaUnits106]
  norm_num

-- Frozen phase 4639, atom 7027, type 1, source (28,67).
def leavesData107 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves107 : Fin 7 → DyadicLeaf := leavesData107.get
def raw107 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 28 67 leaves107 i
def outputData107 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7168,7296,17152,17280⟩) (.node (.single ⟨7168,7296,17280,17408⟩) (.single ⟨7296,7360,17152,17216⟩))) (.node (.node (.single ⟨7296,7360,17216,17280⟩) (.single ⟨7360,7424,17152,17216⟩)) (.node (.single ⟨7360,7424,17216,17280⟩) (.single ⟨7296,7424,17280,17408⟩)))) (.node (.node (.single ⟨15360,15488,25344,25472⟩) (.node (.single ⟨15360,15488,25472,25600⟩) (.single ⟨15488,15552,25344,25408⟩))) (.node (.node (.single ⟨15488,15552,25408,25472⟩) (.single ⟨15552,15616,25344,25408⟩)) (.node (.single ⟨15552,15616,25408,25472⟩) (.single ⟨15488,15616,25472,25600⟩))))) (.node (.node (.node (.single ⟨17152,17280,7168,7296⟩) (.node (.single ⟨17152,17216,7296,7360⟩) (.single ⟨17152,17216,7360,7424⟩))) (.node (.node (.single ⟨17216,17280,7296,7360⟩) (.single ⟨17216,17280,7360,7424⟩)) (.node (.single ⟨17280,17408,7168,7296⟩) (.single ⟨17280,17408,7296,7424⟩)))) (.node (.node (.single ⟨25344,25472,15360,15488⟩) (.node (.single ⟨25344,25408,15488,15552⟩) (.single ⟨25344,25408,15552,15616⟩))) (.node (.node (.single ⟨25408,25472,15488,15552⟩) (.single ⟨25408,25472,15552,15616⟩)) (.node (.single ⟨25472,25600,15360,15488⟩) (.single ⟨25472,25600,15488,15616⟩))))))
def output107 : Fin 28 → GridBox := outputData107.get
def coverData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData107 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover107 (i : Fin 28) : Fin 28 := ⟨coverData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def source107 (i : Fin 28) : Fin 28 := ⟨sourceData107.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree107 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 .empty (.cutY 17408 (.cutX 7680 (.cutY 16896 .empty (.cutX 7424 (.cutY 17152 .empty (.cutX 7296 (.cutY 17280 .full .full) (.cutY 17280 (.cutX 7360 (.cutY 17216 .full .full) (.cutY 17216 .full .full)) .full))) .empty)) .empty) .empty)) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 (.cutX 15872 (.cutY 25088 .empty (.cutX 15616 (.cutY 25344 .empty (.cutX 15488 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 15552 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) .full))) .empty)) .empty) .empty)) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 .empty (.cutX 16896 .empty (.cutY 7680 (.cutX 17152 .empty (.cutY 7424 (.cutX 17280 (.cutY 7296 .full (.cutX 17216 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 (.cutY 15360 .empty (.cutX 25088 .empty (.cutY 15872 (.cutX 25344 .empty (.cutY 15616 (.cutX 25472 (.cutY 15488 .full (.cutX 25408 (.cutY 15552 .full .full) (.cutY 15552 .full .full))) (.cutY 15488 .full .full)) .empty)) .empty))) .empty)) .empty)) .empty))) .empty))

theorem metadata107 : 0<175587969 ∧ 28<128 ∧ 67<128 ∧ 1<4 ∧
    7027/4160=1 ∧ 7027%4160=2867 ∧ ∀ i, (leaves107 i).Valid 8 := by
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

noncomputable def phaseMass107 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw107 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass107_eq : phaseMass107 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass107
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw107 output107 cover107 source107
    (gridTreeUnionCheck_sound 32768 raw107 output107 cover107 source107 tree107 checked107)
    _ (by norm_num) _, areaUnits107]
  norm_num

-- Frozen phase 4640, atom 6799, type 1, source (25,64).
def leavesData108 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,3,2⟩)) (.node (.single ⟨2,3,3⟩) (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)))) (.node (.node (.single ⟨3,7,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves108 : Fin 19 → DyadicLeaf := leavesData108.get
def raw108 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 25 64 leaves108 i
def outputData108 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨6400,6464,16384,16448⟩) (.single ⟨6400,6464,16448,16512⟩)) (.node (.single ⟨6464,6528,16384,16448⟩) (.single ⟨6464,6528,16448,16512⟩))) (.node (.node (.single ⟨6400,6528,16512,16640⟩) (.single ⟨6528,6592,16384,16448⟩)) (.node (.single ⟨6528,6592,16448,16512⟩) (.node (.single ⟨6592,6624,16384,16416⟩) (.single ⟨6592,6624,16416,16448⟩))))) (.node (.node (.node (.single ⟨6624,6640,16384,16400⟩) (.single ⟨6624,6640,16400,16416⟩)) (.node (.single ⟨6640,6656,16384,16400⟩) (.node (.single ⟨6640,6656,16400,16416⟩) (.single ⟨6624,6656,16416,16448⟩)))) (.node (.node (.single ⟨6592,6656,16448,16512⟩) (.single ⟨6528,6592,16512,16576⟩)) (.node (.single ⟨6528,6592,16576,16640⟩) (.node (.single ⟨6592,6656,16512,16576⟩) (.single ⟨6592,6656,16576,16640⟩)))))) (.node (.node (.node (.node (.single ⟨16128,16192,26112,26176⟩) (.single ⟨16128,16192,26176,26240⟩)) (.node (.single ⟨16192,16256,26112,26176⟩) (.single ⟨16192,16256,26176,26240⟩))) (.node (.node (.single ⟨16128,16256,26240,26368⟩) (.single ⟨16256,16320,26112,26176⟩)) (.node (.single ⟨16256,16320,26176,26240⟩) (.node (.single ⟨16320,16352,26112,26144⟩) (.single ⟨16320,16352,26144,26176⟩))))) (.node (.node (.node (.single ⟨16352,16368,26112,26128⟩) (.single ⟨16352,16368,26128,26144⟩)) (.node (.single ⟨16368,16384,26112,26128⟩) (.node (.single ⟨16368,16384,26128,26144⟩) (.single ⟨16352,16384,26144,26176⟩)))) (.node (.node (.single ⟨16320,16384,26176,26240⟩) (.single ⟨16256,16320,26240,26304⟩)) (.node (.single ⟨16256,16320,26304,26368⟩) (.node (.single ⟨16320,16384,26240,26304⟩) (.single ⟨16320,16384,26304,26368⟩))))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,6400,6464⟩) (.single ⟨16384,16448,6464,6528⟩)) (.node (.single ⟨16448,16512,6400,6464⟩) (.single ⟨16448,16512,6464,6528⟩))) (.node (.node (.single ⟨16384,16448,6528,6592⟩) (.single ⟨16384,16416,6592,6624⟩)) (.node (.single ⟨16384,16400,6624,6640⟩) (.node (.single ⟨16384,16400,6640,6656⟩) (.single ⟨16400,16416,6624,6640⟩))))) (.node (.node (.node (.single ⟨16400,16416,6640,6656⟩) (.single ⟨16416,16448,6592,6624⟩)) (.node (.single ⟨16416,16448,6624,6656⟩) (.node (.single ⟨16448,16512,6528,6592⟩) (.single ⟨16448,16512,6592,6656⟩)))) (.node (.node (.single ⟨16512,16640,6400,6528⟩) (.single ⟨16512,16576,6528,6592⟩)) (.node (.single ⟨16512,16576,6592,6656⟩) (.node (.single ⟨16576,16640,6528,6592⟩) (.single ⟨16576,16640,6592,6656⟩)))))) (.node (.node (.node (.node (.single ⟨26112,26176,16128,16192⟩) (.single ⟨26112,26176,16192,16256⟩)) (.node (.single ⟨26176,26240,16128,16192⟩) (.single ⟨26176,26240,16192,16256⟩))) (.node (.node (.single ⟨26112,26176,16256,16320⟩) (.single ⟨26112,26144,16320,16352⟩)) (.node (.single ⟨26112,26128,16352,16368⟩) (.node (.single ⟨26112,26128,16368,16384⟩) (.single ⟨26128,26144,16352,16368⟩))))) (.node (.node (.node (.single ⟨26128,26144,16368,16384⟩) (.single ⟨26144,26176,16320,16352⟩)) (.node (.single ⟨26144,26176,16352,16384⟩) (.node (.single ⟨26176,26240,16256,16320⟩) (.single ⟨26176,26240,16320,16384⟩)))) (.node (.node (.single ⟨26240,26368,16128,16256⟩) (.single ⟨26240,26304,16256,16320⟩)) (.node (.single ⟨26240,26304,16320,16384⟩) (.node (.single ⟨26304,26368,16256,16320⟩) (.single ⟨26304,26368,16320,16384⟩))))))))
def output108 : Fin 76 → GridBox := outputData108.get
def coverData108 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 52)) (.node (.single 71) (.single 23))) (.node (.node (.single 0) (.single 38)) (.node (.single 75) (.node (.single 37) (.single 1))))) (.node (.node (.node (.single 40) (.single 74)) (.node (.single 35) (.node (.single 2) (.single 39)))) (.node (.node (.single 73) (.single 36)) (.node (.single 3) (.node (.single 41) (.single 72)))))) (.node (.node (.node (.node (.single 34) (.single 5)) (.node (.single 42) (.single 70))) (.node (.node (.single 33) (.single 6)) (.node (.single 50) (.node (.single 69) (.single 25))))) (.node (.node (.node (.single 15) (.single 53)) (.node (.single 60) (.node (.single 22) (.single 16)))) (.node (.node (.single 55) (.single 59)) (.node (.single 20) (.node (.single 14) (.single 51))))))) (.node (.node (.node (.node (.node (.single 61) (.single 24)) (.node (.single 17) (.single 54))) (.node (.node (.single 58) (.single 21)) (.node (.single 18) (.node (.single 56) (.single 57))))) (.node (.node (.node (.single 19) (.single 7)) (.node (.single 43) (.node (.single 68) (.single 32)))) (.node (.node (.single 8) (.single 48)) (.node (.single 67) (.node (.single 27) (.single 13)))))) (.node (.node (.node (.node (.single 49) (.single 62)) (.node (.single 26) (.single 9))) (.node (.node (.single 44) (.single 66)) (.node (.single 31) (.node (.single 10) (.single 46))))) (.node (.node (.node (.single 65) (.single 29)) (.node (.single 11) (.node (.single 45) (.single 64)))) (.node (.node (.single 30) (.single 12)) (.node (.single 47) (.node (.single 63) (.single 28))))))))
def sourceData108 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.node (.single 48) (.single 52))))) (.node (.node (.node (.single 60) (.single 64)) (.node (.single 68) (.node (.single 72) (.single 56)))) (.node (.node (.single 36) (.single 28)) (.node (.single 32) (.node (.single 40) (.single 44)))))) (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.node (.single 59) (.single 55))))) (.node (.node (.node (.single 75) (.single 67)) (.node (.single 71) (.node (.single 63) (.single 51)))) (.node (.node (.single 23) (.single 19)) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 61) (.node (.single 69) (.single 65))))) (.node (.node (.node (.single 73) (.single 53)) (.node (.single 57) (.node (.single 25) (.single 37)))) (.node (.node (.single 1) (.single 29)) (.node (.single 41) (.node (.single 33) (.single 45)))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 58)) (.node (.single 74) (.node (.single 70) (.single 66))))) (.node (.node (.node (.single 62) (.single 54)) (.node (.single 50) (.node (.single 26) (.single 22)))) (.node (.node (.single 2) (.single 18)) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover108 (i : Fin 76) : Fin 76 := ⟨coverData108.get i % 76, Nat.mod_lt _ (by decide)⟩
def source108 (i : Fin 76) : Fin 76 := ⟨sourceData108.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree108 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 .empty (.cutY 18432 (.cutX 7168 (.cutY 17408 (.cutX 6656 (.cutY 16896 (.cutX 6400 .empty (.cutY 16640 (.cutX 6528 (.cutY 16512 (.cutX 6464 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) .full) (.cutY 16512 (.cutX 6592 (.cutY 16448 .full .full) (.cutY 16448 (.cutX 6624 (.cutY 16416 .full .full) (.cutY 16416 (.cutX 6640 (.cutY 16400 .full .full) (.cutY 16400 .full .full)) .full)) .full)) (.cutX 6592 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty)) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 .empty (.cutY 26624 (.cutX 15360 .empty (.cutY 25600 .empty (.cutX 15872 .empty (.cutY 26112 .empty (.cutX 16128 .empty (.cutY 26368 (.cutX 16256 (.cutY 26240 (.cutX 16192 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) .full) (.cutY 26240 (.cutX 16320 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 16352 (.cutY 26144 .full .full) (.cutY 26144 (.cutX 16368 (.cutY 26128 .full .full) (.cutY 26128 .full .full)) .full)) .full)) (.cutX 16320 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty)))))) .empty)) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 (.cutY 6144 .empty (.cutX 17408 (.cutY 7168 (.cutX 16896 (.cutY 6656 (.cutX 16640 (.cutY 6400 .empty (.cutX 16512 (.cutY 6528 (.cutX 16448 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 16448 (.cutY 6592 .full (.cutX 16416 (.cutY 6624 .full (.cutX 16400 (.cutY 6640 .full .full) (.cutY 6640 .full .full))) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full (.cutX 16576 (.cutY 6592 .full .full) (.cutY 6592 .full .full))))) .empty) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 (.cutY 14336 .empty (.cutX 25600 .empty (.cutY 15360 .empty (.cutX 26112 .empty (.cutY 15872 .empty (.cutX 26368 (.cutY 16128 .empty (.cutX 26240 (.cutY 16256 (.cutX 26176 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) (.cutX 26176 (.cutY 16320 .full (.cutX 26144 (.cutY 16352 .full (.cutX 26128 (.cutY 16368 .full .full) (.cutY 16368 .full .full))) (.cutY 16352 .full .full))) (.cutY 16320 .full .full))) (.cutY 16256 .full (.cutX 26304 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))) .empty)))))) .empty)) .empty))) .empty))

theorem metadata108 : 0<175587969 ∧ 25<128 ∧ 64<128 ∧ 1<4 ∧
    6799/4160=1 ∧ 6799%4160=2639 ∧ ∀ i, (leaves108 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData108).mp
    (by decide +kernel)

theorem sourceChecked108_0 : ∀ i : Fin 64,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked108_64 : ∀ i : Fin 12,
    (fun i => output108 i = raw108 (source108 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked108 : ∀ i : Fin 76, (fun i => output108 i = raw108 (source108 i)) i :=
  forallFin_of_zero_offset (fun i => output108 i = raw108 (source108 i)) (forallFinOffset_add (fun i => output108 i = raw108 (source108 i)) 0 64 12 (by decide) sourceChecked108_0
    sourceChecked108_64)

theorem coverChecked108_0 : ∀ i : Fin 64,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked108_64 : ∀ i : Fin 12,
    (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked108 : ∀ i : Fin 76, (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) i :=
  forallFin_of_zero_offset (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) (forallFinOffset_add (fun i => (output108 (cover108 i)).ContainsBox (raw108 i)) 0 64 12 (by decide) coverChecked108_0
    coverChecked108_64)

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

noncomputable def phaseMass108 : ℝ := singlePhaseMass (175587969/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw108 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass108_eq : phaseMass108 = (175587969/1638400000000 : ℝ) := by
  unfold phaseMass108
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw108 output108 cover108 source108
    (gridTreeUnionCheck_sound 32768 raw108 output108 cover108 source108 tree108 checked108)
    _ (by norm_num) _, areaUnits108]
  norm_num

-- Frozen phase 4641, atom 1555, type 0, source (13,60).
def leavesData109 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves109 : Fin 4 → DyadicLeaf := leavesData109.get
def raw109 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 60 leaves109 i
def outputData109 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,15360,15488⟩) (.single ⟨3328,3456,15488,15616⟩)) (.node (.single ⟨3456,3584,15360,15488⟩) (.single ⟨3456,3584,15488,15616⟩))) (.node (.node (.single ⟨15360,15488,3328,3456⟩) (.single ⟨15360,15488,3456,3584⟩)) (.node (.single ⟨15488,15616,3328,3456⟩) (.single ⟨15488,15616,3456,3584⟩)))) (.node (.node (.node (.single ⟨17152,17280,29184,29312⟩) (.single ⟨17152,17280,29312,29440⟩)) (.node (.single ⟨17280,17408,29184,29312⟩) (.single ⟨17280,17408,29312,29440⟩))) (.node (.node (.single ⟨29184,29312,17152,17280⟩) (.single ⟨29184,29312,17280,17408⟩)) (.node (.single ⟨29312,29440,17152,17280⟩) (.single ⟨29312,29440,17280,17408⟩)))))
def output109 : Fin 16 → GridBox := outputData109.get
def coverData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 15) (.single 11))) (.node (.node (.single 1) (.single 6)) (.node (.single 14) (.single 9)))) (.node (.node (.node (.single 2) (.single 5)) (.node (.single 13) (.single 10))) (.node (.node (.single 3) (.single 7)) (.node (.single 12) (.single 8)))))
def sourceData109 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13)))) (.node (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover109 (i : Fin 16) : Fin 16 := ⟨coverData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def source109 (i : Fin 16) : Fin 16 := ⟨sourceData109.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree109 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 (.cutY 12288 .empty (.cutX 2048 .empty (.cutY 14336 .empty (.cutX 3072 .empty (.cutY 15360 .empty (.cutX 3584 (.cutY 15872 (.cutX 3328 .empty (.cutY 15616 (.cutX 3456 (.cutY 15488 .full .full) (.cutY 15488 .full .full)) .empty)) .empty) .empty)))))) .empty)) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 (.cutX 14336 .empty (.cutY 2048 .empty (.cutX 15360 .empty (.cutY 3072 .empty (.cutX 15872 (.cutY 3584 (.cutX 15616 (.cutY 3328 .empty (.cutX 15488 (.cutY 3456 .full .full) (.cutY 3456 .full .full))) .empty) .empty) .empty))))) .empty)) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 .empty (.cutX 18432 (.cutY 30720 (.cutX 17408 (.cutY 29696 (.cutX 16896 .empty (.cutY 29184 .empty (.cutX 17152 .empty (.cutY 29440 (.cutX 17280 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty)))) .empty) .empty) .empty) .empty)) .empty)) (.cutY 24576 (.cutX 28672 .empty (.cutY 20480 (.cutX 30720 (.cutY 18432 (.cutX 29696 (.cutY 17408 (.cutX 29184 .empty (.cutY 16896 .empty (.cutX 29440 (.cutY 17152 .empty (.cutX 29312 (.cutY 17280 .full .full) (.cutY 17280 .full .full))) .empty))) .empty) .empty) .empty) .empty) .empty)) .empty))))

theorem metadata109 : 0<116912559 ∧ 13<128 ∧ 60<128 ∧ 0<4 ∧
    1555/4160=0 ∧ 1555%4160=1555 ∧ ∀ i, (leaves109 i).Valid 8 := by
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

noncomputable def phaseMass109 : ℝ := singlePhaseMass (116912559/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw109 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass109_eq : phaseMass109 = (116912559/1638400000000 : ℝ) := by
  unfold phaseMass109
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw109 output109 cover109 source109
    (gridTreeUnionCheck_sound 32768 raw109 output109 cover109 source109 tree109 checked109)
    _ (by norm_num) _, areaUnits109]
  norm_num

-- Frozen phase 4642, atom 6719, type 1, source (24,63).
def leavesData110 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,2,2⟩)))) (.node (.node (.node (.single ⟨2,2,3⟩) (.single ⟨2,3,1⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves110 : Fin 16 → DyadicLeaf := leavesData110.get
def raw110 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 24 63 leaves110 i
def outputData110 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨6144,6208,16128,16192⟩) (.single ⟨6144,6208,16192,16256⟩)) (.node (.single ⟨6208,6272,16128,16192⟩) (.single ⟨6208,6272,16192,16256⟩))) (.node (.node (.single ⟨6144,6272,16256,16384⟩) (.single ⟨6272,6336,16128,16192⟩)) (.node (.single ⟨6272,6336,16192,16256⟩) (.single ⟨6336,6368,16128,16160⟩)))) (.node (.node (.node (.single ⟨6336,6368,16160,16192⟩) (.single ⟨6368,6400,16128,16160⟩)) (.node (.single ⟨6368,6400,16160,16192⟩) (.single ⟨6336,6400,16192,16256⟩))) (.node (.node (.single ⟨6272,6336,16256,16320⟩) (.single ⟨6272,6336,16320,16384⟩)) (.node (.single ⟨6336,6400,16256,16320⟩) (.single ⟨6336,6400,16320,16384⟩))))) (.node (.node (.node (.node (.single ⟨16128,16192,6144,6208⟩) (.single ⟨16128,16192,6208,6272⟩)) (.node (.single ⟨16192,16256,6144,6208⟩) (.single ⟨16192,16256,6208,6272⟩))) (.node (.node (.single ⟨16128,16192,6272,6336⟩) (.single ⟨16128,16160,6336,6368⟩)) (.node (.single ⟨16128,16160,6368,6400⟩) (.single ⟨16160,16192,6336,6368⟩)))) (.node (.node (.node (.single ⟨16160,16192,6368,6400⟩) (.single ⟨16192,16256,6272,6336⟩)) (.node (.single ⟨16192,16256,6336,6400⟩) (.single ⟨16256,16384,6144,6272⟩))) (.node (.node (.single ⟨16256,16320,6272,6336⟩) (.single ⟨16256,16320,6336,6400⟩)) (.node (.single ⟨16320,16384,6272,6336⟩) (.single ⟨16320,16384,6336,6400⟩)))))) (.node (.node (.node (.node (.node (.single ⟨16384,16448,26368,26432⟩) (.single ⟨16384,16448,26432,26496⟩)) (.node (.single ⟨16448,16512,26368,26432⟩) (.single ⟨16448,16512,26432,26496⟩))) (.node (.node (.single ⟨16384,16512,26496,26624⟩) (.single ⟨16512,16576,26368,26432⟩)) (.node (.single ⟨16512,16576,26432,26496⟩) (.single ⟨16576,16608,26368,26400⟩)))) (.node (.node (.node (.single ⟨16576,16608,26400,26432⟩) (.single ⟨16608,16640,26368,26400⟩)) (.node (.single ⟨16608,16640,26400,26432⟩) (.single ⟨16576,16640,26432,26496⟩))) (.node (.node (.single ⟨16512,16576,26496,26560⟩) (.single ⟨16512,16576,26560,26624⟩)) (.node (.single ⟨16576,16640,26496,26560⟩) (.single ⟨16576,16640,26560,26624⟩))))) (.node (.node (.node (.node (.single ⟨26368,26432,16384,16448⟩) (.single ⟨26368,26432,16448,16512⟩)) (.node (.single ⟨26432,26496,16384,16448⟩) (.single ⟨26432,26496,16448,16512⟩))) (.node (.node (.single ⟨26368,26432,16512,16576⟩) (.single ⟨26368,26400,16576,16608⟩)) (.node (.single ⟨26368,26400,16608,16640⟩) (.single ⟨26400,26432,16576,16608⟩)))) (.node (.node (.node (.single ⟨26400,26432,16608,16640⟩) (.single ⟨26432,26496,16512,16576⟩)) (.node (.single ⟨26432,26496,16576,16640⟩) (.single ⟨26496,26624,16384,16512⟩))) (.node (.node (.single ⟨26496,26560,16512,16576⟩) (.single ⟨26496,26560,16576,16640⟩)) (.node (.single ⟨26560,26624,16512,16576⟩) (.single ⟨26560,26624,16576,16640⟩)))))))
def output110 : Fin 64 → GridBox := outputData110.get
def coverData110 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 27)) (.node (.single 59) (.single 36))) (.node (.node (.single 0) (.single 16)) (.node (.single 63) (.single 47)))) (.node (.node (.node (.single 1) (.single 18)) (.node (.single 62) (.single 45))) (.node (.node (.single 2) (.single 17)) (.node (.single 61) (.single 46))))) (.node (.node (.node (.node (.single 3) (.single 19)) (.node (.single 60) (.single 44))) (.node (.node (.single 5) (.single 20)) (.node (.single 58) (.single 43)))) (.node (.node (.node (.single 6) (.single 25)) (.node (.single 57) (.single 38))) (.node (.node (.single 12) (.single 28)) (.node (.single 51) (.single 35)))))) (.node (.node (.node (.node (.node (.single 13) (.single 30)) (.node (.single 50) (.single 33))) (.node (.node (.single 11) (.single 26)) (.node (.single 52) (.single 37)))) (.node (.node (.node (.single 14) (.single 29)) (.node (.single 49) (.single 34))) (.node (.node (.single 15) (.single 31)) (.node (.single 48) (.single 32))))) (.node (.node (.node (.node (.single 7) (.single 21)) (.node (.single 56) (.single 42))) (.node (.node (.single 8) (.single 23)) (.node (.single 55) (.single 40)))) (.node (.node (.node (.single 9) (.single 22)) (.node (.single 54) (.single 41))) (.node (.node (.single 10) (.single 24)) (.node (.single 53) (.single 39)))))))
def sourceData110 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 36))) (.node (.node (.single 28) (.single 32)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 37) (.single 1))) (.node (.node (.single 29) (.single 41)) (.node (.single 33) (.single 45)))))) (.node (.node (.node (.node (.node (.single 47) (.single 35)) (.node (.single 43) (.single 31))) (.node (.node (.single 3) (.single 39)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 34) (.single 30))) (.node (.node (.single 38) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover110 (i : Fin 64) : Fin 64 := ⟨coverData110.get i % 64, Nat.mod_lt _ (by decide)⟩
def source110 (i : Fin 64) : Fin 64 := ⟨sourceData110.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree110 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 .empty (.cutY 14336 .empty (.cutX 7168 (.cutY 15360 .empty (.cutX 6656 (.cutY 15872 .empty (.cutX 6400 (.cutY 16128 .empty (.cutX 6272 (.cutY 16256 (.cutX 6208 (.cutY 16192 .full .full) (.cutY 16192 .full .full)) .full) (.cutY 16256 (.cutX 6336 (.cutY 16192 .full .full) (.cutY 16192 (.cutX 6368 (.cutY 16160 .full .full) (.cutY 16160 .full .full)) .full)) (.cutX 6336 (.cutY 16320 .full .full) (.cutY 16320 .full .full))))) .empty)) .empty)) .empty)))))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 .empty (.cutX 15360 .empty (.cutY 7168 (.cutX 15872 .empty (.cutY 6656 (.cutX 16128 .empty (.cutY 6400 (.cutX 16256 (.cutY 6272 (.cutX 16192 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 16192 (.cutY 6336 .full (.cutX 16160 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full (.cutX 16320 (.cutY 6336 .full .full) (.cutY 6336 .full .full)))) .empty)) .empty)) .empty)))))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 (.cutX 17408 (.cutY 25600 .empty (.cutX 16896 (.cutY 26112 .empty (.cutX 16640 (.cutY 26368 .empty (.cutX 16512 (.cutY 26496 (.cutX 16448 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) .full) (.cutY 26496 (.cutX 16576 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 16608 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 16576 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 (.cutY 18432 (.cutX 25600 .empty (.cutY 17408 (.cutX 26112 .empty (.cutY 16896 (.cutX 26368 .empty (.cutY 16640 (.cutX 26496 (.cutY 16512 (.cutX 26432 (.cutY 16448 .full .full) (.cutY 16448 .full .full)) (.cutX 26432 (.cutY 16576 .full (.cutX 26400 (.cutY 16608 .full .full) (.cutY 16608 .full .full))) (.cutY 16576 .full .full))) (.cutY 16512 .full (.cutX 26560 (.cutY 16576 .full .full) (.cutY 16576 .full .full)))) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))))

theorem metadata110 : 0<69455300 ∧ 24<128 ∧ 63<128 ∧ 1<4 ∧
    6719/4160=1 ∧ 6719%4160=2559 ∧ ∀ i, (leaves110 i).Valid 8 := by
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

noncomputable def phaseMass110 : ℝ := singlePhaseMass (69455300/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw110 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass110_eq : phaseMass110 = (694553/16384000000 : ℝ) := by
  unfold phaseMass110
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw110 output110 cover110 source110
    (gridTreeUnionCheck_sound 32768 raw110 output110 cover110 source110 tree110 checked110)
    _ (by norm_num) _, areaUnits110]
  norm_num

-- Frozen phase 4643, atom 6381, type 1, source (20,61).
def leavesData111 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves111 : Fin 10 → DyadicLeaf := leavesData111.get
def raw111 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 20 61 leaves111 i
def outputData111 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨5120,5248,15616,15744⟩) (.single ⟨5120,5248,15744,15872⟩)) (.node (.single ⟨5248,5312,15616,15680⟩) (.node (.single ⟨5248,5312,15680,15744⟩) (.single ⟨5312,5344,15616,15648⟩)))) (.node (.node (.single ⟨5312,5344,15648,15680⟩) (.single ⟨5344,5376,15616,15648⟩)) (.node (.single ⟨5344,5376,15648,15680⟩) (.node (.single ⟨5312,5376,15680,15744⟩) (.single ⟨5248,5376,15744,15872⟩))))) (.node (.node (.node (.single ⟨15616,15744,5120,5248⟩) (.single ⟨15616,15680,5248,5312⟩)) (.node (.single ⟨15616,15648,5312,5344⟩) (.node (.single ⟨15616,15648,5344,5376⟩) (.single ⟨15648,15680,5312,5344⟩)))) (.node (.node (.single ⟨15648,15680,5344,5376⟩) (.single ⟨15680,15744,5248,5312⟩)) (.node (.single ⟨15680,15744,5312,5376⟩) (.node (.single ⟨15744,15872,5120,5248⟩) (.single ⟨15744,15872,5248,5376⟩)))))) (.node (.node (.node (.node (.single ⟨16896,17024,27392,27520⟩) (.single ⟨16896,17024,27520,27648⟩)) (.node (.single ⟨17024,17088,27392,27456⟩) (.node (.single ⟨17024,17088,27456,27520⟩) (.single ⟨17088,17120,27392,27424⟩)))) (.node (.node (.single ⟨17088,17120,27424,27456⟩) (.single ⟨17120,17152,27392,27424⟩)) (.node (.single ⟨17120,17152,27424,27456⟩) (.node (.single ⟨17088,17152,27456,27520⟩) (.single ⟨17024,17152,27520,27648⟩))))) (.node (.node (.node (.single ⟨27392,27520,16896,17024⟩) (.single ⟨27392,27456,17024,17088⟩)) (.node (.single ⟨27392,27424,17088,17120⟩) (.node (.single ⟨27392,27424,17120,17152⟩) (.single ⟨27424,27456,17088,17120⟩)))) (.node (.node (.single ⟨27424,27456,17120,17152⟩) (.single ⟨27456,27520,17024,17088⟩)) (.node (.single ⟨27456,27520,17088,17152⟩) (.node (.single ⟨27520,27648,16896,17024⟩) (.single ⟨27520,27648,17024,17152⟩)))))))
def output111 : Fin 40 → GridBox := outputData111.get
def coverData111 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 39) (.node (.single 29) (.single 1)))) (.node (.node (.single 18) (.single 38)) (.node (.single 21) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 30) (.single 20)) (.node (.single 2) (.node (.single 11) (.single 37)))) (.node (.node (.single 28) (.single 3)) (.node (.single 16) (.node (.single 36) (.single 23)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 31) (.node (.single 22) (.single 4)))) (.node (.node (.single 12) (.single 35)) (.node (.single 27) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 34) (.single 25)) (.node (.single 6) (.node (.single 13) (.single 33)))) (.node (.node (.single 26) (.single 7)) (.node (.single 15) (.node (.single 32) (.single 24)))))))
def sourceData111 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9)))))) (.node (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover111 (i : Fin 40) : Fin 40 := ⟨coverData111.get i % 40, Nat.mod_lt _ (by decide)⟩
def source111 (i : Fin 40) : Fin 40 := ⟨sourceData111.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree111 : GridCutTree := (.cutX 16384 (.cutY 16384 (.cutX 8192 (.cutY 8192 .empty (.cutX 4096 .empty (.cutY 12288 .empty (.cutX 6144 (.cutY 14336 .empty (.cutX 5120 .empty (.cutY 15360 .empty (.cutX 5632 (.cutY 15872 (.cutX 5376 (.cutY 15616 .empty (.cutX 5248 (.cutY 15744 .full .full) (.cutY 15744 (.cutX 5312 (.cutY 15680 .full .full) (.cutY 15680 (.cutX 5344 (.cutY 15648 .full .full) (.cutY 15648 .full .full)) .full)) .full))) .empty) .empty) .empty)))) .empty)))) (.cutY 8192 (.cutX 12288 .empty (.cutY 4096 .empty (.cutX 14336 .empty (.cutY 6144 (.cutX 15360 .empty (.cutY 5120 .empty (.cutX 15872 (.cutY 5632 (.cutX 15616 .empty (.cutY 5376 (.cutX 15744 (.cutY 5248 .full (.cutX 15680 (.cutY 5312 .full (.cutX 15648 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty) .empty))) .empty)))) .empty)) .empty) (.cutY 16384 .empty (.cutX 24576 (.cutY 24576 .empty (.cutX 20480 (.cutY 28672 (.cutX 18432 (.cutY 26624 .empty (.cutX 17408 (.cutY 27648 (.cutX 16896 .empty (.cutY 27136 .empty (.cutX 17152 (.cutY 27392 .empty (.cutX 17024 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 17088 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 17120 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) .full))) .empty))) .empty) .empty)) .empty) .empty) .empty)) (.cutY 24576 (.cutX 28672 (.cutY 20480 (.cutX 26624 .empty (.cutY 18432 (.cutX 27648 (.cutY 17408 (.cutX 27136 .empty (.cutY 16896 .empty (.cutX 27392 .empty (.cutY 17152 (.cutX 27520 (.cutY 17024 .full (.cutX 27456 (.cutY 17088 .full (.cutX 27424 (.cutY 17120 .full .full) (.cutY 17120 .full .full))) (.cutY 17088 .full .full))) (.cutY 17024 .full .full)) .empty)))) .empty) .empty) .empty)) .empty) .empty) .empty))))

theorem metadata111 : 0<166308920 ∧ 20<128 ∧ 61<128 ∧ 1<4 ∧
    6381/4160=1 ∧ 6381%4160=2221 ∧ ∀ i, (leaves111 i).Valid 8 := by
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

noncomputable def phaseMass111 : ℝ := singlePhaseMass (166308920/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw111 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass111_eq : phaseMass111 = (4157723/40960000000 : ℝ) := by
  unfold phaseMass111
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw111 output111 cover111 source111
    (gridTreeUnionCheck_sound 32768 raw111 output111 cover111 source111 tree111 checked111)
    _ (by norm_num) _, areaUnits111]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97,phaseMass98,phaseMass99,phaseMass100,phaseMass101,phaseMass102,phaseMass103,phaseMass104,phaseMass105,phaseMass106,phaseMass107,phaseMass108,phaseMass109,phaseMass110,phaseMass111].sum

theorem actual_batch_mass : batchActualMass = (547109136601/52428800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq,phaseMass98_eq,phaseMass99_eq,phaseMass100_eq,phaseMass101_eq,phaseMass102_eq,phaseMass103_eq,phaseMass104_eq,phaseMass105_eq,phaseMass106_eq,phaseMass107_eq,phaseMass108_eq,phaseMass109_eq,phaseMass110_eq,phaseMass111_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch04532
#print axioms NoThreeLine.ScheduleUnionBatch04532.actual_batch_mass
