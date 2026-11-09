import NoThreeLine.BirthCalendarRate
import NoThreeLine.CalendarSegmentPartition
import NoThreeLine.SourceCutInterval
import NoThreeLine.CutPointLaw

/-! The physical calendar and the good-observation calendar are projections
of the same original-board iteration. Interior cut states give the same rate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem goodObservedRecycled_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω).1.val.1=
      (augRecycledPair cfg ε M hn s.val.1 k ω).1 := by
  exact (congrArg (fun x=>x.1.1)
    (goodObservedRecycled_projection cfg ε M start hn s k ω)).trans
    (congrArg Prod.fst (observedRecycledPair_base cfg ε M start hn s.val k ω))

theorem elapsedTime_eq_birthCalendarTime {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    elapsedTime cfg ε M start hn s k ω=birthCalendarTime cfg ε M hn s.val.1 k ω := by
  unfold elapsedTime birthCalendarTime
  rw [goodObservedRecycled_base]

theorem birthCalendarTime_le_remaining {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    birthCalendarTime cfg ε M hn s k ω≤s.val.2 :=
  sub_le_self _ (augRecycledPair cfg ε M hn s k ω).1.property.2.1

theorem finiteBirthCalendarRate_at_interior {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) (N j : ℕ) (hj : j<N)
    (ω : BoardClockPath n) (t : ℝ)
    (ht : t∈Ioo (birthCalendarTime cfg ε M hn s j ω) (birthCalendarTime cfg ε M hn s (j+1) ω)) :
    finiteBirthCalendarRate cfg ε M p hn s N (ω,t)=
      cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s j ω).1,
        t-birthCalendarTime cfg ε M hn s j ω) :=
  CalendarIntegral.sum_shiftedSegment_at_interior
    (fun k=>birthCalendarTime cfg ε M hn s k ω) (birthCalendarTime_monotone cfg ε M hn s ω) N
    (fun k u=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s k ω).1,u)) j hj t ht

theorem finiteBirthCalendarRate_zero_after {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) (N : ℕ) (ω : BoardClockPath n)
    (t : ℝ) (ht : birthCalendarTime cfg ε M hn s N ω≤t) :
    finiteBirthCalendarRate cfg ε M p hn s N (ω,t)=0 :=
  CalendarIntegral.sum_shiftedSegment_zero_after
    (fun k=>birthCalendarTime cfg ε M hn s k ω) (birthCalendarTime_monotone cfg ε M hn s ω) N
    (fun k u=>cappedBirthRate cfg ε M p ((augRecycledPair cfg ε M hn s k ω).1,u)) t ht

theorem terminalBirthCalendarRate_zero_after_remaining {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (hn : 0<n) (s : AugTimedState cfg) (ω : BoardClockPath n)
    (t : ℝ) (ht : s.val.2≤t) : terminalBirthCalendarRate cfg ε M p hn s (ω,t)=0 :=
  finiteBirthCalendarRate_zero_after cfg ε M p hn s _ ω t
    ((birthCalendarTime_le_remaining cfg ε M hn s _ ω).trans ht)

theorem cutProcess_eq_cappedProcess_interior {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) (j : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ∈Ioo (elapsedTime cfg ε M start hn s j ω)
      (elapsedTime cfg ε M start hn s (j+1) ω)) :
    cutProcess cfg ε M start hn s (δ,ω)=
      cappedProcess cfg ε M ((augRecycledPair cfg ε M hn s.val.1 j ω).1,
        (s.val.1.val.2-δ)-birthCalendarTime cfg ε M hn s.val.1 j ω) := by
  have hh := (sourceCutTerminal_interior cfg ε M start δ δ.coe_nonneg hn s j ω ht).1
  have hc := (elapsed_segment_context cfg ε M start hn s j ω (s.val.1.val.2-δ) ht).2
  rw [←goodObservedRecycled_base cfg ε M start hn s j ω,
    ←elapsedTime_eq_birthCalendarTime cfg ε M start hn s j ω,
    cappedProcess_eq_flow cfg ε M _ _ ⟨hc.1.le,hc.2.le⟩]
  exact congrArg (fun x : AugmentedState n × ℝ=>x.1.physical.process) hh

theorem terminalBirthCalendarRate_eq_cut_interior {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) (j : ℕ)
    (ω : BoardClockPath n) (hj : j<augRecycledCompletionIndex cfg ε M hn s.val.1 ω)
    (ht : s.val.1.val.2-δ∈Ioo (elapsedTime cfg ε M start hn s j ω)
      (elapsedTime cfg ε M start hn s (j+1) ω)) :
    terminalBirthCalendarRate cfg ε M p hn s.val.1 (ω,s.val.1.val.2-δ)=
      (cutProcess cfg ε M start hn s (δ,ω)).birthRate cfg.mask p := by
  rw [cutProcess_eq_cappedProcess_interior cfg ε M start hn s δ j ω ht]
  exact finiteBirthCalendarRate_at_interior cfg ε M p hn s.val.1 _ j hj ω _
    (by simpa only [elapsedTime_eq_birthCalendarTime] using ht)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodObservedRecycled_base
#print axioms NoThreeLine.BirthWitness.cutProcess_eq_cappedProcess_interior
#print axioms NoThreeLine.BirthWitness.terminalBirthCalendarRate_eq_cut_interior
