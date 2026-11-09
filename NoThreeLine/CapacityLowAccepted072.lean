import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow072
import NoThreeLine.CapacityLowRow073
import NoThreeLine.CapacityLowRow074
import NoThreeLine.CapacityLowRow075
import NoThreeLine.CapacityLowRow076
import NoThreeLine.CapacityLowRow077
import NoThreeLine.CapacityLowRow078
import NoThreeLine.CapacityLowRow079

/-! Actual row inequalities 72..79, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row072_accepted : RowAccepted 72 := by
  intro x y
  rcases CapacityLowRow072.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow072.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row073_accepted : RowAccepted 73 := by
  intro x y
  rcases CapacityLowRow073.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow073.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row074_accepted : RowAccepted 74 := by
  intro x y
  rcases CapacityLowRow074.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow074.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row075_accepted : RowAccepted 75 := by
  intro x y
  rcases CapacityLowRow075.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow075.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row076_accepted : RowAccepted 76 := by
  intro x y
  rcases CapacityLowRow076.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow076.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row077_accepted : RowAccepted 77 := by
  intro x y
  rcases CapacityLowRow077.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow077.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row078_accepted : RowAccepted 78 := by
  intro x y
  rcases CapacityLowRow078.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow078.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row079_accepted : RowAccepted 79 := by
  intro x y
  rcases CapacityLowRow079.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow079.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row072_accepted
#print axioms NoThreeLine.FrozenCapacity.row079_accepted
