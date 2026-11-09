import NoThreeLine.SourceCutObservable
import NoThreeLine.SourceNestedCut
import NoThreeLine.CalendarSegmentPartition

/-! The actual glued source is bounded by lower witness-degree mixed
observables of the same original-board cut terminal. Shared-line prices
are bounded only where the actual guard avoidance supplies the clock bound. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def cutHierarchySource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (δ : ℝ) (hδ : 0≤δ) (ω : BoardClockPath n) : ℝ :=
  ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*
    max 1 (protection 1 cfg.K)^cfg.directions.card*
    mixed cfg.directions (insert q C) (D.erase q) L
      (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))

theorem cutHierarchySource_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (δ : ℝ) (hδ : 0≤δ) (ω : BoardClockPath n) :
    0≤cutHierarchySource cfg ε M start e C D L hn s δ hδ ω := by
  have hv := observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω)
  exact Finset.sum_nonneg (fun q _=>mul_nonneg
    (mul_nonneg (div_nonneg (mul_nonneg (cfg.mask_nonneg q) (e.bounds q _).1) (Nat.cast_nonneg n))
      (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _))
    (mixed_nonneg _ cfg.directions (insert q C) (D.erase q) L cfg.B hv))

theorem cutHierarchySource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (δ : ℝ) (hδ : 0≤δ) (ω : BoardClockPath n) :
    0≤cutHierarchySource cfg ε M start e C D L hn s δ hδ ω ∧
      cutHierarchySource cfg ε M start e C D L hn s δ hδ ω≤sourceCap cfg.directions C D cfg.B cfg.K := by
  refine ⟨cutHierarchySource_nonneg cfg ε M start e C D L hn s δ hδ ω,?_⟩
  have hv := observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω)
  apply Finset.sum_le_sum
  intro q _
  have hc : cfg.mask q*e.value q (start+cfg.horizon-δ)/n≤1/n := by
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    nlinarith [cfg.mask_nonneg q,hm q,(e.bounds q (start+cfg.horizon-δ)).1,
      (e.bounds q (start+cfg.horizon-δ)).2]
  exact mul_le_mul (mul_le_mul_of_nonneg_right hc (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _))
    (mixed_le_cap _ cfg.directions (insert q C) (D.erase q) L cfg.B hv)
    (mixed_nonneg _ cfg.directions (insert q C) (D.erase q) L cfg.B hv)
    (mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
      (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _))

theorem cutHierarchySource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>cutHierarchySource cfg ε M start e C D L hn s x.1 x.1.coe_nonneg x.2) := by
  apply Finset.measurable_sum
  intro q _
  exact ((((e.measurable_value q).comp
    (measurable_const.sub (measurable_subtype_coe.comp measurable_fst))).const_mul (cfg.mask q)).div_const n |>.mul_const _).mul
    (sourceCutMixed_joint_measurable cfg ε M start e (insert q C) (D.erase q) L hn s)

theorem localSource_le_cutHierarchySource {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodObservation cfg) (hK : cfg.K<2) (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    localSource cfg ε M start e C D L hn s k ω
      ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω)≤
      cutHierarchySource cfg ε M start e C D L hn s δ hδ ω := by
  let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
  by_cases hC : C⊆x.1.val.1.val.1.physical.process.activeEvents
  swap
  · have hz := selectedSourceSum_zero_of_not_active cfg (augTimedInput cfg x.1.val.1).1
      (recordedValue e x.1.val.2) C D L e (observationTime cfg start x.1.val.1)
      ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω) hC
    change localSource cfg ε M start e C D L hn s k ω _=0 at hz
    rw [hz]
    exact cutHierarchySource_nonneg cfg ε M start e C D L hn s δ hδ ω
  have hc := elapsed_segment_context cfg ε M start hn s k ω (s.val.1.val.2-δ) ht
  have hs : x.1.val.1.val.1.physical.process.stopped=false :=
    Bool.eq_false_iff.mpr (fun h=>hc.1 (Or.inr h))
  have hv := observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω)
  rw [localSource_cutTerminal cfg ε M start δ hδ e C D L hn s k ω ht]
  apply Finset.sum_le_sum
  intro q _
  apply mul_le_mul_of_nonneg_right _ (mixed_nonneg _ cfg.directions (insert q C) (D.erase q) L cfg.B hv)
  apply mul_le_mul_of_nonneg_left _ (div_nonneg
    (mul_nonneg (cfg.mask_nonneg q) (e.bounds q _).1) (Nat.cast_nonneg n))
  apply sourcePrice_le _ cfg.directions C q cfg.K hK
  intro J hJ hsp
  have hcurve := congrArg (fun z=>z.1.physical)
    (sourceCutTerminal_interior cfg ε M start δ hδ hn s k ω ht).1
  change (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical=_ at hcurve
  change ((sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical).clocks J≤cfg.K
  rw [hcurve]
  exact (shared_clock_selected_lt cfg (augTimedInput cfg x.1.val.1).1.1 C q x.1.val.1.property.1.1 hs hC _
    ⟨hc.2.1.le,hc.2.2.trans_le (augGuardTime_mem cfg ε M (augTimedInput cfg x.1.val.1) x.1.val.1.property.1.1).2⟩ J hJ hsp).le

theorem terminalCalendarSource_le_cutHierarchySource {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodObservation cfg) (hK : cfg.K<2) (ω : BoardClockPath n) :
    terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)≤
      cutHierarchySource cfg ε M start e C D L hn s δ hδ ω := by
  classical
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  let t := s.val.1.val.2-δ
  by_cases h : ∃j<N,t∈Ioo (elapsedTime cfg ε M start hn s j ω) (elapsedTime cfg ε M start hn s (j+1) ω)
  · obtain ⟨j,hj,hjt⟩ := h
    have he := CalendarIntegral.sum_shiftedSegment_at_interior
      (fun k=>elapsedTime cfg ε M start hn s k ω) (elapsedTime_monotone cfg ε M start hn s ω) N
      (fun k=>localSource cfg ε M start e C D L hn s k ω) j hj t hjt
    change terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=_ at he
    rw [he]
    exact localSource_le_cutHierarchySource cfg ε M start δ hδ e C D L hn s hK j ω hjt
  · have hz : terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=0 := by
      unfold terminalCalendarSource finiteCalendarSource
      apply Finset.sum_eq_zero
      intro j hj
      exact if_neg (fun hjt=>h ⟨j,Finset.mem_range.mp hj,hjt⟩)
    rw [hz]
    exact cutHierarchySource_nonneg cfg ε M start e C D L hn s δ hδ ω

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutHierarchySource_joint_measurable
#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_le_cutHierarchySource
