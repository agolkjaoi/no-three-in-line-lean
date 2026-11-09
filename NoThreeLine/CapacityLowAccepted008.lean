import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow008
import NoThreeLine.CapacityLowRow009
import NoThreeLine.CapacityLowRow010
import NoThreeLine.CapacityLowRow011
import NoThreeLine.CapacityLowRow012
import NoThreeLine.CapacityLowRow013
import NoThreeLine.CapacityLowRow014
import NoThreeLine.CapacityLowRow015

/-! Actual row inequalities 8..15, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row008_accepted : RowAccepted 8 := by
  intro x y
  rcases CapacityLowRow008.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow008.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row009_accepted : RowAccepted 9 := by
  intro x y
  rcases CapacityLowRow009.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow009.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row010_accepted : RowAccepted 10 := by
  intro x y
  rcases CapacityLowRow010.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow010.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row011_accepted : RowAccepted 11 := by
  intro x y
  rcases CapacityLowRow011.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow011.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row012_accepted : RowAccepted 12 := by
  intro x y
  rcases CapacityLowRow012.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow012.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row013_accepted : RowAccepted 13 := by
  intro x y
  rcases CapacityLowRow013.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow013.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row014_accepted : RowAccepted 14 := by
  intro x y
  rcases CapacityLowRow014.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow014.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row015_accepted : RowAccepted 15 := by
  intro x y
  rcases CapacityLowRow015.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow015.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row008_accepted
#print axioms NoThreeLine.FrozenCapacity.row015_accepted
