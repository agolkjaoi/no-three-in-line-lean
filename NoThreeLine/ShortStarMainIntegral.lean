import NoThreeLine.ShortStarMainObservable

/-! Bounded measurability and integral domination for the event-restricted
main tuple. Validity, actual empty-line credit, and unit-retained indicators
are state invariants; the no-exception condition remains inside the event. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

theorem mainTupleObservable_integrable {Ω : Type*} [MeasurableSpace Ω]
    {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R B : ℝ)
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→WitnessState n) (hW : Measurable W)
    (hV : ∀ω,(W ω).Valid B) (hE : ∀ω,EmptyLineCredit (W ω).augmented.physical)
    (hunit : ∀ω q,(W ω).retained q=if q∈(W ω).augmented.physical.process.selected then 1 else 0) :
    Integrable (fun ω=>mainTupleObservable f R (W ω)) μ := by
  classical
  have he : (fun ω=>mainTupleObservable f R (W ω))=
      (fun ω=>if TupleMainEvent f R (W ω).augmented.physical.process then
        rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p (W ω) else 0) := by
    funext ω
    exact mainTupleObservable_eq_indicator f hD R (W ω) (hV ω).1.1.1 (hE ω) (hunit ω)
  rw [he]
  have hP : Measurable (fun ω=>TupleMainEvent f R (W ω).augmented.physical.process) :=
    (tupleMainEvent_measurable f R).comp ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp ((WitnessState.measurable_augmented n).comp hW)))
  apply GenericCreditIteration.bounded_nonnegative_integrable μ _
    (Measurable.ite hP.setOf ((rootLeafWitness_measurable Γ _ _ p).comp hW) measurable_const)
    (rootLeafCap (insert p (leafLabels f)) p B)
  intro ω
  split_ifs
  · exact rootLeafWitness_bounds Γ _ _ p (W ω) B (hV ω)
  · exact ⟨le_rfl,rootLeafCap_nonneg _ _ _⟩

theorem integral_mainTupleObservable_le {Ω : Type*} [MeasurableSpace Ω]
    {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R B : ℝ)
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→WitnessState n) (hW : Measurable W)
    (hV : ∀ω,(W ω).Valid B) (hE : ∀ω,EmptyLineCredit (W ω).augmented.physical)
    (hunit : ∀ω q,(W ω).retained q=if q∈(W ω).augmented.physical.process.selected then 1 else 0) :
    (∫ω,mainTupleObservable f R (W ω) ∂μ)≤
      ∫ω,rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p (W ω) ∂μ := by
  classical
  have hj : Integrable (fun ω=>rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p (W ω)) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _
      ((rootLeafWitness_measurable Γ _ _ p).comp hW) (rootLeafCap _ p B)
      (fun ω=>rootLeafWitness_bounds Γ _ _ p (W ω) B (hV ω))
  apply integral_mono (mainTupleObservable_integrable f hD R B μ W hW hV hE hunit) hj
  intro ω
  change mainTupleObservable f R (W ω)≤rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p (W ω)
  rw [mainTupleObservable_eq_indicator f hD R (W ω) (hV ω).1.1.1 (hE ω) (hunit ω)]
  split_ifs
  · exact le_rfl
  · exact (rootLeafWitness_bounds Γ _ _ p (W ω) B (hV ω)).1

theorem mainTupleObservable_zero_of_not_separated {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (hN : ¬NoSpecifiedCrossPairs f) (a : WitnessState n) :
    mainTupleObservable f R a=0 :=
  if_neg (fun he=>hN he.2.2.2.1)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.mainTupleObservable_integrable
#print axioms NoThreeLine.ShortStars.integral_mainTupleObservable_le
