import NoThreeLine.LineMassSelfRate
import NoThreeLine.PhysicalLineCreditRate
import NoThreeLine.ScheduledCutLeafPowerTower

/-! Actual line-credit activation is covered by actual selected witnesses.
An active root cannot itself be selected. The physical root self rate is
retained when replacing the gated credit decay by witness line masses. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem active_occupied_line_has_selected_witness {n : ℕ} (a : WitnessState n)
    (B : ℝ) (ha : a.Valid B) (L : LineIndex n) (p : Grid n)
    (hp : p ∈ a.augmented.physical.process.activeEvents)
    (hocc : occupancy a.augmented.physical.process L = 1) :
    ∃ z ∈ L.val.erase p, z ∈ a.augmented.physical.process.selected := by
  classical
  have hps : p ∉ a.augmented.physical.process.selected :=
    (ha.1.1.1.2.1 p ((a.augmented.physical.process.mem_activeEvents p).mp hp)).1
  have hpos : 0 < (a.augmented.physical.process.selected ∩ L.val).card := by
    change 0 < occupancy a.augmented.physical.process L
    rw [hocc]
    decide
  obtain ⟨z,hz⟩ := Finset.card_pos.mp hpos
  have hz' := Finset.mem_inter.mp hz
  refine ⟨z,Finset.mem_erase.mpr ⟨?_,hz'.2⟩,hz'.1⟩
  exact fun he => hps (he ▸ hz'.1)

theorem physicalLineCreditRate_le_selectedWitness {n : ℕ}
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B)
    (L : LineIndex n) (p : Grid n) (hpL : p ∈ L.val)
    (hp : p ∈ a.augmented.physical.process.activeEvents) :
    physicalLineCreditRate Γ mask L a.augmented.physical ≤
      (∑ z ∈ L.val.erase p,
        (selectedLineLeafPower mask L p z 1 a + B*selectedLineGate p z a))/n := by
  classical
  let f := fun z : Grid n => selectedLineLeafPower mask L p z 1 a + B*selectedLineGate p z a
  have hf (z : Grid n) : 0 ≤ f z := add_nonneg
    (selectedLineLeafPower_bounds mask hm L p z 1 a B hB ha).1
    (mul_nonneg hB (selectedLineGate_bounds p z a).1)
  by_cases hg : a.augmented.physical.process.stopped=false ∧ ¬specified Γ L ∧
      occupancy a.augmented.physical.process L=1
  · obtain ⟨z,hz,hzs⟩ := active_occupied_line_has_selected_witness a B ha L p hp hg.2.2
    have hzval : f z = boardLineMass mask L p a+B := by
      unfold f
      rw [selectedLineLeafPower_eq_gate_mul]
      simp only [selectedLineGate, hp, hzs, and_self, if_true, pow_one, one_mul, mul_one]
    have hsum : boardLineMass mask L p a+B ≤ ∑ z ∈ L.val.erase p, f z := by
      rw [←hzval]
      exact Finset.single_le_sum (fun z _ => hf z) hz
    calc
      _ = a.augmented.physical.lineCredits L *
          lineIntensity a.augmented.physical.process mask a.augmented.physical.coordinates L := by
        simp [physicalLineCreditRate, creditDamping, hg]
      _ ≤ boardLineMass mask L p a/n+B/n :=
        lineIntensity_root_self_bound mask hm L p hpL a B hB ha
      _ = (boardLineMass mask L p a+B)/n := by ring
      _ ≤ _ := div_le_div_of_nonneg_right hsum (Nat.cast_nonneg n)
  · simp only [physicalLineCreditRate, creditDamping, hg, if_false, mul_zero]
    exact div_nonneg (Finset.sum_nonneg (fun z _ => hf z)) (Nat.cast_nonneg n)

theorem physicalLineCreditRate_times_mass_le_low_moments {n : ℕ}
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B)
    (L : LineIndex n) (p : Grid n) (hpL : p ∈ L.val)
    (hp : p ∈ a.augmented.physical.process.activeEvents) :
    physicalLineCreditRate Γ mask L a.augmented.physical * boardLineMass mask L p a ≤
      (∑ z ∈ L.val.erase p,
        (selectedLineLeafPower mask L p z 2 a+B*selectedLineLeafPower mask L p z 1 a))/n := by
  have hh := mul_le_mul_of_nonneg_right
    (physicalLineCreditRate_le_selectedWitness Γ mask hm a B hB ha L p hpL hp)
    (boardLineMass_bounds mask hm L p a B hB ha).1
  apply hh.trans_eq
  rw [div_mul_eq_mul_div, Finset.sum_mul, Finset.sum_div, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro z _
  simp only [selectedLineLeafPower_eq_gate_mul]
  ring

theorem physicalLineCreditRate_mask_mono {n : ℕ} (Γ : Finset ZPoint)
    (mask upper : Grid n → ℝ) (hmask : ∀ q, mask q ≤ upper q)
    (a : WitnessState n) (B : ℝ) (ha : a.Valid B) (L : LineIndex n) :
    physicalLineCreditRate Γ mask L a.augmented.physical ≤
      physicalLineCreditRate Γ upper L a.augmented.physical := by
  unfold physicalLineCreditRate creditDamping
  split_ifs
  · apply mul_le_mul_of_nonneg_left _ (ha.1.1.2.1.2.2 L).1
    apply Finset.sum_le_sum
    intro q _
    unfold phaseRate
    split_ifs
    · exact div_le_div_of_nonneg_right
        (mul_le_mul_of_nonneg_right (hmask q) (ha.1.1.2.1.1 q).1) (Nat.cast_nonneg n)
    · rfl
  · rfl

theorem physicalLineCreditRate_times_unit_mass_le_low_moments {n : ℕ}
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (hm : ∀ q, mask q ≤ 1)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B)
    (L : LineIndex n) (p : Grid n) (hpL : p ∈ L.val)
    (hp : p ∈ a.augmented.physical.process.activeEvents) :
    physicalLineCreditRate Γ mask L a.augmented.physical * boardLineMass (fun _ => 1) L p a ≤
      (∑ z ∈ L.val.erase p,
        (selectedLineLeafPower (fun _ => 1) L p z 2 a+B*selectedLineLeafPower (fun _ => 1) L p z 1 a))/n :=
  (mul_le_mul_of_nonneg_right (physicalLineCreditRate_mask_mono Γ mask (fun _ => 1) hm a B ha L)
    (boardLineMass_bounds (fun _ => 1) (fun _ => ⟨zero_le_one,le_rfl⟩) L p a B hB ha).1).trans
    (physicalLineCreditRate_times_mass_le_low_moments Γ (fun _ => 1) (fun _ => ⟨zero_le_one,le_rfl⟩)
      a B hB ha L p hpL hp)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.active_occupied_line_has_selected_witness
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_le_selectedWitness
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_times_mass_le_low_moments
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_mask_mono
#print axioms NoThreeLine.BirthWitness.physicalLineCreditRate_times_unit_mass_le_low_moments
