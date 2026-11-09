import NoThreeLine.ShortStarRepeatObservable

/-! Actual cut expectations for prescribed distinct leaf/witness counts.
The weighted pattern cover is used only for this coarse repetition bound.
Its constants do not replace the separate coefficient-one main bound. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def countTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m a j : ℕ) : Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact Finset.univ.filter (fun f=>(leafLabels f).card=a ∧ (witnessLabels f).card=j)

theorem sum_countTuples_eq_possible {n m a j : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (w : WitnessState n) (hw : w.augmented.physical.process.Valid) :
    (∑f∈countTuples Γ p H m a j,tuplePhysicalProduct f w)=
      ∑f∈possibleTuples Γ p H m a j,tuplePhysicalProduct f w := by
  classical
  symm
  apply Finset.sum_subset
  · intro f hf
    have h := (Finset.mem_filter.mp hf).2
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _,h.1,h.2.1⟩
  · intro f hf hnot
    by_contra hz
    exact hnot (Finset.mem_filter.mpr ⟨Finset.mem_univ _,
      (Finset.mem_filter.mp hf).2.1,(Finset.mem_filter.mp hf).2.2,
      w.augmented.physical.process,tuplePhysicalProduct_ne_zero_realized f w hw hz⟩)

def repeatCoarseCost (B δ ε : ℝ) (m a j : ℕ) : ℝ :=
  B^(m-a)*(δ^((a+1)^3))⁻¹/(1-ε)^(a+j+1).choose 2

theorem repeatCoarseCost_nonneg (B δ ε : ℝ) (hB : 0≤B) (hδ : 0≤δ)
    (hε : ε≤1) (m a j : ℕ) : 0≤repeatCoarseCost B δ ε m a j :=
  div_nonneg (mul_nonneg (pow_nonneg hB _) (inv_nonneg.mpr (pow_nonneg hδ _)))
    (pow_nonneg (sub_nonneg.mpr hε) _)

theorem initial_scheduledCutPoint_repeatTuple_bound {n m a j : ℕ} {B H : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (f : Fin m→↥(shortStars Γ p H)) (hf : f∈possibleTuples Γ p H m a j) :
    (∫ω,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
        repeatCoarseCost B δ ε m a j*∏z∈witnessLabels f,cutSelectedCoarsePrice cs start k t z := by
  classical
  let s := initialGoodPhaseObservation B hB deadline start
  let W := fun ω : BoardClockPath n=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  let C := insert p (leafLabels f)
  let D := witnessLabels f
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s k).comp
    (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  have hB0 : 0<B := lt_of_lt_of_le zero_lt_one hB
  have hi := tuplePhysicalProduct_integrable f B hB0.le ν W hW hv
  have hj : Integrable (fun ω=>physicalLeafProduct C D p (W ω).augmented.physical) ν :=
    physicalLeafProduct_integrable ν _ ((AugmentedState.measurable_physical n).comp
      ((WitnessState.measurable_augmented n).comp hW)) C D p B (fun ω=>(hv ω).1.1)
  have hleaf := (Finset.mem_filter.mp hf).2.1
  have hc := possibleTuples_card_data f hf
  have hbound : (∫ω,tuplePhysicalProduct f (W ω) ∂ν)≤
      B^(m-a)*(∫ω,physicalLeafProduct C D p (W ω).augmented.physical ∂ν) := by
    rw [←integral_const_mul]
    apply integral_mono hi (hj.const_mul _)
    intro ω
    simpa only [hleaf] using tuplePhysicalProduct_le_repeat_physical f (W ω) B hB0 (hv ω)
  change (∫ω,tuplePhysicalProduct f (W ω) ∂ν)≤_
  apply hbound.trans
  have hsource := initial_scheduledCutPoint_physicalLeaf_coarse_product cs ε M deadline start K ρ δ p hn hB
    Γ C D (C∪D) (Finset.mem_insert_self _ _) (Finset.Subset.refl _) hΓ hK0 hK2 hK hρ hρ1
    hδ hδ1 hδρ hδK hε0 hε k t ht
  have hscaled := mul_le_mul_of_nonneg_left hsource (pow_nonneg hB0.le (m-a))
  change C.card=a+1 ∧ (C∪D).card=a+j+1 at hc
  rw [hc.1,hc.2] at hscaled
  simpa only [repeatCoarseCost,div_eq_mul_inv,mul_assoc,mul_left_comm,mul_comm] using hscaled

theorem initial_scheduledCutPoint_countTuple_sum_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (H : ℝ) (hH : 0≤H)
    (hΓ : ∀k,(cs k).directions=Γ) (hK0 : 0≤K) (hK2 : K<2)
    (hK : ∀k,(cs k).K≤K) (hρ : ∀k,ρ≤(cs k).rho) (hρ1 : ρ≤1)
    (hδ : 0<δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon)
    (m a j : ℕ) :
    (∫ω,(∑f∈countTuples Γ p H m a j,tuplePhysicalProduct f
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
        repeatCoarseCost B δ ε m a j*((repeatPatternCount m a j : ℝ)*H^(a-j)*
          (∑star∈shortStars Γ p H,cutSelectedCoarsePrice cs start k t star.2)^j) := by
  classical
  let s := initialGoodPhaseObservation B hB deadline start
  let W := fun ω : BoardClockPath n=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s k).comp
    (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B :=
    scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s k (ω,t)
  have he : (fun ω=>∑f∈countTuples Γ p H m a j,tuplePhysicalProduct f (W ω))=
      (fun ω=>∑f∈possibleTuples Γ p H m a j,tuplePhysicalProduct f (W ω)) := by
    funext ω
    exact sum_countTuples_eq_possible (W ω) (hv ω).1.1.1
  change (∫ω,(∑f∈countTuples Γ p H m a j,tuplePhysicalProduct f (W ω)) ∂ν)≤_
  rw [he,integral_finsetSum _ (fun f _=>
    tuplePhysicalProduct_integrable f B (zero_le_one.trans hB) ν W hW hv)]
  calc
    _ ≤ ∑f∈possibleTuples Γ p H m a j,
        repeatCoarseCost B δ ε m a j*∏z∈witnessLabels f,cutSelectedCoarsePrice cs start k t z := by
      apply Finset.sum_le_sum
      intro f hf
      exact initial_scheduledCutPoint_repeatTuple_bound cs ε M deadline start K ρ δ p hn hB Γ
        hΓ hK0 hK2 hK hρ hρ1 hδ hδ1 hδρ hδK hε0 hε k t ht f hf
    _ = repeatCoarseCost B δ ε m a j*
        (∑f∈possibleTuples Γ p H m a j,∏z∈witnessLabels f,cutSelectedCoarsePrice cs start k t z) :=
      (Finset.mul_sum _ _ _).symm
    _ ≤ _ := mul_le_mul_of_nonneg_left
      (possibleTuples_price_le Γ p H hH m a j _ (cutSelectedCoarsePrice_nonneg cs start k t ht.1))
      (repeatCoarseCost_nonneg B δ ε (zero_le_one.trans hB) hδ.le hε.le m a j)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_repeatTuple_bound
#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_countTuple_sum_bound
