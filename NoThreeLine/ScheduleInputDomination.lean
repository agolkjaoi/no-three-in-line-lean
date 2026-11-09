import NoThreeLine.ScheduleDeadline

/-! Actual phase inputs may have their own finite union representations.
Pointwise phase-mask containment implies cumulative domination and the actual
integrated board-risk estimate, without materializing a gigantic common cell grid. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open PrimitiveLines FiniteDirections

theorem Schedule.cumulative_mono {J : ℕ} (s : Schedule J) (c d : Fin J → ℝ)
    (hc : ∀ j, c j ≤ d j) (T : ℝ) (hT : 0 ≤ T) : s.cumulative c T ≤ s.cumulative d T := by
  unfold Schedule.cumulative
  rw [cumulative_eq_sum _ _ _ _ _ hT,cumulative_eq_sum _ _ _ _ _ hT]
  exact Finset.sum_le_sum (fun j _ => mul_le_mul_of_nonneg_left (hc j) (le_max_left _ _))

theorem Schedule.cumulative_nonneg {J : ℕ} (s : Schedule J) (c : Fin J → ℝ)
    (hc : ∀ j, 0 ≤ c j) (T : ℝ) (hT : 0 ≤ T) : 0 ≤ s.cumulative c T := by
  unfold Schedule.cumulative
  rw [cumulative_eq_sum _ _ _ _ _ hT]
  exact Finset.sum_nonneg (fun j _ => mul_nonneg (le_max_left _ _) (hc j))

theorem Schedule.inputTimeRisk_le_reference {J n : ℕ} {ι : Type*} (s : Schedule J)
    (m : Fin J → Grid n → ℝ) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ)
    (hm : ∀ j q, 0 ≤ m j q)
    (hdom : ∀ j q, m j q ≤ maskedTypedBoardWeight S R (c j) V H q)
    (p : Grid n) (T : ℝ) (hT : 0 ≤ T) :
    timePairRisk Finset.univ s.lo s.hi m p T ≤
      normalizedPairSum p (maskedTypedBoardWeight S R (s.prefixWeights c T) V H) := by
  rw [timePairRisk_eq_terminal]
  apply normalizedPairSum_mono
  · intro q
    exact s.cumulative_nonneg (fun j => m j q) (fun j => hm j q) T hT
  · intro q
    rw [← s.integral_phaseBoard S R c V H q T hT]
    exact s.cumulative_mono _ _ (fun j => hdom j q) T hT

/-- The actual finite-phase risk uses an arbitrary actual board input `m`.
Its comparison to the rectangular reference is derived by time integration;
no actual/reference equality or risk/BV conclusion is assumed. -/
theorem Schedule.dominated_inputTimeRisk_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (m : Fin J → Grid n → ℝ) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ)
    (hm : ∀ j q, 0 ≤ m j q)
    (hdom : ∀ j q, m j q ≤ maskedTypedBoardWeight S R (c j) V H q)
    (p : Grid n) (T : ℝ) (hT : 0 ≤ T) (hTs : T ≤ s.total)
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) (hN : ConcreteSieve.Q ≤ n) :
    timePairRisk Finset.univ s.lo s.hi m p T ≤
      ((76/125 : ℝ)/24)*typedAngularIntegralSum S R (s.prefixWeights c T) V H p*Real.log n +
      ((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*(S.card : ℝ)+3)*s.total^2 :=
  (s.inputTimeRisk_le_reference m S R c V H hm hdom p T hT).trans
    (masked_board_sieve_upper S R (s.prefixWeights c T) V H p s.total s.total_nonneg hsep
      (s.prefixWeights_bounds S c hc T hT hTs) hR hN)

theorem Schedule.dominated_inputDeadline_upper {J n : ℕ} {ι : Type*} (s : Schedule J)
    (m : Fin J → Grid n → ℝ) (S : Finset ι) (R : ι → Rect)
    (c : Fin J → ZPoint → ι → ℝ) (V H : Finset ℝ)
    (hm : ∀ j q, 0 ≤ m j q)
    (hdom : ∀ j q, m j q ≤ maskedTypedBoardWeight S R (c j) V H q)
    (p : Grid n) (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hc : ∀ j r i, i ∈ S → 0 ≤ c j r i ∧ c j r i ≤ 1) (hN : ConcreteSieve.Q ≤ n) :
    timePairRisk Finset.univ s.lo s.hi m p (s.deadline (fun j => m j p)) ≤
      ((76/125 : ℝ)/24)*typedAngularIntegralSum S R
        (s.prefixWeights c (s.deadline (fun j => m j p))) V H p*Real.log n +
      ((4*S.card+1)*s.total)^2 + 5*s.total*((4*S.card+1)*s.total) + 10*s.total^2 +
      6*25586*(4*(S.card : ℝ)+3)*s.total^2 :=
  s.dominated_inputTimeRisk_upper m S R c V H hm hdom p (s.deadline (fun j => m j p))
    (s.deadline_nonneg _) (s.deadline_le_total _) hsep hR hc hN

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.Schedule.dominated_inputDeadline_upper
