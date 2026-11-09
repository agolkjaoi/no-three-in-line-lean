import NoThreeLine.ShortStarExtraCandidates

/-! An additional selected point is charged as one more distinct witness.
All original active indicators and the new actual selection indicator remain. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

def tupleExtraProduct {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (v : Grid n) (a : WitnessState n) : ℝ :=
  tuplePhysicalProduct f a*(if v∈a.augmented.physical.process.selected then 1 else 0)

theorem tupleExtraProduct_measurable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (v : Grid n) : Measurable (tupleExtraProduct f v) :=
  (tuplePhysicalProduct_measurable f).mul (Measurable.ite
    (((measurable_finset_mem v).comp ((ProcessState.measurable_selected n).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (WitnessState.measurable_augmented n))))).setOf) measurable_const measurable_const)

theorem tupleExtraProduct_bounds {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (v : Grid n) (a : WitnessState n) (B : ℝ) (hB : 0≤B)
    (ha : a.Valid B) : 0≤tupleExtraProduct f v a ∧ tupleExtraProduct f v a≤B^m := by
  unfold tupleExtraProduct
  split_ifs
  · simpa only [mul_one] using tuplePhysicalProduct_bounds f a B hB ha
  · simp [pow_nonneg hB]

theorem tupleExtraProduct_integrable {Ω : Type*} [MeasurableSpace Ω]
    {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (v : Grid n) (B : ℝ) (hB : 0≤B)
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→WitnessState n) (hW : Measurable W)
    (hV : ∀ω,(W ω).Valid B) : Integrable (fun ω=>tupleExtraProduct f v (W ω)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    ((tupleExtraProduct_measurable f v).comp hW) (B^m)
    (fun ω=>tupleExtraProduct_bounds f v (W ω) B hB (hV ω))

theorem physicalLeafProduct_mul_selected {n : ℕ} (C D : Finset (Grid n)) (p v : Grid n)
    (a : ExtendedState n) (hv : v∉D) :
    physicalLeafProduct C D p a*(if v∈a.process.selected then 1 else 0)=
      physicalLeafProduct C (insert v D) p a := by
  classical
  by_cases hC : C⊆a.process.activeEvents
  · simp only [physicalLeafProduct,if_pos hC]
    unfold selectedLabelProduct
    rw [Finset.prod_insert hv]
    ring
  · simp [physicalLeafProduct,hC]

theorem tupleExtraProduct_le_physical {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (v : Grid n)
    (hv : v∉witnessLabels f) (a : WitnessState n) (B : ℝ) (hB : 0<B) (ha : a.Valid B) :
    tupleExtraProduct f v a≤physicalLeafProduct (insert p (leafLabels f))
      (insert v (witnessLabels f)) p a.augmented.physical := by
  have h := tuplePhysicalProduct_le_repeat_physical f a B hB ha
  rw [leafLabels_card f hD,Nat.sub_self,pow_zero,one_mul] at h
  have hh := mul_le_mul_of_nonneg_right h
    (show (0:ℝ)≤(if v∈a.augmented.physical.process.selected then 1 else 0) by split_ifs <;> norm_num)
  simpa only [tupleExtraProduct,physicalLeafProduct_mul_selected _ _ _ _ _ hv] using hh

theorem extra_label_card_data {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (v : Grid n)
    (hv : v∉insert p (leafLabels f∪witnessLabels f)) :
    (insert p (leafLabels f)).card=m+1 ∧
      ((insert p (leafLabels f))∪insert v (witnessLabels f)).card=2*m+2 := by
  classical
  have hp : p∉leafLabels f := fun h=>root_not_mem_labels f (Finset.mem_union_left _ h)
  constructor
  · rw [Finset.card_insert_of_notMem hp,leafLabels_card f hD]
  · have he : (insert p (leafLabels f))∪insert v (witnessLabels f)=
        insert v (insert p (leafLabels f∪witnessLabels f)) := by
      ext x
      simp only [Finset.mem_union,Finset.mem_insert]
      tauto
    rw [he,Finset.card_insert_of_notMem hv,
      Finset.card_insert_of_notMem (root_not_mem_labels f),label_union_card f hD]

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tupleExtraProduct_le_physical
#print axioms NoThreeLine.ShortStars.extra_label_card_data
