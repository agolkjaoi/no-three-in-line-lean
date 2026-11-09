import NoThreeLine.ScheduledStarLatePath
import NoThreeLine.FiniteSumMoment
import NoThreeLine.ShortStarIntegralCoefficients

/-! Finite-phase late-window moment on one full-J point law. The finite
Minkowski step keeps coefficient one and requires no phase independence. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteMomentIntegral

attribute [local irreducible] scheduledCutWitness weightedStarIntensity scheduledStarPhasePath

theorem scheduledStarLatePath_log_moment (ξ : ℝ) (hξ : 0<ξ)
    {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (M : ℝ) (deadline : Grid n→ℝ)
    (start K ρ δ d γ ζ T : ℝ) (p : Grid n) (hn : 2≤n) (hB : 1≤B) (Γ : Finset ZPoint)
    (H : ℝ) (hH : 0≤H) (hΓ : ∀j,(cs j).directions=Γ)
    (hK0 : 0≤K) (hK2 : K<2) (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hHlog : H≤B*(1+Real.log n)) (hBd : B≤(n:ℝ)^d) (hd : d<γ) (hζ : 0<ζ)
    (J m : ℕ) (hm : 3≤m) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤(cs N).horizon)
    (hτγ : ∀N : Fin J,(n:ℝ)^(γ-1)≤phaseEndpoint cs start N-start+a N)
    (hτT : ∀N : Fin J,phaseEndpoint cs start N-start+b N≤T) :
    (∫ω,(scheduledStarLatePath cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H J a b ω)^m
      ∂phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J)≤
    (positiveMomentRoot m (starEtaMultiplier ζ m n)*starLatePrice cs Γ p H J a b+
      positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)*
        starLateScale cs start J a b)^m := by
  let μ := phasePointMeasure cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB p J
  let Y := fun N : Fin J=>scheduledStarPhasePath cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H N (a N) (b N)
  let F := fun N : Fin J=>(volume.restrict (Ioo (a N) (b N))).real univ*(((shortStars Γ p H).card:ℝ)*B)
  let A := positiveMomentRoot m (starEtaMultiplier ζ m n)
  let E := positiveMomentRoot m (starLogErrorEnvelope ξ hξ Γ.card δ (starPriceMultiplier Γ K) d γ ζ T m n)
  let D := fun N : Fin J=>∫t in Ioo (a N) (b N),maskedCutStarPriceSum Γ p H cs N t
  let Q := fun N : Fin J=>∫t in Ioo (a N) (b N),(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n
  let V := fun N : Fin J=>A*D N+E*Q N
  have hY (N) : Measurable (Y N) := scheduledStarPhasePath_measurable cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB Γ p H N (a N) (b N)
  have hF0 (N) : 0≤F N := mul_nonneg ENNReal.toReal_nonneg
    (mul_nonneg (Nat.cast_nonneg _) (zero_le_one.trans hB))
  have hYb (N) (ω) : 0≤Y N ω ∧ Y N ω≤F N :=
    scheduledStarPhasePath_bounds cs ((n:ℝ)^(-ζ)) M deadline start (by omega : 0<n) hB Γ p H N (a N) (b N) ω
  have hD0 (N) : 0≤D N := by
    apply integral_nonneg_of_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    exact Finset.sum_nonneg (fun s _=>mul_nonneg ((cs N).mask_nonneg s.1)
      (cutUnitPrice_nonneg cs N t ((ha N).trans ht.1.le) s.2))
  have hQ0 (N) : 0≤Q N := by
    apply integral_nonneg_of_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    have hτ := (hτγ N).trans (add_le_add le_rfl ht.1.le)
    exact mul_nonneg (mul_nonneg ((Real.rpow_nonneg (Nat.cast_nonneg n) (γ-1)).trans hτ)
      (Nat.cast_nonneg n)) (FiniteWitnessMoments.log_nat_pos hn).le
  have hV (N) : 0≤V N := add_nonneg (mul_nonneg (positiveMomentRoot_nonneg _ _) (hD0 N))
    (mul_nonneg (positiveMomentRoot_nonneg _ _) (hQ0 N))
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ((n:ℝ)^(-ζ)) M deadline start
    (by omega : 0<n) hB p J
  have hM (N : Fin J) : (∫ω,Y N ω^m ∂μ)≤V N^m := by
    simpa only [Y,scheduledStarPhasePath,V,A,E,D,Q] using
      scheduledStarIntegral_future_log_moment ξ hξ cs M deadline start K ρ δ d γ ζ T p hn hB
        Γ H hH hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hHlog hBd hd hζ N J m N.isLt hm
        (a N) (b N) (ha N) (hb N) (hτγ N) (hτT N)
  have hs := finite_sum_moment μ Y hY F hF0 hYb V hV m (by omega) hM
  have he : (∑N : Fin J,V N)=A*starLatePrice cs Γ p H J a b+E*starLateScale cs start J a b := by
    simp only [V,Finset.sum_add_distrib,←Finset.mul_sum,starLatePrice,starLateScale,D,Q]
  rw [he] at hs
  exact hs

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarLatePath_log_moment
