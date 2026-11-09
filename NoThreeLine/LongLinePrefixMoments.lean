import NoThreeLine.SchedulePrefixProcess
import NoThreeLine.SchedulePrefixPrices
import NoThreeLine.RootPhaseSeparatedMoment

/-! The analytic long-line future cost ends at a literal prefix endpoint,
but the stochastic path and all point-retirement deadlines remain those of
the original schedule. Taking the prefix ending at tau_p gives the required
root-dependent retention without prematurely retiring other grid points. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

theorem long_prefix_original_coarse_pair_eq {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) (k : ℕ) (hk : k≤J) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p threshold)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0 e k)=
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p threshold)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k) := by
  dsimp only
  apply congrArg (pairWeight (specifiedDistinctPair Γ) (longWitnessWeight (s.prefix k hk) Γ p threshold))
  funext q
  exact (accumulatedCoarsePrice_eq_of_prefix _ _ 0 _ k
    (scheduleSharedPhases_prefix_eq s mask hm Γ B K ρ k hk) q).symm

theorem long_prefix_witnessPower_coarse {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J) (m : ℕ) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z)
    let W := 2*s0.total
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k ω)^m
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p k)≤
      (C^m+(m:ℝ)^2*W*(C+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 := by
  have hphaseK (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K<2 := by
    unfold scheduleSharedPhases
    split <;> exact hK
  let s0 := s.prefix k hk
  let m0 := FinitePhase.prefixMask hk mask
  let h0 := FinitePhase.prefixMask_bounds hk mask hm
  have hh := initial_rootPhasePoint_witnessPower_coarse (scheduleSharedPhases s mask hm Γ B K ρ) ε M
    (scheduleProcessDeadline s mask) 0 p hn hB (longWitnessRetention s0 m0 h0 Γ p threshold) Γ
    (longWitnessWeight s0 Γ p threshold) m k (scheduleSharedPhases_directions s mask hm Γ B K ρ) hphaseK hp hε0 hε
    (fun z=>(longWitnessWeight_bounds s0 Γ p threshold z).1) (2*s0.total)
    (mul_nonneg (by norm_num) s0.total_nonneg) (fun z=>(longWitnessWeight_bounds s0 Γ p threshold z).2)
  dsimp only at hh ⊢
  rwa [long_prefix_original_coarse_mean s mask hm Γ B K ρ p threshold k hk] at hh

theorem long_prefix_witnessPower_separated {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J) (m : ℕ) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*A
    let P := pairWeight (specifiedDistinctPair Γ) w
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
    let W := 2*s0.total
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k ω)^(m+2)
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p k)≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*P*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2 := by
  have hphaseK (j : ℕ) : (scheduleSharedPhases s mask hm Γ B K ρ j).K<2 := by
    unfold scheduleSharedPhases
    split <;> exact hK
  let s0 := s.prefix k hk
  let m0 := FinitePhase.prefixMask hk mask
  let h0 := FinitePhase.prefixMask_bounds hk mask hm
  have hh := initial_rootPhasePoint_witnessPower_separated (scheduleSharedPhases s mask hm Γ B K ρ) ε M
    (scheduleProcessDeadline s mask) 0 p hn hB (longWitnessRetention s0 m0 h0 Γ p threshold) Γ
    (longWitnessWeight s0 Γ p threshold) m k (scheduleSharedPhases_directions s mask hm Γ B K ρ) hphaseK hp hε0 hε
    (fun z=>(longWitnessWeight_bounds s0 Γ p threshold z).1) (2*s0.total)
    (mul_nonneg (by norm_num) s0.total_nonneg) (fun z=>(longWitnessWeight_bounds s0 Γ p threshold z).2)
    (longWitnessWeight_root_separated s0 Γ p threshold)
  dsimp only at hh ⊢
  rwa [long_prefix_original_unit_mean s mask hm Γ B K ρ p threshold k hk,
    long_prefix_original_coarse_mean s mask hm Γ B K ρ p threshold k hk,
    long_prefix_original_coarse_pair_eq s mask hm Γ B K ρ p threshold k hk] at hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.long_prefix_original_coarse_pair_eq
#print axioms NoThreeLine.BirthWitness.long_prefix_witnessPower_coarse
#print axioms NoThreeLine.BirthWitness.long_prefix_witnessPower_separated
