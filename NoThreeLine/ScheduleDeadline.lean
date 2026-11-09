import NoThreeLine.ScheduleGeometry

/-! The actual root deadline is the last used phase's right endpoint, or zero
when no phase is used. Other points' cumulative fields still use this root deadline. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines FiniteDirections GridArea

def Schedule.deadlineValue {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) : Option (Fin J) → ℝ
  | none => 0
  | some j => if 0 < c j then s.hi j else 0

def Schedule.deadline {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) : ℝ :=
  Finset.univ.sup' Finset.univ_nonempty (s.deadlineValue c)

theorem Schedule.deadline_nonneg {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) : 0 ≤ s.deadline c := by
  exact Finset.le_sup' (s.deadlineValue c) (Finset.mem_univ (none : Option (Fin J)))

theorem Schedule.deadline_le_total {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) :
    s.deadline c ≤ s.total := by
  apply Finset.sup'_le
  intro j hj
  cases j with
  | none => exact s.total_nonneg
  | some j =>
    simp only [Schedule.deadlineValue]
    split_ifs
    · exact s.hi_le_total j
    · exact s.total_nonneg

theorem Schedule.used_phase_le_deadline {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (j : Fin J) (hj : 0 < c j) : s.hi j ≤ s.deadline c := by
  have h := Finset.le_sup' (s.deadlineValue c) (Finset.mem_univ (some j))
  simpa only [Schedule.deadline,Schedule.deadlineValue,hj,ite_true] using h

theorem Schedule.deadline_zero_of_unused {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, c j ≤ 0) : s.deadline c = 0 := by
  apply le_antisymm _ (s.deadline_nonneg c)
  apply Finset.sup'_le
  intro j hj
  cases j with
  | none => exact le_refl 0
  | some j => simp [Schedule.deadlineValue,not_lt_of_ge (hc j)]

theorem Schedule.deadline_eq_zero_or_used_right {J : ℕ} (s : Schedule J) (c : Fin J → ℝ) :
    s.deadline c = 0 ∨ ∃ j : Fin J, 0 < c j ∧ s.deadline c = s.hi j := by
  obtain ⟨j,hj,he⟩ := Finset.exists_mem_eq_sup' (s := Finset.univ)
    Finset.univ_nonempty (s.deadlineValue c)
  cases j with
  | none => exact Or.inl he
  | some j =>
    by_cases hc : 0 < c j
    · exact Or.inr ⟨j,hc,by simpa only [Schedule.deadline,Schedule.deadlineValue,hc,ite_true] using he⟩
    · exact Or.inl (by simpa only [Schedule.deadline,Schedule.deadlineValue,hc,ite_false] using he)

theorem Schedule.rate_zero_after_deadline {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j) (t : ℝ) (ht : s.deadline c ≤ t) : s.rate c t = 0 := by
  classical
  unfold Schedule.rate FinitePhase.rate
  apply Finset.sum_eq_zero
  intro j hj
  by_cases hp : 0 < c j
  · have hn : t ∉ Ico (s.lo j) (s.hi j) :=
      fun h => not_lt_of_ge ((s.used_phase_le_deadline c j hp).trans ht) h.2
    simp [pulse,hn]
  · have hz : c j=0 := le_antisymm (le_of_not_gt hp) (hc j)
    simp [pulse,hz]

theorem Schedule.cumulative_deadline_eq_total {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j) : s.cumulative c (s.deadline c) = s.cumulative c s.total := by
  rw [s.cumulative_total,Schedule.cumulative,cumulative_eq_sum _ _ _ _ _ (s.deadline_nonneg c)]
  apply Finset.sum_congr rfl
  intro j hj
  by_cases hp : 0 < c j
  · rw [elapsed_at_end _ _ _ (s.lo_nonneg j) (s.lo_lt_hi j).le (s.used_phase_le_deadline c j hp)]
    rfl
  · have hz : c j=0 := le_antisymm (le_of_not_gt hp) (hc j)
    simp [hz]

def Schedule.boardDeadline {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) : ℝ :=
  s.deadline (fun j => maskedTypedBoardWeight S R (c j) V H p)

/-- The same computed root deadline is passed to every type and every partner.
There is no per-partner clipping at the partner's own deadline. -/
theorem Schedule.boardDeadline_sieve_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (hsep : RectanglesSeparated S R)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) (hN : ConcreteSieve.Q ≤ n) :
    s.boardTimeRisk S R c V H p (s.boardDeadline S R c V H p) ≤
      ((76/125 : ℝ)/24)*typedAngularIntegralSum S R
        (s.prefixWeights c (s.boardDeadline S R c V H p)) V H p*Real.log n +
      ((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*(S.card : ℝ)+3)*s.total^2 :=
  s.boardTimeRisk_sieve_upper S R c V H p (s.boardDeadline S R c V H p)
    (s.deadline_nonneg _) (s.deadline_le_total _) hsep hR hc hN

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.deadline_eq_zero_or_used_right
#print axioms NoThreeLine.FinitePhase.Schedule.cumulative_deadline_eq_total
#print axioms NoThreeLine.FinitePhase.Schedule.boardDeadline_sieve_upper
