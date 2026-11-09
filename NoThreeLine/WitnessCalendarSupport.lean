import NoThreeLine.WitnessCalendarSource

/-! The glued source vanishes before the initial time and after actual
completion. Its retention coefficient is evaluated at one common absolute
calendar time, independently of the segment containing that time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

theorem terminalCalendarSource_after_completion {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) (t : ℝ)
    (ht : elapsedTime cfg ε M start hn s (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω≤t) :
    terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=0 := by
  unfold terminalCalendarSource finiteCalendarSource
  apply Finset.sum_eq_zero
  intro j hj
  unfold segmentCalendarSource CalendarIntegral.shiftedSegment
  apply if_neg
  intro hh
  have hm := elapsedTime_monotone cfg ε M start hn s ω
    (Nat.succ_le_of_lt (Finset.mem_range.mp hj))
  exact not_lt_of_ge (hm.trans ht) hh.2

theorem terminalCalendarSource_before_initial {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) (t : ℝ)
    (ht : t≤0) : terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=0 := by
  unfold terminalCalendarSource finiteCalendarSource
  apply Finset.sum_eq_zero
  intro j _
  unfold segmentCalendarSource CalendarIntegral.shiftedSegment
  exact if_neg (fun hh=>not_lt_of_ge (ht.trans (elapsedTime_mem cfg ε M start hn s j ω).1) hh.1)

theorem localSource_common_absolute_time {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (j : ℕ) (ω : BoardClockPath n) (t : ℝ) :
    localSource cfg ε M start e C D L hn s j ω (t-elapsedTime cfg ε M start hn s j ω)=
      sourceSum
        (selectedWitnessCurve cfg
          (augTimedInput cfg (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val.1).1
          (recordedValue e (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val.2)
          (t-elapsedTime cfg ε M start hn s j ω))
        cfg.directions C D L cfg.mask (fun q=>e.value q (observationTime cfg start s.val.1+t)) := by
  dsimp only [localSource,selectedSourceSum]
  rw [observationTime_local_shift]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_after_completion
#print axioms NoThreeLine.BirthWitness.localSource_common_absolute_time
