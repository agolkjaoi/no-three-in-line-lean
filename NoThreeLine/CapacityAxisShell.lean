import NoThreeLine.CapacityAxisRows
import NoThreeLine.CapacityTypedField
import NoThreeLine.AxisMainBound

/-! Both orders of every actual primitive-axis parity pair, and the actual
G13 shell axis. The maximum is the vertical pair (0,2), not horizontal (0,1). -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections CapacityAxisRows

theorem capacityPairWeight_swap (r s : Fin 4) : pairWeight r s=pairWeight s r := by
  funext i
  simp only [pairWeight,add_comm]

def axisCapacity (vertical : Bool) (r s : Fin 4) (x y : ℝ) : ℝ :=
  directionalChord (if vertical then 2 else 0)
    (rectangleField Finset.univ (fun i=>(cellRect i).real) (fun i=>(pairWeight r s i:ℝ))) x y 0/2

theorem horizontal_step_capacity (r : Fin 4) (x y : ℝ) :
    axisCapacity false r (stepCode r 1 0) x y≤(639781503/320000000:ℝ) := by
  have h01 := (axis0_capacity x y).trans (by norm_num :
    (1279346649/640000000:ℝ)≤639781503/320000000)
  have h23 := (axis1_capacity x y).trans (by norm_num :
    (1274846823/640000000:ℝ)≤639781503/320000000)
  change axisCapacity false 0 1 x y≤_ at h01
  change axisCapacity false 2 3 x y≤_ at h23
  fin_cases r
  · exact h01
  · change axisCapacity false 1 0 x y≤_
    simpa only [axisCapacity,capacityPairWeight_swap 1 0] using h01
  · exact h23
  · change axisCapacity false 3 2 x y≤_
    simpa only [axisCapacity,capacityPairWeight_swap 3 2] using h23

theorem vertical_step_capacity (r : Fin 4) (x y : ℝ) :
    axisCapacity true r (stepCode r 0 1) x y≤(639781503/320000000:ℝ) := by
  have h02 := axis2_capacity x y
  have h13 := (axis3_capacity x y).trans (by norm_num :
    (1271046159/640000000:ℝ)≤639781503/320000000)
  change axisCapacity true 0 2 x y≤_ at h02
  change axisCapacity true 1 3 x y≤_ at h13
  fin_cases r
  · exact h02
  · exact h13
  · change axisCapacity true 2 0 x y≤_
    simpa only [axisCapacity,capacityPairWeight_swap 2 0] using h02
  · change axisCapacity true 3 1 x y≤_
    simpa only [axisCapacity,capacityPairWeight_swap 3 1] using h13

theorem shell_horizontal_capacity {n : ℕ} (p : Grid n) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p horizontalAxis /2≤
      (639781503/320000000:ℝ) := by
  have hw : directionPairWeight capacityTypedWeight p (1,0) =
      fun i=>(pairWeight (codeZ (gridEmbed p)) (stepCode (codeZ (gridEmbed p)) 1 0) i:ℝ) := by
    funext i
    exact directionPairWeight_capacity p (1,0) i
  have h := horizontal_step_capacity (codeZ (gridEmbed p))
    (normX n (gridEmbed p)) (normY n (gridEmbed p))
  simp only [shellChord,horizontalAxis,Nat.cast_one,ite_true]
  rw [hw]
  simpa only [axisCapacity,Bool.false_eq_true,ite_false,Int.cast_zero,zero_div] using h

theorem shell_vertical_capacity {n : ℕ} (p : Grid n) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p verticalAxis /2≤
      (639781503/320000000:ℝ) := by
  have hw : directionPairWeight capacityTypedWeight p (0,1) =
      fun i=>(pairWeight (codeZ (gridEmbed p)) (stepCode (codeZ (gridEmbed p)) 0 1) i:ℝ) := by
    funext i
    exact directionPairWeight_capacity p (0,1) i
  have h := vertical_step_capacity (codeZ (gridEmbed p))
    (normX n (gridEmbed p)) (normY n (gridEmbed p))
  simp only [shellChord,verticalAxis,Nat.cast_one,zero_ne_one,ite_false]
  rw [hw]
  simpa only [axisCapacity,ite_true,Int.cast_zero,zero_div] using h

theorem shell_axis_capacity {n : ℕ} (p : Grid n) (d : Σ _h : ℕ, ZPoint)
    (hd : d∈directionIndices n) (haxis : d.2.1=0 ∨ d.2.2=0) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d /
      (2*(d.1:ℝ))≤(639781503/320000000:ℝ) := by
  classical
  have hm := axis_indices_subset n (Finset.mem_filter.mpr ⟨hd,by tauto⟩)
  simp only [Finset.mem_insert,Finset.mem_singleton] at hm
  rcases hm with rfl | rfl
  · simpa only [horizontalAxis,Nat.cast_one,mul_one] using shell_horizontal_capacity p
  · simpa only [verticalAxis,Nat.cast_one,mul_one] using shell_vertical_capacity p

theorem scaled_shell_axis_capacity {n : ℕ} (p : Grid n) (d : Σ _h : ℕ, ZPoint)
    (hd : d∈directionIndices n) (haxis : d.2.1=0 ∨ d.2.2=0) :
    (249/250:ℝ)*(shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d /
      (2*(d.1:ℝ)))≤(159305594247/80000000000:ℝ) := by
  have h := mul_le_mul_of_nonneg_left (shell_axis_capacity p d hd haxis)
    (by norm_num : (0:ℝ)≤249/250)
  norm_num at h ⊢
  exact h

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.shell_axis_capacity
#print axioms NoThreeLine.FrozenCapacity.scaled_shell_axis_capacity
