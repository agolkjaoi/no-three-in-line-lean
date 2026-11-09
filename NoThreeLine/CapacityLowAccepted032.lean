import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow032
import NoThreeLine.CapacityLowRow033
import NoThreeLine.CapacityLowRow034
import NoThreeLine.CapacityLowRow035
import NoThreeLine.CapacityLowRow036
import NoThreeLine.CapacityLowRow037
import NoThreeLine.CapacityLowRow038
import NoThreeLine.CapacityLowRow039

/-! Actual row inequalities 32..39, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row032_accepted : RowAccepted 32 := by
  intro x y
  rcases CapacityLowRow032.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow032.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row033_accepted : RowAccepted 33 := by
  intro x y
  rcases CapacityLowRow033.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow033.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row034_accepted : RowAccepted 34 := by
  intro x y
  rcases CapacityLowRow034.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow034.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row035_accepted : RowAccepted 35 := by
  intro x y
  rcases CapacityLowRow035.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow035.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row036_accepted : RowAccepted 36 := by
  intro x y
  rcases CapacityLowRow036.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow036.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row037_accepted : RowAccepted 37 := by
  intro x y
  rcases CapacityLowRow037.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow037.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row038_accepted : RowAccepted 38 := by
  intro x y
  rcases CapacityLowRow038.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow038.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row039_accepted : RowAccepted 39 := by
  intro x y
  rcases CapacityLowRow039.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow039.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row032_accepted
#print axioms NoThreeLine.FrozenCapacity.row039_accepted
