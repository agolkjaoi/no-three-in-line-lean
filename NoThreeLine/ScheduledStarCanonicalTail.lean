import NoThreeLine.ScheduledStarCanonicalMoment

/-! Markov for the canonically cut, normalized late intensity. The 1/n
normalization is included in the observable, not absorbed into a premise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] scheduledStarPhasePath

theorem scheduledStarCanonicalLatePath_tail_le_moment {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H τ : ℝ)
    (J m : ℕ) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ J ω}≤
    (∫ω,(scheduledStarCanonicalLatePath cs ε M deadline start hn hB Γ p H τ J ω)^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/r^m := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  let Y := fun N : Fin J=>scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N
    (latePhaseStart cs τ N) (cs N).horizon
  let F := fun N : Fin J=>(volume.restrict (Ioo (latePhaseStart cs τ N) (cs N).horizon)).real univ*
    (((shortStars Γ p H).card:ℝ)*B)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hN : 0≤(n:ℝ) := Nat.cast_nonneg n
  have hYb (N) (ω) : 0≤Y N ω ∧ Y N ω≤F N :=
    scheduledStarPhasePath_bounds cs ε M deadline start hn hB Γ p H N _ _ ω
  have h := finite_sum_tail_le_moment μ (fun N ω=>Y N ω/n)
    (fun N=>(scheduledStarPhasePath_measurable cs ε M deadline start hn hB Γ p H N _ _).div_const n)
    (fun N=>F N/n)
    (fun _=>div_nonneg (mul_nonneg ENNReal.toReal_nonneg
      (mul_nonneg (Nat.cast_nonneg _) (zero_le_one.trans hB))) hN)
    (fun N ω=>⟨div_nonneg (hYb N ω).1 hN,div_le_div_of_nonneg_right (hYb N ω).2 hN⟩) m r hr
  simpa only [scheduledStarCanonicalLatePath,scheduledStarLatePath,Finset.sum_div,Y] using h

theorem scheduledStarCanonicalLatePath_log_tail (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (J m : ℕ) (hm : 3≤m) (hT : phaseEndpoint cs start J-start≤T) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J).real
      {ω | r≤scheduledStarCanonicalLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H
        ((n:ℝ)^(γ-1)) J ω}≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*
        (starLatePrice cs Γ p H J (fun N=>latePhaseStart cs ((n:ℝ)^(γ-1)) N) (fun N=>(cs N).horizon)/n)+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        (T^2*Real.log n))^m/r^m := by
  have htail := scheduledStarCanonicalLatePath_tail_le_moment cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H ((n:ℝ)^(γ-1)) J m r hr
  have hmoment := scheduledStarCanonicalLatePath_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ J m hm hT
  exact htail.trans (div_le_div_of_nonneg_right hmoment (pow_nonneg hr.le m))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_tail_le_moment
#print axioms NoThreeLine.ShortStars.scheduledStarCanonicalLatePath_log_tail
