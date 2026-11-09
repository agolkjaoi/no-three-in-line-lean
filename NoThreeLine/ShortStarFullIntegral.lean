import NoThreeLine.ShortStarRepeatClassification

/-! Exhaustive tuple classification, followed by finite integral addition.
The coefficient-one main term is unchanged. All exceptional sets are used
only as upper covers, and repeated tuples retain their actual image sizes. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples repeatedTuples countTuples repeatIndices specifiedExceptionTuples
  longExceptionTuples witnessExceptionTuples

theorem sum_all_le_main_repeat_exceptions {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (m : ℕ) (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    (∑f : Fin m→↥(shortStars Γ p H),tuplePhysicalProduct f a)≤
      mainTupleSum Γ p H R m a+
      (∑aj∈repeatIndices m,∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f a)+
      (∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f a)+
      (∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f a)+
      (∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R a)+
      (∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f a) := by
  classical
  rw [sum_all_eq_distinct_add_repeated Γ p H m a]
  have hd := sum_rootDistinct_le_main_exceptions Γ p H R m a B hB ha
  have hr := sum_repeated_le_counts Γ p H m a B hB ha
  linarith

theorem integral_all_le_main_repeat_exceptions {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (m : ℕ) (B : ℝ) (hB : 0≤B)
    {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsFiniteMeasure μ]
    (W : Ω→WitnessState n) (hW : Measurable W) (hV : ∀ω,(W ω).Valid B)
    (hE : ∀ω,EmptyLineCredit (W ω).augmented.physical)
    (hunit : ∀ω q,(W ω).retained q=if q∈(W ω).augmented.physical.process.selected then 1 else 0) :
    (∫ω,(∑f : Fin m→↥(shortStars Γ p H),tuplePhysicalProduct f (W ω)) ∂μ)≤
      (∫ω,mainTupleSum Γ p H R m (W ω) ∂μ)+
      (∑aj∈repeatIndices m,∫ω,(∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f (W ω)) ∂μ)+
      (∫ω,(∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R (W ω)) ∂μ)+
      (∫ω,(∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f (W ω)) ∂μ) := by
  classical
  have hi (S : Finset (Fin m→↥(shortStars Γ p H))) :
      Integrable (fun ω=>∑f∈S,tuplePhysicalProduct f (W ω)) μ :=
    integrable_finsetSum _ (fun f _=>tuplePhysicalProduct_integrable f B hB μ W hW hV)
  have hm : Integrable (fun ω=>mainTupleSum Γ p H R m (W ω)) μ :=
    integrable_finsetSum _ (fun f hf=>mainTupleObservable_integrable f
      ((mem_rootDistinctTuples Γ p H f).mp hf) R B μ W hW hV hE hunit)
  have hr := integrable_finsetSum (repeatIndices m) (fun aj _=>hi (countTuples Γ p H m aj.1 aj.2))
  have he : Integrable (fun ω=>∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R (W ω)) μ :=
    integrable_finsetSum _ (fun f _=>extraTupleObservable_integrable f R B hB μ W hW hV)
  have hh := integral_mono (hi Finset.univ)
    (((((hm.add hr).add (hi (specifiedExceptionTuples Γ p H m))).add
      (hi (longExceptionTuples Γ p H R m))).add he).add (hi (witnessExceptionTuples Γ p H m)))
    (fun ω=>sum_all_le_main_repeat_exceptions Γ p H R m (W ω) B hB (hV ω))
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

#print axioms NoThreeLine.ShortStars.sum_all_le_main_repeat_exceptions
#print axioms NoThreeLine.ShortStars.integral_all_le_main_repeat_exceptions
