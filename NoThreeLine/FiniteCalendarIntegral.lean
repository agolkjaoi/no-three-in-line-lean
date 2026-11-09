import NoThreeLine.RunningIntegralRegularity

/-! Generic finite calendar gluing. No stochastic state type appears here:
any monotone endpoint sequence and measurable bounded segment functions work. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.CalendarIntegral

def shiftedSegment (a b : ℝ) (f : ℝ→ℝ) (t : ℝ) : ℝ :=
  if a<t ∧ t<b then f (t-a) else 0

theorem shiftedSegment_measurable (a b : ℝ) (f : ℝ→ℝ) (hf : Measurable f) :
    Measurable (shiftedSegment a b f) :=
  Measurable.ite ((measurable_const.lt measurable_id).and (measurable_id.lt measurable_const)).setOf
    (hf.comp (measurable_id.sub measurable_const)) measurable_const

theorem shiftedSegment_bounds (a b : ℝ) (f : ℝ→ℝ) (M : ℝ) (hM : 0≤M)
    (hf : ∀u∈Ioo (0:ℝ) (b-a),0≤f u ∧ f u≤M) (t : ℝ) :
    0≤shiftedSegment a b f t ∧ shiftedSegment a b f t≤M := by
  unfold shiftedSegment
  split_ifs with h
  · exact hf (t-a) ⟨by linarith [h.1],by linarith [h.2]⟩
  · exact ⟨le_rfl,hM⟩

theorem shiftedSegment_integral (H a b : ℝ) (ha : 0≤a) (hab : a≤b) (hb : b≤H)
    (f : ℝ→ℝ) :
    (∫t in (0:ℝ)..H,shiftedSegment a b f t)=∫u in (0:ℝ)..(b-a),f u := by
  have he : shiftedSegment a b f=(Ioo a b).indicator (fun u=>f (u-a)) := by
    funext t
    simp only [shiftedSegment,Set.indicator,Set.mem_Ioo]
  rw [he]
  rw [intervalIntegral.integral_of_le (ha.trans (hab.trans hb)),
    MeasureTheory.integral_indicator measurableSet_Ioo,Measure.restrict_restrict measurableSet_Ioo]
  have hi : Ioo a b∩Ioc (0:ℝ) H=Ioo a b := inter_eq_left.mpr
    (fun u hu=>⟨ha.trans_lt hu.1,hu.2.le.trans hb⟩)
  rw [hi,←integral_Ioc_eq_integral_Ioo,←intervalIntegral.integral_of_le hab,
    intervalIntegral.integral_comp_sub_right]
  simp only [sub_self]

theorem unique_open_segment (a : ℕ→ℝ) (ha : Monotone a) (i j : ℕ) (t : ℝ)
    (hi : t∈Ioo (a i) (a (i+1))) (hj : t∈Ioo (a j) (a (j+1))) : i=j := by
  rcases lt_trichotomy i j with h|h|h
  · exact False.elim (not_lt_of_ge (ha (Nat.succ_le_of_lt h)) (hj.1.trans hi.2))
  · exact h
  · exact False.elim (not_lt_of_ge (ha (Nat.succ_le_of_lt h)) (hi.1.trans hj.2))

theorem sum_shiftedSegment_bounds (a : ℕ→ℝ) (ha : Monotone a) (N : ℕ)
    (f : ℕ→ℝ→ℝ) (M : ℝ) (hM : 0≤M)
    (hf : ∀j<N,∀u∈Ioo (0:ℝ) (a (j+1)-a j),0≤f j u ∧ f j u≤M) (t : ℝ) :
    0≤∑j∈Finset.range N,shiftedSegment (a j) (a (j+1)) (f j) t ∧
      (∑j∈Finset.range N,shiftedSegment (a j) (a (j+1)) (f j) t)≤M := by
  classical
  constructor
  · exact Finset.sum_nonneg (fun j hj=>(shiftedSegment_bounds _ _ _ M hM (hf j (Finset.mem_range.mp hj)) t).1)
  · by_cases ht : ∃j<N,t∈Ioo (a j) (a (j+1))
    · obtain ⟨i,hi,hit⟩ := ht
      rw [Finset.sum_eq_single i]
      · exact (shiftedSegment_bounds _ _ _ M hM (hf i hi) t).2
      · intro j _ hji
        apply if_neg
        exact fun hjt=>hji (unique_open_segment a ha j i t hjt hit)
      · intro hni
        exact False.elim (hni (Finset.mem_range.mpr hi))
    · have hz : ∀j∈Finset.range N,shiftedSegment (a j) (a (j+1)) (f j) t=0 := by
        intro j hj
        exact if_neg (fun hjt=>ht ⟨j,Finset.mem_range.mp hj,hjt⟩)
      rw [Finset.sum_eq_zero hz]
      exact hM

theorem sum_shiftedSegment_integral (a : ℕ→ℝ) (ha : Monotone a) (N : ℕ) (H : ℝ)
    (ha0 : 0≤a 0) (hN : a N≤H) (f : ℕ→ℝ→ℝ)
    (hf : ∀j<N,Measurable (f j)) (M : ℝ) (hM : 0≤M)
    (hb : ∀j<N,∀u∈Ioo (0:ℝ) (a (j+1)-a j),0≤f j u ∧ f j u≤M) :
    (∫t in (0:ℝ)..H,∑j∈Finset.range N,shiftedSegment (a j) (a (j+1)) (f j) t)=
      ∑j∈Finset.range N,∫u in (0:ℝ)..(a (j+1)-a j),f j u := by
  have hH : 0≤H := ha0.trans ((ha (Nat.zero_le N)).trans hN)
  have hi (j : ℕ) (hj : j∈Finset.range N) :
      IntervalIntegrable (shiftedSegment (a j) (a (j+1)) (f j)) volume 0 H := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le hH).mpr
    exact BirthWitness.integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) H) measurableSet_Ioo _
      (shiftedSegment_measurable _ _ _ (hf j (Finset.mem_range.mp hj))) M
      (fun t _=>shiftedSegment_bounds _ _ _ M hM (hb j (Finset.mem_range.mp hj)) t)
  rw [intervalIntegral.integral_finsetSum hi]
  apply Finset.sum_congr rfl
  intro j hj
  exact shiftedSegment_integral H _ _ (ha0.trans (ha (Nat.zero_le j))) (ha (Nat.le_succ j))
    ((ha (Nat.succ_le_of_lt (Finset.mem_range.mp hj))).trans hN) (f j)

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.sum_shiftedSegment_bounds
#print axioms NoThreeLine.CalendarIntegral.sum_shiftedSegment_integral
