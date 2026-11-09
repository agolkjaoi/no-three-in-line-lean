import NoThreeLine.PairWitnessGeometry

/-! The one-new-witness step in C2. A fixed witness restricts the cause to
one actual line; the other root is outside that line whenever the cause is
off the baseline. G3 counts all possible cause/new-witness pairs. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.PairWitness
open AuxiliaryODE PrimitiveLines GridLines BirthLineGroups OffLineDivisors

def witnessExtensions {n : ℕ} (a b z : Grid n) : Finset (Σ _ : Grid n, Grid n) :=
  ((lineThrough a z).filter (fun q => orientedArea a b q≠0)).sigma
    (fun q => lineThrough b q)

theorem extension_baseline_excluded {n : ℕ} (a b z q : Grid n)
    (haz : a≠z) (hq : q∈lineThrough a z) (h : orientedArea a b q≠0) :
    orientedArea a z b≠0 := by
  intro hb
  have hab := (offBaseline_distinct a b q h).1
  have he := lineThrough_eq_of_mem a z b haz hab ((mem_lineThrough a z b).mpr hb)
  exact h ((mem_lineThrough a b q).mp (he ▸ hq))

theorem witnessExtensions_card_le_sum {n : ℕ} (a b z : Grid n) :
    ((witnessExtensions a b z).card : ℝ) ≤
      ∑ q ∈ lineThrough a z, ((lineThrough b q).card : ℝ) := by
  unfold witnessExtensions
  rw [Finset.card_sigma, Nat.cast_sum]
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.filter_subset _ _)
    (fun q _ _ => Nat.cast_nonneg _)

theorem witnessExtensions_card_le_const_rpow (ξ : ℝ) (hξ : 0<ξ) :
    ∃ C : ℝ, 0<C ∧ ∀ (n : ℕ) (a b z : Grid n), a≠z →
      ((witnessExtensions a b z).card : ℝ) ≤ C*(n:ℝ)^(1+ξ) := by
  obtain ⟨C,hC,hbound⟩ := off_lineThrough_sum_le_const_rpow ξ hξ
  refine ⟨C,hC,?_⟩
  intro n a b z haz
  by_cases he : (witnessExtensions a b z).Nonempty
  · obtain ⟨⟨q,w⟩,hq⟩ := he
    have hq' := Finset.mem_filter.mp (Finset.mem_sigma.mp hq).1
    exact (witnessExtensions_card_le_sum a b z).trans
      (hbound n a z b (extension_baseline_excluded a b z q haz hq'.1 hq'.2))
  · rw [Finset.not_nonempty_iff_eq_empty.mp he]
    simp only [Finset.card_empty, Nat.cast_zero]
    exact mul_nonneg hC.le (Real.rpow_nonneg (Nat.cast_nonneg _) _)

theorem actual_two_witness_mem_extension {n : ℕ} (a b q z w : Grid n)
    (haz : a≠z) (h : orientedArea a b q≠0)
    (hz : z∈lineThrough a q) (hw : w∈lineThrough b q) :
    (⟨q,w⟩ : Σ _ : Grid n, Grid n) ∈ witnessExtensions a b z := by
  have haq := (offBaseline_distinct a b q h).2.1
  have he := lineThrough_eq_of_mem a q z haq haz hz
  exact Finset.mem_sigma.mpr ⟨Finset.mem_filter.mpr
    ⟨he ▸ right_mem_lineThrough a q,h⟩,hw⟩

end NoThreeLine.PairWitness

#print axioms NoThreeLine.PairWitness.witnessExtensions_card_le_const_rpow
#print axioms NoThreeLine.PairWitness.actual_two_witness_mem_extension
