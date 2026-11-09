import NoThreeLine.CapacityLowFamilyKeys
import NoThreeLine.CapacityHighTail
import NoThreeLine.AxisMainBound

/-! Assembly from explicit acceptance of all 112 rows. This finite premise
is exposed until all separate numerical row checks have passed. The family,
parity-order and actual shell transport are derived here, not assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1500000
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections

theorem capacityPairField_minmax (r s : Fin 4) : pairField (min r s) (max r s)=pairField r s := by
  by_cases h : r≤s
  · rw [min_eq_left h,max_eq_right h]
  · rw [min_eq_right (le_of_not_ge h),max_eq_left (le_of_not_ge h)]
    funext x y
    simp only [pairField,rectangleField,pairWeight,add_comm]

theorem family_capacity_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {n : ℕ} (z : FamilyLabel) (hz : z∈reducedFamilyLabels n)
    (h4 : 4≤z.2.2) (h7 : z.2.2≤7) (r : Fin 4) (x y : ℝ) :
    directionalChord z.1 (pairField r (familyOtherType z.1 z.2.1 z.2.2 r))
      x y ((z.2.1:ℝ)/(z.2.2:ℝ))/(2*(z.2.2:ℝ))≤(30549893891/38400000000:ℝ) := by
  obtain ⟨hk,hf,ha,hh⟩ := family_table_key z.1 z.2.1 z.2.2 r
    (lowFamilyKey_of_reduced z hz h4 h7)
  obtain ⟨i,hx,hy,hr,hs⟩ := low_key_covered _ _ _ _ hk
  have hc := hrows i x y
  unfold directionCapacity at hc
  rw [hx,hy,hr,hs,hf,ha,hh] at hc
  change directionalChord z.1
    (pairField (min r (familyOtherType z.1 z.2.1 z.2.2 r))
      (max r (familyOtherType z.1 z.2.1 z.2.2 r))) x y
      ((z.2.1:ℝ)/(z.2.2:ℝ))/(2*(z.2.2:ℝ))≤_ at hc
  rw [capacityPairField_minmax] at hc
  have hu : ((lowRows.get i).upper:ℝ)≤((30549893891/38400000000:ℚ):ℝ) := by
    exact_mod_cast saved_upper_le i
  norm_num at hu
  exact hc.trans hu

theorem shell_low_capacity_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {n : ℕ} (p : Grid n) (d : Σ _h : ℕ,ZPoint) (hd : d∈directionIndices n)
    (h4 : 4≤d.1) (h7 : d.1≤7) (hx : d.2.1≠0) (hy : d.2.2≠0) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d/(2*(d.1:ℝ))≤
      (30549893891/38400000000:ℝ) := by
  obtain ⟨z,hz,rfl⟩ := Finset.mem_image.mp
    (nonaxis_subset_family_image n (Finset.mem_filter.mpr ⟨hd,hx,hy⟩))
  rw [shellChord_family_capacity p z hz]
  exact family_capacity_of_rows hrows z hz h4 h7 (codeZ (gridEmbed p)) _ _

theorem shell_high_capacity {n : ℕ} (p : Grid n) (d : Σ _h : ℕ,ZPoint)
    (hd : d∈directionIndices n) (hh : 8≤d.1) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d/(2*(d.1:ℝ))≤
      (1181489833/1600000000:ℝ) := by
  classical
  have hp : Primitive d.2 := (Finset.mem_filter.mp (Finset.mem_sigma.mp hd).2).2
  have hs : codeZ (gridEmbed p)≠stepCode (codeZ (gridEmbed p)) d.2.1 d.2.2 :=
    Ne.symm (primitive_stepCode_ne (gridEmbed p) d.2 hp)
  have hw : directionPairWeight capacityTypedWeight p d.2=
      fun i=>(pairWeight (codeZ (gridEmbed p))
        (stepCode (codeZ (gridEmbed p)) d.2.1 d.2.2) i:ℝ) := by
    funext i
    exact directionPairWeight_capacity p d.2 i
  unfold shellChord
  rw [hw]
  split_ifs
  · exact pairCapacity_high _ _ hs 0 _ _ _ d.1 hh
  · exact pairCapacity_high _ _ hs 2 _ _ _ d.1 hh

theorem shell_outside_capacity_of_rows (hrows : ∀ i : Fin 112, RowAccepted i)
    {n : ℕ} (p : Grid n) (d : Σ _h : ℕ,ZPoint) (hd : d∈directionIndices n)
    (h4 : 4≤d.1) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d/(2*(d.1:ℝ))≤
      (30549893891/38400000000:ℝ) := by
  by_cases h8 : 8≤d.1
  · exact (shell_high_capacity p d hd h8).trans (by norm_num)
  · have h7 : d.1≤7 := by omega
    have hnaxis : ¬(d.2.1=0 ∨ d.2.2=0) := by
      intro ha
      have hm := axis_indices_subset n (Finset.mem_filter.mpr ⟨hd,by tauto⟩)
      simp only [Finset.mem_insert,Finset.mem_singleton] at hm
      rcases hm with rfl | rfl <;> norm_num [horizontalAxis,verticalAxis] at h4
    exact shell_low_capacity_of_rows hrows p d hd h4 h7
      (not_or.mp hnaxis).1 (not_or.mp hnaxis).2

end NoThreeLine.FrozenCapacity
#print axioms NoThreeLine.FrozenCapacity.family_capacity_of_rows
#print axioms NoThreeLine.FrozenCapacity.shell_outside_capacity_of_rows
