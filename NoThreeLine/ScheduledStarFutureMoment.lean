import NoThreeLine.ScheduledStarFutureTower
import NoThreeLine.ScheduledShortStarLogMoment

/-! The masked high-degree short-star moment under one fixed full-J point
law. The local cut is the actual inherited cut, and the elapsed-time lower
bound is retained inside the a.e.-time statement. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarPower_future_log_bound_ae (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (N J m : ℕ) (hNJ : N<J) (hm : 3≤m) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo (0:ℝ) (cs N).horizon,
    (n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+t →
    phaseEndpoint cs start N-start+t≤T →
    (∫ω,(weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
      (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)))^m
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
      starEtaMultiplier ζ m n*(maskedCutStarPriceSum Γ p H cs N t)^m+
      starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n*
        ((phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)^m := by
  have he := scheduledCutStarPower_terminal_mean_ae cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H (fun s=>(cs N).mask s.val.1)
    (fun s=>⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩) m N J hNJ
  filter_upwards [he] with t htower
  intro ht hτγ hτT
  rw [htower ht]
  exact initial_scheduledCutPoint_maskedIntensity_log_bound ξ hξ cs M deadline
    start K ρ δ d γ ζ T p hn hB Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK
    hHlog hBd hd hζ N t ⟨ht.1.le,ht.2.le⟩ hτγ hτT m hm

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarPower_future_log_bound_ae
