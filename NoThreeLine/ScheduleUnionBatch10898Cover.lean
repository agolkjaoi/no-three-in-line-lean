import NoThreeLine.ScheduleUnionBatch10898Data
import NoThreeLine.FiniteIndexBlocks

set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch10898

theorem sourceCover0_0 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 0 64 (by decide) i) := by decide +kernel

theorem sourceCover0_64 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 64 64 (by decide) i) := by decide +kernel

theorem sourceCover0_128 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 128 64 (by decide) i) := by decide +kernel

theorem sourceCover0_192 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 192 64 (by decide) i) := by decide +kernel

theorem sourceCover0_256 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 256 64 (by decide) i) := by decide +kernel

theorem sourceCover0_320 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 320 64 (by decide) i) := by decide +kernel

theorem sourceCover0_384 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 384 64 (by decide) i) := by decide +kernel

theorem sourceCover0_448 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 448 64 (by decide) i) := by decide +kernel

theorem sourceCover0_512 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 512 64 (by decide) i) := by decide +kernel

theorem sourceCover0_576 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 576 64 (by decide) i) := by decide +kernel

theorem sourceCover0_640 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 640 64 (by decide) i) := by decide +kernel

theorem sourceCover0_704 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 704 64 (by decide) i) := by decide +kernel

theorem sourceCover0_768 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 768 64 (by decide) i) := by decide +kernel

theorem sourceCover0_832 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 832 64 (by decide) i) := by decide +kernel

theorem sourceCover0_896 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 896 64 (by decide) i) := by decide +kernel

theorem sourceCover0_960 : ∀ i : Fin 64,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 960 64 (by decide) i) := by decide +kernel

theorem sourceCover0_1024 : ∀ i : Fin 44,
    (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (finOffset 1068 1024 44 (by decide) i) := by decide +kernel

theorem sourceCover0 : ∀ i : Fin 1068, (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) i :=
  forallFin_of_zero_offset (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 0 64 1004 (by decide) sourceCover0_0
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 64 64 940 (by decide) sourceCover0_64
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 128 64 876 (by decide) sourceCover0_128
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 192 64 812 (by decide) sourceCover0_192
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 256 64 748 (by decide) sourceCover0_256
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 320 64 684 (by decide) sourceCover0_320
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 384 64 620 (by decide) sourceCover0_384
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 448 64 556 (by decide) sourceCover0_448
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 512 64 492 (by decide) sourceCover0_512
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 576 64 428 (by decide) sourceCover0_576
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 640 64 364 (by decide) sourceCover0_640
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 704 64 300 (by decide) sourceCover0_704
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 768 64 236 (by decide) sourceCover0_768
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 832 64 172 (by decide) sourceCover0_832
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 896 64 108 (by decide) sourceCover0_896
    (forallFinOffset_add (fun i => output0 i = raw0 (source0 i) ∧ (output0 (cover0 i)).ContainsBox (raw0 i)) 960 64 44 (by decide) sourceCover0_960
    sourceCover0_1024))))))))))))))))

end NoThreeLine.ScheduleUnionBatch10898
#print axioms NoThreeLine.ScheduleUnionBatch10898.sourceCover0
