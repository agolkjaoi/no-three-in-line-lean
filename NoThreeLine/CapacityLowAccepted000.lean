import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowRow000
import NoThreeLine.CapacityLowRow001
import NoThreeLine.CapacityLowRow002
import NoThreeLine.CapacityLowRow003
import NoThreeLine.CapacityLowRow004
import NoThreeLine.CapacityLowRow005
import NoThreeLine.CapacityLowRow006
import NoThreeLine.CapacityLowRow007

/-! The first eight concrete row inequalities, in the common table semantics. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
namespace NoThreeLine.FrozenCapacity

theorem row000_accepted : RowAccepted 0 := by
  intro x y
  rcases CapacityLowRow000.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 0).dx (lowRows.get 0).dy
    (lowRows.get 0).rootType (lowRows.get 0).otherType x y≤((lowRows.get 0).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow000.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row001_accepted : RowAccepted 1 := by
  intro x y
  rcases CapacityLowRow001.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 1).dx (lowRows.get 1).dy
    (lowRows.get 1).rootType (lowRows.get 1).otherType x y≤((lowRows.get 1).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow001.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row002_accepted : RowAccepted 2 := by
  intro x y
  rcases CapacityLowRow002.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 2).dx (lowRows.get 2).dy
    (lowRows.get 2).rootType (lowRows.get 2).otherType x y≤((lowRows.get 2).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow002.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row003_accepted : RowAccepted 3 := by
  intro x y
  rcases CapacityLowRow003.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 3).dx (lowRows.get 3).dy
    (lowRows.get 3).rootType (lowRows.get 3).otherType x y≤((lowRows.get 3).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow003.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row004_accepted : RowAccepted 4 := by
  intro x y
  rcases CapacityLowRow004.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 4).dx (lowRows.get 4).dy
    (lowRows.get 4).rootType (lowRows.get 4).otherType x y≤((lowRows.get 4).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow004.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row005_accepted : RowAccepted 5 := by
  intro x y
  rcases CapacityLowRow005.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 5).dx (lowRows.get 5).dy
    (lowRows.get 5).rootType (lowRows.get 5).otherType x y≤((lowRows.get 5).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow005.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row006_accepted : RowAccepted 6 := by
  intro x y
  rcases CapacityLowRow006.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 6).dx (lowRows.get 6).dy
    (lowRows.get 6).rootType (lowRows.get 6).otherType x y≤((lowRows.get 6).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow006.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row007_accepted : RowAccepted 7 := by
  intro x y
  rcases CapacityLowRow007.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  change directionCapacity (lowRows.get 7).dx (lowRows.get 7).dy
    (lowRows.get 7).rootType (lowRows.get 7).otherType x y≤((lowRows.get 7).upper:ℝ)
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow007.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.row000_accepted
#print axioms NoThreeLine.FrozenCapacity.row007_accepted
