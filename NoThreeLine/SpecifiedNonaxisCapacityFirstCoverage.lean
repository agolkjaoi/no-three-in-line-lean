import NoThreeLine.SpecifiedNonaxisCapacityChart0
import NoThreeLine.SpecifiedNonaxisCapacityChart1
import NoThreeLine.CapacityTypedField

/-! Coverage of both parity orders in the two horizontal-major charts. -/
set_option autoImplicit false
set_option maxHeartbeats 0
noncomputable section
namespace NoThreeLine.FrozenCapacity
open PrimitiveLines GridArea GridChord FiniteDirections

theorem pairField_swap (r s : Fin 4) : pairField r s=pairField s r := by
  funext x y
  rw [pairField_eq,pairField_eq,add_comm]

theorem specifiedNonaxis_chart0 (a h : ℕ) (r : Fin 4) (x y : ℝ)
    (hz : (0,(a,h))∈reducedFamilyLabels 4) :
    directionalChord 0 (pairField r (stepCode r (familyVector (0,(a,h))).1
      (familyVector (0,(a,h))).2)) x y ((a:ℝ)/(h:ℝ))/(2*h:ℕ)≤(197/100:ℝ) := by
  obtain ⟨hh0,hh4,ha0,hah,hcop,hred⟩ := (mem_reducedFamilyLabels 4 (0,(a,h))).mp hz
  dsimp only at hh0 hh4 ha0 hah hcop hred
  have he : a=h → h=1 := by
    intro he
    rw [he] at hcop
    simpa [Nat.Coprime] using hcop
  have hcases : (a=1 ∧ h=1) ∨ (a=1 ∧ h=2) ∨ (a=1 ∧ h=3) ∨ (a=2 ∧ h=3) := by omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 0 (pairField 0 3) x y (1/1)/2≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h1r0s3 x y
    · change directionalChord 0 (pairField 1 2) x y (1/1)/2≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h1r1s2 x y
    · change directionalChord 0 (pairField 2 1) x y (1/1)/2≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h1r1s2 x y
    · change directionalChord 0 (pairField 3 0) x y (1/1)/2≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h1r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 0 (pairField 0 2) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h2r0s2 x y
    · change directionalChord 0 (pairField 1 3) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h2r1s3 x y
    · change directionalChord 0 (pairField 2 0) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h2r0s2 x y
    · change directionalChord 0 (pairField 3 1) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h2r1s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 0 (pairField 0 3) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h3r0s3 x y
    · change directionalChord 0 (pairField 1 2) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h3r1s2 x y
    · change directionalChord 0 (pairField 2 1) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h3r1s2 x y
    · change directionalChord 0 (pairField 3 0) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m1h3r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 0 (pairField 0 1) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m2h3r0s1 x y
    · change directionalChord 0 (pairField 1 0) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m2h3r0s1 x y
    · change directionalChord 0 (pairField 2 3) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart0.capacity_m2h3r2s3 x y
    · change directionalChord 0 (pairField 3 2) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart0.capacity_m2h3r2s3 x y

theorem specifiedNonaxis_chart1 (a h : ℕ) (r : Fin 4) (x y : ℝ)
    (hz : (1,(a,h))∈reducedFamilyLabels 4) :
    directionalChord 1 (pairField r (stepCode r (familyVector (1,(a,h))).1
      (familyVector (1,(a,h))).2)) x y ((a:ℝ)/(h:ℝ))/(2*h:ℕ)≤(197/100:ℝ) := by
  obtain ⟨hh0,hh4,ha0,hah,hcop,hred⟩ := (mem_reducedFamilyLabels 4 (1,(a,h))).mp hz
  dsimp only at hh0 hh4 ha0 hah hcop hred
  have he : a=h → h=1 := by
    intro he
    rw [he] at hcop
    simpa [Nat.Coprime] using hcop
  have hcases : (a=1 ∧ h=1) ∨ (a=1 ∧ h=2) ∨ (a=1 ∧ h=3) ∨ (a=2 ∧ h=3) := by omega
  rcases hcases with ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩ | ⟨rfl,rfl⟩
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 1 (pairField 0 3) x y (1/1)/2≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h1r0s3 x y
    · change directionalChord 1 (pairField 1 2) x y (1/1)/2≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h1r1s2 x y
    · change directionalChord 1 (pairField 2 1) x y (1/1)/2≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h1r1s2 x y
    · change directionalChord 1 (pairField 3 0) x y (1/1)/2≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h1r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 1 (pairField 0 2) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h2r0s2 x y
    · change directionalChord 1 (pairField 1 3) x y (1/2)/4≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h2r1s3 x y
    · change directionalChord 1 (pairField 2 0) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h2r0s2 x y
    · change directionalChord 1 (pairField 3 1) x y (1/2)/4≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h2r1s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 1 (pairField 0 3) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h3r0s3 x y
    · change directionalChord 1 (pairField 1 2) x y (1/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h3r1s2 x y
    · change directionalChord 1 (pairField 2 1) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h3r1s2 x y
    · change directionalChord 1 (pairField 3 0) x y (1/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m1h3r0s3 x y
  · fin_cases r <;> try simp only [Nat.cast_one,Nat.mul_one]
    · change directionalChord 1 (pairField 0 1) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m2h3r0s1 x y
    · change directionalChord 1 (pairField 1 0) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m2h3r0s1 x y
    · change directionalChord 1 (pairField 2 3) x y (2/3)/6≤(197/100:ℝ)
      exact SpecifiedNonaxisCapacityChart1.capacity_m2h3r2s3 x y
    · change directionalChord 1 (pairField 3 2) x y (2/3)/6≤(197/100:ℝ)
      rw [pairField_swap]
      exact SpecifiedNonaxisCapacityChart1.capacity_m2h3r2s3 x y

end NoThreeLine.FrozenCapacity

#print axioms NoThreeLine.FrozenCapacity.specifiedNonaxis_chart0
#print axioms NoThreeLine.FrozenCapacity.specifiedNonaxis_chart1
