import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow040
import NoThreeLine.CapacityLowRow041
import NoThreeLine.CapacityLowRow042
import NoThreeLine.CapacityLowRow043
import NoThreeLine.CapacityLowRow044
import NoThreeLine.CapacityLowRow045
import NoThreeLine.CapacityLowRow046
import NoThreeLine.CapacityLowRow047

/-! Actual row inequalities 40..47, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row040_accepted : RowAccepted 40 := by
  intro x y
  rcases CapacityLowRow040.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow040.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row041_accepted : RowAccepted 41 := by
  intro x y
  rcases CapacityLowRow041.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow041.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row042_accepted : RowAccepted 42 := by
  intro x y
  rcases CapacityLowRow042.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow042.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row043_accepted : RowAccepted 43 := by
  intro x y
  rcases CapacityLowRow043.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow043.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row044_accepted : RowAccepted 44 := by
  intro x y
  rcases CapacityLowRow044.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow044.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row045_accepted : RowAccepted 45 := by
  intro x y
  rcases CapacityLowRow045.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow045.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row046_accepted : RowAccepted 46 := by
  intro x y
  rcases CapacityLowRow046.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow046.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row047_accepted : RowAccepted 47 := by
  intro x y
  rcases CapacityLowRow047.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow047.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row040_accepted
#print axioms NoThreeLine.FrozenCapacity.row047_accepted
