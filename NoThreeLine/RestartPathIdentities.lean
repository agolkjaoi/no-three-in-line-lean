import NoThreeLine.IteratedCandidateClocks

/-! Exact candidate-time and mark identities for the concrete residual
clock update. These hold for every raw path, without probability premises. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.RestartPathIdentities
open ClockRestartBase DeterministicClockRestart ActualClockRestart
open BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw

theorem candidateTime_succ (w : ClockPath) (k : ℕ) :
    candidateTime w (k+1) = candidateTime w k + w (k+1) := by
  simp only [candidateTime, arrivalTime, Finset.sum_range_succ]

theorem candidateTime_residual (t : ℝ) (w : ClockPath) (k : ℕ) :
    candidateTime (residual t w) k = candidateTime w k - t := by
  induction k with
  | zero => simp
  | succ k ih => rw [candidateTime_succ, candidateTime_succ, ih, residual_succ]; ring

theorem candidateTime_tail (w : ClockPath) (k : ℕ) :
    candidateTime (tail w) k = candidateTime w (k+1) - w 0 := by
  induction k with
  | zero => simp [candidateTime_succ, tail]
  | succ k ih => rw [candidateTime_succ, candidateTime_succ w (k+1), ih]; simp [tail]; ring

def consumedAt {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (q : Grid n) : ℕ :=
  if q = winner hn ω then 1 else 0

theorem consumedAt_le_one {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (q : Grid n) :
    consumedAt hn ω q ≤ 1 := by unfold consumedAt; split_ifs <;> omega

theorem restarted_candidateTime {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (q : Grid n) (k : ℕ) :
    candidateTime (restartedBoard hn ω q).1 k + firstTime hn ω =
      candidateTime (ω q).1 (k + consumedAt hn ω q) := by
  classical
  rw [restartedBoard_apply]
  by_cases hq : q = winner hn ω
  · simp only [hq, if_pos, consumedAt, ↓reduceIte, candidateTime_tail]
    have ht := winner_attains hn ω
    rw [firstWait_eq] at ht
    rw [ht]
    ring
  · simp only [hq, if_false, consumedAt, ↓reduceIte, Nat.add_zero, residualMarked,
      candidateTime_residual]
    ring

theorem restarted_candidateMark {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (q : Grid n) (k : ℕ) :
    (restartedBoard hn ω q).2 k = (ω q).2 (k + consumedAt hn ω q) := by
  classical
  rw [restartedBoard_apply]
  by_cases hq : q = winner hn ω <;>
    simp [consumedAt, hq, tail, residualMarked]

end NoThreeLine.RestartPathIdentities

#print axioms NoThreeLine.RestartPathIdentities.restarted_candidateTime
#print axioms NoThreeLine.RestartPathIdentities.restarted_candidateMark
