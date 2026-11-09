import NoThreeLine.ScheduledCutEta
import NoThreeLine.RootLeafCredit
import NoThreeLine.ScheduledCutProduct
import NoThreeLine.ScheduledCutCoarseProduct

/-! Physical-leaf products under the actual inherited cut point law. The
current phase contributes its actual partial-time source integral, while
earlier phases keep their accumulated prices and actual birth records. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem initial_scheduledCutPoint_corrected_leaf_mean {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (k : ℕ) (hΓ : (cs k).directions=Γ) (t : ℝ) :
    (∫ω,correctedRootLeafWitness Γ C D L p (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)) ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)=
      scheduledCutMean cs ε M deadline start e C D L hn (initialGoodPhaseObservation B hB deadline start) k t := by
  unfold scheduledCutPointMeasure
  have hc : Measurable (fun ω : BoardClockPath n=>scheduledCutCredit cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p k (ω,t)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn _ p k).comp (measurable_id.prodMk measurable_const)
  rw [savedCreditMeasure_integral _ _ hc
    (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn _ p k (ω,t)).1)]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>by
    change scheduledCutCredit cs ε M deadline start hn _ p k (ω,t)*correctedRootLeafWitness Γ C D L p _=
      scheduledCutMixed cs ε M deadline start e C D L hn _ k (ω,t)
    rw [scheduledCutMixed_eq_witness,hΓ,←scheduledCutWitness_credit cs ε M deadline start e hn _ p k (ω,t)]
    exact (mixed_rootLeaf_credit Γ C D L p hp _).symm)

theorem initial_scheduledCutPoint_leaf_mean_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ)
    (hΓ : (cs k).directions=Γ) (t : ℝ) :
    (∫ω,rootLeafWitness Γ C D p (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)) ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      scheduledCutMean cs ε M deadline start e C D L hn (initialGoodPhaseObservation B hB deadline start) k t/(1-ε)^L.card.choose 2 := by
  let s := initialGoodPhaseObservation B hB deadline start
  let W := fun ω=>scheduledCutWitness cs ε M deadline start e hn s k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start e hn s k).comp
    (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start e hn s k (ω,t)
  have hi : Integrable (fun ω=>rootLeafWitness Γ C D p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ ((rootLeafWitness_measurable Γ C D p).comp hW)
      (rootLeafCap C p B) (fun ω=>rootLeafWitness_bounds Γ C D p _ B (hv ω))
  have hj : Integrable (fun ω=>correctedRootLeafWitness Γ C D L p (W ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ ((correctedRootLeafWitness_measurable Γ C D L p).comp hW)
      (rootLeafCap C p B) (fun ω=>correctedRootLeafWitness_bounds Γ C D L p _ B (hv ω))
  have hh := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>
    rootLeafWitness_eta_floor Γ C D L p _ B ε (hv ω) hε.le
      (fun a _ b _ hab=>initial_scheduledCutWitness_eta_lower cs ε M deadline start p hn hB e hε0 a b hab k (ω,t)))
  rw [integral_const_mul] at hh
  change (1-ε)^L.card.choose 2*(∫ω,rootLeafWitness Γ C D p (W ω) ∂ν)≤
    ∫ω,correctedRootLeafWitness Γ C D L p (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)) ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t at hh
  rw [initial_scheduledCutPoint_corrected_leaf_mean cs ε M deadline start p hn hB e Γ C D L hp k hΓ t] at hh
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hh

theorem initial_scheduledCutPoint_leaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hε0 : 0≤ε) (hε : ε<1) (k : ℕ)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,rootLeafWitness Γ C D p (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)) ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      (∏q∈D,(accumulatedPhaseCoarsePrice cs start e k q+
        ∫u in (0:ℝ)..t,phaseCoarseCoefficient (cs k).config (phaseEndpoint cs start k) e q u))/(1-ε)^L.card.choose 2 := by
  apply (initial_scheduledCutPoint_leaf_mean_bound cs ε M deadline start p hn hB e Γ C D L hp hε0 hε k (hΓ k) t).trans
  exact div_le_div_of_nonneg_right (initial_scheduledCut_coarse_product cs ε M deadline start Γ e C D L hn hB
    hΓ hK hCD hCDL k t ht) (pow_nonneg (sub_nonneg.mpr hε.le) _)

theorem initial_scheduledCutPoint_leaf_unit_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hCD : Disjoint C D) (hCDL : C∪D⊆L) (hsep : SeparatedLabels Γ (C∪D))
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,rootLeafWitness Γ C D p (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)) ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      (∏q∈D,(accumulatedPhaseUnitPrice cs start e k q+
        ∫u in (0:ℝ)..t,phaseUnitCoefficient (cs k).config (phaseEndpoint cs start k) e q u))/(1-ε)^L.card.choose 2 := by
  apply (initial_scheduledCutPoint_leaf_mean_bound cs ε M deadline start p hn hB e Γ C D L hp hε0 hε k (hΓ k) t).trans
  exact div_le_div_of_nonneg_right (initial_scheduledCut_unit_product cs ε M deadline start Γ e C D L hn hB
    hΓ hK hCD hCDL hsep k t ht) (pow_nonneg (sub_nonneg.mpr hε.le) _)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_leaf_coarse_product
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_leaf_unit_product
