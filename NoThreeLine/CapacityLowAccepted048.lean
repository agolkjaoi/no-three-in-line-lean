import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow048
import NoThreeLine.CapacityLowRow049
import NoThreeLine.CapacityLowRow050
import NoThreeLine.CapacityLowRow051
import NoThreeLine.CapacityLowRow052
import NoThreeLine.CapacityLowRow053
import NoThreeLine.CapacityLowRow054
import NoThreeLine.CapacityLowRow055

/-! Actual row inequalities 48..55, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row048_accepted : RowAccepted 48 := by
  intro x y
  rcases CapacityLowRow048.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow048.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row049_accepted : RowAccepted 49 := by
  intro x y
  rcases CapacityLowRow049.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow049.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row050_accepted : RowAccepted 50 := by
  intro x y
  rcases CapacityLowRow050.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow050.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row051_accepted : RowAccepted 51 := by
  intro x y
  rcases CapacityLowRow051.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow051.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row052_accepted : RowAccepted 52 := by
  intro x y
  rcases CapacityLowRow052.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow052.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row053_accepted : RowAccepted 53 := by
  intro x y
  rcases CapacityLowRow053.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow053.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row054_accepted : RowAccepted 54 := by
  intro x y
  rcases CapacityLowRow054.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow054.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row055_accepted : RowAccepted 55 := by
  intro x y
  rcases CapacityLowRow055.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow055.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row048_accepted
#print axioms NoThreeLine.FrozenCapacity.row055_accepted
