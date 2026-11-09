import NoThreeLine.RootFreezeSourceTerminal
import NoThreeLine.WitnessCalendarSource

/-! Put the frozen running source on the same original-board calendar.
The physical elapsed intervals are unchanged; the root-freeze tag only
sets the corresponding source to zero. All identities keep actual records. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open CalendarIntegral

def rootFrozenAt {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (s : GoodRootObservation cfg p) (j : ℕ) (ω : BoardClockPath n) : Bool :=
  (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω).1.val.2.1

theorem rootFrozenAt_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : GoodRootObservation cfg p) (j : ℕ) :
    Measurable (rootFrozenAt cfg ε M start p hn s j) :=
  (measurable_subtype_coe.comp
    (RecycledBoardProcess.iterate_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s j).fst).snd.fst

def localRootSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodRootObservation cfg p)
    (j : ℕ) (ω : BoardClockPath n) (t : ℝ) : ℝ :=
  if rootFrozenAt cfg ε M start p hn s j ω=true then 0
  else localSource cfg ε M start e C D L hn (goodRootActual cfg p s) j ω t

theorem localRootSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (j : ℕ) :
    Measurable (fun x : BoardClockPath n×ℝ=>localRootSource cfg ε M start p e C D L hn s j x.1 x.2) :=
  Measurable.ite (((rootFrozenAt_measurable cfg ε M start p hn s j).comp measurable_fst).eq measurable_const).setOf
    measurable_const (localSource_measurable cfg ε M start e C D L hn (goodRootActual cfg p s) j)

theorem localRootSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (j : ℕ) (ω : BoardClockPath n) (t : ℝ)
    (ht : t∈Ioo (0:ℝ) (elapsedTime cfg ε M start hn (goodRootActual cfg p s) (j+1) ω-
      elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)) :
    0≤localRootSource cfg ε M start p e C D L hn s j ω t ∧
      localRootSource cfg ε M start p e C D L hn s j ω t≤sourceCap cfg.directions C D cfg.B cfg.K := by
  unfold localRootSource
  split_ifs
  · exact ⟨le_rfl,sourceCap_nonneg _ _ _ _ _⟩
  · exact localSource_bounds cfg ε M start e C D L hn (goodRootActual cfg p s) hm hK j ω t ht

def segmentRootCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (j : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  shiftedSegment (elapsedTime cfg ε M start hn (goodRootActual cfg p s) j x.1)
    (elapsedTime cfg ε M start hn (goodRootActual cfg p s) (j+1) x.1)
    (localRootSource cfg ε M start p e C D L hn s j x.1) x.2

theorem segmentRootCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (j : ℕ) :
    Measurable (segmentRootCalendarSource cfg ε M start p e C D L hn s j) := by
  classical
  have ha := (elapsedTime_measurable cfg ε M start hn (goodRootActual cfg p s) j).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→BoardClockPath n))
  have hb := (elapsedTime_measurable cfg ε M start hn (goodRootActual cfg p s) (j+1)).comp
    (measurable_fst : Measurable (Prod.fst : BoardClockPath n×ℝ→BoardClockPath n))
  unfold segmentRootCalendarSource shiftedSegment
  let g : BoardClockPath n×ℝ→BoardClockPath n×ℝ := fun x=>
    (x.1,x.2-elapsedTime cfg ε M start hn (goodRootActual cfg p s) j x.1)
  have hg : Measurable g := measurable_fst.prodMk (measurable_snd.sub ha)
  convert Measurable.ite ((ha.lt measurable_snd).and (measurable_snd.lt hb)).setOf
    ((localRootSource_measurable cfg ε M start p e C D L hn s j).comp hg)
    (measurable_const : Measurable (fun _ : BoardClockPath n×ℝ=>(0:ℝ))) using 1
  rfl

def finiteRootCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (N : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  ∑j∈Finset.range N,segmentRootCalendarSource cfg ε M start p e C D L hn s j x

theorem finiteRootCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (N : ℕ) :
    Measurable (finiteRootCalendarSource cfg ε M start p e C D L hn s N) :=
  Finset.measurable_sum _ (fun j _=>segmentRootCalendarSource_measurable cfg ε M start p e C D L hn s j)

theorem finiteRootCalendarSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (N : ℕ) (x : BoardClockPath n×ℝ) :
    0≤finiteRootCalendarSource cfg ε M start p e C D L hn s N x ∧
      finiteRootCalendarSource cfg ε M start p e C D L hn s N x≤sourceCap cfg.directions C D cfg.B cfg.K :=
  sum_shiftedSegment_bounds _ (elapsedTime_monotone cfg ε M start hn (goodRootActual cfg p s) x.1) N _ _
    (sourceCap_nonneg _ _ _ _ _) (fun j _=>localRootSource_bounds cfg ε M start p e C D L hn s hm hK j x.1) x.2

def terminalRootCalendarSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (x : BoardClockPath n×ℝ) : ℝ :=
  finiteRootCalendarSource cfg ε M start p e C D L hn s (augRecycledCompletionIndex cfg ε M hn s.val.1.1 x.1) x

theorem terminalRootCalendarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) : Measurable (terminalRootCalendarSource cfg ε M start p e C D L hn s) := by
  classical
  exact Measurable.find (finiteRootCalendarSource_measurable cfg ε M start p e C D L hn s)
    (fun j=>((augRecycledCompletionPredicate_measurable cfg ε M hn s.val.1.1 j).comp measurable_fst).setOf)
    (fun x : BoardClockPath n×ℝ=>augRecycledCompletionPredicate_exists cfg ε M hn s.val.1.1 x.1)

theorem terminalRootCalendarSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (x : BoardClockPath n×ℝ) :
    0≤terminalRootCalendarSource cfg ε M start p e C D L hn s x ∧
      terminalRootCalendarSource cfg ε M start p e C D L hn s x≤sourceCap cfg.directions C D cfg.B cfg.K :=
  finiteRootCalendarSource_bounds cfg ε M start p e C D L hn s hm hK _ x

theorem goodRootRunningSource_eq_actual_flag {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (j : ℕ) (ω : BoardClockPath n) :
    goodRootRunningSource cfg ε M start p e C D L hn
      (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω)=
      if rootFrozenAt cfg ε M start p hn s j ω=true then 0
      else goodRunningSource cfg ε M start e C D L hn
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) (goodRootActual cfg p s) j ω) := by
  rw [←goodRootRecycled_actual cfg ε M start p hn s j ω]
  rfl

theorem finiteRootCalendarSource_integral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (N : ℕ) (ω : BoardClockPath n) :
    (∫t in (0:ℝ)..s.val.1.1.val.2,finiteRootCalendarSource cfg ε M start p e C D L hn s N (ω,t))=
      cumulativeRootRunningSource cfg ε M start p e C D L hn s N ω := by
  have h := sum_shiftedSegment_integral (fun j=>elapsedTime cfg ε M start hn (goodRootActual cfg p s) j ω)
    (elapsedTime_monotone cfg ε M start hn (goodRootActual cfg p s) ω) N s.val.1.1.val.2
    (by rw [elapsedTime_zero]) (elapsedTime_mem cfg ε M start hn (goodRootActual cfg p s) N ω).2
    (fun j=>localRootSource cfg ε M start p e C D L hn s j ω)
    (fun j _=>(localRootSource_measurable cfg ε M start p e C D L hn s j).comp
      (measurable_const.prodMk measurable_id))
    (sourceCap cfg.directions C D cfg.B cfg.K) (sourceCap_nonneg _ _ _ _ _)
    (fun j _=>localRootSource_bounds cfg ε M start p e C D L hn s hm hK j ω)
  change (∫t in (0:ℝ)..s.val.1.1.val.2,finiteRootCalendarSource cfg ε M start p e C D L hn s N (ω,t))=_ at h
  rw [h]
  apply Finset.sum_congr rfl
  intro j hj
  rw [goodRootRunningSource_eq_actual_flag]
  by_cases hf : rootFrozenAt cfg ε M start p hn s j ω=true
  · simp only [localRootSource,if_pos hf,intervalIntegral.integral_zero]
  · simp only [localRootSource,if_neg hf]
    rw [elapsedTime_succ_sub]
    rfl

theorem terminalRootRunningSource_eq_timeIntegral {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (ω : BoardClockPath n) :
    terminalRootRunningSource cfg ε M start p e C D L hn s ω=
      ∫t in (0:ℝ)..s.val.1.1.val.2,terminalRootCalendarSource cfg ε M start p e C D L hn s (ω,t) :=
  (finiteRootCalendarSource_integral cfg ε M start p e C D L hn s hm hK _ ω).symm

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.terminalRootCalendarSource_measurable
#print axioms NoThreeLine.BirthWitness.terminalRootCalendarSource_bounds
#print axioms NoThreeLine.BirthWitness.terminalRootRunningSource_eq_timeIntegral
