import NoThreeLine.ShortStarTupleEmpty
import NoThreeLine.PhysicalLeafExpansion

/-! The main short-star observable retains its concrete no-exception event.
On that event the actual physical product equals the root-leaf witness.
No no-exception condition is imposed on every sample path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines GridLines AuxiliaryODE MixedConnection BirthWitness

def TupleMainEvent {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (s : ProcessState n) : Prop :=
  p∈s.activeEvents ∧ (∀i,(f i).val.1∈s.activeEvents) ∧ (∀i,(f i).val.2∈s.selected) ∧
    NoSpecifiedCrossPairs f ∧ NoLongLeafPairException f R ∧
      NoExtraSelectedException f s R ∧ NoThirdWitnessException f

instance {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (s : ProcessState n) :
    Decidable (TupleMainEvent f R s) := Classical.propDecidable _

def tuplePhysicalProduct {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (a : WitnessState n) : ℝ :=
  (if p∈a.augmented.physical.process.activeEvents then (1:ℝ) else 0)*
    (∏i : Fin m,activeLeafWeight (f i).val.1 a)*
    (∏i : Fin m,a.augmented.physical.lineCredits (starRootLine (f i)))*
    (∏i : Fin m,if (f i).val.2∈a.augmented.physical.process.selected then (1:ℝ) else 0)

def mainTupleObservable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) (a : WitnessState n) : ℝ :=
  if TupleMainEvent f R a.augmented.physical.process then tuplePhysicalProduct f a else 0

theorem tupleMainEvent_measurable {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (R : ℝ) : Measurable (TupleMainEvent f R) := by
  classical
  let pred (x : Finset (Grid n)×Finset (Grid n)) : Prop :=
    p∈x.1 ∧ (∀i,(f i).val.1∈x.1) ∧ (∀i,(f i).val.2∈x.2) ∧
      NoSpecifiedCrossPairs f ∧ NoLongLeafPairException f R ∧
        (∀i j : Fin m,i≠j → ∀v∈x.2,v∉insert p (leafLabels f∪witnessLabels f) →
          (((f i).val,(f j).val),v)∉freshExtraPointTriples Γ p H R) ∧ NoThirdWitnessException f
  exact (measurable_of_countable pred).comp ((activeEvents_measurable n).prodMk (ProcessState.measurable_selected n))

theorem rootLineProduct_eq_tuple {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (e : ExtendedState n) :
    (∏q : leafLabels f,e.lineCredits (rootLeafLine p (leafLabels f)
      (fun hp => root_not_mem_labels f (Finset.mem_union_left _ hp)) q))=
      ∏i : Fin m,e.lineCredits (starRootLine (f i)) := by
  classical
  let g : Fin m→leafLabels f := fun i=>⟨(f i).val.1,Finset.mem_image.mpr ⟨i,Finset.mem_univ _,rfl⟩⟩
  have hg : Function.Bijective g := by
    constructor
    · intro i j he
      exact leaf_injective f hD (congrArg Subtype.val he)
    · intro q
      obtain ⟨i,_,hi⟩ := Finset.mem_image.mp q.property
      exact ⟨i,Subtype.ext hi⟩
  calc
    _ = ∏i : Fin m,e.lineCredits (rootLeafLine p (leafLabels f)
        (fun hp => root_not_mem_labels f (Finset.mem_union_left _ hp)) (g i)) :=
      (Equiv.prod_comp (Equiv.ofBijective g hg) _).symm
    _ = _ := by
      apply Finset.prod_congr rfl
      intro i _
      congr 1

theorem rootLeafWitness_eq_tuple_on_event {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ) (a : WitnessState n)
    (hV : a.augmented.physical.process.Valid) (hE : EmptyLineCredit a.augmented.physical)
    (hunit : ∀q,a.retained q=if q∈a.augmented.physical.process.selected then 1 else 0)
    (he : TupleMainEvent f R a.augmented.physical.process) :
    rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p a=tuplePhysicalProduct f a := by
  classical
  have hreal : TupleRealized f a.augmented.physical.process := ⟨hV,he.1,he.2.1,he.2.2.1⟩
  have hp : p∉leafLabels f := fun h=>root_not_mem_labels f (Finset.mem_union_left _ h)
  have hC : insert p (leafLabels f)⊆a.augmented.physical.process.activeEvents := by
    intro q hq
    rcases Finset.mem_insert.mp hq with hqp|hq
    · exact hqp ▸ he.1
    · obtain ⟨i,_,hi⟩ := Finset.mem_image.mp hq
      exact hi ▸ he.2.1 i
  rw [rootLeafWitness,rootLeafPhi,if_pos hC,
    connectionProduct_of_no_exceptions f hD he.2.2.2.1 a.augmented.physical hreal hE R
      he.2.2.2.2.1 he.2.2.2.2.2.1 he.2.2.2.2.2.2,rootLineProduct_eq_tuple f hD]
  unfold witnessProduct rootWeightProduct
  rw [Finset.erase_insert hp]
  rw [show (∏q∈witnessLabels f,a.retained q)=∏i : Fin m,a.retained (f i).val.2 by
    exact Finset.prod_image (fun i _ j _ hij=>witness_injective f hD hij)]
  rw [show (∏q∈leafLabels f,(a.augmented.physical.process.accounts q).weight)=
      ∏i : Fin m,(a.augmented.physical.process.accounts (f i).val.1).weight by
    exact Finset.prod_image (fun i _ j _ hij=>leaf_injective f hD hij)]
  unfold tuplePhysicalProduct
  simp only [if_pos he.1,one_mul]
  have hw : (∏i : Fin m,activeLeafWeight (f i).val.1 a)=
      ∏i : Fin m,(a.augmented.physical.process.accounts (f i).val.1).weight := by
    apply Finset.prod_congr rfl
    intro i _
    exact if_pos (he.2.1 i)
  rw [hw]
  simp_rw [hunit]
  ring

theorem mainTupleObservable_eq_indicator {n m : ℕ} {Γ : Finset ZPoint} {p : Grid n} {H : ℝ}
    (f : Fin m→↥(shortStars Γ p H)) (hD : RootLinePairwise f) (R : ℝ) (a : WitnessState n)
    (hV : a.augmented.physical.process.Valid) (hE : EmptyLineCredit a.augmented.physical)
    (hunit : ∀q,a.retained q=if q∈a.augmented.physical.process.selected then 1 else 0) :
    mainTupleObservable f R a=if TupleMainEvent f R a.augmented.physical.process then
      rootLeafWitness Γ (insert p (leafLabels f)) (witnessLabels f) p a else 0 := by
  classical
  unfold mainTupleObservable
  split_ifs with he
  · exact (rootLeafWitness_eq_tuple_on_event f hD R a hV hE hunit he).symm
  · rfl

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.rootLeafWitness_eq_tuple_on_event
#print axioms NoThreeLine.ShortStars.mainTupleObservable_eq_indicator
