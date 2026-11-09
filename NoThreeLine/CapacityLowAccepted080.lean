import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow080
import NoThreeLine.CapacityLowRow081
import NoThreeLine.CapacityLowRow082
import NoThreeLine.CapacityLowRow083
import NoThreeLine.CapacityLowRow084
import NoThreeLine.CapacityLowRow085
import NoThreeLine.CapacityLowRow086
import NoThreeLine.CapacityLowRow087

/-! Actual row inequalities 80..87, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row080_accepted : RowAccepted 80 := by
  intro x y
  rcases CapacityLowRow080.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow080.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row081_accepted : RowAccepted 81 := by
  intro x y
  rcases CapacityLowRow081.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow081.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row082_accepted : RowAccepted 82 := by
  intro x y
  rcases CapacityLowRow082.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow082.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row083_accepted : RowAccepted 83 := by
  intro x y
  rcases CapacityLowRow083.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow083.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row084_accepted : RowAccepted 84 := by
  intro x y
  rcases CapacityLowRow084.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow084.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row085_accepted : RowAccepted 85 := by
  intro x y
  rcases CapacityLowRow085.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow085.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row086_accepted : RowAccepted 86 := by
  intro x y
  rcases CapacityLowRow086.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow086.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row087_accepted : RowAccepted 87 := by
  intro x y
  rcases CapacityLowRow087.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow087.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row080_accepted
#print axioms NoThreeLine.FrozenCapacity.row087_accepted
