import NoThreeLine.PhysicalLeafRegularity

/-! D-empty powers of actual active physical leaves on one line. Pure
finite-product identities are reused with a constant scalar factor one;
no retained birth witness or additional physical transition is introduced. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments MixedConnection

def sectionLeafPower {n : ℕ} {α : Type*} [Fintype α] (leaf : α → Grid n)
    (L : LineIndex n) (p : Grid n) (m : ℕ) (a : AugmentedState n) : ℝ :=
  if p ∈ a.physical.process.activeEvents then
    (a.physical.lineCredits L * ∑ q : α,
      if leaf q ∈ a.physical.process.activeEvents then (a.physical.process.accounts (leaf q)).weight else 0)^m else 0

def sectionLeafTuple {n : ℕ} {α : Type*} [DecidableEq α] {m : ℕ} (leaf : α → Grid n)
    (L : LineIndex n) (p : Grid n) (f : Fin m → α) (a : AugmentedState n) : ℝ :=
  if physicalRootLabels leaf p f ⊆ a.physical.process.activeEvents then
    a.physical.lineCredits L^m * ∏ i : Fin m, (a.physical.process.accounts (leaf (f i))).weight else 0

theorem sectionLeafPower_eq_sum {n : ℕ} {α : Type*} [Fintype α] [DecidableEq α]
    (leaf : α → Grid n) (L : LineIndex n) (p : Grid n) (m : ℕ) (a : AugmentedState n) :
    sectionLeafPower leaf L p m a = ∑ f : Fin m → α, sectionLeafTuple leaf L p f a := by
  simpa only [sectionLeafPower,sectionLeafTuple,lineLeafPower,lineLeafTuple,activeLeafWeight,one_mul] using
    lineLeafPower_eq_sum leaf (fun _ => 1) L p p m (WitnessState.mk a (fun _ => 1))

theorem sectionRootLeaf_eq {n : ℕ} {α : Type*} [DecidableEq α] {m : ℕ}
    (leaf : α → Grid n) (hinj : Function.Injective leaf) (L : LineIndex n) (p : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (hleaf : ∀ q, leaf q ∈ L.val) (hne : ∀ q, leaf q ≠ p) (f : Fin m → α) (a : AugmentedState n) :
    rootLeafPhi Γ (physicalRootLabels leaf p f) p a.physical =
      if physicalRootLabels leaf p f ⊆ a.physical.process.activeEvents then
        (∏ q ∈ tupleLabels f, (a.physical.process.accounts (leaf q)).weight) *
          a.physical.lineCredits L^(tupleLabels f).card else 0 := by
  simpa only [rootLeafWitness,witnessProduct,Finset.prod_singleton,one_mul] using
    physicalRootLeaf_eq leaf hinj p p f L Γ hL hpL hleaf hne (WitnessState.mk a (fun _ => 1))

theorem sectionLeafTuple_le_rootLeaf {n : ℕ} {α : Type*} [DecidableEq α] {m : ℕ}
    (leaf : α → Grid n) (hinj : Function.Injective leaf) (L : LineIndex n) (p : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p ∈ L.val)
    (hleaf : ∀ q, leaf q ∈ L.val) (hne : ∀ q, leaf q ≠ p) (f : Fin m → α)
    (a : AugmentedState n) (B : ℝ) (hB : 0 < B) (ha : a.Valid B) :
    sectionLeafTuple leaf L p f a ≤ B^(m-(tupleLabels f).card) *
      rootLeafPhi Γ (physicalRootLabels leaf p f) p a.physical := by
  rw [sectionRootLeaf_eq leaf hinj L p Γ hL hpL hleaf hne f a]
  by_cases hC : physicalRootLabels leaf p f ⊆ a.physical.process.activeEvents
  · rw [sectionLeafTuple,if_pos hC,if_pos hC]
    have hr : 0 ≤ a.physical.lineCredits L ∧ a.physical.lineCredits L ≤ 1 := ha.1.2.1.2.2 L
    have hw (q : α) : 0 ≤ (a.physical.process.accounts (leaf q)).weight ∧
        (a.physical.process.accounts (leaf q)).weight ≤ B := ha.1.2.1.1 (leaf q)
    have hprod := prod_tuple_le_repeat_cap f _ B hB hw
    have hpow := pow_le_pow_of_le_one hr.1 hr.2 (tupleLabels_card_le f)
    have hh := mul_le_mul hpow hprod
      (Finset.prod_nonneg (fun i _ => (hw (f i)).1)) (pow_nonneg hr.1 _)
    convert hh using 1 <;> first | rfl | ring
  · rw [sectionLeafTuple,if_neg hC,if_neg hC,mul_zero]

theorem sectionLeafPower_measurable {n : ℕ} {α : Type*} [Fintype α]
    (leaf : α → Grid n) (L : LineIndex n) (p : Grid n) (m : ℕ) :
    Measurable (sectionLeafPower leaf L p m) := by
  unfold sectionLeafPower
  have h := (lineLeafPower_measurable leaf (fun _ => 1) L p p m).comp
    (WitnessState.measurable_mk (fun a : AugmentedState n => a) (fun _ => fun _ => (1:ℝ)) measurable_id measurable_const)
  simpa only [Function.comp_def,sectionLeafPower,lineLeafPower,activeLeafWeight,one_mul] using h

theorem sectionLeafPower_bounds {n : ℕ} {α : Type*} [Fintype α]
    (leaf : α → Grid n) (L : LineIndex n) (p : Grid n) (m : ℕ)
    (a : AugmentedState n) (B : ℝ) (hB : 0 ≤ B) (ha : a.Valid B) :
    0 ≤ sectionLeafPower leaf L p m a ∧ sectionLeafPower leaf L p m a ≤ (B*Fintype.card α)^m := by
  have hr := ha.1.2.1.2.2 L
  have hw (q : α) : 0 ≤ (if leaf q ∈ a.physical.process.activeEvents then
      (a.physical.process.accounts (leaf q)).weight else 0) ∧
      (if leaf q ∈ a.physical.process.activeEvents then (a.physical.process.accounts (leaf q)).weight else 0) ≤ B := by
    split_ifs
    · exact ha.1.2.1.1 _
    · exact ⟨le_rfl,hB⟩
  have hs0 : 0 ≤ ∑ q : α, if leaf q ∈ a.physical.process.activeEvents then
      (a.physical.process.accounts (leaf q)).weight else 0 := Finset.sum_nonneg (fun q _ => (hw q).1)
  have hs1 : (∑ q : α, if leaf q ∈ a.physical.process.activeEvents then
      (a.physical.process.accounts (leaf q)).weight else 0) ≤ B*Fintype.card α := by
    simpa only [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,mul_comm] using
      Finset.sum_le_sum (s:=Finset.univ) (fun q _ => (hw q).2)
  have hb0 := mul_nonneg hr.1 hs0
  have hb1 := (mul_le_of_le_one_left hs0 hr.2).trans hs1
  unfold sectionLeafPower
  split_ifs
  · exact ⟨pow_nonneg hb0 _,pow_le_pow_left₀ hb0 hb1 _⟩
  · exact ⟨le_rfl,pow_nonneg (mul_nonneg hB (Nat.cast_nonneg _)) _⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.sectionLeafPower_eq_sum
#print axioms NoThreeLine.BirthWitness.sectionLeafTuple_le_rootLeaf
#print axioms NoThreeLine.BirthWitness.sectionLeafPower_bounds
