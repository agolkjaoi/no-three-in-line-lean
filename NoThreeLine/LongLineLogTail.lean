import NoThreeLine.LongLineDeadlineTail
import NoThreeLine.LongLineDeadlineMean
import NoThreeLine.LongLinePairError
import NoThreeLine.MomentLogTail

/-! Actual full-schedule root-deadline witness tails enter the logarithmic
scalar envelope. Mean and exceptional-pair budgets are derived from S6 and
the actual off-line geometry, never assumed as moment or mean conclusions.
A uniform numerical bound on the angular coefficient remains a separate input
for an eventual smallness result; none is asserted in this module. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FinitePhase FiniteDirections FiniteWitnessMoments PrimitiveLines

def longPairGeometryConstant (ξ : ℝ) (hξ : 0<ξ) : ℝ :=
  (long_schedule_coarse_pair_le_const_rpow_log ξ hξ).choose

theorem longPairGeometryConstant_pos (ξ : ℝ) (hξ : 0<ξ) : 0<longPairGeometryConstant ξ hξ :=
  (long_schedule_coarse_pair_le_const_rpow_log ξ hξ).choose_spec.1

def longPairLogCoefficient (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ) : ℝ :=
  longPairGeometryConstant ξ hξ*(longSourceMultiplier Γ K)^2*(Γ.card : ℝ)*T^4

def longScheduleSieveRemainder (cells : ℕ) (T : ℝ) : ℝ :=
  ((4*cells+1)*T)^2+5*T*((4*cells+1)*T)+10*T^2+6*25586*(4*(cells : ℝ)+3)*T^2

def longDeadlineMeanCoefficient {J n : ℕ} {ι : Type*} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (p : Grid n) (S : Finset ι) (R : ι→Rect)
    (c : Fin J→ZPoint→ι→ℝ) (V H : Finset ℝ) : ℝ :=
  ((76/125 : ℝ)/24)*typedAngularIntegralSum S R
    (s.prefixWeights c (scheduleProcessDeadline s mask p)) V H p

theorem long_prefix_pair_le_logBudget {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (p : Grid n) (threshold ξ : ℝ) (hξ : 0<ξ)
    (k : ℕ) (hk : k≤J) (hn : 2≤n) :
    let s0 := s.prefix k hk
    let m0 := prefixMask hk mask
    let h0 := prefixMask_bounds hk mask hm
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s0 Γ p threshold)
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)≤
        logPairBudget (longPairLogCoefficient Γ K s.total ξ hξ) ξ n := by
  dsimp only
  have hh := (long_schedule_coarse_pair_le_const_rpow_log ξ hξ).choose_spec.2 k n
    (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hm) Γ B K ρ p threshold
  have hT : (s.prefix k hk).total≤s.total := s.increasing.monotone (Fin.le_last _)
  have hC := (longPairGeometryConstant_pos ξ hξ).le
  have hnlog : 0≤Real.log (n:ℝ) := (log_nat_pos hn).le
  have hp := Real.rpow_nonneg (Nat.cast_nonneg n) (ξ-1)
  change _≤longPairGeometryConstant ξ hξ*(longSourceMultiplier Γ K)^2*(Γ.card : ℝ)*
    (s.prefix k hk).total^4*(n:ℝ)^(ξ-1)*(1+Real.log (n:ℝ)) at hh
  apply hh.trans
  unfold logPairBudget longPairLogCoefficient
  gcongr
  exact (s.prefix k hk).total_nonneg

theorem long_deadline_full_tail_le_logarithmic {J n : ℕ} {ι : Type*} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ M : ℝ) (p : Grid n) (threshold ξ ζ : ℝ)
    (hξ : 0<ξ) (hζ : 0<ζ) (hn : 2≤n) (hB : 1≤B) (hK : K<2)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (k : ℕ) (hk : k≤J) (hT : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (S : Finset ι) (R : ι→Rect) (c : Fin J→ZPoint→ι→ℝ) (V H : Finset ℝ)
    (hdom : ∀j q,mask j q≤maskedTypedBoardWeight S R (c j) V H q)
    (hsep : RectanglesSeparated S R) (hR : ∀i∈S,(R i).InUnitSquare)
    (hc : ∀j r i,i∈S→0≤c j r i ∧ c j r i≤1) (hN : ConcreteSieve.Q≤n)
    (m : ℕ) (r : ℝ) (hr : 0<r) :
    let hn0 : 0<n := lt_of_lt_of_le (by decide : 0<2) hn
    let s0 := s.prefix k hk
    let m0 := prefixMask hk mask
    let h0 := prefixMask_bounds hk mask hm
    let e := longWitnessRetention s0 m0 h0 Γ p threshold
    let w := longWitnessWeight s0 Γ p threshold
    let cs := scheduleSharedPhases s mask hm Γ B K ρ
    let ε := (n:ℝ)^(-ζ)
    (phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 hn0 hB p J).real
      {ω | r*Real.log (n:ℝ)≤witnessSum w
        (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p hn0 hB e J ω)}≤
      logarithmicTailEnvelope m (longDeadlineMeanCoefficient s mask p S R c V H)
        (longScheduleSieveRemainder S.card s.total) (longSourceMultiplier Γ K) (2*s.total)
        (longPairLogCoefficient Γ K s.total ξ hξ) ξ ζ r n := by
  let hn0 : 0<n := lt_of_lt_of_le (by decide : 0<2) hn
  let s0 := s.prefix k hk
  let m0 := prefixMask hk mask
  let h0 := prefixMask_bounds hk mask hm
  let e := longWitnessRetention s0 m0 h0 Γ p threshold
  let w := longWitnessWeight s0 Γ p threshold
  let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p threshold z
  let P := pairWeight (specifiedDistinctPair Γ) w
    (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
  let a := longDeadlineMeanCoefficient s mask p S R c V H
  let b := longScheduleSieveRemainder S.card s.total
  let F := longSourceMultiplier Γ K
  let Q := longPairLogCoefficient Γ K s.total ξ hξ
  have he0 : 0≤(n:ℝ)^(-ζ) := Real.rpow_nonneg (Nat.cast_nonneg n) _
  have he1 : (n:ℝ)^(-ζ)<1 := Real.rpow_lt_one_of_one_lt_of_neg
    (by exact_mod_cast (show 1<n by omega)) (neg_neg_of_pos hζ)
  have hA : 0≤A := Finset.sum_nonneg (fun z _=>(longBirthPrice_bounds s0 m0 h0 Γ p threshold z).1)
  have hF : 0≤F := pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _
  have hP : 0≤P := pairWeight_nonneg _ _ _ (fun q=>(longWitnessWeight_bounds s0 Γ p threshold q).1)
    (accumulatedPhaseCoarsePrice_nonneg _ _ _ _)
  have htau := s.deadline_nonneg (fun j=>mask j p)
  have htauT := s.deadline_le_total (fun j=>mask j p)
  have hAA : A≤a*Real.log (n:ℝ)+b := by
    have hh := long_prefix_mean_sieve_upper s mask hm Γ p threshold k hk hT S R c V H hdom hsep hR hc hN
    simpa only [A,a,b,longDeadlineMeanCoefficient,longScheduleSieveRemainder,add_assoc] using hh
  have hCC : F*A≤F*(a*Real.log (n:ℝ)+b) := mul_le_mul_of_nonneg_left hAA hF
  have hPP : P≤logPairBudget Q ξ n := long_prefix_pair_le_logBudget s mask hm Γ B K ρ p threshold ξ hξ k hk hn
  have hs := separatedMomentBound_tail_le_logarithmic m n hn a b F (2*s.total) Q ξ ζ r
    A (F*A) (2*scheduleProcessDeadline s mask p) P hr hA (mul_nonneg hF hA)
    (mul_nonneg (by norm_num) htau) hP he1.le hAA hCC
    (mul_le_mul_of_nonneg_left htauT (by norm_num)) hPP
  have ht := long_deadline_full_witness_tail_separated s mask hm Γ B K ρ ((n:ℝ)^(-ζ)) M p threshold
    hn0 hB hK hp he0 he1 k hk hT m (r*Real.log (n:ℝ)) (mul_pos hr (log_nat_pos hn))
  dsimp only at ht ⊢
  apply ht.trans
  simpa only [A,P,F,Q,a,b,e,w,s0,m0,h0,separatedMomentBound,div_div,longSourceMultiplier] using hs

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.long_prefix_pair_le_logBudget
#print axioms NoThreeLine.BirthWitness.long_deadline_full_tail_le_logarithmic
