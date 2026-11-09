import NoThreeLine.ShortStarExtraObservable

/-! One fresh actual selected label adds one source-price factor and one
label in the eta exponent. The physical leaf set is unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def extraCoarseCost (δ ε : ℝ) (m : ℕ) : ℝ :=
  (δ^((m+1)^3))⁻¹/(1-ε)^(2*m+2).choose 2

theorem extraCoarseCost_nonneg (δ ε : ℝ) (hδ : 0≤δ) (hε : ε≤1) (m : ℕ) :
    0≤extraCoarseCost δ ε m :=
  div_nonneg (inv_nonneg.mpr (pow_nonneg hδ _)) (pow_nonneg (sub_nonneg.mpr hε) _)

theorem initial_scheduledCutPoint_extra_product_bound {n m : ℕ} {B H : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (v : Grid n)
    (hfresh : v∉insert p (leafLabels f∪witnessLabels f)) :
    (∫ω,tupleExtraProduct f v
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
        extraCoarseCost δ ε m*(coarseCutPriceCap cs k t)^(m+1) := by
  classical
  let s := initialGoodPhaseObservation B hB deadline start
  let W := fun ω : BoardClockPath n=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  let C := insert p (leafLabels f)
  let D := insert v (witnessLabels f)
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s k).comp
    (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  have hvD : v∉witnessLabels f := fun h=>hfresh (Finset.mem_insert_of_mem (Finset.mem_union_right _ h))
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  have hi := tupleExtraProduct_integrable f v B hB0.le ν W hW hv
  have hj : Integrable (fun ω=>physicalLeafProduct C D p (W ω).augmented.physical) ν :=
    physicalLeafProduct_integrable ν _ ((AugmentedState.measurable_physical n).comp
      ((WitnessState.measurable_augmented n).comp hW)) C D p B (fun ω=>(hv ω).1.1)
  have hc := extra_label_card_data f hD v hfresh
  have hd : D.card=m+1 := by
    rw [show D=insert v (witnessLabels f) from rfl,Finset.card_insert_of_notMem hvD,witnessLabels_card f hD]
  have hbound : (∫ω,tupleExtraProduct f v (W ω) ∂ν)≤
      ∫ω,physicalLeafProduct C D p (W ω).augmented.physical ∂ν := by
    exact integral_mono hi hj (fun ω=>tupleExtraProduct_le_physical f hD v hvD (W ω) B hB0 (hv ω))
  change (∫ω,tupleExtraProduct f v (W ω) ∂ν)≤_
  apply hbound.trans
  have hsource := initial_scheduledCutPoint_physicalLeaf_coarse_product cs ε M deadline start K ρ δ p hn hB
    Γ C D (C∪D) (Finset.mem_insert_self _ _) (Finset.Subset.refl _) hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε k t ht
  change C.card=m+1 ∧ (C∪D).card=2*m+2 at hc
  rw [hc.1,hc.2] at hsource
  apply hsource.trans
  have hp : (∏q∈D,cutSelectedCoarsePrice cs start k t q)≤(coarseCutPriceCap cs k t)^(m+1) := by
    calc
      _ ≤ ∏_q∈D,coarseCutPriceCap cs k t := Finset.prod_le_prod
        (fun q _=>cutSelectedCoarsePrice_nonneg cs start k t ht.1 q)
        (fun q _=>cutSelectedCoarsePrice_le_cap cs start k t ht.1 q)
      _ = _ := by simp only [Finset.prod_const,hd]
  have h := mul_le_mul_of_nonneg_left
    (div_le_div_of_nonneg_right hp (pow_nonneg (sub_nonneg.mpr hε.le) ((2*m+2).choose 2)))
    (inv_nonneg.mpr (pow_nonneg hδ.le ((m+1)^3)))
  simpa only [extraCoarseCost,div_eq_mul_inv,mul_assoc,mul_left_comm,mul_comm] using h

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_extra_product_bound
