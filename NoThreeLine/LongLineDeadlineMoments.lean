import NoThreeLine.RootDeadlineStability

/-! Root-deadline-truncated long retention under the actual full-schedule
terminal point measure. Physical deadlines of every point are the originals.
The root's full saved snapshot and point density equal those at its deadline
prefix, by the actual deadline and permanent-closure proofs. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments

theorem schedule_prefix_deadline_reached {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) :
    scheduleProcessDeadline s mask p≤phaseEndpoint (scheduleSharedPhases s mask hm Γ B K ρ) 0 k := by
  rw [scheduleSharedPhases_endpoint s mask hm Γ B K ρ k hk,←s.prefix_total k hk,hT]

theorem long_deadline_full_witnessPower_coarse {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) (m : ℕ) :
    let s0 := s.prefix k hk
    let m0 := FinitePhase.prefixMask hk mask
    let h0 := FinitePhase.prefixMask_bounds hk mask hm
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*(∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z)
    let W := 2*scheduleProcessDeadline s mask p
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)^m
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J)≤
      (C^m+(m:ℝ)^2*W*(C+(m:ℝ)*W)^(m-1))/(1-ε)^(m+1).choose 2 := by
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let e := longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ p threshold
  have hd := schedule_prefix_deadline_reached s mask hm Γ B K ρ p k hk hT
  have hh := long_prefix_witnessPower_coarse s mask hm Γ B K ρ ε M p threshold hn hB hK hp hε0 hε k hk m
  dsimp only at hh ⊢
  rw [phasePointMeasure_deadline_stable cs ε M (scheduleProcessDeadline s mask) 0 p hn hB k J hk hd]
  have hs : initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J =
      initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k :=
    funext (initialRootPhaseWitness_deadline_stable cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k J hk hd)
  rw [hs]
  simpa only [hT] using hh

theorem long_deadline_full_witnessPower_separated {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ ε M : ℝ) (p : Grid n) (threshold : ℝ) (hn : 0<n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (hk : k≤J)
    (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p) (m : ℕ) :
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
    let W := 2*scheduleProcessDeadline s mask p
    (∫ω,witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J ω)^(m+2)
      ∂phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn hB p J)≤
      (A^(m+2)+((m+2:ℕ):ℝ)^2*W*(A+((m+2:ℕ):ℝ)*W)^(m+1)+
        ((m+2:ℕ):ℝ)^2*P*(C+((m+2:ℕ):ℝ)*W)^m)/(1-ε)^(m+3).choose 2 := by
  let cs := scheduleSharedPhases s mask hm Γ B K ρ
  let e := longWitnessRetention (s.prefix k hk) (FinitePhase.prefixMask hk mask) (FinitePhase.prefixMask_bounds hk mask hm) Γ p threshold
  have hd := schedule_prefix_deadline_reached s mask hm Γ B K ρ p k hk hT
  have hh := long_prefix_witnessPower_separated s mask hm Γ B K ρ ε M p threshold hn hB hK hp hε0 hε k hk m
  dsimp only at hh ⊢
  rw [phasePointMeasure_deadline_stable cs ε M (scheduleProcessDeadline s mask) 0 p hn hB k J hk hd]
  have hs : initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e J =
      initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k :=
    funext (initialRootPhaseWitness_deadline_stable cs ε M (scheduleProcessDeadline s mask) 0 p hn hB e k J hk hd)
  rw [hs]
  simpa only [hT] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.long_deadline_full_witnessPower_coarse
#print axioms NoThreeLine.BirthWitness.long_deadline_full_witnessPower_separated
