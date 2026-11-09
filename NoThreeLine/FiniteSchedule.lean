import NoThreeLine.FinitePhaseIntegrals

/-! A finite actual time partition. Cell coefficients are phase rates; elapsed
time is inserted only by the real integral, never a second time into the rate. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase

structure Schedule (J : ℕ) where
  knot : Fin (J+1) → ℝ
  increasing : StrictMono knot
  initial : knot 0 = 0

def Schedule.lo {J : ℕ} (s : Schedule J) (j : Fin J) : ℝ := s.knot j.castSucc
def Schedule.hi {J : ℕ} (s : Schedule J) (j : Fin J) : ℝ := s.knot j.succ
def Schedule.total {J : ℕ} (s : Schedule J) : ℝ := s.knot (Fin.last J)
def Schedule.duration {J : ℕ} (s : Schedule J) (j : Fin J) : ℝ := s.hi j-s.lo j
def Schedule.rate {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) : ℝ → ℝ :=
  FinitePhase.rate Finset.univ s.lo s.hi c
def Schedule.cumulative {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) : ℝ → ℝ :=
  FinitePhase.cumulative Finset.univ s.lo s.hi c

theorem Schedule.lo_nonneg {J : ℕ} (s : Schedule J) (j : Fin J) : 0 ≤ s.lo j := by
  rw [← s.initial]
  exact s.increasing.monotone (Fin.zero_le _)

theorem Schedule.lo_lt_hi {J : ℕ} (s : Schedule J) (j : Fin J) : s.lo j < s.hi j :=
  s.increasing (by simp [Fin.lt_def])

theorem Schedule.hi_le_total {J : ℕ} (s : Schedule J) (j : Fin J) : s.hi j ≤ s.total :=
  s.increasing.monotone (Fin.le_last _)

theorem Schedule.total_nonneg {J : ℕ} (s : Schedule J) : 0 ≤ s.total := by
  rw [← s.initial]
  exact s.increasing.monotone (Fin.zero_le _)

theorem Schedule.phase_unique {J : ℕ} (s : Schedule J) (j k : Fin J) (t : ℝ)
    (hj : t ∈ Ico (s.lo j) (s.hi j)) (hk : t ∈ Ico (s.lo k) (s.hi k)) : j=k := by
  by_contra h
  rcases lt_or_gt_of_ne h with hjk | hkj
  · have he : s.hi j ≤ s.lo k := s.increasing.monotone (by
      simp only [Fin.le_def,Fin.val_succ,Fin.val_castSucc]
      exact hjk)
    exact not_lt_of_ge (hk.1.trans' he) hj.2
  · have he : s.hi k ≤ s.lo j := s.increasing.monotone (by
      simp only [Fin.le_def,Fin.val_succ,Fin.val_castSucc]
      exact hkj)
    exact not_lt_of_ge (hj.1.trans' he) hk.2

theorem Schedule.rate_bounds {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j ∧ c j ≤ 1) (t : ℝ) : 0 ≤ s.rate c t ∧ s.rate c t ≤ 1 := by
  classical
  by_cases hex : ∃ j : Fin J, t ∈ Ico (s.lo j) (s.hi j)
  · obtain ⟨j,hj⟩ := hex
    have he : s.rate c t = c j := by
      unfold Schedule.rate FinitePhase.rate
      rw [Finset.sum_eq_single j]
      · simp [pulse,hj]
      · intro k hk hkj
        have hnot : t ∉ Ico (s.lo k) (s.hi k) := fun hk => hkj (s.phase_unique k j t hk hj)
        simp [pulse,hnot]
      · simp
    rw [he]
    exact hc j
  · have he : s.rate c t=0 := by
      unfold Schedule.rate FinitePhase.rate
      apply Finset.sum_eq_zero
      intro j hj
      simp [pulse,show t ∉ Ico (s.lo j) (s.hi j) from fun hj => hex ⟨j,hj⟩]
    rw [he]
    exact ⟨le_refl 0,zero_le_one⟩

theorem Schedule.cumulative_bounds {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j ∧ c j ≤ 1) (t : ℝ) (ht : 0 ≤ t) :
    0 ≤ s.cumulative c t ∧ s.cumulative c t ≤ t := by
  constructor
  · exact intervalIntegral.integral_nonneg ht (fun u _ => (s.rate_bounds c hc u).1)
  · have h := intervalIntegral.integral_mono_on ht
      (rate_integrable Finset.univ s.lo s.hi c).intervalIntegrable
      (intervalIntegrable_const : IntervalIntegrable (fun _ : ℝ => (1 : ℝ)) volume 0 t)
      (fun u _ => (s.rate_bounds c hc u).2)
    simpa [Schedule.cumulative,FinitePhase.cumulative] using h

theorem elapsed_at_end (a b T : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) (hbT : b ≤ T) :
    elapsed a b T = b-a := by
  rw [elapsed,min_eq_right hbT,max_eq_right ha,max_eq_right (sub_nonneg.mpr hab)]

theorem Schedule.cumulative_total {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) :
    s.cumulative c s.total = ∑ j : Fin J, s.duration j*c j := by
  rw [Schedule.cumulative,cumulative_eq_sum _ _ _ _ _ s.total_nonneg]
  apply Finset.sum_congr rfl
  intro j hj
  rw [elapsed_at_end _ _ _ (s.lo_nonneg j) (s.lo_lt_hi j).le (s.hi_le_total j)]
  rfl

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.cumulative_bounds
#print axioms NoThreeLine.FinitePhase.Schedule.cumulative_total
