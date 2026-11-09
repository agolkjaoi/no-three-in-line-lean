import NoThreeLine.ScheduledStarIntegralMoment
import NoThreeLine.BoundedIntegralTail

/-! High-degree Markov for the actual phase-subinterval integral of the
current-mask short-star intensity, under one full-J point law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarIntegral_future_log_tail (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (N J m : ℕ) (hNJ : N<J) (hm : 3≤m)
    (a b : ℝ) (ha : 0≤a) (hb : b≤(cs N).horizon)
    (hτγ : (n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+a)
    (hτT : phaseEndpoint cs start N-start+b≤T) (r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J).real
      {ω | r≤∫t in Ioo a b,weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
        (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
          (initialGoodPhaseObservation B hB deadline start) N (ω,t))}≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*(∫t in Ioo a b,maskedCutStarPriceSum Γ p H cs N t)+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        (∫t in Ioo a b,(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n))^m/r^m := by
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J
  let ν : Measure ℝ := volume.restrict (Ioo a b)
  let w : ↥(shortStars Γ p H)→ℝ := fun s=>(cs N).mask s.val.1
  let X := fun x : BoardClockPath n×ℝ=>weightedStarIntensity Γ p H w
    (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
      (initialGoodPhaseObservation B hB deadline start) N x)
  have hX : Measurable X := (weightedStarIntensity_measurable Γ p H w).comp
    (scheduledCutWitness_measurable cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n) _ N)
  have hXb (x) : 0≤X x ∧ X x≤((shortStars Γ p H).card:ℝ)*B :=
    weightedStarIntensity_bounds Γ p H w
      (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n) _ N x)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB p J
  have htail := bounded_integral_tail_le_moment μ ν X hX (((shortStars Γ p H).card:ℝ)*B) hXb m r hr
  have hmoment := scheduledStarIntegral_future_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ N J m hNJ hm a b ha hb hτγ hτT
  exact htail.trans (div_le_div_of_nonneg_right hmoment (pow_nonneg hr.le m))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarIntegral_future_log_tail
