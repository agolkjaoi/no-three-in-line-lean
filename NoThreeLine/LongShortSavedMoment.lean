import NoThreeLine.ScheduledStarDeadlineMoment
import NoThreeLine.LongLineDeadlineTail
import NoThreeLine.JointMomentRoot

/-! Joint high moment of the actual saved long witness and the actual
late short-star path through the root's deadline prefix. The physical
phase array and terminal point law remain the original full schedule. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars FiniteMomentIntegral

def jointLongShortCoefficient (ζ : ℝ) (m n : ℕ) : ℝ :=
  max (positiveMomentRoot (m+2) (1/(1-(n:ℝ)^(-ζ))^(m+3).choose 2))
    (positiveMomentRoot (m+2) (starEtaMultiplier ζ (m+2) n))

theorem longSaved_add_prefixLate_moment (ξ : ℝ) (hξ : 0<ξ)
    {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ δ d γ ζ T M : ℝ) (p : Grid n) (H : ℝ)
    (hn : 2≤n) (hB : 1≤B) (hH : 0≤H) (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (k : ℕ) (hk : k≤J) (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) (m : ℕ) (hm : 1≤m) :
    let cs := scheduleSharedPhases s mask hmask Γ B K ρ
    let s0 := s.prefix k hk
    let m0 := prefixMask hk mask
    let h0 := prefixMask_bounds hk mask hmask
    let e := longWitnessRetention s0 m0 h0 Γ p H
    let w := longWitnessWeight s0 Γ p H
    let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p H z
    let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*A
    let P := pairWeight (specifiedDistinctPair Γ) w
      (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
    let W := 2*scheduleProcessDeadline s mask p
    let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
    (∫ω,(witnessSum w (initialRootPhaseWitness cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p
        (by omega : 0<n) hB e J ω)+
      scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
        (by omega : 0<n) hB Γ p H ((n:ℝ)^(γ-1)) k ω)^(m+2)
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB p J)≤
    (jointLongShortCoefficient ζ m n*Q+
      positiveMomentRoot (m+2) (separatedMomentError m A C W P ((n:ℝ)^(-ζ)))+
      positiveMomentRoot (m+2)
        (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)*
        (T^2*Real.log n))^(m+2) := by
  classical
  let cs := scheduleSharedPhases s mask hmask Γ B K ρ
  let s0 := s.prefix k hk
  let m0 := prefixMask hk mask
  let h0 := prefixMask_bounds hk mask hmask
  let e := longWitnessRetention s0 m0 h0 Γ p H
  let w := longWitnessWeight s0 Γ p H
  let ε := (n:ℝ)^(-ζ)
  let τ := (n:ℝ)^(γ-1)
  let μ := phasePointMeasure cs ε M (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB p J
  let X := fun ω=>witnessSum w (initialRootPhaseWitness cs ε M (scheduleProcessDeadline s mask) 0 p
    (by omega : 0<n) hB e J ω)
  let Y := scheduledStarCanonicalLatePath cs ε M (scheduleProcessDeadline s mask) 0
    (by omega : 0<n) hB Γ p H τ k
  let A := ∑z : Grid n,longBirthPrice s0 m0 Γ p H z
  let C := max 1 (AuxiliaryODE.protection 1 K)^Γ.card*A
  let P := pairWeight (specifiedDistinctPair Γ) w
    (accumulatedPhaseCoarsePrice (scheduleSharedPhases s0 m0 h0 Γ B K ρ) 0 e k)
  let W := 2*scheduleProcessDeadline s mask p
  let D := starLatePrice cs Γ p H k (fun N=>latePhaseStart cs τ N) (fun N=>(cs N).horizon)/n
  let Q := normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) (scheduleProcessDeadline s mask p))
  let a := positiveMomentRoot (m+2) (1/(1-ε)^(m+3).choose 2)
  let b := positiveMomentRoot (m+2) (starEtaMultiplier ζ (m+2) n)
  let E := positiveMomentRoot (m+2) (separatedMomentError m A C W P ε)
  let L := positiveMomentRoot (m+2)
    (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)*(T^2*Real.log n)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M (scheduleProcessDeadline s mask) 0
    (by omega : 0<n) hB p J
  have hw (q : Grid n) : 0≤w q := (longWitnessWeight_bounds s0 Γ p H q).1
  have hXm : Measurable X := Finset.measurable_sum _ (fun q _=>
    (((measurable_pi_apply q).comp (WitnessState.measurable_retained n)).comp
      (initialRootPhaseWitness_measurable cs ε M (scheduleProcessDeadline s mask) 0 p
        (by omega : 0<n) hB e J)).const_mul (w q))
  have hYm : Measurable Y := scheduledStarCanonicalLatePath_measurable cs ε M (scheduleProcessDeadline s mask) 0
    (by omega : 0<n) hB Γ p H τ k
  have hXb (ω) : 0≤X ω ∧ X ω≤∑q,w q := initial_rootPhasePoint_witnessSum_bounds cs ε M
    (scheduleProcessDeadline s mask) 0 p (by omega : 0<n) hB e w hw J ω
  have hYb (ω) : 0≤Y ω ∧ Y ω≤canonicalLateCap cs Γ p H τ k := scheduledStarCanonicalLatePath_bounds cs ε M
    (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB Γ p H τ k ω
  have hA : 0≤A := Finset.sum_nonneg (fun z _=>(longBirthPrice_bounds s0 m0 h0 Γ p H z).1)
  have hD : 0≤D := div_nonneg (starLatePrice_nonneg cs Γ p H k _ _ (fun N=>latePhaseStart_nonneg cs τ N))
    (Nat.cast_nonneg n)
  have hQ : A+D≤Q := long_prefix_mean_add_starLatePrice_le_deadline_pairSum s mask hmask Γ p H B K ρ τ k hk hdeadline
  have hL : 0≤L := mul_nonneg (positiveMomentRoot_nonneg _ _)
    (mul_nonneg (sq_nonneg _) (FiniteWitnessMoments.log_nat_pos hn).le)
  have he0 : 0≤ε := Real.rpow_nonneg (Nat.cast_nonneg n) _
  have he1 : ε<1 := Real.rpow_lt_one_of_one_lt_of_neg
    (by exact_mod_cast (show 1<n by omega)) (neg_neg_of_pos hζ)
  have hXM : (∫ω,X ω^(m+2) ∂μ)≤(a*A+E)^(m+2) := by
    have hh := long_deadline_full_witnessPower_separated s mask hmask Γ B K ρ ε M p H
      (by omega : 0<n) hB hK2 hp he0 he1 k hk hdeadline m
    exact hh.trans (separatedMomentBound_le_roots m A C W P ε hA)
  have hΓ (j : ℕ) : (cs j).directions=Γ := scheduleSharedPhases_directions s mask hmask Γ B K ρ j
  have hK (j : ℕ) : (cs j).K≤K := by dsimp [cs,scheduleSharedPhases]; split <;> exact le_rfl
  have hρ (j : ℕ) : ρ≤(cs j).rho := by dsimp [cs,scheduleSharedPhases]; split <;> exact le_rfl
  have hdeadline' : scheduleProcessDeadline s mask p≤phaseEndpoint cs 0 k :=
    schedule_prefix_deadline_reached s mask hmask Γ B K ρ p k hk hdeadline
  have hTk : phaseEndpoint cs 0 k-0≤T := by
    rw [sub_zero,scheduleSharedPhases_endpoint s mask hmask Γ B K ρ k hk,←s.prefix_total k hk,hdeadline]
    exact hT
  have hYM : (∫ω,Y ω^(m+2) ∂μ)≤(b*D+L)^(m+2) :=
    scheduledStarCanonicalLatePath_deadline_log_moment ξ hξ cs M (scheduleProcessDeadline s mask) 0 K ρ δ d γ ζ T p hn hB Γ H hH
      hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ k J (m+2) hk (by omega) hdeadline' hTk
  exact add_moment_common_budget μ X Y hXm hYm (∑q,w q) (canonicalLateCap cs Γ p H τ k)
    hXb hYb (Finset.sum_nonneg (fun q _=>hw q))
    (canonicalLateCap_nonneg cs (zero_le_one.trans hB) Γ p H τ k)
    a b A D E L Q (positiveMomentRoot_nonneg _ _) (positiveMomentRoot_nonneg _ _) hA hD
    (positiveMomentRoot_nonneg _ _) hL hQ (m+2) (by omega) hXM hYM

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longSaved_add_prefixLate_moment
