import NoThreeLine.LongLineRetention
import NoThreeLine.ScheduledRetentionPrice

/-! Identify the long witness's exact calendar birth price with the
accumulated prices in the actual finite-phase source products. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open GridLines

def longBirthPrice {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) : ℝ :=
  ∫u in (0:ℝ)..s.total,s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n

theorem longWitnessRetention_continuous {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) :
    Continuous ((longWitnessRetention s mask hm Γ p threshold).value z) :=
  (longWitnessCost_continuous s mask Γ p threshold z).div_const _

theorem longBirthPrice_integrand_integrable {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n) (a b : ℝ) :
    IntervalIntegrable (fun u=>s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n)
      volume a b :=
  ((FinitePhase.rate_integrable Finset.univ s.lo s.hi (fun j=>mask j z)).intervalIntegrable.mul_continuousOn
    (longWitnessCost_continuous s mask Γ p threshold z).continuousOn).div_const n

theorem longBirthPrice_bounds {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) :
    0≤longBirthPrice s mask Γ p threshold z ∧
      longBirthPrice s mask Γ p threshold z≤s.total*longWitnessWeight s Γ p threshold z/n := by
  have hr (u : ℝ) := s.rate_bounds (fun j=>mask j z) (fun j=>hm j z) u
  have hc (u : ℝ) := longWitnessCost_bounds s mask hm Γ p threshold z u
  constructor
  · exact intervalIntegral.integral_nonneg_of_forall s.total_nonneg
      (fun u=>div_nonneg (mul_nonneg (hr u).1 (hc u).1) (Nat.cast_nonneg n))
  · have hh := intervalIntegral.integral_mono_on s.total_nonneg
      (longBirthPrice_integrand_integrable s mask Γ p threshold z 0 s.total)
      (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ=>longWitnessWeight s Γ p threshold z/n)
        volume 0 s.total)
      (fun u _=>div_le_div_of_nonneg_right
        ((mul_le_of_le_one_left (hc u).1 (hr u).2).trans (hc u).2) (Nat.cast_nonneg n))
    simpa only [longBirthPrice,intervalIntegral.integral_const,sub_zero,smul_eq_mul,mul_div_assoc] using hh

theorem longBirthPrice_le_line_length {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (z : Grid n) :
    longBirthPrice s mask Γ p threshold z≤s.total^2*(lineThrough p z).card/(n:ℝ)^2 := by
  have hw : longWitnessWeight s Γ p threshold z≤lineCostWeight s p z := by
    unfold longWitnessWeight
    split_ifs
    · exact le_rfl
    · exact lineCostWeight_nonneg s p z
  apply (longBirthPrice_bounds s mask hm Γ p threshold z).2.trans
  have hh := div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left hw s.total_nonneg) (Nat.cast_nonneg n)
  convert hh using 1 <;> dsimp only [lineCostWeight] <;> ring

theorem longBirthPrice_zero_of_not_eligible {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) (z : Grid n)
    (hz : ¬longWitnessEligible Γ p threshold z) : longBirthPrice s mask Γ p threshold z=0 := by
  simp only [longBirthPrice,longWitnessCost,if_neg hz,mul_zero,zero_div,intervalIntegral.integral_zero]

theorem long_schedule_unit_price_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) (z : Grid n) :
    longWitnessWeight s Γ p threshold z*
      accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J z=longBirthPrice s mask Γ p threshold z := by
  rw [schedule_accumulated_unit_price s mask hm Γ B K ρ _ z
    (longWitnessRetention_continuous s mask hm Γ p threshold z)]
  exact longWitnessPrice_identity s mask hm Γ p threshold z

theorem long_schedule_unit_mean_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) :
    (∑z : Grid n,longWitnessWeight s Γ p threshold z*
      accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J z)=∑z : Grid n,longBirthPrice s mask Γ p threshold z :=
  Finset.sum_congr rfl (fun z _=>long_schedule_unit_price_identity s mask hm Γ B K ρ p threshold z)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longBirthPrice_le_line_length
#print axioms NoThreeLine.BirthWitness.long_schedule_unit_mean_identity
