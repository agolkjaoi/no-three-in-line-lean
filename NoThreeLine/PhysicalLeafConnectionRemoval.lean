import NoThreeLine.ActiveConnectionFloor

/-! A physical leaf product keeps all active-label and selected-witness
indicators. Removing its connection factors costs a positive guard floor;
this coarse comparison is separate from the coefficient-one main term. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE MixedConnection

def selectedLabelProduct {n : ℕ} (D : Finset (Grid n)) (s : ProcessState n) : ℝ :=
  ∏q∈D,if q∈s.selected then 1 else 0

def physicalLeafProduct {n : ℕ} (C D : Finset (Grid n)) (p : Grid n)
    (a : ExtendedState n) : ℝ :=
  if C⊆a.process.activeEvents then
    rootWeightProduct (C.erase p) a*selectedLabelProduct D a.process else 0

theorem selectedLabelProduct_bounds {n : ℕ} (D : Finset (Grid n)) (s : ProcessState n) :
    0≤selectedLabelProduct D s ∧ selectedLabelProduct D s≤1 := by
  constructor
  · exact Finset.prod_nonneg (fun q _=>by split_ifs <;> norm_num)
  · exact Finset.prod_le_one (fun q _=>by split_ifs <;> norm_num)
      (fun q _=>by split_ifs <;> norm_num)

theorem selectedLabelProduct_eq_indicator {n : ℕ} (D : Finset (Grid n)) (s : ProcessState n) :
    selectedLabelProduct D s=if D⊆s.selected then 1 else 0 := by
  classical
  by_cases h : D⊆s.selected
  · rw [if_pos h]
    exact Finset.prod_eq_one (fun q hq=>if_pos (h hq))
  · rw [if_neg h]
    obtain ⟨q,hq,hqs⟩ := Finset.not_subset.mp h
    exact Finset.prod_eq_zero hq (if_neg hqs)

theorem selectedLabelProduct_image {ι : Type*} [DecidableEq ι] {n : ℕ}
    (I : Finset ι) (f : ι→Grid n) (s : ProcessState n) :
    (∏i∈I,if f i∈s.selected then (1:ℝ) else 0)=selectedLabelProduct (I.image f) s := by
  classical
  rw [selectedLabelProduct_eq_indicator]
  by_cases h : I.image f⊆s.selected
  · rw [if_pos h]
    exact Finset.prod_eq_one (fun i hi=>if_pos (h (Finset.mem_image.mpr ⟨i,hi,rfl⟩)))
  · rw [if_neg h]
    obtain ⟨q,hq,hqs⟩ := Finset.not_subset.mp h
    obtain ⟨i,hi,rfl⟩ := Finset.mem_image.mp hq
    exact Finset.prod_eq_zero hi (if_neg hqs)

theorem physicalLeafProduct_measurable {n : ℕ} (C D : Finset (Grid n)) (p : Grid n) :
    Measurable (physicalLeafProduct C D p) := by
  unfold physicalLeafProduct rootWeightProduct selectedLabelProduct
  apply Measurable.ite
  · exact ((measurable_of_countable (fun S : Finset (Grid n)=>C⊆S)).comp
      ((activeEvents_measurable n).comp (ExtendedState.measurable_process n))).setOf
  · apply Measurable.mul
    · exact Finset.measurable_prod _ (fun q _=>CreditAccount.measurable_weight.comp
        ((ProcessState.measurable_account n q).comp (ExtendedState.measurable_process n)))
    · apply Finset.measurable_prod
      intro q _
      exact Measurable.ite (((measurable_finset_mem q).comp
        ((ProcessState.measurable_selected n).comp (ExtendedState.measurable_process n))).setOf)
        measurable_const measurable_const
  · exact measurable_const

theorem physicalLeafProduct_bounds {n : ℕ} (C D : Finset (Grid n)) (p : Grid n)
    (a : ExtendedState n) (B : ℝ) (ha : a.Valid B) :
    0≤physicalLeafProduct C D p a ∧ physicalLeafProduct C D p a≤(max 1 B)^(C.erase p).card := by
  classical
  have hw0 : 0≤rootWeightProduct (C.erase p) a :=
    Finset.prod_nonneg (fun q _=>(ha.2.1.1 q).1)
  have hw : rootWeightProduct (C.erase p) a≤(max 1 B)^(C.erase p).card := by
    calc _≤∏q∈C.erase p,max 1 B := Finset.prod_le_prod
           (fun q _=>(ha.2.1.1 q).1) (fun q _=>(ha.2.1.1 q).2.trans (le_max_right _ _))
         _=_ := by simp
  have hs := selectedLabelProduct_bounds D a.process
  unfold physicalLeafProduct
  split_ifs
  · exact ⟨mul_nonneg hw0 hs.1,(mul_le_mul_of_nonneg_left hs.2 hw0).trans (by simpa using hw)⟩
  · exact ⟨le_rfl,pow_nonneg (le_max_of_le_left zero_le_one) _⟩

theorem physicalLeafProduct_zero_of_not_disjoint {n : ℕ} (C D : Finset (Grid n))
    (p : Grid n) (a : ExtendedState n) (ha : a.process.Valid) (hCD : ¬Disjoint C D) :
    physicalLeafProduct C D p a=0 := by
  classical
  rw [Finset.disjoint_left] at hCD
  push Not at hCD
  obtain ⟨q,hqC,hqD⟩ := hCD
  unfold physicalLeafProduct
  split_ifs with hC
  · have hq : q∉a.process.selected := (ha.2.1 q ((a.process.mem_activeEvents q).mp (hC hqC))).1
    have hz : selectedLabelProduct D a.process=0 := Finset.prod_eq_zero hqD (if_neg hq)
    rw [hz,mul_zero]
  · rfl

theorem physicalLeafProduct_connection {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (C D : Finset (Grid n)) (p : Grid n) (a : WitnessState n)
    (hunit : ∀q,a.retained q=if q∈a.augmented.physical.process.selected then 1 else 0) :
    physicalLeafProduct C D p a.augmented.physical*connectionProduct Γ C a.augmented.physical=
      rootLeafWitness Γ C D p a := by
  classical
  have hs : witnessProduct D a=selectedLabelProduct D a.augmented.physical.process :=
    Finset.prod_congr rfl (fun q _=>hunit q)
  unfold physicalLeafProduct rootLeafWitness rootLeafPhi
  rw [hs]
  split_ifs <;> ring

theorem physicalLeafProduct_le_connection_cost {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (C D : Finset (Grid n)) (p : Grid n) (a : WitnessState n) (B δ : ℝ)
    (ha : a.Valid B) (hδ : 0<δ)
    (hunit : ∀q,a.retained q=if q∈a.augmented.physical.process.selected then 1 else 0)
    (hfloor : C⊆a.augmented.physical.process.activeEvents →
      δ^(C.card^3)≤connectionProduct Γ C a.augmented.physical) :
    physicalLeafProduct C D p a.augmented.physical≤(δ^(C.card^3))⁻¹*rootLeafWitness Γ C D p a := by
  classical
  by_cases hC : C⊆a.augmented.physical.process.activeEvents
  · have hh := mul_le_mul_of_nonneg_left (hfloor hC) (physicalLeafProduct_bounds C D p _ B ha.1.1).1
    rw [physicalLeafProduct_connection Γ C D p a hunit] at hh
    simpa only [div_eq_mul_inv,mul_comm] using (le_div_iff₀ (pow_pos hδ _)).mpr hh
  · simp only [physicalLeafProduct,if_neg hC,rootLeafWitness,rootLeafPhi,mul_zero,le_refl]

theorem physicalLeafProduct_integrable {Ω : Type*} [MeasurableSpace Ω] {n : ℕ}
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→ExtendedState n) (hW : Measurable W)
    (C D : Finset (Grid n)) (p : Grid n) (B : ℝ) (hV : ∀ω,(W ω).Valid B) :
    Integrable (fun ω=>physicalLeafProduct C D p (W ω)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    ((physicalLeafProduct_measurable C D p).comp hW) ((max 1 B)^(C.erase p).card)
    (fun ω=>physicalLeafProduct_bounds C D p (W ω) B (hV ω))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.selectedLabelProduct_image
#print axioms NoThreeLine.BirthWitness.physicalLeafProduct_le_connection_cost
#print axioms NoThreeLine.BirthWitness.physicalLeafProduct_integrable
