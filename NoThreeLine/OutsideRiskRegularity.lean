import NoThreeLine.ActualOutsideRisk
import NoThreeLine.PhysicalLineCreditRate

/-! Actual line hazard and r-proxy are measurable and nonnegative bounded
functions of the physical state. No credit floor is used for regularity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem physicalOutsideLineRisk_measurable {n : ℕ} (mask : Grid n → ℝ)
    (p : Grid n) (L : LineIndex n) : Measurable (physicalOutsideLineRisk mask p L) := by
  have hs := ExtendedState.measurable_process n
  have hp : MeasurableSet {e : ExtendedState n | p ∈ e.process.activeEvents} :=
    (((measurable_of_countable (fun S : Finset (Grid n) => p ∈ S)).comp
      (activeEvents_measurable n)).comp hs).setOf
  have hN : MeasurableSet {e : ExtendedState n | occupancy e.process L = 1} :=
    ((measurable_of_countable (fun S : Finset (Grid n) => (S ∩ L.val).card = 1)).comp
      ((ProcessState.measurable_selected n).comp hs)).setOf
  exact Measurable.ite (hp.inter hN)
    (Finset.measurable_sum _ (fun q _ => (process_birthRate_measurable mask q).comp hs)) measurable_const

theorem physicalOutsideLineProxy_measurable {n : ℕ} (mask : Grid n → ℝ)
    (p : Grid n) (L : LineIndex n) : Measurable (physicalOutsideLineProxy mask p L) :=
  ((measurable_pi_apply L).comp (ExtendedState.measurable_lineCredits n)).mul
    (physicalOutsideLineRisk_measurable mask p L)

theorem physicalOutsideLineRisk_bounds {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (p : Grid n) (L : LineIndex n)
    (e : ExtendedState n) (B : ℝ) (hB : 0 < B) (he : e.Valid B) :
    0 ≤ physicalOutsideLineRisk mask p L e ∧
      physicalOutsideLineRisk mask p L e ≤ (L.val.card : ℝ)*(B/n) := by
  have hrate (q : Grid n) : e.process.birthRate mask q ≤ B/n := by
    have hα := e.process.acceptance_bounds mask B hB hm (fun q _ => he.2.1.1 q) q
    rw [←ProcessState.candidate_rate_times_acceptance e.process mask B hB.ne' q]
    exact mul_le_of_le_one_right (div_nonneg hB.le (Nat.cast_nonneg n)) hα.2
  refine ⟨physicalOutsideLineRisk_nonneg mask (fun q => (hm q).1) p L e he.1,?_⟩
  unfold physicalOutsideLineRisk
  split_ifs
  · calc
      _ ≤ ∑ _q ∈ L.val.erase p, B/n := Finset.sum_le_sum (fun q _ => hrate q)
      _ = ((L.val.erase p).card : ℝ)*(B/n) := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right (by exact_mod_cast Finset.card_erase_le)
        (div_nonneg hB.le (Nat.cast_nonneg n))
  · positivity

theorem physicalOutsideLineProxy_bounds {n : ℕ} (mask : Grid n → ℝ)
    (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (p : Grid n) (L : LineIndex n)
    (e : ExtendedState n) (B : ℝ) (hB : 0 < B) (he : e.Valid B) :
    0 ≤ physicalOutsideLineProxy mask p L e ∧
      physicalOutsideLineProxy mask p L e ≤ physicalOutsideLineRisk mask p L e := by
  have hx := (physicalOutsideLineRisk_bounds mask hm p L e B hB he).1
  have hr : 0 ≤ e.lineCredits L ∧ e.lineCredits L ≤ 1 := he.2.1.2.2 L
  exact ⟨mul_nonneg hr.1 hx,mul_le_of_le_one_left hx hr.2⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineRisk_measurable
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineProxy_measurable
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineRisk_bounds
#print axioms NoThreeLine.BirthWitness.physicalOutsideLineProxy_bounds
