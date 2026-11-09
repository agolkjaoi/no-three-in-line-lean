import NoThreeLine.ShortStarWeightedPattern
import NoThreeLine.ShortStarLeafRepeatCap
import NoThreeLine.ShortStarMainObservable
import NoThreeLine.ScheduledCutPhysicalCoarse

/-! Coarse repetition comparison for the actual physical tuple product.
All active/selected indicators remain present. The root-line factors are
bounded above by one; no occupied repeated root line is declared empty. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines AuxiliaryODE MixedConnection BirthWitness

theorem realized_leaf_witness_disjoint {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (s : ProcessState n) (hs : TupleRealized f s) :
    Disjoint (leafLabels f) (witnessLabels f) := by
  classical
  apply Finset.disjoint_left.mpr
  intro q hq hz
  obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hq
  obtain ⟨j,_,he⟩ := Finset.mem_image.mp hz
  exact (hs.1.2.1 _ ((s.mem_activeEvents _).mp (hs.2.2.1 i))).1 (he ▸ hs.2.2.2 j)

theorem possibleTuples_card_data {n m a j : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hf : f∈possibleTuples Γ p H m a j) :
    (insert p (leafLabels f)).card=a+1 ∧
      ((insert p (leafLabels f))∪witnessLabels f).card=a+j+1 := by
  classical
  obtain ⟨ha,hj,s,hs⟩ := (Finset.mem_filter.mp hf).2
  have hp : p∉leafLabels f := fun h=>root_not_mem_labels f (Finset.mem_union_left _ h)
  have hpD : p∉witnessLabels f := fun h=>root_not_mem_labels f (Finset.mem_union_right _ h)
  have hd : Disjoint (insert p (leafLabels f)) (witnessLabels f) :=
    Finset.disjoint_insert_left.mpr ⟨hpD,realized_leaf_witness_disjoint f s hs⟩
  rw [Finset.card_insert_of_notMem hp,ha,Finset.card_union_of_disjoint hd,
    Finset.card_insert_of_notMem hp,ha,hj]
  omega

theorem tuplePhysicalProduct_measurable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) : Measurable (tuplePhysicalProduct f) := by
  classical
  have hphys := (AugmentedState.measurable_physical n).comp (WitnessState.measurable_augmented n)
  have hproc := (ExtendedState.measurable_process n).comp hphys
  unfold tuplePhysicalProduct
  apply Measurable.mul
  · apply Measurable.mul
    · apply Measurable.mul
      · exact Measurable.ite (((measurable_finset_mem p).comp
          ((activeEvents_measurable n).comp hproc)).setOf) measurable_const measurable_const
      · exact Finset.measurable_prod _ (fun i _=>activeLeafWeight_measurable _)
    · exact Finset.measurable_prod _ (fun i _=>(measurable_pi_apply (starRootLine (f i))).comp
        ((ExtendedState.measurable_lineCredits n).comp hphys))
  · exact Finset.measurable_prod _ (fun i _=>Measurable.ite
      (((measurable_finset_mem (f i).val.2).comp
        ((ProcessState.measurable_selected n).comp hproc)).setOf) measurable_const measurable_const)

theorem tuplePhysicalProduct_bounds {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (a : WitnessState n) (B : ℝ) (hB : 0≤B)
    (ha : a.Valid B) : 0≤tuplePhysicalProduct f a ∧ tuplePhysicalProduct f a≤B^m := by
  classical
  have hw0 : 0≤∏i : Fin m,activeLeafWeight (f i).val.1 a :=
    Finset.prod_nonneg (fun i _=>(activeLeafWeight_bounds _ a B hB ha).1)
  have hw1 : (∏i : Fin m,activeLeafWeight (f i).val.1 a)≤B^m := by
    calc _≤∏_i : Fin m,B := Finset.prod_le_prod
           (fun i _=>(activeLeafWeight_bounds _ a B hB ha).1)
           (fun i _=>(activeLeafWeight_bounds _ a B hB ha).2)
         _=_ := by simp
  have hr0 : 0≤∏i : Fin m,a.augmented.physical.lineCredits (starRootLine (f i)) :=
    Finset.prod_nonneg (fun i _=>(ha.1.1.2.1.2.2 _).1)
  have hr1 : (∏i : Fin m,a.augmented.physical.lineCredits (starRootLine (f i)))≤1 :=
    Finset.prod_le_one (fun i _=>(ha.1.1.2.1.2.2 _).1) (fun i _=>(ha.1.1.2.1.2.2 _).2)
  have hz := selectedLabelProduct_bounds (witnessLabels f) a.augmented.physical.process
  unfold tuplePhysicalProduct
  rw [selectedLabelProduct_image]
  change 0≤(if _ then (1:ℝ) else 0)*_*_*selectedLabelProduct (witnessLabels f) _ ∧ _
  split_ifs
  · simp only [one_mul]
    exact ⟨mul_nonneg (mul_nonneg hw0 hr0) hz.1,
      (mul_le_mul_of_nonneg_left hz.2 (mul_nonneg hw0 hr0)).trans
        (by simpa using (mul_le_mul_of_nonneg_left hr1 hw0).trans (by simpa using hw1))⟩
  · simp [pow_nonneg hB]

theorem tuplePhysicalProduct_ne_zero_realized {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (a : WitnessState n)
    (ha : a.augmented.physical.process.Valid) (hz : tuplePhysicalProduct f a≠0) :
    TupleRealized f a.augmented.physical.process := by
  classical
  simp only [tuplePhysicalProduct,mul_ne_zero_iff] at hz
  refine ⟨ha,?_,?_,?_⟩
  · by_contra hp
    exact hz.1.1.1 (if_neg hp)
  · intro i
    by_contra hi
    exact hz.1.1.2 (Finset.prod_eq_zero (Finset.mem_univ i) (show activeLeafWeight (f i).val.1 a=0 from if_neg hi))
  · intro i
    by_contra hi
    exact hz.2 (Finset.prod_eq_zero (Finset.mem_univ i) (if_neg hi))

theorem tuplePhysicalProduct_le_repeat_physical {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (a : WitnessState n) (B : ℝ) (hB : 0<B)
    (ha : a.Valid B) : tuplePhysicalProduct f a≤
      B^(m-(leafLabels f).card)*physicalLeafProduct (insert p (leafLabels f))
        (witnessLabels f) p a.augmented.physical := by
  classical
  by_cases hz : tuplePhysicalProduct f a=0
  · rw [hz]
    exact mul_nonneg (pow_nonneg hB.le _) (physicalLeafProduct_bounds _ _ p _ B ha.1.1).1
  have hs := tuplePhysicalProduct_ne_zero_realized f a ha.1.1.1 hz
  have hp : p∉leafLabels f := fun h=>root_not_mem_labels f (Finset.mem_union_left _ h)
  have hC : insert p (leafLabels f)⊆a.augmented.physical.process.activeEvents := by
    intro q hq
    rcases Finset.mem_insert.mp hq with rfl|hq
    · exact hs.2.1
    · obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hq
      exact hs.2.2.1 i
  have hD : witnessLabels f⊆a.augmented.physical.process.selected := by
    intro q hq
    obtain ⟨i,_,rfl⟩ := Finset.mem_image.mp hq
    exact hs.2.2.2 i
  have hr1 : (∏i : Fin m,a.augmented.physical.lineCredits (starRootLine (f i)))≤1 :=
    Finset.prod_le_one (fun i _=>(ha.1.1.2.1.2.2 _).1) (fun i _=>(ha.1.1.2.1.2.2 _).2)
  have hw0 : 0≤∏i : Fin m,activeLeafWeight (f i).val.1 a :=
    Finset.prod_nonneg (fun i _=>(activeLeafWeight_bounds _ a B hB.le ha).1)
  have hwe : (∏q∈leafLabels f,activeLeafWeight q a)=rootWeightProduct (leafLabels f) a.augmented.physical := by
    apply Finset.prod_congr rfl
    intro q hq
    exact if_pos (hC (Finset.mem_insert_of_mem hq))
  have hrep := prod_activeLeafWeight_le_repeat_cap f a B hB ha
  rw [hwe] at hrep
  unfold tuplePhysicalProduct physicalLeafProduct
  rw [if_pos hs.2.1,if_pos hC,Finset.erase_insert hp,selectedLabelProduct_image]
  change (1*(∏i : Fin m,activeLeafWeight (f i).val.1 a))*
    (∏i : Fin m,a.augmented.physical.lineCredits (starRootLine (f i)))*
      selectedLabelProduct (witnessLabels f) a.augmented.physical.process≤_
  simp only [selectedLabelProduct_eq_indicator,if_pos hD,one_mul,mul_one]
  exact (mul_le_mul_of_nonneg_left hr1 hw0).trans (by simpa using hrep)

theorem tuplePhysicalProduct_integrable {Ω : Type*} [MeasurableSpace Ω]
    {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (B : ℝ) (hB : 0≤B)
    (μ : Measure Ω) [IsFiniteMeasure μ] (W : Ω→WitnessState n) (hW : Measurable W)
    (hV : ∀ω,(W ω).Valid B) : Integrable (fun ω=>tuplePhysicalProduct f (W ω)) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    ((tuplePhysicalProduct_measurable f).comp hW) (B^m)
    (fun ω=>tuplePhysicalProduct_bounds f (W ω) B hB (hV ω))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.possibleTuples_card_data
#print axioms NoThreeLine.ShortStars.tuplePhysicalProduct_le_repeat_physical
#print axioms NoThreeLine.ShortStars.tuplePhysicalProduct_integrable
