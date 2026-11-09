import NoThreeLine.SpecifiedNonaxisCapacityFirstCoverage
import NoThreeLine.SpecifiedNonaxisCapacityChart2
import NoThreeLine.SpecifiedNonaxisCapacityChart3
import NoThreeLine.SpecifiedDirectionGamma16

/-! All primitive nonaxis directions of height at most three and both
orders of every parity pair are covered by the literal kernel checks. -/
set_option autoImplicit false
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections SectionHeight

theorem specifiedNonaxis_chart2 (a h : ℕ) (r : Fin 4) (x y : ℝ)
    (hz : (2,(a,h))∈reducedFamilyLabels 4) :
    directionalChord 2 (pairField r (stepCode r (familyVector (2,(a,h))).1
      (familyVector (2,(a,h))).2)) x y ((a:ℝ)/(h:ℝ))/(2*h:ℕ)≤(197/100:ℝ) := by
  obtain ⟨hh0,hh4,ha0,hah,hcop,hred⟩ := (mem_reducedFamilyLabels 4 (2,(a,h))).mp hz
  dsimp only at hh0 hh4 ha0 hah hcop hred
  have he : a=h → h=1 := by
    intro he
    rw [he] at hcop
    simpa [Nat.Coprime] using hcop
  norm_num at hred
  have hcases : (a=1 ∧ h=2) ∨ (a=1 ∧ h=3) ∨ (a=2 ∧ h=3) := by omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 2 (pairField 0 1) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h2r0s1 x y
    · change directionalChord 2 (pairField 1 0) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h2r0s1 x y
    · change directionalChord 2 (pairField 2 3) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h2r2s3 x y
    · change directionalChord 2 (pairField 3 2) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h2r2s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 2 (pairField 0 3) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h3r0s3 x y
    · change directionalChord 2 (pairField 1 2) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h3r1s2 x y
    · change directionalChord 2 (pairField 2 1) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h3r1s2 x y
    · change directionalChord 2 (pairField 3 0) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m1h3r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 2 (pairField 0 2) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m2h3r0s2 x y
    · change directionalChord 2 (pairField 1 3) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart2.capacity_m2h3r1s3 x y
    · change directionalChord 2 (pairField 2 0) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m2h3r0s2 x y
    · change directionalChord 2 (pairField 3 1) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart2.capacity_m2h3r1s3 x y

theorem specifiedNonaxis_chart3 (a h : ℕ) (r : Fin 4) (x y : ℝ)
    (hz : (3,(a,h))∈reducedFamilyLabels 4) :
    directionalChord 3 (pairField r (stepCode r (familyVector (3,(a,h))).1
      (familyVector (3,(a,h))).2)) x y ((a:ℝ)/(h:ℝ))/(2*h:ℕ)≤(197/100:ℝ) := by
  obtain ⟨hh0,hh4,ha0,hah,hcop,hred⟩ := (mem_reducedFamilyLabels 4 (3,(a,h))).mp hz
  dsimp only at hh0 hh4 ha0 hah hcop hred
  have he : a=h → h=1 := by
    intro he
    rw [he] at hcop
    simpa [Nat.Coprime] using hcop
  norm_num at hred
  have hcases : (a=1 ∧ h=2) ∨ (a=1 ∧ h=3) ∨ (a=2 ∧ h=3) := by omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 3 (pairField 0 1) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h2r0s1 x y
    · change directionalChord 3 (pairField 1 0) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h2r0s1 x y
    · change directionalChord 3 (pairField 2 3) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h2r2s3 x y
    · change directionalChord 3 (pairField 3 2) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h2r2s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 3 (pairField 0 3) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h3r0s3 x y
    · change directionalChord 3 (pairField 1 2) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h3r1s2 x y
    · change directionalChord 3 (pairField 2 1) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h3r1s2 x y
    · change directionalChord 3 (pairField 3 0) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m1h3r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 3 (pairField 0 2) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m2h3r0s2 x y
    · change directionalChord 3 (pairField 1 3) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart3.capacity_m2h3r1s3 x y
    · change directionalChord 3 (pairField 2 0) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m2h3r0s2 x y
    · change directionalChord 3 (pairField 3 1) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart3.capacity_m2h3r1s3 x y

theorem specifiedNonaxis_capacity (z : FamilyLabel) (hz : z∈reducedFamilyLabels 4)
    (r : Fin 4) (x y : ℝ) :
    directionalChord z.1 (pairField r (stepCode r (familyVector z).1 (familyVector z).2))
      x y ((z.2.1:ℝ)/(z.2.2:ℝ))/(2*(z.2.2:ℝ))≤(197/100:ℝ) := by
  rcases z with ⟨f,a,h⟩
  fin_cases f
  · simpa using specifiedNonaxis_chart0 a h r x y hz
  · simpa using specifiedNonaxis_chart1 a h r x y hz
  · simpa using specifiedNonaxis_chart2 a h r x y hz
  · simpa using specifiedNonaxis_chart3 a h r x y hz

theorem specifiedNonaxis_shellChord_capacity {n : ℕ} (p : Grid n) (d : Σ _h : ℕ,ZPoint)
    (hd : d∈directionIndices n) (h4 : d.1<4) (hx : d.2.1≠0) (hy : d.2.2≠0) :
    shellChord Finset.univ (fun i=>(cellRect i).real) capacityTypedWeight p d/(2*(d.1:ℝ))≤(197/100:ℝ) := by
  have himage := nonaxis_subset_family_image n (Finset.mem_filter.mpr ⟨hd,hx,hy⟩)
  obtain ⟨z,hz,rfl⟩ := Finset.mem_image.mp himage
  have hz' := (mem_reducedFamilyLabels n z).mp hz
  have hz4 : z∈reducedFamilyLabels 4 :=
    (mem_reducedFamilyLabels 4 z).mpr ⟨hz'.1,h4,hz'.2.2⟩
  rw [shellChord_family_capacity p z hz]
  exact specifiedNonaxis_capacity z hz4 (codeZ (gridEmbed p)) _ _

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.specifiedNonaxis_capacity
#print axioms NoThreeLine.FrozenCapacity.specifiedNonaxis_shellChord_capacity

