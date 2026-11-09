import NoThreeLine.LongShortSavedMoment

/-! Markov for the same actual saved-long plus prefix-late observable.
Both terms use the original full-schedule point measure and deadlines. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines FinitePhase FiniteDirections FiniteWitnessMoments ShortStars FiniteMomentIntegral

theorem saved_add_late_tail_le_moment {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (e : Retention n) (w : Grid n→ℝ) (hw : ∀q,0≤w q) (Γ : Finset ZPoint) (H τ : ℝ)
    (k J m : ℕ) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e J ω)+
        scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k ω}≤
    (∫ω,(witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e J ω)+
        scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k ω)^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/r^m := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  let X := fun ω=>witnessSum w (initialRootPhaseWitness cs ε M deadline start p hn hB e J ω)
  let Y := scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ k
  let F := ∑q,w q
  let G := canonicalLateCap cs Γ p H τ k
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hXm : Measurable X := Finset.measurable_sum _ (fun q _=>
    (((measurable_pi_apply q).comp (WitnessState.measurable_retained n)).comp
      (initialRootPhaseWitness_measurable cs ε M deadline start p hn hB e J)).const_mul (w q))
  have hYm : Measurable Y := scheduledStarCanonicalLatePath_measurable cs ε M deadline start hn hB Γ p H τ k
  have hXb (ω) : 0≤X ω ∧ X ω≤F := initial_rootPhasePoint_witnessSum_bounds cs ε M deadline start p hn hB e w hw J ω
  have hYb (ω) : 0≤Y ω ∧ Y ω≤G := scheduledStarCanonicalLatePath_bounds cs ε M deadline start hn hB Γ p H τ k ω
  have hF : 0≤F := Finset.sum_nonneg (fun q _=>hw q)
  have hG : 0≤G := canonicalLateCap_nonneg cs (zero_le_one.trans hB) Γ p H τ k
  have hh := finite_sum_tail_le_moment μ (fun i : Fin 2=>![X,Y] i)
    (by intro i; fin_cases i <;> simp_all)
    ![F,G] (by intro i; fin_cases i <;> simp_all)
    (by intro i ω; fin_cases i <;> simp_all) m r hr
  simpa only [Fin.sum_univ_two,Matrix.cons_val_zero,Matrix.cons_val_one] using hh

theorem longSaved_add_prefixLate_tail (ξ : ℝ) (hξ : 0<ξ)
    {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hmask : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset ZPoint)
    (B K ρ δ d γ ζ T M : ℝ) (p : Grid n) (H : ℝ)
    (hn : 2≤n) (hB : 1≤B) (hH : 0≤H) (hK0 : 0≤K) (hK2 : K<2) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (hp : ((augInitialState B hB (scheduleProcessDeadline s mask) 0).val.physical.process.accounts p).status=.active)
    (k : ℕ) (hk : k≤J) (hdeadline : (s.prefix k hk).total=scheduleProcessDeadline s mask p)
    (hT : scheduleProcessDeadline s mask p≤T) (m : ℕ) (hm : 1≤m) (r : ℝ) (hr : 0<r) :
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
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 (by omega : 0<n) hB p J).real
      {ω | r≤witnessSum w (initialRootPhaseWitness cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p
          (by omega : 0<n) hB e J ω)+
        scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0
          (by omega : 0<n) hB Γ p H ((n:ℝ)^(γ-1)) k ω}≤
    (jointLongShortCoefficient ζ m n*Q+
      positiveMomentRoot (m+2) (separatedMomentError m A C W P ((n:ℝ)^(-ζ)))+
      positiveMomentRoot (m+2)
        (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T (m+2) n)*
        (T^2*Real.log n))^(m+2)/r^(m+2) := by
  have hh := longSaved_add_prefixLate_moment ξ hξ s mask hmask Γ B K ρ δ d γ ζ T M p H
    hn hB hH hK0 hK2 hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ hp k hk hdeadline hT m hm
  have ht := saved_add_late_tail_le_moment (scheduleSharedPhases s mask hmask Γ B K ρ)
    ((n:ℝ)^(-ζ)) M (scheduleProcessDeadline s mask) 0 p (by omega : 0<n) hB
    (longWitnessRetention (s.prefix k hk) (prefixMask hk mask) (prefixMask_bounds hk mask hmask) Γ p H)
    (longWitnessWeight (s.prefix k hk) Γ p H)
    (fun q=>(longWitnessWeight_bounds (s.prefix k hk) Γ p H q).1) Γ H ((n:ℝ)^(γ-1)) k J (m+2) r hr
  exact ht.trans (div_le_div_of_nonneg_right hh (pow_nonneg hr.le (m+2)))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.saved_add_late_tail_le_moment
#print axioms NoThreeLine.BirthWitness.longSaved_add_prefixLate_tail
