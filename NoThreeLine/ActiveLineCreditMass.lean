import NoThreeLine.LineCreditWitnessCover

/-! The actual credit decay times the unmasked line mass, restricted to an
active root. Its same-time witness domination preserves the self-rate term. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def activeLineCreditMass {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (L : LineIndex n) (p : Grid n) (a : WitnessState n) : ℝ :=
  if p ∈ a.augmented.physical.process.activeEvents then
    physicalLineCreditRate Γ mask L a.augmented.physical * boardLineMass (fun _ => 1) L p a
  else 0

theorem activeLineCreditMass_measurable {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (L : LineIndex n) (p : Grid n) : Measurable (activeLineCreditMass Γ mask L p) := by
  have he : Measurable (fun a : WitnessState n => a.augmented.physical) :=
    (AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n)
  have hp : MeasurableSet {a : WitnessState n | p ∈ a.augmented.physical.process.activeEvents} :=
    ((measurable_of_countable (fun S : Finset (Grid n) => p ∈ S)).comp
      ((activeEvents_measurable n).comp ((ExtendedState.measurable_process n).comp he))).setOf
  exact Measurable.ite hp (((physicalLineCreditRate_measurable Γ mask L).comp he).mul
    (boardLineMass_measurable (fun _ => 1) L p)) measurable_const

theorem activeLineCreditMass_bounds {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (L : LineIndex n) (p : Grid n)
    (a : WitnessState n) (B : ℝ) (hB : 0 < B) (ha : a.Valid B) :
    0 ≤ activeLineCreditMass Γ mask L p a ∧ activeLineCreditMass Γ mask L p a ≤
      ((L.val.card : ℝ)*(B/n))*(B*(L.val.card : ℝ)) := by
  have hr := physicalLineCreditRate_bounds Γ mask L a.augmented.physical B hB hm ha.1.1
  have hh := boardLineMass_bounds (fun _ => 1) (fun _ => ⟨zero_le_one,le_rfl⟩) L p a B hB.le ha
  unfold activeLineCreditMass
  split_ifs
  · exact ⟨mul_nonneg hr.1 hh.1, mul_le_mul hr.2 hh.2 hh.1 (by positivity)⟩
  · exact ⟨le_rfl,by positivity⟩

theorem activeLineCreditMass_le_low_moments {n : ℕ} (Γ : Finset ZPoint) (mask : Grid n → ℝ)
    (hm : ∀ q, mask q ≤ 1) (L : LineIndex n) (p : Grid n) (hpL : p ∈ L.val)
    (a : WitnessState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B) :
    activeLineCreditMass Γ mask L p a ≤
      (∑ z ∈ L.val.erase p,
        (selectedLineLeafPower (fun _ => 1) L p z 2 a+B*selectedLineLeafPower (fun _ => 1) L p z 1 a))/n := by
  classical
  unfold activeLineCreditMass
  split_ifs with hp
  · exact physicalLineCreditRate_times_unit_mass_le_low_moments Γ mask hm a B hB ha L p hpL hp
  · simp only [selectedLineLeafPower, hp, false_and, if_false, mul_zero, zero_add,
      Finset.sum_const_zero, zero_div, le_refl]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.activeLineCreditMass_measurable
#print axioms NoThreeLine.BirthWitness.activeLineCreditMass_bounds
#print axioms NoThreeLine.BirthWitness.activeLineCreditMass_le_low_moments
