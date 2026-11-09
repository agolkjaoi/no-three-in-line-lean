import NoThreeLine.ScheduledStarLateMoment

/-! High-degree Markov for the actual sum of late phase windows on the
same full-J point law. No phase independence or all-time avoidance premise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] scheduledStarPhasePath

theorem scheduledStarLatePath_tail_le_moment {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (J m : ℕ) (a b : Fin J→ℝ) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤scheduledStarLatePath cs ε M deadline start hn hB Γ p H J a b ω}≤
    (∫ω,(scheduledStarLatePath cs ε M deadline start hn hB Γ p H J a b ω)^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/r^m := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact finite_sum_tail_le_moment μ
    (fun N : Fin J=>scheduledStarPhasePath cs ε M deadline start hn hB Γ p H N (a N) (b N))
    (fun N=>scheduledStarPhasePath_measurable cs ε M deadline start hn hB Γ p H N (a N) (b N))
    (fun N=>(volume.restrict (Ioo (a N) (b N))).real univ*(((shortStars Γ p H).card:ℝ)*B))
    (fun _=>mul_nonneg ENNReal.toReal_nonneg (mul_nonneg (Nat.cast_nonneg _) (zero_le_one.trans hB)))
    (fun N ω=>scheduledStarPhasePath_bounds cs ε M deadline start hn hB Γ p H N (a N) (b N) ω) m r hr

theorem scheduledStarLatePath_log_tail (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (J m : ℕ) (hm : 3≤m) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤(cs N).horizon)
    (hτγ : ∀N : Fin J,(n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+a N)
    (hτT : ∀N : Fin J,phaseEndpoint cs start N-start+b N≤T) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J).real
      {ω | r≤scheduledStarLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H J a b ω}≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*starLatePrice cs Γ p H J a b+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        starLateScale cs start J a b)^m/r^m := by
  have htail := scheduledStarLatePath_tail_le_moment cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H J m a b r hr
  have hmoment := scheduledStarLatePath_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ J m hm a b ha hb hτγ hτT
  exact htail.trans (div_le_div_of_nonneg_right hmoment (pow_nonneg hr.le m))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarLatePath_tail_le_moment
#print axioms NoThreeLine.ShortStars.scheduledStarLatePath_log_tail
