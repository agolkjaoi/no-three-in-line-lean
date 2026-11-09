import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow088
import NoThreeLine.CapacityLowRow089
import NoThreeLine.CapacityLowRow090
import NoThreeLine.CapacityLowRow091
import NoThreeLine.CapacityLowRow092
import NoThreeLine.CapacityLowRow093
import NoThreeLine.CapacityLowRow094
import NoThreeLine.CapacityLowRow095

/-! Actual row inequalities 88..95, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row088_accepted : RowAccepted 88 := by
  intro x y
  rcases CapacityLowRow088.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow088.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row089_accepted : RowAccepted 89 := by
  intro x y
  rcases CapacityLowRow089.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow089.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row090_accepted : RowAccepted 90 := by
  intro x y
  rcases CapacityLowRow090.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow090.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row091_accepted : RowAccepted 91 := by
  intro x y
  rcases CapacityLowRow091.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow091.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row092_accepted : RowAccepted 92 := by
  intro x y
  rcases CapacityLowRow092.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow092.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row093_accepted : RowAccepted 93 := by
  intro x y
  rcases CapacityLowRow093.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow093.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row094_accepted : RowAccepted 94 := by
  intro x y
  rcases CapacityLowRow094.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow094.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row095_accepted : RowAccepted 95 := by
  intro x y
  rcases CapacityLowRow095.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow095.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row088_accepted
#print axioms NoThreeLine.FrozenCapacity.row095_accepted
