import NoThreeLine.PhysicalLeafConnectionRemoval

/-! Coarse source recovery for the actual physical leaf product under the
original-board scheduled cut point law. The guard floor is supplied internally.
Overlapping active/witness sets give zero by actual active safety. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection

def cutSelectedCoarsePrice {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (t : ℝ) (q : Grid n) : ℝ :=
  accumulatedPhaseCoarsePrice cs start (unitBirthRetention n) k q+
    ∫u in (0:ℝ)..t,phaseCoarseCoefficient (cs k).config (phaseEndpoint cs start k)
      (unitBirthRetention n) q u

theorem cutSelectedCoarsePrice_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (k : ℕ) (t : ℝ) (ht : 0≤t) (q : Grid n) :
    0≤cutSelectedCoarsePrice cs start k t q :=
  add_nonneg (accumulatedPhaseCoarsePrice_nonneg cs start (unitBirthRetention n) k q)
    (intervalIntegral.integral_nonneg ht (fun u _=>
      (phaseCoarseCoefficient_bounds (cs k).config (phaseEndpoint cs start k)
        (unitBirthRetention n) (cs k).mask_le_one q u).1))

theorem initial_scheduledCutPoint_physicalLeaf_coarse_product {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hp : p∈C) (hCDL : C∪D⊆L)
    (hΓ : ∀j,(cs j).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,physicalLeafProduct C D p
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).augmented.physical
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t) ≤
      (δ^(C.card^3))⁻¹*((∏q∈D,cutSelectedCoarsePrice cs start k t q)/(1-ε)^L.card.choose 2) := by
  classical
  let s := initialGoodPhaseObservation B hB deadline start
  let W := fun ω : BoardClockPath n=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s k).comp
    (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  change (∫ω,physicalLeafProduct C D p (W ω).augmented.physical ∂ν)≤_
  by_cases hCD : Disjoint C D
  · have hi : Integrable (fun ω=>physicalLeafProduct C D p (W ω).augmented.physical) ν :=
      physicalLeafProduct_integrable ν _ ((AugmentedState.measurable_physical n).comp
        ((WitnessState.measurable_augmented n).comp hW)) C D p B (fun ω=>(hv ω).1.1)
    have hj : Integrable (fun ω=>rootLeafWitness Γ C D p (W ω)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable ν _
        ((rootLeafWitness_measurable Γ C D p).comp hW) (rootLeafCap C p B)
        (fun ω=>rootLeafWitness_bounds Γ C D p (W ω) B (hv ω))
    have hbound : (∫ω,physicalLeafProduct C D p (W ω).augmented.physical ∂ν)≤
        (δ^(C.card^3))⁻¹*(∫ω,rootLeafWitness Γ C D p (W ω) ∂ν) := by
      rw [←integral_const_mul]
      apply integral_mono hi (hj.const_mul _)
      intro ω
      apply physicalLeafProduct_le_connection_cost Γ C D p (W ω) B δ (hv ω) hδ
        (scheduledCutWitness_unit_retained cs ε M deadline start hn s k (ω,t))
      intro hC
      exact initial_scheduledCutWitness_connection_lower cs ε M deadline start K ρ δ
        (unitBirthRetention n) hn hB hK0 hK2 hρ1 Γ hΓ hK hρ hδ.le hδ1 hδρ hδK k (ω,t) C hC
    apply hbound.trans
    apply mul_le_mul_of_nonneg_left _ (inv_nonneg.mpr (pow_nonneg hδ.le _))
    exact initial_scheduledCutPoint_leaf_coarse_product cs ε M deadline start p hn hB
      (unitBirthRetention n) Γ C D L hp hΓ (fun j=>(hK j).trans_lt hK2) hCD hCDL hε0 hε k t ht
  · have hz : (∫ω,physicalLeafProduct C D p (W ω).augmented.physical ∂ν)=0 := by
      apply integral_eq_zero_of_ae
      exact Filter.Eventually.of_forall (fun ω=>
        physicalLeafProduct_zero_of_not_disjoint C D p _ (hv ω).1.1.1 hCD)
    rw [hz]
    exact mul_nonneg (inv_nonneg.mpr (pow_nonneg hδ.le _))
      (div_nonneg (Finset.prod_nonneg (fun q _=>cutSelectedCoarsePrice_nonneg cs start k t ht.1 q))
        (pow_nonneg (sub_nonneg.mpr hε.le) _))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutPoint_physicalLeaf_coarse_product
