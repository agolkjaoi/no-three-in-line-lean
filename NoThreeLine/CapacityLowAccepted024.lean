import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow024
import NoThreeLine.CapacityLowRow025
import NoThreeLine.CapacityLowRow026
import NoThreeLine.CapacityLowRow027
import NoThreeLine.CapacityLowRow028
import NoThreeLine.CapacityLowRow029
import NoThreeLine.CapacityLowRow030
import NoThreeLine.CapacityLowRow031

/-! Actual row inequalities 24..31, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row024_accepted : RowAccepted 24 := by
  intro x y
  rcases CapacityLowRow024.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow024.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row025_accepted : RowAccepted 25 := by
  intro x y
  rcases CapacityLowRow025.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow025.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row026_accepted : RowAccepted 26 := by
  intro x y
  rcases CapacityLowRow026.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow026.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row027_accepted : RowAccepted 27 := by
  intro x y
  rcases CapacityLowRow027.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow027.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row028_accepted : RowAccepted 28 := by
  intro x y
  rcases CapacityLowRow028.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow028.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row029_accepted : RowAccepted 29 := by
  intro x y
  rcases CapacityLowRow029.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow029.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row030_accepted : RowAccepted 30 := by
  intro x y
  rcases CapacityLowRow030.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow030.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row031_accepted : RowAccepted 31 := by
  intro x y
  rcases CapacityLowRow031.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow031.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row024_accepted
#print axioms NoThreeLine.FrozenCapacity.row031_accepted
