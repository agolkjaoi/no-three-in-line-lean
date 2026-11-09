import NoThreeLine.ScheduledCutExtraProduct

/-! The finite candidate union for an additional actual selected point
has an actual cut expected weighted sum. Every new point pays one price. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

-- Prevent type comparison from expanding the completed-process Nat.find.
attribute [local irreducible] tupleExtraProduct scheduledCutWitness

theorem initial_scheduledCutPoint_extra_candidate_sum_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H R : ℝ) (hR : 0≤R)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m : ℕ) :
    (∫ω,(∑fv∈extraCandidates Γ p H R m,tupleExtraProduct fv.1 fv.2
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      extraCoarseCost δ ε m*(((m*(m-1) : ℕ) : ℝ)*
        (((shortStars Γ p H).card : ℝ)^2*R*((shortStars Γ p H).card : ℝ)^(m-2))*
          (coarseCutPriceCap cs k t)^(m+1)) := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)
  change (∫ω,(∑fv∈extraCandidates Γ p H R m,tupleExtraProduct fv.1 fv.2 (W ω)) ∂ν)≤_
  rw [integral_finsetSum _ (fun fv _=>tupleExtraProduct_integrable fv.1 fv.2 B (zero_le_one.trans hB) ν W hW hv)]
  calc
    _ ≤ ∑_fv∈extraCandidates Γ p H R m,extraCoarseCost δ ε m*(coarseCutPriceCap cs k t)^(m+1) := by
      apply Finset.sum_le_sum
      intro fv hfv
      have h := (Finset.mem_filter.mp hfv).2
      exact initial_scheduledCutPoint_extra_product_bound cs ε M deadline start K ρ δ p hn hB Γ
        hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht fv.1 h.1 fv.2 h.2.1
    _ = extraCoarseCost δ ε m*
        (((extraCandidates Γ p H R m).card : ℝ)*(coarseCutPriceCap cs k t)^(m+1)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
      ring
    _ ≤ _ := mul_le_mul_of_nonneg_left (mul_le_mul_of_nonneg_right
      (extraCandidates_card_le Γ p H R hR m) (pow_nonneg (coarseCutPriceCap_nonneg cs k t ht.1) _))
      (extraCoarseCost_nonneg δ ε hδ.le hε.le m)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_extra_candidate_sum_bound
