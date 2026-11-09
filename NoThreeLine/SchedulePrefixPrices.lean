import NoThreeLine.SchedulePrefix
import NoThreeLine.LongLinePrices

/-! Prices of the actual original first k phases equal prices computed
on the literal analytic prefix. The retention is the same function on both
sides, and retirement deadlines are irrelevant to this deterministic identity. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness

theorem accumulatedUnitPrice_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (start : ℝ) (e : Retention n) (k : ℕ) (hc : ∀j<k,cs j=ds j) (q : Grid n) :
    accumulatedPhaseUnitPrice cs start e k q=accumulatedPhaseUnitPrice ds start e k q := by
  unfold accumulatedPhaseUnitPrice
  apply Finset.sum_congr rfl
  intro j hj
  rw [hc j (Finset.mem_range.mp hj),phaseEndpoint_eq_of_prefix cs ds start k hc j (Finset.mem_range.mp hj).le]

theorem accumulatedCoarsePrice_eq_of_prefix {n : ℕ} {B : ℝ} (cs ds : ℕ→SharedPhase n B)
    (start : ℝ) (e : Retention n) (k : ℕ) (hc : ∀j<k,cs j=ds j) (q : Grid n) :
    accumulatedPhaseCoarsePrice cs start e k q=accumulatedPhaseCoarsePrice ds start e k q := by
  unfold accumulatedPhaseCoarsePrice
  apply Finset.sum_congr rfl
  intro j hj
  rw [hc j (Finset.mem_range.mp hj),phaseEndpoint_eq_of_prefix cs ds start k hc j (Finset.mem_range.mp hj).le]

theorem long_prefix_original_unit_mean {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) (k : ℕ) (hk : k≤J) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    (∑z : Grid n,longWitnessWeight s0 Γ p threshold z*
      accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s0 m0 h0 Γ p threshold) k z)=∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z := by
  dsimp only
  rw [←long_schedule_unit_mean_identity (s.prefix k hk) (FinitePhase.prefixMask hk mask)
    (FinitePhase.prefixMask_bounds hk mask hm) Γ B K ρ p threshold]
  apply Finset.sum_congr rfl
  intro z _
  rw [accumulatedUnitPrice_eq_of_prefix _ _ 0 _ k
    (scheduleSharedPhases_prefix_eq s mask hm Γ B K ρ k hk) z]

theorem long_prefix_original_coarse_mean {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) (k : ℕ) (hk : k≤J) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    (∑z : Grid n,longWitnessWeight s0 Γ p threshold z*
      accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s0 m0 h0 Γ p threshold) k z)=
      max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z) := by
  dsimp only
  have hK (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K=K := by
    unfold scheduleSharedPhases
    split <;> rfl
  simp_rw [accumulated_coarse_price_eq_const_mul (scheduleSharedPhases s mask hm Γ B K ρ) 0
    (longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ p threshold)
    k _ Γ K (scheduleSharedPhases_directions s mask hm Γ B K ρ) hK]
  rw [←long_prefix_original_unit_mean s mask hm Γ B K ρ p threshold k hk,Finset.mul_sum]
  exact Finset.sum_congr rfl (fun z _=>by ring)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.accumulatedUnitPrice_eq_of_prefix
#print axioms NoThreeLine.BirthWitness.long_prefix_original_unit_mean
#print axioms NoThreeLine.BirthWitness.long_prefix_original_coarse_mean
