import NoThreeLine.LongMeanCoarseLog
import NoThreeLine.SeparatedErrorDecay
import NoThreeLine.LongLineLogTail

/-! The actual long remainder is controlled using real line lengths and
the proved off-root-line G3 bound. No angular certificate is assumed. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped BigOperators Topology

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteWitnessMoments FiniteMomentIntegral

def longPrefixMomentError {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint) (B K ρ ε : ℝ)
    (p : Grid n) (H : ℝ) (k : ℕ) (hk : k≤J) (m : ℕ) : ℝ :=
  let s0 := s.prefix k hk
  let m0 := prefixMask hk mask
  let h0 := prefixMask_bounds hk mask hm
  let e := longWitnessRetention s0 m0 h0 Γ p H
  let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p H z
  let P := pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p H)
    (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
  separatedMomentError m A (longSourceMultiplier Γ K*A) (2*scheduleProcessDeadline s mask p) P ε

def longRootErrorCoefficient (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ) (ζ : ℝ)
    (m n : ℕ) : ℝ :=
  positiveMomentRoot (m+2) (longLogErrorEnvelope m (16*T^2) (longSourceMultiplier Γ K) (2*T)
    (longPairLogCoefficient Γ K T ξ hξ) ξ ζ n)/Real.log n

theorem positiveMomentRoot_mono (m : ℕ) {a b : ℝ} (hab : a≤b) :
    positiveMomentRoot m a≤positiveMomentRoot m b :=
  Real.rpow_le_rpow (le_max_left _ _) (max_le_max_left 0 hab) (inv_nonneg.mpr (Nat.cast_nonneg m))

theorem long_prefix_pair_le_fixed_logBudget {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ T : ℝ) (p : Grid n) (H ξ : ℝ) (hξ : 0<ξ)
    (k : ℕ) (hk : k≤J) (hn : 2≤n) (hT : (s.prefix k hk).total≤T) :
    let s0 := s.prefix k hk
    let m0 := prefixMask hk mask
    let h0 := prefixMask_bounds hk mask hm
    let e := longWitnessRetention s0 m0 h0 Γ p H
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p H)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)≤
        logPairBudget (longPairLogCoefficient Γ K T ξ hξ) ξ n := by
  dsimp only
  have hh := (long_schedule_coarse_pair_le_const_rpow_log ξ hξ).choose_spec.2 k n
    (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hm) Γ B K ρ p H
  have hC := (longPairGeometryConstant_pos ξ hξ).le
  have hnlog : 0≤Real.log (n:ℝ) := (log_nat_pos hn).le
  have hp := Real.rpow_nonneg (Nat.cast_nonneg n) (ξ-1)
  change _≤longPairGeometryConstant ξ hξ*(longSourceMultiplier Γ K)^2*(Γ.card : ℝ)*
    (s.prefix k hk).total^4*(n:ℝ)^(ξ-1)*(1+Real.log (n:ℝ)) at hh
  apply hh.trans
  unfold logPairBudget longPairLogCoefficient
  gcongr
  exact (s.prefix k hk).total_nonneg

theorem longPrefixMomentError_le_logEnvelope {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ T ξ ζ : ℝ) (hξ : 0<ξ) (hζ : 0<ζ)
    (p : Grid n) (H : ℝ) (k : ℕ) (hk : k≤J) (m : ℕ) (hn : 2≤n)
    (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) :
    longPrefixMomentError s mask hm Γ B K ρ ((n:ℝ)^(-ζ)) p H k hk m≤
      longLogErrorEnvelope m (16*T^2) (longSourceMultiplier Γ K) (2*T)
        (longPairLogCoefficient Γ K T ξ hξ) ξ ζ n := by
  let s0 := s.prefix k hk
  let m0 := prefixMask hk mask
  let h0 := prefixMask_bounds hk mask hm
  let e := longWitnessRetention s0 m0 h0 Γ p H
  let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p H z
  let P := pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p H)
    (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
  have hT0 : s0.total≤T := hdeadline.trans_le hT
  have hA : 0≤A := Finset.sum_nonneg (fun z _=>(longBirthPrice_bounds s0 m0 h0 Γ p H z).1)
  have hF : 0≤longSourceMultiplier Γ K := pow_nonneg (zero_le_one.trans (le_max_left _ _)) _
  have hW : 0≤2*scheduleProcessDeadline s mask p :=
    mul_nonneg (by norm_num) (s.deadline_nonneg (fun j=>mask j p))
  have hP : 0≤P := pairWeight_nonneg _ _ _ (fun z=>(longWitnessWeight_bounds s0 Γ p H z).1)
    (accumulatedPhaseCoarsePrice_nonneg _ _ _ _)
  have he1 : (n:ℝ)^(-ζ)<1 := Real.rpow_lt_one_of_one_lt_of_neg
    (by exact_mod_cast (show 1<n by omega)) (neg_neg_of_pos hζ)
  have hAA : A≤(16*T^2)*(1+Real.log n) := longBirthMean_le_coarse_log_of_total_le s0 m0 h0 Γ p H T hT0
  exact separatedMomentError_mono m A (longSourceMultiplier Γ K*A) (2*scheduleProcessDeadline s mask p) P
    ((16*T^2)*(1+Real.log n)) (longSourceMultiplier Γ K*((16*T^2)*(1+Real.log n))) (2*T)
    (logPairBudget (longPairLogCoefficient Γ K T ξ hξ) ξ n) ((n:ℝ)^(-ζ))
    hA (mul_nonneg hF hA) hW hP he1.le hAA (mul_le_mul_of_nonneg_left hAA hF)
    (mul_le_mul_of_nonneg_left hT (by norm_num))
    (long_prefix_pair_le_fixed_logBudget s mask hm Γ B K ρ T p H ξ hξ k hk hn hT0)

theorem longPrefixMomentError_root_div_log_le {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ T ξ ζ : ℝ) (hξ : 0<ξ) (hζ : 0<ζ)
    (p : Grid n) (H : ℝ) (k : ℕ) (hk : k≤J) (m : ℕ) (hn : 2≤n)
    (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) :
    positiveMomentRoot (m+2) (longPrefixMomentError s mask hm Γ B K ρ ((n:ℝ)^(-ζ)) p H k hk m)/Real.log n≤
      longRootErrorCoefficient Γ K T ξ hξ ζ m n :=
  div_le_div_of_nonneg_right (positiveMomentRoot_mono _
    (longPrefixMomentError_le_logEnvelope s mask hm Γ B K ρ T ξ ζ hξ hζ p H k hk m hn hdeadline hT))
      (log_nat_pos hn).le

theorem tendsto_longRootErrorCoefficient (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ) (ζ : ℝ)
    (m : ℕ) (hξ1 : ξ<1) (hζ : 0<ζ) :
    Tendsto (longRootErrorCoefficient Γ K T ξ hξ ζ m) atTop (𝓝 0) :=
  tendsto_longLogError_root_div_log m (16*T^2) (longSourceMultiplier Γ K) (2*T)
    (longPairLogCoefficient Γ K T ξ hξ) ξ ζ hξ1 hζ

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.long_prefix_pair_le_fixed_logBudget
#print axioms NoThreeLine.BirthWitness.longPrefixMomentError_le_logEnvelope
#print axioms NoThreeLine.BirthWitness.longPrefixMomentError_root_div_log_le
#print axioms NoThreeLine.BirthWitness.tendsto_longRootErrorCoefficient
