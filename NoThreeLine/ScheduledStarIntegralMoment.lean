import NoThreeLine.ScheduledStarIntegratedPower
import NoThreeLine.BoundedMomentIntegral
import NoThreeLine.MomentEnvelopeRoot

/-! The high moment of the actual time-integrated current-mask intensity
on a deterministic admissible phase subinterval, under the same full-J
point law. The main row is integrated with coefficient tending to one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarIntegral_future_log_moment (ξ : ℝ) (hξ : 0<ξ)
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
    (∫ω,(∫t in Ioo a b,weightedStarIntensity Γ p H (fun s=>(cs N).mask s.val.1)
      (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
        (initialGoodPhaseObservation B hB deadline start) N (ω,t)))^m
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*(∫t in Ioo a b,maskedCutStarPriceSum Γ p H cs N t)+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        (∫t in Ioo a b,(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n))^m := by
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J
  let ν : Measure ℝ := volume.restrict (Ioo a b)
  let w : ↥(shortStars Γ p H)→ℝ := fun s=>(cs N).mask s.val.1
  have hw (s) : 0≤w s ∧ w s≤1 := ⟨(cs N).mask_nonneg s.val.1,(cs N).mask_le_one s.val.1⟩
  let X := fun x : BoardClockPath n×ℝ=>weightedStarIntensity Γ p H w
    (scheduledCutWitness cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n)
      (initialGoodPhaseObservation B hB deadline start) N x)
  have hX : Measurable X := (weightedStarIntensity_measurable Γ p H w).comp
    (scheduledCutWitness_measurable cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n) _ N)
  have hXb (x) : 0≤X x ∧ X x≤((shortStars Γ p H).card:ℝ)*B :=
    weightedStarIntensity_bounds Γ p H w hw _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ((n:ℝ)^(-ζ)) M deadline start (unitBirthRetention n) (by omega : 0<n) _ N x)
  let A := starEtaMultiplier ζ m n
  let E := starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n
  let D := maskedCutStarPriceSum Γ p H cs N
  let Q := fun t : ℝ=>(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n
  let U := fun t : ℝ=>positiveMomentRoot m A*max 0 (D t)+positiveMomentRoot m E*max 0 (Q t)
  have hD : Continuous D := maskedCutStarPriceSum_continuous Γ p H cs N
  have hQ : Continuous Q := by unfold Q; fun_prop
  have hU : Continuous U := ((continuous_const.max hD).const_mul _).add
    ((continuous_const.max hQ).const_mul _)
  have hUi : Integrable U ν := hU.continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  have hUb (t) : 0≤U t := add_nonneg
    (mul_nonneg (positiveMomentRoot_nonneg _ _) (le_max_left _ _))
    (mul_nonneg (positiveMomentRoot_nonneg _ _) (le_max_left _ _))
  have hDQ (t) (ht : t∈Ioo a b) : 0≤D t ∧ 0≤Q t := by
    have ht0 : 0≤t := ha.trans ht.1.le
    have hτ := hτγ.trans (add_le_add le_rfl ht.1.le)
    have hτ0 : 0≤phaseEndpoint cs start N-start+t :=
      (Real.rpow_nonneg (Nat.cast_nonneg n) (γ-1)).trans hτ
    constructor
    · exact Finset.sum_nonneg (fun s _=>mul_nonneg ((cs N).mask_nonneg s.1)
        (cutUnitPrice_nonneg cs N t ht0 s.2))
    · exact mul_nonneg (mul_nonneg hτ0 (Nat.cast_nonneg n)) (FiniteWitnessMoments.log_nat_pos hn).le
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB p J
  have hmoment : ∀ᵐt ∂ν,(∫ω,X (ω,t)^m ∂μ)≤U t^m := by
    have he := scheduledStarPower_future_log_bound_ae ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
      Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ N J m hNJ hm
    filter_upwards [ae_restrict_of_ae he,ae_restrict_mem measurableSet_Ioo] with t htower ht
    have he' := htower ⟨ha.trans_lt ht.1,ht.2.trans_le hb⟩ (hτγ.trans (add_le_add le_rfl ht.1.le))
      ((add_le_add (le_refl (phaseEndpoint cs start N-start)) ht.2.le).trans hτT)
    have h := he'.trans (momentEnvelope_le_root_sum m (by omega) A E (D t) (Q t)
      (hDQ t ht).1 (hDQ t ht).2)
    simpa only [U,max_eq_right (hDQ t ht).1,max_eq_right (hDQ t ht).2] using h
  have hmain := bounded_moment_integral μ ν X hX (((shortStars Γ p H).card:ℝ)*B)
    (mul_nonneg (Nat.cast_nonneg _) (zero_le_one.trans hB)) hXb U hUb hUi m (by omega) hmoment
  have hDi : Integrable D ν := hD.continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  have hQi : Integrable Q ν := hQ.continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  have he : (∫t,U t ∂ν)=positiveMomentRoot m A*(∫t,D t ∂ν)+positiveMomentRoot m E*(∫t,Q t ∂ν) := by
    calc
      _ = ∫t,(positiveMomentRoot m A*D t+positiveMomentRoot m E*Q t) ∂ν := by
        apply integral_congr_ae
        filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
        simp only [U,max_eq_right (hDQ t ht).1,max_eq_right (hDQ t ht).2]
      _ = _ := by rw [integral_add (hDi.const_mul _) (hQi.const_mul _),integral_const_mul,integral_const_mul]
  rw [he] at hmain
  exact hmain

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarIntegral_future_log_moment
