import NoThreeLine.ScheduledStarFutureMarkov

/-! A.e.-time high-degree Markov bound on the same full-J point law.
The deterministic main row keeps the current mask and one source price per
witness. No uniform-in-time event or time-integrated intensity is asserted. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarIntensity_future_log_tail_ae (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (N J m : ℕ) (hNJ : N<J) (hm : 3≤m) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo (0:ℝ) (cs N).horizon,
    (n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+t →
    phaseEndpoint cs start N-start+t≤T → ∀r : ℝ,0<r →
    (phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J).real
      {ω | r≤weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
        (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
          (initialGoodPhaseObservation B hB deadline start) N (ω,t))}≤
    (starEtaMultiplier ζ m n*(maskedCutStarPriceSum Γ p H cs N t)^m+
      starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n*
        ((phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)^m)/r^m := by
  have he := scheduledStarPower_future_log_bound_ae ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ N J m hNJ hm
  filter_upwards [he] with t htower
  intro ht hτγ hτT r hr
  have htail := scheduledStarPower_future_tail_le_moment cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H (fun s=>(cs N).mask s.val.1)
    (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) m N J t r hr
  exact htail.trans (div_le_div_of_nonneg_right (htower ht hτγ hτT) (pow_nonneg hr.le m))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarIntensity_future_log_tail_ae
