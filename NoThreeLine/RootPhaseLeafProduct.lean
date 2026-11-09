import NoThreeLine.RootLeafCredit
import NoThreeLine.RootPhasePointProduct

/-! Actual frozen point-law mixed products with physical leaves. The active
condition on every member of C is kept, including the distinguished root.
Unit prices require the same geometric separation as the source hierarchy. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_rootPhasePoint_corrected_leaf_mean {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (k : ℕ) :
    (∫ω,correctedRootLeafWitness Γ C D L p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)=
      ∫ω,goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂boardClockMeasure n (B/n) := by
  unfold phasePointMeasure
  rw [savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p k)
    (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p k ω).1)]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>by
    change phasePointCredit cs ε M deadline start hn hB p k ω*correctedRootLeafWitness Γ C D L p _=_
    rw [←initial_rootPhaseWitness_credit cs ε M deadline start p hn hB e k ω]
    exact (mixed_rootLeaf_credit Γ C D L p hp _).symm)

theorem initial_rootPhasePoint_leaf_mean_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,rootLeafWitness Γ C D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∫ω,goodPhaseRootMixed p Γ e C D L (rootPhaseRecycledState cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂boardClockMeasure n (B/n))/(1-ε)^L.card.choose 2 := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  let W := rootPhaseWitness cs ε M deadline start p hn e s k
  let ν := phasePointMeasure cs ε M deadline start hn hB p k
  letI : IsProbabilityMeasure ν := phasePointMeasure_probability cs ε M deadline start hn hB p k
  have hv (ω : BoardClockPath n) : (W ω).Valid B := rootPhaseWitness_valid cs ε M deadline start p hn e s k ω
  have hi : Integrable (fun ω=>rootLeafWitness Γ C D p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((rootLeafWitness_measurable Γ C D p).comp (rootPhaseWitness_measurable cs ε M deadline start p hn e s k))
      (rootLeafCap C p B) (fun ω=>rootLeafWitness_bounds Γ C D p _ B (hv ω))
  have hj : Integrable (fun ω=>correctedRootLeafWitness Γ C D L p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((correctedRootLeafWitness_measurable Γ C D L p).comp (rootPhaseWitness_measurable cs ε M deadline start p hn e s k))
      (rootLeafCap C p B) (fun ω=>correctedRootLeafWitness_bounds Γ C D L p _ B (hv ω))
  have hh := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>
    rootLeafWitness_eta_floor Γ C D L p _ B ε (hv ω) hε.le
      (fun a _ b _ hab=>initial_rootPhaseWitness_eta_lower cs ε M deadline start p hn hB e hε0 a b hab k ω))
  rw [integral_const_mul] at hh
  change (1-ε)^L.card.choose 2*(∫ω,rootLeafWitness Γ C D p (W ω) ∂ν)≤
    ∫ω,correctedRootLeafWitness Γ C D L p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k at hh
  rw [initial_rootPhasePoint_corrected_leaf_mean cs ε M deadline start p hn hB e Γ C D L hp k] at hh
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh

theorem initial_rootPhasePoint_leaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,rootLeafWitness Γ C D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseCoarsePrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  apply (initial_rootPhasePoint_leaf_mean_bound cs ε M deadline start p hn hB e Γ C D L hp hε0 hε k).trans
  exact div_le_div_of_nonneg_right (initial_rootPhase_coarse_product cs ε M deadline start p Γ e C D L hn hB hΓ hK
    hCD hCDL k) (pow_nonneg (sub_nonneg.mpr hε.le) _)

theorem initial_rootPhasePoint_leaf_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hsep : SeparatedLabels Γ (C∪D))
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) :
    (∫ω,rootLeafWitness Γ C D p (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)≤
      (∏q∈D,accumulatedPhaseUnitPrice cs start e k q)/(1-ε)^L.card.choose 2 := by
  apply (initial_rootPhasePoint_leaf_mean_bound cs ε M deadline start p hn hB e Γ C D L hp hε0 hε k).trans
  exact div_le_div_of_nonneg_right (initial_rootPhase_unit_product cs ε M deadline start p Γ e C D L hn hB hΓ hK
    hCD hCDL hsep k) (pow_nonneg (sub_nonneg.mpr hε.le) _)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_leaf_coarse_product
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_leaf_unit_product
