import NoThreeLine.FiniteCalendarIntegral

/-! Finite open-segment coverage and evaluation. Endpoint exceptions form
a countable null set, even when the endpoint sequence later becomes constant. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.CalendarIntegral

theorem exists_open_segment (a : ℕ→ℝ) (N : ℕ) (t : ℝ)
    (ht : t∈Ioo (a 0) (a N)) (hne : ∀j≤N,t≠a j) :
    ∃j<N,t∈Ioo (a j) (a (j+1)) := by
  induction N with
  | zero => exact False.elim (lt_irrefl _ (ht.1.trans ht.2))
  | succ N ih =>
    by_cases h : t<a N
    · obtain ⟨j,hj,hjt⟩ := ih ⟨ht.1,h⟩ (fun j hj=>hne j (hj.trans (Nat.le_succ N)))
      exact ⟨j,hj.trans (Nat.lt_succ_self N),hjt⟩
    · exact ⟨N,Nat.lt_succ_self N,⟨lt_of_le_of_ne (le_of_not_gt h)
        (hne N (Nat.le_succ N)).symm,ht.2⟩⟩

theorem sum_shiftedSegment_at_interior (a : ℕ→ℝ) (ha : Monotone a) (N : ℕ)
    (f : ℕ→ℝ→ℝ) (j : ℕ) (hj : j<N) (t : ℝ)
    (ht : t∈Ioo (a j) (a (j+1))) :
    (∑i∈Finset.range N,shiftedSegment (a i) (a (i+1)) (f i) t)=f j (t-a j) := by
  classical
  rw [Finset.sum_eq_single j]
  · exact if_pos ht
  · intro i _ hij
    exact if_neg (fun hit=>hij (unique_open_segment a ha i j t hit ht))
  · intro h
    exact False.elim (h (Finset.mem_range.mpr hj))

theorem sum_shiftedSegment_zero_after (a : ℕ→ℝ) (ha : Monotone a) (N : ℕ)
    (f : ℕ→ℝ→ℝ) (t : ℝ) (ht : a N≤t) :
    (∑i∈Finset.range N,shiftedSegment (a i) (a (i+1)) (f i) t)=0 := by
  apply Finset.sum_eq_zero
  intro i hi
  apply if_neg
  intro hit
  exact (not_lt_of_ge ((ha (Nat.succ_le_of_lt (Finset.mem_range.mp hi))).trans ht)) hit.2

theorem sum_shiftedSegment_zero_before (a : ℕ→ℝ) (ha : Monotone a) (N : ℕ)
    (f : ℕ→ℝ→ℝ) (t : ℝ) (ht : t≤a 0) :
    (∑i∈Finset.range N,shiftedSegment (a i) (a (i+1)) (f i) t)=0 := by
  apply Finset.sum_eq_zero
  intro i _
  exact if_neg (fun hit=>(not_lt_of_ge (ht.trans (ha (Nat.zero_le i)))) hit.1)

theorem ae_avoids_endpoints (a : ℕ→ℝ) : ∀ᵐt : ℝ ∂volume,∀j,t≠a j := by
  have h : ∀ᵐt : ℝ ∂volume,t∉Set.range a := by
    rw [ae_iff]
    simpa only [not_not,Set.setOf_mem_eq] using (Set.countable_range a).measure_zero volume
  filter_upwards [h] with t ht j
  exact fun he=>ht ⟨j,he.symm⟩

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.exists_open_segment
#print axioms NoThreeLine.CalendarIntegral.sum_shiftedSegment_at_interior
#print axioms NoThreeLine.CalendarIntegral.ae_avoids_endpoints
