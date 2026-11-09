import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow064
import NoThreeLine.CapacityLowRow065
import NoThreeLine.CapacityLowRow066
import NoThreeLine.CapacityLowRow067
import NoThreeLine.CapacityLowRow068
import NoThreeLine.CapacityLowRow069
import NoThreeLine.CapacityLowRow070
import NoThreeLine.CapacityLowRow071

/-! Actual row inequalities 64..71, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row064_accepted : RowAccepted 64 := by
  intro x y
  rcases CapacityLowRow064.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow064.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row065_accepted : RowAccepted 65 := by
  intro x y
  rcases CapacityLowRow065.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow065.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row066_accepted : RowAccepted 66 := by
  intro x y
  rcases CapacityLowRow066.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow066.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row067_accepted : RowAccepted 67 := by
  intro x y
  rcases CapacityLowRow067.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow067.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row068_accepted : RowAccepted 68 := by
  intro x y
  rcases CapacityLowRow068.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow068.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row069_accepted : RowAccepted 69 := by
  intro x y
  rcases CapacityLowRow069.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow069.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row070_accepted : RowAccepted 70 := by
  intro x y
  rcases CapacityLowRow070.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow070.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row071_accepted : RowAccepted 71 := by
  intro x y
  rcases CapacityLowRow071.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow071.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row064_accepted
#print axioms NoThreeLine.FrozenCapacity.row071_accepted
