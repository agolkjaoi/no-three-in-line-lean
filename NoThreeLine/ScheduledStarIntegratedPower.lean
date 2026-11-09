import NoThreeLine.ScheduledStarPowerFubini
import NoThreeLine.ScheduledStarFutureMoment

/-! Integrate the proved high-degree moment over a deterministic subinterval
of one phase, under a single full-J point law. This is the expectation of
the integral of X^m; it is not yet a moment of the integral of X. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem maskedCutStarPriceSum_continuous {n : ℕ} {B : ℝ}
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (cs : ℕ→SharedPhase n B) (N : ℕ) :
    Continuous (maskedCutStarPriceSum Γ p H cs N) := by
  unfold maskedCutStarPriceSum cutUnitPrice
  fun_prop

theorem scheduledStarPower_future_integral_log_bound (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (N J m : ℕ) (hNJ : N<J) (hm : 3≤m)
    (a b : ℝ) (ha : 0≤a) (hb : b≤(cs N).horizon)
    (hτγ : (n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+a)
    (hτT : phaseEndpoint cs start N-start+b≤T) :
    (∫ω,(∫t in Ioo a b,(weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
      (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)))^m)
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
    starEtaMultiplier ζ m n*(∫t in Ioo a b,(maskedCutStarPriceSum Γ p H cs N t)^m)+
      starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n*
        (∫t in Ioo a b,((phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)^m) := by
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J
  let ν : Measure ℝ := volume.restrict (Ioo a b)
  let w : ↥(shortStars Γ p H)→ℝ := fun s=>(cs N).mask s.val.1
  have hw (s) : 0≤w s ∧ w s≤1 := ⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB p J
  have hi := scheduledStarPower_joint_integrable cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H w hw m N J ν
  have hD : Integrable (fun t=>(maskedCutStarPriceSum Γ p H cs N t)^m) ν :=
    ((maskedCutStarPriceSum_continuous Γ p H cs N).pow m).continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  have hQ : Integrable (fun t=>((phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)^m) ν := by
    have hc : Continuous (fun t : ℝ=>((phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)^m) := by fun_prop
    exact hc.continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  rw [scheduledStarPower_integral_swap cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H w hw m N J ν]
  rw [←integral_const_mul,←integral_const_mul,←integral_add
    (hD.const_mul (starEtaMultiplier ζ m n))
    (hQ.const_mul (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n))]
  apply integral_mono_ae hi.integral_prod_right
    ((hD.const_mul _).add (hQ.const_mul _))
  have he := scheduledStarPower_future_log_bound_ae ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
    Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ N J m hNJ hm
  filter_upwards [ae_restrict_of_ae he,ae_restrict_mem measurableSet_Ioo] with t htower ht
  exact htower ⟨ha.trans_lt ht.1,ht.2.trans_le hb⟩ (hτγ.trans (add_le_add le_rfl ht.1.le))
    ((add_le_add (le_refl (phaseEndpoint cs start N-start)) ht.2.le).trans hτT)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.maskedCutStarPriceSum_continuous
#print axioms NoThreeLine.ShortStars.scheduledStarPower_future_integral_log_bound
