import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow016
import NoThreeLine.CapacityLowRow017
import NoThreeLine.CapacityLowRow018
import NoThreeLine.CapacityLowRow019
import NoThreeLine.CapacityLowRow020
import NoThreeLine.CapacityLowRow021
import NoThreeLine.CapacityLowRow022
import NoThreeLine.CapacityLowRow023

/-! Actual row inequalities 16..23, in the common finite-table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row016_accepted : RowAccepted 16 := by
  intro x y
  rcases CapacityLowRow016.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow016.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row017_accepted : RowAccepted 17 := by
  intro x y
  rcases CapacityLowRow017.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow017.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row018_accepted : RowAccepted 18 := by
  intro x y
  rcases CapacityLowRow018.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow018.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row019_accepted : RowAccepted 19 := by
  intro x y
  rcases CapacityLowRow019.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow019.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row020_accepted : RowAccepted 20 := by
  intro x y
  rcases CapacityLowRow020.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow020.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row021_accepted : RowAccepted 21 := by
  intro x y
  rcases CapacityLowRow021.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow021.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row022_accepted : RowAccepted 22 := by
  intro x y
  rcases CapacityLowRow022.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow022.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row023_accepted : RowAccepted 23 := by
  intro x y
  rcases CapacityLowRow023.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow023.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row016_accepted
#print axioms NoThreeLine.FrozenCapacity.row023_accepted
