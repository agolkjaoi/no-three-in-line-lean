import NoThreeLine.CapacityLowAssembly
import NoThreeLine.CapacityLowRowSemantics
import NoThreeLine.CapacityLowAccepted000
import NoThreeLine.CapacityLowAccepted008
import NoThreeLine.CapacityLowAccepted016
import NoThreeLine.CapacityLowAccepted024
import NoThreeLine.CapacityLowAccepted032
import NoThreeLine.CapacityLowAccepted040
import NoThreeLine.CapacityLowAccepted048
import NoThreeLine.CapacityLowAccepted056
import NoThreeLine.CapacityLowAccepted064
import NoThreeLine.CapacityLowAccepted072
import NoThreeLine.CapacityLowAccepted080
import NoThreeLine.CapacityLowAccepted088
import NoThreeLine.CapacityLowRow096
import NoThreeLine.CapacityLowRow097
import NoThreeLine.CapacityLowRow098
import NoThreeLine481.CapacityLowRow099
import NoThreeLine481.CapacityLowRow100
import NoThreeLine481.CapacityLowRow101
import NoThreeLine481.CapacityLowRow102
import NoThreeLine481.CapacityLowRow103
import NoThreeLine481.CapacityLowRow104
import NoThreeLine481.CapacityLowRow105
import NoThreeLine481.CapacityLowRow106
import NoThreeLine481.CapacityLowRow107
import NoThreeLine481.CapacityLowRow108
import NoThreeLine481.CapacityLowRow109
import NoThreeLine481.CapacityLowRow110
import NoThreeLine481.CapacityLowRow111

/-! Discharge all ordinary-line capacity rows of the frozen coarse field. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 3000000
namespace NoThreeLine481
open NoThreeLine NoThreeLine.FrozenCapacity

theorem row096_accepted : RowAccepted 96 := by
  intro x y
  rcases CapacityLowRow096.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow096.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row097_accepted : RowAccepted 97 := by
  intro x y
  rcases CapacityLowRow097.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow097.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row098_accepted : RowAccepted 98 := by
  intro x y
  rcases CapacityLowRow098.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow098.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row099_accepted : RowAccepted 99 := by
  intro x y
  rcases CapacityLowRow099.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow099.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row100_accepted : RowAccepted 100 := by
  intro x y
  rcases CapacityLowRow100.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow100.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row101_accepted : RowAccepted 101 := by
  intro x y
  rcases CapacityLowRow101.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow101.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row102_accepted : RowAccepted 102 := by
  intro x y
  rcases CapacityLowRow102.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow102.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row103_accepted : RowAccepted 103 := by
  intro x y
  rcases CapacityLowRow103.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow103.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row104_accepted : RowAccepted 104 := by
  intro x y
  rcases CapacityLowRow104.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow104.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row105_accepted : RowAccepted 105 := by
  intro x y
  rcases CapacityLowRow105.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow105.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row106_accepted : RowAccepted 106 := by
  intro x y
  rcases CapacityLowRow106.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow106.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row107_accepted : RowAccepted 107 := by
  intro x y
  rcases CapacityLowRow107.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow107.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row108_accepted : RowAccepted 108 := by
  intro x y
  rcases CapacityLowRow108.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow108.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row109_accepted : RowAccepted 109 := by
  intro x y
  rcases CapacityLowRow109.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow109.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row110_accepted : RowAccepted 110 := by
  intro x y
  rcases CapacityLowRow110.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow110.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem row111_accepted : RowAccepted 111 := by
  intro x y
  rcases CapacityLowRow111.row_parameters with ⟨hdx,hdy,hr,hs,hU⟩
  rw [hdx,hdy,hr,hs,hU]
  have h := CapacityLowRow111.actual_capacity_bound x y
  norm_num [directionCapacity,directionChart,directionHeight,directionMinor] at h ⊢
  exact h

theorem all_low_rows_accepted (i : Fin 112) : RowAccepted i := by
  fin_cases i
  · exact row000_accepted
  · exact row001_accepted
  · exact row002_accepted
  · exact row003_accepted
  · exact row004_accepted
  · exact row005_accepted
  · exact row006_accepted
  · exact row007_accepted
  · exact row008_accepted
  · exact row009_accepted
  · exact row010_accepted
  · exact row011_accepted
  · exact row012_accepted
  · exact row013_accepted
  · exact row014_accepted
  · exact row015_accepted
  · exact row016_accepted
  · exact row017_accepted
  · exact row018_accepted
  · exact row019_accepted
  · exact row020_accepted
  · exact row021_accepted
  · exact row022_accepted
  · exact row023_accepted
  · exact row024_accepted
  · exact row025_accepted
  · exact row026_accepted
  · exact row027_accepted
  · exact row028_accepted
  · exact row029_accepted
  · exact row030_accepted
  · exact row031_accepted
  · exact row032_accepted
  · exact row033_accepted
  · exact row034_accepted
  · exact row035_accepted
  · exact row036_accepted
  · exact row037_accepted
  · exact row038_accepted
  · exact row039_accepted
  · exact row040_accepted
  · exact row041_accepted
  · exact row042_accepted
  · exact row043_accepted
  · exact row044_accepted
  · exact row045_accepted
  · exact row046_accepted
  · exact row047_accepted
  · exact row048_accepted
  · exact row049_accepted
  · exact row050_accepted
  · exact row051_accepted
  · exact row052_accepted
  · exact row053_accepted
  · exact row054_accepted
  · exact row055_accepted
  · exact row056_accepted
  · exact row057_accepted
  · exact row058_accepted
  · exact row059_accepted
  · exact row060_accepted
  · exact row061_accepted
  · exact row062_accepted
  · exact row063_accepted
  · exact row064_accepted
  · exact row065_accepted
  · exact row066_accepted
  · exact row067_accepted
  · exact row068_accepted
  · exact row069_accepted
  · exact row070_accepted
  · exact row071_accepted
  · exact row072_accepted
  · exact row073_accepted
  · exact row074_accepted
  · exact row075_accepted
  · exact row076_accepted
  · exact row077_accepted
  · exact row078_accepted
  · exact row079_accepted
  · exact row080_accepted
  · exact row081_accepted
  · exact row082_accepted
  · exact row083_accepted
  · exact row084_accepted
  · exact row085_accepted
  · exact row086_accepted
  · exact row087_accepted
  · exact row088_accepted
  · exact row089_accepted
  · exact row090_accepted
  · exact row091_accepted
  · exact row092_accepted
  · exact row093_accepted
  · exact row094_accepted
  · exact row095_accepted
  · exact row096_accepted
  · exact row097_accepted
  · exact row098_accepted
  · exact row099_accepted
  · exact row100_accepted
  · exact row101_accepted
  · exact row102_accepted
  · exact row103_accepted
  · exact row104_accepted
  · exact row105_accepted
  · exact row106_accepted
  · exact row107_accepted
  · exact row108_accepted
  · exact row109_accepted
  · exact row110_accepted
  · exact row111_accepted

#print axioms all_low_rows_accepted
end NoThreeLine481
