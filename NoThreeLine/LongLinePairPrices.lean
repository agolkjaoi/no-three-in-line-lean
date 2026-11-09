import NoThreeLine.LongLinePrices
import NoThreeLine.WitnessLabelSeparation

/-! Reduce the actual coarse-price exceptional pair error to a finite
geometric line-length sum. Eligibility is kept, so both witness lines avoid
the specified root lines before any off-root-line estimate is applied. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open GridLines FiniteWitnessMoments

def longSourceMultiplier (Γ : Finset (ℤ×ℤ)) (K : ℝ) : ℝ :=
  max 1 (AuxiliaryODE.protection 1 K)^Γ.card

theorem long_schedule_coarse_price_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) (z : Grid n) :
    longWitnessWeight s Γ p threshold z*
      accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J z=
      longSourceMultiplier Γ K*longBirthPrice s mask Γ p threshold z := by
  have hK (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K=K := by
    unfold scheduleSharedPhases
    split <;> rfl
  rw [accumulated_coarse_price_eq_const_mul _ _ _ _ _ Γ K
    (scheduleSharedPhases_directions s mask hm Γ B K ρ) hK]
  change _=longSourceMultiplier Γ K*longBirthPrice s mask Γ p threshold z
  rw [mul_left_comm,long_schedule_unit_price_identity]
  rfl

def longBirthPairSum {J n : ℕ} (s : FinitePhase.Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) : ℝ :=
  ∑q : Grid n,∑r : Grid n,if specifiedDistinctPair Γ q r then
    longBirthPrice s mask Γ p threshold q*longBirthPrice s mask Γ p threshold r else 0

def longPairLengthSum {n : ℕ} (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) : ℝ :=
  ∑q : Grid n,∑r : Grid n,
    if longWitnessEligible Γ p threshold q ∧ longWitnessEligible Γ p threshold r ∧ specifiedDistinctPair Γ q r
    then ((lineThrough p q).card:ℝ)*(lineThrough p r).card else 0

theorem long_schedule_coarse_pair_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) :
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s Γ p threshold)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J)=
      (longSourceMultiplier Γ K)^2*longBirthPairSum s mask Γ p threshold := by
  unfold pairWeight longBirthPairSum
  simp_rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro q _
  apply Finset.sum_congr rfl
  intro r _
  by_cases hqr : specifiedDistinctPair Γ q r
  · rw [if_pos hqr,if_pos hqr]
    have hq := long_schedule_coarse_price_identity s mask hm Γ B K ρ p threshold q
    have hr := long_schedule_coarse_price_identity s mask hm Γ B K ρ p threshold r
    calc
      _ = (longWitnessWeight s Γ p threshold q*
          accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
            (longWitnessRetention s mask hm Γ p threshold) J q)*
          (longWitnessWeight s Γ p threshold r*
          accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
            (longWitnessRetention s mask hm Γ p threshold) J r) := by ring
      _ = _ := by rw [hq,hr]; ring
  · rw [if_neg hqr,if_neg hqr,mul_zero]

theorem longBirthPairSum_le_lengths {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) :
    longBirthPairSum s mask Γ p threshold≤s.total^4/(n:ℝ)^4*longPairLengthSum Γ p threshold := by
  unfold longBirthPairSum longPairLengthSum
  simp_rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro q _
  apply Finset.sum_le_sum
  intro r _
  by_cases hqr : specifiedDistinctPair Γ q r
  · by_cases hq : longWitnessEligible Γ p threshold q
    · by_cases hr : longWitnessEligible Γ p threshold r
      · rw [if_pos hqr,if_pos ⟨hq,hr,hqr⟩]
        have hh := mul_le_mul (longBirthPrice_le_line_length s mask hm Γ p threshold q)
          (longBirthPrice_le_line_length s mask hm Γ p threshold r)
          (longBirthPrice_bounds s mask hm Γ p threshold r).1
          (by positivity : 0≤s.total^2*((lineThrough p q).card:ℝ)/(n:ℝ)^2)
        convert hh using 1 <;> ring
      · rw [if_pos hqr,if_neg (fun h=>hr h.2.1),longBirthPrice_zero_of_not_eligible s mask Γ p threshold r hr]
        simp only [mul_zero,le_refl]
    · rw [if_pos hqr,if_neg (fun h=>hq h.1),longBirthPrice_zero_of_not_eligible s mask Γ p threshold q hq]
      simp only [zero_mul,mul_zero,le_refl]
  · rw [if_neg hqr,if_neg (fun h=>hqr h.2.2),mul_zero]

theorem long_schedule_coarse_pair_le_lengths {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) :
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s Γ p threshold)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J)≤
      (longSourceMultiplier Γ K)^2*(s.total^4/(n:ℝ)^4*longPairLengthSum Γ p threshold) := by
  rw [long_schedule_coarse_pair_identity]
  exact mul_le_mul_of_nonneg_left (longBirthPairSum_le_lengths s mask hm Γ p threshold) (sq_nonneg _)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.long_schedule_coarse_pair_identity
#print axioms NoThreeLine.BirthWitness.long_schedule_coarse_pair_le_lengths
