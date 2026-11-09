import NoThreeLine.ShortStarDeterministicWeights

/-! Integration of the deterministic weighted tuple classification.
No coarse estimate is substituted for the weighted main term. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples repeatedTuples countTuples repeatIndices specifiedExceptionTuples
  longExceptionTuples witnessExceptionTuples tupleWeight

theorem integral_weighted_all_le_main_repeat_exceptions {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (m : ℕ) (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (B : ℝ) (hB : 0≤B)
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsFiniteMeasure μ]
    (W : Ω→WitnessState n) (hW : Measurable W) (hV : ∀ω,(W ω).Valid B)
    (hE : ∀ω,EmptyLineCredit (W ω).augmented.physical)
    (hunit : ∀ω q,(W ω).retained q=if q∈(W ω).augmented.physical.process.selected then 1 else 0) :
    (∫ω,weightedPhysicalTupleSum Γ p H m w (W ω) ∂μ)≤
      (∫ω,weightedMainTupleSum Γ p H R m w (W ω) ∂μ)+
      (∑aj∈repeatIndices m,∫ω,(∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R (W ω)) ∂μ)+
      (∫ω,(∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f (W ω)) ∂μ) := by
  classical
  have hi (S : Finset (Fin m→↥(shortStars Γ p H))) :
      Integrable (fun ω=>∑f∈S,tuplePhysicalProduct f (W ω)) μ :=
    integrable_finsetSum _ (fun f _=>tuplePhysicalProduct_integrable f B hB μ W hW hV)
  have hall : Integrable (fun ω=>weightedPhysicalTupleSum Γ p H m w (W ω)) μ :=
    integrable_finsetSum _ (fun f _=>(tuplePhysicalProduct_integrable f B hB μ W hW hV).const_mul _)
  have hm : Integrable (fun ω=>weightedMainTupleSum Γ p H R m w (W ω)) μ :=
    integrable_finsetSum _ (fun f hf=>(mainTupleObservable_integrable f
      ((mem_rootDistinctTuples Γ p H f).mp hf) R B μ W hW hV hE hunit).const_mul _)
  have hr := integrable_finsetSum (repeatIndices m) (fun aj _=>hi (countTuples Γ p H m aj.1 aj.2))
  have he : Integrable (fun ω=>∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R (W ω)) μ :=
    integrable_finsetSum _ (fun f _=>extraTupleObservable_integrable f R B hB μ W hW hV)
  have hh := integral_mono hall
    (((((hm.add hr).add (hi (specifiedExceptionTuples Γ p H m))).add
      (hi (longExceptionTuples Γ p H R m))).add he).add (hi (witnessExceptionTuples Γ p H m)))
    (fun ω=>weighted_sum_all_le_main_repeat_exceptions Γ p H R m w hw (W ω) B hB (hV ω))
  simp only [Pi.add_apply] at hh
  have e1 := integral_add ((((hm.add hr).add (hi (specifiedExceptionTuples Γ p H m))).add
      (hi (longExceptionTuples Γ p H R m))).add he) (hi (witnessExceptionTuples Γ p H m))
  have e2 := integral_add (((hm.add hr).add (hi (specifiedExceptionTuples Γ p H m))).add
      (hi (longExceptionTuples Γ p H R m))) he
  have e3 := integral_add ((hm.add hr).add (hi (specifiedExceptionTuples Γ p H m)))
      (hi (longExceptionTuples Γ p H R m))
  have e4 := integral_add (hm.add hr) (hi (specifiedExceptionTuples Γ p H m))
  have e5 := integral_add hm hr
  simp only [Pi.add_apply] at e1 e2 e3 e4 e5
  rw [e1,e2,e3,e4,e5,
    integral_finsetSum (repeatIndices m) (fun aj _=>hi (countTuples Γ p H m aj.1 aj.2))] at hh
  exact hh

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.integral_weighted_all_le_main_repeat_exceptions
