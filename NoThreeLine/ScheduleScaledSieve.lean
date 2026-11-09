import NoThreeLine.ScheduleTimeScaling
import NoThreeLine.ScheduleDeadline

/-! The shortened schedule's actual root-deadline risk is bounded using the
original, unscaled prefix's angular integral. The factor (249/250)^2 occurs once. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines FiniteDirections GridArea

theorem Schedule.scaled_deadline {J : ℕ} (s : Schedule J) (a : ℝ) (ha : 0 < a)
    (c : Fin J → ℝ) : (s.scaled a ha).deadline c = a*s.deadline c := by
  apply le_antisymm
  · apply Finset.sup'_le
    intro j hj
    cases j with
    | none => exact mul_nonneg ha.le (s.deadline_nonneg c)
    | some j =>
      simp only [Schedule.deadlineValue]
      split_ifs with hc
      · rw [s.scaled_hi]
        exact mul_le_mul_of_nonneg_left (s.used_phase_le_deadline c j hc) ha.le
      · exact mul_nonneg ha.le (s.deadline_nonneg c)
  · rcases s.deadline_eq_zero_or_used_right c with h | ⟨j,hc,h⟩
    · rw [h,mul_zero]
      exact (s.scaled a ha).deadline_nonneg c
    · rw [h,← s.scaled_hi a ha j]
      exact (s.scaled a ha).used_phase_le_deadline c j hc

theorem Schedule.scaled_boardDeadline {J n : ℕ} {ι : Type*} (s : Schedule J)
    (a : ℝ) (ha : 0 < a) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n) :
    (s.scaled a ha).boardDeadline S R c V H p = a*s.boardDeadline S R c V H p :=
  s.scaled_deadline a ha _

/-- A point's own cumulative input has finished at its own last used right
endpoint. This statement does not replace the common deadline inside pair risk. -/
theorem Schedule.boardPrefix_at_own_deadline {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (hsep : RectanglesSeparated S R)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) :
    maskedTypedBoardWeight S R (s.prefixWeights c (s.boardDeadline S R c V H p)) V H p =
      maskedTypedBoardWeight S R (s.prefixWeights c s.total) V H p := by
  have ht : 0 ≤ s.boardDeadline S R c V H p := s.deadline_nonneg _
  rw [← s.integral_phaseBoard S R c V H p (s.boardDeadline S R c V H p) ht,
    ← s.integral_phaseBoard S R c V H p s.total s.total_nonneg]
  apply s.cumulative_deadline_eq_total
  intro j
  exact (maskedTypedBoardWeight_bounds S R (c j) V H p
    (rectangleField_point_bounds S R _ 1 _ _ zero_le_one hsep (hc j _)).1).1

theorem Schedule.own_deadline_mass_error {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (hn : 0 < n) (hsep : RectanglesSeparated S R)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) :
    |(∑ q : Grid n, maskedTypedBoardWeight S R
        (s.prefixWeights c (s.boardDeadline S R c V H q)) V H q)/(n : ℝ)^2 -
      s.areaMass S R c V H| ≤
        s.total*(12*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ))/(n : ℝ) := by
  simp_rw [s.boardPrefix_at_own_deadline S R c V H _ hsep hc]
  have h := s.normalized_board_mass_error S R c V H hn hsep hR hc
  simpa only [s.integral_phaseBoard S R c V H _ s.total s.total_nonneg] using h

/-- The coefficient multiplies the unscaled field integral. No second time
scaling is applied to the mask coefficients or to this angular integral. -/
theorem Schedule.shortened_boardDeadline_sieve_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (S : Finset ι) (R : ι → Rect) (c : Fin J → ZPoint → ι → ℝ)
    (V H : Finset ℝ) (p : Grid n) (hsep : RectanglesSeparated S R)
    (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) (hN : ConcreteSieve.Q ≤ n) :
    (s.scaled (249/250) (by norm_num)).boardTimeRisk S R c V H p
      ((s.scaled (249/250) (by norm_num)).boardDeadline S R c V H p) ≤
      (392673/15625000 : ℝ)*typedAngularIntegralSum S R
        (s.prefixWeights c (s.boardDeadline S R c V H p)) V H p*Real.log n +
      (249/250 : ℝ)^2 *
        (((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
          6*25586*(4*(S.card : ℝ)+3)*s.total^2) := by
  have ht : 0 ≤ s.boardDeadline S R c V H p := s.deadline_nonneg _
  rw [s.scaled_boardDeadline,s.scaled_boardTimeRisk (249/250) (by norm_num) S R c V H p
    (s.boardDeadline S R c V H p) ht]
  have h := mul_le_mul_of_nonneg_left
    (s.boardDeadline_sieve_upper S R c V H p hsep hR hc hN) (sq_nonneg (249/250 : ℝ))
  apply h.trans_eq
  ring

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.scaled_deadline
#print axioms NoThreeLine.FinitePhase.Schedule.own_deadline_mass_error
#print axioms NoThreeLine.FinitePhase.Schedule.shortened_boardDeadline_sieve_upper
