import NoThreeLine.UnitSourcePrice
import NoThreeLine.SourceCutExpectation

/-! Exact unit-price source on actual cut witnesses for separated labels,
with domination and measurability needed for the same-board expectation. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

def unitCutSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (δ : ℝ) (hδ : 0≤δ) (ω : BoardClockPath n) : ℝ :=
  ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*
    mixed cfg.directions (insert q C) (D.erase q) L
      (observedWitness cfg e (sourceCutTerminal cfg ε M start δ hδ hn s ω))

def unitSourceCap {n : ℕ} (C D : Finset (Grid n)) (B : ℝ) : ℝ :=
  ∑q∈D,((1:ℝ)/n)*mixedCap (insert q C) B

theorem unitCutSource_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (δ : ℝ) (hδ : 0≤δ) (ω : BoardClockPath n) :
    0≤unitCutSource cfg ε M start e C D L hn s δ hδ ω ∧
      unitCutSource cfg ε M start e C D L hn s δ hδ ω≤unitSourceCap C D cfg.B := by
  have hv := observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ hδ hn s ω)
  constructor
  · exact Finset.sum_nonneg (fun q _=>mul_nonneg
      (div_nonneg (mul_nonneg (cfg.mask_nonneg q) (e.bounds q _).1) (Nat.cast_nonneg n))
      (mixed_nonneg _ cfg.directions (insert q C) (D.erase q) L cfg.B hv))
  · apply Finset.sum_le_sum
    intro q _
    have hc : cfg.mask q*e.value q (start+cfg.horizon-δ)/n≤1/n := by
      apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
      nlinarith [cfg.mask_nonneg q,hm q,(e.bounds q (start+cfg.horizon-δ)).1,
        (e.bounds q (start+cfg.horizon-δ)).2]
    exact mul_le_mul hc (mixed_le_cap _ cfg.directions (insert q C) (D.erase q) L cfg.B hv)
      (mixed_nonneg _ cfg.directions (insert q C) (D.erase q) L cfg.B hv)
      (div_nonneg zero_le_one (Nat.cast_nonneg n))

theorem unitCutSource_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>unitCutSource cfg ε M start e C D L hn s x.1 x.1.coe_nonneg x.2) := by
  apply Finset.measurable_sum
  intro q _
  exact ((((e.measurable_value q).comp
    (measurable_const.sub (measurable_subtype_coe.comp measurable_fst))).const_mul (cfg.mask q)).div_const n).mul
    (sourceCutMixed_joint_measurable cfg ε M start e (insert q C) (D.erase q) L hn s)

theorem localSource_eq_unitCutSource {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodObservation cfg) (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D))
    (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    localSource cfg ε M start e C D L hn s k ω
      ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω)=
      unitCutSource cfg ε M start e C D L hn s δ hδ ω := by
  rw [localSource_cutTerminal cfg ε M start δ hδ e C D L hn s k ω ht,
    sourceSum_unit_price _ cfg.directions C D L cfg.mask _ hCD hsep]
  rfl

theorem terminalCalendarSource_le_unitCutSource {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1)
    (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D)) (ω : BoardClockPath n) :
    terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)≤
      unitCutSource cfg ε M start e C D L hn s δ hδ ω := by
  classical
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  let t := s.val.1.val.2-δ
  by_cases h : ∃j<N,t∈Ioo (elapsedTime cfg ε M start hn s j ω) (elapsedTime cfg ε M start hn s (j+1) ω)
  · obtain ⟨j,hj,hjt⟩ := h
    have he := CalendarIntegral.sum_shiftedSegment_at_interior
      (fun k=>elapsedTime cfg ε M start hn s k ω) (elapsedTime_monotone cfg ε M start hn s ω) N
      (fun k=>localSource cfg ε M start e C D L hn s k ω) j hj t hjt
    change terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=_ at he
    rw [he,localSource_eq_unitCutSource cfg ε M start δ hδ e C D L hn s hCD hsep j ω hjt]
  · have hz : terminalCalendarSource cfg ε M start e C D L hn s (ω,t)=0 := by
      unfold terminalCalendarSource finiteCalendarSource
      apply Finset.sum_eq_zero
      intro j hj
      exact if_neg (fun hjt=>h ⟨j,Finset.mem_range.mp hj,hjt⟩)
    rw [hz]
    exact (unitCutSource_bounds cfg ε M start e C D L hn s hm δ hδ ω).1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.localSource_eq_unitCutSource
#print axioms NoThreeLine.BirthWitness.terminalCalendarSource_le_unitCutSource
