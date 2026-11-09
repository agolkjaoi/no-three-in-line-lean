import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow056
import NoThreeLine.CapacityLowRow057
import NoThreeLine.CapacityLowRow058
import NoThreeLine.CapacityLowRow059
import NoThreeLine.CapacityLowRow060
import NoThreeLine.CapacityLowRow061
import NoThreeLine.CapacityLowRow062
import NoThreeLine.CapacityLowRow063

/-! Actual row inequalities 56..63, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row056_accepted : RowAccepted 56 := by
  intro x y
  rcases CapacityLowRow056.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow056.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row057_accepted : RowAccepted 57 := by
  intro x y
  rcases CapacityLowRow057.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow057.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row058_accepted : RowAccepted 58 := by
  intro x y
  rcases CapacityLowRow058.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow058.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row059_accepted : RowAccepted 59 := by
  intro x y
  rcases CapacityLowRow059.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow059.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row060_accepted : RowAccepted 60 := by
  intro x y
  rcases CapacityLowRow060.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow060.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row061_accepted : RowAccepted 61 := by
  intro x y
  rcases CapacityLowRow061.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow061.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row062_accepted : RowAccepted 62 := by
  intro x y
  rcases CapacityLowRow062.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow062.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row063_accepted : RowAccepted 63 := by
  intro x y
  rcases CapacityLowRow063.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow063.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row056_accepted
#print axioms NoThreeLine.FrozenCapacity.row063_accepted
