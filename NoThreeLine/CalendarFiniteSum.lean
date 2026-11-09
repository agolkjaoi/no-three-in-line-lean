import NoThreeLine.CalendarRectangleComparison

/-! Nonnegative finite phase aggregation: every old-prefix diagonal budget
is bounded by the total diagonal budget, with future duration kept outside. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine.CalendarIntegral

theorem weighted_prefix_sum_le_total (J : ℕ) (h a : ℕ→ℝ)
    (hh : ∀N,N<J→0≤h N) (ha : ∀j,j<J→0≤a j) :
    (∑N∈Finset.range J,h N*((∑j∈Finset.range N,a j)+a N))≤
      (∑N∈Finset.range J,h N)*(∑j∈Finset.range J,a j) := by
  calc
    _ ≤ ∑N∈Finset.range J,h N*(∑j∈Finset.range J,a j) := by
      apply Finset.sum_le_sum
      intro N hN
      have hNJ := Finset.mem_range.mp hN
      apply mul_le_mul_of_nonneg_left _ (hh N hNJ)
      have hp := Finset.sum_le_sum_of_subset_of_nonneg
        (Finset.range_mono (Nat.succ_le_of_lt hNJ))
        (fun j hj _=>ha j (Finset.mem_range.mp hj))
      simpa only [Finset.sum_range_succ] using hp
    _ = _ := (Finset.sum_mul _ _ _).symm

theorem weighted_prefix_div_sum_le_total (J : ℕ) (h a : ℕ→ℝ) (η : ℝ) (hη : 0≤η)
    (hh : ∀N,N<J→0≤h N) (ha : ∀j,j<J→0≤a j) :
    (∑N∈Finset.range J,(h N/η)*((∑j∈Finset.range N,a j)+a N))≤
      ((∑N∈Finset.range J,h N)/η)*(∑j∈Finset.range J,a j) := by
  have he := weighted_prefix_sum_le_total J (fun N=>h N/η) a
    (fun N hN=>div_nonneg (hh N hN) hη) ha
  simpa only [Finset.sum_div] using he

end NoThreeLine.CalendarIntegral
#print axioms NoThreeLine.CalendarIntegral.weighted_prefix_sum_le_total
#print axioms NoThreeLine.CalendarIntegral.weighted_prefix_div_sum_le_total
