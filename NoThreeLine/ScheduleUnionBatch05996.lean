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
namespace NoThreeLine.ScheduleUnionBatch05996

-- Frozen phase 5996, atom 322, type 0, source (2,70).
def leavesData0 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves0 : Fin 13 → DyadicLeaf := leavesData0.get
def raw0 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 70 leaves0 i
def outputData0 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,17920,17984⟩) (.node (.single ⟨512,576,17984,18048⟩) (.single ⟨576,640,17920,17984⟩))) (.node (.single ⟨576,640,17984,18048⟩) (.node (.single ⟨512,640,18048,18176⟩) (.single ⟨640,704,17920,17984⟩)))) (.node (.node (.single ⟨640,704,17984,18048⟩) (.node (.single ⟨704,736,17920,17952⟩) (.single ⟨704,736,17952,17984⟩))) (.node (.node (.single ⟨736,768,17920,17952⟩) (.single ⟨736,768,17952,17984⟩)) (.node (.single ⟨704,768,17984,18048⟩) (.single ⟨640,768,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,32000,32128⟩) (.node (.single ⟨14592,14720,32128,32256⟩) (.single ⟨14720,14784,32000,32064⟩))) (.node (.single ⟨14720,14784,32064,32128⟩) (.node (.single ⟨14784,14816,32000,32032⟩) (.single ⟨14784,14816,32032,32064⟩)))) (.node (.node (.single ⟨14816,14848,32000,32032⟩) (.node (.single ⟨14816,14848,32032,32064⟩) (.single ⟨14784,14848,32064,32128⟩))) (.node (.node (.single ⟨14720,14784,32128,32192⟩) (.single ⟨14720,14784,32192,32256⟩)) (.node (.single ⟨14784,14848,32128,32192⟩) (.single ⟨14784,14848,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,512,576⟩) (.node (.single ⟨17920,17984,576,640⟩) (.single ⟨17984,18048,512,576⟩))) (.node (.single ⟨17984,18048,576,640⟩) (.node (.single ⟨17920,17984,640,704⟩) (.single ⟨17920,17952,704,736⟩)))) (.node (.node (.single ⟨17920,17952,736,768⟩) (.node (.single ⟨17952,17984,704,736⟩) (.single ⟨17952,17984,736,768⟩))) (.node (.node (.single ⟨17984,18048,640,704⟩) (.single ⟨17984,18048,704,768⟩)) (.node (.single ⟨18048,18176,512,640⟩) (.single ⟨18048,18176,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,14592,14720⟩) (.node (.single ⟨32000,32064,14720,14784⟩) (.single ⟨32000,32032,14784,14816⟩))) (.node (.single ⟨32000,32032,14816,14848⟩) (.node (.single ⟨32032,32064,14784,14816⟩) (.single ⟨32032,32064,14816,14848⟩)))) (.node (.node (.single ⟨32064,32128,14720,14784⟩) (.node (.single ⟨32064,32128,14784,14848⟩) (.single ⟨32128,32256,14592,14720⟩))) (.node (.node (.single ⟨32128,32192,14720,14784⟩) (.single ⟨32128,32192,14784,14848⟩)) (.node (.single ⟨32192,32256,14720,14784⟩) (.single ⟨32192,32256,14784,14848⟩)))))))
def output0 : Fin 52 → GridBox := outputData0.get
def coverData0 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData0 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover0 (i : Fin 52) : Fin 52 := ⟨coverData0.get i % 52, Nat.mod_lt _ (by decide)⟩
def source0 (i : Fin 52) : Fin 52 := ⟨sourceData0.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree0 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 (.cutY 18176 (.cutX 640 (.cutY 18048 (.cutX 576 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 704 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 736 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 .empty (.cutY 32000 .empty (.cutX 14720 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 14784 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 14816 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 14784 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 (.cutY 768 (.cutX 18048 (.cutY 640 (.cutX 17984 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 17984 (.cutY 704 .full (.cutX 17952 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 .empty (.cutY 14592 .empty (.cutX 32128 (.cutY 14720 .full (.cutX 32064 (.cutY 14784 .full (.cutX 32032 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 32192 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty) .empty) .empty)))))))) .empty))

theorem metadata0 : 0<114037843 ∧ 2<128 ∧ 70<128 ∧ 0<4 ∧
    322/4160=0 ∧ 322%4160=322 ∧ ∀ i, (leaves0 i).Valid 8 := by
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

noncomputable def phaseMass0 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw0 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass0_eq : phaseMass0 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass0
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw0 output0 cover0 source0
    (gridTreeUnionCheck_sound 32768 raw0 output0 cover0 source0 tree0 checked0)
    _ (by norm_num) _, areaUnits0]
  norm_num

-- Frozen phase 5997, atom 4604, type 1, source (3,69).
def leavesData1 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves1 : Fin 13 → DyadicLeaf := leavesData1.get
def raw1 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 3 69 leaves1 i
def outputData1 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨768,832,17664,17728⟩) (.node (.single ⟨768,832,17728,17792⟩) (.single ⟨832,896,17664,17728⟩))) (.node (.single ⟨832,896,17728,17792⟩) (.node (.single ⟨768,896,17792,17920⟩) (.single ⟨896,960,17664,17728⟩)))) (.node (.node (.single ⟨896,960,17728,17792⟩) (.node (.single ⟨960,992,17664,17696⟩) (.single ⟨960,992,17696,17728⟩))) (.node (.node (.single ⟨992,1024,17664,17696⟩) (.single ⟨992,1024,17696,17728⟩)) (.node (.single ⟨960,1024,17728,17792⟩) (.single ⟨896,1024,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,31744,31872⟩) (.node (.single ⟨14848,14976,31872,32000⟩) (.single ⟨14976,15040,31744,31808⟩))) (.node (.single ⟨14976,15040,31808,31872⟩) (.node (.single ⟨15040,15072,31744,31776⟩) (.single ⟨15040,15072,31776,31808⟩)))) (.node (.node (.single ⟨15072,15104,31744,31776⟩) (.node (.single ⟨15072,15104,31776,31808⟩) (.single ⟨15040,15104,31808,31872⟩))) (.node (.node (.single ⟨14976,15040,31872,31936⟩) (.single ⟨14976,15040,31936,32000⟩)) (.node (.single ⟨15040,15104,31872,31936⟩) (.single ⟨15040,15104,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,768,832⟩) (.node (.single ⟨17664,17728,832,896⟩) (.single ⟨17728,17792,768,832⟩))) (.node (.single ⟨17728,17792,832,896⟩) (.node (.single ⟨17664,17728,896,960⟩) (.single ⟨17664,17696,960,992⟩)))) (.node (.node (.single ⟨17664,17696,992,1024⟩) (.node (.single ⟨17696,17728,960,992⟩) (.single ⟨17696,17728,992,1024⟩))) (.node (.node (.single ⟨17728,17792,896,960⟩) (.single ⟨17728,17792,960,1024⟩)) (.node (.single ⟨17792,17920,768,896⟩) (.single ⟨17792,17920,896,1024⟩))))) (.node (.node (.node (.single ⟨31744,31872,14848,14976⟩) (.node (.single ⟨31744,31808,14976,15040⟩) (.single ⟨31744,31776,15040,15072⟩))) (.node (.single ⟨31744,31776,15072,15104⟩) (.node (.single ⟨31776,31808,15040,15072⟩) (.single ⟨31776,31808,15072,15104⟩)))) (.node (.node (.single ⟨31808,31872,14976,15040⟩) (.node (.single ⟨31808,31872,15040,15104⟩) (.single ⟨31872,32000,14848,14976⟩))) (.node (.node (.single ⟨31872,31936,14976,15040⟩) (.single ⟨31872,31936,15040,15104⟩)) (.node (.single ⟨31936,32000,14976,15040⟩) (.single ⟨31936,32000,15040,15104⟩)))))))
def output1 : Fin 52 → GridBox := outputData1.get
def coverData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData1 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover1 (i : Fin 52) : Fin 52 := ⟨coverData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def source1 (i : Fin 52) : Fin 52 := ⟨sourceData1.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree1 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 (.cutX 768 .empty (.cutY 17664 .empty (.cutX 896 (.cutY 17792 (.cutX 832 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 960 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 992 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 (.cutX 15104 (.cutY 32000 (.cutX 14976 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 15040 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 15072 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) .full)) (.cutX 15040 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 .empty (.cutX 17664 .empty (.cutY 768 .empty (.cutX 17792 (.cutY 896 (.cutX 17728 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 17728 (.cutY 960 .full (.cutX 17696 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full .full))))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 .empty (.cutX 32000 (.cutY 15104 (.cutX 31872 (.cutY 14976 .full (.cutX 31808 (.cutY 15040 .full (.cutX 31776 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 31936 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty)) .empty) .empty)))))))) .empty))

theorem metadata1 : 0<202148459 ∧ 3<128 ∧ 69<128 ∧ 1<4 ∧
    4604/4160=1 ∧ 4604%4160=444 ∧ ∀ i, (leaves1 i).Valid 8 := by
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

noncomputable def phaseMass1 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw1 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass1_eq : phaseMass1 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass1
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw1 output1 cover1 source1
    (gridTreeUnionCheck_sound 32768 raw1 output1 cover1 source1 tree1 checked1)
    _ (by norm_num) _, areaUnits1]
  norm_num

-- Frozen phase 5998, atom 5728, type 1, source (13,73).
def leavesData2 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves2 : Fin 7 → DyadicLeaf := leavesData2.get
def raw2 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 73 leaves2 i
def outputData2 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,18688,18816⟩) (.node (.single ⟨3328,3456,18816,18944⟩) (.single ⟨3456,3520,18688,18752⟩))) (.node (.node (.single ⟨3456,3520,18752,18816⟩) (.single ⟨3520,3584,18688,18752⟩)) (.node (.single ⟨3520,3584,18752,18816⟩) (.single ⟨3456,3584,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29184,29312⟩) (.node (.single ⟨13824,13952,29312,29440⟩) (.single ⟨13952,14016,29184,29248⟩))) (.node (.node (.single ⟨13952,14016,29248,29312⟩) (.single ⟨14016,14080,29184,29248⟩)) (.node (.single ⟨14016,14080,29248,29312⟩) (.single ⟨13952,14080,29312,29440⟩))))) (.node (.node (.node (.single ⟨18688,18816,3328,3456⟩) (.node (.single ⟨18688,18752,3456,3520⟩) (.single ⟨18688,18752,3520,3584⟩))) (.node (.node (.single ⟨18752,18816,3456,3520⟩) (.single ⟨18752,18816,3520,3584⟩)) (.node (.single ⟨18816,18944,3328,3456⟩) (.single ⟨18816,18944,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,13824,13952⟩) (.node (.single ⟨29184,29248,13952,14016⟩) (.single ⟨29184,29248,14016,14080⟩))) (.node (.node (.single ⟨29248,29312,13952,14016⟩) (.single ⟨29248,29312,14016,14080⟩)) (.node (.single ⟨29312,29440,13824,13952⟩) (.single ⟨29312,29440,13952,14080⟩))))))
def output2 : Fin 28 → GridBox := outputData2.get
def coverData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData2 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover2 (i : Fin 28) : Fin 28 := ⟨coverData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def source2 (i : Fin 28) : Fin 28 := ⟨sourceData2.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree2 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 (.cutX 3328 .empty (.cutY 18688 .empty (.cutX 3456 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 3520 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 .empty (.cutY 29184 .empty (.cutX 14080 (.cutY 29440 (.cutX 13952 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 14016 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty) .empty))) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 (.cutY 3584 (.cutX 18688 .empty (.cutY 3328 .empty (.cutX 18816 (.cutY 3456 .full (.cutX 18752 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full)))) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 .empty (.cutX 29440 (.cutY 14080 (.cutX 29312 (.cutY 13952 .full (.cutX 29248 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)))) .empty) .empty) .empty))))) .empty))

theorem metadata2 : 0<94387549 ∧ 13<128 ∧ 73<128 ∧ 1<4 ∧
    5728/4160=1 ∧ 5728%4160=1568 ∧ ∀ i, (leaves2 i).Valid 8 := by
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

noncomputable def phaseMass2 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw2 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass2_eq : phaseMass2 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass2
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw2 output2 cover2 source2
    (gridTreeUnionCheck_sound 32768 raw2 output2 cover2 source2 tree2 checked2)
    _ (by norm_num) _, areaUnits2]
  norm_num

-- Frozen phase 5999, atom 5519, type 1, source (11,72).
def leavesData3 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves3 : Fin 7 → DyadicLeaf := leavesData3.get
def raw3 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 72 leaves3 i
def outputData3 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,18432,18560⟩) (.node (.single ⟨2816,2944,18560,18688⟩) (.single ⟨2944,3008,18432,18496⟩))) (.node (.node (.single ⟨2944,3008,18496,18560⟩) (.single ⟨3008,3072,18432,18496⟩)) (.node (.single ⟨3008,3072,18496,18560⟩) (.single ⟨2944,3072,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,29696,29824⟩) (.node (.single ⟨14080,14208,29824,29952⟩) (.single ⟨14208,14272,29696,29760⟩))) (.node (.node (.single ⟨14208,14272,29760,29824⟩) (.single ⟨14272,14336,29696,29760⟩)) (.node (.single ⟨14272,14336,29760,29824⟩) (.single ⟨14208,14336,29824,29952⟩))))) (.node (.node (.node (.single ⟨18432,18560,2816,2944⟩) (.node (.single ⟨18432,18496,2944,3008⟩) (.single ⟨18432,18496,3008,3072⟩))) (.node (.node (.single ⟨18496,18560,2944,3008⟩) (.single ⟨18496,18560,3008,3072⟩)) (.node (.single ⟨18560,18688,2816,2944⟩) (.single ⟨18560,18688,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,14080,14208⟩) (.node (.single ⟨29696,29760,14208,14272⟩) (.single ⟨29696,29760,14272,14336⟩))) (.node (.node (.single ⟨29760,29824,14208,14272⟩) (.single ⟨29760,29824,14272,14336⟩)) (.node (.single ⟨29824,29952,14080,14208⟩) (.single ⟨29824,29952,14208,14336⟩))))))
def output3 : Fin 28 → GridBox := outputData3.get
def coverData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData3 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover3 (i : Fin 28) : Fin 28 := ⟨coverData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def source3 (i : Fin 28) : Fin 28 := ⟨sourceData3.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree3 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 .empty (.cutY 18688 (.cutX 2944 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 3008 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 .empty (.cutY 29952 (.cutX 14208 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 14272 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty)) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 (.cutY 2816 .empty (.cutX 18560 (.cutY 2944 .full (.cutX 18496 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 (.cutY 14080 .empty (.cutX 29824 (.cutY 14208 .full (.cutX 29760 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)) .empty))) .empty) .empty))))) .empty))

theorem metadata3 : 0<94387549 ∧ 11<128 ∧ 72<128 ∧ 1<4 ∧
    5519/4160=1 ∧ 5519%4160=1359 ∧ ∀ i, (leaves3 i).Valid 8 := by
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

noncomputable def phaseMass3 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw3 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass3_eq : phaseMass3 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass3
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw3 output3 cover3 source3
    (gridTreeUnionCheck_sound 32768 raw3 output3 cover3 source3 tree3 checked3)
    _ (by norm_num) _, areaUnits3]
  norm_num

-- Frozen phase 6000, atom 5302, type 1, source (9,71).
def leavesData4 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves4 : Fin 10 → DyadicLeaf := leavesData4.get
def raw4 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 9 71 leaves4 i
def outputData4 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2304,2368,18176,18240⟩) (.single ⟨2304,2368,18240,18304⟩)) (.node (.single ⟨2368,2432,18176,18240⟩) (.node (.single ⟨2368,2432,18240,18304⟩) (.single ⟨2304,2432,18304,18432⟩)))) (.node (.node (.single ⟨2432,2496,18176,18240⟩) (.single ⟨2432,2496,18240,18304⟩)) (.node (.single ⟨2496,2560,18176,18240⟩) (.node (.single ⟨2496,2560,18240,18304⟩) (.single ⟨2432,2560,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30208,30336⟩) (.single ⟨14336,14464,30336,30464⟩)) (.node (.single ⟨14464,14528,30208,30272⟩) (.node (.single ⟨14464,14528,30272,30336⟩) (.single ⟨14528,14592,30208,30272⟩)))) (.node (.node (.single ⟨14528,14592,30272,30336⟩) (.single ⟨14464,14528,30336,30400⟩)) (.node (.single ⟨14464,14528,30400,30464⟩) (.node (.single ⟨14528,14592,30336,30400⟩) (.single ⟨14528,14592,30400,30464⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,2304,2368⟩) (.single ⟨18176,18240,2368,2432⟩)) (.node (.single ⟨18240,18304,2304,2368⟩) (.node (.single ⟨18240,18304,2368,2432⟩) (.single ⟨18176,18240,2432,2496⟩)))) (.node (.node (.single ⟨18176,18240,2496,2560⟩) (.single ⟨18240,18304,2432,2496⟩)) (.node (.single ⟨18240,18304,2496,2560⟩) (.node (.single ⟨18304,18432,2304,2432⟩) (.single ⟨18304,18432,2432,2560⟩))))) (.node (.node (.node (.single ⟨30208,30336,14336,14464⟩) (.single ⟨30208,30272,14464,14528⟩)) (.node (.single ⟨30208,30272,14528,14592⟩) (.node (.single ⟨30272,30336,14464,14528⟩) (.single ⟨30272,30336,14528,14592⟩)))) (.node (.node (.single ⟨30336,30464,14336,14464⟩) (.single ⟨30336,30400,14464,14528⟩)) (.node (.single ⟨30336,30400,14528,14592⟩) (.node (.single ⟨30400,30464,14464,14528⟩) (.single ⟨30400,30464,14528,14592⟩)))))))
def output4 : Fin 40 → GridBox := outputData4.get
def coverData4 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData4 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover4 (i : Fin 40) : Fin 40 := ⟨coverData4.get i % 40, Nat.mod_lt _ (by decide)⟩
def source4 (i : Fin 40) : Fin 40 := ⟨sourceData4.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree4 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 .empty (.cutX 2304 .empty (.cutY 18176 .empty (.cutX 2432 (.cutY 18304 (.cutX 2368 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 2496 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 .empty (.cutX 14592 (.cutY 30464 (.cutX 14464 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 14528 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) (.cutX 14528 (.cutY 30400 .full .full) (.cutY 30400 .full .full)))) .empty) .empty)) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 (.cutX 18176 .empty (.cutY 2304 .empty (.cutX 18304 (.cutY 2432 (.cutX 18240 (.cutY 2368 .full .full) (.cutY 2368 .full .full)) (.cutX 18240 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 (.cutX 30464 (.cutY 14592 (.cutX 30336 (.cutY 14464 .full (.cutX 30272 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 30400 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty)) .empty))) .empty))))) .empty))

theorem metadata4 : 0<135229957 ∧ 9<128 ∧ 71<128 ∧ 1<4 ∧
    5302/4160=1 ∧ 5302%4160=1142 ∧ ∀ i, (leaves4 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData4).mp
    (by decide +kernel)

theorem sourceChecked4_0 : ∀ i : Fin 40,
    (fun i => output4 i = raw4 (source4 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked4 : ∀ i : Fin 40, (fun i => output4 i = raw4 (source4 i)) i :=
  forallFin_of_zero_offset (fun i => output4 i = raw4 (source4 i)) sourceChecked4_0

theorem coverChecked4_0 : ∀ i : Fin 40,
    (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked4 : ∀ i : Fin 40, (fun i => (output4 (cover4 i)).ContainsBox (raw4 i)) i :=
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

noncomputable def phaseMass4 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw4 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass4_eq : phaseMass4 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass4
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw4 output4 cover4 source4
    (gridTreeUnionCheck_sound 32768 raw4 output4 cover4 source4 tree4 checked4)
    _ (by norm_num) _, areaUnits4]
  norm_num

-- Frozen phase 6001, atom 5830, type 1, source (14,74).
def leavesData5 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves5 : Fin 7 → DyadicLeaf := leavesData5.get
def raw5 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 74 leaves5 i
def outputData5 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,18944,19072⟩) (.node (.single ⟨3584,3712,19072,19200⟩) (.single ⟨3712,3776,18944,19008⟩))) (.node (.node (.single ⟨3712,3776,19008,19072⟩) (.single ⟨3776,3840,18944,19008⟩)) (.node (.single ⟨3776,3840,19008,19072⟩) (.single ⟨3712,3840,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,28928,29056⟩) (.node (.single ⟨13568,13696,29056,29184⟩) (.single ⟨13696,13760,28928,28992⟩))) (.node (.node (.single ⟨13696,13760,28992,29056⟩) (.single ⟨13760,13824,28928,28992⟩)) (.node (.single ⟨13760,13824,28992,29056⟩) (.single ⟨13696,13824,29056,29184⟩))))) (.node (.node (.node (.single ⟨18944,19072,3584,3712⟩) (.node (.single ⟨18944,19008,3712,3776⟩) (.single ⟨18944,19008,3776,3840⟩))) (.node (.node (.single ⟨19008,19072,3712,3776⟩) (.single ⟨19008,19072,3776,3840⟩)) (.node (.single ⟨19072,19200,3584,3712⟩) (.single ⟨19072,19200,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,13568,13696⟩) (.node (.single ⟨28928,28992,13696,13760⟩) (.single ⟨28928,28992,13760,13824⟩))) (.node (.node (.single ⟨28992,29056,13696,13760⟩) (.single ⟨28992,29056,13760,13824⟩)) (.node (.single ⟨29056,29184,13568,13696⟩) (.single ⟨29056,29184,13696,13824⟩))))))
def output5 : Fin 28 → GridBox := outputData5.get
def coverData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData5 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover5 (i : Fin 28) : Fin 28 := ⟨coverData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def source5 (i : Fin 28) : Fin 28 := ⟨sourceData5.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree5 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 .empty (.cutY 18944 .empty (.cutX 3840 (.cutY 19200 (.cutX 3712 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 3776 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 (.cutX 13568 .empty (.cutY 28928 .empty (.cutX 13696 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 13760 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 .empty (.cutX 19200 (.cutY 3840 (.cutX 19072 (.cutY 3712 .full (.cutX 19008 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty)))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 (.cutY 13824 (.cutX 28928 .empty (.cutY 13568 .empty (.cutX 29056 (.cutY 13696 .full (.cutX 28992 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty)) .empty) .empty) .empty))))) .empty))

theorem metadata5 : 0<94387549 ∧ 14<128 ∧ 74<128 ∧ 1<4 ∧
    5830/4160=1 ∧ 5830%4160=1670 ∧ ∀ i, (leaves5 i).Valid 8 := by
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

noncomputable def phaseMass5 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw5 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass5_eq : phaseMass5 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass5
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw5 output5 cover5 source5
    (gridTreeUnionCheck_sound 32768 raw5 output5 cover5 source5 tree5 checked5)
    _ (by norm_num) _, areaUnits5]
  norm_num

-- Frozen phase 6002, atom 5930, type 1, source (15,75).
def leavesData6 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves6 : Fin 7 → DyadicLeaf := leavesData6.get
def raw6 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 75 leaves6 i
def outputData6 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,19200,19328⟩) (.node (.single ⟨3840,3968,19328,19456⟩) (.single ⟨3968,4032,19200,19264⟩))) (.node (.node (.single ⟨3968,4032,19264,19328⟩) (.single ⟨4032,4096,19200,19264⟩)) (.node (.single ⟨4032,4096,19264,19328⟩) (.single ⟨3968,4096,19328,19456⟩)))) (.node (.node (.single ⟨13312,13440,28672,28800⟩) (.node (.single ⟨13312,13440,28800,28928⟩) (.single ⟨13440,13504,28672,28736⟩))) (.node (.node (.single ⟨13440,13504,28736,28800⟩) (.single ⟨13504,13568,28672,28736⟩)) (.node (.single ⟨13504,13568,28736,28800⟩) (.single ⟨13440,13568,28800,28928⟩))))) (.node (.node (.node (.single ⟨19200,19328,3840,3968⟩) (.node (.single ⟨19200,19264,3968,4032⟩) (.single ⟨19200,19264,4032,4096⟩))) (.node (.node (.single ⟨19264,19328,3968,4032⟩) (.single ⟨19264,19328,4032,4096⟩)) (.node (.single ⟨19328,19456,3840,3968⟩) (.single ⟨19328,19456,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,13312,13440⟩) (.node (.single ⟨28672,28736,13440,13504⟩) (.single ⟨28672,28736,13504,13568⟩))) (.node (.node (.single ⟨28736,28800,13440,13504⟩) (.single ⟨28736,28800,13504,13568⟩)) (.node (.single ⟨28800,28928,13312,13440⟩) (.single ⟨28800,28928,13440,13568⟩))))))
def output6 : Fin 28 → GridBox := outputData6.get
def coverData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData6 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover6 (i : Fin 28) : Fin 28 := ⟨coverData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def source6 (i : Fin 28) : Fin 28 := ⟨sourceData6.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree6 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 .empty (.cutY 18944 .empty (.cutX 3840 .empty (.cutY 19200 .empty (.cutX 3968 (.cutY 19328 .full .full) (.cutY 19328 (.cutX 4032 (.cutY 19264 .full .full) (.cutY 19264 .full .full)) .full)))))) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 (.cutX 13568 (.cutY 28928 (.cutX 13440 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 13504 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 .empty (.cutX 19200 .empty (.cutY 3840 .empty (.cutX 19328 (.cutY 3968 .full (.cutX 19264 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))))))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 (.cutY 13824 (.cutX 28928 (.cutY 13568 (.cutX 28800 (.cutY 13440 .full (.cutX 28736 (.cutY 13504 .full .full) (.cutY 13504 .full .full))) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))))) .empty))

theorem metadata6 : 0<94387549 ∧ 15<128 ∧ 75<128 ∧ 1<4 ∧
    5930/4160=1 ∧ 5930%4160=1770 ∧ ∀ i, (leaves6 i).Valid 8 := by
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

-- Frozen phase 6003, atom 6656, type 1, source (23,81).
def leavesData7 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves7 : Fin 16 → DyadicLeaf := leavesData7.get
def raw7 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 23 81 leaves7 i
def outputData7 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨5888,5952,20736,20800⟩) (.single ⟨5888,5952,20800,20864⟩)) (.node (.single ⟨5952,6016,20736,20800⟩) (.single ⟨5952,6016,20800,20864⟩))) (.node (.node (.single ⟨5888,6016,20864,20992⟩) (.single ⟨6016,6080,20736,20800⟩)) (.node (.single ⟨6016,6080,20800,20864⟩) (.single ⟨6080,6112,20736,20768⟩)))) (.node (.node (.node (.single ⟨6080,6112,20768,20800⟩) (.single ⟨6112,6128,20736,20752⟩)) (.node (.single ⟨6112,6128,20752,20768⟩) (.single ⟨6128,6144,20736,20752⟩))) (.node (.node (.single ⟨6128,6144,20752,20768⟩) (.single ⟨6112,6144,20768,20800⟩)) (.node (.single ⟨6080,6144,20800,20864⟩) (.single ⟨6016,6144,20864,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11904,26624,26752⟩) (.single ⟨11776,11904,26752,26880⟩)) (.node (.single ⟨11904,11968,26624,26688⟩) (.single ⟨11904,11968,26688,26752⟩))) (.node (.node (.single ⟨11968,12000,26624,26656⟩) (.single ⟨11968,12000,26656,26688⟩)) (.node (.single ⟨12000,12016,26624,26640⟩) (.single ⟨12000,12016,26640,26656⟩)))) (.node (.node (.node (.single ⟨12016,12032,26624,26640⟩) (.single ⟨12016,12032,26640,26656⟩)) (.node (.single ⟨12000,12032,26656,26688⟩) (.single ⟨11968,12032,26688,26752⟩))) (.node (.node (.single ⟨11904,11968,26752,26816⟩) (.single ⟨11904,11968,26816,26880⟩)) (.node (.single ⟨11968,12032,26752,26816⟩) (.single ⟨11968,12032,26816,26880⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,5888,5952⟩) (.single ⟨20736,20800,5952,6016⟩)) (.node (.single ⟨20800,20864,5888,5952⟩) (.single ⟨20800,20864,5952,6016⟩))) (.node (.node (.single ⟨20736,20800,6016,6080⟩) (.single ⟨20736,20768,6080,6112⟩)) (.node (.single ⟨20736,20752,6112,6128⟩) (.single ⟨20736,20752,6128,6144⟩)))) (.node (.node (.node (.single ⟨20752,20768,6112,6128⟩) (.single ⟨20752,20768,6128,6144⟩)) (.node (.single ⟨20768,20800,6080,6112⟩) (.single ⟨20768,20800,6112,6144⟩))) (.node (.node (.single ⟨20800,20864,6016,6080⟩) (.single ⟨20800,20864,6080,6144⟩)) (.node (.single ⟨20864,20992,5888,6016⟩) (.single ⟨20864,20992,6016,6144⟩))))) (.node (.node (.node (.node (.single ⟨26624,26752,11776,11904⟩) (.single ⟨26624,26688,11904,11968⟩)) (.node (.single ⟨26624,26656,11968,12000⟩) (.single ⟨26624,26640,12000,12016⟩))) (.node (.node (.single ⟨26624,26640,12016,12032⟩) (.single ⟨26640,26656,12000,12016⟩)) (.node (.single ⟨26640,26656,12016,12032⟩) (.single ⟨26656,26688,11968,12000⟩)))) (.node (.node (.node (.single ⟨26656,26688,12000,12032⟩) (.single ⟨26688,26752,11904,11968⟩)) (.node (.single ⟨26688,26752,11968,12032⟩) (.single ⟨26752,26880,11776,11904⟩))) (.node (.node (.single ⟨26752,26816,11904,11968⟩) (.single ⟨26752,26816,11968,12032⟩)) (.node (.single ⟨26816,26880,11904,11968⟩) (.single ⟨26816,26880,11968,12032⟩)))))))
def output7 : Fin 64 → GridBox := outputData7.get
def coverData7 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19)))))) (.node (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData7 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 24)) (.node (.single 28) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 35) (.single 31))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 25) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 34)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 30)) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover7 (i : Fin 64) : Fin 64 := ⟨coverData7.get i % 64, Nat.mod_lt _ (by decide)⟩
def source7 (i : Fin 64) : Fin 64 := ⟨sourceData7.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree7 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 (.cutX 5888 .empty (.cutY 20736 .empty (.cutX 6016 (.cutY 20864 (.cutX 5952 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 6080 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 6112 (.cutY 20768 .full .full) (.cutY 20768 (.cutX 6128 (.cutY 20752 .full .full) (.cutY 20752 .full .full)) .full)) .full)) .full)))) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 (.cutX 12032 (.cutY 26880 (.cutX 11904 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 11968 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 12000 (.cutY 26656 .full .full) (.cutY 26656 (.cutX 12016 (.cutY 26640 .full .full) (.cutY 26640 .full .full)) .full)) .full)) (.cutX 11968 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty)) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 .empty (.cutX 20736 .empty (.cutY 5888 .empty (.cutX 20864 (.cutY 6016 (.cutX 20800 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 20800 (.cutY 6080 .full (.cutX 20768 (.cutY 6112 .full (.cutX 20752 (.cutY 6128 .full .full) (.cutY 6128 .full .full))) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 .empty (.cutX 26880 (.cutY 12032 (.cutX 26752 (.cutY 11904 .full (.cutX 26688 (.cutY 11968 .full (.cutX 26656 (.cutY 12000 .full (.cutX 26640 (.cutY 12016 .full .full) (.cutY 12016 .full .full))) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 26816 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty)) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata7 : 0<125829407 ∧ 23<128 ∧ 81<128 ∧ 1<4 ∧
    6656/4160=1 ∧ 6656%4160=2496 ∧ ∀ i, (leaves7 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData7).mp
    (by decide +kernel)

theorem sourceChecked7_0 : ∀ i : Fin 64,
    (fun i => output7 i = raw7 (source7 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked7 : ∀ i : Fin 64, (fun i => output7 i = raw7 (source7 i)) i :=
  forallFin_of_zero_offset (fun i => output7 i = raw7 (source7 i)) sourceChecked7_0

theorem coverChecked7_0 : ∀ i : Fin 64,
    (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked7 : ∀ i : Fin 64, (fun i => (output7 (cover7 i)).ContainsBox (raw7 i)) i :=
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

noncomputable def phaseMass7 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw7 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass7_eq : phaseMass7 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass7
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw7 output7 cover7 source7
    (gridTreeUnionCheck_sound 32768 raw7 output7 cover7 source7 tree7 checked7)
    _ (by norm_num) _, areaUnits7]
  norm_num

-- Frozen phase 6004, atom 1773, type 0, source (15,78).
def leavesData8 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves8 : Fin 7 → DyadicLeaf := leavesData8.get
def raw8 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 78 leaves8 i
def outputData8 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,19968,20096⟩) (.node (.single ⟨3840,3968,20096,20224⟩) (.single ⟨3968,4032,19968,20032⟩))) (.node (.node (.single ⟨3968,4032,20032,20096⟩) (.single ⟨4032,4096,19968,20032⟩)) (.node (.single ⟨4032,4096,20032,20096⟩) (.single ⟨3968,4096,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,28672,28800⟩) (.node (.single ⟨12544,12672,28800,28928⟩) (.single ⟨12672,12736,28672,28736⟩))) (.node (.node (.single ⟨12672,12736,28736,28800⟩) (.single ⟨12736,12800,28672,28736⟩)) (.node (.single ⟨12736,12800,28736,28800⟩) (.single ⟨12672,12800,28800,28928⟩))))) (.node (.node (.node (.single ⟨19968,20096,3840,3968⟩) (.node (.single ⟨19968,20032,3968,4032⟩) (.single ⟨19968,20032,4032,4096⟩))) (.node (.node (.single ⟨20032,20096,3968,4032⟩) (.single ⟨20032,20096,4032,4096⟩)) (.node (.single ⟨20096,20224,3840,3968⟩) (.single ⟨20096,20224,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,12544,12672⟩) (.node (.single ⟨28672,28736,12672,12736⟩) (.single ⟨28672,28736,12736,12800⟩))) (.node (.node (.single ⟨28736,28800,12672,12736⟩) (.single ⟨28736,28800,12736,12800⟩)) (.node (.single ⟨28800,28928,12544,12672⟩) (.single ⟨28800,28928,12672,12800⟩))))))
def output8 : Fin 28 → GridBox := outputData8.get
def coverData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData8 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover8 (i : Fin 28) : Fin 28 := ⟨coverData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def source8 (i : Fin 28) : Fin 28 := ⟨sourceData8.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree8 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 .empty (.cutX 3840 .empty (.cutY 20224 (.cutX 3968 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 4032 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty)))))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 (.cutX 12544 .empty (.cutY 28928 (.cutX 12672 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 12736 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 .empty (.cutX 20224 (.cutY 3840 .empty (.cutX 20096 (.cutY 3968 .full (.cutX 20032 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty))))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 (.cutX 28928 (.cutY 12544 .empty (.cutX 28800 (.cutY 12672 .full (.cutX 28736 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full))) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata8 : 0<48363413 ∧ 15<128 ∧ 78<128 ∧ 0<4 ∧
    1773/4160=0 ∧ 1773%4160=1773 ∧ ∀ i, (leaves8 i).Valid 8 := by
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

noncomputable def phaseMass8 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw8 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass8_eq : phaseMass8 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass8
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw8 output8 cover8 source8
    (gridTreeUnionCheck_sound 32768 raw8 output8 cover8 source8 tree8 checked8)
    _ (by norm_num) _, areaUnits8]
  norm_num

-- Frozen phase 6005, atom 2330, type 0, source (21,83).
def leavesData9 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves9 : Fin 13 → DyadicLeaf := leavesData9.get
def raw9 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 83 leaves9 i
def outputData9 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,21248,21312⟩) (.node (.single ⟨5376,5440,21312,21376⟩) (.single ⟨5440,5504,21248,21312⟩))) (.node (.single ⟨5440,5504,21312,21376⟩) (.node (.single ⟨5376,5504,21376,21504⟩) (.single ⟨5504,5568,21248,21312⟩)))) (.node (.node (.single ⟨5504,5568,21312,21376⟩) (.node (.single ⟨5568,5600,21248,21280⟩) (.single ⟨5568,5600,21280,21312⟩))) (.node (.node (.single ⟨5600,5632,21248,21280⟩) (.single ⟨5600,5632,21280,21312⟩)) (.node (.single ⟨5568,5632,21312,21376⟩) (.single ⟨5504,5632,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,27136,27264⟩) (.node (.single ⟨11264,11392,27264,27392⟩) (.single ⟨11392,11456,27136,27200⟩))) (.node (.single ⟨11392,11456,27200,27264⟩) (.node (.single ⟨11456,11488,27136,27168⟩) (.single ⟨11456,11488,27168,27200⟩)))) (.node (.node (.single ⟨11488,11520,27136,27168⟩) (.node (.single ⟨11488,11520,27168,27200⟩) (.single ⟨11456,11520,27200,27264⟩))) (.node (.node (.single ⟨11392,11456,27264,27328⟩) (.single ⟨11392,11456,27328,27392⟩)) (.node (.single ⟨11456,11520,27264,27328⟩) (.single ⟨11456,11520,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5376,5440⟩) (.node (.single ⟨21248,21312,5440,5504⟩) (.single ⟨21312,21376,5376,5440⟩))) (.node (.single ⟨21312,21376,5440,5504⟩) (.node (.single ⟨21248,21312,5504,5568⟩) (.single ⟨21248,21280,5568,5600⟩)))) (.node (.node (.single ⟨21248,21280,5600,5632⟩) (.node (.single ⟨21280,21312,5568,5600⟩) (.single ⟨21280,21312,5600,5632⟩))) (.node (.node (.single ⟨21312,21376,5504,5568⟩) (.single ⟨21312,21376,5568,5632⟩)) (.node (.single ⟨21376,21504,5376,5504⟩) (.single ⟨21376,21504,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,11264,11392⟩) (.node (.single ⟨27136,27200,11392,11456⟩) (.single ⟨27136,27168,11456,11488⟩))) (.node (.single ⟨27136,27168,11488,11520⟩) (.node (.single ⟨27168,27200,11456,11488⟩) (.single ⟨27168,27200,11488,11520⟩)))) (.node (.node (.single ⟨27200,27264,11392,11456⟩) (.node (.single ⟨27200,27264,11456,11520⟩) (.single ⟨27264,27392,11264,11392⟩))) (.node (.node (.single ⟨27264,27328,11392,11456⟩) (.single ⟨27264,27328,11456,11520⟩)) (.node (.single ⟨27328,27392,11392,11456⟩) (.single ⟨27328,27392,11456,11520⟩)))))))
def output9 : Fin 52 → GridBox := outputData9.get
def coverData9 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData9 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover9 (i : Fin 52) : Fin 52 := ⟨coverData9.get i % 52, Nat.mod_lt _ (by decide)⟩
def source9 (i : Fin 52) : Fin 52 := ⟨sourceData9.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree9 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 .empty (.cutX 5376 .empty (.cutY 21248 .empty (.cutX 5504 (.cutY 21376 (.cutX 5440 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 5568 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 5600 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))))) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 .empty (.cutX 11520 (.cutY 27392 (.cutX 11392 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 11456 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 11488 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 11456 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty) .empty)) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 (.cutX 21248 .empty (.cutY 5376 .empty (.cutX 21376 (.cutY 5504 (.cutX 21312 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 21312 (.cutY 5568 .full (.cutX 21280 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full)))) .empty))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 (.cutX 27392 (.cutY 11520 (.cutX 27264 (.cutY 11392 .full (.cutX 27200 (.cutY 11456 .full (.cutX 27168 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 27328 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty) .empty) .empty))) .empty))) .empty) .empty))) .empty))

theorem metadata9 : 0<152546139 ∧ 21<128 ∧ 83<128 ∧ 0<4 ∧
    2330/4160=0 ∧ 2330%4160=2330 ∧ ∀ i, (leaves9 i).Valid 8 := by
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

-- Frozen phase 6006, atom 2499, type 0, source (23,84).
def leavesData10 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩))) (.node (.single ⟨2,3,1⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))) (.node (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨3,6,0⟩)))) (.node (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,1⟩) (.single ⟨4,14,0⟩))) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves10 : Fin 22 → DyadicLeaf := leavesData10.get
def raw10 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 23 84 leaves10 i
def outputData10 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨5888,5952,21504,21568⟩) (.single ⟨5888,5952,21568,21632⟩)) (.node (.single ⟨5952,6016,21504,21568⟩) (.node (.single ⟨5952,6016,21568,21632⟩) (.single ⟨5888,6016,21632,21760⟩)))) (.node (.node (.single ⟨6016,6048,21504,21536⟩) (.node (.single ⟨6016,6048,21536,21568⟩) (.single ⟨6048,6080,21504,21536⟩))) (.node (.single ⟨6048,6080,21536,21568⟩) (.node (.single ⟨6016,6080,21568,21632⟩) (.single ⟨6080,6112,21504,21536⟩))))) (.node (.node (.node (.single ⟨6080,6112,21536,21568⟩) (.single ⟨6112,6128,21504,21520⟩)) (.node (.single ⟨6112,6128,21520,21536⟩) (.node (.single ⟨6128,6144,21504,21520⟩) (.single ⟨6128,6144,21520,21536⟩)))) (.node (.node (.single ⟨6112,6144,21536,21568⟩) (.node (.single ⟨6080,6144,21568,21632⟩) (.single ⟨6016,6080,21632,21696⟩))) (.node (.single ⟨6016,6080,21696,21760⟩) (.node (.single ⟨6080,6144,21632,21696⟩) (.single ⟨6080,6144,21696,21760⟩)))))) (.node (.node (.node (.node (.single ⟨11008,11072,26624,26688⟩) (.single ⟨11008,11072,26688,26752⟩)) (.node (.single ⟨11072,11136,26624,26688⟩) (.node (.single ⟨11072,11136,26688,26752⟩) (.single ⟨11008,11136,26752,26880⟩)))) (.node (.node (.single ⟨11136,11200,26624,26688⟩) (.node (.single ⟨11136,11200,26688,26752⟩) (.single ⟨11200,11232,26624,26656⟩))) (.node (.single ⟨11200,11232,26656,26688⟩) (.node (.single ⟨11232,11248,26624,26640⟩) (.single ⟨11232,11248,26640,26656⟩))))) (.node (.node (.node (.single ⟨11248,11264,26624,26640⟩) (.single ⟨11248,11264,26640,26656⟩)) (.node (.single ⟨11232,11264,26656,26688⟩) (.node (.single ⟨11200,11232,26688,26720⟩) (.single ⟨11200,11232,26720,26752⟩)))) (.node (.node (.single ⟨11232,11264,26688,26720⟩) (.node (.single ⟨11232,11264,26720,26752⟩) (.single ⟨11136,11200,26752,26816⟩))) (.node (.single ⟨11136,11200,26816,26880⟩) (.node (.single ⟨11200,11264,26752,26816⟩) (.single ⟨11200,11264,26816,26880⟩))))))) (.node (.node (.node (.node (.node (.single ⟨21504,21568,5888,5952⟩) (.single ⟨21504,21568,5952,6016⟩)) (.node (.single ⟨21568,21632,5888,5952⟩) (.node (.single ⟨21568,21632,5952,6016⟩) (.single ⟨21504,21536,6016,6048⟩)))) (.node (.node (.single ⟨21504,21536,6048,6080⟩) (.node (.single ⟨21536,21568,6016,6048⟩) (.single ⟨21536,21568,6048,6080⟩))) (.node (.single ⟨21504,21536,6080,6112⟩) (.node (.single ⟨21504,21520,6112,6128⟩) (.single ⟨21504,21520,6128,6144⟩))))) (.node (.node (.node (.single ⟨21520,21536,6112,6128⟩) (.single ⟨21520,21536,6128,6144⟩)) (.node (.single ⟨21536,21568,6080,6112⟩) (.node (.single ⟨21536,21568,6112,6144⟩) (.single ⟨21568,21632,6016,6080⟩)))) (.node (.node (.single ⟨21568,21632,6080,6144⟩) (.node (.single ⟨21632,21760,5888,6016⟩) (.single ⟨21632,21696,6016,6080⟩))) (.node (.single ⟨21632,21696,6080,6144⟩) (.node (.single ⟨21696,21760,6016,6080⟩) (.single ⟨21696,21760,6080,6144⟩)))))) (.node (.node (.node (.node (.single ⟨26624,26688,11008,11072⟩) (.single ⟨26624,26688,11072,11136⟩)) (.node (.single ⟨26688,26752,11008,11072⟩) (.node (.single ⟨26688,26752,11072,11136⟩) (.single ⟨26624,26688,11136,11200⟩)))) (.node (.node (.single ⟨26624,26656,11200,11232⟩) (.node (.single ⟨26624,26640,11232,11248⟩) (.single ⟨26624,26640,11248,11264⟩))) (.node (.single ⟨26640,26656,11232,11248⟩) (.node (.single ⟨26640,26656,11248,11264⟩) (.single ⟨26656,26688,11200,11232⟩))))) (.node (.node (.node (.single ⟨26656,26688,11232,11264⟩) (.single ⟨26688,26752,11136,11200⟩)) (.node (.single ⟨26688,26720,11200,11232⟩) (.node (.single ⟨26688,26720,11232,11264⟩) (.single ⟨26720,26752,11200,11232⟩)))) (.node (.node (.single ⟨26720,26752,11232,11264⟩) (.node (.single ⟨26752,26880,11008,11136⟩) (.single ⟨26752,26816,11136,11200⟩))) (.node (.single ⟨26752,26816,11200,11264⟩) (.node (.single ⟨26816,26880,11136,11200⟩) (.single ⟨26816,26880,11200,11264⟩))))))))
def output10 : Fin 88 → GridBox := outputData10.get
def coverData10 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 61)) (.node (.single 83) (.node (.single 26) (.single 0)))) (.node (.node (.single 44) (.node (.single 87) (.single 43))) (.node (.single 1) (.node (.single 46) (.single 86))))) (.node (.node (.node (.single 41) (.single 2)) (.node (.single 45) (.node (.single 85) (.single 42)))) (.node (.node (.single 3) (.node (.single 47) (.single 84))) (.node (.single 40) (.node (.single 9) (.single 59)))))) (.node (.node (.node (.node (.single 78) (.single 28)) (.node (.single 18) (.node (.single 62) (.single 69)))) (.node (.node (.single 25) (.node (.single 19) (.single 64))) (.node (.single 68) (.node (.single 23) (.single 17))))) (.node (.node (.node (.single 60) (.single 70)) (.node (.single 27) (.node (.single 20) (.single 63)))) (.node (.node (.single 67) (.node (.single 24) (.single 21))) (.node (.single 65) (.node (.single 66) (.single 22))))))) (.node (.node (.node (.node (.node (.single 5) (.single 48)) (.node (.single 82) (.node (.single 39) (.single 6)))) (.node (.node (.single 50) (.node (.single 81) (.single 37))) (.node (.single 7) (.node (.single 49) (.single 80))))) (.node (.node (.node (.single 38) (.single 8)) (.node (.single 51) (.node (.single 79) (.single 36)))) (.node (.node (.single 10) (.node (.single 52) (.single 77))) (.node (.single 35) (.node (.single 11) (.single 57)))))) (.node (.node (.node (.node (.single 76) (.single 30)) (.node (.single 16) (.node (.single 58) (.single 71)))) (.node (.node (.single 29) (.node (.single 12) (.single 53))) (.node (.single 75) (.node (.single 34) (.single 13))))) (.node (.node (.node (.single 55) (.single 74)) (.node (.single 32) (.node (.single 14) (.single 54)))) (.node (.node (.single 73) (.node (.single 33) (.single 15))) (.node (.single 56) (.node (.single 72) (.single 31))))))))
def sourceData10 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.node (.single 16) (.single 0)))) (.node (.node (.single 44) (.node (.single 48) (.single 52))) (.node (.single 56) (.node (.single 20) (.single 60))))) (.node (.node (.node (.single 64) (.single 72)) (.node (.single 76) (.node (.single 80) (.single 84)))) (.node (.node (.single 68) (.node (.single 32) (.single 24))) (.node (.single 28) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 31)) (.node (.single 39) (.node (.single 27) (.single 3)))) (.node (.node (.single 35) (.node (.single 23) (.single 71))) (.node (.single 67) (.node (.single 87) (.single 79))))) (.node (.node (.node (.single 83) (.single 75)) (.node (.single 63) (.node (.single 59) (.single 51)))) (.node (.node (.single 55) (.node (.single 47) (.single 19))) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.node (.single 17) (.single 45)))) (.node (.node (.single 53) (.node (.single 49) (.single 57))) (.node (.single 61) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 65) (.node (.single 69) (.single 21)))) (.node (.node (.single 33) (.node (.single 1) (.single 25))) (.node (.single 37) (.node (.single 29) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 30) (.node (.single 26) (.single 34)))) (.node (.node (.single 70) (.node (.single 86) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 66))))) (.node (.node (.node (.single 62) (.single 22)) (.node (.single 58) (.node (.single 54) (.single 50)))) (.node (.node (.single 46) (.node (.single 2) (.single 18))) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover10 (i : Fin 88) : Fin 88 := ⟨coverData10.get i % 88, Nat.mod_lt _ (by decide)⟩
def source10 (i : Fin 88) : Fin 88 := ⟨sourceData10.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree10 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 (.cutX 5888 .empty (.cutY 21760 (.cutX 6016 (.cutY 21632 (.cutX 5952 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6080 (.cutY 21568 (.cutX 6048 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full) (.cutY 21568 (.cutX 6112 (.cutY 21536 .full .full) (.cutY 21536 (.cutX 6128 (.cutY 21520 .full .full) (.cutY 21520 .full .full)) .full)) .full)) (.cutX 6080 (.cutY 21696 .full .full) (.cutY 21696 .full .full)))) .empty)) .empty)))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 (.cutX 11008 .empty (.cutY 26880 (.cutX 11136 (.cutY 26752 (.cutX 11072 (.cutY 26688 .full .full) (.cutY 26688 .full .full)) .full) (.cutY 26752 (.cutX 11200 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 11232 (.cutY 26656 .full .full) (.cutY 26656 (.cutX 11248 (.cutY 26640 .full .full) (.cutY 26640 .full .full)) .full)) (.cutX 11232 (.cutY 26720 .full .full) (.cutY 26720 .full .full)))) (.cutX 11200 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty)) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 .empty (.cutX 21760 (.cutY 5888 .empty (.cutX 21632 (.cutY 6016 (.cutX 21568 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 21568 (.cutY 6080 (.cutX 21536 (.cutY 6048 .full .full) (.cutY 6048 .full .full)) (.cutX 21536 (.cutY 6112 .full (.cutX 21520 (.cutY 6128 .full .full) (.cutY 6128 .full .full))) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full (.cutX 21696 (.cutY 6080 .full .full) (.cutY 6080 .full .full))))) .empty)) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 .empty (.cutX 26880 (.cutY 11008 .empty (.cutX 26752 (.cutY 11136 (.cutX 26688 (.cutY 11072 .full .full) (.cutY 11072 .full .full)) (.cutX 26688 (.cutY 11200 .full (.cutX 26656 (.cutY 11232 .full (.cutX 26640 (.cutY 11248 .full .full) (.cutY 11248 .full .full))) (.cutY 11232 .full .full))) (.cutY 11200 .full (.cutX 26720 (.cutY 11232 .full .full) (.cutY 11232 .full .full))))) (.cutY 11136 .full (.cutX 26816 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty)) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata10 : 0<152546139 ∧ 23<128 ∧ 84<128 ∧ 0<4 ∧
    2499/4160=0 ∧ 2499%4160=2499 ∧ ∀ i, (leaves10 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData10).mp
    (by decide +kernel)

theorem sourceChecked10_0 : ∀ i : Fin 64,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked10_64 : ∀ i : Fin 24,
    (fun i => output10 i = raw10 (source10 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked10 : ∀ i : Fin 88, (fun i => output10 i = raw10 (source10 i)) i :=
  forallFin_of_zero_offset (fun i => output10 i = raw10 (source10 i)) (forallFinOffset_add (fun i => output10 i = raw10 (source10 i)) 0 64 24 (by decide) sourceChecked10_0
    sourceChecked10_64)

theorem coverChecked10_0 : ∀ i : Fin 64,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked10_64 : ∀ i : Fin 24,
    (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked10 : ∀ i : Fin 88, (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) i :=
  forallFin_of_zero_offset (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) (forallFinOffset_add (fun i => (output10 (cover10 i)).ContainsBox (raw10 i)) 0 64 24 (by decide) coverChecked10_0
    coverChecked10_64)

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

noncomputable def phaseMass10 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw10 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass10_eq : phaseMass10 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass10
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw10 output10 cover10 source10
    (gridTreeUnionCheck_sound 32768 raw10 output10 cover10 source10 tree10 checked10)
    _ (by norm_num) _, areaUnits10]
  norm_num

-- Frozen phase 6007, atom 4228, type 1, source (0,68).
def leavesData11 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves11 : Fin 7 → DyadicLeaf := leavesData11.get
def raw11 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 68 leaves11 i
def outputData11 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,17408,17536⟩) (.node (.single ⟨0,128,17536,17664⟩) (.single ⟨128,192,17408,17472⟩))) (.node (.node (.single ⟨128,192,17472,17536⟩) (.single ⟨192,256,17408,17472⟩)) (.node (.single ⟨192,256,17472,17536⟩) (.single ⟨128,256,17536,17664⟩)))) (.node (.node (.single ⟨15104,15232,32512,32640⟩) (.node (.single ⟨15104,15232,32640,32768⟩) (.single ⟨15232,15296,32512,32576⟩))) (.node (.node (.single ⟨15232,15296,32576,32640⟩) (.single ⟨15296,15360,32512,32576⟩)) (.node (.single ⟨15296,15360,32576,32640⟩) (.single ⟨15232,15360,32640,32768⟩))))) (.node (.node (.node (.single ⟨17408,17536,0,128⟩) (.node (.single ⟨17408,17472,128,192⟩) (.single ⟨17408,17472,192,256⟩))) (.node (.node (.single ⟨17472,17536,128,192⟩) (.single ⟨17472,17536,192,256⟩)) (.node (.single ⟨17536,17664,0,128⟩) (.single ⟨17536,17664,128,256⟩)))) (.node (.node (.single ⟨32512,32640,15104,15232⟩) (.node (.single ⟨32512,32576,15232,15296⟩) (.single ⟨32512,32576,15296,15360⟩))) (.node (.node (.single ⟨32576,32640,15232,15296⟩) (.single ⟨32576,32640,15296,15360⟩)) (.node (.single ⟨32640,32768,15104,15232⟩) (.single ⟨32640,32768,15232,15360⟩))))))
def output11 : Fin 28 → GridBox := outputData11.get
def coverData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData11 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover11 (i : Fin 28) : Fin 28 := ⟨coverData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def source11 (i : Fin 28) : Fin 28 := ⟨sourceData11.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree11 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 (.cutY 17664 (.cutX 128 (.cutY 17536 .full .full) (.cutY 17536 (.cutX 192 (.cutY 17472 .full .full) (.cutY 17472 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 .empty (.cutY 32512 .empty (.cutX 15232 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 15296 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))))))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 (.cutY 256 (.cutX 17536 (.cutY 128 .full (.cutX 17472 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 .empty (.cutY 15104 .empty (.cutX 32640 (.cutY 15232 .full (.cutX 32576 (.cutY 15296 .full .full) (.cutY 15296 .full .full))) (.cutY 15232 .full .full)))))) .empty)))))))) .empty))

theorem metadata11 : 0<202148459 ∧ 0<128 ∧ 68<128 ∧ 1<4 ∧
    4228/4160=1 ∧ 4228%4160=68 ∧ ∀ i, (leaves11 i).Valid 8 := by
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

noncomputable def phaseMass11 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw11 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass11_eq : phaseMass11 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass11
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw11 output11 cover11 source11
    (gridTreeUnionCheck_sound 32768 raw11 output11 cover11 source11 tree11 checked11)
    _ (by norm_num) _, areaUnits11]
  norm_num

-- Frozen phase 6008, atom 1571, type 0, source (13,76).
def leavesData12 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves12 : Fin 7 → DyadicLeaf := leavesData12.get
def raw12 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 76 leaves12 i
def outputData12 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,19456,19584⟩) (.node (.single ⟨3328,3456,19584,19712⟩) (.single ⟨3456,3520,19456,19520⟩))) (.node (.node (.single ⟨3456,3520,19520,19584⟩) (.single ⟨3520,3584,19456,19520⟩)) (.node (.single ⟨3520,3584,19520,19584⟩) (.single ⟨3456,3584,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,29184,29312⟩) (.node (.single ⟨13056,13184,29312,29440⟩) (.single ⟨13184,13248,29184,29248⟩))) (.node (.node (.single ⟨13184,13248,29248,29312⟩) (.single ⟨13248,13312,29184,29248⟩)) (.node (.single ⟨13248,13312,29248,29312⟩) (.single ⟨13184,13312,29312,29440⟩))))) (.node (.node (.node (.single ⟨19456,19584,3328,3456⟩) (.node (.single ⟨19456,19520,3456,3520⟩) (.single ⟨19456,19520,3520,3584⟩))) (.node (.node (.single ⟨19520,19584,3456,3520⟩) (.single ⟨19520,19584,3520,3584⟩)) (.node (.single ⟨19584,19712,3328,3456⟩) (.single ⟨19584,19712,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,13056,13184⟩) (.node (.single ⟨29184,29248,13184,13248⟩) (.single ⟨29184,29248,13248,13312⟩))) (.node (.node (.single ⟨29248,29312,13184,13248⟩) (.single ⟨29248,29312,13248,13312⟩)) (.node (.single ⟨29312,29440,13056,13184⟩) (.single ⟨29312,29440,13184,13312⟩))))))
def output12 : Fin 28 → GridBox := outputData12.get
def coverData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData12 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover12 (i : Fin 28) : Fin 28 := ⟨coverData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def source12 (i : Fin 28) : Fin 28 := ⟨sourceData12.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree12 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 (.cutX 3328 .empty (.cutY 19712 (.cutX 3456 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 3520 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 .empty (.cutX 13056 .empty (.cutY 29440 (.cutX 13184 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 13248 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty)))) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 (.cutX 19712 (.cutY 3328 .empty (.cutX 19584 (.cutY 3456 .full (.cutX 19520 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 .empty (.cutX 29440 (.cutY 13056 .empty (.cutX 29312 (.cutY 13184 .full (.cutX 29248 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty))) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata12 : 0<48363413 ∧ 13<128 ∧ 76<128 ∧ 0<4 ∧
    1571/4160=0 ∧ 1571%4160=1571 ∧ ∀ i, (leaves12 i).Valid 8 := by
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

noncomputable def phaseMass12 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw12 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass12_eq : phaseMass12 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass12
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw12 output12 cover12 source12
    (gridTreeUnionCheck_sound 32768 raw12 output12 cover12 source12 tree12 checked12)
    _ (by norm_num) _, areaUnits12]
  norm_num

-- Frozen phase 6009, atom 1673, type 0, source (14,77).
def leavesData13 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves13 : Fin 7 → DyadicLeaf := leavesData13.get
def raw13 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 77 leaves13 i
def outputData13 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,19712,19840⟩) (.node (.single ⟨3584,3712,19840,19968⟩) (.single ⟨3712,3776,19712,19776⟩))) (.node (.node (.single ⟨3712,3776,19776,19840⟩) (.single ⟨3776,3840,19712,19776⟩)) (.node (.single ⟨3776,3840,19776,19840⟩) (.single ⟨3712,3840,19840,19968⟩)))) (.node (.node (.single ⟨12800,12928,28928,29056⟩) (.node (.single ⟨12800,12928,29056,29184⟩) (.single ⟨12928,12992,28928,28992⟩))) (.node (.node (.single ⟨12928,12992,28992,29056⟩) (.single ⟨12992,13056,28928,28992⟩)) (.node (.single ⟨12992,13056,28992,29056⟩) (.single ⟨12928,13056,29056,29184⟩))))) (.node (.node (.node (.single ⟨19712,19840,3584,3712⟩) (.node (.single ⟨19712,19776,3712,3776⟩) (.single ⟨19712,19776,3776,3840⟩))) (.node (.node (.single ⟨19776,19840,3712,3776⟩) (.single ⟨19776,19840,3776,3840⟩)) (.node (.single ⟨19840,19968,3584,3712⟩) (.single ⟨19840,19968,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,12800,12928⟩) (.node (.single ⟨28928,28992,12928,12992⟩) (.single ⟨28928,28992,12992,13056⟩))) (.node (.node (.single ⟨28992,29056,12928,12992⟩) (.single ⟨28992,29056,12992,13056⟩)) (.node (.single ⟨29056,29184,12800,12928⟩) (.single ⟨29056,29184,12928,13056⟩))))))
def output13 : Fin 28 → GridBox := outputData13.get
def coverData13 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData13 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover13 (i : Fin 28) : Fin 28 := ⟨coverData13.get i % 28, Nat.mod_lt _ (by decide)⟩
def source13 (i : Fin 28) : Fin 28 := ⟨sourceData13.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree13 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 (.cutY 19712 .empty (.cutX 3712 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 3776 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full))) .empty) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 (.cutY 28928 .empty (.cutX 12928 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 12992 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full))) .empty) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 .empty (.cutY 3840 (.cutX 19840 (.cutY 3712 .full (.cutX 19776 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty))) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 .empty (.cutY 13056 (.cutX 29056 (.cutY 12928 .full (.cutX 28992 (.cutY 12992 .full .full) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty))) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata13 : 0<48363413 ∧ 14<128 ∧ 77<128 ∧ 0<4 ∧
    1673/4160=0 ∧ 1673%4160=1673 ∧ ∀ i, (leaves13 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData13).mp
    (by decide +kernel)

theorem sourceChecked13_0 : ∀ i : Fin 28,
    (fun i => output13 i = raw13 (source13 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked13 : ∀ i : Fin 28, (fun i => output13 i = raw13 (source13 i)) i :=
  forallFin_of_zero_offset (fun i => output13 i = raw13 (source13 i)) sourceChecked13_0

theorem coverChecked13_0 : ∀ i : Fin 28,
    (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked13 : ∀ i : Fin 28, (fun i => (output13 (cover13 i)).ContainsBox (raw13 i)) i :=
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

noncomputable def phaseMass13 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw13 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass13_eq : phaseMass13 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass13
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw13 output13 cover13 source13
    (gridTreeUnionCheck_sound 32768 raw13 output13 cover13 source13 tree13 checked13)
    _ (by norm_num) _, areaUnits13]
  norm_num

-- Frozen phase 6010, atom 6028, type 1, source (16,76).
def leavesData14 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves14 : Fin 13 → DyadicLeaf := leavesData14.get
def raw14 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 16 76 leaves14 i
def outputData14 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4096,4160,19456,19520⟩) (.node (.single ⟨4096,4160,19520,19584⟩) (.single ⟨4160,4224,19456,19520⟩))) (.node (.single ⟨4160,4224,19520,19584⟩) (.node (.single ⟨4096,4224,19584,19712⟩) (.single ⟨4224,4288,19456,19520⟩)))) (.node (.node (.single ⟨4224,4288,19520,19584⟩) (.node (.single ⟨4288,4320,19456,19488⟩) (.single ⟨4288,4320,19488,19520⟩))) (.node (.node (.single ⟨4320,4352,19456,19488⟩) (.single ⟨4320,4352,19488,19520⟩)) (.node (.single ⟨4288,4352,19520,19584⟩) (.single ⟨4224,4352,19584,19712⟩))))) (.node (.node (.node (.single ⟨13056,13184,28416,28544⟩) (.node (.single ⟨13056,13184,28544,28672⟩) (.single ⟨13184,13248,28416,28480⟩))) (.node (.single ⟨13184,13248,28480,28544⟩) (.node (.single ⟨13248,13280,28416,28448⟩) (.single ⟨13248,13280,28448,28480⟩)))) (.node (.node (.single ⟨13280,13312,28416,28448⟩) (.node (.single ⟨13280,13312,28448,28480⟩) (.single ⟨13248,13312,28480,28544⟩))) (.node (.node (.single ⟨13184,13248,28544,28608⟩) (.single ⟨13184,13248,28608,28672⟩)) (.node (.single ⟨13248,13312,28544,28608⟩) (.single ⟨13248,13312,28608,28672⟩)))))) (.node (.node (.node (.node (.single ⟨19456,19520,4096,4160⟩) (.node (.single ⟨19456,19520,4160,4224⟩) (.single ⟨19520,19584,4096,4160⟩))) (.node (.single ⟨19520,19584,4160,4224⟩) (.node (.single ⟨19456,19520,4224,4288⟩) (.single ⟨19456,19488,4288,4320⟩)))) (.node (.node (.single ⟨19456,19488,4320,4352⟩) (.node (.single ⟨19488,19520,4288,4320⟩) (.single ⟨19488,19520,4320,4352⟩))) (.node (.node (.single ⟨19520,19584,4224,4288⟩) (.single ⟨19520,19584,4288,4352⟩)) (.node (.single ⟨19584,19712,4096,4224⟩) (.single ⟨19584,19712,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,13056,13184⟩) (.node (.single ⟨28416,28480,13184,13248⟩) (.single ⟨28416,28448,13248,13280⟩))) (.node (.single ⟨28416,28448,13280,13312⟩) (.node (.single ⟨28448,28480,13248,13280⟩) (.single ⟨28448,28480,13280,13312⟩)))) (.node (.node (.single ⟨28480,28544,13184,13248⟩) (.node (.single ⟨28480,28544,13248,13312⟩) (.single ⟨28544,28672,13056,13184⟩))) (.node (.node (.single ⟨28544,28608,13184,13248⟩) (.single ⟨28544,28608,13248,13312⟩)) (.node (.single ⟨28608,28672,13184,13248⟩) (.single ⟨28608,28672,13248,13312⟩)))))))
def output14 : Fin 52 → GridBox := outputData14.get
def coverData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData14 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover14 (i : Fin 52) : Fin 52 := ⟨coverData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def source14 (i : Fin 52) : Fin 52 := ⟨sourceData14.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree14 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 (.cutX 4352 (.cutY 19712 (.cutX 4224 (.cutY 19584 (.cutX 4160 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full) (.cutY 19584 (.cutX 4288 (.cutY 19520 .full .full) (.cutY 19520 (.cutX 4320 (.cutY 19488 .full .full) (.cutY 19488 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 .empty (.cutY 28160 .empty (.cutX 13056 .empty (.cutY 28416 .empty (.cutX 13184 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 13248 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 13280 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) (.cutX 13248 (.cutY 28608 .full .full) (.cutY 28608 .full .full))))))))) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 (.cutY 4608 (.cutX 19712 (.cutY 4352 (.cutX 19584 (.cutY 4224 (.cutX 19520 (.cutY 4160 .full .full) (.cutY 4160 .full .full)) (.cutX 19520 (.cutY 4288 .full (.cutX 19488 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 .empty (.cutX 28416 .empty (.cutY 13056 .empty (.cutX 28544 (.cutY 13184 .full (.cutX 28480 (.cutY 13248 .full (.cutX 28448 (.cutY 13280 .full .full) (.cutY 13280 .full .full))) (.cutY 13248 .full .full))) (.cutY 13184 .full (.cutX 28608 (.cutY 13248 .full .full) (.cutY 13248 .full .full)))))))) .empty)) .empty))) .empty))) .empty))

theorem metadata14 : 0<157738472 ∧ 16<128 ∧ 76<128 ∧ 1<4 ∧
    6028/4160=1 ∧ 6028%4160=1868 ∧ ∀ i, (leaves14 i).Valid 8 := by
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

noncomputable def phaseMass14 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw14 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass14_eq : phaseMass14 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass14
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw14 output14 cover14 source14
    (gridTreeUnionCheck_sound 32768 raw14 output14 cover14 source14 tree14 checked14)
    _ (by norm_num) _, areaUnits14]
  norm_num

-- Frozen phase 6011, atom 919, type 0, source (7,72).
def leavesData15 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves15 : Fin 10 → DyadicLeaf := leavesData15.get
def raw15 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 7 72 leaves15 i
def outputData15 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,18432,18496⟩) (.single ⟨1792,1856,18496,18560⟩)) (.node (.single ⟨1856,1920,18432,18496⟩) (.node (.single ⟨1856,1920,18496,18560⟩) (.single ⟨1792,1920,18560,18688⟩)))) (.node (.node (.single ⟨1920,1984,18432,18496⟩) (.single ⟨1920,1984,18496,18560⟩)) (.node (.single ⟨1984,2048,18432,18496⟩) (.node (.single ⟨1984,2048,18496,18560⟩) (.single ⟨1920,2048,18560,18688⟩))))) (.node (.node (.node (.single ⟨14080,14208,30720,30848⟩) (.single ⟨14080,14208,30848,30976⟩)) (.node (.single ⟨14208,14272,30720,30784⟩) (.node (.single ⟨14208,14272,30784,30848⟩) (.single ⟨14272,14336,30720,30784⟩)))) (.node (.node (.single ⟨14272,14336,30784,30848⟩) (.single ⟨14208,14272,30848,30912⟩)) (.node (.single ⟨14208,14272,30912,30976⟩) (.node (.single ⟨14272,14336,30848,30912⟩) (.single ⟨14272,14336,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨18432,18496,1792,1856⟩) (.single ⟨18432,18496,1856,1920⟩)) (.node (.single ⟨18496,18560,1792,1856⟩) (.node (.single ⟨18496,18560,1856,1920⟩) (.single ⟨18432,18496,1920,1984⟩)))) (.node (.node (.single ⟨18432,18496,1984,2048⟩) (.single ⟨18496,18560,1920,1984⟩)) (.node (.single ⟨18496,18560,1984,2048⟩) (.node (.single ⟨18560,18688,1792,1920⟩) (.single ⟨18560,18688,1920,2048⟩))))) (.node (.node (.node (.single ⟨30720,30848,14080,14208⟩) (.single ⟨30720,30784,14208,14272⟩)) (.node (.single ⟨30720,30784,14272,14336⟩) (.node (.single ⟨30784,30848,14208,14272⟩) (.single ⟨30784,30848,14272,14336⟩)))) (.node (.node (.single ⟨30848,30976,14080,14208⟩) (.single ⟨30848,30912,14208,14272⟩)) (.node (.single ⟨30848,30912,14272,14336⟩) (.node (.single ⟨30912,30976,14208,14272⟩) (.single ⟨30912,30976,14272,14336⟩)))))))
def output15 : Fin 40 → GridBox := outputData15.get
def coverData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData15 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover15 (i : Fin 40) : Fin 40 := ⟨coverData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def source15 (i : Fin 40) : Fin 40 := ⟨sourceData15.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree15 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 .empty (.cutY 18688 (.cutX 1920 (.cutY 18560 (.cutX 1856 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full) (.cutY 18560 (.cutX 1984 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 .empty (.cutY 30976 (.cutX 14208 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14272 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 14272 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty)) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 (.cutY 1792 .empty (.cutX 18560 (.cutY 1920 (.cutX 18496 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 18496 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 (.cutY 14080 .empty (.cutX 30848 (.cutY 14208 .full (.cutX 30784 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full (.cutX 30912 (.cutY 14272 .full .full) (.cutY 14272 .full .full))))) .empty)) .empty)) .empty) .empty)))))) .empty))

theorem metadata15 : 0<34183877 ∧ 7<128 ∧ 72<128 ∧ 0<4 ∧
    919/4160=0 ∧ 919%4160=919 ∧ ∀ i, (leaves15 i).Valid 8 := by
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

noncomputable def phaseMass15 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw15 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass15_eq : phaseMass15 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass15
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw15 output15 cover15 source15
    (gridTreeUnionCheck_sound 32768 raw15 output15 cover15 source15 tree15 checked15)
    _ (by norm_num) _, areaUnits15]
  norm_num

-- Frozen phase 6012, atom 1144, type 0, source (9,73).
def leavesData16 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves16 : Fin 7 → DyadicLeaf := leavesData16.get
def raw16 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 73 leaves16 i
def outputData16 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,18688,18816⟩) (.node (.single ⟨2304,2432,18816,18944⟩) (.single ⟨2432,2496,18688,18752⟩))) (.node (.node (.single ⟨2432,2496,18752,18816⟩) (.single ⟨2496,2560,18688,18752⟩)) (.node (.single ⟨2496,2560,18752,18816⟩) (.single ⟨2432,2560,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,30208,30336⟩) (.node (.single ⟨13824,13952,30336,30464⟩) (.single ⟨13952,14016,30208,30272⟩))) (.node (.node (.single ⟨13952,14016,30272,30336⟩) (.single ⟨14016,14080,30208,30272⟩)) (.node (.single ⟨14016,14080,30272,30336⟩) (.single ⟨13952,14080,30336,30464⟩))))) (.node (.node (.node (.single ⟨18688,18816,2304,2432⟩) (.node (.single ⟨18688,18752,2432,2496⟩) (.single ⟨18688,18752,2496,2560⟩))) (.node (.node (.single ⟨18752,18816,2432,2496⟩) (.single ⟨18752,18816,2496,2560⟩)) (.node (.single ⟨18816,18944,2304,2432⟩) (.single ⟨18816,18944,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,13824,13952⟩) (.node (.single ⟨30208,30272,13952,14016⟩) (.single ⟨30208,30272,14016,14080⟩))) (.node (.node (.single ⟨30272,30336,13952,14016⟩) (.single ⟨30272,30336,14016,14080⟩)) (.node (.single ⟨30336,30464,13824,13952⟩) (.single ⟨30336,30464,13952,14080⟩))))))
def output16 : Fin 28 → GridBox := outputData16.get
def coverData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData16 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover16 (i : Fin 28) : Fin 28 := ⟨coverData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def source16 (i : Fin 28) : Fin 28 := ⟨sourceData16.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree16 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 .empty (.cutY 18688 .empty (.cutX 2432 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 2496 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 (.cutY 30464 (.cutX 13952 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 14016 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty) .empty))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 .empty (.cutY 2304 .empty (.cutX 18816 (.cutY 2432 .full (.cutX 18752 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full)))) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 (.cutY 14080 (.cutX 30336 (.cutY 13952 .full (.cutX 30272 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty))))) .empty) .empty))))) .empty))

theorem metadata16 : 0<48363413 ∧ 9<128 ∧ 73<128 ∧ 0<4 ∧
    1144/4160=0 ∧ 1144%4160=1144 ∧ ∀ i, (leaves16 i).Valid 8 := by
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

noncomputable def phaseMass16 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw16 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass16_eq : phaseMass16 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass16
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw16 output16 cover16 source16
    (gridTreeUnionCheck_sound 32768 raw16 output16 cover16 source16 tree16 checked16)
    _ (by norm_num) _, areaUnits16]
  norm_num

-- Frozen phase 6013, atom 6124, type 1, source (17,77).
def leavesData17 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves17 : Fin 13 → DyadicLeaf := leavesData17.get
def raw17 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 77 leaves17 i
def outputData17 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,19712,19776⟩) (.node (.single ⟨4352,4416,19776,19840⟩) (.single ⟨4416,4480,19712,19776⟩))) (.node (.single ⟨4416,4480,19776,19840⟩) (.node (.single ⟨4352,4480,19840,19968⟩) (.single ⟨4480,4544,19712,19776⟩)))) (.node (.node (.single ⟨4480,4544,19776,19840⟩) (.node (.single ⟨4544,4576,19712,19744⟩) (.single ⟨4544,4576,19744,19776⟩))) (.node (.node (.single ⟨4576,4608,19712,19744⟩) (.single ⟨4576,4608,19744,19776⟩)) (.node (.single ⟨4544,4608,19776,19840⟩) (.single ⟨4480,4608,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,28160,28288⟩) (.node (.single ⟨12800,12928,28288,28416⟩) (.single ⟨12928,12992,28160,28224⟩))) (.node (.single ⟨12928,12992,28224,28288⟩) (.node (.single ⟨12992,13024,28160,28192⟩) (.single ⟨12992,13024,28192,28224⟩)))) (.node (.node (.single ⟨13024,13056,28160,28192⟩) (.node (.single ⟨13024,13056,28192,28224⟩) (.single ⟨12992,13056,28224,28288⟩))) (.node (.node (.single ⟨12928,12992,28288,28352⟩) (.single ⟨12928,12992,28352,28416⟩)) (.node (.single ⟨12992,13056,28288,28352⟩) (.single ⟨12992,13056,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19776,4352,4416⟩) (.node (.single ⟨19712,19776,4416,4480⟩) (.single ⟨19776,19840,4352,4416⟩))) (.node (.single ⟨19776,19840,4416,4480⟩) (.node (.single ⟨19712,19776,4480,4544⟩) (.single ⟨19712,19744,4544,4576⟩)))) (.node (.node (.single ⟨19712,19744,4576,4608⟩) (.node (.single ⟨19744,19776,4544,4576⟩) (.single ⟨19744,19776,4576,4608⟩))) (.node (.node (.single ⟨19776,19840,4480,4544⟩) (.single ⟨19776,19840,4544,4608⟩)) (.node (.single ⟨19840,19968,4352,4480⟩) (.single ⟨19840,19968,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,12800,12928⟩) (.node (.single ⟨28160,28224,12928,12992⟩) (.single ⟨28160,28192,12992,13024⟩))) (.node (.single ⟨28160,28192,13024,13056⟩) (.node (.single ⟨28192,28224,12992,13024⟩) (.single ⟨28192,28224,13024,13056⟩)))) (.node (.node (.single ⟨28224,28288,12928,12992⟩) (.node (.single ⟨28224,28288,12992,13056⟩) (.single ⟨28288,28416,12800,12928⟩))) (.node (.node (.single ⟨28288,28352,12928,12992⟩) (.single ⟨28288,28352,12992,13056⟩)) (.node (.single ⟨28352,28416,12928,12992⟩) (.single ⟨28352,28416,12992,13056⟩)))))))
def output17 : Fin 52 → GridBox := outputData17.get
def coverData17 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData17 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover17 (i : Fin 52) : Fin 52 := ⟨coverData17.get i % 52, Nat.mod_lt _ (by decide)⟩
def source17 (i : Fin 52) : Fin 52 := ⟨sourceData17.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree17 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 (.cutX 4352 .empty (.cutY 19712 .empty (.cutX 4480 (.cutY 19840 (.cutX 4416 (.cutY 19776 .full .full) (.cutY 19776 .full .full)) .full) (.cutY 19840 (.cutX 4544 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 4576 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full)))) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 .empty (.cutY 28160 .empty (.cutX 13056 (.cutY 28416 (.cutX 12928 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 12992 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 13024 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 12992 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty)))) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 (.cutY 4608 (.cutX 19712 .empty (.cutY 4352 .empty (.cutX 19840 (.cutY 4480 (.cutX 19776 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 19776 (.cutY 4544 .full (.cutX 19744 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty) .empty) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 .empty (.cutX 28416 (.cutY 13056 (.cutX 28288 (.cutY 12928 .full (.cutX 28224 (.cutY 12992 .full (.cutX 28192 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full (.cutX 28352 (.cutY 12992 .full .full) (.cutY 12992 .full .full)))) .empty) .empty))) .empty)) .empty))) .empty))) .empty))

theorem metadata17 : 0<157738472 ∧ 17<128 ∧ 77<128 ∧ 1<4 ∧
    6124/4160=1 ∧ 6124%4160=1964 ∧ ∀ i, (leaves17 i).Valid 8 := by
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

noncomputable def phaseMass17 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw17 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass17_eq : phaseMass17 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass17
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw17 output17 cover17 source17
    (gridTreeUnionCheck_sound 32768 raw17 output17 cover17 source17 tree17 checked17)
    _ (by norm_num) _, areaUnits17]
  norm_num

-- Frozen phase 6014, atom 2061, type 0, source (18,81).
def leavesData18 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨2,2,2⟩) (.single ⟨2,2,3⟩)) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves18 : Fin 16 → DyadicLeaf := leavesData18.get
def raw18 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 18 81 leaves18 i
def outputData18 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,20736,20800⟩) (.single ⟨4608,4672,20800,20864⟩)) (.node (.single ⟨4672,4736,20736,20800⟩) (.single ⟨4672,4736,20800,20864⟩))) (.node (.node (.single ⟨4608,4736,20864,20992⟩) (.single ⟨4736,4800,20736,20800⟩)) (.node (.single ⟨4736,4800,20800,20864⟩) (.single ⟨4800,4832,20736,20768⟩)))) (.node (.node (.node (.single ⟨4800,4832,20768,20800⟩) (.single ⟨4832,4864,20736,20768⟩)) (.node (.single ⟨4832,4864,20768,20800⟩) (.single ⟨4800,4864,20800,20864⟩))) (.node (.node (.single ⟨4736,4800,20864,20928⟩) (.single ⟨4736,4800,20928,20992⟩)) (.node (.single ⟨4800,4864,20864,20928⟩) (.single ⟨4800,4864,20928,20992⟩))))) (.node (.node (.node (.node (.single ⟨11776,11840,27904,27968⟩) (.single ⟨11776,11840,27968,28032⟩)) (.node (.single ⟨11840,11904,27904,27968⟩) (.single ⟨11840,11904,27968,28032⟩))) (.node (.node (.single ⟨11776,11904,28032,28160⟩) (.single ⟨11904,11968,27904,27968⟩)) (.node (.single ⟨11904,11968,27968,28032⟩) (.single ⟨11968,12000,27904,27936⟩)))) (.node (.node (.node (.single ⟨11968,12000,27936,27968⟩) (.single ⟨12000,12032,27904,27936⟩)) (.node (.single ⟨12000,12032,27936,27968⟩) (.single ⟨11968,12032,27968,28032⟩))) (.node (.node (.single ⟨11904,11968,28032,28096⟩) (.single ⟨11904,11968,28096,28160⟩)) (.node (.single ⟨11968,12032,28032,28096⟩) (.single ⟨11968,12032,28096,28160⟩)))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,4608,4672⟩) (.single ⟨20736,20800,4672,4736⟩)) (.node (.single ⟨20800,20864,4608,4672⟩) (.single ⟨20800,20864,4672,4736⟩))) (.node (.node (.single ⟨20736,20800,4736,4800⟩) (.single ⟨20736,20768,4800,4832⟩)) (.node (.single ⟨20736,20768,4832,4864⟩) (.single ⟨20768,20800,4800,4832⟩)))) (.node (.node (.node (.single ⟨20768,20800,4832,4864⟩) (.single ⟨20800,20864,4736,4800⟩)) (.node (.single ⟨20800,20864,4800,4864⟩) (.single ⟨20864,20992,4608,4736⟩))) (.node (.node (.single ⟨20864,20928,4736,4800⟩) (.single ⟨20864,20928,4800,4864⟩)) (.node (.single ⟨20928,20992,4736,4800⟩) (.single ⟨20928,20992,4800,4864⟩))))) (.node (.node (.node (.node (.single ⟨27904,27968,11776,11840⟩) (.single ⟨27904,27968,11840,11904⟩)) (.node (.single ⟨27968,28032,11776,11840⟩) (.single ⟨27968,28032,11840,11904⟩))) (.node (.node (.single ⟨27904,27968,11904,11968⟩) (.single ⟨27904,27936,11968,12000⟩)) (.node (.single ⟨27904,27936,12000,12032⟩) (.single ⟨27936,27968,11968,12000⟩)))) (.node (.node (.node (.single ⟨27936,27968,12000,12032⟩) (.single ⟨27968,28032,11904,11968⟩)) (.node (.single ⟨27968,28032,11968,12032⟩) (.single ⟨28032,28160,11776,11904⟩))) (.node (.node (.single ⟨28032,28096,11904,11968⟩) (.single ⟨28032,28096,11968,12032⟩)) (.node (.single ⟨28096,28160,11904,11968⟩) (.single ⟨28096,28160,11968,12032⟩)))))))
def output18 : Fin 64 → GridBox := outputData18.get
def coverData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 43)) (.node (.single 59) (.single 20))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))))) (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27)))) (.node (.node (.node (.single 6) (.single 41)) (.node (.single 57) (.single 22))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))))) (.node (.node (.node (.node (.node (.single 12) (.single 44)) (.node (.single 51) (.single 19))) (.node (.node (.single 13) (.single 46)) (.node (.single 50) (.single 17)))) (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16))))) (.node (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))) (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))))))
def sourceData18 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.single 16))) (.node (.node (.single 0) (.single 20)) (.node (.single 24) (.single 48)))) (.node (.node (.node (.single 52) (.single 56)) (.node (.single 60) (.single 28))) (.node (.node (.single 32) (.single 36)) (.node (.single 40) (.single 44))))) (.node (.node (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35))) (.node (.node (.single 3) (.single 31)) (.node (.single 27) (.single 63)))) (.node (.node (.node (.single 55) (.single 59)) (.node (.single 51) (.single 23))) (.node (.node (.single 19) (.single 11)) (.node (.single 15) (.single 7)))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.single 17))) (.node (.node (.single 21) (.single 49)) (.node (.single 57) (.single 53)))) (.node (.node (.node (.single 61) (.single 25)) (.node (.single 29) (.single 1))) (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))))) (.node (.node (.node (.node (.single 46) (.single 42)) (.node (.single 38) (.single 34))) (.node (.node (.single 30) (.single 62)) (.node (.single 58) (.single 54)))) (.node (.node (.node (.single 50) (.single 26)) (.node (.single 22) (.single 2))) (.node (.node (.single 18) (.single 14)) (.node (.single 10) (.single 6)))))))
def cover18 (i : Fin 64) : Fin 64 := ⟨coverData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def source18 (i : Fin 64) : Fin 64 := ⟨sourceData18.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree18 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 (.cutX 4864 (.cutY 20736 .empty (.cutX 4736 (.cutY 20864 (.cutX 4672 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 4800 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 4832 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) (.cutX 4800 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty)) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 (.cutX 12032 (.cutY 27904 .empty (.cutX 11904 (.cutY 28032 (.cutX 11840 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) .full) (.cutY 28032 (.cutX 11968 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 12000 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 11968 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty)))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 .empty (.cutX 20736 .empty (.cutY 4864 (.cutX 20864 (.cutY 4736 (.cutX 20800 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 20800 (.cutY 4800 .full (.cutX 20768 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full (.cutX 20928 (.cutY 4800 .full .full) (.cutY 4800 .full .full)))) .empty))) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 .empty (.cutX 27904 .empty (.cutY 12032 (.cutX 28032 (.cutY 11904 (.cutX 27968 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 27968 (.cutY 11968 .full (.cutX 27936 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 28096 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))) .empty))))) .empty) .empty))) .empty))

theorem metadata18 : 0<152546139 ∧ 18<128 ∧ 81<128 ∧ 0<4 ∧
    2061/4160=0 ∧ 2061%4160=2061 ∧ ∀ i, (leaves18 i).Valid 8 := by
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

noncomputable def phaseMass18 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw18 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass18_eq : phaseMass18 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass18
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw18 output18 cover18 source18
    (gridTreeUnionCheck_sound 32768 raw18 output18 cover18 source18 tree18 checked18)
    _ (by norm_num) _, areaUnits18]
  norm_num

-- Frozen phase 6015, atom 6487, type 1, source (21,80).
def leavesData19 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves19 : Fin 13 → DyadicLeaf := leavesData19.get
def raw19 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 80 leaves19 i
def outputData19 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,20480,20544⟩) (.node (.single ⟨5376,5440,20544,20608⟩) (.single ⟨5440,5504,20480,20544⟩))) (.node (.single ⟨5440,5504,20544,20608⟩) (.node (.single ⟨5376,5504,20608,20736⟩) (.single ⟨5504,5568,20480,20544⟩)))) (.node (.node (.single ⟨5504,5568,20544,20608⟩) (.node (.single ⟨5568,5600,20480,20512⟩) (.single ⟨5568,5600,20512,20544⟩))) (.node (.node (.single ⟨5600,5632,20480,20512⟩) (.single ⟨5600,5632,20512,20544⟩)) (.node (.single ⟨5568,5632,20544,20608⟩) (.single ⟨5504,5632,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,27136,27264⟩) (.node (.single ⟨12032,12160,27264,27392⟩) (.single ⟨12160,12224,27136,27200⟩))) (.node (.single ⟨12160,12224,27200,27264⟩) (.node (.single ⟨12224,12256,27136,27168⟩) (.single ⟨12224,12256,27168,27200⟩)))) (.node (.node (.single ⟨12256,12288,27136,27168⟩) (.node (.single ⟨12256,12288,27168,27200⟩) (.single ⟨12224,12288,27200,27264⟩))) (.node (.node (.single ⟨12160,12224,27264,27328⟩) (.single ⟨12160,12224,27328,27392⟩)) (.node (.single ⟨12224,12288,27264,27328⟩) (.single ⟨12224,12288,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,5376,5440⟩) (.node (.single ⟨20480,20544,5440,5504⟩) (.single ⟨20544,20608,5376,5440⟩))) (.node (.single ⟨20544,20608,5440,5504⟩) (.node (.single ⟨20480,20544,5504,5568⟩) (.single ⟨20480,20512,5568,5600⟩)))) (.node (.node (.single ⟨20480,20512,5600,5632⟩) (.node (.single ⟨20512,20544,5568,5600⟩) (.single ⟨20512,20544,5600,5632⟩))) (.node (.node (.single ⟨20544,20608,5504,5568⟩) (.single ⟨20544,20608,5568,5632⟩)) (.node (.single ⟨20608,20736,5376,5504⟩) (.single ⟨20608,20736,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,12032,12160⟩) (.node (.single ⟨27136,27200,12160,12224⟩) (.single ⟨27136,27168,12224,12256⟩))) (.node (.single ⟨27136,27168,12256,12288⟩) (.node (.single ⟨27168,27200,12224,12256⟩) (.single ⟨27168,27200,12256,12288⟩)))) (.node (.node (.single ⟨27200,27264,12160,12224⟩) (.node (.single ⟨27200,27264,12224,12288⟩) (.single ⟨27264,27392,12032,12160⟩))) (.node (.node (.single ⟨27264,27328,12160,12224⟩) (.single ⟨27264,27328,12224,12288⟩)) (.node (.single ⟨27328,27392,12160,12224⟩) (.single ⟨27328,27392,12224,12288⟩)))))))
def output19 : Fin 52 → GridBox := outputData19.get
def coverData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData19 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover19 (i : Fin 52) : Fin 52 := ⟨coverData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def source19 (i : Fin 52) : Fin 52 := ⟨sourceData19.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree19 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 (.cutX 5376 .empty (.cutY 20736 (.cutX 5504 (.cutY 20608 (.cutX 5440 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 5568 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 5600 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty)) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 .empty (.cutX 12032 .empty (.cutY 27392 (.cutX 12160 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 12224 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 12256 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 12224 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty)))) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 (.cutX 20736 (.cutY 5376 .empty (.cutX 20608 (.cutY 5504 (.cutX 20544 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 20544 (.cutY 5568 .full (.cutX 20512 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 .empty (.cutX 27392 (.cutY 12032 .empty (.cutX 27264 (.cutY 12160 .full (.cutX 27200 (.cutY 12224 .full (.cutX 27168 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 27328 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))) .empty)))) .empty))) .empty) .empty))) .empty))

theorem metadata19 : 0<125829407 ∧ 21<128 ∧ 80<128 ∧ 1<4 ∧
    6487/4160=1 ∧ 6487%4160=2327 ∧ ∀ i, (leaves19 i).Valid 8 := by
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

noncomputable def phaseMass19 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw19 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass19_eq : phaseMass19 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass19
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw19 output19 cover19 source19
    (gridTreeUnionCheck_sound 32768 raw19 output19 cover19 source19 tree19 checked19)
    _ (by norm_num) _, areaUnits19]
  norm_num

-- Frozen phase 6016, atom 2738, type 0, source (26,86).
def leavesData20 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves20 : Fin 13 → DyadicLeaf := leavesData20.get
def raw20 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 86 leaves20 i
def outputData20 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,22016,22080⟩) (.node (.single ⟨6656,6720,22080,22144⟩) (.single ⟨6720,6784,22016,22080⟩))) (.node (.single ⟨6720,6784,22080,22144⟩) (.node (.single ⟨6656,6784,22144,22272⟩) (.single ⟨6784,6848,22016,22080⟩)))) (.node (.node (.single ⟨6784,6848,22080,22144⟩) (.node (.single ⟨6848,6880,22016,22048⟩) (.single ⟨6848,6880,22048,22080⟩))) (.node (.node (.single ⟨6880,6912,22016,22048⟩) (.single ⟨6880,6912,22048,22080⟩)) (.node (.single ⟨6848,6912,22080,22144⟩) (.single ⟨6784,6912,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,25856,25984⟩) (.node (.single ⟨10496,10624,25984,26112⟩) (.single ⟨10624,10688,25856,25920⟩))) (.node (.single ⟨10624,10688,25920,25984⟩) (.node (.single ⟨10688,10720,25856,25888⟩) (.single ⟨10688,10720,25888,25920⟩)))) (.node (.node (.single ⟨10720,10752,25856,25888⟩) (.node (.single ⟨10720,10752,25888,25920⟩) (.single ⟨10688,10752,25920,25984⟩))) (.node (.node (.single ⟨10624,10688,25984,26048⟩) (.single ⟨10624,10688,26048,26112⟩)) (.node (.single ⟨10688,10752,25984,26048⟩) (.single ⟨10688,10752,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,6656,6720⟩) (.node (.single ⟨22016,22080,6720,6784⟩) (.single ⟨22080,22144,6656,6720⟩))) (.node (.single ⟨22080,22144,6720,6784⟩) (.node (.single ⟨22016,22080,6784,6848⟩) (.single ⟨22016,22048,6848,6880⟩)))) (.node (.node (.single ⟨22016,22048,6880,6912⟩) (.node (.single ⟨22048,22080,6848,6880⟩) (.single ⟨22048,22080,6880,6912⟩))) (.node (.node (.single ⟨22080,22144,6784,6848⟩) (.single ⟨22080,22144,6848,6912⟩)) (.node (.single ⟨22144,22272,6656,6784⟩) (.single ⟨22144,22272,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,10496,10624⟩) (.node (.single ⟨25856,25920,10624,10688⟩) (.single ⟨25856,25888,10688,10720⟩))) (.node (.single ⟨25856,25888,10720,10752⟩) (.node (.single ⟨25888,25920,10688,10720⟩) (.single ⟨25888,25920,10720,10752⟩)))) (.node (.node (.single ⟨25920,25984,10624,10688⟩) (.node (.single ⟨25920,25984,10688,10752⟩) (.single ⟨25984,26112,10496,10624⟩))) (.node (.node (.single ⟨25984,26048,10624,10688⟩) (.single ⟨25984,26048,10688,10752⟩)) (.node (.single ⟨26048,26112,10624,10688⟩) (.single ⟨26048,26112,10688,10752⟩)))))))
def output20 : Fin 52 → GridBox := outputData20.get
def coverData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData20 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover20 (i : Fin 52) : Fin 52 := ⟨coverData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def source20 (i : Fin 52) : Fin 52 := ⟨sourceData20.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree20 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 (.cutY 22272 (.cutX 6784 (.cutY 22144 (.cutX 6720 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 6848 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 6880 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 .empty (.cutY 25856 .empty (.cutX 10624 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10688 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 10720 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 10688 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 (.cutY 6912 (.cutX 22144 (.cutY 6784 (.cutX 22080 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 22080 (.cutY 6848 .full (.cutX 22048 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 .empty (.cutY 10496 .empty (.cutX 25984 (.cutY 10624 .full (.cutX 25920 (.cutY 10688 .full (.cutX 25888 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 26048 (.cutY 10688 .full .full) (.cutY 10688 .full .full)))))) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata20 : 0<104681033 ∧ 26<128 ∧ 86<128 ∧ 0<4 ∧
    2738/4160=0 ∧ 2738%4160=2738 ∧ ∀ i, (leaves20 i).Valid 8 := by
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

noncomputable def phaseMass20 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw20 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass20_eq : phaseMass20 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass20
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw20 output20 cover20 source20
    (gridTreeUnionCheck_sound 32768 raw20 output20 cover20 source20 tree20 checked20)
    _ (by norm_num) _, areaUnits20]
  norm_num

-- Frozen phase 6017, atom 6971, type 1, source (27,84).
def leavesData21 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves21 : Fin 13 → DyadicLeaf := leavesData21.get
def raw21 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 27 84 leaves21 i
def outputData21 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6912,6976,21504,21568⟩) (.node (.single ⟨6912,6976,21568,21632⟩) (.single ⟨6976,7040,21504,21568⟩))) (.node (.single ⟨6976,7040,21568,21632⟩) (.node (.single ⟨6912,7040,21632,21760⟩) (.single ⟨7040,7104,21504,21568⟩)))) (.node (.node (.single ⟨7040,7104,21568,21632⟩) (.node (.single ⟨7104,7136,21504,21536⟩) (.single ⟨7104,7136,21536,21568⟩))) (.node (.node (.single ⟨7136,7168,21504,21536⟩) (.single ⟨7136,7168,21536,21568⟩)) (.node (.single ⟨7104,7168,21568,21632⟩) (.single ⟨7040,7168,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,25600,25728⟩) (.node (.single ⟨11008,11136,25728,25856⟩) (.single ⟨11136,11200,25600,25664⟩))) (.node (.single ⟨11136,11200,25664,25728⟩) (.node (.single ⟨11200,11232,25600,25632⟩) (.single ⟨11200,11232,25632,25664⟩)))) (.node (.node (.single ⟨11232,11264,25600,25632⟩) (.node (.single ⟨11232,11264,25632,25664⟩) (.single ⟨11200,11264,25664,25728⟩))) (.node (.node (.single ⟨11136,11200,25728,25792⟩) (.single ⟨11136,11200,25792,25856⟩)) (.node (.single ⟨11200,11264,25728,25792⟩) (.single ⟨11200,11264,25792,25856⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6912,6976⟩) (.node (.single ⟨21504,21568,6976,7040⟩) (.single ⟨21568,21632,6912,6976⟩))) (.node (.single ⟨21568,21632,6976,7040⟩) (.node (.single ⟨21504,21568,7040,7104⟩) (.single ⟨21504,21536,7104,7136⟩)))) (.node (.node (.single ⟨21504,21536,7136,7168⟩) (.node (.single ⟨21536,21568,7104,7136⟩) (.single ⟨21536,21568,7136,7168⟩))) (.node (.node (.single ⟨21568,21632,7040,7104⟩) (.single ⟨21568,21632,7104,7168⟩)) (.node (.single ⟨21632,21760,6912,7040⟩) (.single ⟨21632,21760,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,11008,11136⟩) (.node (.single ⟨25600,25664,11136,11200⟩) (.single ⟨25600,25632,11200,11232⟩))) (.node (.single ⟨25600,25632,11232,11264⟩) (.node (.single ⟨25632,25664,11200,11232⟩) (.single ⟨25632,25664,11232,11264⟩)))) (.node (.node (.single ⟨25664,25728,11136,11200⟩) (.node (.single ⟨25664,25728,11200,11264⟩) (.single ⟨25728,25856,11008,11136⟩))) (.node (.node (.single ⟨25728,25792,11136,11200⟩) (.single ⟨25728,25792,11200,11264⟩)) (.node (.single ⟨25792,25856,11136,11200⟩) (.single ⟨25792,25856,11200,11264⟩)))))))
def output21 : Fin 52 → GridBox := outputData21.get
def coverData21 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData21 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover21 (i : Fin 52) : Fin 52 := ⟨coverData21.get i % 52, Nat.mod_lt _ (by decide)⟩
def source21 (i : Fin 52) : Fin 52 := ⟨sourceData21.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree21 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 (.cutX 6912 .empty (.cutY 21760 (.cutX 7040 (.cutY 21632 (.cutX 6976 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 7104 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 7136 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty)) .empty))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 (.cutX 11008 .empty (.cutY 25856 (.cutX 11136 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 11200 (.cutY 25664 .full .full) (.cutY 25664 (.cutX 11232 (.cutY 25632 .full .full) (.cutY 25632 .full .full)) .full)) (.cutX 11200 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 .empty (.cutX 21760 (.cutY 6912 .empty (.cutX 21632 (.cutY 7040 (.cutX 21568 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 21568 (.cutY 7104 .full (.cutX 21536 (.cutY 7136 .full .full) (.cutY 7136 .full .full))) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty)) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 .empty (.cutX 25856 (.cutY 11008 .empty (.cutX 25728 (.cutY 11136 .full (.cutX 25664 (.cutY 11200 .full (.cutX 25632 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 25792 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty)) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata21 : 0<144359671 ∧ 27<128 ∧ 84<128 ∧ 1<4 ∧
    6971/4160=1 ∧ 6971%4160=2811 ∧ ∀ i, (leaves21 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData21).mp
    (by decide +kernel)

theorem sourceChecked21_0 : ∀ i : Fin 52,
    (fun i => output21 i = raw21 (source21 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked21 : ∀ i : Fin 52, (fun i => output21 i = raw21 (source21 i)) i :=
  forallFin_of_zero_offset (fun i => output21 i = raw21 (source21 i)) sourceChecked21_0

theorem coverChecked21_0 : ∀ i : Fin 52,
    (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked21 : ∀ i : Fin 52, (fun i => (output21 (cover21 i)).ContainsBox (raw21 i)) i :=
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

-- Frozen phase 6018, atom 2814, type 0, source (27,87).
def leavesData22 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves22 : Fin 7 → DyadicLeaf := leavesData22.get
def raw22 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 87 leaves22 i
def outputData22 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,22272,22400⟩) (.node (.single ⟨6912,7040,22400,22528⟩) (.single ⟨7040,7104,22272,22336⟩))) (.node (.node (.single ⟨7040,7104,22336,22400⟩) (.single ⟨7104,7168,22272,22336⟩)) (.node (.single ⟨7104,7168,22336,22400⟩) (.single ⟨7040,7168,22400,22528⟩)))) (.node (.node (.single ⟨10240,10368,25600,25728⟩) (.node (.single ⟨10240,10368,25728,25856⟩) (.single ⟨10368,10432,25600,25664⟩))) (.node (.node (.single ⟨10368,10432,25664,25728⟩) (.single ⟨10432,10496,25600,25664⟩)) (.node (.single ⟨10432,10496,25664,25728⟩) (.single ⟨10368,10496,25728,25856⟩))))) (.node (.node (.node (.single ⟨22272,22400,6912,7040⟩) (.node (.single ⟨22272,22336,7040,7104⟩) (.single ⟨22272,22336,7104,7168⟩))) (.node (.node (.single ⟨22336,22400,7040,7104⟩) (.single ⟨22336,22400,7104,7168⟩)) (.node (.single ⟨22400,22528,6912,7040⟩) (.single ⟨22400,22528,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,10240,10368⟩) (.node (.single ⟨25600,25664,10368,10432⟩) (.single ⟨25600,25664,10432,10496⟩))) (.node (.node (.single ⟨25664,25728,10368,10432⟩) (.single ⟨25664,25728,10432,10496⟩)) (.node (.single ⟨25728,25856,10240,10368⟩) (.single ⟨25728,25856,10368,10496⟩))))))
def output22 : Fin 28 → GridBox := outputData22.get
def coverData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData22 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover22 (i : Fin 28) : Fin 28 := ⟨coverData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def source22 (i : Fin 28) : Fin 28 := ⟨sourceData22.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree22 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 .empty (.cutY 22272 .empty (.cutX 7040 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 7104 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))))))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 (.cutY 25856 (.cutX 10368 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10432 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 .empty (.cutY 6912 .empty (.cutX 22400 (.cutY 7040 .full (.cutX 22336 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full)))))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 (.cutY 10496 (.cutX 25728 (.cutY 10368 .full (.cutX 25664 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata22 : 0<104681033 ∧ 27<128 ∧ 87<128 ∧ 0<4 ∧
    2814/4160=0 ∧ 2814%4160=2814 ∧ ∀ i, (leaves22 i).Valid 8 := by
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

noncomputable def phaseMass22 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw22 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass22_eq : phaseMass22 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass22
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw22 output22 cover22 source22
    (gridTreeUnionCheck_sound 32768 raw22 output22 cover22 source22 tree22 checked22)
    _ (by norm_num) _, areaUnits22]
  norm_num

-- Frozen phase 6019, atom 2153, type 0, source (19,82).
def leavesData23 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves23 : Fin 13 → DyadicLeaf := leavesData23.get
def raw23 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 82 leaves23 i
def outputData23 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,20992,21056⟩) (.node (.single ⟨4864,4928,21056,21120⟩) (.single ⟨4928,4992,20992,21056⟩))) (.node (.single ⟨4928,4992,21056,21120⟩) (.node (.single ⟨4864,4992,21120,21248⟩) (.single ⟨4992,5056,20992,21056⟩)))) (.node (.node (.single ⟨4992,5056,21056,21120⟩) (.node (.single ⟨5056,5088,20992,21024⟩) (.single ⟨5056,5088,21024,21056⟩))) (.node (.node (.single ⟨5088,5120,20992,21024⟩) (.single ⟨5088,5120,21024,21056⟩)) (.node (.single ⟨5056,5120,21056,21120⟩) (.single ⟨4992,5120,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,27648,27776⟩) (.node (.single ⟨11520,11648,27776,27904⟩) (.single ⟨11648,11712,27648,27712⟩))) (.node (.single ⟨11648,11712,27712,27776⟩) (.node (.single ⟨11712,11744,27648,27680⟩) (.single ⟨11712,11744,27680,27712⟩)))) (.node (.node (.single ⟨11744,11776,27648,27680⟩) (.node (.single ⟨11744,11776,27680,27712⟩) (.single ⟨11712,11776,27712,27776⟩))) (.node (.node (.single ⟨11648,11712,27776,27840⟩) (.single ⟨11648,11712,27840,27904⟩)) (.node (.single ⟨11712,11776,27776,27840⟩) (.single ⟨11712,11776,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,4864,4928⟩) (.node (.single ⟨20992,21056,4928,4992⟩) (.single ⟨21056,21120,4864,4928⟩))) (.node (.single ⟨21056,21120,4928,4992⟩) (.node (.single ⟨20992,21056,4992,5056⟩) (.single ⟨20992,21024,5056,5088⟩)))) (.node (.node (.single ⟨20992,21024,5088,5120⟩) (.node (.single ⟨21024,21056,5056,5088⟩) (.single ⟨21024,21056,5088,5120⟩))) (.node (.node (.single ⟨21056,21120,4992,5056⟩) (.single ⟨21056,21120,5056,5120⟩)) (.node (.single ⟨21120,21248,4864,4992⟩) (.single ⟨21120,21248,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,11520,11648⟩) (.node (.single ⟨27648,27712,11648,11712⟩) (.single ⟨27648,27680,11712,11744⟩))) (.node (.single ⟨27648,27680,11744,11776⟩) (.node (.single ⟨27680,27712,11712,11744⟩) (.single ⟨27680,27712,11744,11776⟩)))) (.node (.node (.single ⟨27712,27776,11648,11712⟩) (.node (.single ⟨27712,27776,11712,11776⟩) (.single ⟨27776,27904,11520,11648⟩))) (.node (.node (.single ⟨27776,27840,11648,11712⟩) (.single ⟨27776,27840,11712,11776⟩)) (.node (.single ⟨27840,27904,11648,11712⟩) (.single ⟨27840,27904,11712,11776⟩)))))))
def output23 : Fin 52 → GridBox := outputData23.get
def coverData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData23 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover23 (i : Fin 52) : Fin 52 := ⟨coverData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def source23 (i : Fin 52) : Fin 52 := ⟨sourceData23.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree23 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 .empty (.cutX 4864 .empty (.cutY 21248 (.cutX 4992 (.cutY 21120 (.cutX 4928 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 5056 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 5088 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty)))) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 (.cutX 11520 .empty (.cutY 27904 (.cutX 11648 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 11712 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 11744 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 11712 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty)) .empty) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 .empty (.cutX 21248 (.cutY 4864 .empty (.cutX 21120 (.cutY 4992 (.cutX 21056 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 21056 (.cutY 5056 .full (.cutX 21024 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full))) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 (.cutX 27904 (.cutY 11520 .empty (.cutX 27776 (.cutY 11648 .full (.cutX 27712 (.cutY 11712 .full (.cutX 27680 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 27840 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty) .empty))))) .empty) .empty))) .empty))

theorem metadata23 : 0<152546139 ∧ 19<128 ∧ 82<128 ∧ 0<4 ∧
    2153/4160=0 ∧ 2153%4160=2153 ∧ ∀ i, (leaves23 i).Valid 8 := by
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

noncomputable def phaseMass23 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw23 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass23_eq : phaseMass23 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass23
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw23 output23 cover23 source23
    (gridTreeUnionCheck_sound 32768 raw23 output23 cover23 source23 tree23 checked23)
    _ (by norm_num) _, areaUnits23]
  norm_num

-- Frozen phase 6020, atom 2581, type 0, source (24,85).
def leavesData24 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves24 : Fin 10 → DyadicLeaf := leavesData24.get
def raw24 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 24 85 leaves24 i
def outputData24 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,21760,21824⟩) (.single ⟨6144,6208,21824,21888⟩)) (.node (.single ⟨6208,6272,21760,21824⟩) (.node (.single ⟨6208,6272,21824,21888⟩) (.single ⟨6144,6272,21888,22016⟩)))) (.node (.node (.single ⟨6272,6336,21760,21824⟩) (.single ⟨6272,6336,21824,21888⟩)) (.node (.single ⟨6336,6400,21760,21824⟩) (.node (.single ⟨6336,6400,21824,21888⟩) (.single ⟨6272,6400,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,26368,26496⟩) (.single ⟨10752,10880,26496,26624⟩)) (.node (.single ⟨10880,10944,26368,26432⟩) (.node (.single ⟨10880,10944,26432,26496⟩) (.single ⟨10944,11008,26368,26432⟩)))) (.node (.node (.single ⟨10944,11008,26432,26496⟩) (.single ⟨10880,10944,26496,26560⟩)) (.node (.single ⟨10880,10944,26560,26624⟩) (.node (.single ⟨10944,11008,26496,26560⟩) (.single ⟨10944,11008,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,6144,6208⟩) (.single ⟨21760,21824,6208,6272⟩)) (.node (.single ⟨21824,21888,6144,6208⟩) (.node (.single ⟨21824,21888,6208,6272⟩) (.single ⟨21760,21824,6272,6336⟩)))) (.node (.node (.single ⟨21760,21824,6336,6400⟩) (.single ⟨21824,21888,6272,6336⟩)) (.node (.single ⟨21824,21888,6336,6400⟩) (.node (.single ⟨21888,22016,6144,6272⟩) (.single ⟨21888,22016,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,10752,10880⟩) (.single ⟨26368,26432,10880,10944⟩)) (.node (.single ⟨26368,26432,10944,11008⟩) (.node (.single ⟨26432,26496,10880,10944⟩) (.single ⟨26432,26496,10944,11008⟩)))) (.node (.node (.single ⟨26496,26624,10752,10880⟩) (.single ⟨26496,26560,10880,10944⟩)) (.node (.single ⟨26496,26560,10944,11008⟩) (.node (.single ⟨26560,26624,10880,10944⟩) (.single ⟨26560,26624,10944,11008⟩)))))))
def output24 : Fin 40 → GridBox := outputData24.get
def coverData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData24 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover24 (i : Fin 40) : Fin 40 := ⟨coverData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def source24 (i : Fin 40) : Fin 40 := ⟨sourceData24.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree24 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 (.cutX 6400 (.cutY 21760 .empty (.cutX 6272 (.cutY 21888 (.cutX 6208 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6336 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 .empty (.cutX 11008 (.cutY 26368 .empty (.cutX 10880 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 10944 (.cutY 26432 .full .full) (.cutY 26432 .full .full)) (.cutX 10944 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 (.cutX 21760 .empty (.cutY 6400 (.cutX 21888 (.cutY 6272 (.cutX 21824 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 21824 (.cutY 6336 .full .full) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 .empty (.cutX 26368 .empty (.cutY 11008 (.cutX 26496 (.cutY 10880 .full (.cutX 26432 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26560 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty)))) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata24 : 0<104681033 ∧ 24<128 ∧ 85<128 ∧ 0<4 ∧
    2581/4160=0 ∧ 2581%4160=2581 ∧ ∀ i, (leaves24 i).Valid 8 := by
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

noncomputable def phaseMass24 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw24 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass24_eq : phaseMass24 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass24
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw24 output24 cover24 source24
    (gridTreeUnionCheck_sound 32768 raw24 output24 cover24 source24 tree24 checked24)
    _ (by norm_num) _, areaUnits24]
  norm_num

-- Frozen phase 6021, atom 7445, type 1, source (34,89).
def leavesData25 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves25 : Fin 13 → DyadicLeaf := leavesData25.get
def raw25 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 34 89 leaves25 i
def outputData25 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8704,8768,22784,22848⟩) (.node (.single ⟨8704,8768,22848,22912⟩) (.single ⟨8768,8832,22784,22848⟩))) (.node (.single ⟨8768,8832,22848,22912⟩) (.node (.single ⟨8704,8832,22912,23040⟩) (.single ⟨8832,8896,22784,22848⟩)))) (.node (.node (.single ⟨8832,8896,22848,22912⟩) (.node (.single ⟨8896,8928,22784,22816⟩) (.single ⟨8896,8928,22816,22848⟩))) (.node (.node (.single ⟨8928,8960,22784,22816⟩) (.single ⟨8928,8960,22816,22848⟩)) (.node (.single ⟨8896,8960,22848,22912⟩) (.single ⟨8832,8960,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,23808,23936⟩) (.node (.single ⟨9728,9856,23936,24064⟩) (.single ⟨9856,9920,23808,23872⟩))) (.node (.single ⟨9856,9920,23872,23936⟩) (.node (.single ⟨9920,9952,23808,23840⟩) (.single ⟨9920,9952,23840,23872⟩)))) (.node (.node (.single ⟨9952,9984,23808,23840⟩) (.node (.single ⟨9952,9984,23840,23872⟩) (.single ⟨9920,9984,23872,23936⟩))) (.node (.node (.single ⟨9856,9920,23936,24000⟩) (.single ⟨9856,9920,24000,24064⟩)) (.node (.single ⟨9920,9984,23936,24000⟩) (.single ⟨9920,9984,24000,24064⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,8704,8768⟩) (.node (.single ⟨22784,22848,8768,8832⟩) (.single ⟨22848,22912,8704,8768⟩))) (.node (.single ⟨22848,22912,8768,8832⟩) (.node (.single ⟨22784,22848,8832,8896⟩) (.single ⟨22784,22816,8896,8928⟩)))) (.node (.node (.single ⟨22784,22816,8928,8960⟩) (.node (.single ⟨22816,22848,8896,8928⟩) (.single ⟨22816,22848,8928,8960⟩))) (.node (.node (.single ⟨22848,22912,8832,8896⟩) (.single ⟨22848,22912,8896,8960⟩)) (.node (.single ⟨22912,23040,8704,8832⟩) (.single ⟨22912,23040,8832,8960⟩))))) (.node (.node (.node (.single ⟨23808,23936,9728,9856⟩) (.node (.single ⟨23808,23872,9856,9920⟩) (.single ⟨23808,23840,9920,9952⟩))) (.node (.single ⟨23808,23840,9952,9984⟩) (.node (.single ⟨23840,23872,9920,9952⟩) (.single ⟨23840,23872,9952,9984⟩)))) (.node (.node (.single ⟨23872,23936,9856,9920⟩) (.node (.single ⟨23872,23936,9920,9984⟩) (.single ⟨23936,24064,9728,9856⟩))) (.node (.node (.single ⟨23936,24000,9856,9920⟩) (.single ⟨23936,24000,9920,9984⟩)) (.node (.single ⟨24000,24064,9856,9920⟩) (.single ⟨24000,24064,9920,9984⟩)))))))
def output25 : Fin 52 → GridBox := outputData25.get
def coverData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData25 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover25 (i : Fin 52) : Fin 52 := ⟨coverData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def source25 (i : Fin 52) : Fin 52 := ⟨sourceData25.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree25 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 (.cutX 8960 (.cutY 22784 .empty (.cutX 8832 (.cutY 22912 (.cutX 8768 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 8896 (.cutY 22848 .full .full) (.cutY 22848 (.cutX 8928 (.cutY 22816 .full .full) (.cutY 22816 .full .full)) .full)) .full))) .empty) .empty)) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 (.cutX 9984 (.cutY 23808 .empty (.cutX 9856 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 9920 (.cutY 23872 .full .full) (.cutY 23872 (.cutX 9952 (.cutY 23840 .full .full) (.cutY 23840 .full .full)) .full)) (.cutX 9920 (.cutY 24000 .full .full) (.cutY 24000 .full .full))))) .empty) .empty))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 .empty (.cutX 22784 .empty (.cutY 8960 (.cutX 22912 (.cutY 8832 (.cutX 22848 (.cutY 8768 .full .full) (.cutY 8768 .full .full)) (.cutX 22848 (.cutY 8896 .full (.cutX 22816 (.cutY 8928 .full .full) (.cutY 8928 .full .full))) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty))) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 .empty (.cutX 23808 .empty (.cutY 9984 (.cutX 23936 (.cutY 9856 .full (.cutX 23872 (.cutY 9920 .full (.cutX 23840 (.cutY 9952 .full .full) (.cutY 9952 .full .full))) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 24000 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty))) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata25 : 0<67962893 ∧ 34<128 ∧ 89<128 ∧ 1<4 ∧
    7445/4160=1 ∧ 7445%4160=3285 ∧ ∀ i, (leaves25 i).Valid 8 := by
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

noncomputable def phaseMass25 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw25 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass25_eq : phaseMass25 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass25
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw25 output25 cover25 source25
    (gridTreeUnionCheck_sound 32768 raw25 output25 cover25 source25 tree25 checked25)
    _ (by norm_num) _, areaUnits25]
  norm_num

-- Frozen phase 6022, atom 7320, type 1, source (32,88).
def leavesData26 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves26 : Fin 7 → DyadicLeaf := leavesData26.get
def raw26 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 32 88 leaves26 i
def outputData26 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨8192,8320,22528,22656⟩) (.node (.single ⟨8192,8320,22656,22784⟩) (.single ⟨8320,8384,22528,22592⟩))) (.node (.node (.single ⟨8320,8384,22592,22656⟩) (.single ⟨8384,8448,22528,22592⟩)) (.node (.single ⟨8384,8448,22592,22656⟩) (.single ⟨8320,8448,22656,22784⟩)))) (.node (.node (.single ⟨9984,10112,24320,24448⟩) (.node (.single ⟨9984,10112,24448,24576⟩) (.single ⟨10112,10176,24320,24384⟩))) (.node (.node (.single ⟨10112,10176,24384,24448⟩) (.single ⟨10176,10240,24320,24384⟩)) (.node (.single ⟨10176,10240,24384,24448⟩) (.single ⟨10112,10240,24448,24576⟩))))) (.node (.node (.node (.single ⟨22528,22656,8192,8320⟩) (.node (.single ⟨22528,22592,8320,8384⟩) (.single ⟨22528,22592,8384,8448⟩))) (.node (.node (.single ⟨22592,22656,8320,8384⟩) (.single ⟨22592,22656,8384,8448⟩)) (.node (.single ⟨22656,22784,8192,8320⟩) (.single ⟨22656,22784,8320,8448⟩)))) (.node (.node (.single ⟨24320,24448,9984,10112⟩) (.node (.single ⟨24320,24384,10112,10176⟩) (.single ⟨24320,24384,10176,10240⟩))) (.node (.node (.single ⟨24384,24448,10112,10176⟩) (.single ⟨24384,24448,10176,10240⟩)) (.node (.single ⟨24448,24576,9984,10112⟩) (.single ⟨24448,24576,10112,10240⟩))))))
def output26 : Fin 28 → GridBox := outputData26.get
def coverData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData26 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover26 (i : Fin 28) : Fin 28 := ⟨coverData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def source26 (i : Fin 28) : Fin 28 := ⟨sourceData26.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree26 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 (.cutX 8448 (.cutY 22784 (.cutX 8320 (.cutY 22656 .full .full) (.cutY 22656 (.cutX 8384 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 .empty (.cutY 24064 .empty (.cutX 9984 .empty (.cutY 24320 .empty (.cutX 10112 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 10176 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) .full))))))))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 (.cutY 8704 (.cutX 22784 (.cutY 8448 (.cutX 22656 (.cutY 8320 .full (.cutX 22592 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty) .empty) .empty) .empty) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 .empty (.cutX 24320 .empty (.cutY 9984 .empty (.cutX 24448 (.cutY 10112 .full (.cutX 24384 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full .full)))))))) .empty)) .empty))) .empty) .empty))

theorem metadata26 : 0<67962893 ∧ 32<128 ∧ 88<128 ∧ 1<4 ∧
    7320/4160=1 ∧ 7320%4160=3160 ∧ ∀ i, (leaves26 i).Valid 8 := by
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

noncomputable def phaseMass26 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw26 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass26_eq : phaseMass26 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass26
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw26 output26 cover26 source26
    (gridTreeUnionCheck_sound 32768 raw26 output26 cover26 source26 tree26 checked26)
    _ (by norm_num) _, areaUnits26]
  norm_num

-- Frozen phase 6023, atom 6738, type 1, source (24,82).
def leavesData27 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves27 : Fin 13 → DyadicLeaf := leavesData27.get
def raw27 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 82 leaves27 i
def outputData27 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,20992,21056⟩) (.node (.single ⟨6144,6208,21056,21120⟩) (.single ⟨6208,6272,20992,21056⟩))) (.node (.single ⟨6208,6272,21056,21120⟩) (.node (.single ⟨6144,6272,21120,21248⟩) (.single ⟨6272,6336,20992,21056⟩)))) (.node (.node (.single ⟨6272,6336,21056,21120⟩) (.node (.single ⟨6336,6368,20992,21024⟩) (.single ⟨6336,6368,21024,21056⟩))) (.node (.node (.single ⟨6368,6400,20992,21024⟩) (.single ⟨6368,6400,21024,21056⟩)) (.node (.single ⟨6336,6400,21056,21120⟩) (.single ⟨6272,6400,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,26368,26496⟩) (.node (.single ⟨11520,11648,26496,26624⟩) (.single ⟨11648,11712,26368,26432⟩))) (.node (.single ⟨11648,11712,26432,26496⟩) (.node (.single ⟨11712,11744,26368,26400⟩) (.single ⟨11712,11744,26400,26432⟩)))) (.node (.node (.single ⟨11744,11776,26368,26400⟩) (.node (.single ⟨11744,11776,26400,26432⟩) (.single ⟨11712,11776,26432,26496⟩))) (.node (.node (.single ⟨11648,11712,26496,26560⟩) (.single ⟨11648,11712,26560,26624⟩)) (.node (.single ⟨11712,11776,26496,26560⟩) (.single ⟨11712,11776,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,6144,6208⟩) (.node (.single ⟨20992,21056,6208,6272⟩) (.single ⟨21056,21120,6144,6208⟩))) (.node (.single ⟨21056,21120,6208,6272⟩) (.node (.single ⟨20992,21056,6272,6336⟩) (.single ⟨20992,21024,6336,6368⟩)))) (.node (.node (.single ⟨20992,21024,6368,6400⟩) (.node (.single ⟨21024,21056,6336,6368⟩) (.single ⟨21024,21056,6368,6400⟩))) (.node (.node (.single ⟨21056,21120,6272,6336⟩) (.single ⟨21056,21120,6336,6400⟩)) (.node (.single ⟨21120,21248,6144,6272⟩) (.single ⟨21120,21248,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,11520,11648⟩) (.node (.single ⟨26368,26432,11648,11712⟩) (.single ⟨26368,26400,11712,11744⟩))) (.node (.single ⟨26368,26400,11744,11776⟩) (.node (.single ⟨26400,26432,11712,11744⟩) (.single ⟨26400,26432,11744,11776⟩)))) (.node (.node (.single ⟨26432,26496,11648,11712⟩) (.node (.single ⟨26432,26496,11712,11776⟩) (.single ⟨26496,26624,11520,11648⟩))) (.node (.node (.single ⟨26496,26560,11648,11712⟩) (.single ⟨26496,26560,11712,11776⟩)) (.node (.single ⟨26560,26624,11648,11712⟩) (.single ⟨26560,26624,11712,11776⟩)))))))
def output27 : Fin 52 → GridBox := outputData27.get
def coverData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData27 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover27 (i : Fin 52) : Fin 52 := ⟨coverData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def source27 (i : Fin 52) : Fin 52 := ⟨sourceData27.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree27 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 (.cutY 20992 .empty (.cutX 6400 (.cutY 21248 (.cutX 6272 (.cutY 21120 (.cutX 6208 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 6336 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 6368 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty) .empty)) .empty) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 .empty (.cutX 11520 .empty (.cutY 26368 .empty (.cutX 11648 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 11712 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 11744 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 11712 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))))) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 (.cutX 21248 (.cutY 6400 (.cutX 21120 (.cutY 6272 (.cutX 21056 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 21056 (.cutY 6336 .full (.cutX 21024 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty) .empty) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 .empty (.cutY 11776 (.cutX 26368 .empty (.cutY 11520 .empty (.cutX 26496 (.cutY 11648 .full (.cutX 26432 (.cutY 11712 .full (.cutX 26400 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 26560 (.cutY 11712 .full .full) (.cutY 11712 .full .full)))))) .empty))))) .empty) .empty) .empty))) .empty))

theorem metadata27 : 0<144359671 ∧ 24<128 ∧ 82<128 ∧ 1<4 ∧
    6738/4160=1 ∧ 6738%4160=2578 ∧ ∀ i, (leaves27 i).Valid 8 := by
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

noncomputable def phaseMass27 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw27 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass27_eq : phaseMass27 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass27
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw27 output27 cover27 source27
    (gridTreeUnionCheck_sound 32768 raw27 output27 cover27 source27 tree27 checked27)
    _ (by norm_num) _, areaUnits27]
  norm_num

-- Frozen phase 6024, atom 4481, type 1, source (2,69).
def leavesData28 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves28 : Fin 7 → DyadicLeaf := leavesData28.get
def raw28 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 69 leaves28 i
def outputData28 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,17664,17792⟩) (.node (.single ⟨512,640,17792,17920⟩) (.single ⟨640,704,17664,17728⟩))) (.node (.node (.single ⟨640,704,17728,17792⟩) (.single ⟨704,768,17664,17728⟩)) (.node (.single ⟨704,768,17728,17792⟩) (.single ⟨640,768,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,32000,32128⟩) (.node (.single ⟨14848,14976,32128,32256⟩) (.single ⟨14976,15040,32000,32064⟩))) (.node (.node (.single ⟨14976,15040,32064,32128⟩) (.single ⟨15040,15104,32000,32064⟩)) (.node (.single ⟨15040,15104,32064,32128⟩) (.single ⟨14976,15104,32128,32256⟩))))) (.node (.node (.node (.single ⟨17664,17792,512,640⟩) (.node (.single ⟨17664,17728,640,704⟩) (.single ⟨17664,17728,704,768⟩))) (.node (.node (.single ⟨17728,17792,640,704⟩) (.single ⟨17728,17792,704,768⟩)) (.node (.single ⟨17792,17920,512,640⟩) (.single ⟨17792,17920,640,768⟩)))) (.node (.node (.single ⟨32000,32128,14848,14976⟩) (.node (.single ⟨32000,32064,14976,15040⟩) (.single ⟨32000,32064,15040,15104⟩))) (.node (.node (.single ⟨32064,32128,14976,15040⟩) (.single ⟨32064,32128,15040,15104⟩)) (.node (.single ⟨32128,32256,14848,14976⟩) (.single ⟨32128,32256,14976,15104⟩))))))
def output28 : Fin 28 → GridBox := outputData28.get
def coverData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData28 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover28 (i : Fin 28) : Fin 28 := ⟨coverData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def source28 (i : Fin 28) : Fin 28 := ⟨sourceData28.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree28 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 (.cutX 768 (.cutY 17664 .empty (.cutX 640 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 704 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 (.cutX 15104 (.cutY 32000 .empty (.cutX 14976 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 15040 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 .empty (.cutX 17664 .empty (.cutY 768 (.cutX 17792 (.cutY 640 .full (.cutX 17728 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 .empty (.cutX 32000 .empty (.cutY 15104 (.cutX 32128 (.cutY 14976 .full (.cutX 32064 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty))) .empty) .empty)))))))) .empty))

theorem metadata28 : 0<202148459 ∧ 2<128 ∧ 69<128 ∧ 1<4 ∧
    4481/4160=1 ∧ 4481%4160=321 ∧ ∀ i, (leaves28 i).Valid 8 := by
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

noncomputable def phaseMass28 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw28 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass28_eq : phaseMass28 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass28
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw28 output28 cover28 source28
    (gridTreeUnionCheck_sound 32768 raw28 output28 cover28 source28 tree28 checked28)
    _ (by norm_num) _, areaUnits28]
  norm_num

-- Frozen phase 6025, atom 4845, type 1, source (5,70).
def leavesData29 : FiniteInputTree DyadicLeaf 19 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩))))) (.node (.node (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩)) (.node (.single ⟨3,4,0⟩) (.node (.single ⟨3,4,1⟩) (.single ⟨3,5,0⟩)))) (.node (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩)) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves29 : Fin 19 → DyadicLeaf := leavesData29.get
def raw29 (i : Fin 76) : GridBox := phaseImageBoxes 32768 8 5 70 leaves29 i
def outputData29 : FiniteInputTree GridBox 76 := (.node (.node (.node (.node (.node (.node (.single ⟨1280,1344,17920,17984⟩) (.single ⟨1280,1344,17984,18048⟩)) (.node (.single ⟨1344,1408,17920,17984⟩) (.single ⟨1344,1408,17984,18048⟩))) (.node (.node (.single ⟨1280,1408,18048,18176⟩) (.single ⟨1408,1440,17920,17952⟩)) (.node (.single ⟨1408,1440,17952,17984⟩) (.node (.single ⟨1440,1472,17920,17952⟩) (.single ⟨1440,1472,17952,17984⟩))))) (.node (.node (.node (.single ⟨1408,1472,17984,18048⟩) (.single ⟨1472,1504,17920,17952⟩)) (.node (.single ⟨1472,1504,17952,17984⟩) (.node (.single ⟨1504,1520,17920,17936⟩) (.single ⟨1504,1520,17936,17952⟩)))) (.node (.node (.single ⟨1520,1536,17920,17936⟩) (.single ⟨1520,1536,17936,17952⟩)) (.node (.single ⟨1504,1536,17952,17984⟩) (.node (.single ⟨1472,1536,17984,18048⟩) (.single ⟨1408,1536,18048,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14720,31232,31360⟩) (.single ⟨14592,14720,31360,31488⟩)) (.node (.single ⟨14720,14784,31232,31296⟩) (.single ⟨14720,14784,31296,31360⟩))) (.node (.node (.single ⟨14784,14816,31232,31264⟩) (.single ⟨14784,14816,31264,31296⟩)) (.node (.single ⟨14816,14832,31232,31248⟩) (.node (.single ⟨14816,14832,31248,31264⟩) (.single ⟨14832,14848,31232,31248⟩))))) (.node (.node (.node (.single ⟨14832,14848,31248,31264⟩) (.single ⟨14816,14848,31264,31296⟩)) (.node (.single ⟨14784,14816,31296,31328⟩) (.node (.single ⟨14784,14816,31328,31360⟩) (.single ⟨14816,14848,31296,31328⟩)))) (.node (.node (.single ⟨14816,14848,31328,31360⟩) (.single ⟨14720,14784,31360,31424⟩)) (.node (.single ⟨14720,14784,31424,31488⟩) (.node (.single ⟨14784,14848,31360,31424⟩) (.single ⟨14784,14848,31424,31488⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,1280,1344⟩) (.single ⟨17920,17984,1344,1408⟩)) (.node (.single ⟨17984,18048,1280,1344⟩) (.single ⟨17984,18048,1344,1408⟩))) (.node (.node (.single ⟨17920,17952,1408,1440⟩) (.single ⟨17920,17952,1440,1472⟩)) (.node (.single ⟨17952,17984,1408,1440⟩) (.node (.single ⟨17952,17984,1440,1472⟩) (.single ⟨17920,17952,1472,1504⟩))))) (.node (.node (.node (.single ⟨17920,17936,1504,1520⟩) (.single ⟨17920,17936,1520,1536⟩)) (.node (.single ⟨17936,17952,1504,1520⟩) (.node (.single ⟨17936,17952,1520,1536⟩) (.single ⟨17952,17984,1472,1504⟩)))) (.node (.node (.single ⟨17952,17984,1504,1536⟩) (.single ⟨17984,18048,1408,1472⟩)) (.node (.single ⟨17984,18048,1472,1536⟩) (.node (.single ⟨18048,18176,1280,1408⟩) (.single ⟨18048,18176,1408,1536⟩)))))) (.node (.node (.node (.node (.single ⟨31232,31360,14592,14720⟩) (.single ⟨31232,31296,14720,14784⟩)) (.node (.single ⟨31232,31264,14784,14816⟩) (.single ⟨31232,31248,14816,14832⟩))) (.node (.node (.single ⟨31232,31248,14832,14848⟩) (.single ⟨31248,31264,14816,14832⟩)) (.node (.single ⟨31248,31264,14832,14848⟩) (.node (.single ⟨31264,31296,14784,14816⟩) (.single ⟨31264,31296,14816,14848⟩))))) (.node (.node (.node (.single ⟨31296,31360,14720,14784⟩) (.single ⟨31296,31328,14784,14816⟩)) (.node (.single ⟨31296,31328,14816,14848⟩) (.node (.single ⟨31328,31360,14784,14816⟩) (.single ⟨31328,31360,14816,14848⟩)))) (.node (.node (.single ⟨31360,31488,14592,14720⟩) (.single ⟨31360,31424,14720,14784⟩)) (.node (.single ⟨31360,31424,14784,14848⟩) (.node (.single ⟨31424,31488,14720,14784⟩) (.single ⟨31424,31488,14784,14848⟩))))))))
def output29 : Fin 76 → GridBox := outputData29.get
def coverData29 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 55)) (.node (.single 71) (.single 20))) (.node (.node (.single 18) (.single 56)) (.node (.single 57) (.node (.single 19) (.single 0))))) (.node (.node (.node (.single 38) (.single 75)) (.node (.single 37) (.node (.single 1) (.single 40)))) (.node (.node (.single 74) (.single 35)) (.node (.single 2) (.node (.single 39) (.single 73)))))) (.node (.node (.node (.node (.single 36) (.single 3)) (.node (.single 41) (.single 72))) (.node (.node (.single 34) (.single 9)) (.node (.single 53) (.node (.single 66) (.single 22))))) (.node (.node (.node (.single 17) (.single 54)) (.node (.single 58) (.node (.single 21) (.single 10)))) (.node (.node (.single 46) (.single 65)) (.node (.single 29) (.node (.single 11) (.single 51))))))) (.node (.node (.node (.node (.node (.single 64) (.single 24)) (.node (.single 16) (.single 52))) (.node (.node (.single 59) (.single 23)) (.node (.single 5) (.node (.single 42) (.single 70))))) (.node (.node (.node (.single 33) (.single 6)) (.node (.single 44) (.node (.single 69) (.single 31)))) (.node (.node (.single 7) (.single 43)) (.node (.single 68) (.node (.single 32) (.single 8)))))) (.node (.node (.node (.node (.single 45) (.single 67)) (.node (.single 30) (.single 12))) (.node (.node (.single 47) (.single 63)) (.node (.single 28) (.node (.single 13) (.single 49))))) (.node (.node (.node (.single 62) (.single 26)) (.node (.single 14) (.node (.single 48) (.single 61)))) (.node (.node (.single 27) (.single 15)) (.node (.single 50) (.node (.single 60) (.single 25))))))))
def sourceData29 : FiniteInputTree ℕ 76 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 44)) (.node (.single 48) (.node (.single 52) (.single 56))))) (.node (.node (.node (.single 24) (.single 32)) (.node (.single 36) (.node (.single 60) (.single 64)))) (.node (.node (.single 68) (.single 72)) (.node (.single 40) (.node (.single 28) (.single 4)))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 43) (.single 39)) (.node (.single 75) (.node (.single 67) (.single 71))))) (.node (.node (.node (.single 63) (.single 35)) (.node (.single 59) (.node (.single 51) (.single 55)))) (.node (.node (.single 47) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11))))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 45) (.single 53)) (.node (.single 49) (.node (.single 57) (.single 33))))) (.node (.node (.node (.single 61) (.single 69)) (.node (.single 65) (.node (.single 73) (.single 37)))) (.node (.node (.single 41) (.single 25)) (.node (.single 29) (.node (.single 1) (.single 5)))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 42) (.single 74))) (.node (.node (.single 70) (.single 66)) (.node (.single 62) (.node (.single 38) (.single 34))))) (.node (.node (.node (.single 26) (.single 58)) (.node (.single 54) (.node (.single 50) (.single 46)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10))))))))
def cover29 (i : Fin 76) : Fin 76 := ⟨coverData29.get i % 76, Nat.mod_lt _ (by decide)⟩
def source29 (i : Fin 76) : Fin 76 := ⟨sourceData29.get i % 76, Nat.mod_lt _ (by decide)⟩
def tree29 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 .empty (.cutY 18176 (.cutX 1408 (.cutY 18048 (.cutX 1344 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 1472 (.cutY 17984 (.cutX 1440 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 1504 (.cutY 17952 .full .full) (.cutY 17952 (.cutX 1520 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full)) .full)) .full)) .empty))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 .empty (.cutY 31488 (.cutX 14720 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14784 (.cutY 31296 .full .full) (.cutY 31296 (.cutX 14816 (.cutY 31264 .full .full) (.cutY 31264 (.cutX 14832 (.cutY 31248 .full .full) (.cutY 31248 .full .full)) .full)) (.cutX 14816 (.cutY 31328 .full .full) (.cutY 31328 .full .full)))) (.cutX 14784 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty))) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 (.cutY 1280 .empty (.cutX 18048 (.cutY 1408 (.cutX 17984 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 17984 (.cutY 1472 (.cutX 17952 (.cutY 1440 .full .full) (.cutY 1440 .full .full)) (.cutX 17952 (.cutY 1504 .full (.cutX 17936 (.cutY 1520 .full .full) (.cutY 1520 .full .full))) (.cutY 1504 .full .full))) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 (.cutY 14592 .empty (.cutX 31360 (.cutY 14720 .full (.cutX 31296 (.cutY 14784 .full (.cutX 31264 (.cutY 14816 .full (.cutX 31248 (.cutY 14832 .full .full) (.cutY 14832 .full .full))) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 31328 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 31424 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty)) .empty) .empty))))))) .empty))

theorem metadata29 : 0<202148459 ∧ 5<128 ∧ 70<128 ∧ 1<4 ∧
    4845/4160=1 ∧ 4845%4160=685 ∧ ∀ i, (leaves29 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData29).mp
    (by decide +kernel)

theorem sourceChecked29_0 : ∀ i : Fin 64,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked29_64 : ∀ i : Fin 12,
    (fun i => output29 i = raw29 (source29 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem sourceChecked29 : ∀ i : Fin 76, (fun i => output29 i = raw29 (source29 i)) i :=
  forallFin_of_zero_offset (fun i => output29 i = raw29 (source29 i)) (forallFinOffset_add (fun i => output29 i = raw29 (source29 i)) 0 64 12 (by decide) sourceChecked29_0
    sourceChecked29_64)

theorem coverChecked29_0 : ∀ i : Fin 64,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 76 0 64 (by decide) i) := by decide +kernel

theorem coverChecked29_64 : ∀ i : Fin 12,
    (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (finOffset 76 64 12 (by decide) i) := by decide +kernel

theorem coverChecked29 : ∀ i : Fin 76, (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) i :=
  forallFin_of_zero_offset (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) (forallFinOffset_add (fun i => (output29 (cover29 i)).ContainsBox (raw29 i)) 0 64 12 (by decide) coverChecked29_0
    coverChecked29_64)

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

noncomputable def phaseMass29 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw29 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass29_eq : phaseMass29 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass29
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw29 output29 cover29 source29
    (gridTreeUnionCheck_sound 32768 raw29 output29 cover29 source29 tree29 checked29)
    _ (by norm_num) _, areaUnits29]
  norm_num

-- Frozen phase 6026, atom 804, type 0, source (6,72).
def leavesData30 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves30 : Fin 7 → DyadicLeaf := leavesData30.get
def raw30 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 6 72 leaves30 i
def outputData30 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1536,1664,18432,18560⟩) (.node (.single ⟨1536,1664,18560,18688⟩) (.single ⟨1664,1728,18432,18496⟩))) (.node (.node (.single ⟨1664,1728,18496,18560⟩) (.single ⟨1728,1792,18432,18496⟩)) (.node (.single ⟨1728,1792,18496,18560⟩) (.single ⟨1664,1792,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,30976,31104⟩) (.node (.single ⟨14080,14208,31104,31232⟩) (.single ⟨14208,14272,30976,31040⟩))) (.node (.node (.single ⟨14208,14272,31040,31104⟩) (.single ⟨14272,14336,30976,31040⟩)) (.node (.single ⟨14272,14336,31040,31104⟩) (.single ⟨14208,14336,31104,31232⟩))))) (.node (.node (.node (.single ⟨18432,18560,1536,1664⟩) (.node (.single ⟨18432,18496,1664,1728⟩) (.single ⟨18432,18496,1728,1792⟩))) (.node (.node (.single ⟨18496,18560,1664,1728⟩) (.single ⟨18496,18560,1728,1792⟩)) (.node (.single ⟨18560,18688,1536,1664⟩) (.single ⟨18560,18688,1664,1792⟩)))) (.node (.node (.single ⟨30976,31104,14080,14208⟩) (.node (.single ⟨30976,31040,14208,14272⟩) (.single ⟨30976,31040,14272,14336⟩))) (.node (.node (.single ⟨31040,31104,14208,14272⟩) (.single ⟨31040,31104,14272,14336⟩)) (.node (.single ⟨31104,31232,14080,14208⟩) (.single ⟨31104,31232,14208,14336⟩))))))
def output30 : Fin 28 → GridBox := outputData30.get
def coverData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData30 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover30 (i : Fin 28) : Fin 28 := ⟨coverData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def source30 (i : Fin 28) : Fin 28 := ⟨sourceData30.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree30 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 .empty (.cutY 18944 (.cutX 1792 (.cutY 18688 (.cutX 1664 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 1728 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 (.cutX 14080 .empty (.cutY 30976 .empty (.cutX 14208 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 14272 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) .full)))) .empty)) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 .empty (.cutX 18688 (.cutY 1792 (.cutX 18560 (.cutY 1664 .full (.cutX 18496 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 (.cutY 13824 .empty (.cutX 30976 .empty (.cutY 14080 .empty (.cutX 31104 (.cutY 14208 .full (.cutX 31040 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))) .empty)) .empty) .empty)))))) .empty))

theorem metadata30 : 0<34183877 ∧ 6<128 ∧ 72<128 ∧ 0<4 ∧
    804/4160=0 ∧ 804%4160=804 ∧ ∀ i, (leaves30 i).Valid 8 := by
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

noncomputable def phaseMass30 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw30 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass30_eq : phaseMass30 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass30
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw30 output30 cover30 source30
    (gridTreeUnionCheck_sound 32768 raw30 output30 cover30 source30 tree30 checked30)
    _ (by norm_num) _, areaUnits30]
  norm_num

-- Frozen phase 6027, atom 7045, type 1, source (28,85).
def leavesData31 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves31 : Fin 13 → DyadicLeaf := leavesData31.get
def raw31 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 28 85 leaves31 i
def outputData31 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7168,7232,21760,21824⟩) (.node (.single ⟨7168,7232,21824,21888⟩) (.single ⟨7232,7296,21760,21824⟩))) (.node (.single ⟨7232,7296,21824,21888⟩) (.node (.single ⟨7168,7296,21888,22016⟩) (.single ⟨7296,7360,21760,21824⟩)))) (.node (.node (.single ⟨7296,7360,21824,21888⟩) (.node (.single ⟨7360,7392,21760,21792⟩) (.single ⟨7360,7392,21792,21824⟩))) (.node (.node (.single ⟨7392,7424,21760,21792⟩) (.single ⟨7392,7424,21792,21824⟩)) (.node (.single ⟨7360,7424,21824,21888⟩) (.single ⟨7296,7424,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,25344,25472⟩) (.node (.single ⟨10752,10880,25472,25600⟩) (.single ⟨10880,10944,25344,25408⟩))) (.node (.single ⟨10880,10944,25408,25472⟩) (.node (.single ⟨10944,10976,25344,25376⟩) (.single ⟨10944,10976,25376,25408⟩)))) (.node (.node (.single ⟨10976,11008,25344,25376⟩) (.node (.single ⟨10976,11008,25376,25408⟩) (.single ⟨10944,11008,25408,25472⟩))) (.node (.node (.single ⟨10880,10944,25472,25536⟩) (.single ⟨10880,10944,25536,25600⟩)) (.node (.single ⟨10944,11008,25472,25536⟩) (.single ⟨10944,11008,25536,25600⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,7168,7232⟩) (.node (.single ⟨21760,21824,7232,7296⟩) (.single ⟨21824,21888,7168,7232⟩))) (.node (.single ⟨21824,21888,7232,7296⟩) (.node (.single ⟨21760,21824,7296,7360⟩) (.single ⟨21760,21792,7360,7392⟩)))) (.node (.node (.single ⟨21760,21792,7392,7424⟩) (.node (.single ⟨21792,21824,7360,7392⟩) (.single ⟨21792,21824,7392,7424⟩))) (.node (.node (.single ⟨21824,21888,7296,7360⟩) (.single ⟨21824,21888,7360,7424⟩)) (.node (.single ⟨21888,22016,7168,7296⟩) (.single ⟨21888,22016,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,10752,10880⟩) (.node (.single ⟨25344,25408,10880,10944⟩) (.single ⟨25344,25376,10944,10976⟩))) (.node (.single ⟨25344,25376,10976,11008⟩) (.node (.single ⟨25376,25408,10944,10976⟩) (.single ⟨25376,25408,10976,11008⟩)))) (.node (.node (.single ⟨25408,25472,10880,10944⟩) (.node (.single ⟨25408,25472,10944,11008⟩) (.single ⟨25472,25600,10752,10880⟩))) (.node (.node (.single ⟨25472,25536,10880,10944⟩) (.single ⟨25472,25536,10944,11008⟩)) (.node (.single ⟨25536,25600,10880,10944⟩) (.single ⟨25536,25600,10944,11008⟩)))))))
def output31 : Fin 52 → GridBox := outputData31.get
def coverData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData31 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover31 (i : Fin 52) : Fin 52 := ⟨coverData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def source31 (i : Fin 52) : Fin 52 := ⟨sourceData31.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree31 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 (.cutX 7424 (.cutY 21760 .empty (.cutX 7296 (.cutY 21888 (.cutX 7232 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 7360 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 7392 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full))) .empty) .empty) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 .empty (.cutY 25088 .empty (.cutX 11008 (.cutY 25344 .empty (.cutX 10880 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 10944 (.cutY 25408 .full .full) (.cutY 25408 (.cutX 10976 (.cutY 25376 .full .full) (.cutY 25376 .full .full)) .full)) (.cutX 10944 (.cutY 25536 .full .full) (.cutY 25536 .full .full))))) .empty))) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 (.cutY 7680 (.cutX 21760 .empty (.cutY 7424 (.cutX 21888 (.cutY 7296 (.cutX 21824 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 21824 (.cutY 7360 .full (.cutX 21792 (.cutY 7392 .full .full) (.cutY 7392 .full .full))) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty)) .empty) .empty)))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 .empty (.cutX 25344 .empty (.cutY 11008 (.cutX 25472 (.cutY 10880 .full (.cutX 25408 (.cutY 10944 .full (.cutX 25376 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 25536 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty)))) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata31 : 0<144359671 ∧ 28<128 ∧ 85<128 ∧ 1<4 ∧
    7045/4160=1 ∧ 7045%4160=2885 ∧ ∀ i, (leaves31 i).Valid 8 := by
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

-- Frozen phase 6028, atom 2416, type 0, source (22,84).
def leavesData32 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves32 : Fin 13 → DyadicLeaf := leavesData32.get
def raw32 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 22 84 leaves32 i
def outputData32 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5632,5696,21504,21568⟩) (.node (.single ⟨5632,5696,21568,21632⟩) (.single ⟨5696,5760,21504,21568⟩))) (.node (.single ⟨5696,5760,21568,21632⟩) (.node (.single ⟨5632,5760,21632,21760⟩) (.single ⟨5760,5824,21504,21568⟩)))) (.node (.node (.single ⟨5760,5824,21568,21632⟩) (.node (.single ⟨5824,5856,21504,21536⟩) (.single ⟨5824,5856,21536,21568⟩))) (.node (.node (.single ⟨5856,5888,21504,21536⟩) (.single ⟨5856,5888,21536,21568⟩)) (.node (.single ⟨5824,5888,21568,21632⟩) (.single ⟨5760,5888,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,26880,27008⟩) (.node (.single ⟨11008,11136,27008,27136⟩) (.single ⟨11136,11200,26880,26944⟩))) (.node (.single ⟨11136,11200,26944,27008⟩) (.node (.single ⟨11200,11232,26880,26912⟩) (.single ⟨11200,11232,26912,26944⟩)))) (.node (.node (.single ⟨11232,11264,26880,26912⟩) (.node (.single ⟨11232,11264,26912,26944⟩) (.single ⟨11200,11264,26944,27008⟩))) (.node (.node (.single ⟨11136,11200,27008,27072⟩) (.single ⟨11136,11200,27072,27136⟩)) (.node (.single ⟨11200,11264,27008,27072⟩) (.single ⟨11200,11264,27072,27136⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,5632,5696⟩) (.node (.single ⟨21504,21568,5696,5760⟩) (.single ⟨21568,21632,5632,5696⟩))) (.node (.single ⟨21568,21632,5696,5760⟩) (.node (.single ⟨21504,21568,5760,5824⟩) (.single ⟨21504,21536,5824,5856⟩)))) (.node (.node (.single ⟨21504,21536,5856,5888⟩) (.node (.single ⟨21536,21568,5824,5856⟩) (.single ⟨21536,21568,5856,5888⟩))) (.node (.node (.single ⟨21568,21632,5760,5824⟩) (.single ⟨21568,21632,5824,5888⟩)) (.node (.single ⟨21632,21760,5632,5760⟩) (.single ⟨21632,21760,5760,5888⟩))))) (.node (.node (.node (.single ⟨26880,27008,11008,11136⟩) (.node (.single ⟨26880,26944,11136,11200⟩) (.single ⟨26880,26912,11200,11232⟩))) (.node (.single ⟨26880,26912,11232,11264⟩) (.node (.single ⟨26912,26944,11200,11232⟩) (.single ⟨26912,26944,11232,11264⟩)))) (.node (.node (.single ⟨26944,27008,11136,11200⟩) (.node (.single ⟨26944,27008,11200,11264⟩) (.single ⟨27008,27136,11008,11136⟩))) (.node (.node (.single ⟨27008,27072,11136,11200⟩) (.single ⟨27008,27072,11200,11264⟩)) (.node (.single ⟨27072,27136,11136,11200⟩) (.single ⟨27072,27136,11200,11264⟩)))))))
def output32 : Fin 52 → GridBox := outputData32.get
def coverData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData32 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover32 (i : Fin 52) : Fin 52 := ⟨coverData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def source32 (i : Fin 52) : Fin 52 := ⟨sourceData32.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree32 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 (.cutX 5888 (.cutY 21760 (.cutX 5760 (.cutY 21632 (.cutX 5696 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 5824 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 5856 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty) .empty) .empty)))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 (.cutX 11008 .empty (.cutY 26880 .empty (.cutX 11136 (.cutY 27008 .full .full) (.cutY 27008 (.cutX 11200 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 11232 (.cutY 26912 .full .full) (.cutY 26912 .full .full)) .full)) (.cutX 11200 (.cutY 27072 .full .full) (.cutY 27072 .full .full)))))) .empty)) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 .empty (.cutX 21760 (.cutY 5888 (.cutX 21632 (.cutY 5760 (.cutX 21568 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 21568 (.cutY 5824 .full (.cutX 21536 (.cutY 5856 .full .full) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full .full)) .empty) .empty)) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 .empty (.cutX 26880 .empty (.cutY 11008 .empty (.cutX 27008 (.cutY 11136 .full (.cutX 26944 (.cutY 11200 .full (.cutX 26912 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 27072 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))))) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata32 : 0<152546139 ∧ 22<128 ∧ 84<128 ∧ 0<4 ∧
    2416/4160=0 ∧ 2416%4160=2416 ∧ ∀ i, (leaves32 i).Valid 8 := by
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

noncomputable def phaseMass32 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw32 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass32_eq : phaseMass32 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass32
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw32 output32 cover32 source32
    (gridTreeUnionCheck_sound 32768 raw32 output32 cover32 source32 tree32 checked32)
    _ (by norm_num) _, areaUnits32]
  norm_num

-- Frozen phase 6029, atom 2888, type 0, source (28,88).
def leavesData33 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves33 : Fin 10 → DyadicLeaf := leavesData33.get
def raw33 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 28 88 leaves33 i
def outputData33 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7168,7232,22528,22592⟩) (.single ⟨7168,7232,22592,22656⟩)) (.node (.single ⟨7232,7296,22528,22592⟩) (.node (.single ⟨7232,7296,22592,22656⟩) (.single ⟨7168,7296,22656,22784⟩)))) (.node (.node (.single ⟨7296,7360,22528,22592⟩) (.single ⟨7296,7360,22592,22656⟩)) (.node (.single ⟨7360,7424,22528,22592⟩) (.node (.single ⟨7360,7424,22592,22656⟩) (.single ⟨7296,7424,22656,22784⟩))))) (.node (.node (.node (.single ⟨9984,10112,25344,25472⟩) (.single ⟨9984,10112,25472,25600⟩)) (.node (.single ⟨10112,10176,25344,25408⟩) (.node (.single ⟨10112,10176,25408,25472⟩) (.single ⟨10176,10240,25344,25408⟩)))) (.node (.node (.single ⟨10176,10240,25408,25472⟩) (.single ⟨10112,10176,25472,25536⟩)) (.node (.single ⟨10112,10176,25536,25600⟩) (.node (.single ⟨10176,10240,25472,25536⟩) (.single ⟨10176,10240,25536,25600⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22592,7168,7232⟩) (.single ⟨22528,22592,7232,7296⟩)) (.node (.single ⟨22592,22656,7168,7232⟩) (.node (.single ⟨22592,22656,7232,7296⟩) (.single ⟨22528,22592,7296,7360⟩)))) (.node (.node (.single ⟨22528,22592,7360,7424⟩) (.single ⟨22592,22656,7296,7360⟩)) (.node (.single ⟨22592,22656,7360,7424⟩) (.node (.single ⟨22656,22784,7168,7296⟩) (.single ⟨22656,22784,7296,7424⟩))))) (.node (.node (.node (.single ⟨25344,25472,9984,10112⟩) (.single ⟨25344,25408,10112,10176⟩)) (.node (.single ⟨25344,25408,10176,10240⟩) (.node (.single ⟨25408,25472,10112,10176⟩) (.single ⟨25408,25472,10176,10240⟩)))) (.node (.node (.single ⟨25472,25600,9984,10112⟩) (.single ⟨25472,25536,10112,10176⟩)) (.node (.single ⟨25472,25536,10176,10240⟩) (.node (.single ⟨25536,25600,10112,10176⟩) (.single ⟨25536,25600,10176,10240⟩)))))))
def output33 : Fin 40 → GridBox := outputData33.get
def coverData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData33 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover33 (i : Fin 40) : Fin 40 := ⟨coverData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def source33 (i : Fin 40) : Fin 40 := ⟨sourceData33.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree33 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 (.cutX 7424 (.cutY 22784 (.cutX 7296 (.cutY 22656 (.cutX 7232 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 7360 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 .empty (.cutX 9984 .empty (.cutY 25344 .empty (.cutX 10112 (.cutY 25472 .full .full) (.cutY 25472 (.cutX 10176 (.cutY 25408 .full .full) (.cutY 25408 .full .full)) (.cutX 10176 (.cutY 25536 .full .full) (.cutY 25536 .full .full)))))))) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 (.cutX 22784 (.cutY 7424 (.cutX 22656 (.cutY 7296 (.cutX 22592 (.cutY 7232 .full .full) (.cutY 7232 .full .full)) (.cutX 22592 (.cutY 7360 .full .full) (.cutY 7360 .full .full))) (.cutY 7296 .full .full)) .empty) .empty) .empty) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 .empty (.cutX 25344 .empty (.cutY 9984 .empty (.cutX 25472 (.cutY 10112 .full (.cutX 25408 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 25536 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))))))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata33 : 0<145899414 ∧ 28<128 ∧ 88<128 ∧ 0<4 ∧
    2888/4160=0 ∧ 2888%4160=2888 ∧ ∀ i, (leaves33 i).Valid 8 := by
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

noncomputable def phaseMass33 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw33 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass33_eq : phaseMass33 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass33
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw33 output33 cover33 source33
    (gridTreeUnionCheck_sound 32768 raw33 output33 cover33 source33 tree33 checked33)
    _ (by norm_num) _, areaUnits33]
  norm_num

-- Frozen phase 6030, atom 7505, type 1, source (35,90).
def leavesData34 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves34 : Fin 13 → DyadicLeaf := leavesData34.get
def raw34 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 35 90 leaves34 i
def outputData34 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8960,9024,23040,23104⟩) (.node (.single ⟨8960,9024,23104,23168⟩) (.single ⟨9024,9088,23040,23104⟩))) (.node (.single ⟨9024,9088,23104,23168⟩) (.node (.single ⟨8960,9088,23168,23296⟩) (.single ⟨9088,9152,23040,23104⟩)))) (.node (.node (.single ⟨9088,9152,23104,23168⟩) (.node (.single ⟨9152,9184,23040,23072⟩) (.single ⟨9152,9184,23072,23104⟩))) (.node (.node (.single ⟨9184,9216,23040,23072⟩) (.single ⟨9184,9216,23072,23104⟩)) (.node (.single ⟨9152,9216,23104,23168⟩) (.single ⟨9088,9216,23168,23296⟩))))) (.node (.node (.node (.single ⟨9472,9600,23552,23680⟩) (.node (.single ⟨9472,9600,23680,23808⟩) (.single ⟨9600,9664,23552,23616⟩))) (.node (.single ⟨9600,9664,23616,23680⟩) (.node (.single ⟨9664,9696,23552,23584⟩) (.single ⟨9664,9696,23584,23616⟩)))) (.node (.node (.single ⟨9696,9728,23552,23584⟩) (.node (.single ⟨9696,9728,23584,23616⟩) (.single ⟨9664,9728,23616,23680⟩))) (.node (.node (.single ⟨9600,9664,23680,23744⟩) (.single ⟨9600,9664,23744,23808⟩)) (.node (.single ⟨9664,9728,23680,23744⟩) (.single ⟨9664,9728,23744,23808⟩)))))) (.node (.node (.node (.node (.single ⟨23040,23104,8960,9024⟩) (.node (.single ⟨23040,23104,9024,9088⟩) (.single ⟨23104,23168,8960,9024⟩))) (.node (.single ⟨23104,23168,9024,9088⟩) (.node (.single ⟨23040,23104,9088,9152⟩) (.single ⟨23040,23072,9152,9184⟩)))) (.node (.node (.single ⟨23040,23072,9184,9216⟩) (.node (.single ⟨23072,23104,9152,9184⟩) (.single ⟨23072,23104,9184,9216⟩))) (.node (.node (.single ⟨23104,23168,9088,9152⟩) (.single ⟨23104,23168,9152,9216⟩)) (.node (.single ⟨23168,23296,8960,9088⟩) (.single ⟨23168,23296,9088,9216⟩))))) (.node (.node (.node (.single ⟨23552,23680,9472,9600⟩) (.node (.single ⟨23552,23616,9600,9664⟩) (.single ⟨23552,23584,9664,9696⟩))) (.node (.single ⟨23552,23584,9696,9728⟩) (.node (.single ⟨23584,23616,9664,9696⟩) (.single ⟨23584,23616,9696,9728⟩)))) (.node (.node (.single ⟨23616,23680,9600,9664⟩) (.node (.single ⟨23616,23680,9664,9728⟩) (.single ⟨23680,23808,9472,9600⟩))) (.node (.node (.single ⟨23680,23744,9600,9664⟩) (.single ⟨23680,23744,9664,9728⟩)) (.node (.single ⟨23744,23808,9600,9664⟩) (.single ⟨23744,23808,9664,9728⟩)))))))
def output34 : Fin 52 → GridBox := outputData34.get
def coverData34 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData34 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover34 (i : Fin 52) : Fin 52 := ⟨coverData34.get i % 52, Nat.mod_lt _ (by decide)⟩
def source34 (i : Fin 52) : Fin 52 := ⟨sourceData34.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree34 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 .empty (.cutY 23040 .empty (.cutX 8960 .empty (.cutY 23296 (.cutX 9088 (.cutY 23168 (.cutX 9024 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full) (.cutY 23168 (.cutX 9152 (.cutY 23104 .full .full) (.cutY 23104 (.cutX 9184 (.cutY 23072 .full .full) (.cutY 23072 .full .full)) .full)) .full)) .empty)))) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 (.cutX 9472 .empty (.cutY 23808 (.cutX 9600 (.cutY 23680 .full .full) (.cutY 23680 (.cutX 9664 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 9696 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) (.cutX 9664 (.cutY 23744 .full .full) (.cutY 23744 .full .full)))) .empty)) .empty) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 .empty (.cutX 23296 (.cutY 8960 .empty (.cutX 23168 (.cutY 9088 (.cutX 23104 (.cutY 9024 .full .full) (.cutY 9024 .full .full)) (.cutX 23104 (.cutY 9152 .full (.cutX 23072 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full .full))) .empty))) .empty) (.cutY 9216 .empty (.cutX 24064 (.cutY 9728 (.cutX 23808 (.cutY 9472 .empty (.cutX 23680 (.cutY 9600 .full (.cutX 23616 (.cutY 9664 .full (.cutX 23584 (.cutY 9696 .full .full) (.cutY 9696 .full .full))) (.cutY 9664 .full .full))) (.cutY 9600 .full (.cutX 23744 (.cutY 9664 .full .full) (.cutY 9664 .full .full))))) .empty) .empty) .empty))) .empty)) .empty))) .empty) .empty))

theorem metadata34 : 0<67962893 ∧ 35<128 ∧ 90<128 ∧ 1<4 ∧
    7505/4160=1 ∧ 7505%4160=3345 ∧ ∀ i, (leaves34 i).Valid 8 := by
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

noncomputable def phaseMass34 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw34 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass34_eq : phaseMass34 = (67962893/1638400000000 : ℝ) := by
  unfold phaseMass34
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw34 output34 cover34 source34
    (gridTreeUnionCheck_sound 32768 raw34 output34 cover34 source34 tree34 checked34)
    _ (by norm_num) _, areaUnits34]
  norm_num

-- Frozen phase 6031, atom 7563, type 1, source (36,91).
def leavesData35 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves35 : Fin 10 → DyadicLeaf := leavesData35.get
def raw35 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 36 91 leaves35 i
def outputData35 : FiniteInputTree GridBox 20 := (.node (.node (.node (.node (.single ⟨9216,9344,23296,23424⟩) (.single ⟨9216,9344,23424,23552⟩)) (.node (.single ⟨9344,9408,23296,23360⟩) (.node (.single ⟨9344,9408,23360,23424⟩) (.single ⟨9408,9440,23296,23328⟩)))) (.node (.node (.single ⟨9408,9440,23328,23360⟩) (.single ⟨9440,9472,23296,23328⟩)) (.node (.single ⟨9440,9472,23328,23360⟩) (.node (.single ⟨9408,9472,23360,23424⟩) (.single ⟨9344,9472,23424,23552⟩))))) (.node (.node (.node (.single ⟨23296,23424,9216,9344⟩) (.single ⟨23296,23360,9344,9408⟩)) (.node (.single ⟨23296,23328,9408,9440⟩) (.node (.single ⟨23296,23328,9440,9472⟩) (.single ⟨23328,23360,9408,9440⟩)))) (.node (.node (.single ⟨23328,23360,9440,9472⟩) (.single ⟨23360,23424,9344,9408⟩)) (.node (.single ⟨23360,23424,9408,9472⟩) (.node (.single ⟨23424,23552,9216,9344⟩) (.single ⟨23424,23552,9344,9472⟩))))))
def output35 : Fin 20 → GridBox := outputData35.get
def coverData35 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 10)) (.node (.single 19) (.node (.single 9) (.single 1)))) (.node (.node (.single 18) (.single 18)) (.node (.single 1) (.node (.single 9) (.single 19))))) (.node (.node (.node (.single 10) (.single 0)) (.node (.single 2) (.node (.single 11) (.single 17)))) (.node (.node (.single 8) (.single 3)) (.node (.single 16) (.node (.single 16) (.single 3)))))) (.node (.node (.node (.node (.single 8) (.single 17)) (.node (.single 11) (.node (.single 2) (.single 4)))) (.node (.node (.single 12) (.single 15)) (.node (.single 7) (.node (.single 5) (.single 14))))) (.node (.node (.node (.single 14) (.single 5)) (.node (.single 6) (.node (.single 13) (.single 13)))) (.node (.node (.single 6) (.single 7)) (.node (.single 15) (.node (.single 12) (.single 4)))))))
def sourceData35 : FiniteInputTree ℕ 20 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 27) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 26) (.single 17)) (.node (.single 14) (.node (.single 5) (.single 2))))))
def cover35 (i : Fin 40) : Fin 20 := ⟨coverData35.get i % 20, Nat.mod_lt _ (by decide)⟩
def source35 (i : Fin 20) : Fin 40 := ⟨sourceData35.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree35 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 .empty (.cutY 23552 (.cutX 9728 (.cutY 23040 .empty (.cutX 9472 (.cutY 23296 .empty (.cutX 9344 (.cutY 23424 .full .full) (.cutY 23424 (.cutX 9408 (.cutY 23360 .full .full) (.cutY 23360 (.cutX 9440 (.cutY 23328 .full .full) (.cutY 23328 .full .full)) .full)) .full))) .empty)) .empty) .empty))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 .empty (.cutX 23040 .empty (.cutY 9728 (.cutX 23296 .empty (.cutY 9472 (.cutX 23424 (.cutY 9344 .full (.cutX 23360 (.cutY 9408 .full (.cutX 23328 (.cutY 9440 .full .full) (.cutY 9440 .full .full))) (.cutY 9408 .full .full))) (.cutY 9344 .full .full)) .empty)) .empty))) .empty) .empty)) .empty))) .empty) .empty))

theorem metadata35 : 0<67962893 ∧ 36<128 ∧ 91<128 ∧ 1<4 ∧
    7563/4160=1 ∧ 7563%4160=3403 ∧ ∀ i, (leaves35 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData35).mp
    (by decide +kernel)

theorem sourceChecked35_0 : ∀ i : Fin 20,
    (fun i => output35 i = raw35 (source35 i)) (finOffset 20 0 20 (by decide) i) := by decide +kernel

theorem sourceChecked35 : ∀ i : Fin 20, (fun i => output35 i = raw35 (source35 i)) i :=
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

theorem areaUnits35 : gridUnionAreaUnits output35 = 131072 := by decide +kernel

noncomputable def phaseMass35 : ℝ := singlePhaseMass (67962893/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw35 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass35_eq : phaseMass35 = (67962893/3276800000000 : ℝ) := by
  unfold phaseMass35
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw35 output35 cover35 source35
    (gridTreeUnionCheck_sound 32768 raw35 output35 cover35 source35 tree35 checked35)
    _ (by norm_num) _, areaUnits35]
  norm_num

-- Frozen phase 6032, atom 6218, type 1, source (18,78).
def leavesData36 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.node (.single ⟨2,1,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨4,14,0⟩) (.single ⟨4,14,1⟩)) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩)))))
def leaves36 : Fin 16 → DyadicLeaf := leavesData36.get
def raw36 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 18 78 leaves36 i
def outputData36 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨4608,4672,19968,20032⟩) (.single ⟨4608,4672,20032,20096⟩)) (.node (.single ⟨4672,4736,19968,20032⟩) (.single ⟨4672,4736,20032,20096⟩))) (.node (.node (.single ⟨4608,4736,20096,20224⟩) (.single ⟨4736,4800,19968,20032⟩)) (.node (.single ⟨4736,4800,20032,20096⟩) (.single ⟨4800,4832,19968,20000⟩)))) (.node (.node (.node (.single ⟨4800,4832,20000,20032⟩) (.single ⟨4832,4848,19968,19984⟩)) (.node (.single ⟨4832,4848,19984,20000⟩) (.single ⟨4848,4864,19968,19984⟩))) (.node (.node (.single ⟨4848,4864,19984,20000⟩) (.single ⟨4832,4864,20000,20032⟩)) (.node (.single ⟨4800,4864,20032,20096⟩) (.single ⟨4736,4864,20096,20224⟩))))) (.node (.node (.node (.node (.single ⟨12544,12672,27904,28032⟩) (.single ⟨12544,12672,28032,28160⟩)) (.node (.single ⟨12672,12736,27904,27968⟩) (.single ⟨12672,12736,27968,28032⟩))) (.node (.node (.single ⟨12736,12768,27904,27936⟩) (.single ⟨12736,12768,27936,27968⟩)) (.node (.single ⟨12768,12784,27904,27920⟩) (.single ⟨12768,12784,27920,27936⟩)))) (.node (.node (.node (.single ⟨12784,12800,27904,27920⟩) (.single ⟨12784,12800,27920,27936⟩)) (.node (.single ⟨12768,12800,27936,27968⟩) (.single ⟨12736,12800,27968,28032⟩))) (.node (.node (.single ⟨12672,12736,28032,28096⟩) (.single ⟨12672,12736,28096,28160⟩)) (.node (.single ⟨12736,12800,28032,28096⟩) (.single ⟨12736,12800,28096,28160⟩)))))) (.node (.node (.node (.node (.node (.single ⟨19968,20032,4608,4672⟩) (.single ⟨19968,20032,4672,4736⟩)) (.node (.single ⟨20032,20096,4608,4672⟩) (.single ⟨20032,20096,4672,4736⟩))) (.node (.node (.single ⟨19968,20032,4736,4800⟩) (.single ⟨19968,20000,4800,4832⟩)) (.node (.single ⟨19968,19984,4832,4848⟩) (.single ⟨19968,19984,4848,4864⟩)))) (.node (.node (.node (.single ⟨19984,20000,4832,4848⟩) (.single ⟨19984,20000,4848,4864⟩)) (.node (.single ⟨20000,20032,4800,4832⟩) (.single ⟨20000,20032,4832,4864⟩))) (.node (.node (.single ⟨20032,20096,4736,4800⟩) (.single ⟨20032,20096,4800,4864⟩)) (.node (.single ⟨20096,20224,4608,4736⟩) (.single ⟨20096,20224,4736,4864⟩))))) (.node (.node (.node (.node (.single ⟨27904,28032,12544,12672⟩) (.single ⟨27904,27968,12672,12736⟩)) (.node (.single ⟨27904,27936,12736,12768⟩) (.single ⟨27904,27920,12768,12784⟩))) (.node (.node (.single ⟨27904,27920,12784,12800⟩) (.single ⟨27920,27936,12768,12784⟩)) (.node (.single ⟨27920,27936,12784,12800⟩) (.single ⟨27936,27968,12736,12768⟩)))) (.node (.node (.node (.single ⟨27936,27968,12768,12800⟩) (.single ⟨27968,28032,12672,12736⟩)) (.node (.single ⟨27968,28032,12736,12800⟩) (.single ⟨28032,28160,12544,12672⟩))) (.node (.node (.single ⟨28032,28096,12672,12736⟩) (.single ⟨28032,28096,12736,12800⟩)) (.node (.single ⟨28096,28160,12672,12736⟩) (.single ⟨28096,28160,12736,12800⟩)))))))
def output36 : Fin 64 → GridBox := outputData36.get
def coverData36 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 44)) (.node (.single 57) (.single 19))))) (.node (.node (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18))) (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31)))) (.node (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))) (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30)))))) (.node (.node (.node (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28))) (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26)))) (.node (.node (.node (.single 8) (.single 42)) (.node (.single 55) (.single 21))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 9) (.single 38)) (.node (.single 54) (.single 25))) (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23)))) (.node (.node (.node (.single 11) (.single 39)) (.node (.single 52) (.single 24))) (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22)))))))
def sourceData36 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 20) (.single 24)) (.node (.single 28) (.single 32))) (.node (.node (.single 0) (.single 8)) (.node (.single 12) (.single 36)))) (.node (.node (.node (.single 40) (.single 48)) (.node (.single 52) (.single 56))) (.node (.node (.single 60) (.single 44)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 19) (.single 15))) (.node (.node (.single 47) (.single 43)) (.node (.single 63) (.single 55)))) (.node (.node (.node (.single 59) (.single 51)) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.node (.single 21) (.single 29)) (.node (.single 25) (.single 33))) (.node (.node (.single 9) (.single 37)) (.node (.single 49) (.single 57)))) (.node (.node (.node (.single 53) (.single 61)) (.node (.single 41) (.single 45))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 18)) (.node (.single 46) (.single 62))) (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 42)))) (.node (.node (.node (.single 38) (.single 14)) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover36 (i : Fin 64) : Fin 64 := ⟨coverData36.get i % 64, Nat.mod_lt _ (by decide)⟩
def source36 (i : Fin 64) : Fin 64 := ⟨sourceData36.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree36 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 .empty (.cutY 19968 .empty (.cutX 4864 (.cutY 20224 (.cutX 4736 (.cutY 20096 (.cutX 4672 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 4800 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 4832 (.cutY 20000 .full .full) (.cutY 20000 (.cutX 4848 (.cutY 19984 .full .full) (.cutY 19984 .full .full)) .full)) .full)) .full)) .empty) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 (.cutX 12544 .empty (.cutY 27904 .empty (.cutX 12672 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 12736 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 12768 (.cutY 27936 .full .full) (.cutY 27936 (.cutX 12784 (.cutY 27920 .full .full) (.cutY 27920 .full .full)) .full)) .full)) (.cutX 12736 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 .empty (.cutX 20224 (.cutY 4864 (.cutX 20096 (.cutY 4736 (.cutX 20032 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 20032 (.cutY 4800 .full (.cutX 20000 (.cutY 4832 .full (.cutX 19984 (.cutY 4848 .full .full) (.cutY 4848 .full .full))) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty))) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 (.cutY 12800 (.cutX 27904 .empty (.cutY 12544 .empty (.cutX 28032 (.cutY 12672 .full (.cutX 27968 (.cutY 12736 .full (.cutX 27936 (.cutY 12768 .full (.cutX 27920 (.cutY 12784 .full .full) (.cutY 12784 .full .full))) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 28096 (.cutY 12736 .full .full) (.cutY 12736 .full .full)))))) .empty) .empty) .empty)) .empty))) .empty))) .empty))

theorem metadata36 : 0<157738472 ∧ 18<128 ∧ 78<128 ∧ 1<4 ∧
    6218/4160=1 ∧ 6218%4160=2058 ∧ ∀ i, (leaves36 i).Valid 8 := by
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

noncomputable def phaseMass36 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw36 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass36_eq : phaseMass36 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass36
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw36 output36 cover36 source36
    (gridTreeUnionCheck_sound 32768 raw36 output36 cover36 source36 tree36 checked36)
    _ (by norm_num) _, areaUnits36]
  norm_num

-- Frozen phase 6033, atom 1254, type 0, source (10,74).
def leavesData37 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves37 : Fin 7 → DyadicLeaf := leavesData37.get
def raw37 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 74 leaves37 i
def outputData37 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,18944,19072⟩) (.node (.single ⟨2560,2688,19072,19200⟩) (.single ⟨2688,2752,18944,19008⟩))) (.node (.node (.single ⟨2688,2752,19008,19072⟩) (.single ⟨2752,2816,18944,19008⟩)) (.node (.single ⟨2752,2816,19008,19072⟩) (.single ⟨2688,2816,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,29952,30080⟩) (.node (.single ⟨13568,13696,30080,30208⟩) (.single ⟨13696,13760,29952,30016⟩))) (.node (.node (.single ⟨13696,13760,30016,30080⟩) (.single ⟨13760,13824,29952,30016⟩)) (.node (.single ⟨13760,13824,30016,30080⟩) (.single ⟨13696,13824,30080,30208⟩))))) (.node (.node (.node (.single ⟨18944,19072,2560,2688⟩) (.node (.single ⟨18944,19008,2688,2752⟩) (.single ⟨18944,19008,2752,2816⟩))) (.node (.node (.single ⟨19008,19072,2688,2752⟩) (.single ⟨19008,19072,2752,2816⟩)) (.node (.single ⟨19072,19200,2560,2688⟩) (.single ⟨19072,19200,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,13568,13696⟩) (.node (.single ⟨29952,30016,13696,13760⟩) (.single ⟨29952,30016,13760,13824⟩))) (.node (.node (.single ⟨30016,30080,13696,13760⟩) (.single ⟨30016,30080,13760,13824⟩)) (.node (.single ⟨30080,30208,13568,13696⟩) (.single ⟨30080,30208,13696,13824⟩))))))
def output37 : Fin 28 → GridBox := outputData37.get
def coverData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData37 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover37 (i : Fin 28) : Fin 28 := ⟨coverData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def source37 (i : Fin 28) : Fin 28 := ⟨sourceData37.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree37 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 .empty (.cutX 2816 (.cutY 19200 (.cutX 2688 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 2752 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 (.cutX 13568 .empty (.cutY 29952 .empty (.cutX 13696 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 13760 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 .empty (.cutX 19200 (.cutY 2816 (.cutX 19072 (.cutY 2688 .full (.cutX 19008 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty))) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 (.cutX 29952 .empty (.cutY 13568 .empty (.cutX 30080 (.cutY 13696 .full (.cutX 30016 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full)))) .empty) .empty))) .empty) .empty))))) .empty))

theorem metadata37 : 0<48363413 ∧ 10<128 ∧ 74<128 ∧ 0<4 ∧
    1254/4160=0 ∧ 1254%4160=1254 ∧ ∀ i, (leaves37 i).Valid 8 := by
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

noncomputable def phaseMass37 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw37 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass37_eq : phaseMass37 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass37
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw37 output37 cover37 source37
    (gridTreeUnionCheck_sound 32768 raw37 output37 cover37 source37 tree37 checked37)
    _ (by norm_num) _, areaUnits37]
  norm_num

-- Frozen phase 6034, atom 6310, type 1, source (19,79).
def leavesData38 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves38 : Fin 13 → DyadicLeaf := leavesData38.get
def raw38 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 19 79 leaves38 i
def outputData38 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4864,4928,20224,20288⟩) (.node (.single ⟨4864,4928,20288,20352⟩) (.single ⟨4928,4992,20224,20288⟩))) (.node (.single ⟨4928,4992,20288,20352⟩) (.node (.single ⟨4864,4992,20352,20480⟩) (.single ⟨4992,5056,20224,20288⟩)))) (.node (.node (.single ⟨4992,5056,20288,20352⟩) (.node (.single ⟨5056,5088,20224,20256⟩) (.single ⟨5056,5088,20256,20288⟩))) (.node (.node (.single ⟨5088,5120,20224,20256⟩) (.single ⟨5088,5120,20256,20288⟩)) (.node (.single ⟨5056,5120,20288,20352⟩) (.single ⟨4992,5120,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,27648,27776⟩) (.node (.single ⟨12288,12416,27776,27904⟩) (.single ⟨12416,12480,27648,27712⟩))) (.node (.single ⟨12416,12480,27712,27776⟩) (.node (.single ⟨12480,12512,27648,27680⟩) (.single ⟨12480,12512,27680,27712⟩)))) (.node (.node (.single ⟨12512,12544,27648,27680⟩) (.node (.single ⟨12512,12544,27680,27712⟩) (.single ⟨12480,12544,27712,27776⟩))) (.node (.node (.single ⟨12416,12480,27776,27840⟩) (.single ⟨12416,12480,27840,27904⟩)) (.node (.single ⟨12480,12544,27776,27840⟩) (.single ⟨12480,12544,27840,27904⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,4864,4928⟩) (.node (.single ⟨20224,20288,4928,4992⟩) (.single ⟨20288,20352,4864,4928⟩))) (.node (.single ⟨20288,20352,4928,4992⟩) (.node (.single ⟨20224,20288,4992,5056⟩) (.single ⟨20224,20256,5056,5088⟩)))) (.node (.node (.single ⟨20224,20256,5088,5120⟩) (.node (.single ⟨20256,20288,5056,5088⟩) (.single ⟨20256,20288,5088,5120⟩))) (.node (.node (.single ⟨20288,20352,4992,5056⟩) (.single ⟨20288,20352,5056,5120⟩)) (.node (.single ⟨20352,20480,4864,4992⟩) (.single ⟨20352,20480,4992,5120⟩))))) (.node (.node (.node (.single ⟨27648,27776,12288,12416⟩) (.node (.single ⟨27648,27712,12416,12480⟩) (.single ⟨27648,27680,12480,12512⟩))) (.node (.single ⟨27648,27680,12512,12544⟩) (.node (.single ⟨27680,27712,12480,12512⟩) (.single ⟨27680,27712,12512,12544⟩)))) (.node (.node (.single ⟨27712,27776,12416,12480⟩) (.node (.single ⟨27712,27776,12480,12544⟩) (.single ⟨27776,27904,12288,12416⟩))) (.node (.node (.single ⟨27776,27840,12416,12480⟩) (.single ⟨27776,27840,12480,12544⟩)) (.node (.single ⟨27840,27904,12416,12480⟩) (.single ⟨27840,27904,12480,12544⟩)))))))
def output38 : Fin 52 → GridBox := outputData38.get
def coverData38 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData38 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover38 (i : Fin 52) : Fin 52 := ⟨coverData38.get i % 52, Nat.mod_lt _ (by decide)⟩
def source38 (i : Fin 52) : Fin 52 := ⟨sourceData38.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree38 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 .empty (.cutY 19968 .empty (.cutX 4864 .empty (.cutY 20224 .empty (.cutX 4992 (.cutY 20352 (.cutX 4928 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 5056 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 5088 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))))))) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 (.cutX 12544 (.cutY 27904 (.cutX 12416 (.cutY 27776 .full .full) (.cutY 27776 (.cutX 12480 (.cutY 27712 .full .full) (.cutY 27712 (.cutX 12512 (.cutY 27680 .full .full) (.cutY 27680 .full .full)) .full)) (.cutX 12480 (.cutY 27840 .full .full) (.cutY 27840 .full .full)))) .empty) .empty) .empty) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 .empty (.cutX 20224 .empty (.cutY 4864 .empty (.cutX 20352 (.cutY 4992 (.cutX 20288 (.cutY 4928 .full .full) (.cutY 4928 .full .full)) (.cutX 20288 (.cutY 5056 .full (.cutX 20256 (.cutY 5088 .full .full) (.cutY 5088 .full .full))) (.cutY 5056 .full .full))) (.cutY 4992 .full .full)))))) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 (.cutY 12800 (.cutX 27904 (.cutY 12544 (.cutX 27776 (.cutY 12416 .full (.cutX 27712 (.cutY 12480 .full (.cutX 27680 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 27840 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty) .empty) .empty) .empty) .empty)) .empty))) .empty))) .empty))

theorem metadata38 : 0<157738472 ∧ 19<128 ∧ 79<128 ∧ 1<4 ∧
    6310/4160=1 ∧ 6310%4160=2150 ∧ ∀ i, (leaves38 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData38).mp
    (by decide +kernel)

theorem sourceChecked38_0 : ∀ i : Fin 52,
    (fun i => output38 i = raw38 (source38 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked38 : ∀ i : Fin 52, (fun i => output38 i = raw38 (source38 i)) i :=
  forallFin_of_zero_offset (fun i => output38 i = raw38 (source38 i)) sourceChecked38_0

theorem coverChecked38_0 : ∀ i : Fin 52,
    (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked38 : ∀ i : Fin 52, (fun i => (output38 (cover38 i)).ContainsBox (raw38 i)) i :=
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

noncomputable def phaseMass38 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw38 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass38_eq : phaseMass38 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass38
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw38 output38 cover38 source38
    (gridTreeUnionCheck_sound 32768 raw38 output38 cover38 source38 tree38 checked38)
    _ (by norm_num) _, areaUnits38]
  norm_num

-- Frozen phase 6035, atom 446, type 0, source (3,71).
def leavesData39 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves39 : Fin 10 → DyadicLeaf := leavesData39.get
def raw39 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 3 71 leaves39 i
def outputData39 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨768,832,18176,18240⟩) (.single ⟨768,832,18240,18304⟩)) (.node (.single ⟨832,896,18176,18240⟩) (.node (.single ⟨832,896,18240,18304⟩) (.single ⟨768,896,18304,18432⟩)))) (.node (.node (.single ⟨896,960,18176,18240⟩) (.single ⟨896,960,18240,18304⟩)) (.node (.single ⟨960,1024,18176,18240⟩) (.node (.single ⟨960,1024,18240,18304⟩) (.single ⟨896,1024,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,31744,31872⟩) (.single ⟨14336,14464,31872,32000⟩)) (.node (.single ⟨14464,14528,31744,31808⟩) (.node (.single ⟨14464,14528,31808,31872⟩) (.single ⟨14528,14592,31744,31808⟩)))) (.node (.node (.single ⟨14528,14592,31808,31872⟩) (.single ⟨14464,14528,31872,31936⟩)) (.node (.single ⟨14464,14528,31936,32000⟩) (.node (.single ⟨14528,14592,31872,31936⟩) (.single ⟨14528,14592,31936,32000⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,768,832⟩) (.single ⟨18176,18240,832,896⟩)) (.node (.single ⟨18240,18304,768,832⟩) (.node (.single ⟨18240,18304,832,896⟩) (.single ⟨18176,18240,896,960⟩)))) (.node (.node (.single ⟨18176,18240,960,1024⟩) (.single ⟨18240,18304,896,960⟩)) (.node (.single ⟨18240,18304,960,1024⟩) (.node (.single ⟨18304,18432,768,896⟩) (.single ⟨18304,18432,896,1024⟩))))) (.node (.node (.node (.single ⟨31744,31872,14336,14464⟩) (.single ⟨31744,31808,14464,14528⟩)) (.node (.single ⟨31744,31808,14528,14592⟩) (.node (.single ⟨31808,31872,14464,14528⟩) (.single ⟨31808,31872,14528,14592⟩)))) (.node (.node (.single ⟨31872,32000,14336,14464⟩) (.single ⟨31872,31936,14464,14528⟩)) (.node (.single ⟨31872,31936,14528,14592⟩) (.node (.single ⟨31936,32000,14464,14528⟩) (.single ⟨31936,32000,14528,14592⟩)))))))
def output39 : Fin 40 → GridBox := outputData39.get
def coverData39 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData39 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover39 (i : Fin 40) : Fin 40 := ⟨coverData39.get i % 40, Nat.mod_lt _ (by decide)⟩
def source39 (i : Fin 40) : Fin 40 := ⟨sourceData39.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree39 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 .empty (.cutY 18176 .empty (.cutX 896 (.cutY 18304 (.cutX 832 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 960 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 (.cutY 32000 (.cutX 14464 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 14528 (.cutY 31808 .full .full) (.cutY 31808 .full .full)) (.cutX 14528 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty) .empty) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 .empty (.cutY 768 .empty (.cutX 18304 (.cutY 896 (.cutX 18240 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 18240 (.cutY 960 .full .full) (.cutY 960 .full .full))) (.cutY 896 .full .full)))))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 (.cutY 14592 (.cutX 31872 (.cutY 14464 .full (.cutX 31808 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 31936 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty) .empty) .empty)))))))) .empty))

theorem metadata39 : 0<114037843 ∧ 3<128 ∧ 71<128 ∧ 0<4 ∧
    446/4160=0 ∧ 446%4160=446 ∧ ∀ i, (leaves39 i).Valid 8 := by
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

noncomputable def phaseMass39 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw39 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass39_eq : phaseMass39 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass39
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw39 output39 cover39 source39
    (gridTreeUnionCheck_sound 32768 raw39 output39 cover39 source39 tree39 checked39)
    _ (by norm_num) _, areaUnits39]
  norm_num

-- Frozen phase 6036, atom 197, type 0, source (1,70).
def leavesData40 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩))) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)))) (.node (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩))) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves40 : Fin 22 → DyadicLeaf := leavesData40.get
def raw40 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 1 70 leaves40 i
def outputData40 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨256,320,17920,17984⟩) (.single ⟨256,320,17984,18048⟩)) (.node (.single ⟨320,384,17920,17984⟩) (.node (.single ⟨320,384,17984,18048⟩) (.single ⟨256,384,18048,18176⟩)))) (.node (.node (.single ⟨384,416,17920,17952⟩) (.node (.single ⟨384,416,17952,17984⟩) (.single ⟨416,448,17920,17952⟩))) (.node (.single ⟨416,448,17952,17984⟩) (.node (.single ⟨384,448,17984,18048⟩) (.single ⟨448,480,17920,17952⟩))))) (.node (.node (.node (.single ⟨448,480,17952,17984⟩) (.single ⟨480,496,17920,17936⟩)) (.node (.single ⟨480,496,17936,17952⟩) (.node (.single ⟨496,512,17920,17936⟩) (.single ⟨496,512,17936,17952⟩)))) (.node (.node (.single ⟨480,512,17952,17984⟩) (.node (.single ⟨448,512,17984,18048⟩) (.single ⟨384,448,18048,18112⟩))) (.node (.single ⟨384,448,18112,18176⟩) (.node (.single ⟨448,512,18048,18112⟩) (.single ⟨448,512,18112,18176⟩)))))) (.node (.node (.node (.node (.single ⟨14592,14656,32256,32320⟩) (.single ⟨14592,14656,32320,32384⟩)) (.node (.single ⟨14656,14720,32256,32320⟩) (.node (.single ⟨14656,14720,32320,32384⟩) (.single ⟨14592,14720,32384,32512⟩)))) (.node (.node (.single ⟨14720,14784,32256,32320⟩) (.node (.single ⟨14720,14784,32320,32384⟩) (.single ⟨14784,14816,32256,32288⟩))) (.node (.single ⟨14784,14816,32288,32320⟩) (.node (.single ⟨14816,14832,32256,32272⟩) (.single ⟨14816,14832,32272,32288⟩))))) (.node (.node (.node (.single ⟨14832,14848,32256,32272⟩) (.single ⟨14832,14848,32272,32288⟩)) (.node (.single ⟨14816,14848,32288,32320⟩) (.node (.single ⟨14784,14816,32320,32352⟩) (.single ⟨14784,14816,32352,32384⟩)))) (.node (.node (.single ⟨14816,14848,32320,32352⟩) (.node (.single ⟨14816,14848,32352,32384⟩) (.single ⟨14720,14784,32384,32448⟩))) (.node (.single ⟨14720,14784,32448,32512⟩) (.node (.single ⟨14784,14848,32384,32448⟩) (.single ⟨14784,14848,32448,32512⟩))))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,256,320⟩) (.single ⟨17920,17984,320,384⟩)) (.node (.single ⟨17984,18048,256,320⟩) (.node (.single ⟨17984,18048,320,384⟩) (.single ⟨17920,17952,384,416⟩)))) (.node (.node (.single ⟨17920,17952,416,448⟩) (.node (.single ⟨17952,17984,384,416⟩) (.single ⟨17952,17984,416,448⟩))) (.node (.single ⟨17920,17952,448,480⟩) (.node (.single ⟨17920,17936,480,496⟩) (.single ⟨17920,17936,496,512⟩))))) (.node (.node (.node (.single ⟨17936,17952,480,496⟩) (.single ⟨17936,17952,496,512⟩)) (.node (.single ⟨17952,17984,448,480⟩) (.node (.single ⟨17952,17984,480,512⟩) (.single ⟨17984,18048,384,448⟩)))) (.node (.node (.single ⟨17984,18048,448,512⟩) (.node (.single ⟨18048,18176,256,384⟩) (.single ⟨18048,18112,384,448⟩))) (.node (.single ⟨18048,18112,448,512⟩) (.node (.single ⟨18112,18176,384,448⟩) (.single ⟨18112,18176,448,512⟩)))))) (.node (.node (.node (.node (.single ⟨32256,32320,14592,14656⟩) (.single ⟨32256,32320,14656,14720⟩)) (.node (.single ⟨32320,32384,14592,14656⟩) (.node (.single ⟨32320,32384,14656,14720⟩) (.single ⟨32256,32320,14720,14784⟩)))) (.node (.node (.single ⟨32256,32288,14784,14816⟩) (.node (.single ⟨32256,32272,14816,14832⟩) (.single ⟨32256,32272,14832,14848⟩))) (.node (.single ⟨32272,32288,14816,14832⟩) (.node (.single ⟨32272,32288,14832,14848⟩) (.single ⟨32288,32320,14784,14816⟩))))) (.node (.node (.node (.single ⟨32288,32320,14816,14848⟩) (.single ⟨32320,32384,14720,14784⟩)) (.node (.single ⟨32320,32352,14784,14816⟩) (.node (.single ⟨32320,32352,14816,14848⟩) (.single ⟨32352,32384,14784,14816⟩)))) (.node (.node (.single ⟨32352,32384,14816,14848⟩) (.node (.single ⟨32384,32512,14592,14720⟩) (.single ⟨32384,32448,14720,14784⟩))) (.node (.single ⟨32384,32448,14784,14848⟩) (.node (.single ⟨32448,32512,14720,14784⟩) (.single ⟨32448,32512,14784,14848⟩))))))))
def output40 : Fin 88 → GridBox := outputData40.get
def coverData40 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 61)) (.node (.single 83) (.node (.single 26) (.single 0)))) (.node (.node (.single 44) (.node (.single 87) (.single 43))) (.node (.single 1) (.node (.single 46) (.single 86))))) (.node (.node (.node (.single 41) (.single 2)) (.node (.single 45) (.node (.single 85) (.single 42)))) (.node (.node (.single 3) (.node (.single 47) (.single 84))) (.node (.single 40) (.node (.single 9) (.single 59)))))) (.node (.node (.node (.node (.single 78) (.single 28)) (.node (.single 17) (.node (.single 60) (.single 70)))) (.node (.node (.single 27) (.node (.single 18) (.single 62))) (.node (.single 69) (.node (.single 25) (.single 19))))) (.node (.node (.node (.single 64) (.single 68)) (.node (.single 23) (.node (.single 20) (.single 63)))) (.node (.node (.single 67) (.node (.single 24) (.single 21))) (.node (.single 65) (.node (.single 66) (.single 22))))))) (.node (.node (.node (.node (.node (.single 10) (.single 52)) (.node (.single 77) (.node (.single 35) (.single 11)))) (.node (.node (.single 57) (.node (.single 76) (.single 30))) (.node (.single 16) (.node (.single 58) (.single 71))))) (.node (.node (.node (.single 29) (.single 5)) (.node (.single 48) (.node (.single 82) (.single 39)))) (.node (.node (.single 6) (.node (.single 50) (.single 81))) (.node (.single 37) (.node (.single 7) (.single 49)))))) (.node (.node (.node (.node (.single 80) (.single 38)) (.node (.single 8) (.node (.single 51) (.single 79)))) (.node (.node (.single 36) (.node (.single 12) (.single 53))) (.node (.single 75) (.node (.single 34) (.single 13))))) (.node (.node (.node (.single 55) (.single 74)) (.node (.single 32) (.node (.single 14) (.single 54)))) (.node (.node (.single 73) (.node (.single 33) (.single 15))) (.node (.single 56) (.node (.single 72) (.single 31))))))))
def sourceData40 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.node (.single 16) (.single 0)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 68) (.node (.single 20) (.single 44))))) (.node (.node (.node (.single 48) (.single 72)) (.node (.single 76) (.node (.single 80) (.single 84)))) (.node (.node (.single 52) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.node (.single 31) (.single 3)))) (.node (.node (.single 27) (.node (.single 23) (.single 55))) (.node (.single 51) (.node (.single 87) (.single 79))))) (.node (.node (.node (.single 83) (.single 75)) (.node (.single 47) (.node (.single 71) (.single 63)))) (.node (.node (.single 67) (.node (.single 59) (.single 19))) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.node (.single 17) (.single 57)))) (.node (.node (.single 65) (.node (.single 61) (.single 69))) (.node (.single 45) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 49) (.node (.single 53) (.single 21)))) (.node (.node (.single 25) (.node (.single 1) (.single 29))) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 54) (.node (.single 86) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 50))))) (.node (.node (.node (.single 46) (.single 22)) (.node (.single 70) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 2) (.single 18))) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover40 (i : Fin 88) : Fin 88 := ⟨coverData40.get i % 88, Nat.mod_lt _ (by decide)⟩
def source40 (i : Fin 88) : Fin 88 := ⟨sourceData40.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree40 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 .empty (.cutY 18176 (.cutX 384 (.cutY 18048 (.cutX 320 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 448 (.cutY 17984 (.cutX 416 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 480 (.cutY 17952 .full .full) (.cutY 17952 (.cutX 496 (.cutY 17936 .full .full) (.cutY 17936 .full .full)) .full)) .full)) (.cutX 448 (.cutY 18112 .full .full) (.cutY 18112 .full .full)))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 .empty (.cutY 32512 (.cutX 14720 (.cutY 32384 (.cutX 14656 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full) (.cutY 32384 (.cutX 14784 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 14816 (.cutY 32288 .full .full) (.cutY 32288 (.cutX 14832 (.cutY 32272 .full .full) (.cutY 32272 .full .full)) .full)) (.cutX 14816 (.cutY 32352 .full .full) (.cutY 32352 .full .full)))) (.cutX 14784 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty))) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 (.cutY 256 .empty (.cutX 18048 (.cutY 384 (.cutX 17984 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17984 (.cutY 448 (.cutX 17952 (.cutY 416 .full .full) (.cutY 416 .full .full)) (.cutX 17952 (.cutY 480 .full (.cutX 17936 (.cutY 496 .full .full) (.cutY 496 .full .full))) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full (.cutX 18112 (.cutY 448 .full .full) (.cutY 448 .full .full))))) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 (.cutY 14592 .empty (.cutX 32384 (.cutY 14720 (.cutX 32320 (.cutY 14656 .full .full) (.cutY 14656 .full .full)) (.cutX 32320 (.cutY 14784 .full (.cutX 32288 (.cutY 14816 .full (.cutX 32272 (.cutY 14832 .full .full) (.cutY 14832 .full .full))) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 32352 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 32448 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty)) .empty)))))))) .empty))

theorem metadata40 : 0<114037843 ∧ 1<128 ∧ 70<128 ∧ 0<4 ∧
    197/4160=0 ∧ 197%4160=197 ∧ ∀ i, (leaves40 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData40).mp
    (by decide +kernel)

theorem sourceChecked40_0 : ∀ i : Fin 64,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked40_64 : ∀ i : Fin 24,
    (fun i => output40 i = raw40 (source40 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked40 : ∀ i : Fin 88, (fun i => output40 i = raw40 (source40 i)) i :=
  forallFin_of_zero_offset (fun i => output40 i = raw40 (source40 i)) (forallFinOffset_add (fun i => output40 i = raw40 (source40 i)) 0 64 24 (by decide) sourceChecked40_0
    sourceChecked40_64)

theorem coverChecked40_0 : ∀ i : Fin 64,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked40_64 : ∀ i : Fin 24,
    (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked40 : ∀ i : Fin 88, (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) i :=
  forallFin_of_zero_offset (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) (forallFinOffset_add (fun i => (output40 (cover40 i)).ContainsBox (raw40 i)) 0 64 24 (by decide) coverChecked40_0
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

noncomputable def phaseMass40 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw40 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass40_eq : phaseMass40 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass40
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw40 output40 cover40 source40
    (gridTreeUnionCheck_sound 32768 raw40 output40 cover40 source40 tree40 checked40)
    _ (by norm_num) _, areaUnits40]
  norm_num

-- Frozen phase 6037, atom 5191, type 1, source (8,71).
def leavesData41 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves41 : Fin 10 → DyadicLeaf := leavesData41.get
def raw41 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 8 71 leaves41 i
def outputData41 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨2048,2112,18176,18240⟩) (.single ⟨2048,2112,18240,18304⟩)) (.node (.single ⟨2112,2176,18176,18240⟩) (.node (.single ⟨2112,2176,18240,18304⟩) (.single ⟨2048,2176,18304,18432⟩)))) (.node (.node (.single ⟨2176,2240,18176,18240⟩) (.single ⟨2176,2240,18240,18304⟩)) (.node (.single ⟨2240,2304,18176,18240⟩) (.node (.single ⟨2240,2304,18240,18304⟩) (.single ⟨2176,2304,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30464,30592⟩) (.single ⟨14336,14464,30592,30720⟩)) (.node (.single ⟨14464,14528,30464,30528⟩) (.node (.single ⟨14464,14528,30528,30592⟩) (.single ⟨14528,14592,30464,30528⟩)))) (.node (.node (.single ⟨14528,14592,30528,30592⟩) (.single ⟨14464,14528,30592,30656⟩)) (.node (.single ⟨14464,14528,30656,30720⟩) (.node (.single ⟨14528,14592,30592,30656⟩) (.single ⟨14528,14592,30656,30720⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,2048,2112⟩) (.single ⟨18176,18240,2112,2176⟩)) (.node (.single ⟨18240,18304,2048,2112⟩) (.node (.single ⟨18240,18304,2112,2176⟩) (.single ⟨18176,18240,2176,2240⟩)))) (.node (.node (.single ⟨18176,18240,2240,2304⟩) (.single ⟨18240,18304,2176,2240⟩)) (.node (.single ⟨18240,18304,2240,2304⟩) (.node (.single ⟨18304,18432,2048,2176⟩) (.single ⟨18304,18432,2176,2304⟩))))) (.node (.node (.node (.single ⟨30464,30592,14336,14464⟩) (.single ⟨30464,30528,14464,14528⟩)) (.node (.single ⟨30464,30528,14528,14592⟩) (.node (.single ⟨30528,30592,14464,14528⟩) (.single ⟨30528,30592,14528,14592⟩)))) (.node (.node (.single ⟨30592,30720,14336,14464⟩) (.single ⟨30592,30656,14464,14528⟩)) (.node (.single ⟨30592,30656,14528,14592⟩) (.node (.single ⟨30656,30720,14464,14528⟩) (.single ⟨30656,30720,14528,14592⟩)))))))
def output41 : Fin 40 → GridBox := outputData41.get
def coverData41 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData41 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover41 (i : Fin 40) : Fin 40 := ⟨coverData41.get i % 40, Nat.mod_lt _ (by decide)⟩
def source41 (i : Fin 40) : Fin 40 := ⟨sourceData41.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree41 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 (.cutX 3072 (.cutY 17408 .empty (.cutX 2560 (.cutY 17920 .empty (.cutX 2304 (.cutY 18176 .empty (.cutX 2176 (.cutY 18304 (.cutX 2112 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 2240 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 (.cutX 15360 (.cutY 29696 .empty (.cutX 14848 (.cutY 30208 .empty (.cutX 14592 (.cutY 30464 .empty (.cutX 14464 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14528 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) (.cutX 14528 (.cutY 30656 .full .full) (.cutY 30656 .full .full))))) .empty)) .empty)) .empty) .empty))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 .empty (.cutX 17408 .empty (.cutY 3072 (.cutX 17920 .empty (.cutY 2560 (.cutX 18176 .empty (.cutY 2304 (.cutX 18304 (.cutY 2176 (.cutX 18240 (.cutY 2112 .full .full) (.cutY 2112 .full .full)) (.cutX 18240 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty)) .empty))) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 .empty (.cutX 29696 .empty (.cutY 15360 (.cutX 30208 .empty (.cutY 14848 (.cutX 30464 .empty (.cutY 14592 (.cutX 30592 (.cutY 14464 .full (.cutX 30528 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 30656 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty)) .empty))) .empty))))) .empty))

theorem metadata41 : 0<135229957 ∧ 8<128 ∧ 71<128 ∧ 1<4 ∧
    5191/4160=1 ∧ 5191%4160=1031 ∧ ∀ i, (leaves41 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData41).mp
    (by decide +kernel)

theorem sourceChecked41_0 : ∀ i : Fin 40,
    (fun i => output41 i = raw41 (source41 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked41 : ∀ i : Fin 40, (fun i => output41 i = raw41 (source41 i)) i :=
  forallFin_of_zero_offset (fun i => output41 i = raw41 (source41 i)) sourceChecked41_0

theorem coverChecked41_0 : ∀ i : Fin 40,
    (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked41 : ∀ i : Fin 40, (fun i => (output41 (cover41 i)).ContainsBox (raw41 i)) i :=
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

noncomputable def phaseMass41 : ℝ := singlePhaseMass (135229957/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw41 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass41_eq : phaseMass41 = (135229957/1638400000000 : ℝ) := by
  unfold phaseMass41
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw41 output41 cover41 source41
    (gridTreeUnionCheck_sound 32768 raw41 output41 cover41 source41 tree41 checked41)
    _ (by norm_num) _, areaUnits41]
  norm_num

-- Frozen phase 6038, atom 323, type 0, source (2,71).
def leavesData42 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves42 : Fin 7 → DyadicLeaf := leavesData42.get
def raw42 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 2 71 leaves42 i
def outputData42 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨512,640,18176,18304⟩) (.node (.single ⟨512,640,18304,18432⟩) (.single ⟨640,704,18176,18240⟩))) (.node (.node (.single ⟨640,704,18240,18304⟩) (.single ⟨704,768,18176,18240⟩)) (.node (.single ⟨704,768,18240,18304⟩) (.single ⟨640,768,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,32000,32128⟩) (.node (.single ⟨14336,14464,32128,32256⟩) (.single ⟨14464,14528,32000,32064⟩))) (.node (.node (.single ⟨14464,14528,32064,32128⟩) (.single ⟨14528,14592,32000,32064⟩)) (.node (.single ⟨14528,14592,32064,32128⟩) (.single ⟨14464,14592,32128,32256⟩))))) (.node (.node (.node (.single ⟨18176,18304,512,640⟩) (.node (.single ⟨18176,18240,640,704⟩) (.single ⟨18176,18240,704,768⟩))) (.node (.node (.single ⟨18240,18304,640,704⟩) (.single ⟨18240,18304,704,768⟩)) (.node (.single ⟨18304,18432,512,640⟩) (.single ⟨18304,18432,640,768⟩)))) (.node (.node (.single ⟨32000,32128,14336,14464⟩) (.node (.single ⟨32000,32064,14464,14528⟩) (.single ⟨32000,32064,14528,14592⟩))) (.node (.node (.single ⟨32064,32128,14464,14528⟩) (.single ⟨32064,32128,14528,14592⟩)) (.node (.single ⟨32128,32256,14336,14464⟩) (.single ⟨32128,32256,14464,14592⟩))))))
def output42 : Fin 28 → GridBox := outputData42.get
def coverData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData42 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover42 (i : Fin 28) : Fin 28 := ⟨coverData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def source42 (i : Fin 28) : Fin 28 := ⟨sourceData42.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree42 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 (.cutY 18176 .empty (.cutX 640 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 704 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 (.cutY 32000 .empty (.cutX 14464 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 14528 (.cutY 32064 .full .full) (.cutY 32064 .full .full)) .full))) .empty) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 .empty (.cutY 768 (.cutX 18304 (.cutY 640 .full (.cutX 18240 (.cutY 704 .full .full) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty)))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 .empty (.cutY 14592 (.cutX 32128 (.cutY 14464 .full (.cutX 32064 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty) .empty) .empty)))))))) .empty))

theorem metadata42 : 0<114037843 ∧ 2<128 ∧ 71<128 ∧ 0<4 ∧
    323/4160=0 ∧ 323%4160=323 ∧ ∀ i, (leaves42 i).Valid 8 := by
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

noncomputable def phaseMass42 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw42 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass42_eq : phaseMass42 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass42
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw42 output42 cover42 source42
    (gridTreeUnionCheck_sound 32768 raw42 output42 cover42 source42 tree42 checked42)
    _ (by norm_num) _, areaUnits42]
  norm_num

-- Frozen phase 6039, atom 4726, type 1, source (4,70).
def leavesData43 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves43 : Fin 13 → DyadicLeaf := leavesData43.get
def raw43 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 4 70 leaves43 i
def outputData43 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨1024,1088,17920,17984⟩) (.node (.single ⟨1024,1088,17984,18048⟩) (.single ⟨1088,1152,17920,17984⟩))) (.node (.single ⟨1088,1152,17984,18048⟩) (.node (.single ⟨1024,1152,18048,18176⟩) (.single ⟨1152,1216,17920,17984⟩)))) (.node (.node (.single ⟨1152,1216,17984,18048⟩) (.node (.single ⟨1216,1248,17920,17952⟩) (.single ⟨1216,1248,17952,17984⟩))) (.node (.node (.single ⟨1248,1280,17920,17952⟩) (.single ⟨1248,1280,17952,17984⟩)) (.node (.single ⟨1216,1280,17984,18048⟩) (.single ⟨1152,1280,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,31488,31616⟩) (.node (.single ⟨14592,14720,31616,31744⟩) (.single ⟨14720,14784,31488,31552⟩))) (.node (.single ⟨14720,14784,31552,31616⟩) (.node (.single ⟨14784,14816,31488,31520⟩) (.single ⟨14784,14816,31520,31552⟩)))) (.node (.node (.single ⟨14816,14848,31488,31520⟩) (.node (.single ⟨14816,14848,31520,31552⟩) (.single ⟨14784,14848,31552,31616⟩))) (.node (.node (.single ⟨14720,14784,31616,31680⟩) (.single ⟨14720,14784,31680,31744⟩)) (.node (.single ⟨14784,14848,31616,31680⟩) (.single ⟨14784,14848,31680,31744⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,1024,1088⟩) (.node (.single ⟨17920,17984,1088,1152⟩) (.single ⟨17984,18048,1024,1088⟩))) (.node (.single ⟨17984,18048,1088,1152⟩) (.node (.single ⟨17920,17984,1152,1216⟩) (.single ⟨17920,17952,1216,1248⟩)))) (.node (.node (.single ⟨17920,17952,1248,1280⟩) (.node (.single ⟨17952,17984,1216,1248⟩) (.single ⟨17952,17984,1248,1280⟩))) (.node (.node (.single ⟨17984,18048,1152,1216⟩) (.single ⟨17984,18048,1216,1280⟩)) (.node (.single ⟨18048,18176,1024,1152⟩) (.single ⟨18048,18176,1152,1280⟩))))) (.node (.node (.node (.single ⟨31488,31616,14592,14720⟩) (.node (.single ⟨31488,31552,14720,14784⟩) (.single ⟨31488,31520,14784,14816⟩))) (.node (.single ⟨31488,31520,14816,14848⟩) (.node (.single ⟨31520,31552,14784,14816⟩) (.single ⟨31520,31552,14816,14848⟩)))) (.node (.node (.single ⟨31552,31616,14720,14784⟩) (.node (.single ⟨31552,31616,14784,14848⟩) (.single ⟨31616,31744,14592,14720⟩))) (.node (.node (.single ⟨31616,31680,14720,14784⟩) (.single ⟨31616,31680,14784,14848⟩)) (.node (.single ⟨31680,31744,14720,14784⟩) (.single ⟨31680,31744,14784,14848⟩)))))))
def output43 : Fin 52 → GridBox := outputData43.get
def coverData43 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData43 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover43 (i : Fin 52) : Fin 52 := ⟨coverData43.get i % 52, Nat.mod_lt _ (by decide)⟩
def source43 (i : Fin 52) : Fin 52 := ⟨sourceData43.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree43 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 (.cutY 18176 (.cutX 1152 (.cutY 18048 (.cutX 1088 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 1216 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 1248 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 .empty (.cutY 31488 .empty (.cutX 14720 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 14784 (.cutY 31552 .full .full) (.cutY 31552 (.cutX 14816 (.cutY 31520 .full .full) (.cutY 31520 .full .full)) .full)) (.cutX 14784 (.cutY 31680 .full .full) (.cutY 31680 .full .full))))))) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 (.cutY 1280 (.cutX 18048 (.cutY 1152 (.cutX 17984 (.cutY 1088 .full .full) (.cutY 1088 .full .full)) (.cutX 17984 (.cutY 1216 .full (.cutX 17952 (.cutY 1248 .full .full) (.cutY 1248 .full .full))) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 .empty (.cutY 14592 .empty (.cutX 31616 (.cutY 14720 .full (.cutX 31552 (.cutY 14784 .full (.cutX 31520 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 31680 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty)) .empty) .empty))))))) .empty))

theorem metadata43 : 0<202148459 ∧ 4<128 ∧ 70<128 ∧ 1<4 ∧
    4726/4160=1 ∧ 4726%4160=566 ∧ ∀ i, (leaves43 i).Valid 8 := by
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

noncomputable def phaseMass43 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw43 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass43_eq : phaseMass43 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass43
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw43 output43 cover43 source43
    (gridTreeUnionCheck_sound 32768 raw43 output43 cover43 source43 tree43 checked43)
    _ (by norm_num) _, areaUnits43]
  norm_num

-- Frozen phase 6040, atom 5625, type 1, source (12,73).
def leavesData44 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves44 : Fin 7 → DyadicLeaf := leavesData44.get
def raw44 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 12 73 leaves44 i
def outputData44 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3072,3200,18688,18816⟩) (.node (.single ⟨3072,3200,18816,18944⟩) (.single ⟨3200,3264,18688,18752⟩))) (.node (.node (.single ⟨3200,3264,18752,18816⟩) (.single ⟨3264,3328,18688,18752⟩)) (.node (.single ⟨3264,3328,18752,18816⟩) (.single ⟨3200,3328,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29440,29568⟩) (.node (.single ⟨13824,13952,29568,29696⟩) (.single ⟨13952,14016,29440,29504⟩))) (.node (.node (.single ⟨13952,14016,29504,29568⟩) (.single ⟨14016,14080,29440,29504⟩)) (.node (.single ⟨14016,14080,29504,29568⟩) (.single ⟨13952,14080,29568,29696⟩))))) (.node (.node (.node (.single ⟨18688,18816,3072,3200⟩) (.node (.single ⟨18688,18752,3200,3264⟩) (.single ⟨18688,18752,3264,3328⟩))) (.node (.node (.single ⟨18752,18816,3200,3264⟩) (.single ⟨18752,18816,3264,3328⟩)) (.node (.single ⟨18816,18944,3072,3200⟩) (.single ⟨18816,18944,3200,3328⟩)))) (.node (.node (.single ⟨29440,29568,13824,13952⟩) (.node (.single ⟨29440,29504,13952,14016⟩) (.single ⟨29440,29504,14016,14080⟩))) (.node (.node (.single ⟨29504,29568,13952,14016⟩) (.single ⟨29504,29568,14016,14080⟩)) (.node (.single ⟨29568,29696,13824,13952⟩) (.single ⟨29568,29696,13952,14080⟩))))))
def output44 : Fin 28 → GridBox := outputData44.get
def coverData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData44 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover44 (i : Fin 28) : Fin 28 := ⟨coverData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def source44 (i : Fin 28) : Fin 28 := ⟨sourceData44.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree44 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 (.cutX 3328 (.cutY 18688 .empty (.cutX 3200 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 3264 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 .empty (.cutY 29184 .empty (.cutX 14080 (.cutY 29440 .empty (.cutX 13952 (.cutY 29568 .full .full) (.cutY 29568 (.cutX 14016 (.cutY 29504 .full .full) (.cutY 29504 .full .full)) .full))) .empty))) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 (.cutY 3584 (.cutX 18688 .empty (.cutY 3328 (.cutX 18816 (.cutY 3200 .full (.cutX 18752 (.cutY 3264 .full .full) (.cutY 3264 .full .full))) (.cutY 3200 .full .full)) .empty)) .empty) .empty)) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 .empty (.cutX 29440 .empty (.cutY 14080 (.cutX 29568 (.cutY 13952 .full (.cutX 29504 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty))))) .empty) .empty) .empty))))) .empty))

theorem metadata44 : 0<94387549 ∧ 12<128 ∧ 73<128 ∧ 1<4 ∧
    5625/4160=1 ∧ 5625%4160=1465 ∧ ∀ i, (leaves44 i).Valid 8 := by
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

-- Frozen phase 6041, atom 5412, type 1, source (10,72).
def leavesData45 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves45 : Fin 7 → DyadicLeaf := leavesData45.get
def raw45 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 10 72 leaves45 i
def outputData45 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2560,2688,18432,18560⟩) (.node (.single ⟨2560,2688,18560,18688⟩) (.single ⟨2688,2752,18432,18496⟩))) (.node (.node (.single ⟨2688,2752,18496,18560⟩) (.single ⟨2752,2816,18432,18496⟩)) (.node (.single ⟨2752,2816,18496,18560⟩) (.single ⟨2688,2816,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,29952,30080⟩) (.node (.single ⟨14080,14208,30080,30208⟩) (.single ⟨14208,14272,29952,30016⟩))) (.node (.node (.single ⟨14208,14272,30016,30080⟩) (.single ⟨14272,14336,29952,30016⟩)) (.node (.single ⟨14272,14336,30016,30080⟩) (.single ⟨14208,14336,30080,30208⟩))))) (.node (.node (.node (.single ⟨18432,18560,2560,2688⟩) (.node (.single ⟨18432,18496,2688,2752⟩) (.single ⟨18432,18496,2752,2816⟩))) (.node (.node (.single ⟨18496,18560,2688,2752⟩) (.single ⟨18496,18560,2752,2816⟩)) (.node (.single ⟨18560,18688,2560,2688⟩) (.single ⟨18560,18688,2688,2816⟩)))) (.node (.node (.single ⟨29952,30080,14080,14208⟩) (.node (.single ⟨29952,30016,14208,14272⟩) (.single ⟨29952,30016,14272,14336⟩))) (.node (.node (.single ⟨30016,30080,14208,14272⟩) (.single ⟨30016,30080,14272,14336⟩)) (.node (.single ⟨30080,30208,14080,14208⟩) (.single ⟨30080,30208,14208,14336⟩))))))
def output45 : Fin 28 → GridBox := outputData45.get
def coverData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData45 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover45 (i : Fin 28) : Fin 28 := ⟨coverData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def source45 (i : Fin 28) : Fin 28 := ⟨sourceData45.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree45 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 (.cutY 18688 (.cutX 2688 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 2752 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 .empty (.cutY 29952 .empty (.cutX 14208 (.cutY 30080 .full .full) (.cutY 30080 (.cutX 14272 (.cutY 30016 .full .full) (.cutY 30016 .full .full)) .full)))) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 (.cutY 2816 (.cutX 18560 (.cutY 2688 .full (.cutX 18496 (.cutY 2752 .full .full) (.cutY 2752 .full .full))) (.cutY 2688 .full .full)) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 .empty (.cutY 14080 .empty (.cutX 30080 (.cutY 14208 .full (.cutX 30016 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))) .empty))) .empty) .empty))))) .empty))

theorem metadata45 : 0<94387549 ∧ 10<128 ∧ 72<128 ∧ 1<4 ∧
    5412/4160=1 ∧ 5412%4160=1252 ∧ ∀ i, (leaves45 i).Valid 8 := by
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

noncomputable def phaseMass45 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw45 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass45_eq : phaseMass45 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass45
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw45 output45 cover45 source45
    (gridTreeUnionCheck_sound 32768 raw45 output45 cover45 source45 tree45 checked45)
    _ (by norm_num) _, areaUnits45]
  norm_num

-- Frozen phase 6042, atom 5078, type 1, source (7,71).
def leavesData46 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves46 : Fin 10 → DyadicLeaf := leavesData46.get
def raw46 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 7 71 leaves46 i
def outputData46 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1792,1856,18176,18240⟩) (.single ⟨1792,1856,18240,18304⟩)) (.node (.single ⟨1856,1920,18176,18240⟩) (.node (.single ⟨1856,1920,18240,18304⟩) (.single ⟨1792,1920,18304,18432⟩)))) (.node (.node (.single ⟨1920,1984,18176,18240⟩) (.single ⟨1920,1984,18240,18304⟩)) (.node (.single ⟨1984,2048,18176,18240⟩) (.node (.single ⟨1984,2048,18240,18304⟩) (.single ⟨1920,2048,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30720,30848⟩) (.single ⟨14336,14464,30848,30976⟩)) (.node (.single ⟨14464,14528,30720,30784⟩) (.node (.single ⟨14464,14528,30784,30848⟩) (.single ⟨14528,14592,30720,30784⟩)))) (.node (.node (.single ⟨14528,14592,30784,30848⟩) (.single ⟨14464,14528,30848,30912⟩)) (.node (.single ⟨14464,14528,30912,30976⟩) (.node (.single ⟨14528,14592,30848,30912⟩) (.single ⟨14528,14592,30912,30976⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,1792,1856⟩) (.single ⟨18176,18240,1856,1920⟩)) (.node (.single ⟨18240,18304,1792,1856⟩) (.node (.single ⟨18240,18304,1856,1920⟩) (.single ⟨18176,18240,1920,1984⟩)))) (.node (.node (.single ⟨18176,18240,1984,2048⟩) (.single ⟨18240,18304,1920,1984⟩)) (.node (.single ⟨18240,18304,1984,2048⟩) (.node (.single ⟨18304,18432,1792,1920⟩) (.single ⟨18304,18432,1920,2048⟩))))) (.node (.node (.node (.single ⟨30720,30848,14336,14464⟩) (.single ⟨30720,30784,14464,14528⟩)) (.node (.single ⟨30720,30784,14528,14592⟩) (.node (.single ⟨30784,30848,14464,14528⟩) (.single ⟨30784,30848,14528,14592⟩)))) (.node (.node (.single ⟨30848,30976,14336,14464⟩) (.single ⟨30848,30912,14464,14528⟩)) (.node (.single ⟨30848,30912,14528,14592⟩) (.node (.single ⟨30912,30976,14464,14528⟩) (.single ⟨30912,30976,14528,14592⟩)))))))
def output46 : Fin 40 → GridBox := outputData46.get
def coverData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData46 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover46 (i : Fin 40) : Fin 40 := ⟨coverData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def source46 (i : Fin 40) : Fin 40 := ⟨sourceData46.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree46 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 .empty (.cutY 18176 .empty (.cutX 1920 (.cutY 18304 (.cutX 1856 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1984 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full)))))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 (.cutY 30976 (.cutX 14464 (.cutY 30848 .full .full) (.cutY 30848 (.cutX 14528 (.cutY 30784 .full .full) (.cutY 30784 .full .full)) (.cutX 14528 (.cutY 30912 .full .full) (.cutY 30912 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 .empty (.cutY 1792 .empty (.cutX 18304 (.cutY 1920 (.cutX 18240 (.cutY 1856 .full .full) (.cutY 1856 .full .full)) (.cutX 18240 (.cutY 1984 .full .full) (.cutY 1984 .full .full))) (.cutY 1920 .full .full)))))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 (.cutY 14592 (.cutX 30848 (.cutY 14464 .full (.cutX 30784 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 30912 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata46 : 0<202148459 ∧ 7<128 ∧ 71<128 ∧ 1<4 ∧
    5078/4160=1 ∧ 5078%4160=918 ∧ ∀ i, (leaves46 i).Valid 8 := by
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

noncomputable def phaseMass46 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw46 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass46_eq : phaseMass46 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass46
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw46 output46 cover46 source46
    (gridTreeUnionCheck_sound 32768 raw46 output46 cover46 source46 tree46 checked46)
    _ (by norm_num) _, areaUnits46]
  norm_num

-- Frozen phase 6043, atom 4963, type 1, source (6,71).
def leavesData47 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves47 : Fin 10 → DyadicLeaf := leavesData47.get
def raw47 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 6 71 leaves47 i
def outputData47 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1536,1600,18176,18240⟩) (.single ⟨1536,1600,18240,18304⟩)) (.node (.single ⟨1600,1664,18176,18240⟩) (.node (.single ⟨1600,1664,18240,18304⟩) (.single ⟨1536,1664,18304,18432⟩)))) (.node (.node (.single ⟨1664,1728,18176,18240⟩) (.single ⟨1664,1728,18240,18304⟩)) (.node (.single ⟨1728,1792,18176,18240⟩) (.node (.single ⟨1728,1792,18240,18304⟩) (.single ⟨1664,1792,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,30976,31104⟩) (.single ⟨14336,14464,31104,31232⟩)) (.node (.single ⟨14464,14528,30976,31040⟩) (.node (.single ⟨14464,14528,31040,31104⟩) (.single ⟨14528,14592,30976,31040⟩)))) (.node (.node (.single ⟨14528,14592,31040,31104⟩) (.single ⟨14464,14528,31104,31168⟩)) (.node (.single ⟨14464,14528,31168,31232⟩) (.node (.single ⟨14528,14592,31104,31168⟩) (.single ⟨14528,14592,31168,31232⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,1536,1600⟩) (.single ⟨18176,18240,1600,1664⟩)) (.node (.single ⟨18240,18304,1536,1600⟩) (.node (.single ⟨18240,18304,1600,1664⟩) (.single ⟨18176,18240,1664,1728⟩)))) (.node (.node (.single ⟨18176,18240,1728,1792⟩) (.single ⟨18240,18304,1664,1728⟩)) (.node (.single ⟨18240,18304,1728,1792⟩) (.node (.single ⟨18304,18432,1536,1664⟩) (.single ⟨18304,18432,1664,1792⟩))))) (.node (.node (.node (.single ⟨30976,31104,14336,14464⟩) (.single ⟨30976,31040,14464,14528⟩)) (.node (.single ⟨30976,31040,14528,14592⟩) (.node (.single ⟨31040,31104,14464,14528⟩) (.single ⟨31040,31104,14528,14592⟩)))) (.node (.node (.single ⟨31104,31232,14336,14464⟩) (.single ⟨31104,31168,14464,14528⟩)) (.node (.single ⟨31104,31168,14528,14592⟩) (.node (.single ⟨31168,31232,14464,14528⟩) (.single ⟨31168,31232,14528,14592⟩)))))))
def output47 : Fin 40 → GridBox := outputData47.get
def coverData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData47 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover47 (i : Fin 40) : Fin 40 := ⟨coverData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def source47 (i : Fin 40) : Fin 40 := ⟨sourceData47.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree47 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 .empty (.cutY 17920 .empty (.cutX 1792 (.cutY 18176 .empty (.cutX 1664 (.cutY 18304 (.cutX 1600 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1728 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty))))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 (.cutX 14592 (.cutY 30976 .empty (.cutX 14464 (.cutY 31104 .full .full) (.cutY 31104 (.cutX 14528 (.cutY 31040 .full .full) (.cutY 31040 .full .full)) (.cutX 14528 (.cutY 31168 .full .full) (.cutY 31168 .full .full))))) .empty) .empty) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 .empty (.cutX 18176 .empty (.cutY 1792 (.cutX 18304 (.cutY 1664 (.cutX 18240 (.cutY 1600 .full .full) (.cutY 1600 .full .full)) (.cutX 18240 (.cutY 1728 .full .full) (.cutY 1728 .full .full))) (.cutY 1664 .full .full)) .empty)))))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 (.cutY 14848 (.cutX 30976 .empty (.cutY 14592 (.cutX 31104 (.cutY 14464 .full (.cutX 31040 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 31168 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty)) .empty) .empty) .empty) .empty))))))) .empty))

theorem metadata47 : 0<202148459 ∧ 6<128 ∧ 71<128 ∧ 1<4 ∧
    4963/4160=1 ∧ 4963%4160=803 ∧ ∀ i, (leaves47 i).Valid 8 := by
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

noncomputable def phaseMass47 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw47 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass47_eq : phaseMass47 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass47
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw47 output47 cover47 source47
    (gridTreeUnionCheck_sound 32768 raw47 output47 cover47 source47 tree47 checked47)
    _ (by norm_num) _, areaUnits47]
  norm_num

-- Frozen phase 6044, atom 6818, type 1, source (25,83).
def leavesData48 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves48 : Fin 13 → DyadicLeaf := leavesData48.get
def raw48 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 25 83 leaves48 i
def outputData48 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,21248,21312⟩) (.node (.single ⟨6400,6464,21312,21376⟩) (.single ⟨6464,6528,21248,21312⟩))) (.node (.single ⟨6464,6528,21312,21376⟩) (.node (.single ⟨6400,6528,21376,21504⟩) (.single ⟨6528,6592,21248,21312⟩)))) (.node (.node (.single ⟨6528,6592,21312,21376⟩) (.node (.single ⟨6592,6624,21248,21280⟩) (.single ⟨6592,6624,21280,21312⟩))) (.node (.node (.single ⟨6624,6656,21248,21280⟩) (.single ⟨6624,6656,21280,21312⟩)) (.node (.single ⟨6592,6656,21312,21376⟩) (.single ⟨6528,6656,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26112,26240⟩) (.node (.single ⟨11264,11392,26240,26368⟩) (.single ⟨11392,11456,26112,26176⟩))) (.node (.single ⟨11392,11456,26176,26240⟩) (.node (.single ⟨11456,11488,26112,26144⟩) (.single ⟨11456,11488,26144,26176⟩)))) (.node (.node (.single ⟨11488,11520,26112,26144⟩) (.node (.single ⟨11488,11520,26144,26176⟩) (.single ⟨11456,11520,26176,26240⟩))) (.node (.node (.single ⟨11392,11456,26240,26304⟩) (.single ⟨11392,11456,26304,26368⟩)) (.node (.single ⟨11456,11520,26240,26304⟩) (.single ⟨11456,11520,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,6400,6464⟩) (.node (.single ⟨21248,21312,6464,6528⟩) (.single ⟨21312,21376,6400,6464⟩))) (.node (.single ⟨21312,21376,6464,6528⟩) (.node (.single ⟨21248,21312,6528,6592⟩) (.single ⟨21248,21280,6592,6624⟩)))) (.node (.node (.single ⟨21248,21280,6624,6656⟩) (.node (.single ⟨21280,21312,6592,6624⟩) (.single ⟨21280,21312,6624,6656⟩))) (.node (.node (.single ⟨21312,21376,6528,6592⟩) (.single ⟨21312,21376,6592,6656⟩)) (.node (.single ⟨21376,21504,6400,6528⟩) (.single ⟨21376,21504,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,11264,11392⟩) (.node (.single ⟨26112,26176,11392,11456⟩) (.single ⟨26112,26144,11456,11488⟩))) (.node (.single ⟨26112,26144,11488,11520⟩) (.node (.single ⟨26144,26176,11456,11488⟩) (.single ⟨26144,26176,11488,11520⟩)))) (.node (.node (.single ⟨26176,26240,11392,11456⟩) (.node (.single ⟨26176,26240,11456,11520⟩) (.single ⟨26240,26368,11264,11392⟩))) (.node (.node (.single ⟨26240,26304,11392,11456⟩) (.single ⟨26240,26304,11456,11520⟩)) (.node (.single ⟨26304,26368,11392,11456⟩) (.single ⟨26304,26368,11456,11520⟩)))))))
def output48 : Fin 52 → GridBox := outputData48.get
def coverData48 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData48 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover48 (i : Fin 52) : Fin 52 := ⟨coverData48.get i % 52, Nat.mod_lt _ (by decide)⟩
def source48 (i : Fin 52) : Fin 52 := ⟨sourceData48.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree48 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 (.cutY 20992 .empty (.cutX 6400 .empty (.cutY 21248 .empty (.cutX 6528 (.cutY 21376 (.cutX 6464 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 6592 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 6624 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))))) .empty) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 .empty (.cutX 11520 (.cutY 26368 (.cutX 11392 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 11456 (.cutY 26176 .full .full) (.cutY 26176 (.cutX 11488 (.cutY 26144 .full .full) (.cutY 26144 .full .full)) .full)) (.cutX 11456 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty) .empty)) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 (.cutX 21248 .empty (.cutY 6400 .empty (.cutX 21376 (.cutY 6528 (.cutX 21312 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 21312 (.cutY 6592 .full (.cutX 21280 (.cutY 6624 .full .full) (.cutY 6624 .full .full))) (.cutY 6592 .full .full))) (.cutY 6528 .full .full)))) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 .empty (.cutY 11776 (.cutX 26368 (.cutY 11520 (.cutX 26240 (.cutY 11392 .full (.cutX 26176 (.cutY 11456 .full (.cutX 26144 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 26304 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty) .empty) .empty))))) .empty) .empty) .empty))) .empty))

theorem metadata48 : 0<144359671 ∧ 25<128 ∧ 83<128 ∧ 1<4 ∧
    6818/4160=1 ∧ 6818%4160=2658 ∧ ∀ i, (leaves48 i).Valid 8 := by
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

noncomputable def phaseMass48 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw48 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass48_eq : phaseMass48 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass48
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw48 output48 cover48 source48
    (gridTreeUnionCheck_sound 32768 raw48 output48 cover48 source48 tree48 checked48)
    _ (by norm_num) _, areaUnits48]
  norm_num

-- Frozen phase 6045, atom 7117, type 1, source (29,86).
def leavesData49 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves49 : Fin 13 → DyadicLeaf := leavesData49.get
def raw49 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 29 86 leaves49 i
def outputData49 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7424,7488,22016,22080⟩) (.node (.single ⟨7424,7488,22080,22144⟩) (.single ⟨7488,7552,22016,22080⟩))) (.node (.single ⟨7488,7552,22080,22144⟩) (.node (.single ⟨7424,7552,22144,22272⟩) (.single ⟨7552,7616,22016,22080⟩)))) (.node (.node (.single ⟨7552,7616,22080,22144⟩) (.node (.single ⟨7616,7648,22016,22048⟩) (.single ⟨7616,7648,22048,22080⟩))) (.node (.node (.single ⟨7648,7680,22016,22048⟩) (.single ⟨7648,7680,22048,22080⟩)) (.node (.single ⟨7616,7680,22080,22144⟩) (.single ⟨7552,7680,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,25088,25216⟩) (.node (.single ⟨10496,10624,25216,25344⟩) (.single ⟨10624,10688,25088,25152⟩))) (.node (.single ⟨10624,10688,25152,25216⟩) (.node (.single ⟨10688,10720,25088,25120⟩) (.single ⟨10688,10720,25120,25152⟩)))) (.node (.node (.single ⟨10720,10752,25088,25120⟩) (.node (.single ⟨10720,10752,25120,25152⟩) (.single ⟨10688,10752,25152,25216⟩))) (.node (.node (.single ⟨10624,10688,25216,25280⟩) (.single ⟨10624,10688,25280,25344⟩)) (.node (.single ⟨10688,10752,25216,25280⟩) (.single ⟨10688,10752,25280,25344⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,7424,7488⟩) (.node (.single ⟨22016,22080,7488,7552⟩) (.single ⟨22080,22144,7424,7488⟩))) (.node (.single ⟨22080,22144,7488,7552⟩) (.node (.single ⟨22016,22080,7552,7616⟩) (.single ⟨22016,22048,7616,7648⟩)))) (.node (.node (.single ⟨22016,22048,7648,7680⟩) (.node (.single ⟨22048,22080,7616,7648⟩) (.single ⟨22048,22080,7648,7680⟩))) (.node (.node (.single ⟨22080,22144,7552,7616⟩) (.single ⟨22080,22144,7616,7680⟩)) (.node (.single ⟨22144,22272,7424,7552⟩) (.single ⟨22144,22272,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,10496,10624⟩) (.node (.single ⟨25088,25152,10624,10688⟩) (.single ⟨25088,25120,10688,10720⟩))) (.node (.single ⟨25088,25120,10720,10752⟩) (.node (.single ⟨25120,25152,10688,10720⟩) (.single ⟨25120,25152,10720,10752⟩)))) (.node (.node (.single ⟨25152,25216,10624,10688⟩) (.node (.single ⟨25152,25216,10688,10752⟩) (.single ⟨25216,25344,10496,10624⟩))) (.node (.node (.single ⟨25216,25280,10624,10688⟩) (.single ⟨25216,25280,10688,10752⟩)) (.node (.single ⟨25280,25344,10624,10688⟩) (.single ⟨25280,25344,10688,10752⟩)))))))
def output49 : Fin 52 → GridBox := outputData49.get
def coverData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData49 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover49 (i : Fin 52) : Fin 52 := ⟨coverData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def source49 (i : Fin 52) : Fin 52 := ⟨sourceData49.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree49 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 (.cutY 22016 .empty (.cutX 7424 .empty (.cutY 22272 (.cutX 7552 (.cutY 22144 (.cutX 7488 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 7616 (.cutY 22080 .full .full) (.cutY 22080 (.cutX 7648 (.cutY 22048 .full .full) (.cutY 22048 .full .full)) .full)) .full)) .empty))) .empty))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 .empty (.cutX 10496 .empty (.cutY 25344 (.cutX 10624 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 10688 (.cutY 25152 .full .full) (.cutY 25152 (.cutX 10720 (.cutY 25120 .full .full) (.cutY 25120 .full .full)) .full)) (.cutX 10688 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty))) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 (.cutX 22272 (.cutY 7424 .empty (.cutX 22144 (.cutY 7552 (.cutX 22080 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 22080 (.cutY 7616 .full (.cutX 22048 (.cutY 7648 .full .full) (.cutY 7648 .full .full))) (.cutY 7616 .full .full))) (.cutY 7552 .full .full))) .empty) .empty))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 .empty (.cutY 10752 (.cutX 25344 (.cutY 10496 .empty (.cutX 25216 (.cutY 10624 .full (.cutX 25152 (.cutY 10688 .full (.cutX 25120 (.cutY 10720 .full .full) (.cutY 10720 .full .full))) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 25280 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata49 : 0<144359671 ∧ 29<128 ∧ 86<128 ∧ 1<4 ∧
    7117/4160=1 ∧ 7117%4160=2957 ∧ ∀ i, (leaves49 i).Valid 8 := by
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

noncomputable def phaseMass49 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw49 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass49_eq : phaseMass49 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass49
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw49 output49 cover49 source49
    (gridTreeUnionCheck_sound 32768 raw49 output49 cover49 source49 tree49 checked49)
    _ (by norm_num) _, areaUnits49]
  norm_num

-- Frozen phase 6046, atom 2960, type 0, source (29,89).
def leavesData50 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves50 : Fin 10 → DyadicLeaf := leavesData50.get
def raw50 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 29 89 leaves50 i
def outputData50 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7424,7488,22784,22848⟩) (.single ⟨7424,7488,22848,22912⟩)) (.node (.single ⟨7488,7552,22784,22848⟩) (.node (.single ⟨7488,7552,22848,22912⟩) (.single ⟨7424,7552,22912,23040⟩)))) (.node (.node (.single ⟨7552,7616,22784,22848⟩) (.single ⟨7552,7616,22848,22912⟩)) (.node (.single ⟨7616,7680,22784,22848⟩) (.node (.single ⟨7616,7680,22848,22912⟩) (.single ⟨7552,7680,22912,23040⟩))))) (.node (.node (.node (.single ⟨9728,9856,25088,25216⟩) (.single ⟨9728,9856,25216,25344⟩)) (.node (.single ⟨9856,9920,25088,25152⟩) (.node (.single ⟨9856,9920,25152,25216⟩) (.single ⟨9920,9984,25088,25152⟩)))) (.node (.node (.single ⟨9920,9984,25152,25216⟩) (.single ⟨9856,9920,25216,25280⟩)) (.node (.single ⟨9856,9920,25280,25344⟩) (.node (.single ⟨9920,9984,25216,25280⟩) (.single ⟨9920,9984,25280,25344⟩)))))) (.node (.node (.node (.node (.single ⟨22784,22848,7424,7488⟩) (.single ⟨22784,22848,7488,7552⟩)) (.node (.single ⟨22848,22912,7424,7488⟩) (.node (.single ⟨22848,22912,7488,7552⟩) (.single ⟨22784,22848,7552,7616⟩)))) (.node (.node (.single ⟨22784,22848,7616,7680⟩) (.single ⟨22848,22912,7552,7616⟩)) (.node (.single ⟨22848,22912,7616,7680⟩) (.node (.single ⟨22912,23040,7424,7552⟩) (.single ⟨22912,23040,7552,7680⟩))))) (.node (.node (.node (.single ⟨25088,25216,9728,9856⟩) (.single ⟨25088,25152,9856,9920⟩)) (.node (.single ⟨25088,25152,9920,9984⟩) (.node (.single ⟨25152,25216,9856,9920⟩) (.single ⟨25152,25216,9920,9984⟩)))) (.node (.node (.single ⟨25216,25344,9728,9856⟩) (.single ⟨25216,25280,9856,9920⟩)) (.node (.single ⟨25216,25280,9920,9984⟩) (.node (.single ⟨25280,25344,9856,9920⟩) (.single ⟨25280,25344,9920,9984⟩)))))))
def output50 : Fin 40 → GridBox := outputData50.get
def coverData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData50 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover50 (i : Fin 40) : Fin 40 := ⟨coverData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def source50 (i : Fin 40) : Fin 40 := ⟨sourceData50.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree50 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 (.cutY 23040 (.cutX 7424 .empty (.cutY 22784 .empty (.cutX 7552 (.cutY 22912 (.cutX 7488 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full) (.cutY 22912 (.cutX 7616 (.cutY 22848 .full .full) (.cutY 22848 .full .full)) .full)))) .empty) .empty) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 .empty (.cutX 9984 (.cutY 25344 (.cutX 9856 (.cutY 25216 .full .full) (.cutY 25216 (.cutX 9920 (.cutY 25152 .full .full) (.cutY 25152 .full .full)) (.cutX 9920 (.cutY 25280 .full .full) (.cutY 25280 .full .full)))) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 (.cutX 22784 .empty (.cutY 7424 .empty (.cutX 22912 (.cutY 7552 (.cutX 22848 (.cutY 7488 .full .full) (.cutY 7488 .full .full)) (.cutX 22848 (.cutY 7616 .full .full) (.cutY 7616 .full .full))) (.cutY 7552 .full .full)))) .empty) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 .empty (.cutY 9728 .empty (.cutX 25344 (.cutY 9984 (.cutX 25216 (.cutY 9856 .full (.cutX 25152 (.cutY 9920 .full .full) (.cutY 9920 .full .full))) (.cutY 9856 .full (.cutX 25280 (.cutY 9920 .full .full) (.cutY 9920 .full .full)))) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata50 : 0<145899414 ∧ 29<128 ∧ 89<128 ∧ 0<4 ∧
    2960/4160=0 ∧ 2960%4160=2960 ∧ ∀ i, (leaves50 i).Valid 8 := by
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

noncomputable def phaseMass50 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw50 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass50_eq : phaseMass50 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass50
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw50 output50 cover50 source50
    (gridTreeUnionCheck_sound 32768 raw50 output50 cover50 source50 tree50 checked50)
    _ (by norm_num) _, areaUnits50]
  norm_num

-- Frozen phase 6047, atom 1362, type 0, source (11,75).
def leavesData51 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves51 : Fin 4 → DyadicLeaf := leavesData51.get
def raw51 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 11 75 leaves51 i
def outputData51 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2816,2944,19200,19328⟩) (.single ⟨2816,2944,19328,19456⟩)) (.node (.single ⟨2944,3072,19200,19328⟩) (.single ⟨2944,3072,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,29696,29824⟩) (.single ⟨13312,13440,29824,29952⟩)) (.node (.single ⟨13440,13568,29696,29824⟩) (.single ⟨13440,13568,29824,29952⟩)))) (.node (.node (.node (.single ⟨19200,19328,2816,2944⟩) (.single ⟨19200,19328,2944,3072⟩)) (.node (.single ⟨19328,19456,2816,2944⟩) (.single ⟨19328,19456,2944,3072⟩))) (.node (.node (.single ⟨29696,29824,13312,13440⟩) (.single ⟨29696,29824,13440,13568⟩)) (.node (.single ⟨29824,29952,13312,13440⟩) (.single ⟨29824,29952,13440,13568⟩)))))
def output51 : Fin 16 → GridBox := outputData51.get
def coverData51 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData51 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover51 (i : Fin 16) : Fin 16 := ⟨coverData51.get i % 16, Nat.mod_lt _ (by decide)⟩
def source51 (i : Fin 16) : Fin 16 := ⟨sourceData51.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree51 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 .empty (.cutX 2816 .empty (.cutY 19200 .empty (.cutX 2944 (.cutY 19328 .full .full) (.cutY 19328 .full .full)))))) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 (.cutX 13568 (.cutY 29952 (.cutX 13440 (.cutY 29824 .full .full) (.cutY 29824 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 .empty (.cutX 19200 .empty (.cutY 2816 .empty (.cutX 19328 (.cutY 2944 .full .full) (.cutY 2944 .full .full)))))) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 (.cutX 29952 (.cutY 13568 (.cutX 29824 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty) .empty) .empty) .empty))) .empty) .empty))))) .empty))

theorem metadata51 : 0<48363413 ∧ 11<128 ∧ 75<128 ∧ 0<4 ∧
    1362/4160=0 ∧ 1362%4160=1362 ∧ ∀ i, (leaves51 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData51).mp
    (by decide +kernel)

theorem sourceChecked51_0 : ∀ i : Fin 16,
    (fun i => output51 i = raw51 (source51 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked51 : ∀ i : Fin 16, (fun i => output51 i = raw51 (source51 i)) i :=
  forallFin_of_zero_offset (fun i => output51 i = raw51 (source51 i)) sourceChecked51_0

theorem coverChecked51_0 : ∀ i : Fin 16,
    (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked51 : ∀ i : Fin 16, (fun i => (output51 (cover51 i)).ContainsBox (raw51 i)) i :=
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

noncomputable def phaseMass51 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw51 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass51_eq : phaseMass51 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass51
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw51 output51 cover51 source51
    (gridTreeUnionCheck_sound 32768 raw51 output51 cover51 source51 tree51 checked51)
    _ (by norm_num) _, areaUnits51]
  norm_num

-- Frozen phase 6048, atom 70, type 0, source (0,70).
def leavesData52 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves52 : Fin 10 → DyadicLeaf := leavesData52.get
def raw52 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 0 70 leaves52 i
def outputData52 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨0,64,17920,17984⟩) (.single ⟨0,64,17984,18048⟩)) (.node (.single ⟨64,128,17920,17984⟩) (.node (.single ⟨64,128,17984,18048⟩) (.single ⟨0,128,18048,18176⟩)))) (.node (.node (.single ⟨128,192,17920,17984⟩) (.single ⟨128,192,17984,18048⟩)) (.node (.single ⟨192,256,17920,17984⟩) (.node (.single ⟨192,256,17984,18048⟩) (.single ⟨128,256,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,32512,32640⟩) (.single ⟨14592,14720,32640,32768⟩)) (.node (.single ⟨14720,14784,32512,32576⟩) (.node (.single ⟨14720,14784,32576,32640⟩) (.single ⟨14784,14848,32512,32576⟩)))) (.node (.node (.single ⟨14784,14848,32576,32640⟩) (.single ⟨14720,14784,32640,32704⟩)) (.node (.single ⟨14720,14784,32704,32768⟩) (.node (.single ⟨14784,14848,32640,32704⟩) (.single ⟨14784,14848,32704,32768⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,0,64⟩) (.single ⟨17920,17984,64,128⟩)) (.node (.single ⟨17984,18048,0,64⟩) (.node (.single ⟨17984,18048,64,128⟩) (.single ⟨17920,17984,128,192⟩)))) (.node (.node (.single ⟨17920,17984,192,256⟩) (.single ⟨17984,18048,128,192⟩)) (.node (.single ⟨17984,18048,192,256⟩) (.node (.single ⟨18048,18176,0,128⟩) (.single ⟨18048,18176,128,256⟩))))) (.node (.node (.node (.single ⟨32512,32640,14592,14720⟩) (.single ⟨32512,32576,14720,14784⟩)) (.node (.single ⟨32512,32576,14784,14848⟩) (.node (.single ⟨32576,32640,14720,14784⟩) (.single ⟨32576,32640,14784,14848⟩)))) (.node (.node (.single ⟨32640,32768,14592,14720⟩) (.single ⟨32640,32704,14720,14784⟩)) (.node (.single ⟨32640,32704,14784,14848⟩) (.node (.single ⟨32704,32768,14720,14784⟩) (.single ⟨32704,32768,14784,14848⟩)))))))
def output52 : Fin 40 → GridBox := outputData52.get
def coverData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData52 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover52 (i : Fin 40) : Fin 40 := ⟨coverData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def source52 (i : Fin 40) : Fin 40 := ⟨sourceData52.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree52 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 (.cutY 18176 (.cutX 128 (.cutY 18048 (.cutX 64 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 192 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full)) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 .empty (.cutY 32512 .empty (.cutX 14720 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 14784 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) (.cutX 14784 (.cutY 32704 .full .full) (.cutY 32704 .full .full))))))) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 (.cutY 256 (.cutX 18048 (.cutY 128 (.cutX 17984 (.cutY 64 .full .full) (.cutY 64 .full .full)) (.cutX 17984 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty) .empty) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 .empty (.cutY 14592 .empty (.cutX 32640 (.cutY 14720 .full (.cutX 32576 (.cutY 14784 .full .full) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 32704 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty)) .empty)))))))) .empty))

theorem metadata52 : 0<114037843 ∧ 0<128 ∧ 70<128 ∧ 0<4 ∧
    70/4160=0 ∧ 70%4160=70 ∧ ∀ i, (leaves52 i).Valid 8 := by
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

noncomputable def phaseMass52 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw52 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass52_eq : phaseMass52 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass52
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw52 output52 cover52 source52
    (gridTreeUnionCheck_sound 32768 raw52 output52 cover52 source52 tree52 checked52)
    _ (by norm_num) _, areaUnits52]
  norm_num

-- Frozen phase 6049, atom 4356, type 1, source (1,69).
def leavesData53 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves53 : Fin 13 → DyadicLeaf := leavesData53.get
def raw53 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 1 69 leaves53 i
def outputData53 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨256,320,17664,17728⟩) (.node (.single ⟨256,320,17728,17792⟩) (.single ⟨320,384,17664,17728⟩))) (.node (.single ⟨320,384,17728,17792⟩) (.node (.single ⟨256,384,17792,17920⟩) (.single ⟨384,448,17664,17728⟩)))) (.node (.node (.single ⟨384,448,17728,17792⟩) (.node (.single ⟨448,480,17664,17696⟩) (.single ⟨448,480,17696,17728⟩))) (.node (.node (.single ⟨480,512,17664,17696⟩) (.single ⟨480,512,17696,17728⟩)) (.node (.single ⟨448,512,17728,17792⟩) (.single ⟨384,512,17792,17920⟩))))) (.node (.node (.node (.single ⟨14848,14976,32256,32384⟩) (.node (.single ⟨14848,14976,32384,32512⟩) (.single ⟨14976,15040,32256,32320⟩))) (.node (.single ⟨14976,15040,32320,32384⟩) (.node (.single ⟨15040,15072,32256,32288⟩) (.single ⟨15040,15072,32288,32320⟩)))) (.node (.node (.single ⟨15072,15104,32256,32288⟩) (.node (.single ⟨15072,15104,32288,32320⟩) (.single ⟨15040,15104,32320,32384⟩))) (.node (.node (.single ⟨14976,15040,32384,32448⟩) (.single ⟨14976,15040,32448,32512⟩)) (.node (.single ⟨15040,15104,32384,32448⟩) (.single ⟨15040,15104,32448,32512⟩)))))) (.node (.node (.node (.node (.single ⟨17664,17728,256,320⟩) (.node (.single ⟨17664,17728,320,384⟩) (.single ⟨17728,17792,256,320⟩))) (.node (.single ⟨17728,17792,320,384⟩) (.node (.single ⟨17664,17728,384,448⟩) (.single ⟨17664,17696,448,480⟩)))) (.node (.node (.single ⟨17664,17696,480,512⟩) (.node (.single ⟨17696,17728,448,480⟩) (.single ⟨17696,17728,480,512⟩))) (.node (.node (.single ⟨17728,17792,384,448⟩) (.single ⟨17728,17792,448,512⟩)) (.node (.single ⟨17792,17920,256,384⟩) (.single ⟨17792,17920,384,512⟩))))) (.node (.node (.node (.single ⟨32256,32384,14848,14976⟩) (.node (.single ⟨32256,32320,14976,15040⟩) (.single ⟨32256,32288,15040,15072⟩))) (.node (.single ⟨32256,32288,15072,15104⟩) (.node (.single ⟨32288,32320,15040,15072⟩) (.single ⟨32288,32320,15072,15104⟩)))) (.node (.node (.single ⟨32320,32384,14976,15040⟩) (.node (.single ⟨32320,32384,15040,15104⟩) (.single ⟨32384,32512,14848,14976⟩))) (.node (.node (.single ⟨32384,32448,14976,15040⟩) (.single ⟨32384,32448,15040,15104⟩)) (.node (.single ⟨32448,32512,14976,15040⟩) (.single ⟨32448,32512,15040,15104⟩)))))))
def output53 : Fin 52 → GridBox := outputData53.get
def coverData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData53 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover53 (i : Fin 52) : Fin 52 := ⟨coverData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def source53 (i : Fin 52) : Fin 52 := ⟨sourceData53.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree53 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 .empty (.cutY 17664 .empty (.cutX 384 (.cutY 17792 (.cutX 320 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full) (.cutY 17792 (.cutX 448 (.cutY 17728 .full .full) (.cutY 17728 (.cutX 480 (.cutY 17696 .full .full) (.cutY 17696 .full .full)) .full)) .full)))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 (.cutY 32512 (.cutX 14976 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 15040 (.cutY 32320 .full .full) (.cutY 32320 (.cutX 15072 (.cutY 32288 .full .full) (.cutY 32288 .full .full)) .full)) (.cutX 15040 (.cutY 32448 .full .full) (.cutY 32448 .full .full)))) .empty) .empty)))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 .empty (.cutY 256 .empty (.cutX 17792 (.cutY 384 (.cutX 17728 (.cutY 320 .full .full) (.cutY 320 .full .full)) (.cutX 17728 (.cutY 448 .full (.cutX 17696 (.cutY 480 .full .full) (.cutY 480 .full .full))) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 (.cutY 15104 (.cutX 32384 (.cutY 14976 .full (.cutX 32320 (.cutY 15040 .full (.cutX 32288 (.cutY 15072 .full .full) (.cutY 15072 .full .full))) (.cutY 15040 .full .full))) (.cutY 14976 .full (.cutX 32448 (.cutY 15040 .full .full) (.cutY 15040 .full .full)))) .empty) .empty))) .empty)))))))) .empty))

theorem metadata53 : 0<202148459 ∧ 1<128 ∧ 69<128 ∧ 1<4 ∧
    4356/4160=1 ∧ 4356%4160=196 ∧ ∀ i, (leaves53 i).Valid 8 := by
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

noncomputable def phaseMass53 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw53 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass53_eq : phaseMass53 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass53
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw53 output53 cover53 source53
    (gridTreeUnionCheck_sound 32768 raw53 output53 cover53 source53 tree53 checked53)
    _ (by norm_num) _, areaUnits53]
  norm_num

-- Frozen phase 6050, atom 2243, type 0, source (20,83).
def leavesData54 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves54 : Fin 13 → DyadicLeaf := leavesData54.get
def raw54 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 83 leaves54 i
def outputData54 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,21248,21312⟩) (.node (.single ⟨5120,5184,21312,21376⟩) (.single ⟨5184,5248,21248,21312⟩))) (.node (.single ⟨5184,5248,21312,21376⟩) (.node (.single ⟨5120,5248,21376,21504⟩) (.single ⟨5248,5312,21248,21312⟩)))) (.node (.node (.single ⟨5248,5312,21312,21376⟩) (.node (.single ⟨5312,5344,21248,21280⟩) (.single ⟨5312,5344,21280,21312⟩))) (.node (.node (.single ⟨5344,5376,21248,21280⟩) (.single ⟨5344,5376,21280,21312⟩)) (.node (.single ⟨5312,5376,21312,21376⟩) (.single ⟨5248,5376,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,27392,27520⟩) (.node (.single ⟨11264,11392,27520,27648⟩) (.single ⟨11392,11456,27392,27456⟩))) (.node (.single ⟨11392,11456,27456,27520⟩) (.node (.single ⟨11456,11488,27392,27424⟩) (.single ⟨11456,11488,27424,27456⟩)))) (.node (.node (.single ⟨11488,11520,27392,27424⟩) (.node (.single ⟨11488,11520,27424,27456⟩) (.single ⟨11456,11520,27456,27520⟩))) (.node (.node (.single ⟨11392,11456,27520,27584⟩) (.single ⟨11392,11456,27584,27648⟩)) (.node (.single ⟨11456,11520,27520,27584⟩) (.single ⟨11456,11520,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,5120,5184⟩) (.node (.single ⟨21248,21312,5184,5248⟩) (.single ⟨21312,21376,5120,5184⟩))) (.node (.single ⟨21312,21376,5184,5248⟩) (.node (.single ⟨21248,21312,5248,5312⟩) (.single ⟨21248,21280,5312,5344⟩)))) (.node (.node (.single ⟨21248,21280,5344,5376⟩) (.node (.single ⟨21280,21312,5312,5344⟩) (.single ⟨21280,21312,5344,5376⟩))) (.node (.node (.single ⟨21312,21376,5248,5312⟩) (.single ⟨21312,21376,5312,5376⟩)) (.node (.single ⟨21376,21504,5120,5248⟩) (.single ⟨21376,21504,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,11264,11392⟩) (.node (.single ⟨27392,27456,11392,11456⟩) (.single ⟨27392,27424,11456,11488⟩))) (.node (.single ⟨27392,27424,11488,11520⟩) (.node (.single ⟨27424,27456,11456,11488⟩) (.single ⟨27424,27456,11488,11520⟩)))) (.node (.node (.single ⟨27456,27520,11392,11456⟩) (.node (.single ⟨27456,27520,11456,11520⟩) (.single ⟨27520,27648,11264,11392⟩))) (.node (.node (.single ⟨27520,27584,11392,11456⟩) (.single ⟨27520,27584,11456,11520⟩)) (.node (.single ⟨27584,27648,11392,11456⟩) (.single ⟨27584,27648,11456,11520⟩)))))))
def output54 : Fin 52 → GridBox := outputData54.get
def coverData54 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData54 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover54 (i : Fin 52) : Fin 52 := ⟨coverData54.get i % 52, Nat.mod_lt _ (by decide)⟩
def source54 (i : Fin 52) : Fin 52 := ⟨sourceData54.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree54 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 .empty (.cutX 5376 (.cutY 21248 .empty (.cutX 5248 (.cutY 21376 (.cutX 5184 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 5312 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 5344 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))) .empty)) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 .empty (.cutX 11520 (.cutY 27392 .empty (.cutX 11392 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 11456 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 11488 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 11456 (.cutY 27584 .full .full) (.cutY 27584 .full .full))))) .empty)) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 (.cutX 21248 .empty (.cutY 5376 (.cutX 21376 (.cutY 5248 (.cutX 21312 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 21312 (.cutY 5312 .full (.cutX 21280 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty)) .empty))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 (.cutX 27392 .empty (.cutY 11520 (.cutX 27520 (.cutY 11392 .full (.cutX 27456 (.cutY 11456 .full (.cutX 27424 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 27584 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty))) .empty))) .empty) .empty))) .empty))

theorem metadata54 : 0<152546139 ∧ 20<128 ∧ 83<128 ∧ 0<4 ∧
    2243/4160=0 ∧ 2243%4160=2243 ∧ ∀ i, (leaves54 i).Valid 8 := by
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

noncomputable def phaseMass54 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw54 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass54_eq : phaseMass54 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass54
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw54 output54 cover54 source54
    (gridTreeUnionCheck_sound 32768 raw54 output54 cover54 source54 tree54 checked54)
    _ (by norm_num) _, areaUnits54]
  norm_num

-- Frozen phase 6051, atom 3163, type 0, source (32,91).
def leavesData55 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.node (.single ⟨2,0,1⟩) (.single ⟨2,1,0⟩)))) (.node (.node (.single ⟨2,1,1⟩) (.single ⟨2,2,0⟩)) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩)))))
def leaves55 : Fin 10 → DyadicLeaf := leavesData55.get
def raw55 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 32 91 leaves55 i
def outputData55 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨8192,8256,23296,23360⟩) (.single ⟨8192,8256,23360,23424⟩)) (.node (.single ⟨8256,8320,23296,23360⟩) (.node (.single ⟨8256,8320,23360,23424⟩) (.single ⟨8192,8320,23424,23552⟩)))) (.node (.node (.single ⟨8320,8384,23296,23360⟩) (.single ⟨8320,8384,23360,23424⟩)) (.node (.single ⟨8384,8448,23296,23360⟩) (.node (.single ⟨8384,8448,23360,23424⟩) (.single ⟨8320,8448,23424,23552⟩))))) (.node (.node (.node (.single ⟨9216,9344,24320,24448⟩) (.single ⟨9216,9344,24448,24576⟩)) (.node (.single ⟨9344,9408,24320,24384⟩) (.node (.single ⟨9344,9408,24384,24448⟩) (.single ⟨9408,9472,24320,24384⟩)))) (.node (.node (.single ⟨9408,9472,24384,24448⟩) (.single ⟨9344,9408,24448,24512⟩)) (.node (.single ⟨9344,9408,24512,24576⟩) (.node (.single ⟨9408,9472,24448,24512⟩) (.single ⟨9408,9472,24512,24576⟩)))))) (.node (.node (.node (.node (.single ⟨23296,23360,8192,8256⟩) (.single ⟨23296,23360,8256,8320⟩)) (.node (.single ⟨23360,23424,8192,8256⟩) (.node (.single ⟨23360,23424,8256,8320⟩) (.single ⟨23296,23360,8320,8384⟩)))) (.node (.node (.single ⟨23296,23360,8384,8448⟩) (.single ⟨23360,23424,8320,8384⟩)) (.node (.single ⟨23360,23424,8384,8448⟩) (.node (.single ⟨23424,23552,8192,8320⟩) (.single ⟨23424,23552,8320,8448⟩))))) (.node (.node (.node (.single ⟨24320,24448,9216,9344⟩) (.single ⟨24320,24384,9344,9408⟩)) (.node (.single ⟨24320,24384,9408,9472⟩) (.node (.single ⟨24384,24448,9344,9408⟩) (.single ⟨24384,24448,9408,9472⟩)))) (.node (.node (.single ⟨24448,24576,9216,9344⟩) (.single ⟨24448,24512,9344,9408⟩)) (.node (.single ⟨24448,24512,9408,9472⟩) (.node (.single ⟨24512,24576,9344,9408⟩) (.single ⟨24512,24576,9408,9472⟩)))))))
def output55 : Fin 40 → GridBox := outputData55.get
def coverData55 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 0) (.single 20))))) (.node (.node (.node (.single 39) (.single 19)) (.node (.single 1) (.node (.single 22) (.single 38)))) (.node (.node (.single 17) (.single 2)) (.node (.single 21) (.node (.single 37) (.single 18)))))) (.node (.node (.node (.node (.single 3) (.single 23)) (.node (.single 36) (.node (.single 16) (.single 5)))) (.node (.node (.single 24) (.single 34)) (.node (.single 15) (.node (.single 6) (.single 26))))) (.node (.node (.node (.single 33) (.single 13)) (.node (.single 7) (.node (.single 25) (.single 32)))) (.node (.node (.single 14) (.single 8)) (.node (.single 27) (.node (.single 31) (.single 12)))))))
def sourceData55 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 0)))) (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 39) (.node (.single 31) (.single 35)))) (.node (.node (.single 27) (.single 23)) (.node (.single 15) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.node (.single 21) (.single 25)))) (.node (.node (.single 33) (.single 29)) (.node (.single 37) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 2) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))))))
def cover55 (i : Fin 40) : Fin 40 := ⟨coverData55.get i % 40, Nat.mod_lt _ (by decide)⟩
def source55 (i : Fin 40) : Fin 40 := ⟨sourceData55.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree55 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 (.cutX 8704 (.cutY 23040 .empty (.cutX 8448 (.cutY 23296 .empty (.cutX 8320 (.cutY 23424 (.cutX 8256 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full) (.cutY 23424 (.cutX 8384 (.cutY 23360 .full .full) (.cutY 23360 .full .full)) .full))) .empty)) .empty) .empty) (.cutY 23552 .empty (.cutX 9728 (.cutY 24064 .empty (.cutX 9472 (.cutY 24320 .empty (.cutX 9344 (.cutY 24448 .full .full) (.cutY 24448 (.cutX 9408 (.cutY 24384 .full .full) (.cutY 24384 .full .full)) (.cutX 9408 (.cutY 24512 .full .full) (.cutY 24512 .full .full))))) .empty)) .empty)))) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 (.cutY 9216 (.cutX 23040 .empty (.cutY 8704 (.cutX 23296 .empty (.cutY 8448 (.cutX 23424 (.cutY 8320 (.cutX 23360 (.cutY 8256 .full .full) (.cutY 8256 .full .full)) (.cutX 23360 (.cutY 8384 .full .full) (.cutY 8384 .full .full))) (.cutY 8320 .full .full)) .empty)) .empty)) .empty) (.cutY 9216 .empty (.cutX 24064 .empty (.cutY 9728 (.cutX 24320 .empty (.cutY 9472 (.cutX 24448 (.cutY 9344 .full (.cutX 24384 (.cutY 9408 .full .full) (.cutY 9408 .full .full))) (.cutY 9344 .full (.cutX 24512 (.cutY 9408 .full .full) (.cutY 9408 .full .full)))) .empty)) .empty)))) .empty)) .empty))) .empty) .empty))

theorem metadata55 : 0<75538780 ∧ 32<128 ∧ 91<128 ∧ 0<4 ∧
    3163/4160=0 ∧ 3163%4160=3163 ∧ ∀ i, (leaves55 i).Valid 8 := by
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

noncomputable def phaseMass55 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw55 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass55_eq : phaseMass55 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass55
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw55 output55 cover55 source55
    (gridTreeUnionCheck_sound 32768 raw55 output55 cover55 source55 tree55 checked55)
    _ (by norm_num) _, areaUnits55]
  norm_num

-- Frozen phase 6052, atom 3030, type 0, source (30,90).
def leavesData56 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves56 : Fin 7 → DyadicLeaf := leavesData56.get
def raw56 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 30 90 leaves56 i
def outputData56 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨7680,7808,23040,23168⟩) (.node (.single ⟨7680,7808,23168,23296⟩) (.single ⟨7808,7872,23040,23104⟩))) (.node (.node (.single ⟨7808,7872,23104,23168⟩) (.single ⟨7872,7936,23040,23104⟩)) (.node (.single ⟨7872,7936,23104,23168⟩) (.single ⟨7808,7936,23168,23296⟩)))) (.node (.node (.single ⟨9472,9600,24832,24960⟩) (.node (.single ⟨9472,9600,24960,25088⟩) (.single ⟨9600,9664,24832,24896⟩))) (.node (.node (.single ⟨9600,9664,24896,24960⟩) (.single ⟨9664,9728,24832,24896⟩)) (.node (.single ⟨9664,9728,24896,24960⟩) (.single ⟨9600,9728,24960,25088⟩))))) (.node (.node (.node (.single ⟨23040,23168,7680,7808⟩) (.node (.single ⟨23040,23104,7808,7872⟩) (.single ⟨23040,23104,7872,7936⟩))) (.node (.node (.single ⟨23104,23168,7808,7872⟩) (.single ⟨23104,23168,7872,7936⟩)) (.node (.single ⟨23168,23296,7680,7808⟩) (.single ⟨23168,23296,7808,7936⟩)))) (.node (.node (.single ⟨24832,24960,9472,9600⟩) (.node (.single ⟨24832,24896,9600,9664⟩) (.single ⟨24832,24896,9664,9728⟩))) (.node (.node (.single ⟨24896,24960,9600,9664⟩) (.single ⟨24896,24960,9664,9728⟩)) (.node (.single ⟨24960,25088,9472,9600⟩) (.single ⟨24960,25088,9600,9728⟩))))))
def output56 : Fin 28 → GridBox := outputData56.get
def coverData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData56 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover56 (i : Fin 28) : Fin 28 := ⟨coverData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def source56 (i : Fin 28) : Fin 28 := ⟨sourceData56.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree56 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 .empty (.cutX 7936 (.cutY 23296 (.cutX 7808 (.cutY 23168 .full .full) (.cutY 23168 (.cutX 7872 (.cutY 23104 .full .full) (.cutY 23104 .full .full)) .full)) .empty) .empty))) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 (.cutY 25088 (.cutX 9472 .empty (.cutY 24832 .empty (.cutX 9600 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 9664 (.cutY 24896 .full .full) (.cutY 24896 .full .full)) .full)))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 .empty (.cutY 7680 .empty (.cutX 23296 (.cutY 7936 (.cutX 23168 (.cutY 7808 .full (.cutX 23104 (.cutY 7872 .full .full) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty) .empty)))) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 (.cutX 24832 .empty (.cutY 9472 .empty (.cutX 24960 (.cutY 9600 .full (.cutX 24896 (.cutY 9664 .full .full) (.cutY 9664 .full .full))) (.cutY 9600 .full .full)))) .empty) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata56 : 0<145899414 ∧ 30<128 ∧ 90<128 ∧ 0<4 ∧
    3030/4160=0 ∧ 3030%4160=3030 ∧ ∀ i, (leaves56 i).Valid 8 := by
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

-- Frozen phase 6053, atom 687, type 0, source (5,72).
def leavesData57 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves57 : Fin 7 → DyadicLeaf := leavesData57.get
def raw57 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 5 72 leaves57 i
def outputData57 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1280,1408,18432,18560⟩) (.node (.single ⟨1280,1408,18560,18688⟩) (.single ⟨1408,1472,18432,18496⟩))) (.node (.node (.single ⟨1408,1472,18496,18560⟩) (.single ⟨1472,1536,18432,18496⟩)) (.node (.single ⟨1472,1536,18496,18560⟩) (.single ⟨1408,1536,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,31232,31360⟩) (.node (.single ⟨14080,14208,31360,31488⟩) (.single ⟨14208,14272,31232,31296⟩))) (.node (.node (.single ⟨14208,14272,31296,31360⟩) (.single ⟨14272,14336,31232,31296⟩)) (.node (.single ⟨14272,14336,31296,31360⟩) (.single ⟨14208,14336,31360,31488⟩))))) (.node (.node (.node (.single ⟨18432,18560,1280,1408⟩) (.node (.single ⟨18432,18496,1408,1472⟩) (.single ⟨18432,18496,1472,1536⟩))) (.node (.node (.single ⟨18496,18560,1408,1472⟩) (.single ⟨18496,18560,1472,1536⟩)) (.node (.single ⟨18560,18688,1280,1408⟩) (.single ⟨18560,18688,1408,1536⟩)))) (.node (.node (.single ⟨31232,31360,14080,14208⟩) (.node (.single ⟨31232,31296,14208,14272⟩) (.single ⟨31232,31296,14272,14336⟩))) (.node (.node (.single ⟨31296,31360,14208,14272⟩) (.single ⟨31296,31360,14272,14336⟩)) (.node (.single ⟨31360,31488,14080,14208⟩) (.single ⟨31360,31488,14208,14336⟩))))))
def output57 : Fin 28 → GridBox := outputData57.get
def coverData57 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData57 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover57 (i : Fin 28) : Fin 28 := ⟨coverData57.get i % 28, Nat.mod_lt _ (by decide)⟩
def source57 (i : Fin 28) : Fin 28 := ⟨sourceData57.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree57 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 (.cutX 1280 .empty (.cutY 18688 (.cutX 1408 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 1472 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 .empty (.cutX 14080 .empty (.cutY 31488 (.cutX 14208 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14272 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) .full)) .empty)))) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 (.cutX 18688 (.cutY 1280 .empty (.cutX 18560 (.cutY 1408 .full (.cutX 18496 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 .empty (.cutX 31488 (.cutY 14080 .empty (.cutX 31360 (.cutY 14208 .full (.cutX 31296 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty)))) .empty) .empty)))))) .empty))

theorem metadata57 : 0<34183877 ∧ 5<128 ∧ 72<128 ∧ 0<4 ∧
    687/4160=0 ∧ 687%4160=687 ∧ ∀ i, (leaves57 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData57).mp
    (by decide +kernel)

theorem sourceChecked57_0 : ∀ i : Fin 28,
    (fun i => output57 i = raw57 (source57 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem sourceChecked57 : ∀ i : Fin 28, (fun i => output57 i = raw57 (source57 i)) i :=
  forallFin_of_zero_offset (fun i => output57 i = raw57 (source57 i)) sourceChecked57_0

theorem coverChecked57_0 : ∀ i : Fin 28,
    (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) (finOffset 28 0 28 (by decide) i) := by decide +kernel

theorem coverChecked57 : ∀ i : Fin 28, (fun i => (output57 (cover57 i)).ContainsBox (raw57 i)) i :=
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

noncomputable def phaseMass57 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw57 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass57_eq : phaseMass57 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass57
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw57 output57 cover57 source57
    (gridTreeUnionCheck_sound 32768 raw57 output57 cover57 source57 tree57 checked57)
    _ (by norm_num) _, areaUnits57]
  norm_num

-- Frozen phase 6054, atom 2661, type 0, source (25,86).
def leavesData58 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves58 : Fin 10 → DyadicLeaf := leavesData58.get
def raw58 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 25 86 leaves58 i
def outputData58 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6400,6464,22016,22080⟩) (.single ⟨6400,6464,22080,22144⟩)) (.node (.single ⟨6464,6528,22016,22080⟩) (.node (.single ⟨6464,6528,22080,22144⟩) (.single ⟨6400,6528,22144,22272⟩)))) (.node (.node (.single ⟨6528,6592,22016,22080⟩) (.single ⟨6528,6592,22080,22144⟩)) (.node (.single ⟨6592,6656,22016,22080⟩) (.node (.single ⟨6592,6656,22080,22144⟩) (.single ⟨6528,6656,22144,22272⟩))))) (.node (.node (.node (.single ⟨10496,10624,26112,26240⟩) (.single ⟨10496,10624,26240,26368⟩)) (.node (.single ⟨10624,10688,26112,26176⟩) (.node (.single ⟨10624,10688,26176,26240⟩) (.single ⟨10688,10752,26112,26176⟩)))) (.node (.node (.single ⟨10688,10752,26176,26240⟩) (.single ⟨10624,10688,26240,26304⟩)) (.node (.single ⟨10624,10688,26304,26368⟩) (.node (.single ⟨10688,10752,26240,26304⟩) (.single ⟨10688,10752,26304,26368⟩)))))) (.node (.node (.node (.node (.single ⟨22016,22080,6400,6464⟩) (.single ⟨22016,22080,6464,6528⟩)) (.node (.single ⟨22080,22144,6400,6464⟩) (.node (.single ⟨22080,22144,6464,6528⟩) (.single ⟨22016,22080,6528,6592⟩)))) (.node (.node (.single ⟨22016,22080,6592,6656⟩) (.single ⟨22080,22144,6528,6592⟩)) (.node (.single ⟨22080,22144,6592,6656⟩) (.node (.single ⟨22144,22272,6400,6528⟩) (.single ⟨22144,22272,6528,6656⟩))))) (.node (.node (.node (.single ⟨26112,26240,10496,10624⟩) (.single ⟨26112,26176,10624,10688⟩)) (.node (.single ⟨26112,26176,10688,10752⟩) (.node (.single ⟨26176,26240,10624,10688⟩) (.single ⟨26176,26240,10688,10752⟩)))) (.node (.node (.single ⟨26240,26368,10496,10624⟩) (.single ⟨26240,26304,10624,10688⟩)) (.node (.single ⟨26240,26304,10688,10752⟩) (.node (.single ⟨26304,26368,10624,10688⟩) (.single ⟨26304,26368,10688,10752⟩)))))))
def output58 : Fin 40 → GridBox := outputData58.get
def coverData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData58 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover58 (i : Fin 40) : Fin 40 := ⟨coverData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def source58 (i : Fin 40) : Fin 40 := ⟨sourceData58.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree58 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 (.cutY 22016 .empty (.cutX 6400 .empty (.cutY 22272 (.cutX 6528 (.cutY 22144 (.cutX 6464 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full) (.cutY 22144 (.cutX 6592 (.cutY 22080 .full .full) (.cutY 22080 .full .full)) .full)) .empty))) .empty)) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 .empty (.cutX 10496 .empty (.cutY 26368 (.cutX 10624 (.cutY 26240 .full .full) (.cutY 26240 (.cutX 10688 (.cutY 26176 .full .full) (.cutY 26176 .full .full)) (.cutX 10688 (.cutY 26304 .full .full) (.cutY 26304 .full .full)))) .empty))) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 (.cutX 22272 (.cutY 6400 .empty (.cutX 22144 (.cutY 6528 (.cutX 22080 (.cutY 6464 .full .full) (.cutY 6464 .full .full)) (.cutX 22080 (.cutY 6592 .full .full) (.cutY 6592 .full .full))) (.cutY 6528 .full .full))) .empty) .empty)) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 .empty (.cutY 10752 (.cutX 26368 (.cutY 10496 .empty (.cutX 26240 (.cutY 10624 .full (.cutX 26176 (.cutY 10688 .full .full) (.cutY 10688 .full .full))) (.cutY 10624 .full (.cutX 26304 (.cutY 10688 .full .full) (.cutY 10688 .full .full))))) .empty) .empty)) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata58 : 0<104681033 ∧ 25<128 ∧ 86<128 ∧ 0<4 ∧
    2661/4160=0 ∧ 2661%4160=2661 ∧ ∀ i, (leaves58 i).Valid 8 := by
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

noncomputable def phaseMass58 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw58 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass58_eq : phaseMass58 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass58
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw58 output58 cover58 source58
    (gridTreeUnionCheck_sound 32768 raw58 output58 cover58 source58 tree58 checked58)
    _ (by norm_num) _, areaUnits58]
  norm_num

-- Frozen phase 6055, atom 7187, type 1, source (30,87).
def leavesData59 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves59 : Fin 10 → DyadicLeaf := leavesData59.get
def raw59 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 30 87 leaves59 i
def outputData59 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨7680,7808,22272,22400⟩) (.single ⟨7680,7808,22400,22528⟩)) (.node (.single ⟨7808,7872,22272,22336⟩) (.node (.single ⟨7808,7872,22336,22400⟩) (.single ⟨7872,7904,22272,22304⟩)))) (.node (.node (.single ⟨7872,7904,22304,22336⟩) (.single ⟨7904,7936,22272,22304⟩)) (.node (.single ⟨7904,7936,22304,22336⟩) (.node (.single ⟨7872,7936,22336,22400⟩) (.single ⟨7808,7936,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,24832,24960⟩) (.single ⟨10240,10368,24960,25088⟩)) (.node (.single ⟨10368,10432,24832,24896⟩) (.node (.single ⟨10368,10432,24896,24960⟩) (.single ⟨10432,10464,24832,24864⟩)))) (.node (.node (.single ⟨10432,10464,24864,24896⟩) (.single ⟨10464,10496,24832,24864⟩)) (.node (.single ⟨10464,10496,24864,24896⟩) (.node (.single ⟨10432,10496,24896,24960⟩) (.single ⟨10368,10496,24960,25088⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22400,7680,7808⟩) (.single ⟨22272,22336,7808,7872⟩)) (.node (.single ⟨22272,22304,7872,7904⟩) (.node (.single ⟨22272,22304,7904,7936⟩) (.single ⟨22304,22336,7872,7904⟩)))) (.node (.node (.single ⟨22304,22336,7904,7936⟩) (.single ⟨22336,22400,7808,7872⟩)) (.node (.single ⟨22336,22400,7872,7936⟩) (.node (.single ⟨22400,22528,7680,7808⟩) (.single ⟨22400,22528,7808,7936⟩))))) (.node (.node (.node (.single ⟨24832,24960,10240,10368⟩) (.single ⟨24832,24896,10368,10432⟩)) (.node (.single ⟨24832,24864,10432,10464⟩) (.node (.single ⟨24832,24864,10464,10496⟩) (.single ⟨24864,24896,10432,10464⟩)))) (.node (.node (.single ⟨24864,24896,10464,10496⟩) (.single ⟨24896,24960,10368,10432⟩)) (.node (.single ⟨24896,24960,10432,10496⟩) (.node (.single ⟨24960,25088,10240,10368⟩) (.single ⟨24960,25088,10368,10496⟩)))))))
def output59 : Fin 40 → GridBox := outputData59.get
def coverData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData59 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover59 (i : Fin 40) : Fin 40 := ⟨coverData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def source59 (i : Fin 40) : Fin 40 := ⟨sourceData59.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree59 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 .empty (.cutY 21504 .empty (.cutX 7680 .empty (.cutY 22016 .empty (.cutX 7936 (.cutY 22272 .empty (.cutX 7808 (.cutY 22400 .full .full) (.cutY 22400 (.cutX 7872 (.cutY 22336 .full .full) (.cutY 22336 (.cutX 7904 (.cutY 22304 .full .full) (.cutY 22304 .full .full)) .full)) .full))) .empty))))) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 (.cutX 10752 (.cutY 25088 (.cutX 10496 (.cutY 24832 .empty (.cutX 10368 (.cutY 24960 .full .full) (.cutY 24960 (.cutX 10432 (.cutY 24896 .full .full) (.cutY 24896 (.cutX 10464 (.cutY 24864 .full .full) (.cutY 24864 .full .full)) .full)) .full))) .empty) .empty) .empty) .empty) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 .empty (.cutX 22016 .empty (.cutY 7680 .empty (.cutX 22272 .empty (.cutY 7936 (.cutX 22400 (.cutY 7808 .full (.cutX 22336 (.cutY 7872 .full (.cutX 22304 (.cutY 7904 .full .full) (.cutY 7904 .full .full))) (.cutY 7872 .full .full))) (.cutY 7808 .full .full)) .empty))))))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 (.cutY 11264 (.cutX 25088 (.cutY 10752 (.cutX 24832 .empty (.cutY 10496 (.cutX 24960 (.cutY 10368 .full (.cutX 24896 (.cutY 10432 .full (.cutX 24864 (.cutY 10464 .full .full) (.cutY 10464 .full .full))) (.cutY 10432 .full .full))) (.cutY 10368 .full .full)) .empty)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty))

theorem metadata59 : 0<144359671 ∧ 30<128 ∧ 87<128 ∧ 1<4 ∧
    7187/4160=1 ∧ 7187%4160=3027 ∧ ∀ i, (leaves59 i).Valid 8 := by
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

noncomputable def phaseMass59 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw59 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass59_eq : phaseMass59 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass59
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw59 output59 cover59 source59
    (gridTreeUnionCheck_sound 32768 raw59 output59 cover59 source59 tree59 checked59)
    _ (by norm_num) _, areaUnits59]
  norm_num

-- Frozen phase 6056, atom 1872, type 0, source (16,80).
def leavesData60 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves60 : Fin 10 → DyadicLeaf := leavesData60.get
def raw60 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 80 leaves60 i
def outputData60 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,20480,20608⟩) (.single ⟨4096,4224,20608,20736⟩)) (.node (.single ⟨4224,4288,20480,20544⟩) (.node (.single ⟨4224,4288,20544,20608⟩) (.single ⟨4288,4320,20480,20512⟩)))) (.node (.node (.single ⟨4288,4320,20512,20544⟩) (.single ⟨4320,4352,20480,20512⟩)) (.node (.single ⟨4320,4352,20512,20544⟩) (.node (.single ⟨4288,4352,20544,20608⟩) (.single ⟨4224,4352,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,28416,28544⟩) (.single ⟨12032,12160,28544,28672⟩)) (.node (.single ⟨12160,12224,28416,28480⟩) (.node (.single ⟨12160,12224,28480,28544⟩) (.single ⟨12224,12256,28416,28448⟩)))) (.node (.node (.single ⟨12224,12256,28448,28480⟩) (.single ⟨12256,12288,28416,28448⟩)) (.node (.single ⟨12256,12288,28448,28480⟩) (.node (.single ⟨12224,12288,28480,28544⟩) (.single ⟨12160,12288,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20608,4096,4224⟩) (.single ⟨20480,20544,4224,4288⟩)) (.node (.single ⟨20480,20512,4288,4320⟩) (.node (.single ⟨20480,20512,4320,4352⟩) (.single ⟨20512,20544,4288,4320⟩)))) (.node (.node (.single ⟨20512,20544,4320,4352⟩) (.single ⟨20544,20608,4224,4288⟩)) (.node (.single ⟨20544,20608,4288,4352⟩) (.node (.single ⟨20608,20736,4096,4224⟩) (.single ⟨20608,20736,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,12032,12160⟩) (.single ⟨28416,28480,12160,12224⟩)) (.node (.single ⟨28416,28448,12224,12256⟩) (.node (.single ⟨28416,28448,12256,12288⟩) (.single ⟨28448,28480,12224,12256⟩)))) (.node (.node (.single ⟨28448,28480,12256,12288⟩) (.single ⟨28480,28544,12160,12224⟩)) (.node (.single ⟨28480,28544,12224,12288⟩) (.node (.single ⟨28544,28672,12032,12160⟩) (.single ⟨28544,28672,12160,12288⟩)))))))
def output60 : Fin 40 → GridBox := outputData60.get
def coverData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData60 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover60 (i : Fin 40) : Fin 40 := ⟨coverData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def source60 (i : Fin 40) : Fin 40 := ⟨sourceData60.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree60 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 (.cutX 4352 (.cutY 20736 (.cutX 4224 (.cutY 20608 .full .full) (.cutY 20608 (.cutX 4288 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 4320 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 .empty (.cutX 12032 .empty (.cutY 28416 .empty (.cutX 12160 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 12224 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 12256 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full)))))))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 (.cutX 20736 (.cutY 4352 (.cutX 20608 (.cutY 4224 .full (.cutX 20544 (.cutY 4288 .full (.cutX 20512 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 .empty (.cutX 28416 .empty (.cutY 12032 .empty (.cutX 28544 (.cutY 12160 .full (.cutX 28480 (.cutY 12224 .full (.cutX 28448 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full .full)))))))))) .empty) .empty))) .empty))

theorem metadata60 : 0<152546139 ∧ 16<128 ∧ 80<128 ∧ 0<4 ∧
    1872/4160=0 ∧ 1872%4160=1872 ∧ ∀ i, (leaves60 i).Valid 8 := by
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

noncomputable def phaseMass60 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw60 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass60_eq : phaseMass60 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass60
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw60 output60 cover60 source60
    (gridTreeUnionCheck_sound 32768 raw60 output60 cover60 source60 tree60 checked60)
    _ (by norm_num) _, areaUnits60]
  norm_num

-- Frozen phase 6057, atom 6573, type 1, source (22,81).
def leavesData61 : FiniteInputTree DyadicLeaf 22 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,2,2⟩))) (.node (.single ⟨2,2,3⟩) (.node (.single ⟨2,3,2⟩) (.single ⟨2,3,3⟩))))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,1⟩) (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)))) (.node (.node (.single ⟨3,5,0⟩) (.node (.single ⟨3,5,1⟩) (.single ⟨4,14,0⟩))) (.node (.single ⟨4,14,1⟩) (.node (.single ⟨4,15,0⟩) (.single ⟨4,15,1⟩))))))
def leaves61 : Fin 22 → DyadicLeaf := leavesData61.get
def raw61 (i : Fin 88) : GridBox := phaseImageBoxes 32768 8 22 81 leaves61 i
def outputData61 : FiniteInputTree GridBox 88 := (.node (.node (.node (.node (.node (.node (.single ⟨5632,5696,20736,20800⟩) (.single ⟨5632,5696,20800,20864⟩)) (.node (.single ⟨5696,5760,20736,20800⟩) (.node (.single ⟨5696,5760,20800,20864⟩) (.single ⟨5632,5760,20864,20992⟩)))) (.node (.node (.single ⟨5760,5792,20736,20768⟩) (.node (.single ⟨5760,5792,20768,20800⟩) (.single ⟨5792,5824,20736,20768⟩))) (.node (.single ⟨5792,5824,20768,20800⟩) (.node (.single ⟨5760,5824,20800,20864⟩) (.single ⟨5824,5856,20736,20768⟩))))) (.node (.node (.node (.single ⟨5824,5856,20768,20800⟩) (.single ⟨5856,5872,20736,20752⟩)) (.node (.single ⟨5856,5872,20752,20768⟩) (.node (.single ⟨5872,5888,20736,20752⟩) (.single ⟨5872,5888,20752,20768⟩)))) (.node (.node (.single ⟨5856,5888,20768,20800⟩) (.node (.single ⟨5824,5888,20800,20864⟩) (.single ⟨5760,5824,20864,20928⟩))) (.node (.single ⟨5760,5824,20928,20992⟩) (.node (.single ⟨5824,5888,20864,20928⟩) (.single ⟨5824,5888,20928,20992⟩)))))) (.node (.node (.node (.node (.single ⟨11776,11840,26880,26944⟩) (.single ⟨11776,11840,26944,27008⟩)) (.node (.single ⟨11840,11904,26880,26944⟩) (.node (.single ⟨11840,11904,26944,27008⟩) (.single ⟨11776,11904,27008,27136⟩)))) (.node (.node (.single ⟨11904,11968,26880,26944⟩) (.node (.single ⟨11904,11968,26944,27008⟩) (.single ⟨11968,12000,26880,26912⟩))) (.node (.single ⟨11968,12000,26912,26944⟩) (.node (.single ⟨12000,12016,26880,26896⟩) (.single ⟨12000,12016,26896,26912⟩))))) (.node (.node (.node (.single ⟨12016,12032,26880,26896⟩) (.single ⟨12016,12032,26896,26912⟩)) (.node (.single ⟨12000,12032,26912,26944⟩) (.node (.single ⟨11968,12000,26944,26976⟩) (.single ⟨11968,12000,26976,27008⟩)))) (.node (.node (.single ⟨12000,12032,26944,26976⟩) (.node (.single ⟨12000,12032,26976,27008⟩) (.single ⟨11904,11968,27008,27072⟩))) (.node (.single ⟨11904,11968,27072,27136⟩) (.node (.single ⟨11968,12032,27008,27072⟩) (.single ⟨11968,12032,27072,27136⟩))))))) (.node (.node (.node (.node (.node (.single ⟨20736,20800,5632,5696⟩) (.single ⟨20736,20800,5696,5760⟩)) (.node (.single ⟨20800,20864,5632,5696⟩) (.node (.single ⟨20800,20864,5696,5760⟩) (.single ⟨20736,20768,5760,5792⟩)))) (.node (.node (.single ⟨20736,20768,5792,5824⟩) (.node (.single ⟨20768,20800,5760,5792⟩) (.single ⟨20768,20800,5792,5824⟩))) (.node (.single ⟨20736,20768,5824,5856⟩) (.node (.single ⟨20736,20752,5856,5872⟩) (.single ⟨20736,20752,5872,5888⟩))))) (.node (.node (.node (.single ⟨20752,20768,5856,5872⟩) (.single ⟨20752,20768,5872,5888⟩)) (.node (.single ⟨20768,20800,5824,5856⟩) (.node (.single ⟨20768,20800,5856,5888⟩) (.single ⟨20800,20864,5760,5824⟩)))) (.node (.node (.single ⟨20800,20864,5824,5888⟩) (.node (.single ⟨20864,20992,5632,5760⟩) (.single ⟨20864,20928,5760,5824⟩))) (.node (.single ⟨20864,20928,5824,5888⟩) (.node (.single ⟨20928,20992,5760,5824⟩) (.single ⟨20928,20992,5824,5888⟩)))))) (.node (.node (.node (.node (.single ⟨26880,26944,11776,11840⟩) (.single ⟨26880,26944,11840,11904⟩)) (.node (.single ⟨26944,27008,11776,11840⟩) (.node (.single ⟨26944,27008,11840,11904⟩) (.single ⟨26880,26944,11904,11968⟩)))) (.node (.node (.single ⟨26880,26912,11968,12000⟩) (.node (.single ⟨26880,26896,12000,12016⟩) (.single ⟨26880,26896,12016,12032⟩))) (.node (.single ⟨26896,26912,12000,12016⟩) (.node (.single ⟨26896,26912,12016,12032⟩) (.single ⟨26912,26944,11968,12000⟩))))) (.node (.node (.node (.single ⟨26912,26944,12000,12032⟩) (.single ⟨26944,27008,11904,11968⟩)) (.node (.single ⟨26944,26976,11968,12000⟩) (.node (.single ⟨26944,26976,12000,12032⟩) (.single ⟨26976,27008,11968,12000⟩)))) (.node (.node (.single ⟨26976,27008,12000,12032⟩) (.node (.single ⟨27008,27136,11776,11904⟩) (.single ⟨27008,27072,11904,11968⟩))) (.node (.single ⟨27008,27072,11968,12032⟩) (.node (.single ⟨27072,27136,11904,11968⟩) (.single ⟨27072,27136,11968,12032⟩))))))))
def output61 : Fin 88 → GridBox := outputData61.get
def coverData61 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 61)) (.node (.single 83) (.node (.single 26) (.single 0)))) (.node (.node (.single 44) (.node (.single 87) (.single 43))) (.node (.single 1) (.node (.single 46) (.single 86))))) (.node (.node (.node (.single 41) (.single 2)) (.node (.single 45) (.node (.single 85) (.single 42)))) (.node (.node (.single 3) (.node (.single 47) (.single 84))) (.node (.single 40) (.node (.single 9) (.single 59)))))) (.node (.node (.node (.node (.single 78) (.single 28)) (.node (.single 17) (.node (.single 60) (.single 70)))) (.node (.node (.single 27) (.node (.single 18) (.single 62))) (.node (.single 69) (.node (.single 25) (.single 19))))) (.node (.node (.node (.single 64) (.single 68)) (.node (.single 23) (.node (.single 20) (.single 63)))) (.node (.node (.single 67) (.node (.single 24) (.single 21))) (.node (.single 65) (.node (.single 66) (.single 22))))))) (.node (.node (.node (.node (.node (.single 10) (.single 52)) (.node (.single 77) (.node (.single 35) (.single 11)))) (.node (.node (.single 57) (.node (.single 76) (.single 30))) (.node (.single 16) (.node (.single 58) (.single 71))))) (.node (.node (.node (.single 29) (.single 5)) (.node (.single 48) (.node (.single 82) (.single 39)))) (.node (.node (.single 6) (.node (.single 50) (.single 81))) (.node (.single 37) (.node (.single 7) (.single 49)))))) (.node (.node (.node (.node (.single 80) (.single 38)) (.node (.single 8) (.node (.single 51) (.single 79)))) (.node (.node (.single 36) (.node (.single 12) (.single 53))) (.node (.single 75) (.node (.single 34) (.single 13))))) (.node (.node (.node (.single 55) (.single 74)) (.node (.single 32) (.node (.single 14) (.single 54)))) (.node (.node (.single 73) (.node (.single 33) (.single 15))) (.node (.single 56) (.node (.single 72) (.single 31))))))))
def sourceData61 : FiniteInputTree ℕ 88 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 8)) (.node (.single 12) (.node (.single 16) (.single 0)))) (.node (.node (.single 56) (.node (.single 60) (.single 64))) (.node (.single 68) (.node (.single 20) (.single 44))))) (.node (.node (.node (.single 48) (.single 72)) (.node (.single 76) (.node (.single 80) (.single 84)))) (.node (.node (.single 52) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 36) (.single 40)))))) (.node (.node (.node (.node (.single 43) (.single 35)) (.node (.single 39) (.node (.single 31) (.single 3)))) (.node (.node (.single 27) (.node (.single 23) (.single 55))) (.node (.single 51) (.node (.single 87) (.single 79))))) (.node (.node (.node (.single 83) (.single 75)) (.node (.single 47) (.node (.single 71) (.single 63)))) (.node (.node (.single 67) (.node (.single 59) (.single 19))) (.node (.single 11) (.node (.single 15) (.single 7))))))) (.node (.node (.node (.node (.node (.single 5) (.single 13)) (.node (.single 9) (.node (.single 17) (.single 57)))) (.node (.node (.single 65) (.node (.single 61) (.single 69))) (.node (.single 45) (.node (.single 73) (.single 81))))) (.node (.node (.node (.single 77) (.single 85)) (.node (.single 49) (.node (.single 53) (.single 21)))) (.node (.node (.single 25) (.node (.single 1) (.single 29))) (.node (.single 37) (.node (.single 33) (.single 41)))))) (.node (.node (.node (.node (.single 42) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))) (.node (.node (.single 54) (.node (.single 86) (.single 82))) (.node (.single 78) (.node (.single 74) (.single 50))))) (.node (.node (.node (.single 46) (.single 22)) (.node (.single 70) (.node (.single 66) (.single 62)))) (.node (.node (.single 58) (.node (.single 2) (.single 18))) (.node (.single 14) (.node (.single 10) (.single 6))))))))
def cover61 (i : Fin 88) : Fin 88 := ⟨coverData61.get i % 88, Nat.mod_lt _ (by decide)⟩
def source61 (i : Fin 88) : Fin 88 := ⟨sourceData61.get i % 88, Nat.mod_lt _ (by decide)⟩
def tree61 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 (.cutX 5888 (.cutY 20736 .empty (.cutX 5760 (.cutY 20864 (.cutX 5696 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 5824 (.cutY 20800 (.cutX 5792 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full) (.cutY 20800 (.cutX 5856 (.cutY 20768 .full .full) (.cutY 20768 (.cutX 5872 (.cutY 20752 .full .full) (.cutY 20752 .full .full)) .full)) .full)) (.cutX 5824 (.cutY 20928 .full .full) (.cutY 20928 .full .full))))) .empty) .empty)) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 (.cutX 12032 (.cutY 26880 .empty (.cutX 11904 (.cutY 27008 (.cutX 11840 (.cutY 26944 .full .full) (.cutY 26944 .full .full)) .full) (.cutY 27008 (.cutX 11968 (.cutY 26944 .full .full) (.cutY 26944 (.cutX 12000 (.cutY 26912 .full .full) (.cutY 26912 (.cutX 12016 (.cutY 26896 .full .full) (.cutY 26896 .full .full)) .full)) (.cutX 12000 (.cutY 26976 .full .full) (.cutY 26976 .full .full)))) (.cutX 11968 (.cutY 27072 .full .full) (.cutY 27072 .full .full))))) .empty) .empty)) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 .empty (.cutX 20736 .empty (.cutY 5888 (.cutX 20864 (.cutY 5760 (.cutX 20800 (.cutY 5696 .full .full) (.cutY 5696 .full .full)) (.cutX 20800 (.cutY 5824 (.cutX 20768 (.cutY 5792 .full .full) (.cutY 5792 .full .full)) (.cutX 20768 (.cutY 5856 .full (.cutX 20752 (.cutY 5872 .full .full) (.cutY 5872 .full .full))) (.cutY 5856 .full .full))) (.cutY 5824 .full .full))) (.cutY 5760 .full (.cutX 20928 (.cutY 5824 .full .full) (.cutY 5824 .full .full)))) .empty))) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 .empty (.cutX 26880 .empty (.cutY 12032 (.cutX 27008 (.cutY 11904 (.cutX 26944 (.cutY 11840 .full .full) (.cutY 11840 .full .full)) (.cutX 26944 (.cutY 11968 .full (.cutX 26912 (.cutY 12000 .full (.cutX 26896 (.cutY 12016 .full .full) (.cutY 12016 .full .full))) (.cutY 12000 .full .full))) (.cutY 11968 .full (.cutX 26976 (.cutY 12000 .full .full) (.cutY 12000 .full .full))))) (.cutY 11904 .full (.cutX 27072 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty))) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata61 : 0<125829407 ∧ 22<128 ∧ 81<128 ∧ 1<4 ∧
    6573/4160=1 ∧ 6573%4160=2413 ∧ ∀ i, (leaves61 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData61).mp
    (by decide +kernel)

theorem sourceChecked61_0 : ∀ i : Fin 64,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked61_64 : ∀ i : Fin 24,
    (fun i => output61 i = raw61 (source61 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem sourceChecked61 : ∀ i : Fin 88, (fun i => output61 i = raw61 (source61 i)) i :=
  forallFin_of_zero_offset (fun i => output61 i = raw61 (source61 i)) (forallFinOffset_add (fun i => output61 i = raw61 (source61 i)) 0 64 24 (by decide) sourceChecked61_0
    sourceChecked61_64)

theorem coverChecked61_0 : ∀ i : Fin 64,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 88 0 64 (by decide) i) := by decide +kernel

theorem coverChecked61_64 : ∀ i : Fin 24,
    (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (finOffset 88 64 24 (by decide) i) := by decide +kernel

theorem coverChecked61 : ∀ i : Fin 88, (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) i :=
  forallFin_of_zero_offset (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) (forallFinOffset_add (fun i => (output61 (cover61 i)).ContainsBox (raw61 i)) 0 64 24 (by decide) coverChecked61_0
    coverChecked61_64)

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

noncomputable def phaseMass61 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw61 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass61_eq : phaseMass61 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass61
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw61 output61 cover61 source61
    (gridTreeUnionCheck_sound 32768 raw61 output61 cover61 source61 tree61 checked61)
    _ (by norm_num) _, areaUnits61]
  norm_num

-- Frozen phase 6058, atom 1968, type 0, source (17,81).
def leavesData62 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves62 : Fin 13 → DyadicLeaf := leavesData62.get
def raw62 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 81 leaves62 i
def outputData62 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,20736,20800⟩) (.node (.single ⟨4352,4416,20800,20864⟩) (.single ⟨4416,4480,20736,20800⟩))) (.node (.single ⟨4416,4480,20800,20864⟩) (.node (.single ⟨4352,4480,20864,20992⟩) (.single ⟨4480,4544,20736,20800⟩)))) (.node (.node (.single ⟨4480,4544,20800,20864⟩) (.node (.single ⟨4544,4576,20736,20768⟩) (.single ⟨4544,4576,20768,20800⟩))) (.node (.node (.single ⟨4576,4608,20736,20768⟩) (.single ⟨4576,4608,20768,20800⟩)) (.node (.single ⟨4544,4608,20800,20864⟩) (.single ⟨4480,4608,20864,20992⟩))))) (.node (.node (.node (.single ⟨11776,11904,28160,28288⟩) (.node (.single ⟨11776,11904,28288,28416⟩) (.single ⟨11904,11968,28160,28224⟩))) (.node (.single ⟨11904,11968,28224,28288⟩) (.node (.single ⟨11968,12000,28160,28192⟩) (.single ⟨11968,12000,28192,28224⟩)))) (.node (.node (.single ⟨12000,12032,28160,28192⟩) (.node (.single ⟨12000,12032,28192,28224⟩) (.single ⟨11968,12032,28224,28288⟩))) (.node (.node (.single ⟨11904,11968,28288,28352⟩) (.single ⟨11904,11968,28352,28416⟩)) (.node (.single ⟨11968,12032,28288,28352⟩) (.single ⟨11968,12032,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨20736,20800,4352,4416⟩) (.node (.single ⟨20736,20800,4416,4480⟩) (.single ⟨20800,20864,4352,4416⟩))) (.node (.single ⟨20800,20864,4416,4480⟩) (.node (.single ⟨20736,20800,4480,4544⟩) (.single ⟨20736,20768,4544,4576⟩)))) (.node (.node (.single ⟨20736,20768,4576,4608⟩) (.node (.single ⟨20768,20800,4544,4576⟩) (.single ⟨20768,20800,4576,4608⟩))) (.node (.node (.single ⟨20800,20864,4480,4544⟩) (.single ⟨20800,20864,4544,4608⟩)) (.node (.single ⟨20864,20992,4352,4480⟩) (.single ⟨20864,20992,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,11776,11904⟩) (.node (.single ⟨28160,28224,11904,11968⟩) (.single ⟨28160,28192,11968,12000⟩))) (.node (.single ⟨28160,28192,12000,12032⟩) (.node (.single ⟨28192,28224,11968,12000⟩) (.single ⟨28192,28224,12000,12032⟩)))) (.node (.node (.single ⟨28224,28288,11904,11968⟩) (.node (.single ⟨28224,28288,11968,12032⟩) (.single ⟨28288,28416,11776,11904⟩))) (.node (.node (.single ⟨28288,28352,11904,11968⟩) (.single ⟨28288,28352,11968,12032⟩)) (.node (.single ⟨28352,28416,11904,11968⟩) (.single ⟨28352,28416,11968,12032⟩)))))))
def output62 : Fin 52 → GridBox := outputData62.get
def coverData62 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData62 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover62 (i : Fin 52) : Fin 52 := ⟨coverData62.get i % 52, Nat.mod_lt _ (by decide)⟩
def source62 (i : Fin 52) : Fin 52 := ⟨sourceData62.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree62 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 (.cutY 20992 (.cutX 4352 .empty (.cutY 20736 .empty (.cutX 4480 (.cutY 20864 (.cutX 4416 (.cutY 20800 .full .full) (.cutY 20800 .full .full)) .full) (.cutY 20864 (.cutX 4544 (.cutY 20800 .full .full) (.cutY 20800 (.cutX 4576 (.cutY 20768 .full .full) (.cutY 20768 .full .full)) .full)) .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 .empty (.cutY 28160 .empty (.cutX 12032 (.cutY 28416 (.cutX 11904 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 11968 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 12000 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 11968 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty) .empty))))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 (.cutY 4608 (.cutX 20736 .empty (.cutY 4352 .empty (.cutX 20864 (.cutY 4480 (.cutX 20800 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 20800 (.cutY 4544 .full (.cutX 20768 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 .empty (.cutY 11776 .empty (.cutX 28416 (.cutY 12032 (.cutX 28288 (.cutY 11904 .full (.cutX 28224 (.cutY 11968 .full (.cutX 28192 (.cutY 12000 .full .full) (.cutY 12000 .full .full))) (.cutY 11968 .full .full))) (.cutY 11904 .full (.cutX 28352 (.cutY 11968 .full .full) (.cutY 11968 .full .full)))) .empty) .empty))))))) .empty) .empty))) .empty))

theorem metadata62 : 0<152546139 ∧ 17<128 ∧ 81<128 ∧ 0<4 ∧
    1968/4160=0 ∧ 1968%4160=1968 ∧ ∀ i, (leaves62 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData62).mp
    (by decide +kernel)

theorem sourceChecked62_0 : ∀ i : Fin 52,
    (fun i => output62 i = raw62 (source62 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked62 : ∀ i : Fin 52, (fun i => output62 i = raw62 (source62 i)) i :=
  forallFin_of_zero_offset (fun i => output62 i = raw62 (source62 i)) sourceChecked62_0

theorem coverChecked62_0 : ∀ i : Fin 52,
    (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked62 : ∀ i : Fin 52, (fun i => (output62 (cover62 i)).ContainsBox (raw62 i)) i :=
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

noncomputable def phaseMass62 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw62 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass62_eq : phaseMass62 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass62
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw62 output62 cover62 source62
    (gridTreeUnionCheck_sound 32768 raw62 output62 cover62 source62 tree62 checked62)
    _ (by norm_num) _, areaUnits62]
  norm_num

-- Frozen phase 6059, atom 3289, type 0, source (34,93).
def leavesData63 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves63 : Fin 7 → DyadicLeaf := leavesData63.get
def raw63 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 34 93 leaves63 i
def outputData63 : FiniteInputTree GridBox 14 := (.node (.node (.node (.single ⟨8704,8832,23808,23936⟩) (.node (.single ⟨8704,8832,23936,24064⟩) (.single ⟨8832,8896,23808,23872⟩))) (.node (.node (.single ⟨8832,8896,23872,23936⟩) (.single ⟨8896,8960,23808,23872⟩)) (.node (.single ⟨8896,8960,23872,23936⟩) (.single ⟨8832,8960,23936,24064⟩)))) (.node (.node (.single ⟨23808,23936,8704,8832⟩) (.node (.single ⟨23808,23872,8832,8896⟩) (.single ⟨23808,23872,8896,8960⟩))) (.node (.node (.single ⟨23872,23936,8832,8896⟩) (.single ⟨23872,23936,8896,8960⟩)) (.node (.single ⟨23936,24064,8704,8832⟩) (.single ⟨23936,24064,8832,8960⟩)))))
def output63 : Fin 14 → GridBox := outputData63.get
def coverData63 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 7) (.single 13))) (.node (.node (.single 6) (.single 1)) (.node (.single 12) (.single 12)))) (.node (.node (.single 1) (.node (.single 6) (.single 13))) (.node (.node (.single 7) (.single 0)) (.node (.single 2) (.single 8))))) (.node (.node (.node (.single 11) (.node (.single 5) (.single 3))) (.node (.node (.single 10) (.single 10)) (.node (.single 3) (.single 4)))) (.node (.node (.single 9) (.node (.single 9) (.single 4))) (.node (.node (.single 5) (.single 11)) (.node (.single 8) (.single 2))))))
def sourceData63 : FiniteInputTree ℕ 14 := (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 15) (.single 3)))) (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 14)) (.node (.single 5) (.single 2)))))
def cover63 (i : Fin 28) : Fin 14 := ⟨coverData63.get i % 14, Nat.mod_lt _ (by decide)⟩
def source63 (i : Fin 14) : Fin 28 := ⟨sourceData63.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree63 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 .empty (.cutY 24064 (.cutX 8960 (.cutY 23808 .empty (.cutX 8832 (.cutY 23936 .full .full) (.cutY 23936 (.cutX 8896 (.cutY 23872 .full .full) (.cutY 23872 .full .full)) .full))) .empty) .empty))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 .empty (.cutX 23808 .empty (.cutY 8960 (.cutX 23936 (.cutY 8832 .full (.cutX 23872 (.cutY 8896 .full .full) (.cutY 8896 .full .full))) (.cutY 8832 .full .full)) .empty))) .empty) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata63 : 0<75538780 ∧ 34<128 ∧ 93<128 ∧ 0<4 ∧
    3289/4160=0 ∧ 3289%4160=3289 ∧ ∀ i, (leaves63 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData63).mp
    (by decide +kernel)

theorem sourceChecked63_0 : ∀ i : Fin 14,
    (fun i => output63 i = raw63 (source63 i)) (finOffset 14 0 14 (by decide) i) := by decide +kernel

theorem sourceChecked63 : ∀ i : Fin 14, (fun i => output63 i = raw63 (source63 i)) i :=
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

theorem areaUnits63 : gridUnionAreaUnits output63 = 131072 := by decide +kernel

noncomputable def phaseMass63 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw63 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass63_eq : phaseMass63 = (3776939/163840000000 : ℝ) := by
  unfold phaseMass63
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw63 output63 cover63 source63
    (gridTreeUnionCheck_sound 32768 raw63 output63 cover63 source63 tree63 checked63)
    _ (by norm_num) _, areaUnits63]
  norm_num

-- Frozen phase 6060, atom 3227, type 0, source (33,92).
def leavesData64 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves64 : Fin 13 → DyadicLeaf := leavesData64.get
def raw64 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 33 92 leaves64 i
def outputData64 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨8448,8512,23552,23616⟩) (.node (.single ⟨8448,8512,23616,23680⟩) (.single ⟨8512,8576,23552,23616⟩))) (.node (.single ⟨8512,8576,23616,23680⟩) (.node (.single ⟨8448,8576,23680,23808⟩) (.single ⟨8576,8640,23552,23616⟩)))) (.node (.node (.single ⟨8576,8640,23616,23680⟩) (.node (.single ⟨8640,8672,23552,23584⟩) (.single ⟨8640,8672,23584,23616⟩))) (.node (.node (.single ⟨8672,8704,23552,23584⟩) (.single ⟨8672,8704,23584,23616⟩)) (.node (.single ⟨8640,8704,23616,23680⟩) (.single ⟨8576,8704,23680,23808⟩))))) (.node (.node (.node (.single ⟨8960,9088,24064,24192⟩) (.node (.single ⟨8960,9088,24192,24320⟩) (.single ⟨9088,9152,24064,24128⟩))) (.node (.single ⟨9088,9152,24128,24192⟩) (.node (.single ⟨9152,9184,24064,24096⟩) (.single ⟨9152,9184,24096,24128⟩)))) (.node (.node (.single ⟨9184,9216,24064,24096⟩) (.node (.single ⟨9184,9216,24096,24128⟩) (.single ⟨9152,9216,24128,24192⟩))) (.node (.node (.single ⟨9088,9152,24192,24256⟩) (.single ⟨9088,9152,24256,24320⟩)) (.node (.single ⟨9152,9216,24192,24256⟩) (.single ⟨9152,9216,24256,24320⟩)))))) (.node (.node (.node (.node (.single ⟨23552,23616,8448,8512⟩) (.node (.single ⟨23552,23616,8512,8576⟩) (.single ⟨23616,23680,8448,8512⟩))) (.node (.single ⟨23616,23680,8512,8576⟩) (.node (.single ⟨23552,23616,8576,8640⟩) (.single ⟨23552,23584,8640,8672⟩)))) (.node (.node (.single ⟨23552,23584,8672,8704⟩) (.node (.single ⟨23584,23616,8640,8672⟩) (.single ⟨23584,23616,8672,8704⟩))) (.node (.node (.single ⟨23616,23680,8576,8640⟩) (.single ⟨23616,23680,8640,8704⟩)) (.node (.single ⟨23680,23808,8448,8576⟩) (.single ⟨23680,23808,8576,8704⟩))))) (.node (.node (.node (.single ⟨24064,24192,8960,9088⟩) (.node (.single ⟨24064,24128,9088,9152⟩) (.single ⟨24064,24096,9152,9184⟩))) (.node (.single ⟨24064,24096,9184,9216⟩) (.node (.single ⟨24096,24128,9152,9184⟩) (.single ⟨24096,24128,9184,9216⟩)))) (.node (.node (.single ⟨24128,24192,9088,9152⟩) (.node (.single ⟨24128,24192,9152,9216⟩) (.single ⟨24192,24320,8960,9088⟩))) (.node (.node (.single ⟨24192,24256,9088,9152⟩) (.single ⟨24192,24256,9152,9216⟩)) (.node (.single ⟨24256,24320,9088,9152⟩) (.single ⟨24256,24320,9152,9216⟩)))))))
def output64 : Fin 52 → GridBox := outputData64.get
def coverData64 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData64 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover64 (i : Fin 52) : Fin 52 := ⟨coverData64.get i % 52, Nat.mod_lt _ (by decide)⟩
def source64 (i : Fin 52) : Fin 52 := ⟨sourceData64.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree64 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 .empty (.cutY 24576 (.cutX 12288 (.cutY 20480 .empty (.cutX 10240 (.cutY 22528 .empty (.cutX 9216 (.cutY 23552 .empty (.cutX 8704 (.cutY 24064 (.cutX 8448 .empty (.cutY 23808 (.cutX 8576 (.cutY 23680 (.cutX 8512 (.cutY 23616 .full .full) (.cutY 23616 .full .full)) .full) (.cutY 23680 (.cutX 8640 (.cutY 23616 .full .full) (.cutY 23616 (.cutX 8672 (.cutY 23584 .full .full) (.cutY 23584 .full .full)) .full)) .full)) .empty)) .empty) (.cutY 24064 .empty (.cutX 8960 .empty (.cutY 24320 (.cutX 9088 (.cutY 24192 .full .full) (.cutY 24192 (.cutX 9152 (.cutY 24128 .full .full) (.cutY 24128 (.cutX 9184 (.cutY 24096 .full .full) (.cutY 24096 .full .full)) .full)) (.cutX 9152 (.cutY 24256 .full .full) (.cutY 24256 .full .full)))) .empty))))) .empty)) .empty)) .empty) .empty))) (.cutY 16384 (.cutX 24576 (.cutY 8192 .empty (.cutX 20480 .empty (.cutY 12288 (.cutX 22528 .empty (.cutY 10240 (.cutX 23552 .empty (.cutY 9216 (.cutX 24064 (.cutY 8704 (.cutX 23808 (.cutY 8448 .empty (.cutX 23680 (.cutY 8576 (.cutX 23616 (.cutY 8512 .full .full) (.cutY 8512 .full .full)) (.cutX 23616 (.cutY 8640 .full (.cutX 23584 (.cutY 8672 .full .full) (.cutY 8672 .full .full))) (.cutY 8640 .full .full))) (.cutY 8576 .full .full))) .empty) .empty) (.cutY 8704 .empty (.cutX 24320 (.cutY 8960 .empty (.cutX 24192 (.cutY 9088 .full (.cutX 24128 (.cutY 9152 .full (.cutX 24096 (.cutY 9184 .full .full) (.cutY 9184 .full .full))) (.cutY 9152 .full .full))) (.cutY 9088 .full (.cutX 24256 (.cutY 9152 .full .full) (.cutY 9152 .full .full))))) .empty))) .empty)) .empty)) .empty))) .empty) .empty))

theorem metadata64 : 0<75538780 ∧ 33<128 ∧ 92<128 ∧ 0<4 ∧
    3227/4160=0 ∧ 3227%4160=3227 ∧ ∀ i, (leaves64 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData64).mp
    (by decide +kernel)

theorem sourceChecked64_0 : ∀ i : Fin 52,
    (fun i => output64 i = raw64 (source64 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked64 : ∀ i : Fin 52, (fun i => output64 i = raw64 (source64 i)) i :=
  forallFin_of_zero_offset (fun i => output64 i = raw64 (source64 i)) sourceChecked64_0

theorem coverChecked64_0 : ∀ i : Fin 52,
    (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked64 : ∀ i : Fin 52, (fun i => (output64 (cover64 i)).ContainsBox (raw64 i)) i :=
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

noncomputable def phaseMass64 : ℝ := singlePhaseMass (75538780/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw64 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass64_eq : phaseMass64 = (3776939/81920000000 : ℝ) := by
  unfold phaseMass64
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw64 output64 cover64 source64
    (gridTreeUnionCheck_sound 32768 raw64 output64 cover64 source64 tree64 checked64)
    _ (by norm_num) _, areaUnits64]
  norm_num

-- Frozen phase 6061, atom 2062, type 0, source (18,82).
def leavesData65 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves65 : Fin 10 → DyadicLeaf := leavesData65.get
def raw65 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 18 82 leaves65 i
def outputData65 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,20992,21056⟩) (.single ⟨4608,4672,21056,21120⟩)) (.node (.single ⟨4672,4736,20992,21056⟩) (.node (.single ⟨4672,4736,21056,21120⟩) (.single ⟨4608,4736,21120,21248⟩)))) (.node (.node (.single ⟨4736,4800,20992,21056⟩) (.single ⟨4736,4800,21056,21120⟩)) (.node (.single ⟨4800,4864,20992,21056⟩) (.node (.single ⟨4800,4864,21056,21120⟩) (.single ⟨4736,4864,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,27904,28032⟩) (.single ⟨11520,11648,28032,28160⟩)) (.node (.single ⟨11648,11712,27904,27968⟩) (.node (.single ⟨11648,11712,27968,28032⟩) (.single ⟨11712,11776,27904,27968⟩)))) (.node (.node (.single ⟨11712,11776,27968,28032⟩) (.single ⟨11648,11712,28032,28096⟩)) (.node (.single ⟨11648,11712,28096,28160⟩) (.node (.single ⟨11712,11776,28032,28096⟩) (.single ⟨11712,11776,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,4608,4672⟩) (.single ⟨20992,21056,4672,4736⟩)) (.node (.single ⟨21056,21120,4608,4672⟩) (.node (.single ⟨21056,21120,4672,4736⟩) (.single ⟨20992,21056,4736,4800⟩)))) (.node (.node (.single ⟨20992,21056,4800,4864⟩) (.single ⟨21056,21120,4736,4800⟩)) (.node (.single ⟨21056,21120,4800,4864⟩) (.node (.single ⟨21120,21248,4608,4736⟩) (.single ⟨21120,21248,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,11520,11648⟩) (.single ⟨27904,27968,11648,11712⟩)) (.node (.single ⟨27904,27968,11712,11776⟩) (.node (.single ⟨27968,28032,11648,11712⟩) (.single ⟨27968,28032,11712,11776⟩)))) (.node (.node (.single ⟨28032,28160,11520,11648⟩) (.single ⟨28032,28096,11648,11712⟩)) (.node (.single ⟨28032,28096,11712,11776⟩) (.node (.single ⟨28096,28160,11648,11712⟩) (.single ⟨28096,28160,11712,11776⟩)))))))
def output65 : Fin 40 → GridBox := outputData65.get
def coverData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData65 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover65 (i : Fin 40) : Fin 40 := ⟨coverData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def source65 (i : Fin 40) : Fin 40 := ⟨sourceData65.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree65 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 (.cutY 21504 (.cutX 4608 .empty (.cutY 20992 .empty (.cutX 4864 (.cutY 21248 (.cutX 4736 (.cutY 21120 (.cutX 4672 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 4800 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 .empty (.cutX 11776 (.cutY 28160 (.cutX 11520 .empty (.cutY 27904 .empty (.cutX 11648 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 11712 (.cutY 27968 .full .full) (.cutY 27968 .full .full)) (.cutX 11712 (.cutY 28096 .full .full) (.cutY 28096 .full .full)))))) .empty) .empty))))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 (.cutX 20992 .empty (.cutY 4608 .empty (.cutX 21248 (.cutY 4864 (.cutX 21120 (.cutY 4736 (.cutX 21056 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 21056 (.cutY 4800 .full .full) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 .empty (.cutY 11264 .empty (.cutX 28160 (.cutY 11776 (.cutX 27904 .empty (.cutY 11520 .empty (.cutX 28032 (.cutY 11648 .full (.cutX 27968 (.cutY 11712 .full .full) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 28096 (.cutY 11712 .full .full) (.cutY 11712 .full .full)))))) .empty) .empty))))) .empty) .empty))) .empty))

theorem metadata65 : 0<152546139 ∧ 18<128 ∧ 82<128 ∧ 0<4 ∧
    2062/4160=0 ∧ 2062%4160=2062 ∧ ∀ i, (leaves65 i).Valid 8 := by
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

noncomputable def phaseMass65 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw65 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass65_eq : phaseMass65 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass65
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw65 output65 cover65 source65
    (gridTreeUnionCheck_sound 32768 raw65 output65 cover65 source65 tree65 checked65)
    _ (by norm_num) _, areaUnits65]
  norm_num

-- Frozen phase 6062, atom 1774, type 0, source (15,79).
def leavesData66 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves66 : Fin 7 → DyadicLeaf := leavesData66.get
def raw66 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 79 leaves66 i
def outputData66 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,20224,20352⟩) (.node (.single ⟨3840,3968,20352,20480⟩) (.single ⟨3968,4032,20224,20288⟩))) (.node (.node (.single ⟨3968,4032,20288,20352⟩) (.single ⟨4032,4096,20224,20288⟩)) (.node (.single ⟨4032,4096,20288,20352⟩) (.single ⟨3968,4096,20352,20480⟩)))) (.node (.node (.single ⟨12288,12416,28672,28800⟩) (.node (.single ⟨12288,12416,28800,28928⟩) (.single ⟨12416,12480,28672,28736⟩))) (.node (.node (.single ⟨12416,12480,28736,28800⟩) (.single ⟨12480,12544,28672,28736⟩)) (.node (.single ⟨12480,12544,28736,28800⟩) (.single ⟨12416,12544,28800,28928⟩))))) (.node (.node (.node (.single ⟨20224,20352,3840,3968⟩) (.node (.single ⟨20224,20288,3968,4032⟩) (.single ⟨20224,20288,4032,4096⟩))) (.node (.node (.single ⟨20288,20352,3968,4032⟩) (.single ⟨20288,20352,4032,4096⟩)) (.node (.single ⟨20352,20480,3840,3968⟩) (.single ⟨20352,20480,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,12288,12416⟩) (.node (.single ⟨28672,28736,12416,12480⟩) (.single ⟨28672,28736,12480,12544⟩))) (.node (.node (.single ⟨28736,28800,12416,12480⟩) (.single ⟨28736,28800,12480,12544⟩)) (.node (.single ⟨28800,28928,12288,12416⟩) (.single ⟨28800,28928,12416,12544⟩))))))
def output66 : Fin 28 → GridBox := outputData66.get
def coverData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData66 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover66 (i : Fin 28) : Fin 28 := ⟨coverData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def source66 (i : Fin 28) : Fin 28 := ⟨sourceData66.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree66 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 .empty (.cutX 3840 .empty (.cutY 20224 .empty (.cutX 3968 (.cutY 20352 .full .full) (.cutY 20352 (.cutX 4032 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full)))))))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 (.cutX 12544 (.cutY 28928 (.cutX 12416 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 12480 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 .empty (.cutX 20224 .empty (.cutY 3840 .empty (.cutX 20352 (.cutY 3968 .full (.cutX 20288 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full)))))))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 (.cutX 28928 (.cutY 12544 (.cutX 28800 (.cutY 12416 .full (.cutX 28736 (.cutY 12480 .full .full) (.cutY 12480 .full .full))) (.cutY 12416 .full .full)) .empty) .empty) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata66 : 0<48363413 ∧ 15<128 ∧ 79<128 ∧ 0<4 ∧
    1774/4160=0 ∧ 1774%4160=1774 ∧ ∀ i, (leaves66 i).Valid 8 := by
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

noncomputable def phaseMass66 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw66 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass66_eq : phaseMass66 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass66
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw66 output66 cover66 source66
    (gridTreeUnionCheck_sound 32768 raw66 output66 cover66 source66 tree66 checked66)
    _ (by norm_num) _, areaUnits66]
  norm_num

-- Frozen phase 6063, atom 2500, type 0, source (23,85).
def leavesData67 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves67 : Fin 13 → DyadicLeaf := leavesData67.get
def raw67 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 85 leaves67 i
def outputData67 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,21760,21824⟩) (.node (.single ⟨5888,5952,21824,21888⟩) (.single ⟨5952,6016,21760,21824⟩))) (.node (.single ⟨5952,6016,21824,21888⟩) (.node (.single ⟨5888,6016,21888,22016⟩) (.single ⟨6016,6080,21760,21824⟩)))) (.node (.node (.single ⟨6016,6080,21824,21888⟩) (.node (.single ⟨6080,6112,21760,21792⟩) (.single ⟨6080,6112,21792,21824⟩))) (.node (.node (.single ⟨6112,6144,21760,21792⟩) (.single ⟨6112,6144,21792,21824⟩)) (.node (.single ⟨6080,6144,21824,21888⟩) (.single ⟨6016,6144,21888,22016⟩))))) (.node (.node (.node (.single ⟨10752,10880,26624,26752⟩) (.node (.single ⟨10752,10880,26752,26880⟩) (.single ⟨10880,10944,26624,26688⟩))) (.node (.single ⟨10880,10944,26688,26752⟩) (.node (.single ⟨10944,10976,26624,26656⟩) (.single ⟨10944,10976,26656,26688⟩)))) (.node (.node (.single ⟨10976,11008,26624,26656⟩) (.node (.single ⟨10976,11008,26656,26688⟩) (.single ⟨10944,11008,26688,26752⟩))) (.node (.node (.single ⟨10880,10944,26752,26816⟩) (.single ⟨10880,10944,26816,26880⟩)) (.node (.single ⟨10944,11008,26752,26816⟩) (.single ⟨10944,11008,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨21760,21824,5888,5952⟩) (.node (.single ⟨21760,21824,5952,6016⟩) (.single ⟨21824,21888,5888,5952⟩))) (.node (.single ⟨21824,21888,5952,6016⟩) (.node (.single ⟨21760,21824,6016,6080⟩) (.single ⟨21760,21792,6080,6112⟩)))) (.node (.node (.single ⟨21760,21792,6112,6144⟩) (.node (.single ⟨21792,21824,6080,6112⟩) (.single ⟨21792,21824,6112,6144⟩))) (.node (.node (.single ⟨21824,21888,6016,6080⟩) (.single ⟨21824,21888,6080,6144⟩)) (.node (.single ⟨21888,22016,5888,6016⟩) (.single ⟨21888,22016,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,10752,10880⟩) (.node (.single ⟨26624,26688,10880,10944⟩) (.single ⟨26624,26656,10944,10976⟩))) (.node (.single ⟨26624,26656,10976,11008⟩) (.node (.single ⟨26656,26688,10944,10976⟩) (.single ⟨26656,26688,10976,11008⟩)))) (.node (.node (.single ⟨26688,26752,10880,10944⟩) (.node (.single ⟨26688,26752,10944,11008⟩) (.single ⟨26752,26880,10752,10880⟩))) (.node (.node (.single ⟨26752,26816,10880,10944⟩) (.single ⟨26752,26816,10944,11008⟩)) (.node (.single ⟨26816,26880,10880,10944⟩) (.single ⟨26816,26880,10944,11008⟩)))))))
def output67 : Fin 52 → GridBox := outputData67.get
def coverData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData67 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover67 (i : Fin 52) : Fin 52 := ⟨coverData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def source67 (i : Fin 52) : Fin 52 := ⟨sourceData67.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree67 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 .empty (.cutY 22016 (.cutX 5888 .empty (.cutY 21760 .empty (.cutX 6016 (.cutY 21888 (.cutX 5952 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full) (.cutY 21888 (.cutX 6080 (.cutY 21824 .full .full) (.cutY 21824 (.cutX 6112 (.cutY 21792 .full .full) (.cutY 21792 .full .full)) .full)) .full)))) .empty)))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 (.cutX 11008 (.cutY 26880 (.cutX 10880 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 10944 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 10976 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 10944 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty) .empty) .empty)) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 .empty (.cutX 21760 .empty (.cutY 5888 .empty (.cutX 21888 (.cutY 6016 (.cutX 21824 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 21824 (.cutY 6080 .full (.cutX 21792 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))))) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 (.cutY 10752 .empty (.cutX 26880 (.cutY 11008 (.cutX 26752 (.cutY 10880 .full (.cutX 26688 (.cutY 10944 .full (.cutX 26656 (.cutY 10976 .full .full) (.cutY 10976 .full .full))) (.cutY 10944 .full .full))) (.cutY 10880 .full (.cutX 26816 (.cutY 10944 .full .full) (.cutY 10944 .full .full)))) .empty) .empty)) .empty) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata67 : 0<152546139 ∧ 23<128 ∧ 85<128 ∧ 0<4 ∧
    2500/4160=0 ∧ 2500%4160=2500 ∧ ∀ i, (leaves67 i).Valid 8 := by
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

noncomputable def phaseMass67 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw67 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass67_eq : phaseMass67 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass67
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw67 output67 cover67 source67
    (gridTreeUnionCheck_sound 32768 raw67 output67 cover67 source67 tree67 checked67)
    _ (by norm_num) _, areaUnits67]
  norm_num

-- Frozen phase 6064, atom 1033, type 0, source (8,73).
def leavesData68 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves68 : Fin 7 → DyadicLeaf := leavesData68.get
def raw68 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 8 73 leaves68 i
def outputData68 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2048,2176,18688,18816⟩) (.node (.single ⟨2048,2176,18816,18944⟩) (.single ⟨2176,2240,18688,18752⟩))) (.node (.node (.single ⟨2176,2240,18752,18816⟩) (.single ⟨2240,2304,18688,18752⟩)) (.node (.single ⟨2240,2304,18752,18816⟩) (.single ⟨2176,2304,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,30464,30592⟩) (.node (.single ⟨13824,13952,30592,30720⟩) (.single ⟨13952,14016,30464,30528⟩))) (.node (.node (.single ⟨13952,14016,30528,30592⟩) (.single ⟨14016,14080,30464,30528⟩)) (.node (.single ⟨14016,14080,30528,30592⟩) (.single ⟨13952,14080,30592,30720⟩))))) (.node (.node (.node (.single ⟨18688,18816,2048,2176⟩) (.node (.single ⟨18688,18752,2176,2240⟩) (.single ⟨18688,18752,2240,2304⟩))) (.node (.node (.single ⟨18752,18816,2176,2240⟩) (.single ⟨18752,18816,2240,2304⟩)) (.node (.single ⟨18816,18944,2048,2176⟩) (.single ⟨18816,18944,2176,2304⟩)))) (.node (.node (.single ⟨30464,30592,13824,13952⟩) (.node (.single ⟨30464,30528,13952,14016⟩) (.single ⟨30464,30528,14016,14080⟩))) (.node (.node (.single ⟨30528,30592,13952,14016⟩) (.single ⟨30528,30592,14016,14080⟩)) (.node (.single ⟨30592,30720,13824,13952⟩) (.single ⟨30592,30720,13952,14080⟩))))))
def output68 : Fin 28 → GridBox := outputData68.get
def coverData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData68 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover68 (i : Fin 28) : Fin 28 := ⟨coverData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def source68 (i : Fin 28) : Fin 28 := ⟨sourceData68.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree68 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 (.cutY 18688 .empty (.cutX 2176 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 2240 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 (.cutY 30464 .empty (.cutX 13952 (.cutY 30592 .full .full) (.cutY 30592 (.cutX 14016 (.cutY 30528 .full .full) (.cutY 30528 .full .full)) .full))) .empty))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 .empty (.cutY 2304 (.cutX 18816 (.cutY 2176 .full (.cutX 18752 (.cutY 2240 .full .full) (.cutY 2240 .full .full))) (.cutY 2176 .full .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 .empty (.cutY 14080 (.cutX 30592 (.cutY 13952 .full (.cutX 30528 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty)))))) .empty) .empty))))) .empty))

theorem metadata68 : 0<48363413 ∧ 8<128 ∧ 73<128 ∧ 0<4 ∧
    1033/4160=0 ∧ 1033%4160=1033 ∧ ∀ i, (leaves68 i).Valid 8 := by
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

noncomputable def phaseMass68 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw68 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass68_eq : phaseMass68 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass68
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw68 output68 cover68 source68
    (gridTreeUnionCheck_sound 32768 raw68 output68 cover68 source68 tree68 checked68)
    _ (by norm_num) _, areaUnits68]
  norm_num

-- Frozen phase 6065, atom 5729, type 1, source (13,74).
def leavesData69 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves69 : Fin 7 → DyadicLeaf := leavesData69.get
def raw69 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 13 74 leaves69 i
def outputData69 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3328,3456,18944,19072⟩) (.node (.single ⟨3328,3456,19072,19200⟩) (.single ⟨3456,3520,18944,19008⟩))) (.node (.node (.single ⟨3456,3520,19008,19072⟩) (.single ⟨3520,3584,18944,19008⟩)) (.node (.single ⟨3520,3584,19008,19072⟩) (.single ⟨3456,3584,19072,19200⟩)))) (.node (.node (.single ⟨13568,13696,29184,29312⟩) (.node (.single ⟨13568,13696,29312,29440⟩) (.single ⟨13696,13760,29184,29248⟩))) (.node (.node (.single ⟨13696,13760,29248,29312⟩) (.single ⟨13760,13824,29184,29248⟩)) (.node (.single ⟨13760,13824,29248,29312⟩) (.single ⟨13696,13824,29312,29440⟩))))) (.node (.node (.node (.single ⟨18944,19072,3328,3456⟩) (.node (.single ⟨18944,19008,3456,3520⟩) (.single ⟨18944,19008,3520,3584⟩))) (.node (.node (.single ⟨19008,19072,3456,3520⟩) (.single ⟨19008,19072,3520,3584⟩)) (.node (.single ⟨19072,19200,3328,3456⟩) (.single ⟨19072,19200,3456,3584⟩)))) (.node (.node (.single ⟨29184,29312,13568,13696⟩) (.node (.single ⟨29184,29248,13696,13760⟩) (.single ⟨29184,29248,13760,13824⟩))) (.node (.node (.single ⟨29248,29312,13696,13760⟩) (.single ⟨29248,29312,13760,13824⟩)) (.node (.single ⟨29312,29440,13568,13696⟩) (.single ⟨29312,29440,13696,13824⟩))))))
def output69 : Fin 28 → GridBox := outputData69.get
def coverData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData69 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover69 (i : Fin 28) : Fin 28 := ⟨coverData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def source69 (i : Fin 28) : Fin 28 := ⟨sourceData69.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree69 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 (.cutY 18944 .empty (.cutX 3328 .empty (.cutY 19200 (.cutX 3456 (.cutY 19072 .full .full) (.cutY 19072 (.cutX 3520 (.cutY 19008 .full .full) (.cutY 19008 .full .full)) .full)) .empty))) .empty) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 .empty (.cutX 13568 .empty (.cutY 29440 (.cutX 13696 (.cutY 29312 .full .full) (.cutY 29312 (.cutX 13760 (.cutY 29248 .full .full) (.cutY 29248 .full .full)) .full)) .empty))) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 (.cutX 19200 (.cutY 3328 .empty (.cutX 19072 (.cutY 3456 .full (.cutX 19008 (.cutY 3520 .full .full) (.cutY 3520 .full .full))) (.cutY 3456 .full .full))) .empty) .empty))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 .empty (.cutY 13824 (.cutX 29440 (.cutY 13568 .empty (.cutX 29312 (.cutY 13696 .full (.cutX 29248 (.cutY 13760 .full .full) (.cutY 13760 .full .full))) (.cutY 13696 .full .full))) .empty) .empty))) .empty) .empty) .empty))))) .empty))

theorem metadata69 : 0<94387549 ∧ 13<128 ∧ 74<128 ∧ 1<4 ∧
    5729/4160=1 ∧ 5729%4160=1569 ∧ ∀ i, (leaves69 i).Valid 8 := by
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

noncomputable def phaseMass69 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw69 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass69_eq : phaseMass69 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass69
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw69 output69 cover69 source69
    (gridTreeUnionCheck_sound 32768 raw69 output69 cover69 source69 tree69 checked69)
    _ (by norm_num) _, areaUnits69]
  norm_num

-- Frozen phase 6066, atom 2331, type 0, source (21,84).
def leavesData70 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves70 : Fin 13 → DyadicLeaf := leavesData70.get
def raw70 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 21 84 leaves70 i
def outputData70 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5376,5440,21504,21568⟩) (.node (.single ⟨5376,5440,21568,21632⟩) (.single ⟨5440,5504,21504,21568⟩))) (.node (.single ⟨5440,5504,21568,21632⟩) (.node (.single ⟨5376,5504,21632,21760⟩) (.single ⟨5504,5568,21504,21568⟩)))) (.node (.node (.single ⟨5504,5568,21568,21632⟩) (.node (.single ⟨5568,5600,21504,21536⟩) (.single ⟨5568,5600,21536,21568⟩))) (.node (.node (.single ⟨5600,5632,21504,21536⟩) (.single ⟨5600,5632,21536,21568⟩)) (.node (.single ⟨5568,5632,21568,21632⟩) (.single ⟨5504,5632,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,27136,27264⟩) (.node (.single ⟨11008,11136,27264,27392⟩) (.single ⟨11136,11200,27136,27200⟩))) (.node (.single ⟨11136,11200,27200,27264⟩) (.node (.single ⟨11200,11232,27136,27168⟩) (.single ⟨11200,11232,27168,27200⟩)))) (.node (.node (.single ⟨11232,11264,27136,27168⟩) (.node (.single ⟨11232,11264,27168,27200⟩) (.single ⟨11200,11264,27200,27264⟩))) (.node (.node (.single ⟨11136,11200,27264,27328⟩) (.single ⟨11136,11200,27328,27392⟩)) (.node (.single ⟨11200,11264,27264,27328⟩) (.single ⟨11200,11264,27328,27392⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,5376,5440⟩) (.node (.single ⟨21504,21568,5440,5504⟩) (.single ⟨21568,21632,5376,5440⟩))) (.node (.single ⟨21568,21632,5440,5504⟩) (.node (.single ⟨21504,21568,5504,5568⟩) (.single ⟨21504,21536,5568,5600⟩)))) (.node (.node (.single ⟨21504,21536,5600,5632⟩) (.node (.single ⟨21536,21568,5568,5600⟩) (.single ⟨21536,21568,5600,5632⟩))) (.node (.node (.single ⟨21568,21632,5504,5568⟩) (.single ⟨21568,21632,5568,5632⟩)) (.node (.single ⟨21632,21760,5376,5504⟩) (.single ⟨21632,21760,5504,5632⟩))))) (.node (.node (.node (.single ⟨27136,27264,11008,11136⟩) (.node (.single ⟨27136,27200,11136,11200⟩) (.single ⟨27136,27168,11200,11232⟩))) (.node (.single ⟨27136,27168,11232,11264⟩) (.node (.single ⟨27168,27200,11200,11232⟩) (.single ⟨27168,27200,11232,11264⟩)))) (.node (.node (.single ⟨27200,27264,11136,11200⟩) (.node (.single ⟨27200,27264,11200,11264⟩) (.single ⟨27264,27392,11008,11136⟩))) (.node (.node (.single ⟨27264,27328,11136,11200⟩) (.single ⟨27264,27328,11200,11264⟩)) (.node (.single ⟨27328,27392,11136,11200⟩) (.single ⟨27328,27392,11200,11264⟩)))))))
def output70 : Fin 52 → GridBox := outputData70.get
def coverData70 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData70 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover70 (i : Fin 52) : Fin 52 := ⟨coverData70.get i % 52, Nat.mod_lt _ (by decide)⟩
def source70 (i : Fin 52) : Fin 52 := ⟨sourceData70.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree70 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 .empty (.cutX 5632 (.cutY 22016 (.cutX 5376 .empty (.cutY 21760 (.cutX 5504 (.cutY 21632 (.cutX 5440 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 5568 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 5600 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty)) .empty) .empty))) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 (.cutY 27648 (.cutX 10752 .empty (.cutY 27136 .empty (.cutX 11008 .empty (.cutY 27392 (.cutX 11136 (.cutY 27264 .full .full) (.cutY 27264 (.cutX 11200 (.cutY 27200 .full .full) (.cutY 27200 (.cutX 11232 (.cutY 27168 .full .full) (.cutY 27168 .full .full)) .full)) (.cutX 11200 (.cutY 27328 .full .full) (.cutY 27328 .full .full)))) .empty)))) .empty) .empty))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 .empty (.cutY 5120 .empty (.cutX 22016 (.cutY 5632 (.cutX 21760 (.cutY 5376 .empty (.cutX 21632 (.cutY 5504 (.cutX 21568 (.cutY 5440 .full .full) (.cutY 5440 .full .full)) (.cutX 21568 (.cutY 5568 .full (.cutX 21536 (.cutY 5600 .full .full) (.cutY 5600 .full .full))) (.cutY 5568 .full .full))) (.cutY 5504 .full .full))) .empty) .empty) .empty))) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 (.cutX 27136 .empty (.cutY 10752 .empty (.cutX 27392 (.cutY 11008 .empty (.cutX 27264 (.cutY 11136 .full (.cutX 27200 (.cutY 11200 .full (.cutX 27168 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 27328 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))) .empty))) .empty) .empty))) .empty) .empty))) .empty))

theorem metadata70 : 0<152546139 ∧ 21<128 ∧ 84<128 ∧ 0<4 ∧
    2331/4160=0 ∧ 2331%4160=2331 ∧ ∀ i, (leaves70 i).Valid 8 := by
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

noncomputable def phaseMass70 : ℝ := singlePhaseMass (152546139/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw70 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass70_eq : phaseMass70 = (152546139/1638400000000 : ℝ) := by
  unfold phaseMass70
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw70 output70 cover70 source70
    (gridTreeUnionCheck_sound 32768 raw70 output70 cover70 source70 tree70 checked70)
    _ (by norm_num) _, areaUnits70]
  norm_num

-- Frozen phase 6067, atom 6657, type 1, source (23,82).
def leavesData71 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves71 : Fin 13 → DyadicLeaf := leavesData71.get
def raw71 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 23 82 leaves71 i
def outputData71 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5888,5952,20992,21056⟩) (.node (.single ⟨5888,5952,21056,21120⟩) (.single ⟨5952,6016,20992,21056⟩))) (.node (.single ⟨5952,6016,21056,21120⟩) (.node (.single ⟨5888,6016,21120,21248⟩) (.single ⟨6016,6080,20992,21056⟩)))) (.node (.node (.single ⟨6016,6080,21056,21120⟩) (.node (.single ⟨6080,6112,20992,21024⟩) (.single ⟨6080,6112,21024,21056⟩))) (.node (.node (.single ⟨6112,6144,20992,21024⟩) (.single ⟨6112,6144,21024,21056⟩)) (.node (.single ⟨6080,6144,21056,21120⟩) (.single ⟨6016,6144,21120,21248⟩))))) (.node (.node (.node (.single ⟨11520,11648,26624,26752⟩) (.node (.single ⟨11520,11648,26752,26880⟩) (.single ⟨11648,11712,26624,26688⟩))) (.node (.single ⟨11648,11712,26688,26752⟩) (.node (.single ⟨11712,11744,26624,26656⟩) (.single ⟨11712,11744,26656,26688⟩)))) (.node (.node (.single ⟨11744,11776,26624,26656⟩) (.node (.single ⟨11744,11776,26656,26688⟩) (.single ⟨11712,11776,26688,26752⟩))) (.node (.node (.single ⟨11648,11712,26752,26816⟩) (.single ⟨11648,11712,26816,26880⟩)) (.node (.single ⟨11712,11776,26752,26816⟩) (.single ⟨11712,11776,26816,26880⟩)))))) (.node (.node (.node (.node (.single ⟨20992,21056,5888,5952⟩) (.node (.single ⟨20992,21056,5952,6016⟩) (.single ⟨21056,21120,5888,5952⟩))) (.node (.single ⟨21056,21120,5952,6016⟩) (.node (.single ⟨20992,21056,6016,6080⟩) (.single ⟨20992,21024,6080,6112⟩)))) (.node (.node (.single ⟨20992,21024,6112,6144⟩) (.node (.single ⟨21024,21056,6080,6112⟩) (.single ⟨21024,21056,6112,6144⟩))) (.node (.node (.single ⟨21056,21120,6016,6080⟩) (.single ⟨21056,21120,6080,6144⟩)) (.node (.single ⟨21120,21248,5888,6016⟩) (.single ⟨21120,21248,6016,6144⟩))))) (.node (.node (.node (.single ⟨26624,26752,11520,11648⟩) (.node (.single ⟨26624,26688,11648,11712⟩) (.single ⟨26624,26656,11712,11744⟩))) (.node (.single ⟨26624,26656,11744,11776⟩) (.node (.single ⟨26656,26688,11712,11744⟩) (.single ⟨26656,26688,11744,11776⟩)))) (.node (.node (.single ⟨26688,26752,11648,11712⟩) (.node (.single ⟨26688,26752,11712,11776⟩) (.single ⟨26752,26880,11520,11648⟩))) (.node (.node (.single ⟨26752,26816,11648,11712⟩) (.single ⟨26752,26816,11712,11776⟩)) (.node (.single ⟨26816,26880,11648,11712⟩) (.single ⟨26816,26880,11712,11776⟩)))))))
def output71 : Fin 52 → GridBox := outputData71.get
def coverData71 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData71 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover71 (i : Fin 52) : Fin 52 := ⟨coverData71.get i % 52, Nat.mod_lt _ (by decide)⟩
def source71 (i : Fin 52) : Fin 52 := ⟨sourceData71.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree71 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 .empty (.cutY 20992 .empty (.cutX 5888 .empty (.cutY 21248 (.cutX 6016 (.cutY 21120 (.cutX 5952 (.cutY 21056 .full .full) (.cutY 21056 .full .full)) .full) (.cutY 21120 (.cutX 6080 (.cutY 21056 .full .full) (.cutY 21056 (.cutX 6112 (.cutY 21024 .full .full) (.cutY 21024 .full .full)) .full)) .full)) .empty)))) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 (.cutY 27136 (.cutX 11520 .empty (.cutY 26880 (.cutX 11648 (.cutY 26752 .full .full) (.cutY 26752 (.cutX 11712 (.cutY 26688 .full .full) (.cutY 26688 (.cutX 11744 (.cutY 26656 .full .full) (.cutY 26656 .full .full)) .full)) (.cutX 11712 (.cutY 26816 .full .full) (.cutY 26816 .full .full)))) .empty)) .empty) .empty) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 .empty (.cutY 5632 .empty (.cutX 21248 (.cutY 5888 .empty (.cutX 21120 (.cutY 6016 (.cutX 21056 (.cutY 5952 .full .full) (.cutY 5952 .full .full)) (.cutX 21056 (.cutY 6080 .full (.cutX 21024 (.cutY 6112 .full .full) (.cutY 6112 .full .full))) (.cutY 6080 .full .full))) (.cutY 6016 .full .full))) .empty)))) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 (.cutY 11776 (.cutX 26880 (.cutY 11520 .empty (.cutX 26752 (.cutY 11648 .full (.cutX 26688 (.cutY 11712 .full (.cutX 26656 (.cutY 11744 .full .full) (.cutY 11744 .full .full))) (.cutY 11712 .full .full))) (.cutY 11648 .full (.cutX 26816 (.cutY 11712 .full .full) (.cutY 11712 .full .full))))) .empty) .empty) .empty)) .empty))) .empty) .empty))) .empty))

theorem metadata71 : 0<125829407 ∧ 23<128 ∧ 82<128 ∧ 1<4 ∧
    6657/4160=1 ∧ 6657%4160=2497 ∧ ∀ i, (leaves71 i).Valid 8 := by
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

noncomputable def phaseMass71 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw71 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass71_eq : phaseMass71 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass71
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw71 output71 cover71 source71
    (gridTreeUnionCheck_sound 32768 raw71 output71 cover71 source71 tree71 checked71)
    _ (by norm_num) _, areaUnits71]
  norm_num

-- Frozen phase 6068, atom 6896, type 1, source (26,84).
def leavesData72 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves72 : Fin 13 → DyadicLeaf := leavesData72.get
def raw72 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 26 84 leaves72 i
def outputData72 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,21504,21568⟩) (.node (.single ⟨6656,6720,21568,21632⟩) (.single ⟨6720,6784,21504,21568⟩))) (.node (.single ⟨6720,6784,21568,21632⟩) (.node (.single ⟨6656,6784,21632,21760⟩) (.single ⟨6784,6848,21504,21568⟩)))) (.node (.node (.single ⟨6784,6848,21568,21632⟩) (.node (.single ⟨6848,6880,21504,21536⟩) (.single ⟨6848,6880,21536,21568⟩))) (.node (.node (.single ⟨6880,6912,21504,21536⟩) (.single ⟨6880,6912,21536,21568⟩)) (.node (.single ⟨6848,6912,21568,21632⟩) (.single ⟨6784,6912,21632,21760⟩))))) (.node (.node (.node (.single ⟨11008,11136,25856,25984⟩) (.node (.single ⟨11008,11136,25984,26112⟩) (.single ⟨11136,11200,25856,25920⟩))) (.node (.single ⟨11136,11200,25920,25984⟩) (.node (.single ⟨11200,11232,25856,25888⟩) (.single ⟨11200,11232,25888,25920⟩)))) (.node (.node (.single ⟨11232,11264,25856,25888⟩) (.node (.single ⟨11232,11264,25888,25920⟩) (.single ⟨11200,11264,25920,25984⟩))) (.node (.node (.single ⟨11136,11200,25984,26048⟩) (.single ⟨11136,11200,26048,26112⟩)) (.node (.single ⟨11200,11264,25984,26048⟩) (.single ⟨11200,11264,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨21504,21568,6656,6720⟩) (.node (.single ⟨21504,21568,6720,6784⟩) (.single ⟨21568,21632,6656,6720⟩))) (.node (.single ⟨21568,21632,6720,6784⟩) (.node (.single ⟨21504,21568,6784,6848⟩) (.single ⟨21504,21536,6848,6880⟩)))) (.node (.node (.single ⟨21504,21536,6880,6912⟩) (.node (.single ⟨21536,21568,6848,6880⟩) (.single ⟨21536,21568,6880,6912⟩))) (.node (.node (.single ⟨21568,21632,6784,6848⟩) (.single ⟨21568,21632,6848,6912⟩)) (.node (.single ⟨21632,21760,6656,6784⟩) (.single ⟨21632,21760,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,11008,11136⟩) (.node (.single ⟨25856,25920,11136,11200⟩) (.single ⟨25856,25888,11200,11232⟩))) (.node (.single ⟨25856,25888,11232,11264⟩) (.node (.single ⟨25888,25920,11200,11232⟩) (.single ⟨25888,25920,11232,11264⟩)))) (.node (.node (.single ⟨25920,25984,11136,11200⟩) (.node (.single ⟨25920,25984,11200,11264⟩) (.single ⟨25984,26112,11008,11136⟩))) (.node (.node (.single ⟨25984,26048,11136,11200⟩) (.single ⟨25984,26048,11200,11264⟩)) (.node (.single ⟨26048,26112,11136,11200⟩) (.single ⟨26048,26112,11200,11264⟩)))))))
def output72 : Fin 52 → GridBox := outputData72.get
def coverData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData72 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover72 (i : Fin 52) : Fin 52 := ⟨coverData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def source72 (i : Fin 52) : Fin 52 := ⟨sourceData72.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree72 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 (.cutX 6912 (.cutY 21760 (.cutX 6784 (.cutY 21632 (.cutX 6720 (.cutY 21568 .full .full) (.cutY 21568 .full .full)) .full) (.cutY 21632 (.cutX 6848 (.cutY 21568 .full .full) (.cutY 21568 (.cutX 6880 (.cutY 21536 .full .full) (.cutY 21536 .full .full)) .full)) .full)) .empty) .empty) .empty))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 (.cutX 11008 .empty (.cutY 25856 .empty (.cutX 11136 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 11200 (.cutY 25920 .full .full) (.cutY 25920 (.cutX 11232 (.cutY 25888 .full .full) (.cutY 25888 .full .full)) .full)) (.cutX 11200 (.cutY 26048 .full .full) (.cutY 26048 .full .full)))))) .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 .empty (.cutX 21760 (.cutY 6912 (.cutX 21632 (.cutY 6784 (.cutX 21568 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 21568 (.cutY 6848 .full (.cutX 21536 (.cutY 6880 .full .full) (.cutY 6880 .full .full))) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty) .empty)) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 .empty (.cutX 25856 .empty (.cutY 11008 .empty (.cutX 25984 (.cutY 11136 .full (.cutX 25920 (.cutY 11200 .full (.cutX 25888 (.cutY 11232 .full .full) (.cutY 11232 .full .full))) (.cutY 11200 .full .full))) (.cutY 11136 .full (.cutX 26048 (.cutY 11200 .full .full) (.cutY 11200 .full .full))))))) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata72 : 0<144359671 ∧ 26<128 ∧ 84<128 ∧ 1<4 ∧
    6896/4160=1 ∧ 6896%4160=2736 ∧ ∀ i, (leaves72 i).Valid 8 := by
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

noncomputable def phaseMass72 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw72 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass72_eq : phaseMass72 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass72
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw72 output72 cover72 source72
    (gridTreeUnionCheck_sound 32768 raw72 output72 cover72 source72 tree72 checked72)
    _ (by norm_num) _, areaUnits72]
  norm_num

-- Frozen phase 6069, atom 6400, type 1, source (20,80).
def leavesData73 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves73 : Fin 13 → DyadicLeaf := leavesData73.get
def raw73 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 20 80 leaves73 i
def outputData73 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨5120,5184,20480,20544⟩) (.node (.single ⟨5120,5184,20544,20608⟩) (.single ⟨5184,5248,20480,20544⟩))) (.node (.single ⟨5184,5248,20544,20608⟩) (.node (.single ⟨5120,5248,20608,20736⟩) (.single ⟨5248,5312,20480,20544⟩)))) (.node (.node (.single ⟨5248,5312,20544,20608⟩) (.node (.single ⟨5312,5344,20480,20512⟩) (.single ⟨5312,5344,20512,20544⟩))) (.node (.node (.single ⟨5344,5376,20480,20512⟩) (.single ⟨5344,5376,20512,20544⟩)) (.node (.single ⟨5312,5376,20544,20608⟩) (.single ⟨5248,5376,20608,20736⟩))))) (.node (.node (.node (.single ⟨12032,12160,27392,27520⟩) (.node (.single ⟨12032,12160,27520,27648⟩) (.single ⟨12160,12224,27392,27456⟩))) (.node (.single ⟨12160,12224,27456,27520⟩) (.node (.single ⟨12224,12256,27392,27424⟩) (.single ⟨12224,12256,27424,27456⟩)))) (.node (.node (.single ⟨12256,12288,27392,27424⟩) (.node (.single ⟨12256,12288,27424,27456⟩) (.single ⟨12224,12288,27456,27520⟩))) (.node (.node (.single ⟨12160,12224,27520,27584⟩) (.single ⟨12160,12224,27584,27648⟩)) (.node (.single ⟨12224,12288,27520,27584⟩) (.single ⟨12224,12288,27584,27648⟩)))))) (.node (.node (.node (.node (.single ⟨20480,20544,5120,5184⟩) (.node (.single ⟨20480,20544,5184,5248⟩) (.single ⟨20544,20608,5120,5184⟩))) (.node (.single ⟨20544,20608,5184,5248⟩) (.node (.single ⟨20480,20544,5248,5312⟩) (.single ⟨20480,20512,5312,5344⟩)))) (.node (.node (.single ⟨20480,20512,5344,5376⟩) (.node (.single ⟨20512,20544,5312,5344⟩) (.single ⟨20512,20544,5344,5376⟩))) (.node (.node (.single ⟨20544,20608,5248,5312⟩) (.single ⟨20544,20608,5312,5376⟩)) (.node (.single ⟨20608,20736,5120,5248⟩) (.single ⟨20608,20736,5248,5376⟩))))) (.node (.node (.node (.single ⟨27392,27520,12032,12160⟩) (.node (.single ⟨27392,27456,12160,12224⟩) (.single ⟨27392,27424,12224,12256⟩))) (.node (.single ⟨27392,27424,12256,12288⟩) (.node (.single ⟨27424,27456,12224,12256⟩) (.single ⟨27424,27456,12256,12288⟩)))) (.node (.node (.single ⟨27456,27520,12160,12224⟩) (.node (.single ⟨27456,27520,12224,12288⟩) (.single ⟨27520,27648,12032,12160⟩))) (.node (.node (.single ⟨27520,27584,12160,12224⟩) (.single ⟨27520,27584,12224,12288⟩)) (.node (.single ⟨27584,27648,12160,12224⟩) (.single ⟨27584,27648,12224,12288⟩)))))))
def output73 : Fin 52 → GridBox := outputData73.get
def coverData73 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData73 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover73 (i : Fin 52) : Fin 52 := ⟨coverData73.get i % 52, Nat.mod_lt _ (by decide)⟩
def source73 (i : Fin 52) : Fin 52 := ⟨sourceData73.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree73 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 (.cutY 22528 (.cutX 5120 .empty (.cutY 21504 (.cutX 5632 (.cutY 20992 (.cutX 5376 (.cutY 20736 (.cutX 5248 (.cutY 20608 (.cutX 5184 (.cutY 20544 .full .full) (.cutY 20544 .full .full)) .full) (.cutY 20608 (.cutX 5312 (.cutY 20544 .full .full) (.cutY 20544 (.cutX 5344 (.cutY 20512 .full .full) (.cutY 20512 .full .full)) .full)) .full)) .empty) .empty) .empty) .empty) .empty)) .empty) .empty))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 .empty (.cutX 11264 .empty (.cutY 27648 (.cutX 11776 .empty (.cutY 27136 .empty (.cutX 12032 .empty (.cutY 27392 .empty (.cutX 12160 (.cutY 27520 .full .full) (.cutY 27520 (.cutX 12224 (.cutY 27456 .full .full) (.cutY 27456 (.cutX 12256 (.cutY 27424 .full .full) (.cutY 27424 .full .full)) .full)) (.cutX 12224 (.cutY 27584 .full .full) (.cutY 27584 .full .full)))))))) .empty)))) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 (.cutX 21504 (.cutY 5120 .empty (.cutX 20992 (.cutY 5632 (.cutX 20736 (.cutY 5376 (.cutX 20608 (.cutY 5248 (.cutX 20544 (.cutY 5184 .full .full) (.cutY 5184 .full .full)) (.cutX 20544 (.cutY 5312 .full (.cutX 20512 (.cutY 5344 .full .full) (.cutY 5344 .full .full))) (.cutY 5312 .full .full))) (.cutY 5248 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 .empty (.cutY 10240 .empty (.cutX 27648 (.cutY 11264 .empty (.cutX 27136 .empty (.cutY 11776 .empty (.cutX 27392 .empty (.cutY 12032 .empty (.cutX 27520 (.cutY 12160 .full (.cutX 27456 (.cutY 12224 .full (.cutX 27424 (.cutY 12256 .full .full) (.cutY 12256 .full .full))) (.cutY 12224 .full .full))) (.cutY 12160 .full (.cutX 27584 (.cutY 12224 .full .full) (.cutY 12224 .full .full))))))))) .empty))) .empty) .empty))) .empty))

theorem metadata73 : 0<125829407 ∧ 20<128 ∧ 80<128 ∧ 1<4 ∧
    6400/4160=1 ∧ 6400%4160=2240 ∧ ∀ i, (leaves73 i).Valid 8 := by
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

noncomputable def phaseMass73 : ℝ := singlePhaseMass (125829407/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw73 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass73_eq : phaseMass73 = (125829407/1638400000000 : ℝ) := by
  unfold phaseMass73
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw73 output73 cover73 source73
    (gridTreeUnionCheck_sound 32768 raw73 output73 cover73 source73 tree73 checked73)
    _ (by norm_num) _, areaUnits73]
  norm_num

-- Frozen phase 6070, atom 6972, type 1, source (27,85).
def leavesData74 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves74 : Fin 7 → DyadicLeaf := leavesData74.get
def raw74 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 27 85 leaves74 i
def outputData74 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨6912,7040,21760,21888⟩) (.node (.single ⟨6912,7040,21888,22016⟩) (.single ⟨7040,7104,21760,21824⟩))) (.node (.node (.single ⟨7040,7104,21824,21888⟩) (.single ⟨7104,7168,21760,21824⟩)) (.node (.single ⟨7104,7168,21824,21888⟩) (.single ⟨7040,7168,21888,22016⟩)))) (.node (.node (.single ⟨10752,10880,25600,25728⟩) (.node (.single ⟨10752,10880,25728,25856⟩) (.single ⟨10880,10944,25600,25664⟩))) (.node (.node (.single ⟨10880,10944,25664,25728⟩) (.single ⟨10944,11008,25600,25664⟩)) (.node (.single ⟨10944,11008,25664,25728⟩) (.single ⟨10880,11008,25728,25856⟩))))) (.node (.node (.node (.single ⟨21760,21888,6912,7040⟩) (.node (.single ⟨21760,21824,7040,7104⟩) (.single ⟨21760,21824,7104,7168⟩))) (.node (.node (.single ⟨21824,21888,7040,7104⟩) (.single ⟨21824,21888,7104,7168⟩)) (.node (.single ⟨21888,22016,6912,7040⟩) (.single ⟨21888,22016,7040,7168⟩)))) (.node (.node (.single ⟨25600,25728,10752,10880⟩) (.node (.single ⟨25600,25664,10880,10944⟩) (.single ⟨25600,25664,10944,11008⟩))) (.node (.node (.single ⟨25664,25728,10880,10944⟩) (.single ⟨25664,25728,10944,11008⟩)) (.node (.single ⟨25728,25856,10752,10880⟩) (.single ⟨25728,25856,10880,11008⟩))))))
def output74 : Fin 28 → GridBox := outputData74.get
def coverData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData74 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover74 (i : Fin 28) : Fin 28 := ⟨coverData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def source74 (i : Fin 28) : Fin 28 := ⟨sourceData74.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree74 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 (.cutX 6912 .empty (.cutY 21760 .empty (.cutX 7040 (.cutY 21888 .full .full) (.cutY 21888 (.cutX 7104 (.cutY 21824 .full .full) (.cutY 21824 .full .full)) .full)))) .empty))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 .empty (.cutY 26112 (.cutX 11008 (.cutY 25856 (.cutX 10880 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10944 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) .full)) .empty) .empty) .empty))) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 (.cutY 6656 .empty (.cutX 21760 .empty (.cutY 6912 .empty (.cutX 21888 (.cutY 7040 .full (.cutX 21824 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))))) .empty) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 .empty (.cutX 25856 (.cutY 11008 (.cutX 25728 (.cutY 10880 .full (.cutX 25664 (.cutY 10944 .full .full) (.cutY 10944 .full .full))) (.cutY 10880 .full .full)) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata74 : 0<144359671 ∧ 27<128 ∧ 85<128 ∧ 1<4 ∧
    6972/4160=1 ∧ 6972%4160=2812 ∧ ∀ i, (leaves74 i).Valid 8 := by
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

noncomputable def phaseMass74 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw74 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass74_eq : phaseMass74 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass74
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw74 output74 cover74 source74
    (gridTreeUnionCheck_sound 32768 raw74 output74 cover74 source74 tree74 checked74)
    _ (by norm_num) _, areaUnits74]
  norm_num

-- Frozen phase 6071, atom 1572, type 0, source (13,77).
def leavesData75 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves75 : Fin 4 → DyadicLeaf := leavesData75.get
def raw75 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 13 77 leaves75 i
def outputData75 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3328,3456,19712,19840⟩) (.single ⟨3328,3456,19840,19968⟩)) (.node (.single ⟨3456,3584,19712,19840⟩) (.single ⟨3456,3584,19840,19968⟩))) (.node (.node (.single ⟨12800,12928,29184,29312⟩) (.single ⟨12800,12928,29312,29440⟩)) (.node (.single ⟨12928,13056,29184,29312⟩) (.single ⟨12928,13056,29312,29440⟩)))) (.node (.node (.node (.single ⟨19712,19840,3328,3456⟩) (.single ⟨19712,19840,3456,3584⟩)) (.node (.single ⟨19840,19968,3328,3456⟩) (.single ⟨19840,19968,3456,3584⟩))) (.node (.node (.single ⟨29184,29312,12800,12928⟩) (.single ⟨29184,29312,12928,13056⟩)) (.node (.single ⟨29312,29440,12800,12928⟩) (.single ⟨29312,29440,12928,13056⟩)))))
def output75 : Fin 16 → GridBox := outputData75.get
def coverData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData75 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover75 (i : Fin 16) : Fin 16 := ⟨coverData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def source75 (i : Fin 16) : Fin 16 := ⟨sourceData75.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree75 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 (.cutX 3328 .empty (.cutY 19712 .empty (.cutX 3456 (.cutY 19840 .full .full) (.cutY 19840 .full .full)))) .empty) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 .empty (.cutX 13056 (.cutY 29440 (.cutX 12928 (.cutY 29312 .full .full) (.cutY 29312 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 (.cutX 19712 .empty (.cutY 3328 .empty (.cutX 19840 (.cutY 3456 .full .full) (.cutY 3456 .full .full)))) .empty) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 .empty (.cutX 29440 (.cutY 13056 (.cutX 29312 (.cutY 12928 .full .full) (.cutY 12928 .full .full)) .empty) .empty))) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata75 : 0<48363413 ∧ 13<128 ∧ 77<128 ∧ 0<4 ∧
    1572/4160=0 ∧ 1572%4160=1572 ∧ ∀ i, (leaves75 i).Valid 8 := by
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

noncomputable def phaseMass75 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw75 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass75_eq : phaseMass75 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass75
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw75 output75 cover75 source75
    (gridTreeUnionCheck_sound 32768 raw75 output75 cover75 source75 tree75 checked75)
    _ (by norm_num) _, areaUnits75]
  norm_num

-- Frozen phase 6072, atom 1468, type 0, source (12,76).
def leavesData76 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves76 : Fin 4 → DyadicLeaf := leavesData76.get
def raw76 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 12 76 leaves76 i
def outputData76 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3072,3200,19456,19584⟩) (.single ⟨3072,3200,19584,19712⟩)) (.node (.single ⟨3200,3328,19456,19584⟩) (.single ⟨3200,3328,19584,19712⟩))) (.node (.node (.single ⟨13056,13184,29440,29568⟩) (.single ⟨13056,13184,29568,29696⟩)) (.node (.single ⟨13184,13312,29440,29568⟩) (.single ⟨13184,13312,29568,29696⟩)))) (.node (.node (.node (.single ⟨19456,19584,3072,3200⟩) (.single ⟨19456,19584,3200,3328⟩)) (.node (.single ⟨19584,19712,3072,3200⟩) (.single ⟨19584,19712,3200,3328⟩))) (.node (.node (.single ⟨29440,29568,13056,13184⟩) (.single ⟨29440,29568,13184,13312⟩)) (.node (.single ⟨29568,29696,13056,13184⟩) (.single ⟨29568,29696,13184,13312⟩)))))
def output76 : Fin 16 → GridBox := outputData76.get
def coverData76 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData76 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover76 (i : Fin 16) : Fin 16 := ⟨coverData76.get i % 16, Nat.mod_lt _ (by decide)⟩
def source76 (i : Fin 16) : Fin 16 := ⟨sourceData76.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree76 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 (.cutY 19968 (.cutX 3328 (.cutY 19712 (.cutX 3200 (.cutY 19584 .full .full) (.cutY 19584 .full .full)) .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 .empty (.cutX 13056 .empty (.cutY 29440 .empty (.cutX 13184 (.cutY 29568 .full .full) (.cutY 29568 .full .full)))))) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 (.cutX 19712 (.cutY 3328 (.cutX 19584 (.cutY 3200 .full .full) (.cutY 3200 .full .full)) .empty) .empty) .empty) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 .empty (.cutY 12800 .empty (.cutX 29440 .empty (.cutY 13056 .empty (.cutX 29568 (.cutY 13184 .full .full) (.cutY 13184 .full .full)))))) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata76 : 0<48363413 ∧ 12<128 ∧ 76<128 ∧ 0<4 ∧
    1468/4160=0 ∧ 1468%4160=1468 ∧ ∀ i, (leaves76 i).Valid 8 := by
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

noncomputable def phaseMass76 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw76 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass76_eq : phaseMass76 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass76
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw76 output76 cover76 source76
    (gridTreeUnionCheck_sound 32768 raw76 output76 cover76 source76 tree76 checked76)
    _ (by norm_num) _, areaUnits76]
  norm_num

-- Frozen phase 6073, atom 5831, type 1, source (14,75).
def leavesData77 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves77 : Fin 4 → DyadicLeaf := leavesData77.get
def raw77 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 14 75 leaves77 i
def outputData77 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨3584,3712,19200,19328⟩) (.single ⟨3584,3712,19328,19456⟩)) (.node (.single ⟨3712,3840,19200,19328⟩) (.single ⟨3712,3840,19328,19456⟩))) (.node (.node (.single ⟨13312,13440,28928,29056⟩) (.single ⟨13312,13440,29056,29184⟩)) (.node (.single ⟨13440,13568,28928,29056⟩) (.single ⟨13440,13568,29056,29184⟩)))) (.node (.node (.node (.single ⟨19200,19328,3584,3712⟩) (.single ⟨19200,19328,3712,3840⟩)) (.node (.single ⟨19328,19456,3584,3712⟩) (.single ⟨19328,19456,3712,3840⟩))) (.node (.node (.single ⟨28928,29056,13312,13440⟩) (.single ⟨28928,29056,13440,13568⟩)) (.node (.single ⟨29056,29184,13312,13440⟩) (.single ⟨29056,29184,13440,13568⟩)))))
def output77 : Fin 16 → GridBox := outputData77.get
def coverData77 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData77 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover77 (i : Fin 16) : Fin 16 := ⟨coverData77.get i % 16, Nat.mod_lt _ (by decide)⟩
def source77 (i : Fin 16) : Fin 16 := ⟨sourceData77.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree77 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 (.cutX 3584 .empty (.cutY 18944 .empty (.cutX 3840 (.cutY 19200 .empty (.cutX 3712 (.cutY 19328 .full .full) (.cutY 19328 .full .full))) .empty))) .empty)))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 (.cutX 13824 (.cutY 29184 (.cutX 13568 (.cutY 28928 .empty (.cutX 13440 (.cutY 29056 .full .full) (.cutY 29056 .full .full))) .empty) .empty) .empty) .empty)) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 .empty (.cutX 18944 .empty (.cutY 3584 .empty (.cutX 19200 .empty (.cutY 3840 (.cutX 19328 (.cutY 3712 .full .full) (.cutY 3712 .full .full)) .empty))))) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 .empty (.cutX 29184 (.cutY 13824 (.cutX 28928 .empty (.cutY 13568 (.cutX 29056 (.cutY 13440 .full .full) (.cutY 13440 .full .full)) .empty)) .empty) .empty)) .empty) .empty) .empty))))) .empty))

theorem metadata77 : 0<94387549 ∧ 14<128 ∧ 75<128 ∧ 1<4 ∧
    5831/4160=1 ∧ 5831%4160=1671 ∧ ∀ i, (leaves77 i).Valid 8 := by
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

noncomputable def phaseMass77 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw77 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass77_eq : phaseMass77 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass77
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw77 output77 cover77 source77
    (gridTreeUnionCheck_sound 32768 raw77 output77 cover77 source77 tree77 checked77)
    _ (by norm_num) _, areaUnits77]
  norm_num

-- Frozen phase 6074, atom 5931, type 1, source (15,76).
def leavesData78 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves78 : Fin 7 → DyadicLeaf := leavesData78.get
def raw78 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 15 76 leaves78 i
def outputData78 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3840,3968,19456,19584⟩) (.node (.single ⟨3840,3968,19584,19712⟩) (.single ⟨3968,4032,19456,19520⟩))) (.node (.node (.single ⟨3968,4032,19520,19584⟩) (.single ⟨4032,4096,19456,19520⟩)) (.node (.single ⟨4032,4096,19520,19584⟩) (.single ⟨3968,4096,19584,19712⟩)))) (.node (.node (.single ⟨13056,13184,28672,28800⟩) (.node (.single ⟨13056,13184,28800,28928⟩) (.single ⟨13184,13248,28672,28736⟩))) (.node (.node (.single ⟨13184,13248,28736,28800⟩) (.single ⟨13248,13312,28672,28736⟩)) (.node (.single ⟨13248,13312,28736,28800⟩) (.single ⟨13184,13312,28800,28928⟩))))) (.node (.node (.node (.single ⟨19456,19584,3840,3968⟩) (.node (.single ⟨19456,19520,3968,4032⟩) (.single ⟨19456,19520,4032,4096⟩))) (.node (.node (.single ⟨19520,19584,3968,4032⟩) (.single ⟨19520,19584,4032,4096⟩)) (.node (.single ⟨19584,19712,3840,3968⟩) (.single ⟨19584,19712,3968,4096⟩)))) (.node (.node (.single ⟨28672,28800,13056,13184⟩) (.node (.single ⟨28672,28736,13184,13248⟩) (.single ⟨28672,28736,13248,13312⟩))) (.node (.node (.single ⟨28736,28800,13184,13248⟩) (.single ⟨28736,28800,13248,13312⟩)) (.node (.single ⟨28800,28928,13056,13184⟩) (.single ⟨28800,28928,13184,13312⟩))))))
def output78 : Fin 28 → GridBox := outputData78.get
def coverData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData78 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover78 (i : Fin 28) : Fin 28 := ⟨coverData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def source78 (i : Fin 28) : Fin 28 := ⟨sourceData78.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree78 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 (.cutX 3840 .empty (.cutY 19712 (.cutX 3968 (.cutY 19584 .full .full) (.cutY 19584 (.cutX 4032 (.cutY 19520 .full .full) (.cutY 19520 .full .full)) .full)) .empty)) .empty)))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 .empty (.cutY 29184 (.cutX 13056 .empty (.cutY 28928 (.cutX 13184 (.cutY 28800 .full .full) (.cutY 28800 (.cutX 13248 (.cutY 28736 .full .full) (.cutY 28736 .full .full)) .full)) .empty)) .empty)) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 (.cutY 3584 .empty (.cutX 19712 (.cutY 3840 .empty (.cutX 19584 (.cutY 3968 .full (.cutX 19520 (.cutY 4032 .full .full) (.cutY 4032 .full .full))) (.cutY 3968 .full .full))) .empty)) .empty))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 .empty (.cutX 28928 (.cutY 13056 .empty (.cutX 28800 (.cutY 13184 .full (.cutX 28736 (.cutY 13248 .full .full) (.cutY 13248 .full .full))) (.cutY 13184 .full .full))) .empty)) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata78 : 0<94387549 ∧ 15<128 ∧ 76<128 ∧ 1<4 ∧
    5931/4160=1 ∧ 5931%4160=1771 ∧ ∀ i, (leaves78 i).Valid 8 := by
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

noncomputable def phaseMass78 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw78 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass78_eq : phaseMass78 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass78
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw78 output78 cover78 source78
    (gridTreeUnionCheck_sound 32768 raw78 output78 cover78 source78 tree78 checked78)
    _ (by norm_num) _, areaUnits78]
  norm_num

-- Frozen phase 6075, atom 6029, type 1, source (16,77).
def leavesData79 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,1⟩) (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨3,6,0⟩)) (.node (.single ⟨3,6,1⟩) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves79 : Fin 10 → DyadicLeaf := leavesData79.get
def raw79 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 16 77 leaves79 i
def outputData79 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨4096,4224,19712,19840⟩) (.single ⟨4096,4224,19840,19968⟩)) (.node (.single ⟨4224,4288,19712,19776⟩) (.node (.single ⟨4224,4288,19776,19840⟩) (.single ⟨4288,4320,19712,19744⟩)))) (.node (.node (.single ⟨4288,4320,19744,19776⟩) (.single ⟨4320,4352,19712,19744⟩)) (.node (.single ⟨4320,4352,19744,19776⟩) (.node (.single ⟨4288,4352,19776,19840⟩) (.single ⟨4224,4352,19840,19968⟩))))) (.node (.node (.node (.single ⟨12800,12928,28416,28544⟩) (.single ⟨12800,12928,28544,28672⟩)) (.node (.single ⟨12928,12992,28416,28480⟩) (.node (.single ⟨12928,12992,28480,28544⟩) (.single ⟨12992,13024,28416,28448⟩)))) (.node (.node (.single ⟨12992,13024,28448,28480⟩) (.single ⟨13024,13056,28416,28448⟩)) (.node (.single ⟨13024,13056,28448,28480⟩) (.node (.single ⟨12992,13056,28480,28544⟩) (.single ⟨12928,13056,28544,28672⟩)))))) (.node (.node (.node (.node (.single ⟨19712,19840,4096,4224⟩) (.single ⟨19712,19776,4224,4288⟩)) (.node (.single ⟨19712,19744,4288,4320⟩) (.node (.single ⟨19712,19744,4320,4352⟩) (.single ⟨19744,19776,4288,4320⟩)))) (.node (.node (.single ⟨19744,19776,4320,4352⟩) (.single ⟨19776,19840,4224,4288⟩)) (.node (.single ⟨19776,19840,4288,4352⟩) (.node (.single ⟨19840,19968,4096,4224⟩) (.single ⟨19840,19968,4224,4352⟩))))) (.node (.node (.node (.single ⟨28416,28544,12800,12928⟩) (.single ⟨28416,28480,12928,12992⟩)) (.node (.single ⟨28416,28448,12992,13024⟩) (.node (.single ⟨28416,28448,13024,13056⟩) (.single ⟨28448,28480,12992,13024⟩)))) (.node (.node (.single ⟨28448,28480,13024,13056⟩) (.single ⟨28480,28544,12928,12992⟩)) (.node (.single ⟨28480,28544,12992,13056⟩) (.node (.single ⟨28544,28672,12800,12928⟩) (.single ⟨28544,28672,12928,13056⟩)))))))
def output79 : Fin 40 → GridBox := outputData79.get
def coverData79 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 20)) (.node (.single 39) (.node (.single 19) (.single 1)))) (.node (.node (.single 28) (.single 38)) (.node (.single 11) (.node (.single 9) (.single 29))))) (.node (.node (.node (.single 30) (.single 10)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 26) (.node (.single 36) (.single 13)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 4)))) (.node (.node (.single 22) (.single 35)) (.node (.single 17) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 23) (.single 33)))) (.node (.node (.single 16) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))))
def sourceData79 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 12) (.node (.single 16) (.single 24)))) (.node (.node (.single 28) (.single 32)) (.node (.single 36) (.node (.single 20) (.single 8))))) (.node (.node (.node (.single 11) (.single 7)) (.node (.single 23) (.node (.single 19) (.single 39)))) (.node (.node (.single 31) (.single 35)) (.node (.single 27) (.node (.single 15) (.single 3)))))) (.node (.node (.node (.node (.single 1) (.single 13)) (.node (.single 25) (.node (.single 33) (.single 29)))) (.node (.node (.single 37) (.single 17)) (.node (.single 21) (.node (.single 5) (.single 9))))) (.node (.node (.node (.single 10) (.single 22)) (.node (.single 38) (.node (.single 34) (.single 30)))) (.node (.node (.single 26) (.single 18)) (.node (.single 14) (.node (.single 6) (.single 2)))))))
def cover79 (i : Fin 40) : Fin 40 := ⟨coverData79.get i % 40, Nat.mod_lt _ (by decide)⟩
def source79 (i : Fin 40) : Fin 40 := ⟨sourceData79.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree79 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 (.cutX 4352 (.cutY 19712 .empty (.cutX 4224 (.cutY 19840 .full .full) (.cutY 19840 (.cutX 4288 (.cutY 19776 .full .full) (.cutY 19776 (.cutX 4320 (.cutY 19744 .full .full) (.cutY 19744 .full .full)) .full)) .full))) .empty) .empty) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 .empty (.cutY 28160 .empty (.cutX 13056 (.cutY 28416 .empty (.cutX 12928 (.cutY 28544 .full .full) (.cutY 28544 (.cutX 12992 (.cutY 28480 .full .full) (.cutY 28480 (.cutX 13024 (.cutY 28448 .full .full) (.cutY 28448 .full .full)) .full)) .full))) .empty)))) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 (.cutY 4608 (.cutX 19712 .empty (.cutY 4352 (.cutX 19840 (.cutY 4224 .full (.cutX 19776 (.cutY 4288 .full (.cutX 19744 (.cutY 4320 .full .full) (.cutY 4320 .full .full))) (.cutY 4288 .full .full))) (.cutY 4224 .full .full)) .empty)) .empty) .empty) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 .empty (.cutX 28416 .empty (.cutY 13056 (.cutX 28544 (.cutY 12928 .full (.cutX 28480 (.cutY 12992 .full (.cutX 28448 (.cutY 13024 .full .full) (.cutY 13024 .full .full))) (.cutY 12992 .full .full))) (.cutY 12928 .full .full)) .empty)))) .empty)) .empty))) .empty))) .empty))

theorem metadata79 : 0<157738472 ∧ 16<128 ∧ 77<128 ∧ 1<4 ∧
    6029/4160=1 ∧ 6029%4160=1869 ∧ ∀ i, (leaves79 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData79).mp
    (by decide +kernel)

theorem sourceChecked79_0 : ∀ i : Fin 40,
    (fun i => output79 i = raw79 (source79 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem sourceChecked79 : ∀ i : Fin 40, (fun i => output79 i = raw79 (source79 i)) i :=
  forallFin_of_zero_offset (fun i => output79 i = raw79 (source79 i)) sourceChecked79_0

theorem coverChecked79_0 : ∀ i : Fin 40,
    (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) (finOffset 40 0 40 (by decide) i) := by decide +kernel

theorem coverChecked79 : ∀ i : Fin 40, (fun i => (output79 (cover79 i)).ContainsBox (raw79 i)) i :=
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

noncomputable def phaseMass79 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw79 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass79_eq : phaseMass79 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass79
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw79 output79 cover79 source79
    (gridTreeUnionCheck_sound 32768 raw79 output79 cover79 source79 tree79 checked79)
    _ (by norm_num) _, areaUnits79]
  norm_num

-- Frozen phase 6076, atom 4229, type 1, source (0,69).
def leavesData80 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves80 : Fin 7 → DyadicLeaf := leavesData80.get
def raw80 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 0 69 leaves80 i
def outputData80 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨0,128,17664,17792⟩) (.node (.single ⟨0,128,17792,17920⟩) (.single ⟨128,192,17664,17728⟩))) (.node (.node (.single ⟨128,192,17728,17792⟩) (.single ⟨192,256,17664,17728⟩)) (.node (.single ⟨192,256,17728,17792⟩) (.single ⟨128,256,17792,17920⟩)))) (.node (.node (.single ⟨14848,14976,32512,32640⟩) (.node (.single ⟨14848,14976,32640,32768⟩) (.single ⟨14976,15040,32512,32576⟩))) (.node (.node (.single ⟨14976,15040,32576,32640⟩) (.single ⟨15040,15104,32512,32576⟩)) (.node (.single ⟨15040,15104,32576,32640⟩) (.single ⟨14976,15104,32640,32768⟩))))) (.node (.node (.node (.single ⟨17664,17792,0,128⟩) (.node (.single ⟨17664,17728,128,192⟩) (.single ⟨17664,17728,192,256⟩))) (.node (.node (.single ⟨17728,17792,128,192⟩) (.single ⟨17728,17792,192,256⟩)) (.node (.single ⟨17792,17920,0,128⟩) (.single ⟨17792,17920,128,256⟩)))) (.node (.node (.single ⟨32512,32640,14848,14976⟩) (.node (.single ⟨32512,32576,14976,15040⟩) (.single ⟨32512,32576,15040,15104⟩))) (.node (.node (.single ⟨32576,32640,14976,15040⟩) (.single ⟨32576,32640,15040,15104⟩)) (.node (.single ⟨32640,32768,14848,14976⟩) (.single ⟨32640,32768,14976,15104⟩))))))
def output80 : Fin 28 → GridBox := outputData80.get
def coverData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData80 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover80 (i : Fin 28) : Fin 28 := ⟨coverData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def source80 (i : Fin 28) : Fin 28 := ⟨sourceData80.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree80 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 (.cutX 256 (.cutY 17664 .empty (.cutX 128 (.cutY 17792 .full .full) (.cutY 17792 (.cutX 192 (.cutY 17728 .full .full) (.cutY 17728 .full .full)) .full))) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 .empty (.cutY 32256 .empty (.cutX 15104 (.cutY 32512 .empty (.cutX 14976 (.cutY 32640 .full .full) (.cutY 32640 (.cutX 15040 (.cutY 32576 .full .full) (.cutY 32576 .full .full)) .full))) .empty)))) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 (.cutY 512 (.cutX 17664 .empty (.cutY 256 (.cutX 17792 (.cutY 128 .full (.cutX 17728 (.cutY 192 .full .full) (.cutY 192 .full .full))) (.cutY 128 .full .full)) .empty)) .empty) .empty) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 .empty (.cutX 32512 .empty (.cutY 15104 (.cutX 32640 (.cutY 14976 .full (.cutX 32576 (.cutY 15040 .full .full) (.cutY 15040 .full .full))) (.cutY 14976 .full .full)) .empty)))) .empty)))))))) .empty))

theorem metadata80 : 0<202148459 ∧ 0<128 ∧ 69<128 ∧ 1<4 ∧
    4229/4160=1 ∧ 4229%4160=69 ∧ ∀ i, (leaves80 i).Valid 8 := by
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

noncomputable def phaseMass80 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw80 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass80_eq : phaseMass80 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass80
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw80 output80 cover80 source80
    (gridTreeUnionCheck_sound 32768 raw80 output80 cover80 source80 tree80 checked80)
    _ (by norm_num) _, areaUnits80]
  norm_num

-- Frozen phase 6077, atom 4605, type 1, source (3,70).
def leavesData81 : FiniteInputTree DyadicLeaf 16 := (.node (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,0,0⟩) (.single ⟨2,0,1⟩))) (.node (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩)))) (.node (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩))) (.node (.node (.single ⟨3,4,0⟩) (.single ⟨3,4,1⟩)) (.node (.single ⟨3,5,0⟩) (.single ⟨3,5,1⟩)))))
def leaves81 : Fin 16 → DyadicLeaf := leavesData81.get
def raw81 (i : Fin 64) : GridBox := phaseImageBoxes 32768 8 3 70 leaves81 i
def outputData81 : FiniteInputTree GridBox 64 := (.node (.node (.node (.node (.node (.node (.single ⟨768,832,17920,17984⟩) (.single ⟨768,832,17984,18048⟩)) (.node (.single ⟨832,896,17920,17984⟩) (.single ⟨832,896,17984,18048⟩))) (.node (.node (.single ⟨768,896,18048,18176⟩) (.single ⟨896,928,17920,17952⟩)) (.node (.single ⟨896,928,17952,17984⟩) (.single ⟨928,960,17920,17952⟩)))) (.node (.node (.node (.single ⟨928,960,17952,17984⟩) (.single ⟨896,960,17984,18048⟩)) (.node (.single ⟨960,992,17920,17952⟩) (.single ⟨960,992,17952,17984⟩))) (.node (.node (.single ⟨992,1024,17920,17952⟩) (.single ⟨992,1024,17952,17984⟩)) (.node (.single ⟨960,1024,17984,18048⟩) (.single ⟨896,1024,18048,18176⟩))))) (.node (.node (.node (.node (.single ⟨14592,14720,31744,31872⟩) (.single ⟨14592,14720,31872,32000⟩)) (.node (.single ⟨14720,14784,31744,31808⟩) (.single ⟨14720,14784,31808,31872⟩))) (.node (.node (.single ⟨14784,14816,31744,31776⟩) (.single ⟨14784,14816,31776,31808⟩)) (.node (.single ⟨14816,14848,31744,31776⟩) (.single ⟨14816,14848,31776,31808⟩)))) (.node (.node (.node (.single ⟨14784,14816,31808,31840⟩) (.single ⟨14784,14816,31840,31872⟩)) (.node (.single ⟨14816,14848,31808,31840⟩) (.single ⟨14816,14848,31840,31872⟩))) (.node (.node (.single ⟨14720,14784,31872,31936⟩) (.single ⟨14720,14784,31936,32000⟩)) (.node (.single ⟨14784,14848,31872,31936⟩) (.single ⟨14784,14848,31936,32000⟩)))))) (.node (.node (.node (.node (.node (.single ⟨17920,17984,768,832⟩) (.single ⟨17920,17984,832,896⟩)) (.node (.single ⟨17984,18048,768,832⟩) (.single ⟨17984,18048,832,896⟩))) (.node (.node (.single ⟨17920,17952,896,928⟩) (.single ⟨17920,17952,928,960⟩)) (.node (.single ⟨17952,17984,896,928⟩) (.single ⟨17952,17984,928,960⟩)))) (.node (.node (.node (.single ⟨17920,17952,960,992⟩) (.single ⟨17920,17952,992,1024⟩)) (.node (.single ⟨17952,17984,960,992⟩) (.single ⟨17952,17984,992,1024⟩))) (.node (.node (.single ⟨17984,18048,896,960⟩) (.single ⟨17984,18048,960,1024⟩)) (.node (.single ⟨18048,18176,768,896⟩) (.single ⟨18048,18176,896,1024⟩))))) (.node (.node (.node (.node (.single ⟨31744,31872,14592,14720⟩) (.single ⟨31744,31808,14720,14784⟩)) (.node (.single ⟨31744,31776,14784,14816⟩) (.single ⟨31744,31776,14816,14848⟩))) (.node (.node (.single ⟨31776,31808,14784,14816⟩) (.single ⟨31776,31808,14816,14848⟩)) (.node (.single ⟨31808,31872,14720,14784⟩) (.single ⟨31808,31840,14784,14816⟩)))) (.node (.node (.node (.single ⟨31808,31840,14816,14848⟩) (.single ⟨31840,31872,14784,14816⟩)) (.node (.single ⟨31840,31872,14816,14848⟩) (.single ⟨31872,32000,14592,14720⟩))) (.node (.node (.single ⟨31872,31936,14720,14784⟩) (.single ⟨31872,31936,14784,14848⟩)) (.node (.single ⟨31936,32000,14720,14784⟩) (.single ⟨31936,32000,14784,14848⟩)))))))
def output81 : Fin 64 → GridBox := outputData81.get
def coverData81 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 4) (.single 46)) (.node (.single 59) (.single 17))) (.node (.node (.single 15) (.single 47)) (.node (.single 48) (.single 16)))) (.node (.node (.node (.single 0) (.single 32)) (.node (.single 63) (.single 31))) (.node (.node (.single 1) (.single 34)) (.node (.single 62) (.single 29))))) (.node (.node (.node (.node (.single 2) (.single 33)) (.node (.single 61) (.single 30))) (.node (.node (.single 3) (.single 35)) (.node (.single 60) (.single 28)))) (.node (.node (.node (.single 9) (.single 44)) (.node (.single 54) (.single 19))) (.node (.node (.single 14) (.single 45)) (.node (.single 49) (.single 18)))))) (.node (.node (.node (.node (.node (.single 10) (.single 40)) (.node (.single 53) (.single 23))) (.node (.node (.single 11) (.single 42)) (.node (.single 52) (.single 21)))) (.node (.node (.node (.single 12) (.single 41)) (.node (.single 51) (.single 22))) (.node (.node (.single 13) (.single 43)) (.node (.single 50) (.single 20))))) (.node (.node (.node (.node (.single 5) (.single 36)) (.node (.single 58) (.single 27))) (.node (.node (.single 6) (.single 38)) (.node (.single 57) (.single 25)))) (.node (.node (.node (.single 7) (.single 37)) (.node (.single 56) (.single 26))) (.node (.node (.single 8) (.single 39)) (.node (.single 55) (.single 24)))))))
def sourceData81 : FiniteInputTree ℕ 64 := (.node (.node (.node (.node (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.single 20))) (.node (.node (.single 0) (.single 48)) (.node (.single 52) (.single 56)))) (.node (.node (.node (.single 60) (.single 24)) (.node (.single 32) (.single 36))) (.node (.node (.single 40) (.single 44)) (.node (.single 28) (.single 4))))) (.node (.node (.node (.node (.single 7) (.single 3)) (.node (.single 31) (.single 27))) (.node (.node (.single 47) (.single 39)) (.node (.single 43) (.single 35)))) (.node (.node (.node (.single 63) (.single 55)) (.node (.single 59) (.single 51))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.node (.single 9) (.single 17)) (.node (.single 13) (.single 21))) (.node (.node (.single 49) (.single 57)) (.node (.single 53) (.single 61)))) (.node (.node (.node (.single 33) (.single 41)) (.node (.single 37) (.single 45))) (.node (.node (.single 25) (.single 29)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.node (.single 6) (.single 30)) (.node (.single 46) (.single 42))) (.node (.node (.single 38) (.single 34)) (.node (.single 26) (.single 62)))) (.node (.node (.node (.single 58) (.single 54)) (.node (.single 50) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover81 (i : Fin 64) : Fin 64 := ⟨coverData81.get i % 64, Nat.mod_lt _ (by decide)⟩
def source81 (i : Fin 64) : Fin 64 := ⟨sourceData81.get i % 64, Nat.mod_lt _ (by decide)⟩
def tree81 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 .empty (.cutY 18176 (.cutX 896 (.cutY 18048 (.cutX 832 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 960 (.cutY 17984 (.cutX 928 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full) (.cutY 17984 (.cutX 992 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty))))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 .empty (.cutY 32000 (.cutX 14720 (.cutY 31872 .full .full) (.cutY 31872 (.cutX 14784 (.cutY 31808 .full .full) (.cutY 31808 (.cutX 14816 (.cutY 31776 .full .full) (.cutY 31776 .full .full)) (.cutX 14816 (.cutY 31840 .full .full) (.cutY 31840 .full .full)))) (.cutX 14784 (.cutY 31936 .full .full) (.cutY 31936 .full .full)))) .empty)) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 (.cutY 768 .empty (.cutX 18048 (.cutY 896 (.cutX 17984 (.cutY 832 .full .full) (.cutY 832 .full .full)) (.cutX 17984 (.cutY 960 (.cutX 17952 (.cutY 928 .full .full) (.cutY 928 .full .full)) (.cutX 17952 (.cutY 992 .full .full) (.cutY 992 .full .full))) (.cutY 960 .full .full))) (.cutY 896 .full .full))) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 (.cutY 14592 .empty (.cutX 31872 (.cutY 14720 .full (.cutX 31808 (.cutY 14784 .full (.cutX 31776 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full (.cutX 31840 (.cutY 14816 .full .full) (.cutY 14816 .full .full))))) (.cutY 14720 .full (.cutX 31936 (.cutY 14784 .full .full) (.cutY 14784 .full .full))))) .empty) .empty) .empty) .empty)))))))) .empty))

theorem metadata81 : 0<202148459 ∧ 3<128 ∧ 70<128 ∧ 1<4 ∧
    4605/4160=1 ∧ 4605%4160=445 ∧ ∀ i, (leaves81 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData81).mp
    (by decide +kernel)

theorem sourceChecked81_0 : ∀ i : Fin 64,
    (fun i => output81 i = raw81 (source81 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem sourceChecked81 : ∀ i : Fin 64, (fun i => output81 i = raw81 (source81 i)) i :=
  forallFin_of_zero_offset (fun i => output81 i = raw81 (source81 i)) sourceChecked81_0

theorem coverChecked81_0 : ∀ i : Fin 64,
    (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) (finOffset 64 0 64 (by decide) i) := by decide +kernel

theorem coverChecked81 : ∀ i : Fin 64, (fun i => (output81 (cover81 i)).ContainsBox (raw81 i)) i :=
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

-- Frozen phase 6078, atom 5303, type 1, source (9,72).
def leavesData82 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves82 : Fin 7 → DyadicLeaf := leavesData82.get
def raw82 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 9 72 leaves82 i
def outputData82 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2304,2432,18432,18560⟩) (.node (.single ⟨2304,2432,18560,18688⟩) (.single ⟨2432,2496,18432,18496⟩))) (.node (.node (.single ⟨2432,2496,18496,18560⟩) (.single ⟨2496,2560,18432,18496⟩)) (.node (.single ⟨2496,2560,18496,18560⟩) (.single ⟨2432,2560,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,30208,30336⟩) (.node (.single ⟨14080,14208,30336,30464⟩) (.single ⟨14208,14272,30208,30272⟩))) (.node (.node (.single ⟨14208,14272,30272,30336⟩) (.single ⟨14272,14336,30208,30272⟩)) (.node (.single ⟨14272,14336,30272,30336⟩) (.single ⟨14208,14336,30336,30464⟩))))) (.node (.node (.node (.single ⟨18432,18560,2304,2432⟩) (.node (.single ⟨18432,18496,2432,2496⟩) (.single ⟨18432,18496,2496,2560⟩))) (.node (.node (.single ⟨18496,18560,2432,2496⟩) (.single ⟨18496,18560,2496,2560⟩)) (.node (.single ⟨18560,18688,2304,2432⟩) (.single ⟨18560,18688,2432,2560⟩)))) (.node (.node (.single ⟨30208,30336,14080,14208⟩) (.node (.single ⟨30208,30272,14208,14272⟩) (.single ⟨30208,30272,14272,14336⟩))) (.node (.node (.single ⟨30272,30336,14208,14272⟩) (.single ⟨30272,30336,14272,14336⟩)) (.node (.single ⟨30336,30464,14080,14208⟩) (.single ⟨30336,30464,14208,14336⟩))))))
def output82 : Fin 28 → GridBox := outputData82.get
def coverData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData82 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover82 (i : Fin 28) : Fin 28 := ⟨coverData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def source82 (i : Fin 28) : Fin 28 := ⟨sourceData82.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree82 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 (.cutX 2304 .empty (.cutY 18688 (.cutX 2432 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 2496 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty)) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 .empty (.cutX 14080 .empty (.cutY 30464 (.cutX 14208 (.cutY 30336 .full .full) (.cutY 30336 (.cutX 14272 (.cutY 30272 .full .full) (.cutY 30272 .full .full)) .full)) .empty)))))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 (.cutX 18688 (.cutY 2304 .empty (.cutX 18560 (.cutY 2432 .full (.cutX 18496 (.cutY 2496 .full .full) (.cutY 2496 .full .full))) (.cutY 2432 .full .full))) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 .empty (.cutX 30464 (.cutY 14080 .empty (.cutX 30336 (.cutY 14208 .full (.cutX 30272 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))) .empty))))) .empty) .empty))))) .empty))

theorem metadata82 : 0<94387549 ∧ 9<128 ∧ 72<128 ∧ 1<4 ∧
    5303/4160=1 ∧ 5303%4160=1143 ∧ ∀ i, (leaves82 i).Valid 8 := by
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

noncomputable def phaseMass82 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw82 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass82_eq : phaseMass82 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass82
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw82 output82 cover82 source82
    (gridTreeUnionCheck_sound 32768 raw82 output82 cover82 source82 tree82 checked82)
    _ (by norm_num) _, areaUnits82]
  norm_num

-- Frozen phase 6079, atom 4846, type 1, source (5,71).
def leavesData83 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves83 : Fin 10 → DyadicLeaf := leavesData83.get
def raw83 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 5 71 leaves83 i
def outputData83 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨1280,1344,18176,18240⟩) (.single ⟨1280,1344,18240,18304⟩)) (.node (.single ⟨1344,1408,18176,18240⟩) (.node (.single ⟨1344,1408,18240,18304⟩) (.single ⟨1280,1408,18304,18432⟩)))) (.node (.node (.single ⟨1408,1472,18176,18240⟩) (.single ⟨1408,1472,18240,18304⟩)) (.node (.single ⟨1472,1536,18176,18240⟩) (.node (.single ⟨1472,1536,18240,18304⟩) (.single ⟨1408,1536,18304,18432⟩))))) (.node (.node (.node (.single ⟨14336,14464,31232,31360⟩) (.single ⟨14336,14464,31360,31488⟩)) (.node (.single ⟨14464,14528,31232,31296⟩) (.node (.single ⟨14464,14528,31296,31360⟩) (.single ⟨14528,14592,31232,31296⟩)))) (.node (.node (.single ⟨14528,14592,31296,31360⟩) (.single ⟨14464,14528,31360,31424⟩)) (.node (.single ⟨14464,14528,31424,31488⟩) (.node (.single ⟨14528,14592,31360,31424⟩) (.single ⟨14528,14592,31424,31488⟩)))))) (.node (.node (.node (.node (.single ⟨18176,18240,1280,1344⟩) (.single ⟨18176,18240,1344,1408⟩)) (.node (.single ⟨18240,18304,1280,1344⟩) (.node (.single ⟨18240,18304,1344,1408⟩) (.single ⟨18176,18240,1408,1472⟩)))) (.node (.node (.single ⟨18176,18240,1472,1536⟩) (.single ⟨18240,18304,1408,1472⟩)) (.node (.single ⟨18240,18304,1472,1536⟩) (.node (.single ⟨18304,18432,1280,1408⟩) (.single ⟨18304,18432,1408,1536⟩))))) (.node (.node (.node (.single ⟨31232,31360,14336,14464⟩) (.single ⟨31232,31296,14464,14528⟩)) (.node (.single ⟨31232,31296,14528,14592⟩) (.node (.single ⟨31296,31360,14464,14528⟩) (.single ⟨31296,31360,14528,14592⟩)))) (.node (.node (.single ⟨31360,31488,14336,14464⟩) (.single ⟨31360,31424,14464,14528⟩)) (.node (.single ⟨31360,31424,14528,14592⟩) (.node (.single ⟨31424,31488,14464,14528⟩) (.single ⟨31424,31488,14528,14592⟩)))))))
def output83 : Fin 40 → GridBox := outputData83.get
def coverData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData83 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover83 (i : Fin 40) : Fin 40 := ⟨coverData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def source83 (i : Fin 40) : Fin 40 := ⟨sourceData83.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree83 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 .empty (.cutY 18176 .empty (.cutX 1408 (.cutY 18304 (.cutX 1344 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full) (.cutY 18304 (.cutX 1472 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 (.cutY 31488 (.cutX 14464 (.cutY 31360 .full .full) (.cutY 31360 (.cutX 14528 (.cutY 31296 .full .full) (.cutY 31296 .full .full)) (.cutX 14528 (.cutY 31424 .full .full) (.cutY 31424 .full .full)))) .empty) .empty)) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 .empty (.cutY 1280 .empty (.cutX 18304 (.cutY 1408 (.cutX 18240 (.cutY 1344 .full .full) (.cutY 1344 .full .full)) (.cutX 18240 (.cutY 1472 .full .full) (.cutY 1472 .full .full))) (.cutY 1408 .full .full)))) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 (.cutY 14592 (.cutX 31360 (.cutY 14464 .full (.cutX 31296 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full (.cutX 31424 (.cutY 14528 .full .full) (.cutY 14528 .full .full)))) .empty) .empty) .empty)) .empty) .empty))))))) .empty))

theorem metadata83 : 0<202148459 ∧ 5<128 ∧ 71<128 ∧ 1<4 ∧
    4846/4160=1 ∧ 4846%4160=686 ∧ ∀ i, (leaves83 i).Valid 8 := by
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

noncomputable def phaseMass83 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw83 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass83_eq : phaseMass83 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass83
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw83 output83 cover83 source83
    (gridTreeUnionCheck_sound 32768 raw83 output83 cover83 source83 tree83 checked83)
    _ (by norm_num) _, areaUnits83]
  norm_num

-- Frozen phase 6080, atom 568, type 0, source (4,72).
def leavesData84 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves84 : Fin 7 → DyadicLeaf := leavesData84.get
def raw84 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 72 leaves84 i
def outputData84 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,18432,18560⟩) (.node (.single ⟨1024,1152,18560,18688⟩) (.single ⟨1152,1216,18432,18496⟩))) (.node (.node (.single ⟨1152,1216,18496,18560⟩) (.single ⟨1216,1280,18432,18496⟩)) (.node (.single ⟨1216,1280,18496,18560⟩) (.single ⟨1152,1280,18560,18688⟩)))) (.node (.node (.single ⟨14080,14208,31488,31616⟩) (.node (.single ⟨14080,14208,31616,31744⟩) (.single ⟨14208,14272,31488,31552⟩))) (.node (.node (.single ⟨14208,14272,31552,31616⟩) (.single ⟨14272,14336,31488,31552⟩)) (.node (.single ⟨14272,14336,31552,31616⟩) (.single ⟨14208,14336,31616,31744⟩))))) (.node (.node (.node (.single ⟨18432,18560,1024,1152⟩) (.node (.single ⟨18432,18496,1152,1216⟩) (.single ⟨18432,18496,1216,1280⟩))) (.node (.node (.single ⟨18496,18560,1152,1216⟩) (.single ⟨18496,18560,1216,1280⟩)) (.node (.single ⟨18560,18688,1024,1152⟩) (.single ⟨18560,18688,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,14080,14208⟩) (.node (.single ⟨31488,31552,14208,14272⟩) (.single ⟨31488,31552,14272,14336⟩))) (.node (.node (.single ⟨31552,31616,14208,14272⟩) (.single ⟨31552,31616,14272,14336⟩)) (.node (.single ⟨31616,31744,14080,14208⟩) (.single ⟨31616,31744,14208,14336⟩))))))
def output84 : Fin 28 → GridBox := outputData84.get
def coverData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData84 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover84 (i : Fin 28) : Fin 28 := ⟨coverData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def source84 (i : Fin 28) : Fin 28 := ⟨sourceData84.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree84 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 .empty (.cutX 1024 .empty (.cutY 19456 (.cutX 1536 (.cutY 18944 (.cutX 1280 (.cutY 18688 (.cutX 1152 (.cutY 18560 .full .full) (.cutY 18560 (.cutX 1216 (.cutY 18496 .full .full) (.cutY 18496 .full .full)) .full)) .empty) .empty) .empty) .empty) .empty))) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 .empty (.cutX 13312 .empty (.cutY 31744 (.cutX 13824 .empty (.cutY 31232 .empty (.cutX 14080 .empty (.cutY 31488 .empty (.cutX 14208 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 14272 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full)))))) .empty))) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 (.cutX 19456 (.cutY 1024 .empty (.cutX 18944 (.cutY 1536 (.cutX 18688 (.cutY 1280 (.cutX 18560 (.cutY 1152 .full (.cutX 18496 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 (.cutX 31744 (.cutY 13312 .empty (.cutX 31232 .empty (.cutY 13824 .empty (.cutX 31488 .empty (.cutY 14080 .empty (.cutX 31616 (.cutY 14208 .full (.cutX 31552 (.cutY 14272 .full .full) (.cutY 14272 .full .full))) (.cutY 14208 .full .full))))))) .empty) .empty)))))) .empty))

theorem metadata84 : 0<34183877 ∧ 4<128 ∧ 72<128 ∧ 0<4 ∧
    568/4160=0 ∧ 568%4160=568 ∧ ∀ i, (leaves84 i).Valid 8 := by
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

noncomputable def phaseMass84 : ℝ := singlePhaseMass (34183877/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw84 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass84_eq : phaseMass84 = (34183877/1638400000000 : ℝ) := by
  unfold phaseMass84
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw84 output84 cover84 source84
    (gridTreeUnionCheck_sound 32768 raw84 output84 cover84 source84 tree84 checked84)
    _ (by norm_num) _, areaUnits84]
  norm_num

-- Frozen phase 6081, atom 2739, type 0, source (26,87).
def leavesData85 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves85 : Fin 10 → DyadicLeaf := leavesData85.get
def raw85 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 26 87 leaves85 i
def outputData85 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6656,6720,22272,22336⟩) (.single ⟨6656,6720,22336,22400⟩)) (.node (.single ⟨6720,6784,22272,22336⟩) (.node (.single ⟨6720,6784,22336,22400⟩) (.single ⟨6656,6784,22400,22528⟩)))) (.node (.node (.single ⟨6784,6848,22272,22336⟩) (.single ⟨6784,6848,22336,22400⟩)) (.node (.single ⟨6848,6912,22272,22336⟩) (.node (.single ⟨6848,6912,22336,22400⟩) (.single ⟨6784,6912,22400,22528⟩))))) (.node (.node (.node (.single ⟨10240,10368,25856,25984⟩) (.single ⟨10240,10368,25984,26112⟩)) (.node (.single ⟨10368,10432,25856,25920⟩) (.node (.single ⟨10368,10432,25920,25984⟩) (.single ⟨10432,10496,25856,25920⟩)))) (.node (.node (.single ⟨10432,10496,25920,25984⟩) (.single ⟨10368,10432,25984,26048⟩)) (.node (.single ⟨10368,10432,26048,26112⟩) (.node (.single ⟨10432,10496,25984,26048⟩) (.single ⟨10432,10496,26048,26112⟩)))))) (.node (.node (.node (.node (.single ⟨22272,22336,6656,6720⟩) (.single ⟨22272,22336,6720,6784⟩)) (.node (.single ⟨22336,22400,6656,6720⟩) (.node (.single ⟨22336,22400,6720,6784⟩) (.single ⟨22272,22336,6784,6848⟩)))) (.node (.node (.single ⟨22272,22336,6848,6912⟩) (.single ⟨22336,22400,6784,6848⟩)) (.node (.single ⟨22336,22400,6848,6912⟩) (.node (.single ⟨22400,22528,6656,6784⟩) (.single ⟨22400,22528,6784,6912⟩))))) (.node (.node (.node (.single ⟨25856,25984,10240,10368⟩) (.single ⟨25856,25920,10368,10432⟩)) (.node (.single ⟨25856,25920,10432,10496⟩) (.node (.single ⟨25920,25984,10368,10432⟩) (.single ⟨25920,25984,10432,10496⟩)))) (.node (.node (.single ⟨25984,26112,10240,10368⟩) (.single ⟨25984,26048,10368,10432⟩)) (.node (.single ⟨25984,26048,10432,10496⟩) (.node (.single ⟨26048,26112,10368,10432⟩) (.single ⟨26048,26112,10432,10496⟩)))))))
def output85 : Fin 40 → GridBox := outputData85.get
def coverData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData85 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover85 (i : Fin 40) : Fin 40 := ⟨coverData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def source85 (i : Fin 40) : Fin 40 := ⟨sourceData85.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree85 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 .empty (.cutX 6656 .empty (.cutY 22016 .empty (.cutX 6912 (.cutY 22272 .empty (.cutX 6784 (.cutY 22400 (.cutX 6720 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full) (.cutY 22400 (.cutX 6848 (.cutY 22336 .full .full) (.cutY 22336 .full .full)) .full))) .empty)))) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 (.cutY 25600 .empty (.cutX 10752 (.cutY 26112 (.cutX 10496 (.cutY 25856 .empty (.cutX 10368 (.cutY 25984 .full .full) (.cutY 25984 (.cutX 10432 (.cutY 25920 .full .full) (.cutY 25920 .full .full)) (.cutX 10432 (.cutY 26048 .full .full) (.cutY 26048 .full .full))))) .empty) .empty) .empty)) .empty) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 .empty (.cutY 7168 (.cutX 22016 .empty (.cutY 6656 .empty (.cutX 22272 .empty (.cutY 6912 (.cutX 22400 (.cutY 6784 (.cutX 22336 (.cutY 6720 .full .full) (.cutY 6720 .full .full)) (.cutX 22336 (.cutY 6848 .full .full) (.cutY 6848 .full .full))) (.cutY 6784 .full .full)) .empty)))) .empty))) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 (.cutX 26112 (.cutY 10752 (.cutX 25856 .empty (.cutY 10496 (.cutX 25984 (.cutY 10368 .full (.cutX 25920 (.cutY 10432 .full .full) (.cutY 10432 .full .full))) (.cutY 10368 .full (.cutX 26048 (.cutY 10432 .full .full) (.cutY 10432 .full .full)))) .empty)) .empty) .empty) .empty))) .empty) .empty) .empty))) .empty))

theorem metadata85 : 0<104681033 ∧ 26<128 ∧ 87<128 ∧ 0<4 ∧
    2739/4160=0 ∧ 2739%4160=2739 ∧ ∀ i, (leaves85 i).Valid 8 := by
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

noncomputable def phaseMass85 : ℝ := singlePhaseMass (104681033/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw85 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass85_eq : phaseMass85 = (104681033/1638400000000 : ℝ) := by
  unfold phaseMass85
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw85 output85 cover85 source85
    (gridTreeUnionCheck_sound 32768 raw85 output85 cover85 source85 tree85 checked85)
    _ (by norm_num) _, areaUnits85]
  norm_num

-- Frozen phase 6082, atom 1674, type 0, source (14,78).
def leavesData86 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves86 : Fin 7 → DyadicLeaf := leavesData86.get
def raw86 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 14 78 leaves86 i
def outputData86 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨3584,3712,19968,20096⟩) (.node (.single ⟨3584,3712,20096,20224⟩) (.single ⟨3712,3776,19968,20032⟩))) (.node (.node (.single ⟨3712,3776,20032,20096⟩) (.single ⟨3776,3840,19968,20032⟩)) (.node (.single ⟨3776,3840,20032,20096⟩) (.single ⟨3712,3840,20096,20224⟩)))) (.node (.node (.single ⟨12544,12672,28928,29056⟩) (.node (.single ⟨12544,12672,29056,29184⟩) (.single ⟨12672,12736,28928,28992⟩))) (.node (.node (.single ⟨12672,12736,28992,29056⟩) (.single ⟨12736,12800,28928,28992⟩)) (.node (.single ⟨12736,12800,28992,29056⟩) (.single ⟨12672,12800,29056,29184⟩))))) (.node (.node (.node (.single ⟨19968,20096,3584,3712⟩) (.node (.single ⟨19968,20032,3712,3776⟩) (.single ⟨19968,20032,3776,3840⟩))) (.node (.node (.single ⟨20032,20096,3712,3776⟩) (.single ⟨20032,20096,3776,3840⟩)) (.node (.single ⟨20096,20224,3584,3712⟩) (.single ⟨20096,20224,3712,3840⟩)))) (.node (.node (.single ⟨28928,29056,12544,12672⟩) (.node (.single ⟨28928,28992,12672,12736⟩) (.single ⟨28928,28992,12736,12800⟩))) (.node (.node (.single ⟨28992,29056,12672,12736⟩) (.single ⟨28992,29056,12736,12800⟩)) (.node (.single ⟨29056,29184,12544,12672⟩) (.single ⟨29056,29184,12672,12800⟩))))))
def output86 : Fin 28 → GridBox := outputData86.get
def coverData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData86 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover86 (i : Fin 28) : Fin 28 := ⟨coverData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def source86 (i : Fin 28) : Fin 28 := ⟨sourceData86.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree86 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 .empty (.cutY 19456 .empty (.cutX 3584 .empty (.cutY 19968 .empty (.cutX 3840 (.cutY 20224 (.cutX 3712 (.cutY 20096 .full .full) (.cutY 20096 (.cutX 3776 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full)) .empty) .empty))))))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 (.cutY 29696 (.cutX 12800 (.cutY 29184 (.cutX 12544 .empty (.cutY 28928 .empty (.cutX 12672 (.cutY 29056 .full .full) (.cutY 29056 (.cutX 12736 (.cutY 28992 .full .full) (.cutY 28992 .full .full)) .full)))) .empty) .empty) .empty) .empty) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 .empty (.cutY 3072 .empty (.cutX 19968 .empty (.cutY 3584 .empty (.cutX 20224 (.cutY 3840 (.cutX 20096 (.cutY 3712 .full (.cutX 20032 (.cutY 3776 .full .full) (.cutY 3776 .full .full))) (.cutY 3712 .full .full)) .empty) .empty))))))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 (.cutY 13312 (.cutX 29184 (.cutY 12800 (.cutX 28928 .empty (.cutY 12544 .empty (.cutX 29056 (.cutY 12672 .full (.cutX 28992 (.cutY 12736 .full .full) (.cutY 12736 .full .full))) (.cutY 12672 .full .full)))) .empty) .empty) .empty) .empty) .empty) .empty))))) .empty))

theorem metadata86 : 0<48363413 ∧ 14<128 ∧ 78<128 ∧ 0<4 ∧
    1674/4160=0 ∧ 1674%4160=1674 ∧ ∀ i, (leaves86 i).Valid 8 := by
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

noncomputable def phaseMass86 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw86 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass86_eq : phaseMass86 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass86
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw86 output86 cover86 source86
    (gridTreeUnionCheck_sound 32768 raw86 output86 cover86 source86 tree86 checked86)
    _ (by norm_num) _, areaUnits86]
  norm_num

-- Frozen phase 6083, atom 6125, type 1, source (17,78).
def leavesData87 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves87 : Fin 13 → DyadicLeaf := leavesData87.get
def raw87 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 17 78 leaves87 i
def outputData87 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4352,4416,19968,20032⟩) (.node (.single ⟨4352,4416,20032,20096⟩) (.single ⟨4416,4480,19968,20032⟩))) (.node (.single ⟨4416,4480,20032,20096⟩) (.node (.single ⟨4352,4480,20096,20224⟩) (.single ⟨4480,4544,19968,20032⟩)))) (.node (.node (.single ⟨4480,4544,20032,20096⟩) (.node (.single ⟨4544,4576,19968,20000⟩) (.single ⟨4544,4576,20000,20032⟩))) (.node (.node (.single ⟨4576,4608,19968,20000⟩) (.single ⟨4576,4608,20000,20032⟩)) (.node (.single ⟨4544,4608,20032,20096⟩) (.single ⟨4480,4608,20096,20224⟩))))) (.node (.node (.node (.single ⟨12544,12672,28160,28288⟩) (.node (.single ⟨12544,12672,28288,28416⟩) (.single ⟨12672,12736,28160,28224⟩))) (.node (.single ⟨12672,12736,28224,28288⟩) (.node (.single ⟨12736,12768,28160,28192⟩) (.single ⟨12736,12768,28192,28224⟩)))) (.node (.node (.single ⟨12768,12800,28160,28192⟩) (.node (.single ⟨12768,12800,28192,28224⟩) (.single ⟨12736,12800,28224,28288⟩))) (.node (.node (.single ⟨12672,12736,28288,28352⟩) (.single ⟨12672,12736,28352,28416⟩)) (.node (.single ⟨12736,12800,28288,28352⟩) (.single ⟨12736,12800,28352,28416⟩)))))) (.node (.node (.node (.node (.single ⟨19968,20032,4352,4416⟩) (.node (.single ⟨19968,20032,4416,4480⟩) (.single ⟨20032,20096,4352,4416⟩))) (.node (.single ⟨20032,20096,4416,4480⟩) (.node (.single ⟨19968,20032,4480,4544⟩) (.single ⟨19968,20000,4544,4576⟩)))) (.node (.node (.single ⟨19968,20000,4576,4608⟩) (.node (.single ⟨20000,20032,4544,4576⟩) (.single ⟨20000,20032,4576,4608⟩))) (.node (.node (.single ⟨20032,20096,4480,4544⟩) (.single ⟨20032,20096,4544,4608⟩)) (.node (.single ⟨20096,20224,4352,4480⟩) (.single ⟨20096,20224,4480,4608⟩))))) (.node (.node (.node (.single ⟨28160,28288,12544,12672⟩) (.node (.single ⟨28160,28224,12672,12736⟩) (.single ⟨28160,28192,12736,12768⟩))) (.node (.single ⟨28160,28192,12768,12800⟩) (.node (.single ⟨28192,28224,12736,12768⟩) (.single ⟨28192,28224,12768,12800⟩)))) (.node (.node (.single ⟨28224,28288,12672,12736⟩) (.node (.single ⟨28224,28288,12736,12800⟩) (.single ⟨28288,28416,12544,12672⟩))) (.node (.node (.single ⟨28288,28352,12672,12736⟩) (.single ⟨28288,28352,12736,12800⟩)) (.node (.single ⟨28352,28416,12672,12736⟩) (.single ⟨28352,28416,12736,12800⟩)))))))
def output87 : Fin 52 → GridBox := outputData87.get
def coverData87 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData87 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover87 (i : Fin 52) : Fin 52 := ⟨coverData87.get i % 52, Nat.mod_lt _ (by decide)⟩
def source87 (i : Fin 52) : Fin 52 := ⟨sourceData87.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree87 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 (.cutY 19968 .empty (.cutX 4352 .empty (.cutY 20224 (.cutX 4480 (.cutY 20096 (.cutX 4416 (.cutY 20032 .full .full) (.cutY 20032 .full .full)) .full) (.cutY 20096 (.cutX 4544 (.cutY 20032 .full .full) (.cutY 20032 (.cutX 4576 (.cutY 20000 .full .full) (.cutY 20000 .full .full)) .full)) .full)) .empty))) .empty)) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 .empty (.cutX 12544 .empty (.cutY 28416 (.cutX 12672 (.cutY 28288 .full .full) (.cutY 28288 (.cutX 12736 (.cutY 28224 .full .full) (.cutY 28224 (.cutX 12768 (.cutY 28192 .full .full) (.cutY 28192 .full .full)) .full)) (.cutX 12736 (.cutY 28352 .full .full) (.cutY 28352 .full .full)))) .empty))) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 (.cutX 20224 (.cutY 4352 .empty (.cutX 20096 (.cutY 4480 (.cutX 20032 (.cutY 4416 .full .full) (.cutY 4416 .full .full)) (.cutX 20032 (.cutY 4544 .full (.cutX 20000 (.cutY 4576 .full .full) (.cutY 4576 .full .full))) (.cutY 4544 .full .full))) (.cutY 4480 .full .full))) .empty) .empty)) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 .empty (.cutY 12800 (.cutX 28416 (.cutY 12544 .empty (.cutX 28288 (.cutY 12672 .full (.cutX 28224 (.cutY 12736 .full (.cutX 28192 (.cutY 12768 .full .full) (.cutY 12768 .full .full))) (.cutY 12736 .full .full))) (.cutY 12672 .full (.cutX 28352 (.cutY 12736 .full .full) (.cutY 12736 .full .full))))) .empty) .empty)) .empty)) .empty))) .empty))) .empty))

theorem metadata87 : 0<157738472 ∧ 17<128 ∧ 78<128 ∧ 1<4 ∧
    6125/4160=1 ∧ 6125%4160=1965 ∧ ∀ i, (leaves87 i).Valid 8 := by
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

noncomputable def phaseMass87 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw87 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass87_eq : phaseMass87 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass87
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw87 output87 cover87 source87
    (gridTreeUnionCheck_sound 32768 raw87 output87 cover87 source87 tree87 checked87)
    _ (by norm_num) _, areaUnits87]
  norm_num

-- Frozen phase 6084, atom 1145, type 0, source (9,74).
def leavesData88 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves88 : Fin 4 → DyadicLeaf := leavesData88.get
def raw88 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 9 74 leaves88 i
def outputData88 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨2304,2432,18944,19072⟩) (.single ⟨2304,2432,19072,19200⟩)) (.node (.single ⟨2432,2560,18944,19072⟩) (.single ⟨2432,2560,19072,19200⟩))) (.node (.node (.single ⟨13568,13696,30208,30336⟩) (.single ⟨13568,13696,30336,30464⟩)) (.node (.single ⟨13696,13824,30208,30336⟩) (.single ⟨13696,13824,30336,30464⟩)))) (.node (.node (.node (.single ⟨18944,19072,2304,2432⟩) (.single ⟨18944,19072,2432,2560⟩)) (.node (.single ⟨19072,19200,2304,2432⟩) (.single ⟨19072,19200,2432,2560⟩))) (.node (.node (.single ⟨30208,30336,13568,13696⟩) (.single ⟨30208,30336,13696,13824⟩)) (.node (.single ⟨30336,30464,13568,13696⟩) (.single ⟨30336,30464,13696,13824⟩)))))
def output88 : Fin 16 → GridBox := outputData88.get
def coverData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData88 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover88 (i : Fin 16) : Fin 16 := ⟨coverData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def source88 (i : Fin 16) : Fin 16 := ⟨sourceData88.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree88 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 (.cutY 18944 .empty (.cutX 2304 .empty (.cutY 19200 (.cutX 2432 (.cutY 19072 .full .full) (.cutY 19072 .full .full)) .empty))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 (.cutY 30208 .empty (.cutX 13568 .empty (.cutY 30464 (.cutX 13696 (.cutY 30336 .full .full) (.cutY 30336 .full .full)) .empty))) .empty))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 .empty (.cutY 2560 (.cutX 19200 (.cutY 2304 .empty (.cutX 19072 (.cutY 2432 .full .full) (.cutY 2432 .full .full))) .empty) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 .empty (.cutY 13824 (.cutX 30464 (.cutY 13568 .empty (.cutX 30336 (.cutY 13696 .full .full) (.cutY 13696 .full .full))) .empty) .empty)))) .empty) .empty))))) .empty))

theorem metadata88 : 0<48363413 ∧ 9<128 ∧ 74<128 ∧ 0<4 ∧
    1145/4160=0 ∧ 1145%4160=1145 ∧ ∀ i, (leaves88 i).Valid 8 := by
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

noncomputable def phaseMass88 : ℝ := singlePhaseMass (48363413/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw88 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass88_eq : phaseMass88 = (48363413/1638400000000 : ℝ) := by
  unfold phaseMass88
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw88 output88 cover88 source88
    (gridTreeUnionCheck_sound 32768 raw88 output88 cover88 source88 tree88 checked88)
    _ (by norm_num) _, areaUnits88]
  norm_num

-- Frozen phase 6085, atom 5520, type 1, source (11,73).
def leavesData89 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves89 : Fin 7 → DyadicLeaf := leavesData89.get
def raw89 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 11 73 leaves89 i
def outputData89 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨2816,2944,18688,18816⟩) (.node (.single ⟨2816,2944,18816,18944⟩) (.single ⟨2944,3008,18688,18752⟩))) (.node (.node (.single ⟨2944,3008,18752,18816⟩) (.single ⟨3008,3072,18688,18752⟩)) (.node (.single ⟨3008,3072,18752,18816⟩) (.single ⟨2944,3072,18816,18944⟩)))) (.node (.node (.single ⟨13824,13952,29696,29824⟩) (.node (.single ⟨13824,13952,29824,29952⟩) (.single ⟨13952,14016,29696,29760⟩))) (.node (.node (.single ⟨13952,14016,29760,29824⟩) (.single ⟨14016,14080,29696,29760⟩)) (.node (.single ⟨14016,14080,29760,29824⟩) (.single ⟨13952,14080,29824,29952⟩))))) (.node (.node (.node (.single ⟨18688,18816,2816,2944⟩) (.node (.single ⟨18688,18752,2944,3008⟩) (.single ⟨18688,18752,3008,3072⟩))) (.node (.node (.single ⟨18752,18816,2944,3008⟩) (.single ⟨18752,18816,3008,3072⟩)) (.node (.single ⟨18816,18944,2816,2944⟩) (.single ⟨18816,18944,2944,3072⟩)))) (.node (.node (.single ⟨29696,29824,13824,13952⟩) (.node (.single ⟨29696,29760,13952,14016⟩) (.single ⟨29696,29760,14016,14080⟩))) (.node (.node (.single ⟨29760,29824,13952,14016⟩) (.single ⟨29760,29824,14016,14080⟩)) (.node (.single ⟨29824,29952,13824,13952⟩) (.single ⟨29824,29952,13952,14080⟩))))))
def output89 : Fin 28 → GridBox := outputData89.get
def coverData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData89 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover89 (i : Fin 28) : Fin 28 := ⟨coverData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def source89 (i : Fin 28) : Fin 28 := ⟨sourceData89.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree89 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 .empty (.cutY 18432 .empty (.cutX 3072 (.cutY 19456 (.cutX 2560 .empty (.cutY 18944 (.cutX 2816 .empty (.cutY 18688 .empty (.cutX 2944 (.cutY 18816 .full .full) (.cutY 18816 (.cutX 3008 (.cutY 18752 .full .full) (.cutY 18752 .full .full)) .full)))) .empty)) .empty) .empty))) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 (.cutY 30720 (.cutX 13312 .empty (.cutY 29696 .empty (.cutX 13824 .empty (.cutY 30208 (.cutX 14080 (.cutY 29952 (.cutX 13952 (.cutY 29824 .full .full) (.cutY 29824 (.cutX 14016 (.cutY 29760 .full .full) (.cutY 29760 .full .full)) .full)) .empty) .empty) .empty)))) .empty) .empty)))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 .empty (.cutY 2048 .empty (.cutX 19456 (.cutY 3072 (.cutX 18944 (.cutY 2560 .empty (.cutX 18688 .empty (.cutY 2816 .empty (.cutX 18816 (.cutY 2944 .full (.cutX 18752 (.cutY 3008 .full .full) (.cutY 3008 .full .full))) (.cutY 2944 .full .full))))) .empty) .empty) .empty))) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 (.cutY 14336 (.cutX 29696 .empty (.cutY 13312 .empty (.cutX 30208 (.cutY 13824 .empty (.cutX 29952 (.cutY 14080 (.cutX 29824 (.cutY 13952 .full (.cutX 29760 (.cutY 14016 .full .full) (.cutY 14016 .full .full))) (.cutY 13952 .full .full)) .empty) .empty)) .empty))) .empty) .empty))))) .empty))

theorem metadata89 : 0<94387549 ∧ 11<128 ∧ 73<128 ∧ 1<4 ∧
    5520/4160=1 ∧ 5520%4160=1360 ∧ ∀ i, (leaves89 i).Valid 8 := by
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

noncomputable def phaseMass89 : ℝ := singlePhaseMass (94387549/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw89 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass89_eq : phaseMass89 = (94387549/1638400000000 : ℝ) := by
  unfold phaseMass89
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw89 output89 cover89 source89
    (gridTreeUnionCheck_sound 32768 raw89 output89 cover89 source89 tree89 checked89)
    _ (by norm_num) _, areaUnits89]
  norm_num

-- Frozen phase 6086, atom 198, type 0, source (1,71).
def leavesData90 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves90 : Fin 7 → DyadicLeaf := leavesData90.get
def raw90 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 1 71 leaves90 i
def outputData90 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨256,384,18176,18304⟩) (.node (.single ⟨256,384,18304,18432⟩) (.single ⟨384,448,18176,18240⟩))) (.node (.node (.single ⟨384,448,18240,18304⟩) (.single ⟨448,512,18176,18240⟩)) (.node (.single ⟨448,512,18240,18304⟩) (.single ⟨384,512,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,32256,32384⟩) (.node (.single ⟨14336,14464,32384,32512⟩) (.single ⟨14464,14528,32256,32320⟩))) (.node (.node (.single ⟨14464,14528,32320,32384⟩) (.single ⟨14528,14592,32256,32320⟩)) (.node (.single ⟨14528,14592,32320,32384⟩) (.single ⟨14464,14592,32384,32512⟩))))) (.node (.node (.node (.single ⟨18176,18304,256,384⟩) (.node (.single ⟨18176,18240,384,448⟩) (.single ⟨18176,18240,448,512⟩))) (.node (.node (.single ⟨18240,18304,384,448⟩) (.single ⟨18240,18304,448,512⟩)) (.node (.single ⟨18304,18432,256,384⟩) (.single ⟨18304,18432,384,512⟩)))) (.node (.node (.single ⟨32256,32384,14336,14464⟩) (.node (.single ⟨32256,32320,14464,14528⟩) (.single ⟨32256,32320,14528,14592⟩))) (.node (.node (.single ⟨32320,32384,14464,14528⟩) (.single ⟨32320,32384,14528,14592⟩)) (.node (.single ⟨32384,32512,14336,14464⟩) (.single ⟨32384,32512,14464,14592⟩))))))
def output90 : Fin 28 → GridBox := outputData90.get
def coverData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData90 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover90 (i : Fin 28) : Fin 28 := ⟨coverData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def source90 (i : Fin 28) : Fin 28 := ⟨sourceData90.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree90 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 .empty (.cutY 18176 .empty (.cutX 384 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 448 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))))) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 (.cutY 32512 (.cutX 14464 (.cutY 32384 .full .full) (.cutY 32384 (.cutX 14528 (.cutY 32320 .full .full) (.cutY 32320 .full .full)) .full)) .empty) .empty)) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 .empty (.cutY 256 .empty (.cutX 18304 (.cutY 384 .full (.cutX 18240 (.cutY 448 .full .full) (.cutY 448 .full .full))) (.cutY 384 .full .full)))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 (.cutY 14592 (.cutX 32384 (.cutY 14464 .full (.cutX 32320 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty) .empty) .empty)) .empty)))))))) .empty))

theorem metadata90 : 0<114037843 ∧ 1<128 ∧ 71<128 ∧ 0<4 ∧
    198/4160=0 ∧ 198%4160=198 ∧ ∀ i, (leaves90 i).Valid 8 := by
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

noncomputable def phaseMass90 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw90 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass90_eq : phaseMass90 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass90
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw90 output90 cover90 source90
    (gridTreeUnionCheck_sound 32768 raw90 output90 cover90 source90 tree90 checked90)
    _ (by norm_num) _, areaUnits90]
  norm_num

-- Frozen phase 6087, atom 71, type 0, source (0,71).
def leavesData91 : FiniteInputTree DyadicLeaf 4 := (.node (.node (.single ⟨1,0,0⟩) (.single ⟨1,0,1⟩)) (.node (.single ⟨1,1,0⟩) (.single ⟨1,1,1⟩)))
def leaves91 : Fin 4 → DyadicLeaf := leavesData91.get
def raw91 (i : Fin 16) : GridBox := phaseImageBoxes 32768 8 0 71 leaves91 i
def outputData91 : FiniteInputTree GridBox 16 := (.node (.node (.node (.node (.single ⟨0,128,18176,18304⟩) (.single ⟨0,128,18304,18432⟩)) (.node (.single ⟨128,256,18176,18304⟩) (.single ⟨128,256,18304,18432⟩))) (.node (.node (.single ⟨14336,14464,32512,32640⟩) (.single ⟨14336,14464,32640,32768⟩)) (.node (.single ⟨14464,14592,32512,32640⟩) (.single ⟨14464,14592,32640,32768⟩)))) (.node (.node (.node (.single ⟨18176,18304,0,128⟩) (.single ⟨18176,18304,128,256⟩)) (.node (.single ⟨18304,18432,0,128⟩) (.single ⟨18304,18432,128,256⟩))) (.node (.node (.single ⟨32512,32640,14336,14464⟩) (.single ⟨32512,32640,14464,14592⟩)) (.node (.single ⟨32640,32768,14336,14464⟩) (.single ⟨32640,32768,14464,14592⟩)))))
def output91 : Fin 16 → GridBox := outputData91.get
def coverData91 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 8)) (.node (.single 15) (.single 7))) (.node (.node (.single 1) (.single 10)) (.node (.single 14) (.single 5)))) (.node (.node (.node (.single 2) (.single 9)) (.node (.single 13) (.single 6))) (.node (.node (.single 3) (.single 11)) (.node (.single 12) (.single 4)))))
def sourceData91 : FiniteInputTree ℕ 16 := (.node (.node (.node (.node (.single 0) (.single 4)) (.node (.single 8) (.single 12))) (.node (.node (.single 15) (.single 7)) (.node (.single 11) (.single 3)))) (.node (.node (.node (.single 1) (.single 9)) (.node (.single 5) (.single 13))) (.node (.node (.single 14) (.single 10)) (.node (.single 6) (.single 2)))))
def cover91 (i : Fin 16) : Fin 16 := ⟨coverData91.get i % 16, Nat.mod_lt _ (by decide)⟩
def source91 (i : Fin 16) : Fin 16 := ⟨sourceData91.get i % 16, Nat.mod_lt _ (by decide)⟩
def tree91 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 (.cutY 17920 .empty (.cutX 256 (.cutY 18176 .empty (.cutX 128 (.cutY 18304 .full .full) (.cutY 18304 .full .full))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 .empty (.cutX 14592 (.cutY 32512 .empty (.cutX 14464 (.cutY 32640 .full .full) (.cutY 32640 .full .full))) .empty)) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 (.cutX 18176 .empty (.cutY 256 (.cutX 18304 (.cutY 128 .full .full) (.cutY 128 .full .full)) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 .empty (.cutY 14848 (.cutX 32512 .empty (.cutY 14592 (.cutX 32640 (.cutY 14464 .full .full) (.cutY 14464 .full .full)) .empty)) .empty)) .empty)))))))) .empty))

theorem metadata91 : 0<114037843 ∧ 0<128 ∧ 71<128 ∧ 0<4 ∧
    71/4160=0 ∧ 71%4160=71 ∧ ∀ i, (leaves91 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData91).mp
    (by decide +kernel)

theorem sourceChecked91_0 : ∀ i : Fin 16,
    (fun i => output91 i = raw91 (source91 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem sourceChecked91 : ∀ i : Fin 16, (fun i => output91 i = raw91 (source91 i)) i :=
  forallFin_of_zero_offset (fun i => output91 i = raw91 (source91 i)) sourceChecked91_0

theorem coverChecked91_0 : ∀ i : Fin 16,
    (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) (finOffset 16 0 16 (by decide) i) := by decide +kernel

theorem coverChecked91 : ∀ i : Fin 16, (fun i => (output91 (cover91 i)).ContainsBox (raw91 i)) i :=
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

noncomputable def phaseMass91 : ℝ := singlePhaseMass (114037843/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw91 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass91_eq : phaseMass91 = (114037843/1638400000000 : ℝ) := by
  unfold phaseMass91
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw91 output91 cover91 source91
    (gridTreeUnionCheck_sound 32768 raw91 output91 cover91 source91 tree91 checked91)
    _ (by norm_num) _, areaUnits91]
  norm_num

-- Frozen phase 6088, atom 4727, type 1, source (4,71).
def leavesData92 : FiniteInputTree DyadicLeaf 7 := (.node (.node (.single ⟨1,0,0⟩) (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩))) (.node (.node (.single ⟨2,2,0⟩) (.single ⟨2,2,1⟩)) (.node (.single ⟨2,3,0⟩) (.single ⟨2,3,1⟩))))
def leaves92 : Fin 7 → DyadicLeaf := leavesData92.get
def raw92 (i : Fin 28) : GridBox := phaseImageBoxes 32768 8 4 71 leaves92 i
def outputData92 : FiniteInputTree GridBox 28 := (.node (.node (.node (.node (.single ⟨1024,1152,18176,18304⟩) (.node (.single ⟨1024,1152,18304,18432⟩) (.single ⟨1152,1216,18176,18240⟩))) (.node (.node (.single ⟨1152,1216,18240,18304⟩) (.single ⟨1216,1280,18176,18240⟩)) (.node (.single ⟨1216,1280,18240,18304⟩) (.single ⟨1152,1280,18304,18432⟩)))) (.node (.node (.single ⟨14336,14464,31488,31616⟩) (.node (.single ⟨14336,14464,31616,31744⟩) (.single ⟨14464,14528,31488,31552⟩))) (.node (.node (.single ⟨14464,14528,31552,31616⟩) (.single ⟨14528,14592,31488,31552⟩)) (.node (.single ⟨14528,14592,31552,31616⟩) (.single ⟨14464,14592,31616,31744⟩))))) (.node (.node (.node (.single ⟨18176,18304,1024,1152⟩) (.node (.single ⟨18176,18240,1152,1216⟩) (.single ⟨18176,18240,1216,1280⟩))) (.node (.node (.single ⟨18240,18304,1152,1216⟩) (.single ⟨18240,18304,1216,1280⟩)) (.node (.single ⟨18304,18432,1024,1152⟩) (.single ⟨18304,18432,1152,1280⟩)))) (.node (.node (.single ⟨31488,31616,14336,14464⟩) (.node (.single ⟨31488,31552,14464,14528⟩) (.single ⟨31488,31552,14528,14592⟩))) (.node (.node (.single ⟨31552,31616,14464,14528⟩) (.single ⟨31552,31616,14528,14592⟩)) (.node (.single ⟨31616,31744,14336,14464⟩) (.single ⟨31616,31744,14464,14592⟩))))))
def output92 : Fin 28 → GridBox := outputData92.get
def coverData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 14) (.single 27))) (.node (.node (.single 13) (.single 1)) (.node (.single 19) (.single 26)))) (.node (.node (.single 8) (.node (.single 6) (.single 20))) (.node (.node (.single 21) (.single 7)) (.node (.single 2) (.single 15))))) (.node (.node (.node (.single 25) (.node (.single 12) (.single 3))) (.node (.node (.single 17) (.single 24)) (.node (.single 10) (.single 4)))) (.node (.node (.single 16) (.node (.single 23) (.single 11))) (.node (.node (.single 5) (.single 18)) (.node (.single 22) (.single 9))))))
def sourceData92 : FiniteInputTree ℕ 28 := (.node (.node (.node (.node (.single 0) (.node (.single 4) (.single 12))) (.node (.node (.single 16) (.single 20)) (.node (.single 24) (.single 8)))) (.node (.node (.single 11) (.node (.single 7) (.single 27))) (.node (.node (.single 19) (.single 23)) (.node (.single 15) (.single 3))))) (.node (.node (.node (.single 1) (.node (.single 13) (.single 21))) (.node (.node (.single 17) (.single 25)) (.node (.single 5) (.single 9)))) (.node (.node (.single 10) (.node (.single 26) (.single 22))) (.node (.node (.single 18) (.single 14)) (.node (.single 6) (.single 2))))))
def cover92 (i : Fin 28) : Fin 28 := ⟨coverData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def source92 (i : Fin 28) : Fin 28 := ⟨sourceData92.get i % 28, Nat.mod_lt _ (by decide)⟩
def tree92 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 .empty (.cutY 17408 .empty (.cutX 1536 (.cutY 17920 .empty (.cutX 1280 (.cutY 18176 .empty (.cutX 1152 (.cutY 18304 .full .full) (.cutY 18304 (.cutX 1216 (.cutY 18240 .full .full) (.cutY 18240 .full .full)) .full))) .empty)) .empty))) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 (.cutX 14848 (.cutY 31232 .empty (.cutX 14592 (.cutY 31488 .empty (.cutX 14464 (.cutY 31616 .full .full) (.cutY 31616 (.cutX 14528 (.cutY 31552 .full .full) (.cutY 31552 .full .full)) .full))) .empty)) .empty) .empty) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 .empty (.cutX 17920 .empty (.cutY 1536 (.cutX 18176 .empty (.cutY 1280 (.cutX 18304 (.cutY 1152 .full (.cutX 18240 (.cutY 1216 .full .full) (.cutY 1216 .full .full))) (.cutY 1152 .full .full)) .empty)) .empty)))) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 (.cutY 15360 (.cutX 31232 .empty (.cutY 14848 (.cutX 31488 .empty (.cutY 14592 (.cutX 31616 (.cutY 14464 .full (.cutX 31552 (.cutY 14528 .full .full) (.cutY 14528 .full .full))) (.cutY 14464 .full .full)) .empty)) .empty)) .empty) .empty))))))) .empty))

theorem metadata92 : 0<202148459 ∧ 4<128 ∧ 71<128 ∧ 1<4 ∧
    4727/4160=1 ∧ 4727%4160=567 ∧ ∀ i, (leaves92 i).Valid 8 := by
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

noncomputable def phaseMass92 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw92 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass92_eq : phaseMass92 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass92
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw92 output92 cover92 source92
    (gridTreeUnionCheck_sound 32768 raw92 output92 cover92 source92 tree92 checked92)
    _ (by norm_num) _, areaUnits92]
  norm_num

-- Frozen phase 6089, atom 4482, type 1, source (2,70).
def leavesData93 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,0,0⟩))) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))) (.node (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves93 : Fin 13 → DyadicLeaf := leavesData93.get
def raw93 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 2 70 leaves93 i
def outputData93 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨512,576,17920,17984⟩) (.node (.single ⟨512,576,17984,18048⟩) (.single ⟨576,640,17920,17984⟩))) (.node (.single ⟨576,640,17984,18048⟩) (.node (.single ⟨512,640,18048,18176⟩) (.single ⟨640,704,17920,17984⟩)))) (.node (.node (.single ⟨640,704,17984,18048⟩) (.node (.single ⟨704,736,17920,17952⟩) (.single ⟨704,736,17952,17984⟩))) (.node (.node (.single ⟨736,768,17920,17952⟩) (.single ⟨736,768,17952,17984⟩)) (.node (.single ⟨704,768,17984,18048⟩) (.single ⟨640,768,18048,18176⟩))))) (.node (.node (.node (.single ⟨14592,14720,32000,32128⟩) (.node (.single ⟨14592,14720,32128,32256⟩) (.single ⟨14720,14784,32000,32064⟩))) (.node (.single ⟨14720,14784,32064,32128⟩) (.node (.single ⟨14784,14816,32000,32032⟩) (.single ⟨14784,14816,32032,32064⟩)))) (.node (.node (.single ⟨14816,14848,32000,32032⟩) (.node (.single ⟨14816,14848,32032,32064⟩) (.single ⟨14784,14848,32064,32128⟩))) (.node (.node (.single ⟨14720,14784,32128,32192⟩) (.single ⟨14720,14784,32192,32256⟩)) (.node (.single ⟨14784,14848,32128,32192⟩) (.single ⟨14784,14848,32192,32256⟩)))))) (.node (.node (.node (.node (.single ⟨17920,17984,512,576⟩) (.node (.single ⟨17920,17984,576,640⟩) (.single ⟨17984,18048,512,576⟩))) (.node (.single ⟨17984,18048,576,640⟩) (.node (.single ⟨17920,17984,640,704⟩) (.single ⟨17920,17952,704,736⟩)))) (.node (.node (.single ⟨17920,17952,736,768⟩) (.node (.single ⟨17952,17984,704,736⟩) (.single ⟨17952,17984,736,768⟩))) (.node (.node (.single ⟨17984,18048,640,704⟩) (.single ⟨17984,18048,704,768⟩)) (.node (.single ⟨18048,18176,512,640⟩) (.single ⟨18048,18176,640,768⟩))))) (.node (.node (.node (.single ⟨32000,32128,14592,14720⟩) (.node (.single ⟨32000,32064,14720,14784⟩) (.single ⟨32000,32032,14784,14816⟩))) (.node (.single ⟨32000,32032,14816,14848⟩) (.node (.single ⟨32032,32064,14784,14816⟩) (.single ⟨32032,32064,14816,14848⟩)))) (.node (.node (.single ⟨32064,32128,14720,14784⟩) (.node (.single ⟨32064,32128,14784,14848⟩) (.single ⟨32128,32256,14592,14720⟩))) (.node (.node (.single ⟨32128,32192,14720,14784⟩) (.single ⟨32128,32192,14784,14848⟩)) (.node (.single ⟨32192,32256,14720,14784⟩) (.single ⟨32192,32256,14784,14848⟩)))))))
def output93 : Fin 52 → GridBox := outputData93.get
def coverData93 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 0))) (.node (.node (.single 26) (.single 51)) (.node (.single 25) (.single 1))))) (.node (.node (.node (.single 28) (.node (.single 50) (.single 23))) (.node (.single 2) (.node (.single 27) (.single 49)))) (.node (.node (.single 24) (.node (.single 3) (.single 29))) (.node (.node (.single 48) (.single 22)) (.node (.single 5) (.single 30)))))) (.node (.node (.node (.node (.single 46) (.node (.single 21) (.single 6))) (.node (.single 35) (.node (.single 45) (.single 16)))) (.node (.node (.single 11) (.node (.single 36) (.single 40))) (.node (.node (.single 15) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData93 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 8) (.node (.single 12) (.single 16))) (.node (.single 20) (.node (.single 0) (.single 24)))) (.node (.node (.single 28) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 32) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 35))) (.node (.single 31) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 27))) (.node (.node (.single 23) (.single 15)) (.node (.single 19) (.single 11)))))) (.node (.node (.node (.node (.single 9) (.node (.single 17) (.single 13))) (.node (.single 21) (.node (.single 25) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 29) (.single 33)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 34) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 30) (.node (.single 26) (.single 2))) (.node (.node (.single 22) (.single 18)) (.node (.single 14) (.single 10)))))))
def cover93 (i : Fin 52) : Fin 52 := ⟨coverData93.get i % 52, Nat.mod_lt _ (by decide)⟩
def source93 (i : Fin 52) : Fin 52 := ⟨sourceData93.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree93 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 (.cutY 20480 (.cutX 2048 (.cutY 18432 (.cutX 1024 (.cutY 17408 .empty (.cutX 512 .empty (.cutY 17920 .empty (.cutX 768 (.cutY 18176 (.cutX 640 (.cutY 18048 (.cutX 576 (.cutY 17984 .full .full) (.cutY 17984 .full .full)) .full) (.cutY 18048 (.cutX 704 (.cutY 17984 .full .full) (.cutY 17984 (.cutX 736 (.cutY 17952 .full .full) (.cutY 17952 .full .full)) .full)) .full)) .empty) .empty)))) .empty) .empty) .empty) .empty) .empty) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 .empty (.cutX 14336 .empty (.cutY 30720 .empty (.cutX 15360 (.cutY 31744 .empty (.cutX 14848 (.cutY 32256 (.cutX 14592 .empty (.cutY 32000 .empty (.cutX 14720 (.cutY 32128 .full .full) (.cutY 32128 (.cutX 14784 (.cutY 32064 .full .full) (.cutY 32064 (.cutX 14816 (.cutY 32032 .full .full) (.cutY 32032 .full .full)) .full)) (.cutX 14784 (.cutY 32192 .full .full) (.cutY 32192 .full .full)))))) .empty) .empty)) .empty)))))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 (.cutX 18432 (.cutY 2048 (.cutX 17408 .empty (.cutY 1024 (.cutX 17920 .empty (.cutY 512 .empty (.cutX 18176 (.cutY 768 (.cutX 18048 (.cutY 640 (.cutX 17984 (.cutY 576 .full .full) (.cutY 576 .full .full)) (.cutX 17984 (.cutY 704 .full (.cutX 17952 (.cutY 736 .full .full) (.cutY 736 .full .full))) (.cutY 704 .full .full))) (.cutY 640 .full .full)) .empty) .empty))) .empty)) .empty) .empty) .empty) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 .empty (.cutY 12288 .empty (.cutX 30720 .empty (.cutY 14336 .empty (.cutX 31744 .empty (.cutY 15360 (.cutX 32256 (.cutY 14848 (.cutX 32000 .empty (.cutY 14592 .empty (.cutX 32128 (.cutY 14720 .full (.cutX 32064 (.cutY 14784 .full (.cutX 32032 (.cutY 14816 .full .full) (.cutY 14816 .full .full))) (.cutY 14784 .full .full))) (.cutY 14720 .full (.cutX 32192 (.cutY 14784 .full .full) (.cutY 14784 .full .full)))))) .empty) .empty) .empty)))))))) .empty))

theorem metadata93 : 0<202148459 ∧ 2<128 ∧ 70<128 ∧ 1<4 ∧
    4482/4160=1 ∧ 4482%4160=322 ∧ ∀ i, (leaves93 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData93).mp
    (by decide +kernel)

theorem sourceChecked93_0 : ∀ i : Fin 52,
    (fun i => output93 i = raw93 (source93 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked93 : ∀ i : Fin 52, (fun i => output93 i = raw93 (source93 i)) i :=
  forallFin_of_zero_offset (fun i => output93 i = raw93 (source93 i)) sourceChecked93_0

theorem coverChecked93_0 : ∀ i : Fin 52,
    (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked93 : ∀ i : Fin 52, (fun i => (output93 (cover93 i)).ContainsBox (raw93 i)) i :=
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

noncomputable def phaseMass93 : ℝ := singlePhaseMass (202148459/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw93 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass93_eq : phaseMass93 = (202148459/1638400000000 : ℝ) := by
  unfold phaseMass93
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw93 output93 cover93 source93
    (gridTreeUnionCheck_sound 32768 raw93 output93 cover93 source93 tree93 checked93)
    _ (by norm_num) _, areaUnits93]
  norm_num

-- Frozen phase 6090, atom 2815, type 0, source (27,88).
def leavesData94 : FiniteInputTree DyadicLeaf 10 := (.node (.node (.node (.single ⟨1,0,1⟩) (.single ⟨1,1,1⟩)) (.node (.single ⟨2,2,0⟩) (.node (.single ⟨2,2,1⟩) (.single ⟨2,3,0⟩)))) (.node (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)) (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩)))))
def leaves94 : Fin 10 → DyadicLeaf := leavesData94.get
def raw94 (i : Fin 40) : GridBox := phaseImageBoxes 32768 8 27 88 leaves94 i
def outputData94 : FiniteInputTree GridBox 40 := (.node (.node (.node (.node (.node (.single ⟨6912,6976,22528,22592⟩) (.single ⟨6912,6976,22592,22656⟩)) (.node (.single ⟨6976,7040,22528,22592⟩) (.node (.single ⟨6976,7040,22592,22656⟩) (.single ⟨6912,7040,22656,22784⟩)))) (.node (.node (.single ⟨7040,7104,22528,22592⟩) (.single ⟨7040,7104,22592,22656⟩)) (.node (.single ⟨7104,7168,22528,22592⟩) (.node (.single ⟨7104,7168,22592,22656⟩) (.single ⟨7040,7168,22656,22784⟩))))) (.node (.node (.node (.single ⟨9984,10112,25600,25728⟩) (.single ⟨9984,10112,25728,25856⟩)) (.node (.single ⟨10112,10176,25600,25664⟩) (.node (.single ⟨10112,10176,25664,25728⟩) (.single ⟨10176,10240,25600,25664⟩)))) (.node (.node (.single ⟨10176,10240,25664,25728⟩) (.single ⟨10112,10176,25728,25792⟩)) (.node (.single ⟨10112,10176,25792,25856⟩) (.node (.single ⟨10176,10240,25728,25792⟩) (.single ⟨10176,10240,25792,25856⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22592,6912,6976⟩) (.single ⟨22528,22592,6976,7040⟩)) (.node (.single ⟨22592,22656,6912,6976⟩) (.node (.single ⟨22592,22656,6976,7040⟩) (.single ⟨22528,22592,7040,7104⟩)))) (.node (.node (.single ⟨22528,22592,7104,7168⟩) (.single ⟨22592,22656,7040,7104⟩)) (.node (.single ⟨22592,22656,7104,7168⟩) (.node (.single ⟨22656,22784,6912,7040⟩) (.single ⟨22656,22784,7040,7168⟩))))) (.node (.node (.node (.single ⟨25600,25728,9984,10112⟩) (.single ⟨25600,25664,10112,10176⟩)) (.node (.single ⟨25600,25664,10176,10240⟩) (.node (.single ⟨25664,25728,10112,10176⟩) (.single ⟨25664,25728,10176,10240⟩)))) (.node (.node (.single ⟨25728,25856,9984,10112⟩) (.single ⟨25728,25792,10112,10176⟩)) (.node (.single ⟨25728,25792,10176,10240⟩) (.node (.single ⟨25792,25856,10112,10176⟩) (.single ⟨25792,25856,10176,10240⟩)))))))
def output94 : Fin 40 → GridBox := outputData94.get
def coverData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 4) (.single 28)) (.node (.single 35) (.node (.single 11) (.single 9)))) (.node (.node (.single 29) (.single 30)) (.node (.single 10) (.node (.single 5) (.single 24))))) (.node (.node (.node (.single 34) (.single 15)) (.node (.single 6) (.node (.single 26) (.single 33)))) (.node (.node (.single 13) (.single 7)) (.node (.single 25) (.node (.single 32) (.single 14)))))) (.node (.node (.node (.node (.single 8) (.single 27)) (.node (.single 31) (.node (.single 12) (.single 0)))) (.node (.node (.single 20) (.single 39)) (.node (.single 19) (.node (.single 1) (.single 22))))) (.node (.node (.node (.single 38) (.single 17)) (.node (.single 2) (.node (.single 21) (.single 37)))) (.node (.node (.single 18) (.single 3)) (.node (.single 23) (.node (.single 36) (.single 16)))))))
def sourceData94 : FiniteInputTree ℕ 40 := (.node (.node (.node (.node (.node (.single 24) (.single 28)) (.node (.single 32) (.node (.single 36) (.single 0)))) (.node (.node (.single 8) (.single 12)) (.node (.single 16) (.node (.single 20) (.single 4))))) (.node (.node (.node (.single 7) (.single 3)) (.node (.single 23) (.node (.single 15) (.single 19)))) (.node (.node (.single 11) (.single 39)) (.node (.single 31) (.node (.single 35) (.single 27)))))) (.node (.node (.node (.node (.single 25) (.single 33)) (.node (.single 29) (.node (.single 37) (.single 9)))) (.node (.node (.single 17) (.single 13)) (.node (.single 21) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.single 22)) (.node (.single 18) (.node (.single 14) (.single 10)))) (.node (.node (.single 2) (.single 38)) (.node (.single 34) (.node (.single 30) (.single 26)))))))
def cover94 (i : Fin 40) : Fin 40 := ⟨coverData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def source94 (i : Fin 40) : Fin 40 := ⟨sourceData94.get i % 40, Nat.mod_lt _ (by decide)⟩
def tree94 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 (.cutY 23552 (.cutX 6656 .empty (.cutY 23040 (.cutX 6912 .empty (.cutY 22784 (.cutX 7040 (.cutY 22656 (.cutX 6976 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 7104 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full)) .empty)) .empty)) .empty) .empty))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 .empty (.cutX 9728 .empty (.cutY 26112 (.cutX 9984 .empty (.cutY 25856 (.cutX 10112 (.cutY 25728 .full .full) (.cutY 25728 (.cutX 10176 (.cutY 25664 .full .full) (.cutY 25664 .full .full)) (.cutX 10176 (.cutY 25792 .full .full) (.cutY 25792 .full .full)))) .empty)) .empty)))) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 (.cutX 23040 (.cutY 6656 .empty (.cutX 22784 (.cutY 6912 .empty (.cutX 22656 (.cutY 7040 (.cutX 22592 (.cutY 6976 .full .full) (.cutY 6976 .full .full)) (.cutX 22592 (.cutY 7104 .full .full) (.cutY 7104 .full .full))) (.cutY 7040 .full .full))) .empty)) .empty) .empty) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 .empty (.cutY 9216 .empty (.cutX 26112 (.cutY 9728 .empty (.cutX 25856 (.cutY 9984 .empty (.cutX 25728 (.cutY 10112 .full (.cutX 25664 (.cutY 10176 .full .full) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 25792 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty)) .empty))) .empty) .empty) .empty) .empty))) .empty))

theorem metadata94 : 0<145899414 ∧ 27<128 ∧ 88<128 ∧ 0<4 ∧
    2815/4160=0 ∧ 2815%4160=2815 ∧ ∀ i, (leaves94 i).Valid 8 := by
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

noncomputable def phaseMass94 : ℝ := singlePhaseMass (145899414/100000000 : ℝ) (0 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw94 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass94_eq : phaseMass94 = (72949707/819200000000 : ℝ) := by
  unfold phaseMass94
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw94 output94 cover94 source94
    (gridTreeUnionCheck_sound 32768 raw94 output94 cover94 source94 tree94 checked94)
    _ (by norm_num) _, areaUnits94]
  norm_num

-- Frozen phase 6091, atom 7255, type 1, source (31,88).
def leavesData95 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves95 : Fin 13 → DyadicLeaf := leavesData95.get
def raw95 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 31 88 leaves95 i
def outputData95 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨7936,8000,22528,22592⟩) (.node (.single ⟨7936,8000,22592,22656⟩) (.single ⟨8000,8064,22528,22592⟩))) (.node (.single ⟨8000,8064,22592,22656⟩) (.node (.single ⟨7936,8064,22656,22784⟩) (.single ⟨8064,8128,22528,22592⟩)))) (.node (.node (.single ⟨8064,8128,22592,22656⟩) (.node (.single ⟨8128,8160,22528,22560⟩) (.single ⟨8128,8160,22560,22592⟩))) (.node (.node (.single ⟨8160,8192,22528,22560⟩) (.single ⟨8160,8192,22560,22592⟩)) (.node (.single ⟨8128,8192,22592,22656⟩) (.single ⟨8064,8192,22656,22784⟩))))) (.node (.node (.node (.single ⟨9984,10112,24576,24704⟩) (.node (.single ⟨9984,10112,24704,24832⟩) (.single ⟨10112,10176,24576,24640⟩))) (.node (.single ⟨10112,10176,24640,24704⟩) (.node (.single ⟨10176,10208,24576,24608⟩) (.single ⟨10176,10208,24608,24640⟩)))) (.node (.node (.single ⟨10208,10240,24576,24608⟩) (.node (.single ⟨10208,10240,24608,24640⟩) (.single ⟨10176,10240,24640,24704⟩))) (.node (.node (.single ⟨10112,10176,24704,24768⟩) (.single ⟨10112,10176,24768,24832⟩)) (.node (.single ⟨10176,10240,24704,24768⟩) (.single ⟨10176,10240,24768,24832⟩)))))) (.node (.node (.node (.node (.single ⟨22528,22592,7936,8000⟩) (.node (.single ⟨22528,22592,8000,8064⟩) (.single ⟨22592,22656,7936,8000⟩))) (.node (.single ⟨22592,22656,8000,8064⟩) (.node (.single ⟨22528,22592,8064,8128⟩) (.single ⟨22528,22560,8128,8160⟩)))) (.node (.node (.single ⟨22528,22560,8160,8192⟩) (.node (.single ⟨22560,22592,8128,8160⟩) (.single ⟨22560,22592,8160,8192⟩))) (.node (.node (.single ⟨22592,22656,8064,8128⟩) (.single ⟨22592,22656,8128,8192⟩)) (.node (.single ⟨22656,22784,7936,8064⟩) (.single ⟨22656,22784,8064,8192⟩))))) (.node (.node (.node (.single ⟨24576,24704,9984,10112⟩) (.node (.single ⟨24576,24640,10112,10176⟩) (.single ⟨24576,24608,10176,10208⟩))) (.node (.single ⟨24576,24608,10208,10240⟩) (.node (.single ⟨24608,24640,10176,10208⟩) (.single ⟨24608,24640,10208,10240⟩)))) (.node (.node (.single ⟨24640,24704,10112,10176⟩) (.node (.single ⟨24640,24704,10176,10240⟩) (.single ⟨24704,24832,9984,10112⟩))) (.node (.node (.single ⟨24704,24768,10112,10176⟩) (.single ⟨24704,24768,10176,10240⟩)) (.node (.single ⟨24768,24832,10112,10176⟩) (.single ⟨24768,24832,10176,10240⟩)))))))
def output95 : Fin 52 → GridBox := outputData95.get
def coverData95 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData95 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover95 (i : Fin 52) : Fin 52 := ⟨coverData95.get i % 52, Nat.mod_lt _ (by decide)⟩
def source95 (i : Fin 52) : Fin 52 := ⟨sourceData95.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree95 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 .empty (.cutX 7168 .empty (.cutY 23552 (.cutX 7680 .empty (.cutY 23040 (.cutX 7936 .empty (.cutY 22784 (.cutX 8064 (.cutY 22656 (.cutX 8000 (.cutY 22592 .full .full) (.cutY 22592 .full .full)) .full) (.cutY 22656 (.cutX 8128 (.cutY 22592 .full .full) (.cutY 22592 (.cutX 8160 (.cutY 22560 .full .full) (.cutY 22560 .full .full)) .full)) .full)) .empty)) .empty)) .empty)))))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 (.cutY 26624 (.cutX 9216 .empty (.cutY 25600 (.cutX 9728 .empty (.cutY 25088 (.cutX 9984 .empty (.cutY 24832 (.cutX 10112 (.cutY 24704 .full .full) (.cutY 24704 (.cutX 10176 (.cutY 24640 .full .full) (.cutY 24640 (.cutX 10208 (.cutY 24608 .full .full) (.cutY 24608 .full .full)) .full)) (.cutX 10176 (.cutY 24768 .full .full) (.cutY 24768 .full .full)))) .empty)) .empty)) .empty)) .empty) .empty) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 .empty (.cutY 6144 .empty (.cutX 23552 (.cutY 7168 .empty (.cutX 23040 (.cutY 7680 .empty (.cutX 22784 (.cutY 7936 .empty (.cutX 22656 (.cutY 8064 (.cutX 22592 (.cutY 8000 .full .full) (.cutY 8000 .full .full)) (.cutX 22592 (.cutY 8128 .full (.cutX 22560 (.cutY 8160 .full .full) (.cutY 8160 .full .full))) (.cutY 8128 .full .full))) (.cutY 8064 .full .full))) .empty)) .empty)) .empty))))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 (.cutX 25600 (.cutY 9216 .empty (.cutX 25088 (.cutY 9728 .empty (.cutX 24832 (.cutY 9984 .empty (.cutX 24704 (.cutY 10112 .full (.cutX 24640 (.cutY 10176 .full (.cutX 24608 (.cutY 10208 .full .full) (.cutY 10208 .full .full))) (.cutY 10176 .full .full))) (.cutY 10112 .full (.cutX 24768 (.cutY 10176 .full .full) (.cutY 10176 .full .full))))) .empty)) .empty)) .empty) .empty) .empty) .empty) .empty))) .empty))

theorem metadata95 : 0<149239428 ∧ 31<128 ∧ 88<128 ∧ 1<4 ∧
    7255/4160=1 ∧ 7255%4160=3095 ∧ ∀ i, (leaves95 i).Valid 8 := by
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

noncomputable def phaseMass95 : ℝ := singlePhaseMass (149239428/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw95 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass95_eq : phaseMass95 = (37309857/409600000000 : ℝ) := by
  unfold phaseMass95
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw95 output95 cover95 source95
    (gridTreeUnionCheck_sound 32768 raw95 output95 cover95 source95 tree95 checked95)
    _ (by norm_num) _, areaUnits95]
  norm_num

-- Frozen phase 6092, atom 6739, type 1, source (24,83).
def leavesData96 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves96 : Fin 13 → DyadicLeaf := leavesData96.get
def raw96 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 24 83 leaves96 i
def outputData96 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨6144,6208,21248,21312⟩) (.node (.single ⟨6144,6208,21312,21376⟩) (.single ⟨6208,6272,21248,21312⟩))) (.node (.single ⟨6208,6272,21312,21376⟩) (.node (.single ⟨6144,6272,21376,21504⟩) (.single ⟨6272,6336,21248,21312⟩)))) (.node (.node (.single ⟨6272,6336,21312,21376⟩) (.node (.single ⟨6336,6368,21248,21280⟩) (.single ⟨6336,6368,21280,21312⟩))) (.node (.node (.single ⟨6368,6400,21248,21280⟩) (.single ⟨6368,6400,21280,21312⟩)) (.node (.single ⟨6336,6400,21312,21376⟩) (.single ⟨6272,6400,21376,21504⟩))))) (.node (.node (.node (.single ⟨11264,11392,26368,26496⟩) (.node (.single ⟨11264,11392,26496,26624⟩) (.single ⟨11392,11456,26368,26432⟩))) (.node (.single ⟨11392,11456,26432,26496⟩) (.node (.single ⟨11456,11488,26368,26400⟩) (.single ⟨11456,11488,26400,26432⟩)))) (.node (.node (.single ⟨11488,11520,26368,26400⟩) (.node (.single ⟨11488,11520,26400,26432⟩) (.single ⟨11456,11520,26432,26496⟩))) (.node (.node (.single ⟨11392,11456,26496,26560⟩) (.single ⟨11392,11456,26560,26624⟩)) (.node (.single ⟨11456,11520,26496,26560⟩) (.single ⟨11456,11520,26560,26624⟩)))))) (.node (.node (.node (.node (.single ⟨21248,21312,6144,6208⟩) (.node (.single ⟨21248,21312,6208,6272⟩) (.single ⟨21312,21376,6144,6208⟩))) (.node (.single ⟨21312,21376,6208,6272⟩) (.node (.single ⟨21248,21312,6272,6336⟩) (.single ⟨21248,21280,6336,6368⟩)))) (.node (.node (.single ⟨21248,21280,6368,6400⟩) (.node (.single ⟨21280,21312,6336,6368⟩) (.single ⟨21280,21312,6368,6400⟩))) (.node (.node (.single ⟨21312,21376,6272,6336⟩) (.single ⟨21312,21376,6336,6400⟩)) (.node (.single ⟨21376,21504,6144,6272⟩) (.single ⟨21376,21504,6272,6400⟩))))) (.node (.node (.node (.single ⟨26368,26496,11264,11392⟩) (.node (.single ⟨26368,26432,11392,11456⟩) (.single ⟨26368,26400,11456,11488⟩))) (.node (.single ⟨26368,26400,11488,11520⟩) (.node (.single ⟨26400,26432,11456,11488⟩) (.single ⟨26400,26432,11488,11520⟩)))) (.node (.node (.single ⟨26432,26496,11392,11456⟩) (.node (.single ⟨26432,26496,11456,11520⟩) (.single ⟨26496,26624,11264,11392⟩))) (.node (.node (.single ⟨26496,26560,11392,11456⟩) (.single ⟨26496,26560,11456,11520⟩)) (.node (.single ⟨26560,26624,11392,11456⟩) (.single ⟨26560,26624,11456,11520⟩)))))))
def output96 : Fin 52 → GridBox := outputData96.get
def coverData96 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData96 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover96 (i : Fin 52) : Fin 52 := ⟨coverData96.get i % 52, Nat.mod_lt _ (by decide)⟩
def source96 (i : Fin 52) : Fin 52 := ⟨sourceData96.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree96 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 .empty (.cutX 6144 .empty (.cutY 22528 (.cutX 7168 (.cutY 21504 (.cutX 6656 (.cutY 20992 .empty (.cutX 6400 (.cutY 21248 .empty (.cutX 6272 (.cutY 21376 (.cutX 6208 (.cutY 21312 .full .full) (.cutY 21312 .full .full)) .full) (.cutY 21376 (.cutX 6336 (.cutY 21312 .full .full) (.cutY 21312 (.cutX 6368 (.cutY 21280 .full .full) (.cutY 21280 .full .full)) .full)) .full))) .empty)) .empty) .empty) .empty) .empty)))) .empty) (.cutY 24576 .empty (.cutX 12288 (.cutY 28672 (.cutX 10240 .empty (.cutY 26624 (.cutX 11264 .empty (.cutY 25600 .empty (.cutX 11776 (.cutY 26112 .empty (.cutX 11520 (.cutY 26368 .empty (.cutX 11392 (.cutY 26496 .full .full) (.cutY 26496 (.cutX 11456 (.cutY 26432 .full .full) (.cutY 26432 (.cutX 11488 (.cutY 26400 .full .full) (.cutY 26400 .full .full)) .full)) (.cutX 11456 (.cutY 26560 .full .full) (.cutY 26560 .full .full))))) .empty)) .empty))) .empty)) .empty) .empty)))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 .empty (.cutY 4096 .empty (.cutX 22528 (.cutY 6144 .empty (.cutX 21504 (.cutY 7168 (.cutX 20992 .empty (.cutY 6656 (.cutX 21248 .empty (.cutY 6400 (.cutX 21376 (.cutY 6272 (.cutX 21312 (.cutY 6208 .full .full) (.cutY 6208 .full .full)) (.cutX 21312 (.cutY 6336 .full (.cutX 21280 (.cutY 6368 .full .full) (.cutY 6368 .full .full))) (.cutY 6336 .full .full))) (.cutY 6272 .full .full)) .empty)) .empty)) .empty) .empty)) .empty))) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 (.cutX 26624 (.cutY 10240 .empty (.cutX 25600 .empty (.cutY 11264 .empty (.cutX 26112 .empty (.cutY 11776 (.cutX 26368 .empty (.cutY 11520 (.cutX 26496 (.cutY 11392 .full (.cutX 26432 (.cutY 11456 .full (.cutX 26400 (.cutY 11488 .full .full) (.cutY 11488 .full .full))) (.cutY 11456 .full .full))) (.cutY 11392 .full (.cutX 26560 (.cutY 11456 .full .full) (.cutY 11456 .full .full)))) .empty)) .empty))))) .empty) .empty) .empty))) .empty))

theorem metadata96 : 0<144359671 ∧ 24<128 ∧ 83<128 ∧ 1<4 ∧
    6739/4160=1 ∧ 6739%4160=2579 ∧ ∀ i, (leaves96 i).Valid 8 := by
  refine ⟨by decide, by decide, by decide, by decide, by decide, by decide, ?_⟩
  exact (FiniteInputTree.all_iff_forall_get (fun b => b.Valid 8) leavesData96).mp
    (by decide +kernel)

theorem sourceChecked96_0 : ∀ i : Fin 52,
    (fun i => output96 i = raw96 (source96 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem sourceChecked96 : ∀ i : Fin 52, (fun i => output96 i = raw96 (source96 i)) i :=
  forallFin_of_zero_offset (fun i => output96 i = raw96 (source96 i)) sourceChecked96_0

theorem coverChecked96_0 : ∀ i : Fin 52,
    (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) (finOffset 52 0 52 (by decide) i) := by decide +kernel

theorem coverChecked96 : ∀ i : Fin 52, (fun i => (output96 (cover96 i)).ContainsBox (raw96 i)) i :=
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

noncomputable def phaseMass96 : ℝ := singlePhaseMass (144359671/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw96 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass96_eq : phaseMass96 = (144359671/1638400000000 : ℝ) := by
  unfold phaseMass96
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw96 output96 cover96 source96
    (gridTreeUnionCheck_sound 32768 raw96 output96 cover96 source96 tree96 checked96)
    _ (by norm_num) _, areaUnits96]
  norm_num

-- Frozen phase 6093, atom 6219, type 1, source (18,79).
def leavesData97 : FiniteInputTree DyadicLeaf 13 := (.node (.node (.node (.single ⟨1,0,1⟩) (.node (.single ⟨1,1,1⟩) (.single ⟨2,2,0⟩))) (.node (.single ⟨2,2,1⟩) (.node (.single ⟨2,3,1⟩) (.single ⟨2,0,0⟩)))) (.node (.node (.single ⟨2,0,1⟩) (.node (.single ⟨2,1,0⟩) (.single ⟨2,1,1⟩))) (.node (.node (.single ⟨3,6,0⟩) (.single ⟨3,6,1⟩)) (.node (.single ⟨3,7,0⟩) (.single ⟨3,7,1⟩)))))
def leaves97 : Fin 13 → DyadicLeaf := leavesData97.get
def raw97 (i : Fin 52) : GridBox := phaseImageBoxes 32768 8 18 79 leaves97 i
def outputData97 : FiniteInputTree GridBox 52 := (.node (.node (.node (.node (.node (.single ⟨4608,4672,20224,20288⟩) (.node (.single ⟨4608,4672,20288,20352⟩) (.single ⟨4672,4736,20224,20288⟩))) (.node (.single ⟨4672,4736,20288,20352⟩) (.node (.single ⟨4608,4736,20352,20480⟩) (.single ⟨4736,4800,20224,20288⟩)))) (.node (.node (.single ⟨4736,4800,20288,20352⟩) (.node (.single ⟨4800,4832,20224,20256⟩) (.single ⟨4800,4832,20256,20288⟩))) (.node (.node (.single ⟨4832,4864,20224,20256⟩) (.single ⟨4832,4864,20256,20288⟩)) (.node (.single ⟨4800,4864,20288,20352⟩) (.single ⟨4736,4864,20352,20480⟩))))) (.node (.node (.node (.single ⟨12288,12416,27904,28032⟩) (.node (.single ⟨12288,12416,28032,28160⟩) (.single ⟨12416,12480,27904,27968⟩))) (.node (.single ⟨12416,12480,27968,28032⟩) (.node (.single ⟨12480,12512,27904,27936⟩) (.single ⟨12480,12512,27936,27968⟩)))) (.node (.node (.single ⟨12512,12544,27904,27936⟩) (.node (.single ⟨12512,12544,27936,27968⟩) (.single ⟨12480,12544,27968,28032⟩))) (.node (.node (.single ⟨12416,12480,28032,28096⟩) (.single ⟨12416,12480,28096,28160⟩)) (.node (.single ⟨12480,12544,28032,28096⟩) (.single ⟨12480,12544,28096,28160⟩)))))) (.node (.node (.node (.node (.single ⟨20224,20288,4608,4672⟩) (.node (.single ⟨20224,20288,4672,4736⟩) (.single ⟨20288,20352,4608,4672⟩))) (.node (.single ⟨20288,20352,4672,4736⟩) (.node (.single ⟨20224,20288,4736,4800⟩) (.single ⟨20224,20256,4800,4832⟩)))) (.node (.node (.single ⟨20224,20256,4832,4864⟩) (.node (.single ⟨20256,20288,4800,4832⟩) (.single ⟨20256,20288,4832,4864⟩))) (.node (.node (.single ⟨20288,20352,4736,4800⟩) (.single ⟨20288,20352,4800,4864⟩)) (.node (.single ⟨20352,20480,4608,4736⟩) (.single ⟨20352,20480,4736,4864⟩))))) (.node (.node (.node (.single ⟨27904,28032,12288,12416⟩) (.node (.single ⟨27904,27968,12416,12480⟩) (.single ⟨27904,27936,12480,12512⟩))) (.node (.single ⟨27904,27936,12512,12544⟩) (.node (.single ⟨27936,27968,12480,12512⟩) (.single ⟨27936,27968,12512,12544⟩)))) (.node (.node (.single ⟨27968,28032,12416,12480⟩) (.node (.single ⟨27968,28032,12480,12544⟩) (.single ⟨28032,28160,12288,12416⟩))) (.node (.node (.single ⟨28032,28096,12416,12480⟩) (.single ⟨28032,28096,12480,12544⟩)) (.node (.single ⟨28096,28160,12416,12480⟩) (.single ⟨28096,28160,12480,12544⟩)))))))
def output97 : Fin 52 → GridBox := outputData97.get
def coverData97 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 4) (.node (.single 37) (.single 47))) (.node (.single 14) (.node (.single 12) (.single 38)))) (.node (.node (.single 39) (.node (.single 13) (.single 5))) (.node (.node (.single 30) (.single 46)) (.node (.single 21) (.single 6))))) (.node (.node (.node (.single 35) (.node (.single 45) (.single 16))) (.node (.single 11) (.node (.single 36) (.single 40)))) (.node (.node (.single 15) (.node (.single 0) (.single 26))) (.node (.node (.single 51) (.single 25)) (.node (.single 1) (.single 28)))))) (.node (.node (.node (.node (.single 50) (.node (.single 23) (.single 2))) (.node (.single 27) (.node (.single 49) (.single 24)))) (.node (.node (.single 3) (.node (.single 29) (.single 48))) (.node (.node (.single 22) (.single 7)) (.node (.single 31) (.single 44))))) (.node (.node (.node (.single 20) (.node (.single 8) (.single 33))) (.node (.single 43) (.node (.single 18) (.single 9)))) (.node (.node (.single 32) (.node (.single 42) (.single 19))) (.node (.node (.single 10) (.single 34)) (.node (.single 41) (.single 17)))))))
def sourceData97 : FiniteInputTree ℕ 52 := (.node (.node (.node (.node (.node (.single 20) (.node (.single 24) (.single 28))) (.node (.single 32) (.node (.single 0) (.single 8)))) (.node (.node (.single 12) (.node (.single 36) (.single 40))) (.node (.node (.single 44) (.single 48)) (.node (.single 16) (.single 4))))) (.node (.node (.node (.single 7) (.node (.single 3) (.single 19))) (.node (.single 15) (.node (.single 51) (.single 43)))) (.node (.node (.single 47) (.node (.single 39) (.single 11))) (.node (.node (.single 35) (.single 27)) (.node (.single 31) (.single 23)))))) (.node (.node (.node (.node (.single 21) (.node (.single 29) (.single 25))) (.node (.single 33) (.node (.single 9) (.single 37)))) (.node (.node (.single 45) (.node (.single 41) (.single 49))) (.node (.node (.single 13) (.single 17)) (.node (.single 1) (.single 5))))) (.node (.node (.node (.single 6) (.node (.single 18) (.single 50))) (.node (.single 46) (.node (.single 42) (.single 38)))) (.node (.node (.single 14) (.node (.single 10) (.single 2))) (.node (.node (.single 34) (.single 30)) (.node (.single 26) (.single 22)))))))
def cover97 (i : Fin 52) : Fin 52 := ⟨coverData97.get i % 52, Nat.mod_lt _ (by decide)⟩
def source97 (i : Fin 52) : Fin 52 := ⟨sourceData97.get i % 52, Nat.mod_lt _ (by decide)⟩
def tree97 : GridCutTree := (.cutX 16384 (.cutY 16384 .empty (.cutX 8192 (.cutY 24576 (.cutX 4096 .empty (.cutY 20480 (.cutX 6144 (.cutY 18432 .empty (.cutX 5120 (.cutY 19456 .empty (.cutX 4608 .empty (.cutY 19968 .empty (.cutX 4864 (.cutY 20224 .empty (.cutX 4736 (.cutY 20352 (.cutX 4672 (.cutY 20288 .full .full) (.cutY 20288 .full .full)) .full) (.cutY 20352 (.cutX 4800 (.cutY 20288 .full .full) (.cutY 20288 (.cutX 4832 (.cutY 20256 .full .full) (.cutY 20256 .full .full)) .full)) .full))) .empty)))) .empty)) .empty) .empty)) .empty) (.cutY 24576 .empty (.cutX 12288 .empty (.cutY 28672 (.cutX 14336 (.cutY 26624 .empty (.cutX 13312 (.cutY 27648 .empty (.cutX 12800 (.cutY 28160 (.cutX 12544 (.cutY 27904 .empty (.cutX 12416 (.cutY 28032 .full .full) (.cutY 28032 (.cutX 12480 (.cutY 27968 .full .full) (.cutY 27968 (.cutX 12512 (.cutY 27936 .full .full) (.cutY 27936 .full .full)) .full)) (.cutX 12480 (.cutY 28096 .full .full) (.cutY 28096 .full .full))))) .empty) .empty) .empty)) .empty)) .empty) .empty))))) (.cutY 16384 (.cutX 24576 (.cutY 8192 (.cutX 20480 (.cutY 4096 .empty (.cutX 18432 .empty (.cutY 6144 (.cutX 19456 .empty (.cutY 5120 (.cutX 19968 .empty (.cutY 4608 .empty (.cutX 20224 .empty (.cutY 4864 (.cutX 20352 (.cutY 4736 (.cutX 20288 (.cutY 4672 .full .full) (.cutY 4672 .full .full)) (.cutX 20288 (.cutY 4800 .full (.cutX 20256 (.cutY 4832 .full .full) (.cutY 4832 .full .full))) (.cutY 4800 .full .full))) (.cutY 4736 .full .full)) .empty)))) .empty)) .empty))) .empty) .empty) (.cutY 8192 .empty (.cutX 28672 (.cutY 12288 .empty (.cutX 26624 .empty (.cutY 14336 (.cutX 27648 .empty (.cutY 13312 (.cutX 28160 (.cutY 12800 (.cutX 27904 .empty (.cutY 12544 (.cutX 28032 (.cutY 12416 .full (.cutX 27968 (.cutY 12480 .full (.cutX 27936 (.cutY 12512 .full .full) (.cutY 12512 .full .full))) (.cutY 12480 .full .full))) (.cutY 12416 .full (.cutX 28096 (.cutY 12480 .full .full) (.cutY 12480 .full .full)))) .empty)) .empty) .empty) .empty)) .empty))) .empty))) .empty))

theorem metadata97 : 0<157738472 ∧ 18<128 ∧ 79<128 ∧ 1<4 ∧
    6219/4160=1 ∧ 6219%4160=2059 ∧ ∀ i, (leaves97 i).Valid 8 := by
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

noncomputable def phaseMass97 : ℝ := singlePhaseMass (157738472/100000000 : ℝ) (1 : Fin 4)
  (fun z => rectangleUnionMask Finset.univ (fun i => ((raw97 i).qrect 32768).real)
    (commonGridLines 32768) (commonGridLines 32768) z.1 z.2)

theorem phaseMass97_eq : phaseMass97 = (19717309/204800000000 : ℝ) := by
  unfold phaseMass97
  rw [gridUnionCheck_phaseMass 32768 (by decide) raw97 output97 cover97 source97
    (gridTreeUnionCheck_sound 32768 raw97 output97 cover97 source97 tree97 checked97)
    _ (by norm_num) _, areaUnits97]
  norm_num

noncomputable def batchActualMass : ℝ := [phaseMass0,phaseMass1,phaseMass2,phaseMass3,phaseMass4,phaseMass5,phaseMass6,phaseMass7,phaseMass8,phaseMass9,phaseMass10,phaseMass11,phaseMass12,phaseMass13,phaseMass14,phaseMass15,phaseMass16,phaseMass17,phaseMass18,phaseMass19,phaseMass20,phaseMass21,phaseMass22,phaseMass23,phaseMass24,phaseMass25,phaseMass26,phaseMass27,phaseMass28,phaseMass29,phaseMass30,phaseMass31,phaseMass32,phaseMass33,phaseMass34,phaseMass35,phaseMass36,phaseMass37,phaseMass38,phaseMass39,phaseMass40,phaseMass41,phaseMass42,phaseMass43,phaseMass44,phaseMass45,phaseMass46,phaseMass47,phaseMass48,phaseMass49,phaseMass50,phaseMass51,phaseMass52,phaseMass53,phaseMass54,phaseMass55,phaseMass56,phaseMass57,phaseMass58,phaseMass59,phaseMass60,phaseMass61,phaseMass62,phaseMass63,phaseMass64,phaseMass65,phaseMass66,phaseMass67,phaseMass68,phaseMass69,phaseMass70,phaseMass71,phaseMass72,phaseMass73,phaseMass74,phaseMass75,phaseMass76,phaseMass77,phaseMass78,phaseMass79,phaseMass80,phaseMass81,phaseMass82,phaseMass83,phaseMass84,phaseMass85,phaseMass86,phaseMass87,phaseMass88,phaseMass89,phaseMass90,phaseMass91,phaseMass92,phaseMass93,phaseMass94,phaseMass95,phaseMass96,phaseMass97].sum

theorem actual_batch_mass : batchActualMass = (23691069033/3276800000000 : ℝ) := by
  unfold batchActualMass
  rw [phaseMass0_eq,phaseMass1_eq,phaseMass2_eq,phaseMass3_eq,phaseMass4_eq,phaseMass5_eq,phaseMass6_eq,phaseMass7_eq,phaseMass8_eq,phaseMass9_eq,phaseMass10_eq,phaseMass11_eq,phaseMass12_eq,phaseMass13_eq,phaseMass14_eq,phaseMass15_eq,phaseMass16_eq,phaseMass17_eq,phaseMass18_eq,phaseMass19_eq,phaseMass20_eq,phaseMass21_eq,phaseMass22_eq,phaseMass23_eq,phaseMass24_eq,phaseMass25_eq,phaseMass26_eq,phaseMass27_eq,phaseMass28_eq,phaseMass29_eq,phaseMass30_eq,phaseMass31_eq,phaseMass32_eq,phaseMass33_eq,phaseMass34_eq,phaseMass35_eq,phaseMass36_eq,phaseMass37_eq,phaseMass38_eq,phaseMass39_eq,phaseMass40_eq,phaseMass41_eq,phaseMass42_eq,phaseMass43_eq,phaseMass44_eq,phaseMass45_eq,phaseMass46_eq,phaseMass47_eq,phaseMass48_eq,phaseMass49_eq,phaseMass50_eq,phaseMass51_eq,phaseMass52_eq,phaseMass53_eq,phaseMass54_eq,phaseMass55_eq,phaseMass56_eq,phaseMass57_eq,phaseMass58_eq,phaseMass59_eq,phaseMass60_eq,phaseMass61_eq,phaseMass62_eq,phaseMass63_eq,phaseMass64_eq,phaseMass65_eq,phaseMass66_eq,phaseMass67_eq,phaseMass68_eq,phaseMass69_eq,phaseMass70_eq,phaseMass71_eq,phaseMass72_eq,phaseMass73_eq,phaseMass74_eq,phaseMass75_eq,phaseMass76_eq,phaseMass77_eq,phaseMass78_eq,phaseMass79_eq,phaseMass80_eq,phaseMass81_eq,phaseMass82_eq,phaseMass83_eq,phaseMass84_eq,phaseMass85_eq,phaseMass86_eq,phaseMass87_eq,phaseMass88_eq,phaseMass89_eq,phaseMass90_eq,phaseMass91_eq,phaseMass92_eq,phaseMass93_eq,phaseMass94_eq,phaseMass95_eq,phaseMass96_eq,phaseMass97_eq]
  norm_num

end NoThreeLine.ScheduleUnionBatch05996
#print axioms NoThreeLine.ScheduleUnionBatch05996.actual_batch_mass
