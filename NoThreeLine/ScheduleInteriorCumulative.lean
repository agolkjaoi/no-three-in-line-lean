import NoThreeLine.FiniteSchedule

/-! Exact cumulative input within an actual finite schedule phase, including
both endpoints. The earlier phases contribute their full duration once. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.FinitePhase

theorem Schedule.cumulative_inside {J : ℕ} (s : Schedule J) (c : Fin J→ℝ)
    (N : Fin J) (t : ℝ) (ht : t∈Icc (0:ℝ) (s.duration N)) :
    s.cumulative c (s.lo N+t)=
      (∑j : Fin N.val,s.duration ⟨j.val,j.isLt.trans N.isLt⟩*c ⟨j.val,j.isLt.trans N.isLt⟩)+t*c N := by
  classical
  have htime : 0≤s.lo N+t := add_nonneg (s.lo_nonneg N) ht.1
  have hterm (j : Fin J) : elapsed (s.lo j) (s.hi j) (s.lo N+t)*c j=
      (if j.val<N.val then s.duration j*c j else 0)+(if j=N then t*c N else 0) := by
    rcases lt_trichotomy j.val N.val with hj | hj | hj
    · have he : s.hi j≤s.lo N := s.increasing.monotone (by exact hj)
      have hne : j≠N := fun h=>by subst j; omega
      rw [elapsed_at_end _ _ _ (s.lo_nonneg j) (s.lo_lt_hi j).le (he.trans (le_add_of_nonneg_right ht.1))]
      simp only [hj,hne,if_pos,if_false,add_zero,Schedule.duration]
    · have he : j=N := Fin.ext hj
      subst j
      have hhi : s.lo N+t≤s.hi N := by have := ht.2; unfold Schedule.duration at this; linarith
      rw [elapsed,min_eq_left hhi,max_eq_right (s.lo_nonneg N)]
      simp only [add_sub_cancel_left,max_eq_right ht.1,lt_self_iff_false,if_false,if_true,zero_add]
    · have he : s.hi N≤s.lo j := s.increasing.monotone (by exact hj)
      have htimej : s.lo N+t≤s.lo j := by have := ht.2; unfold Schedule.duration at this; linarith
      have hsub : min (s.lo N+t) (s.hi j)-s.lo j≤0 :=
        sub_nonpos.mpr ((min_le_left _ _).trans htimej)
      have hne : j≠N := fun h=>by subst j; omega
      rw [elapsed,max_eq_right (s.lo_nonneg j),max_eq_left hsub]
      simp only [not_lt.mpr hj.le,hne,if_false,zero_mul,zero_add]
  rw [Schedule.cumulative,cumulative_eq_sum _ _ _ _ _ htime]
  simp_rw [hterm]
  rw [Finset.sum_add_distrib]
  simp only [Finset.sum_ite_eq',Finset.mem_univ,if_true]
  congr 1
  rw [←Finset.sum_filter]
  symm
  apply Finset.sum_bij (fun (j : Fin N.val) _=>(⟨j.val,j.isLt.trans N.isLt⟩ : Fin J))
  · intro j _
    simp only [Finset.mem_filter,Finset.mem_univ,true_and]
    exact j.isLt
  · intro a _ b _ hab
    exact Fin.ext (congrArg (fun j : Fin J=>j.val) hab)
  · intro j hj
    have hjN : j.val<N.val := (Finset.mem_filter.mp hj).2
    exact ⟨⟨j.val,hjN⟩,Finset.mem_univ _,Fin.ext rfl⟩
  · intro j _
    rfl

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.cumulative_inside
