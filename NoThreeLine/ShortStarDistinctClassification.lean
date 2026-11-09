import NoThreeLine.ScheduledCutSpecifiedExceptions
import NoThreeLine.ScheduledCutWitnessExceptions
import NoThreeLine.ScheduledCutExtraExceptions

/-! Every nonzero actual tuple is realized. On root-line-distinct tuples,
the main event and the four actual exceptions therefore form an upper cover. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteTuplePattern

theorem le_five_indicators (x : ℝ) (hx : 0≤x) (P Q R S T : Prop)
    [Decidable P] [Decidable Q] [Decidable R] [Decidable S] [Decidable T]
    (h : P∨Q∨R∨S∨T) :
    x≤(if P then x else 0)+(if Q then x else 0)+(if R then x else 0)+
      (if S then x else 0)+(if T then x else 0) := by
  have hn (U : Prop) [Decidable U] : 0≤(if U then x else 0) := by split_ifs <;> simp_all
  rcases h with h|h|h|h|h <;> simp only [if_pos h] <;>
    linarith [hn P,hn Q,hn R,hn S,hn T]

theorem sum_ite_eq_of_mem_iff {α : Type*} [DecidableEq α]
    (S T : Finset α) (P : α→Prop) [DecidablePred P] (w : α→ℝ)
    (h : ∀x,x∈T ↔ x∈S ∧ P x) :
    (∑x∈S,if P x then w x else 0)=∑x∈T,w x := by
  have he : S.filter P=T := by ext x; exact (Finset.mem_filter.trans (h x).symm)
  calc _=∑x∈S.filter P,w x := (Finset.sum_filter P w).symm
       _=_ := by rw [he]

end NoThreeLine.FiniteTuplePattern

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FiniteTuplePattern
attribute [local instance] Classical.propDecidable

theorem tuplePhysicalProduct_le_main_exceptions {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n) (B : ℝ) (hB : 0≤B)
    (ha : a.Valid B) :
    tuplePhysicalProduct f a≤mainTupleObservable f R a+
      (if ¬NoSpecifiedCrossPairs f then tuplePhysicalProduct f a else 0)+
      (if ¬NoLongLeafPairException f R then tuplePhysicalProduct f a else 0)+
      extraTupleObservable f R a+
      (if ¬NoThirdWitnessException f then tuplePhysicalProduct f a else 0) := by
  classical
  have hx := (tuplePhysicalProduct_bounds f a B hB ha).1
  by_cases hz : tuplePhysicalProduct f a=0
  · simp only [mainTupleObservable,extraTupleObservable,hz,ite_self,add_zero,le_refl]
  have hr := tuplePhysicalProduct_ne_zero_realized f a ha.1.1.1 hz
  have hc : TupleMainEvent f R a.augmented.physical.process ∨ ¬NoSpecifiedCrossPairs f ∨
      ¬NoLongLeafPairException f R ∨ ¬NoExtraSelectedException f a.augmented.physical.process R ∨
        ¬NoThirdWitnessException f := by
    by_cases hi : NoSpecifiedCrossPairs f
    · by_cases hii : NoLongLeafPairException f R
      · by_cases hiii : NoExtraSelectedException f a.augmented.physical.process R
        · by_cases hiv : NoThirdWitnessException f
          · exact Or.inl ⟨hr.2.1,hr.2.2.1,hr.2.2.2,hi,hii,hiii,hiv⟩
          · exact Or.inr (Or.inr (Or.inr (Or.inr hiv)))
        · exact Or.inr (Or.inr (Or.inr (Or.inl hiii)))
      · exact Or.inr (Or.inr (Or.inl hii))
    · exact Or.inr (Or.inl hi)
  exact le_five_indicators (tuplePhysicalProduct f a) hx _ _ _ _ _ hc

attribute [local irreducible] tuplePhysicalProduct mainTupleObservable extraTupleObservable
  rootDistinctTuples specifiedExceptionTuples longExceptionTuples witnessExceptionTuples

theorem sum_rootDistinct_le_main_exceptions {n : ℕ} (Γ : Finset ZPoint) (p : Grid n)
    (H R : ℝ) (m : ℕ) (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    (∑f∈rootDistinctTuples Γ p H m,tuplePhysicalProduct f a)≤
      mainTupleSum Γ p H R m a+
      (∑f∈specifiedExceptionTuples Γ p H m,tuplePhysicalProduct f a)+
      (∑f∈longExceptionTuples Γ p H R m,tuplePhysicalProduct f a)+
      (∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R a)+
      (∑f∈witnessExceptionTuples Γ p H m,tuplePhysicalProduct f a) := by
  classical
  have hi := sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m) (specifiedExceptionTuples Γ p H m)
    (fun f=>¬NoSpecifiedCrossPairs f) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by simp only [mem_specifiedExceptionTuples,mem_rootDistinctTuples])
  have hii := sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m) (longExceptionTuples Γ p H R m)
    (fun f=>¬NoLongLeafPairException f R) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by simp only [mem_longExceptionTuples,mem_rootDistinctTuples])
  have hiv := sum_ite_eq_of_mem_iff (rootDistinctTuples Γ p H m) (witnessExceptionTuples Γ p H m)
    (fun f=>¬NoThirdWitnessException f) (fun f=>tuplePhysicalProduct f a)
    (fun f=>by simp only [mem_witnessExceptionTuples,mem_rootDistinctTuples])
  have hh := Finset.sum_le_sum (s:=rootDistinctTuples Γ p H m)
    (fun f _=>tuplePhysicalProduct_le_main_exceptions f R a B hB ha)
  simpa only [Finset.sum_add_distrib,hi,hii,hiv,mainTupleSum] using hh

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tuplePhysicalProduct_le_main_exceptions
#print axioms NoThreeLine.ShortStars.sum_rootDistinct_le_main_exceptions
