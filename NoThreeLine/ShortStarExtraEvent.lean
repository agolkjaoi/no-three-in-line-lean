import NoThreeLine.ShortStarExtraObservable

/-! The actual extra-selected-point event is dominated by the finite
candidate selection sum; no exception exclusion is assumed on every path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def extraTupleObservable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n) : ℝ := by
  classical
  exact if ¬NoExtraSelectedException f a.augmented.physical.process R then tuplePhysicalProduct f a else 0

theorem extraTupleObservable_measurable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) : Measurable (extraTupleObservable f R) := by
  classical
  let pred (S : Finset (Grid n)) : Prop := ¬(∀i j : Fin m,i≠j → ∀v∈S,
    v∉insert p (leafLabels f∪witnessLabels f) →
      (((f i).val,(f j).val),v)∉freshExtraPointTriples Γ p H R)
  have hp : Measurable (fun a : WitnessState n=>¬NoExtraSelectedException f a.augmented.physical.process R) :=
    (measurable_of_countable pred).comp ((ProcessState.measurable_selected n).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (WitnessState.measurable_augmented n))))
  exact Measurable.ite hp.setOf (tuplePhysicalProduct_measurable f) measurable_const

theorem extraTupleObservable_bounds {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n) (B : ℝ) (hB : 0≤B)
    (ha : a.Valid B) : 0≤extraTupleObservable f R a ∧ extraTupleObservable f R a≤B^m := by
  classical
  by_cases hex : ¬NoExtraSelectedException f a.augmented.physical.process R
  · rw [extraTupleObservable,if_pos hex]
    exact tuplePhysicalProduct_bounds f a B hB ha
  · rw [extraTupleObservable,if_neg hex]
    exact ⟨le_rfl,pow_nonneg hB _⟩

theorem extraTupleObservable_integrable {Ω : Type*} [MeasurableSpace Ω]
    {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R B : ℝ) (hB : 0≤B)
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→WitnessState n) (hW : Measurable W)
    (hV : ∀ω,(W ω).Valid B) : Integrable (fun ω=>extraTupleObservable f R (W ω)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    ((extraTupleObservable_measurable f R).comp hW) (B^m)
    (fun ω=>extraTupleObservable_bounds f R (W ω) B hB (hV ω))

theorem extraTupleObservable_le_fiber {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ)
    (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    extraTupleObservable f R a≤∑v : Grid n,
      if (f,v)∈extraCandidates Γ p H R m then tupleExtraProduct f v a else 0 := by
  classical
  have hnon (v : Grid n) : 0≤(if (f,v)∈extraCandidates Γ p H R m then tupleExtraProduct f v a else 0) := by
    split_ifs
    · exact (tupleExtraProduct_bounds f v a B hB ha).1
    · exact le_rfl
  by_cases hex : ¬NoExtraSelectedException f a.augmented.physical.process R
  · rw [extraTupleObservable,if_pos hex]
    obtain ⟨v,hv,hsel⟩ := (not_noExtraSelected_iff_candidate f hD R a.augmented.physical.process).mp hex
    have h := Finset.single_le_sum (fun v _=>hnon v) (Finset.mem_univ v)
    simpa only [if_pos hv,tupleExtraProduct,if_pos hsel,mul_one] using h
  · rw [extraTupleObservable,if_neg hex]
    exact Finset.sum_nonneg (fun v _=>hnon v)

attribute [local irreducible] tupleExtraProduct extraTupleObservable extraCandidates rootDistinctTuples

theorem sum_extraTupleObservable_le_candidates {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (m : ℕ) (a : WitnessState n) (B : ℝ) (hB : 0≤B) (ha : a.Valid B) :
    (∑f∈rootDistinctTuples Γ p H m,extraTupleObservable f R a)≤
      ∑fv∈extraCandidates Γ p H R m,tupleExtraProduct fv.1 fv.2 a := by
  classical
  have hs : extraCandidates Γ p H R m⊆(rootDistinctTuples Γ p H m).product Finset.univ := by
    intro fv hfv
    unfold extraCandidates at hfv
    exact Finset.mem_product.mpr ⟨(mem_rootDistinctTuples Γ p H fv.1).mpr
      (Finset.mem_filter.mp hfv).2.1,Finset.mem_univ _⟩
  calc
    _ ≤ ∑f∈rootDistinctTuples Γ p H m,∑v : Grid n,
        if (f,v)∈extraCandidates Γ p H R m then tupleExtraProduct f v a else 0 := by
      apply Finset.sum_le_sum
      intro f hf
      exact extraTupleObservable_le_fiber f ((mem_rootDistinctTuples Γ p H f).mp hf) R a B hB ha
    _ = ∑fv∈(rootDistinctTuples Γ p H m).product Finset.univ,
        if fv∈extraCandidates Γ p H R m then tupleExtraProduct fv.1 fv.2 a else 0 :=
      (Finset.sum_product (rootDistinctTuples Γ p H m) (Finset.univ : Finset (Grid n))
        (fun fv=>if fv∈extraCandidates Γ p H R m then tupleExtraProduct fv.1 fv.2 a else 0)).symm
    _ = ∑fv∈extraCandidates Γ p H R m,
        if fv∈extraCandidates Γ p H R m then tupleExtraProduct fv.1 fv.2 a else 0 :=
      (Finset.sum_subset (f:=fun fv=>if fv∈extraCandidates Γ p H R m then tupleExtraProduct fv.1 fv.2 a else 0)
        hs (fun fv _ hnot=>if_neg hnot)).symm
    _ = _ := Finset.sum_congr rfl (fun fv hfv=>if_pos hfv)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.sum_extraTupleObservable_le_candidates
