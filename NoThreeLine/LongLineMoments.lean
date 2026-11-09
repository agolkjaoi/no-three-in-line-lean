import NoThreeLine.RootPhaseSeparatedMoment
import NoThreeLine.LongLinePrices

/-! Instantiate the actual all-phase point-law moments with the long-line
weight and deterministic normalized future-cost retention. This module uses
the full finite schedule: retention has common upper endpoint s.total.
It does not identify this cost with a root-dependent truncated deadline. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

theorem long_schedule_coarse_mean_identity {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) :
    (∑z : Grid n,longWitnessWeight s Γ p threshold z*
      accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J z)=
      max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s mask Γ p threshold z) := by
  have hK (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K=K := by
    unfold scheduleSharedPhases
    split <;> rfl
  simp_rw [accumulated_coarse_price_eq_const_mul (scheduleSharedPhases s mask hm Γ B K ρ) 0
    (longWitnessRetention s mask hm Γ p threshold) J _ Γ K
    (scheduleSharedPhases_directions s mask hm Γ B K ρ) hK]
  rw [←long_schedule_unit_mean_identity s mask hm Γ B K ρ p threshold,Finset.mul_sum]
  exact Finset.sum_congr rfl (fun z _=>by ring)

theorem long_schedule_witnessPower_coarse {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (m : ℕ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s mask hm Γ p threshold
    let w := longWitnessWeight s Γ p threshold
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s mask Γ p threshold z)
    let W := 2*s.total
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)^m
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J)≤
      (C^m+(m:ℝ)^2*W*(C+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 := by
  have hk (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K<2 := by
    unfold scheduleSharedPhases
    split <;> exact hK
  have hh := initial_rootPhasePoint_witnessPower_coarse (scheduleSharedPhases s mask hm Γ B K ρ) ε M
    (scheduleProcessDeadline s mask) 0 p hn hB (longWitnessRetention s mask hm Γ p threshold) Γ
    (longWitnessWeight s Γ p threshold) m J (scheduleSharedPhases_directions s mask hm Γ B K ρ) hk hp hε0 hε
    (fun z=>(longWitnessWeight_bounds s Γ p threshold z).1) (2*s.total)
    (mul_nonneg (by norm_num) s.total_nonneg) (fun z=>(longWitnessWeight_bounds s Γ p threshold z).2)
  dsimp only at hh ⊢
  rwa [long_schedule_coarse_mean_identity s mask hm Γ B K ρ p threshold] at hh

theorem long_schedule_witnessPower_separated {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (m : ℕ) :
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s mask hm Γ p threshold
    let w := longWitnessWeight s Γ p threshold
    let A := ∑z : Grid n,longBirthPrice s mask Γ p threshold z
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*A
    let P := pairWeight (specifiedDistinctPair Γ) w (accumulatedPhaseCoarsePrice cs 0 e J)
    let W := 2*s.total
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)^(m+2)
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J)≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*P*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2 := by
  have hk (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K<2 := by
    unfold scheduleSharedPhases
    split <;> exact hK
  have hh := initial_rootPhasePoint_witnessPower_separated (scheduleSharedPhases s mask hm Γ B K ρ) ε M
    (scheduleProcessDeadline s mask) 0 p hn hB (longWitnessRetention s mask hm Γ p threshold) Γ
    (longWitnessWeight s Γ p threshold) m J (scheduleSharedPhases_directions s mask hm Γ B K ρ) hk hp hε0 hε
    (fun z=>(longWitnessWeight_bounds s Γ p threshold z).1) (2*s.total)
    (mul_nonneg (by norm_num) s.total_nonneg) (fun z=>(longWitnessWeight_bounds s Γ p threshold z).2)
    (longWitnessWeight_root_separated s Γ p threshold)
  dsimp only at hh ⊢
  rwa [long_schedule_unit_mean_identity s mask hm Γ B K ρ p threshold,
    long_schedule_coarse_mean_identity s mask hm Γ B K ρ p threshold] at hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.long_schedule_coarse_mean_identity
#print axioms NoThreeLine.BirthWitness.long_schedule_witnessPower_coarse
#print axioms NoThreeLine.BirthWitness.long_schedule_witnessPower_separated
