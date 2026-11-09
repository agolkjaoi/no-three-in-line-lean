import Mathlib.Tactic

/-! Finite Bonferroni with the exact unordered-pair coefficient.
The half symmetric double sum counts each distinct pair exactly once. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteBonferroni

def orderedPairSum {ι : Type*} [DecidableEq ι] (s : Finset ι) (d : ι → ℝ) : ℝ :=
  ∑ i ∈ s, ∑ j ∈ s, if i=j then 0 else d i*d j

theorem orderedPairSum_insert {ι : Type*} [DecidableEq ι] (s : Finset ι) (d : ι → ℝ)
    (a : ι) (ha : a∉s) :
    orderedPairSum (insert a s) d = orderedPairSum s d + 2*d a*(∑ i∈s,d i) := by
  have hne : ∀ i∈s, i≠a := fun i hi hia => ha (hia ▸ hi)
  have he : orderedPairSum (insert a s) d =
      (∑ j∈s,d a*d j) + ∑ i∈s,(d i*d a + ∑ j∈s,if i=j then 0 else d i*d j) := by
    unfold orderedPairSum
    rw [Finset.sum_insert ha]
    simp only [Finset.sum_insert ha,ite_true,zero_add]
    congr 1
    · apply Finset.sum_congr rfl
      intro i hi
      rw [if_neg (hne i hi).symm]
    · apply Finset.sum_congr rfl
      intro i hi
      rw [if_neg (hne i hi)]
  rw [he,Finset.sum_add_distrib,← Finset.mul_sum,← Finset.sum_mul]
  unfold orderedPairSum
  ring

theorem finite_bonferroni {ι : Type*} [DecidableEq ι] (s : Finset ι) (J : ι → ℝ)
    (hJ : ∀ i∈s, 0≤J i ∧ J i≤1) :
    0 ≤ (∑ i ∈ s, (1-J i)) + (∏ i∈s,J i)-1 ∧
    (∑ i ∈ s, (1-J i)) + (∏ i∈s,J i)-1 ≤ orderedPairSum s (fun i=>1-J i)/2 := by
  induction s using Finset.induction_on with
  | empty => simp [orderedPairSum]
  | @insert a s ha ih =>
    have hs : ∀ i∈s,0≤J i ∧ J i≤1 := fun i hi => hJ i (Finset.mem_insert_of_mem hi)
    have haJ := hJ a (Finset.mem_insert_self _ _)
    have hprod := Finset.prod_le_one (fun i hi => (hs i hi).1) (fun i hi => (hs i hi).2)
    have hrec := ih hs
    rw [Finset.sum_insert ha,Finset.prod_insert ha,orderedPairSum_insert s _ a ha]
    constructor
    · nlinarith [mul_nonneg (sub_nonneg.mpr haJ.2) (sub_nonneg.mpr hprod)]
    · nlinarith [mul_nonneg (sub_nonneg.mpr haJ.2) hrec.1]

end NoThreeLine.FiniteBonferroni

#print axioms NoThreeLine.FiniteBonferroni.finite_bonferroni
