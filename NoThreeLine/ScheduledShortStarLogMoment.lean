import NoThreeLine.ShortStarLogError

/-! The actual masked cut-law high-degree moment in the manuscript's
elapsed*n*log n normalization. Both displayed deterministic coefficients
have proved limits: the main multiplier tends to one, the error to zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness AuxiliaryODE MixedConnection

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem initial_scheduledCutPoint_maskedIntensity_log_bound (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (hτγ : (n:ℝ)^(γ-1)≤phaseEndpoint cs start k-start+t)
    (hτT : phaseEndpoint cs start k-start+t≤T) (m : ℕ) (hm : 3≤m) :
    (∫ω,(weightedStarIntensity Γ p H (fun s=>(cs k).mask s.val.1)
      (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))^m
      ∂scheduledCutPointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p k t)≤
      starEtaMultiplier ζ m n*(maskedCutStarPriceSum Γ p H cs k t)^m+
      starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n*
        ((phaseEndpoint cs start k-start+t)*(n:ℝ)*Real.log n)^m := by
  have h := initial_scheduledCutPoint_maskedIntensity_asymptotic_bound ξ hξ cs M deadline
    start K ρ δ d γ ζ T p hn hB Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK
    hHlog hBd hd hζ k t ht hτγ hτT m hm
  rw [starError_mul_one_add_log_eq ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T
    (phaseEndpoint cs start k-start+t) m n hn] at h
  exact h

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_maskedIntensity_log_bound
