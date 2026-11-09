import NoThreeLine.CapacityAxisChecker

/-! Four actual primitive-axis parity pairs, extracted from the frozen
axis audit. Extraction is external; every finite rational check and the
actual all-real-coordinate bound below is kernel verified. -/
set_option autoImplicit false
set_option maxRecDepth 100000
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity.CapacityAxisRows

theorem axis0_checked : AxisCheck false (pairWeight 0 1) (1279346649/640000000:ℚ) := by
  unfold AxisCheck
  decide +kernel

theorem axis0_witness : axisBandValue false (pairWeight 0 1) 1/2=(1279346649/640000000:ℚ) := by
  decide +kernel

theorem axis0_capacity (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 1 p:ℝ))) x y 0/2≤(1279346649/640000000:ℝ) := by
  have h := horizontal_axisCheck_sound
    (pairWeight 0 1) (1279346649/640000000:ℚ) axis0_checked x y
  norm_num at h ⊢
  exact h

theorem axis1_checked : AxisCheck false (pairWeight 2 3) (1274846823/640000000:ℚ) := by
  unfold AxisCheck
  decide +kernel

theorem axis1_witness : axisBandValue false (pairWeight 2 3) 0/2=(1274846823/640000000:ℚ) := by
  decide +kernel

theorem axis1_capacity (x y : ℝ) :
    directionalChord 0 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 2 3 p:ℝ))) x y 0/2≤(1274846823/640000000:ℝ) := by
  have h := horizontal_axisCheck_sound
    (pairWeight 2 3) (1274846823/640000000:ℚ) axis1_checked x y
  norm_num at h ⊢
  exact h

theorem axis2_checked : AxisCheck true (pairWeight 0 2) (639781503/320000000:ℚ) := by
  unfold AxisCheck
  decide +kernel

theorem axis2_witness : axisBandValue true (pairWeight 0 2) 0/2=(639781503/320000000:ℚ) := by
  decide +kernel

theorem axis2_capacity (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 0 2 p:ℝ))) x y 0/2≤(639781503/320000000:ℝ) := by
  have h := vertical_axisCheck_sound
    (pairWeight 0 2) (639781503/320000000:ℚ) axis2_checked x y
  norm_num at h ⊢
  exact h

theorem axis3_checked : AxisCheck true (pairWeight 1 3) (1271046159/640000000:ℚ) := by
  unfold AxisCheck
  decide +kernel

theorem axis3_witness : axisBandValue true (pairWeight 1 3) 0/2=(1271046159/640000000:ℚ) := by
  decide +kernel

theorem axis3_capacity (x y : ℝ) :
    directionalChord 2 (rectangleField Finset.univ (fun p=>(cellRect p).real)
      (fun p=>(pairWeight 1 3 p:ℝ))) x y 0/2≤(1271046159/640000000:ℝ) := by
  have h := vertical_axisCheck_sound
    (pairWeight 1 3) (1271046159/640000000:ℚ) axis3_checked x y
  norm_num at h ⊢
  exact h

end NoThreeLine.FrozenCapacity.CapacityAxisRows
#print axioms NoThreeLine.FrozenCapacity.CapacityAxisRows.axis0_capacity
#print axioms NoThreeLine.FrozenCapacity.CapacityAxisRows.axis1_capacity
#print axioms NoThreeLine.FrozenCapacity.CapacityAxisRows.axis2_capacity
#print axioms NoThreeLine.FrozenCapacity.CapacityAxisRows.axis3_capacity
