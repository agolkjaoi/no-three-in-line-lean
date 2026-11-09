import NoThreeLine.FiniteBonferroni
import NoThreeLine.BirthLineGroups

/-! The exact S6 grouped coefficient, using the actual birth multipliers,
is paid by the actual off-baseline common-change pair rates. This is finite
generator algebra; identification with a differentiated mixed functional
and a stochastic compensator remains separate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.GroupPairGenerator
open GridLines PrimitiveLines AuxiliaryODE BirthLineGroups FiniteBonferroni

def commonIndicator {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (a b q : Grid n) : ℝ := if commonChange Γ S a b q then 1 else 0

theorem commonIndicator_nonneg {n : ℕ} (Γ : Finset ZPoint) (S : Finset (Grid n))
    (a b q : Grid n) : 0≤commonIndicator Γ S a b q := by
  unfold commonIndicator
  split_ifs <;> norm_num

theorem group_pair_charge {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (hq : q∉C) (L K : Finset (Grid n))
    (hL : L∈rootGroups C q) (hK : K∈rootGroups C q) :
    (if L=K then 0 else (1-groupMultiplier Γ S C q L)*(1-groupMultiplier Γ S C q K)) ≤
      commonIndicator Γ S (groupRoot C q L) (groupRoot C q K) q := by
  have hJL := groupMultiplier_bounds Γ S C q L
  have hJK := groupMultiplier_bounds Γ S C q K
  by_cases hLK : L=K
  · simpa only [if_pos hLK] using commonIndicator_nonneg Γ S _ _ q
  rw [if_neg hLK]
  by_cases hL1 : groupMultiplier Γ S C q L<1
  · by_cases hK1 : groupMultiplier Γ S C q K<1
    · rw [commonIndicator,if_pos (changed_groups_commonChange Γ S C q hq L K hL hK hLK hL1 hK1)]
      nlinarith [mul_nonneg hJL.1 hJK.1,
        mul_nonneg hJL.1 (sub_nonneg.mpr hJK.2)]
    · have he : groupMultiplier Γ S C q K=1 := le_antisymm hJK.2 (le_of_not_gt hK1)
      simpa only [he,sub_self,mul_zero] using commonIndicator_nonneg Γ S _ _ q
  · have he : groupMultiplier Γ S C q L=1 := le_antisymm hJL.2 (le_of_not_gt hL1)
    simpa only [he,sub_self,zero_mul] using commonIndicator_nonneg Γ S _ _ q

theorem groups_charge_le_roots {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (hq : q∉C) :
    orderedPairSum (rootGroups C q) (fun L=>1-groupMultiplier Γ S C q L) ≤
      ∑ a∈C, ∑ b∈C, commonIndicator Γ S a b q := by
  have hrep : (∑ a∈representativeRoots C q, ∑ b∈representativeRoots C q, commonIndicator Γ S a b q) =
      ∑ L∈rootGroups C q, ∑ K∈rootGroups C q,
        commonIndicator Γ S (groupRoot C q L) (groupRoot C q K) q := by
    unfold representativeRoots
    rw [Finset.sum_image (groupRoot_injOn C q)]
    apply Finset.sum_congr rfl
    intro L hL
    rw [Finset.sum_image (groupRoot_injOn C q)]
  calc
    orderedPairSum (rootGroups C q) (fun L=>1-groupMultiplier Γ S C q L)
      ≤ ∑ L∈rootGroups C q, ∑ K∈rootGroups C q,
          commonIndicator Γ S (groupRoot C q L) (groupRoot C q K) q := by
        apply Finset.sum_le_sum
        intro L hL
        apply Finset.sum_le_sum
        intro K hK
        exact group_pair_charge Γ S C q hq L K hL hK
    _ = ∑ a∈representativeRoots C q, ∑ b∈representativeRoots C q, commonIndicator Γ S a b q := hrep.symm
    _ ≤ ∑ a∈representativeRoots C q, ∑ b∈C, commonIndicator Γ S a b q := by
        apply Finset.sum_le_sum
        intro a ha
        exact Finset.sum_le_sum_of_subset_of_nonneg (representatives_subset C q)
          (fun b _ _ => commonIndicator_nonneg Γ S a b q)
    _ ≤ ∑ a∈C, ∑ b∈C, commonIndicator Γ S a b q :=
        Finset.sum_le_sum_of_subset_of_nonneg (representatives_subset C q)
          (fun a _ _ => Finset.sum_nonneg (fun b _ => commonIndicator_nonneg Γ S a b q))

def groupCoefficient {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n)) (q : Grid n) : ℝ :=
  (∑ L∈rootGroups C q, (1-groupMultiplier Γ S C q L)) +
    (∏ L∈rootGroups C q, groupMultiplier Γ S C q L)-1

theorem groupCoefficient_nonneg {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) : 0≤groupCoefficient Γ S C q :=
  (finite_bonferroni (rootGroups C q) (groupMultiplier Γ S C q)
    (fun L _ => groupMultiplier_bounds Γ S C q L)).1

theorem groupCoefficient_le_pairs {n : ℕ} (Γ : Finset ZPoint) (S C : Finset (Grid n))
    (q : Grid n) (hq : q∉C) :
    groupCoefficient Γ S C q ≤ (∑ a∈C, ∑ b∈C, commonIndicator Γ S a b q)/2 := by
  apply (finite_bonferroni (rootGroups C q) (groupMultiplier Γ S C q)
    (fun L _ => groupMultiplier_bounds Γ S C q L)).2.trans
  exact div_le_div_of_nonneg_right (groups_charge_le_roots Γ S C q hq) (by norm_num)

theorem pairRate_indicator_sum {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (a b : Grid n)
    (ha : (s.accounts a).status=.active) (hb : (s.accounts b).status=.active) :
    pairRate s Γ mask z a b = ∑ q : Grid n, phaseRate s mask z.1 q * commonIndicator Γ s.selected a b q := by
  rw [pairRate,if_pos ⟨ha,hb⟩]
  apply Finset.sum_congr rfl
  intro q _
  by_cases h : commonChange Γ s.selected a b q <;> simp [commonIndicator,h]

def externalGroupGenerator {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (C : Finset (Grid n)) : ℝ :=
  ∑ q : Grid n, if q∈s.activeEvents ∧ q∉C then
    phaseRate s mask z.1 q * groupCoefficient Γ s.selected C q else 0

theorem externalGroupGenerator_nonneg {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (C : Finset (Grid n))
    (hm : ∀p,0≤mask p) (hw : ∀p,0≤z.1 p) :
    0≤externalGroupGenerator s Γ mask z C := by
  apply Finset.sum_nonneg
  intro q _
  split_ifs
  · exact mul_nonneg (phaseRate_nonneg s mask z.1 hm hw q) (groupCoefficient_nonneg Γ s.selected C q)
  · exact le_rfl

theorem externalGroupGenerator_le_pairRate {n : ℕ} (s : ProcessState n) (Γ : Finset ZPoint)
    (mask : Grid n → ℝ) (z : Coordinates n) (C : Finset (Grid n))
    (hC : C⊆s.activeEvents) (hm : ∀p,0≤mask p) (hw : ∀p,0≤z.1 p) :
    externalGroupGenerator s Γ mask z C ≤ (∑ a∈C, ∑ b∈C, pairRate s Γ mask z a b)/2 := by
  have hpoint (q : Grid n) :
      (if q∈s.activeEvents ∧ q∉C then phaseRate s mask z.1 q * groupCoefficient Γ s.selected C q else 0) ≤
      phaseRate s mask z.1 q * (∑ a∈C, ∑ b∈C, commonIndicator Γ s.selected a b q)/2 := by
    split_ifs with he
    · simpa only [mul_div_assoc] using mul_le_mul_of_nonneg_left
        (groupCoefficient_le_pairs Γ s.selected C q he.2) (phaseRate_nonneg s mask z.1 hm hw q)
    · apply div_nonneg
      · exact mul_nonneg (phaseRate_nonneg s mask z.1 hm hw q)
          (Finset.sum_nonneg (fun a _ => Finset.sum_nonneg (fun b _ => commonIndicator_nonneg Γ s.selected a b q)))
      · norm_num
  have hsum := Finset.sum_le_sum (fun q (_ : q∈(Finset.univ : Finset (Grid n))) => hpoint q)
  unfold externalGroupGenerator
  refine hsum.trans_eq ?_
  rw [← Finset.sum_div]
  congr 1
  simp_rw [Finset.mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a ha
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro b hb
  exact (pairRate_indicator_sum s Γ mask z a b
    ((s.mem_activeEvents a).mp (hC ha)) ((s.mem_activeEvents b).mp (hC hb))).symm

theorem externalGroupGenerator_le_fixed_label_pairRate {n : ℕ} (s : ProcessState n)
    (Γ : Finset ZPoint) (mask : Grid n → ℝ) (z : Coordinates n) (C L : Finset (Grid n))
    (hC : C⊆s.activeEvents) (hCL : C⊆L) (hm : ∀p,0≤mask p) (hw : ∀p,0≤z.1 p) :
    externalGroupGenerator s Γ mask z C ≤ (∑ a∈L, ∑ b∈L, pairRate s Γ mask z a b)/2 := by
  apply (externalGroupGenerator_le_pairRate s Γ mask z C hC hm hw).trans
  apply div_le_div_of_nonneg_right _ (by norm_num)
  calc
    (∑ a∈C, ∑ b∈C, pairRate s Γ mask z a b) ≤ ∑ a∈C, ∑ b∈L, pairRate s Γ mask z a b := by
      apply Finset.sum_le_sum
      intro a _
      exact Finset.sum_le_sum_of_subset_of_nonneg hCL (fun b _ _ => pairRate_nonneg s Γ mask z hm hw a b)
    _ ≤ ∑ a∈L, ∑ b∈L, pairRate s Γ mask z a b :=
      Finset.sum_le_sum_of_subset_of_nonneg hCL
        (fun a _ _ => Finset.sum_nonneg (fun b _ => pairRate_nonneg s Γ mask z hm hw a b))

end NoThreeLine.GroupPairGenerator

#print axioms NoThreeLine.GroupPairGenerator.groupCoefficient_le_pairs
#print axioms NoThreeLine.GroupPairGenerator.externalGroupGenerator_le_pairRate
#print axioms NoThreeLine.GroupPairGenerator.externalGroupGenerator_le_fixed_label_pairRate
