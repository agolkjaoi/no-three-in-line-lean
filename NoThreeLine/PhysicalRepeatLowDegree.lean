import NoThreeLine.PhysicalLeafRepetition

/-! Exact one- and two-leaf repetition sums. Unlike the high-degree
length simplification, these bounds do not require B <= line length. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteWitnessMoments

theorem tupleLabels_pair {α : Type*} [DecidableEq α] (a b : α) :
    tupleLabels ![a,b] = {a,b} := by
  ext q
  simp [tupleLabels,Fin.exists_fin_succ,eq_comm]

theorem physicalRepeatSum_one {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α → ℝ) (B : ℝ) : physicalRepeatSum mask B 1 = ∑ q : α, mask q := by
  unfold physicalRepeatSum
  rw [← (Fin.consEquiv (fun _ : Fin 1 => α)).sum_comp]
  simp [Fintype.sum_prod_type,tupleLabels_cons,tupleLabels,Fin.prod_univ_succ]

theorem physicalRepeatSum_two {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α → ℝ) (B : ℝ) :
    physicalRepeatSum mask B 2 = (∑ q : α, mask q)^2 + (B-1) * ∑ q : α, mask q^2 := by
  have hp (a b : α) : B^(2-(tupleLabels ![a,b]).card) * (∏ i : Fin 2, mask (![a,b] i)) =
      mask a * mask b + (if b=a then (B-1)*mask a^2 else 0) := by
    rw [tupleLabels_pair,Fin.prod_univ_two]
    by_cases hab : a=b
    · subst b
      simp
      ring
    · simp [hab,Ne.symm hab]
  unfold physicalRepeatSum
  rw [← (finTwoArrowEquiv α).symm.sum_comp]
  simp only [Fintype.sum_prod_type,finTwoArrowEquiv_symm_apply,hp,Finset.sum_add_distrib]
  simp only [Finset.sum_ite_eq',Finset.mem_univ,if_true]
  simp_rw [← Finset.mul_sum]
  rw [← Finset.sum_mul]
  ring

theorem physicalRepeatSum_two_le {α : Type*} [Fintype α] [DecidableEq α]
    (mask : α → ℝ) (hm : ∀ q, 0 ≤ mask q ∧ mask q ≤ 1) (B : ℝ) (hB : 1 ≤ B) :
    physicalRepeatSum mask B 2 ≤ (∑ q : α, mask q)^2 + B * ∑ q : α, mask q := by
  rw [physicalRepeatSum_two]
  have hs0 : 0 ≤ ∑ q : α, mask q := Finset.sum_nonneg (fun q _ => (hm q).1)
  have hs : (∑ q : α, mask q^2) ≤ ∑ q : α, mask q :=
    Finset.sum_le_sum (fun q _ => by nlinarith [(hm q).1,(hm q).2])
  exact add_le_add le_rfl ((mul_le_mul_of_nonneg_left hs (sub_nonneg.mpr hB)).trans
    (mul_le_mul_of_nonneg_right (by linarith : B-1 ≤ B) hs0))

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_one
#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_two
#print axioms NoThreeLine.FiniteWitnessMoments.physicalRepeatSum_two_le
