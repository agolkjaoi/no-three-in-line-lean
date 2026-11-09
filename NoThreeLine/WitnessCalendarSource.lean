import NoThreeLine.WitnessElapsedSegments
import NoThreeLine.FiniteCalendarIntegral

/-! The actual source as a jointly measurable calendar-time function on one
original-board path. Open segments omit only their finitely many endpoints.
The source is zero after actual completion, including early global stopping. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open CalendarIntegral

def localSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (j : ℕ) (ω : BoardClockPath n) (t : ℝ) : ℝ :=
  let y := (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val
  selectedSourceSum cfg (augTimedInput cfg y.1).1 (recordedValue e y.2) C D L e
    (observationTime cfg start y.1) t

theorem localSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (j : ℕ) :
    Measurable (fun x : BoardClockPath n×ℝ=>localSource cfg ε M start e C D L hn s j x.1 x.2) := by
  unfold localSource
  let g : BoardClockPath n×ℝ→TimedObservation cfg×ℝ := fun x=>
    ((RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j x.1).1.val,x.2)
  have hg : Measurable g :=
    ((goodState_observation_measurable cfg ε M start hn s j).comp measurable_fst).prodMk measurable_snd
  convert (selectedSourceSum_joint_measurable cfg e start C D L).comp hg using 1
  rfl

def segmentCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (j : ℕ)
    (x : BoardClockPath n×ℝ) : ℝ :=
  shiftedSegment (elapsedTime cfg ε M start hn s j x.1) (elapsedTime cfg ε M start hn s (j+1) x.1)
    (localSource cfg ε M start e C D L hn s j x.1) x.2

theorem segmentCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (j : ℕ) :
    Measurable (segmentCalendarSource cfg ε M start e C D L hn s j) := by
  classical
  have ha := (elapsedTime_measurable cfg ε M start hn s j).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→BoardClockPath n))
  have hb := (elapsedTime_measurable cfg ε M start hn s (j+1)).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→BoardClockPath n))
  unfold segmentCalendarSource shiftedSegment
  let g : BoardClockPath n×ℝ→BoardClockPath n×ℝ := fun x=>
    (x.1,x.2-elapsedTime cfg ε M start hn s j x.1)
  have hg : Measurable g := measurable_fst.prodMk (measurable_snd.sub ha)
  convert Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((localSource_measurable cfg ε M start e C D L hn s j).comp hg)
    (measurable_const : Measurable (fun _ : BoardClockPath n×ℝ=>(0:ℝ)))
    using 1
  rfl

def finiteCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (N : ℕ)
    (x : BoardClockPath n×ℝ) : ℝ :=
  ∑j∈Finset.range N,segmentCalendarSource cfg ε M start e C D L hn s j x

theorem finiteCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (N : ℕ) :
    Measurable (finiteCalendarSource cfg ε M start e C D L hn s N) :=
  Finset.measurable_sum _ (fun j _=>segmentCalendarSource_measurable cfg ε M start e C D L hn s j)

theorem localSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (j : ℕ) (ω : BoardClockPath n) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (elapsedTime cfg ε M start hn s (j+1) ω-elapsedTime cfg ε M start hn s j ω)) :
    0≤localSource cfg ε M start e C D L hn s j ω t ∧
      localSource cfg ε M start e C D L hn s j ω t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  have hc := elapsed_segment_context cfg ε M start hn s j ω
    (t+elapsedTime cfg ε M start hn s j ω) ⟨by linarith [ht.1],by linarith [ht.2]⟩
  simp only [add_sub_cancel_right] at hc
  exact selectedSourceSum_guard_bounds cfg ε M start e _ C D L
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.property.1
    hc.1 hm hK t hc.2

theorem finiteCalendarSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (N : ℕ) (x : BoardClockPath n×ℝ) :
    0≤finiteCalendarSource cfg ε M start e C D L hn s N x ∧
      finiteCalendarSource cfg ε M start e C D L hn s N x≤sourceCap cfg.directions C D cfg.B cfg.K :=
  sum_shiftedSegment_bounds _ (elapsedTime_monotone cfg ε M start hn s x.1) N _ _
    (sourceCap_nonneg _ _ _ _ _) (fun j _=>localSource_bounds cfg ε M start e C D L hn s hm hK j x.1) x.2

def terminalCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (x : BoardClockPath n×ℝ) : ℝ :=
  finiteCalendarSource cfg ε M start e C D L hn s
    (augRecycledCompletionIndex cfg ε M hn s.val.1 x.1) x

theorem terminalCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (terminalCalendarSource cfg ε M start e C D L hn s) := by
  classical
  exact Measurable.find (finiteCalendarSource_measurable cfg ε M start e C D L hn s)
    (fun j=>((augRecycledCompletionPredicate_measurable cfg ε M hn s.val.1 j).comp measurable_fst).setOf)
    (fun x : BoardClockPath n×ℝ=>augRecycledCompletionPredicate_exists cfg ε M hn s.val.1 x.1)

theorem terminalCalendarSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (x : BoardClockPath n×ℝ) :
    0≤terminalCalendarSource cfg ε M start e C D L hn s x ∧
      terminalCalendarSource cfg ε M start e C D L hn s x≤sourceCap cfg.directions C D cfg.B cfg.K :=
  finiteCalendarSource_bounds cfg ε M start e C D L hn s hm hK _ x

theorem finiteCalendarSource_integral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (N : ℕ) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..s.val.1.val.2,finiteCalendarSource cfg ε M start e C D L hn s N (ω,t))=
      cumulativeRunningSource cfg ε M start e C D L hn s N ω := by
  have h := sum_shiftedSegment_integral (fun j=>elapsedTime cfg ε M start hn s j ω)
    (elapsedTime_monotone cfg ε M start hn s ω) N s.val.1.val.2
    (by rw [elapsedTime_zero]) (elapsedTime_mem cfg ε M start hn s N ω).2
    (fun j=>localSource cfg ε M start e C D L hn s j ω)
    (fun j _=>selectedSourceSum_measurable cfg
      (augTimedInput cfg (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val.1).1
      _ C D L e _)
    (sourceCap cfg.directions C D cfg.B cfg.K) (sourceCap_nonneg _ _ _ _ _)
    (fun j _=>localSource_bounds cfg ε M start e C D L hn s hm hK j ω)
  change (∫t in (0:ℝ)..s.val.1.val.2,finiteCalendarSource cfg ε M start e C D L hn s N (ω,t))=_ at h
  rw [h]
  apply Finset.sum_congr rfl
  intro j _
  rw [elapsedTime_succ_sub]
  rfl

theorem terminalRunningSource_eq_timeIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (ω : BoardClockPath n) :
    terminalRunningSource cfg ε M start e C D L hn s ω=
      ∫t in (0:ℝ)..s.val.1.val.2,terminalCalendarSource cfg ε M start e C D L hn s (ω,t) :=
  (finiteCalendarSource_integral cfg ε M start e C D L hn s hm hK _ ω).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_measurable
#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_bounds
#print axioms NoThreeLine.BirthWitness.terminalRunningSource_eq_timeIntegral
