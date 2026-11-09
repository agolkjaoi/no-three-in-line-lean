import NoThreeLine.SchedulePrefix

/-! The literal analytic prefix has the same cumulative input at its endpoint
as the original schedule. Later phases have exactly zero elapsed length there.
This statement changes no physical retirement deadline. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators
namespace NoThreeLine.FinitePhase

theorem Schedule.prefix_cumulative_total {J : ℕ} (s : Schedule J) (k : ℕ) (hk : k≤J)
    (c : Fin J→ℝ) :
    (s.prefix k hk).cumulative (fun j=>c (j.castLE hk)) (s.prefix k hk).total=
      s.cumulative c (s.prefix k hk).total := by
  classical
  let I : Finset (Fin J) := Finset.univ.image (fun j : Fin k=>j.castLE hk)
  let T := (s.prefix k hk).total
  have hinj : Function.Injective (fun j : Fin k=>j.castLE hk) := by
    intro a b hab
    exact Fin.ext (congrArg (fun j : Fin J=>j.val) hab)
  have hzero (j : Fin J) (hj : j∉I) : elapsed (s.lo j) (s.hi j) T*c j=0 := by
    have hjk : k≤j.val := by
      by_contra hh
      have hj' : j.val<k := Nat.lt_of_not_ge hh
      apply hj
      exact Finset.mem_image.mpr ⟨⟨j.val,hj'⟩,Finset.mem_univ _,Fin.ext rfl⟩
    have hTlo : T≤s.lo j := s.increasing.monotone (by exact hjk)
    have hsub : min T (s.hi j)-s.lo j≤0 := sub_nonpos.mpr ((min_le_left _ _).trans hTlo)
    rw [elapsed,max_eq_right (s.lo_nonneg j),max_eq_left hsub,zero_mul]
  rw [(s.prefix k hk).cumulative_total,Schedule.cumulative,
    cumulative_eq_sum _ _ _ _ _ (s.prefix k hk).total_nonneg]
  calc
    _ = ∑j : Fin k,elapsed (s.lo (j.castLE hk)) (s.hi (j.castLE hk)) T*c (j.castLE hk) := by
      apply Finset.sum_congr rfl
      intro j _
      change (s.prefix k hk).duration j*c (j.castLE hk)=
        elapsed ((s.prefix k hk).lo j) ((s.prefix k hk).hi j) (s.prefix k hk).total*c (j.castLE hk)
      rw [elapsed_at_end _ _ _ ((s.prefix k hk).lo_nonneg j)
        ((s.prefix k hk).lo_lt_hi j).le ((s.prefix k hk).hi_le_total j)]
      rfl
    _ = ∑j∈I,elapsed (s.lo j) (s.hi j) T*c j := by
      dsimp only [I]
      rw [Finset.sum_image]
      exact fun a _ b _ hab=>hinj hab
    _ = _ := Finset.sum_subset (Finset.subset_univ _) (fun j _ hj=>hzero j hj)

end NoThreeLine.FinitePhase
#print axioms NoThreeLine.FinitePhase.Schedule.prefix_cumulative_total
