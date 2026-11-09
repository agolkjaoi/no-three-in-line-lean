import NoThreeLine.ShortStarFullIntegral

/-! Deterministic weights are kept exactly on the main term.
Only the nonnegative repeated and exceptional terms use weight<=1. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness
local instance (P : Prop) : Decidable P := Classical.propDecidable P

def tupleWeight {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (w : ↥(shortStars Γ p H)→ℝ) (f : Fin m→↥(shortStars Γ p H)) : ℝ := ∏i,w (f i)

theorem tupleWeight_bounds {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (f : Fin m→↥(shortStars Γ p H)) : 0≤tupleWeight w f ∧ tupleWeight w f≤1 := by
  classical
  exact ⟨Finset.prod_nonneg (fun i _=>(hw (f i)).1),
    Finset.prod_le_one (fun i _=>(hw (f i)).1) (fun i _=>(hw (f i)).2)⟩

def weightedMainTupleSum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) (m : ℕ)
    (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) : ℝ :=
  ∑f∈rootDistinctTuples Γ p H m,tupleWeight w f*mainTupleObservable f R a

def weightedPhysicalTupleSum {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (m : ℕ)
    (w : ↥(shortStars Γ p H)→ℝ) (a : WitnessState n) : ℝ :=
  ∑f : Fin m→↥(shortStars Γ p H),tupleWeight w f*tuplePhysicalProduct f a

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples repeatedTuples countTuples repeatIndices specifiedExceptionTuples
  longExceptionTuples witnessExceptionTuples tupleWeight

theorem weighted_tuple_le_main_exceptions {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n)
    (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    tupleWeight w f*tuplePhysicalProduct f a≤tupleWeight w f*mainTupleObservable f R a+
      (if ¬NoSpecifiedCrossPairs f then tuplePhysicalProduct f a else 0)+
      (if ¬NoLongLeafPairException f R then tuplePhysicalProduct f a else 0)+
      extraTupleObservable f R a+
      (if ¬NoThirdWitnessException f then tuplePhysicalProduct f a else 0) := by
  classical
  have h := mul_le_mul_of_nonneg_left (tuplePhysicalProduct_le_main_exceptions f R a B hB ha)
    (tupleWeight_bounds w hw f).1
  have hx := (tuplePhysicalProduct_bounds f a B hB ha).1
  have he := (extraTupleObservable_bounds f R a B hB ha).1
  have h1 : 0≤(if ¬NoSpecifiedCrossPairs f then tuplePhysicalProduct f a else 0) := by positivity
  have h2 : 0≤(if ¬NoLongLeafPairException f R then tuplePhysicalProduct f a else 0) := by positivity
  have h4 : 0≤(if ¬NoThirdWitnessException f then tuplePhysicalProduct f a else 0) := by positivity
  have hc := (tupleWeight_bounds w hw f).2
  nlinarith

theorem weighted_sum_all_le_main_repeat_exceptions {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (m : ℕ) (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1)
    (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    weightedPhysicalTupleSum Γ p H m w a≤weightedMainTupleSum Γ p H R m w a+
      (∑aj∈repeatIndices m,∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f a)+
      (∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f a)+
      (∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f a)+
      (∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R a)+
      (∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f a) := by
  classical
  have hsplit : weightedPhysicalTupleSum Γ p H m w a=
      (∑f∈rootDistinctTuples Γ p H m,tupleWeight w f*tuplePhysicalProduct f a)+
      (∑f∈repeatedTuples Γ p H m,tupleWeight w f*tuplePhysicalProduct f a) := by
    unfold weightedPhysicalTupleSum rootDistinctTuples repeatedTuples
    exact (Finset.sum_filter_add_sum_filter_not Finset.univ RootLinePairwise _).symm
  have hr : (∑f∈repeatedTuples Γ p H m,tupleWeight w f*tuplePhysicalProduct f a)≤
      ∑aj∈repeatIndices m,∑f∈countTuples Γ p H m aj.1 aj.2,tuplePhysicalProduct f a := by
    apply le_trans _ (sum_repeated_le_counts Γ p H m a B hB ha)
    exact Finset.sum_le_sum (fun f _=>mul_le_of_le_one_left
      (tuplePhysicalProduct_bounds f a B hB ha).1 (tupleWeight_bounds w hw f).2)
  have hd := Finset.sum_le_sum (s:=rootDistinctTuples Γ p H m)
    (fun f _=>weighted_tuple_le_main_exceptions w hw f R a B hB ha)
  simp only [Finset.sum_add_distrib] at hd
  have h1 := FiniteTuplePattern.sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m)
    (specifiedExceptionTuples Γ p H m) (fun f=>¬NoSpecifiedCrossPairs f) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by rw [mem_specifiedExceptionTuples,mem_rootDistinctTuples])
  have h2 := FiniteTuplePattern.sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m)
    (longExceptionTuples Γ p H R m) (fun f=>¬NoLongLeafPairException f R) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by rw [mem_longExceptionTuples,mem_rootDistinctTuples])
  have h4 := FiniteTuplePattern.sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m)
    (witnessExceptionTuples Γ p H m) (fun f=>¬NoThirdWitnessException f) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by rw [mem_witnessExceptionTuples,mem_rootDistinctTuples])
  rw [h1,h2,h4] at hd
  rw [hsplit]
  unfold weightedMainTupleSum
  linarith

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.weighted_sum_all_le_main_repeat_exceptions
