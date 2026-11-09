import NoThreeLine.PairHHGeometry
import NoThreeLine.ProtectedLineBirth

/-! An external point affects at most |Gamma| points of one actual board
line by specified directions. Repeated/opposite directions only overcount. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines GridLines MixedConnection LineDrift PairWitness

def externalSpecifiedPoints {n : ℕ} (Γ : Finset ZPoint) (L : LineIndex n) (q : Grid n) :
    Finset (Grid n) := L.val.filter (fun y=>specifiedPair Γ y q)

theorem externalSpecifiedPoints_card_le {n : ℕ} (Γ : Finset ZPoint)
    (L : LineIndex n) (q : Grid n) (hqL : q∉L.val) : (externalSpecifiedPoints Γ L q).card≤Γ.card := by
  have hsub : externalSpecifiedPoints Γ L q⊆(rootSpecifiedLines Γ q).biUnion (fun K=>L.val∩K.val) := by
    intro y hy
    obtain ⟨hyL,hsp⟩ := Finset.mem_filter.mp hy
    have hqy : q≠y := fun he=>hqL (he.symm ▸ hyL)
    let K := boardLineThrough q y hqy
    have hqK : q∈K.val := left_mem_lineThrough q y
    have hK : K∈rootSpecifiedLines Γ q := Finset.mem_filter.mpr ⟨Finset.mem_univ _,hqK,
      (specified_iff_designated Γ q K hqK).mpr ((designated_iff Γ q y hqy).mpr
        ((BirthLineGroups.specifiedPair_swap Γ y q).mp hsp))⟩
    exact Finset.mem_biUnion.mpr ⟨K,hK,Finset.mem_inter.mpr ⟨hyL,right_mem_lineThrough q y⟩⟩
  calc
    _ ≤ ((rootSpecifiedLines Γ q).biUnion (fun K=>L.val∩K.val)).card := Finset.card_le_card hsub
    _ ≤ ∑K∈rootSpecifiedLines Γ q,(L.val∩K.val).card := Finset.card_biUnion_le
    _ ≤ ∑_K∈rootSpecifiedLines Γ q,1 := by
      apply Finset.sum_le_sum
      intro K hK
      apply boardLine_inter_card_le_one L K
      intro he
      exact hqL (he.symm ▸ (Finset.mem_filter.mp hK).2.1)
    _ = (rootSpecifiedLines Γ q).card := by simp
    _ ≤ Γ.card := rootSpecifiedLines_card_le Γ q

theorem specifiedLineWeight_eq_normalized {n : ℕ} (e : ExtendedState n)
    (L : LineIndex n) (p : Grid n) :
    specifiedLineWeight e L p=normalizedLineWeight e.process e.coordinates L p := by
  rw [normalizedLineWeight_eq]
  rfl

theorem protected_external_loss_leaf_le {n : ℕ} (e : ExtendedState n) (Γ : Finset ZPoint)
    (L : LineIndex n) (p q : Grid n) (B K : ℝ) (he : e.Valid B)
    (hp : (e.process.accounts p).status=.active) (hq : (e.process.accounts q).status=.active)
    (hpq : p≠q) (hN : occupancy e.process L≤1) (hclock : e.clocks L≤K) (hK : K<2) :
    (1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight e L p≤
      (if virtualLeaf e.process Γ p q then specifiedLineWeight e L p else 0)+
      (if specifiedPair Γ p q then specifiedLineWeight e L p else 0) := by
  have hc := (specifiedLineWeight_bounds e L p B K he hN hclock hK).1
  by_cases hsp : specifiedPair Γ p q
  · rw [if_pos hsp]
    have hl : (1-birthMultiplier Γ e.process.selected p q)*specifiedLineWeight e L p≤specifiedLineWeight e L p :=
      mul_le_of_le_one_left hc (by linarith [(birthMultiplier_bounds Γ e.process.selected p q).1])
    exact hl.trans (le_add_of_nonneg_left (by split_ifs <;> positivity))
  · have hg := growthFactor_eq_loss Γ e.process.selected p q (he.1.2.1 p hp) (he.1.2.1 q hq).1
    by_cases hw : selectedWitness e.process.selected p q
    · have hv : virtualLeaf e.process Γ p q := ⟨hp,hsp,hw⟩
      simp only [localGrowthFactor,if_neg hpq,if_pos hw] at hg
      rw [if_pos hv,if_neg hsp,add_zero,←hg,one_mul]
    · have hv : ¬virtualLeaf e.process Γ p q := fun h=>hw h.2.2
      simp only [localGrowthFactor,if_neg hpq,if_neg hw,if_neg hsp] at hg
      rw [if_neg hv,if_neg hsp,zero_add,←hg,zero_mul]

end NoThreeLine

#print axioms NoThreeLine.externalSpecifiedPoints_card_le
#print axioms NoThreeLine.protected_external_loss_leaf_le
