import NoThreeLine.ActualOutsideRisk
import NoThreeLine.LineCreditWitnessCover
import NoThreeLine.SelectedLineExcess

/-! An actual activated-line proxy is covered by the actual selected
witness. Replacing its masked r-mass by the deterministic remaining leaf
count leaves exactly the already formalized selectedLineExcess observable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def selectedLineMain {n : ℕ} (mask : Grid n → ℝ) (L : LineIndex n) (p z : Grid n)
    (a : WitnessState n) : ℝ :=
  selectedLineGate p z a * ∑ q ∈ lineLeafSites L p z, mask q

theorem selectedLineMain_measurable {n : ℕ} (mask : Grid n → ℝ)
    (L : LineIndex n) (p z : Grid n) : Measurable (selectedLineMain mask L p z) :=
  (selectedLineGate_measurable p z).mul_const _

theorem selectedLineMain_bounds {n : ℕ} (mask : Grid n → ℝ) (hm : ∀ q, 0 ≤ mask q)
    (L : LineIndex n) (p z : Grid n) (a : WitnessState n) :
    0 ≤ selectedLineMain mask L p z a ∧
      selectedLineMain mask L p z a ≤ ∑ q ∈ lineLeafSites L p z, mask q := by
  have hD := Finset.sum_nonneg (fun q (_ : q ∈ lineLeafSites L p z) => hm q)
  have hg := selectedLineGate_bounds p z a
  exact ⟨mul_nonneg hg.1 hD,mul_le_of_le_one_left hD hg.2⟩

theorem selectedLineMass_le_main_excess {n : ℕ} (mask : Grid n → ℝ)
    (L : LineIndex n) (p z : Grid n) (a : WitnessState n) :
    selectedLineGate p z a * boardLineMass mask L p a ≤
      selectedLineMain mask L p z a + selectedLineExcess mask L p z a := by
  have hh : boardLineMass mask L p a ≤ (∑ q ∈ lineLeafSites L p z, mask q) +
      max (boardLineMass mask L p a - ∑ q ∈ lineLeafSites L p z, mask q) 0 := by
    linarith [le_max_left (boardLineMass mask L p a - ∑ q ∈ lineLeafSites L p z, mask q) 0]
  simpa only [mul_add,selectedLineMain,selectedLineExcess] using
    mul_le_mul_of_nonneg_left hh (selectedLineGate_bounds p z a).1

theorem physicalOutsideLineProxy_le_masked_mass {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (a : WitnessState n) (B : ℝ)
    (hB : 0 ≤ B) (ha : a.Valid B) (L : LineIndex n) (p : Grid n) :
    physicalOutsideLineProxy mask p L a.augmented.physical ≤ boardLineMass mask L p a/n := by
  have hr : 0 ≤ a.augmented.physical.lineCredits L := (ha.1.1.2.1.2.2 L).1
  unfold physicalOutsideLineProxy physicalOutsideLineRisk
  split_ifs
  · calc
      _ ≤ a.augmented.physical.lineCredits L * ∑ q ∈ L.val.erase p, mask q*activeLeafWeight q a/n :=
        mul_le_mul_of_nonneg_left (Finset.sum_le_sum (fun q _ => physical_phaseRate_le_activeLeaf mask hm a B hB ha q)) hr
      _ = _ := by rw [←Finset.sum_div]; unfold boardLineMass; ring
  · simpa only [mul_zero] using div_nonneg (boardLineMass_bounds mask hm L p a B hB ha).1 (Nat.cast_nonneg n)

theorem physicalOutsideLineProxy_le_witness_mass {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (a : WitnessState n) (B : ℝ)
    (hB : 0 ≤ B) (ha : a.Valid B) (L : LineIndex n) (p : Grid n) :
    physicalOutsideLineProxy mask p L a.augmented.physical ≤
      (∑ z ∈ L.val.erase p, selectedLineGate p z a * boardLineMass mask L p a)/n := by
  classical
  have hH := (boardLineMass_bounds mask hm L p a B hB ha).1
  have hf (z : Grid n) : 0 ≤ selectedLineGate p z a * boardLineMass mask L p a :=
    mul_nonneg (selectedLineGate_bounds p z a).1 hH
  by_cases hg : p ∈ a.augmented.physical.process.activeEvents ∧ occupancy a.augmented.physical.process L = 1
  · obtain ⟨z,hz,hzs⟩ := active_occupied_line_has_selected_witness a B ha L p hg.1 hg.2
    have he : selectedLineGate p z a * boardLineMass mask L p a = boardLineMass mask L p a := by
      simp only [selectedLineGate,hg.1,hzs,and_self,if_true,one_mul]
    have hsum : boardLineMass mask L p a ≤
        ∑ z ∈ L.val.erase p, selectedLineGate p z a * boardLineMass mask L p a := by
      exact he.symm.le.trans (Finset.single_le_sum (fun z _ => hf z) hz)
    exact (physicalOutsideLineProxy_le_masked_mass mask hm a B hB ha L p).trans
      (div_le_div_of_nonneg_right hsum (Nat.cast_nonneg n))
  · simp only [physicalOutsideLineProxy,physicalOutsideLineRisk,if_neg hg,mul_zero]
    exact div_nonneg (Finset.sum_nonneg (fun z _ => hf z)) (Nat.cast_nonneg n)

theorem physicalOutsideLineProxy_le_main_excess {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (a : WitnessState n) (B : ℝ)
    (hB : 0 ≤ B) (ha : a.Valid B) (L : LineIndex n) (p : Grid n) :
    physicalOutsideLineProxy mask p L a.augmented.physical ≤
      (∑ z ∈ L.val.erase p, (selectedLineMain mask L p z a + selectedLineExcess mask L p z a))/n :=
  (physicalOutsideLineProxy_le_witness_mass mask hm a B hB ha L p).trans
    (div_le_div_of_nonneg_right (Finset.sum_le_sum (fun z _ => selectedLineMass_le_main_excess mask L p z a))
      (Nat.cast_nonneg n))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.selectedLineMain_bounds
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineProxy_le_witness_mass
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineProxy_le_main_excess
