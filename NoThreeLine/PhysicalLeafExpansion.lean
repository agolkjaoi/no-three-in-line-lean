import NoThreeLine.PhysicalLeafRepetition
import NoThreeLine.LineLabelConnection
import NoThreeLine.RootLeafCredit

/-! Expand one retained birth witness and a power of the real active physical
leaf sum on one non-specified line. Distinct leaf products retain their actual
line-credit connection. Repetitions cost B per reused physical leaf. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open FiniteWitnessMoments AuxiliaryODE PrimitiveLines MixedConnection

def physicalRootLabels {n : ℕ} {α : Type*} [DecidableEq α] {k : ℕ}
    (leaf : α→Grid n) (p : Grid n) (f : Fin k→α) : Finset (Grid n) :=
  insert p ((tupleLabels f).image leaf)

theorem physicalRootLabels_subset_iff {n : ℕ} {α : Type*} [DecidableEq α] {k : ℕ}
    (leaf : α→Grid n) (p : Grid n) (f : Fin k→α) (A : Finset (Grid n)) :
    physicalRootLabels leaf p f⊆A ↔ p∈A ∧ ∀i,leaf (f i)∈A := by
  simp [physicalRootLabels,tupleLabels,Finset.insert_subset_iff,Finset.image_subset_iff]

def activeLeafWeight {n : ℕ} (q : Grid n) (a : WitnessState n) : ℝ :=
  if q∈a.augmented.physical.process.activeEvents then (a.augmented.physical.process.accounts q).weight else 0

def lineLeafPower {n : ℕ} {α : Type*} [Fintype α]
    (leaf : α→Grid n) (mask : α→ℝ) (L : LineIndex n) (p z : Grid n) (k : ℕ) (a : WitnessState n) : ℝ :=
  if p∈a.augmented.physical.process.activeEvents then
    a.retained z*(a.augmented.physical.lineCredits L*∑q : α,mask q*activeLeafWeight (leaf q) a)^k else 0

def lineLeafTuple {n : ℕ} {α : Type*} [DecidableEq α] {k : ℕ}
    (leaf : α→Grid n) (mask : α→ℝ) (L : LineIndex n) (p z : Grid n) (f : Fin k→α) (a : WitnessState n) : ℝ :=
  if physicalRootLabels leaf p f⊆a.augmented.physical.process.activeEvents then
    a.retained z*a.augmented.physical.lineCredits L^k*
      ∏i : Fin k,mask (f i)*(a.augmented.physical.process.accounts (leaf (f i))).weight else 0

theorem lineLeafPower_eq_sum {n : ℕ} {α : Type*} [Fintype α] [DecidableEq α]
    (leaf : α→Grid n) (mask : α→ℝ) (L : LineIndex n) (p z : Grid n) (k : ℕ) (a : WitnessState n) :
    lineLeafPower leaf mask L p z k a=∑f : Fin k→α,lineLeafTuple leaf mask L p z f a := by
  classical
  by_cases hp : p∈a.augmented.physical.process.activeEvents
  · rw [lineLeafPower,if_pos hp,mul_pow,Fintype.sum_pow,←mul_assoc,Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro f _
    by_cases hC : physicalRootLabels leaf p f⊆a.augmented.physical.process.activeEvents
    · have hf := (physicalRootLabels_subset_iff leaf p f _).mp hC
      simp only [lineLeafTuple,if_pos hC]
      congr 1
      apply Finset.prod_congr rfl
      intro i _
      rw [activeLeafWeight,if_pos (hf.2 i)]
    · have hi : ∃i,leaf (f i)∉a.augmented.physical.process.activeEvents := by
        by_contra hh
        push Not at hh
        exact hC ((physicalRootLabels_subset_iff leaf p f _).mpr ⟨hp,hh⟩)
      obtain ⟨i,hi⟩ := hi
      have hz : (∏j : Fin k,mask (f j)*activeLeafWeight (leaf (f j)) a)=0 :=
        Finset.prod_eq_zero (Finset.mem_univ i) (by rw [activeLeafWeight,if_neg hi,mul_zero])
      rw [hz,mul_zero,lineLeafTuple,if_neg hC]
  · rw [lineLeafPower,if_neg hp]
    symm
    apply Finset.sum_eq_zero
    intro f _
    exact if_neg (fun hC=>hp ((physicalRootLabels_subset_iff leaf p f _).mp hC).1)

theorem physicalRootLeaf_eq {n : ℕ} {α : Type*} [DecidableEq α] {k : ℕ}
    (leaf : α→Grid n) (hinj : Function.Injective leaf) (p z : Grid n) (f : Fin k→α)
    (L : LineIndex n) (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val)
    (hleaf : ∀q,leaf q∈L.val) (hne : ∀q,leaf q≠p) (a : WitnessState n) :
    rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p a=
      if physicalRootLabels leaf p f⊆a.augmented.physical.process.activeEvents then
        a.retained z*((∏q∈tupleLabels f,(a.augmented.physical.process.accounts (leaf q)).weight)*
          a.augmented.physical.lineCredits L^(tupleLabels f).card) else 0 := by
  classical
  have hnp : p∉(tupleLabels f).image leaf := by
    intro hp
    obtain ⟨q,hq,heq⟩ := Finset.mem_image.mp hp
    exact hne q heq
  have hCL : physicalRootLabels leaf p f⊆L.val :=
    (physicalRootLabels_subset_iff leaf p f _).mpr ⟨hpL,fun i=>hleaf (f i)⟩
  rw [rootLeafWitness,witnessProduct,Finset.prod_singleton,rootLeafPhi]
  by_cases hC : physicalRootLabels leaf p f⊆a.augmented.physical.process.activeEvents
  · rw [if_pos hC,if_pos hC,connectionProduct_of_subset_nonspecified_line Γ _ _ L hL hCL]
    unfold rootWeightProduct physicalRootLabels
    rw [Finset.erase_insert hnp,Finset.card_insert_of_notMem hnp,Finset.card_image_of_injective _ hinj]
    simp only [Nat.add_sub_cancel]
    rw [Finset.prod_image (fun q _ r _ h=>hinj h)]
  · rw [if_neg hC,if_neg hC,mul_zero]

theorem lineLeafTuple_le_rootLeaf {n : ℕ} {α : Type*} [DecidableEq α] {k : ℕ}
    (leaf : α→Grid n) (hinj : Function.Injective leaf) (mask : α→ℝ) (hm : ∀q,0≤mask q)
    (L : LineIndex n) (p z : Grid n) (Γ : Finset ZPoint) (hL : ¬specified Γ L)
    (hpL : p∈L.val) (hleaf : ∀q,leaf q∈L.val) (hne : ∀q,leaf q≠p)
    (f : Fin k→α) (a : WitnessState n) (B : ℝ) (hB : 0<B) (ha : a.Valid B) :
    lineLeafTuple leaf mask L p z f a≤
      ((∏i : Fin k,mask (f i))*B^(k-(tupleLabels f).card))*
        rootLeafWitness Γ (physicalRootLabels leaf p f) {z} p a := by
  classical
  rw [physicalRootLeaf_eq leaf hinj p z f L Γ hL hpL hleaf hne]
  by_cases hC : physicalRootLabels leaf p f⊆a.augmented.physical.process.activeEvents
  · rw [lineLeafTuple,if_pos hC,if_pos hC]
    have hr : 0≤a.augmented.physical.lineCredits L ∧ a.augmented.physical.lineCredits L≤1 := ha.1.1.2.1.2.2 L
    have hw (q : α) : 0≤(a.augmented.physical.process.accounts (leaf q)).weight ∧
        (a.augmented.physical.process.accounts (leaf q)).weight≤B := ha.1.1.2.1.1 (leaf q)
    have hprod := prod_tuple_le_repeat_cap f _ B hB hw
    have hpow := pow_le_pow_of_le_one hr.1 hr.2 (tupleLabels_card_le f)
    have hh := mul_le_mul hpow hprod
      (Finset.prod_nonneg (fun i _=>(hw (f i)).1)) (pow_nonneg hr.1 _)
    have hx := mul_le_mul_of_nonneg_left hh
      (mul_nonneg (ha.2.1 z).1 (Finset.prod_nonneg (s:=Finset.univ) (fun i _=>hm (f i))))
    rw [Finset.prod_mul_distrib]
    convert hx using 1 <;> first | rfl | ring
  · rw [lineLeafTuple,if_neg hC,if_neg hC,mul_zero]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.lineLeafPower_eq_sum
#print axioms NoThreeLine.BirthWitness.physicalRootLeaf_eq
#print axioms NoThreeLine.BirthWitness.lineLeafTuple_le_rootLeaf
