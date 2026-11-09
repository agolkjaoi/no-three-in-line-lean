import NoThreeLine.RestartPathIdentities

/-! Track absolute elapsed time and each site's consumed candidate index
through repeated concrete clock restart. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.CandidateConsumption
open ActualClockRestart IteratedCandidateClocks RestartPathIdentities
open BoardFirstCandidate BoardWinnerLaw WinnerMarkLaw

def boardAfter {n : ℕ} (hn : 0 < n) (k : ℕ) : BoardClockPath n → BoardClockPath n :=
  (restartedBoard hn)^[k]

theorem boardAfter_zero {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : boardAfter hn 0 ω = ω := rfl

theorem boardAfter_succ {n : ℕ} (hn : 0 < n) (k : ℕ) (ω : BoardClockPath n) :
    boardAfter hn (k+1) ω = restartedBoard hn (boardAfter hn k ω) :=
  Function.iterate_succ_apply' _ _ _

def elapsed {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : ℕ → ℝ
  | 0 => 0
  | k+1 => elapsed hn ω k + firstTime hn (boardAfter hn k ω)

def siteCount {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : ℕ → Grid n → ℕ
  | 0, _ => 0
  | k+1, q => siteCount hn ω k q + consumedAt hn (boardAfter hn k ω) q

theorem siteCount_step_le {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) (q : Grid n) :
    siteCount hn ω k q ≤ siteCount hn ω (k+1) q ∧
      siteCount hn ω (k+1) q ≤ siteCount hn ω k q + 1 := by
  have h := consumedAt_le_one hn (boardAfter hn k ω) q
  simp only [siteCount]
  omega

theorem candidateTime_invariant {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (k : ℕ) (q : Grid n) (j : ℕ) :
    candidateTime (boardAfter hn k ω q).1 j + elapsed hn ω k =
      candidateTime (ω q).1 (j + siteCount hn ω k q) := by
  induction k generalizing j with
  | zero => simp [boardAfter_zero, elapsed, siteCount]
  | succ k ih =>
    have hs := restarted_candidateTime hn (boardAfter hn k ω) q j
    rw [← boardAfter_succ] at hs
    simp only [elapsed, siteCount]
    calc
      candidateTime (boardAfter hn (k+1) ω q).1 j +
          (elapsed hn ω k + firstTime hn (boardAfter hn k ω)) =
          (candidateTime (boardAfter hn (k+1) ω q).1 j + firstTime hn (boardAfter hn k ω)) +
            elapsed hn ω k := by ring
      _ = candidateTime (boardAfter hn k ω q).1 (j + consumedAt hn (boardAfter hn k ω) q) +
          elapsed hn ω k := by rw [hs]
      _ = candidateTime (ω q).1 ((j + consumedAt hn (boardAfter hn k ω) q) +
          siteCount hn ω k q) := ih _
      _ = candidateTime (ω q).1 (j + (siteCount hn ω k q + consumedAt hn (boardAfter hn k ω) q)) := by
        congr 1
        omega

theorem candidateMark_invariant {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (k : ℕ) (q : Grid n) (j : ℕ) :
    (boardAfter hn k ω q).2 j = (ω q).2 (j + siteCount hn ω k q) := by
  induction k generalizing j with
  | zero => simp [boardAfter_zero, siteCount]
  | succ k ih =>
    calc
      (boardAfter hn (k+1) ω q).2 j =
          (boardAfter hn k ω q).2 (j + consumedAt hn (boardAfter hn k ω) q) := by
        rw [boardAfter_succ, restarted_candidateMark]
      _ = (ω q).2 ((j + consumedAt hn (boardAfter hn k ω) q) + siteCount hn ω k q) := ih _
      _ = (ω q).2 (j + siteCount hn ω (k+1) q) := by
        apply congrArg ((ω q).2)
        simp only [siteCount]
        omega

def scheduledIndex {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) : Grid n × ℕ :=
  let p := winner hn (boardAfter hn k ω)
  (p,siteCount hn ω k p)

theorem scheduled_time {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) :
    candidateTime (ω (scheduledIndex hn ω k).1).1 (scheduledIndex hn ω k).2 = elapsed hn ω (k+1) := by
  have hi := candidateTime_invariant hn ω k (winner hn (boardAfter hn k ω)) 0
  simp only [Nat.zero_add, candidateTime_zero] at hi
  have ht := winner_attains hn (boardAfter hn k ω)
  rw [firstWait_eq] at ht
  rw [ht] at hi
  change _ = elapsed hn ω k + firstTime hn (boardAfter hn k ω)
  simpa only [scheduledIndex, add_comm] using hi.symm

theorem scheduled_mark {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) (k : ℕ) :
    candidateMark ω (scheduledIndex hn ω k) = winnerMark hn (boardAfter hn k ω) := by
  have hi := candidateMark_invariant hn ω k (winner hn (boardAfter hn k ω)) 0
  simp only [Nat.zero_add] at hi
  exact hi.symm

def PositiveSteps {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n) : Prop :=
  ∀ k, 0 < firstTime hn (boardAfter hn k ω)

theorem elapsed_strictMono {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hp : PositiveSteps hn ω) : StrictMono (elapsed hn ω) := by
  apply strictMono_nat_of_lt_succ
  intro k
  exact lt_add_of_pos_right _ (hp k)

theorem scheduledIndex_injective {n : ℕ} (hn : 0 < n) (ω : BoardClockPath n)
    (hp : PositiveSteps hn ω) : Injective (scheduledIndex hn ω) := by
  intro i j hij
  have he : elapsed hn ω (i+1) = elapsed hn ω (j+1) := by
    rw [← scheduled_time, ← scheduled_time, hij]
  exact Nat.add_right_cancel ((elapsed_strictMono hn ω hp).injective he)

theorem boardAfter_preserving {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ) :
    MeasurePreserving (boardAfter hn k) (boardClockMeasure n rate) (boardClockMeasure n rate) :=
  ⟨(restartedBoard_measurable hn).iterate k, residualPrefix_map hn rate hr k⟩

theorem positiveSteps_ae {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) :
    ∀ᵐ ω ∂boardClockMeasure n rate, PositiveSteps hn ω := by
  apply ae_all_iff.mpr
  intro k
  exact (boardAfter_preserving hn rate hr k).quasiMeasurePreserving.ae
    (firstTime_ae_positive hn rate hr)

end NoThreeLine.CandidateConsumption

#print axioms NoThreeLine.CandidateConsumption.candidateTime_invariant
#print axioms NoThreeLine.CandidateConsumption.scheduledIndex_injective
#print axioms NoThreeLine.CandidateConsumption.positiveSteps_ae
