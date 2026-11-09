import NoThreeLine.SelectedLineRegularity

/-! The actual line intensity includes the root's own birth rate. The
physical line mass excludes the root, so the B/n remainder must remain. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem physical_phaseRate_le_activeLeaf {n : ℕ} (mask : Grid n→ℝ)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (a : WitnessState n) (B : ℝ) (hB : 0≤B)
    (ha : a.Valid B) (q : Grid n) :
    phaseRate a.augmented.physical.process mask a.augmented.physical.coordinates.1 q≤
      mask q*activeLeafWeight q a/n := by
  by_cases hq : q∈a.augmented.physical.process.activeEvents
  · have hqa := (a.augmented.physical.process.mem_activeEvents q).mp hq
    rw [activeLeafWeight,if_pos hq]
    unfold phaseRate
    split_ifs with h
    · rfl
    · exact div_nonneg (mul_nonneg (hm q).1 (ha.1.1.1.2.2 q)) (Nat.cast_nonneg n)
  · have hqa := (a.augmented.physical.process.mem_activeEvents q).not.mp hq
    simp only [phaseRate,hqa,and_false,if_false,activeLeafWeight,if_neg hq,mul_zero,zero_div,le_refl]

theorem lineIntensity_root_self_bound {n : ℕ} (mask : Grid n→ℝ)
    (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p : Grid n) (hp : p∈L.val)
    (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    a.augmented.physical.lineCredits L*
      lineIntensity a.augmented.physical.process mask a.augmented.physical.coordinates L≤
        boardLineMass mask L p a/n+B/n := by
  have hr := ha.1.1.2.1.2.2 L
  have hw := activeLeafWeight_bounds p a B hB ha
  have hself : a.augmented.physical.lineCredits L*(mask p*activeLeafWeight p a)≤B := by
    have hq := (mul_le_of_le_one_left hw.1 (hm p).2).trans hw.2
    exact (mul_le_of_le_one_left (mul_nonneg (hm p).1 hw.1) hr.2).trans hq
  calc
    _ ≤ a.augmented.physical.lineCredits L*∑q∈L.val,mask q*activeLeafWeight q a/n :=
      mul_le_mul_of_nonneg_left
        (Finset.sum_le_sum (fun q _=>physical_phaseRate_le_activeLeaf mask hm a B hB ha q)) hr.1
    _ = boardLineMass mask L p a/n+
        (a.augmented.physical.lineCredits L*(mask p*activeLeafWeight p a))/n := by
      rw [←Finset.sum_div,←Finset.sum_erase_add _ _ hp]
      unfold boardLineMass
      ring
    _ ≤ _ := add_le_add le_rfl (div_le_div_of_nonneg_right hself (Nat.cast_nonneg n))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.physical_phaseRate_le_activeLeaf
#print axioms NoThreeLine.BirthWitness.lineIntensity_root_self_bound
