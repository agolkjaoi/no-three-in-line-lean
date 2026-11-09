import NoThreeLine.ShortStarWeightedIntegral

/-! Exact deterministic current weights on the coefficient-one main row. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def weightedCutStarPriceSum {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (cs : ℕ→SharedPhase n B) (k : ℕ) (t : ℝ) : ℝ :=
  ∑s : ↥(shortStars Γ p H),w s*cutUnitPrice cs k t s.val.2

theorem sum_distinct_weighted_price_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H : ℝ) (m : ℕ) (price : ↥(shortStars Γ p H)→ℝ) (hprice : ∀s,0≤price s) :
    (∑f∈rootDistinctTuples Γ p H m,∏i : Fin m,price (f i))≤
      (∑s : ↥(shortStars Γ p H),price s)^m := by
  classical
  calc
    _ ≤ ∑f : Fin m→↥(shortStars Γ p H),∏i : Fin m,price (f i) :=
      Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
        (fun f _ _=>Finset.prod_nonneg (fun i _=>hprice (f i)))
    _ = _ := (Fintype.sum_pow price m).symm

attribute [local irreducible] mainTupleObservable tuplePhysicalProduct scheduledCutWitness
  rootDistinctTuples

theorem initial_scheduledCutPoint_weightedMain_bound {n : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H B : ℝ}
    (m : ℕ) (R : ℝ) (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k : ℕ) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    (∫ω,weightedMainTupleSum Γ p H R m w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p k t)≤
      (weightedCutStarPriceSum Γ p H w cs k t)^m/(1-ε)^(2*m+1).choose 2 := by
  classical
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) k (ω,t)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p k t
  letI : IsProbabilityMeasure ν := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p k t
  have hW : Measurable W := (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) k).comp (measurable_id.prodMk measurable_const)
  have hv (ω : BoardClockPath n) : (W ω).Valid B := scheduledCutWitness_valid cs ε M deadline start _ hn _ k (ω,t)
  have he (ω : BoardClockPath n) : EmptyLineCredit (W ω).augmented.physical :=
    scheduledCutWitness_emptyLineCredit cs ε M deadline start _ hn _ k (ω,t)
  have hu (ω : BoardClockPath n) (q : Grid n) : (W ω).retained q=
      if q∈(W ω).augmented.physical.process.selected then 1 else 0 :=
    scheduledCutWitness_unit_retained cs ε M deadline start hn _ k (ω,t) q
  have hi (f : Fin m→↥(shortStars Γ p H)) (hf : f∈rootDistinctTuples Γ p H m) :
      Integrable (fun ω=>tupleWeight w f*mainTupleObservable f R (W ω)) ν :=
    (mainTupleObservable_integrable f ((mem_rootDistinctTuples Γ p H f).mp hf) R B ν W hW hv he hu).const_mul _
  change (∫ω,(∑f∈rootDistinctTuples Γ p H m,tupleWeight w f*mainTupleObservable f R (W ω)) ∂ν)≤_
  rw [integral_finsetSum _ hi]
  calc
    _ ≤ ∑f∈rootDistinctTuples Γ p H m,tupleWeight w f*
        ((∏i : Fin m,cutUnitPrice cs k t (f i).val.2)/(1-ε)^(2*m+1).choose 2) := by
      apply Finset.sum_le_sum
      intro f hf
      rw [integral_const_mul]
      exact mul_le_mul_of_nonneg_left
        (initial_scheduledCutPoint_mainTuple_bound f ((mem_rootDistinctTuples Γ p H f).mp hf)
          R cs ε M deadline start hn hB hΓ hK hε0 hε k t ht)
        (Finset.prod_nonneg (fun i _=>hw (f i)))
    _ = (∑f∈rootDistinctTuples Γ p H m,∏i : Fin m,w (f i)*cutUnitPrice cs k t (f i).val.2)/
        (1-ε)^(2*m+1).choose 2 := by
      rw [Finset.sum_div]
      apply Finset.sum_congr rfl
      intro f _
      rw [Finset.prod_mul_distrib]
      simp only [tupleWeight,mul_div_assoc]
    _ ≤ _ := div_le_div_of_nonneg_right (sum_distinct_weighted_price_le Γ p H m
      (fun s=>w s*cutUnitPrice cs k t s.val.2)
      (fun s=>mul_nonneg (hw s) (cutUnitPrice_nonneg cs k t ht.1 s.val.2)))
      (pow_nonneg (sub_nonneg.mpr hε.le) _)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.initial_scheduledCutPoint_weightedMain_bound
