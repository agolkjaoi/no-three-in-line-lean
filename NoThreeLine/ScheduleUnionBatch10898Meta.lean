import NoThreeLine.ScheduleUnionBatch10898Data
import NoThreeLine.FiniteIndexBlocks

set_option autoImplicit false
set_option maxRecDepth 4096
set_option maxHeartbeats 400000
open MeasureTheory NoThreeLine.FinitePhase
namespace NoThreeLine.ScheduleUnionBatch10898

theorem validLeaves0_0 : ∀ i : Fin 64,
    (fun i => (leaves0 i).Valid 8) (finOffset 267 0 64 (by decide) i) := by decide +kernel

theorem validLeaves0_64 : ∀ i : Fin 64,
    (fun i => (leaves0 i).Valid 8) (finOffset 267 64 64 (by decide) i) := by decide +kernel

theorem validLeaves0_128 : ∀ i : Fin 64,
    (fun i => (leaves0 i).Valid 8) (finOffset 267 128 64 (by decide) i) := by decide +kernel

theorem validLeaves0_192 : ∀ i : Fin 64,
    (fun i => (leaves0 i).Valid 8) (finOffset 267 192 64 (by decide) i) := by decide +kernel

theorem validLeaves0_256 : ∀ i : Fin 11,
    (fun i => (leaves0 i).Valid 8) (finOffset 267 256 11 (by decide) i) := by decide +kernel

theorem validLeaves0 : ∀ i : Fin 267, (fun i => (leaves0 i).Valid 8) i :=
  forallFin_of_zero_offset (fun i => (leaves0 i).Valid 8) (forallFinOffset_add (fun i => (leaves0 i).Valid 8) 0 64 203 (by decide) validLeaves0_0
    (forallFinOffset_add (fun i => (leaves0 i).Valid 8) 64 64 139 (by decide) validLeaves0_64
    (forallFinOffset_add (fun i => (leaves0 i).Valid 8) 128 64 75 (by decide) validLeaves0_128
    (forallFinOffset_add (fun i => (leaves0 i).Valid 8) 192 64 11 (by decide) validLeaves0_192
    validLeaves0_256))))
theorem metadata0 : 0<27765579 ∧ 0<128 ∧ 100<128 ∧ 1<4 ∧
    4260/4160=1 ∧ 4260%4160=100 ∧ ∀ i, (leaves0 i).Valid 8 :=
  ⟨by decide,by decide,by decide,by decide,by decide,by decide,validLeaves0⟩

end NoThreeLine.ScheduleUnionBatch10898
#print axioms NoThreeLine.ScheduleUnionBatch10898.metadata0
