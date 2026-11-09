import NoThreeLine.SourceCutHierarchyPointwise

/-! Expectations of actual cut mixed observables and the real source
inequality. The finite lower-degree sum is derived from the pointwise
calendar estimate and actual board law, not postulated as a mean premise. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def cutMixedMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (δ : ℝ≥0) : ℝ :=
  ∫ω,mixed cfg.directions C D L
    (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))
      ∂boardClockMeasure n (cfg.B/n)

theorem cutMixed_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (δ : ℝ≥0) :
    Integrable (fun ω=>mixed cfg.directions C D L
      (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω)))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((sourceCutMixed_joint_measurable cfg ε M start e C D L hn s).comp
      (measurable_const.prodMk measurable_id)) (mixedCap C cfg.B)
  intro ω
  have hv := observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start δ δ.coe_nonneg hn s ω)
  exact ⟨mixed_nonneg _ cfg.directions C D L cfg.B hv,mixed_le_cap _ cfg.directions C D L cfg.B hv⟩

theorem cutMixedMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (cutMixedMean cfg ε M start e C D L hn s) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact (sourceCutMixed_joint_measurable cfg ε M start e C D L hn s).stronglyMeasurable.integral_prod_right'.measurable

theorem cutMixedMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (δ : ℝ≥0) :
    0≤cutMixedMean cfg ε M start e C D L hn s δ ∧
      cutMixedMean cfg ε M start e C D L hn s δ≤mixedCap C cfg.B := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hv (ω : BoardClockPath n) := observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start δ δ.coe_nonneg hn s ω)
  refine ⟨integral_nonneg (fun ω=>mixed_nonneg _ cfg.directions C D L cfg.B (hv ω)),?_⟩
  have hh := integral_mono (cutMixed_integrable cfg ε M start e C D L hn hB s δ)
    (integrable_const (mixedCap C cfg.B)) (fun ω=>mixed_le_cap _ cfg.directions C D L cfg.B (hv ω))
  simpa only [cutMixedMean,integral_const,probReal_univ,one_smul] using hh

theorem cutHierarchySource_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (δ : ℝ≥0) :
    (∫ω,cutHierarchySource cfg ε M start e C D L hn s δ δ.coe_nonneg ω ∂boardClockMeasure n (cfg.B/n))=
      ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*max 1 (protection 1 cfg.K)^cfg.directions.card*
        cutMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s δ := by
  unfold cutHierarchySource
  rw [integral_finset_sum _ (fun q _=>
    (cutMixed_integrable cfg ε M start e (insert q C) (D.erase q) L hn hB s δ).const_mul _)]
  simp only [integral_const_mul,cutMixedMean]

theorem calendarMeanSource_le_cutMixedMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (δ : ℝ≥0) :
    calendarMeanSource cfg ε M start e C D L hn s (s.val.1.val.2-δ)≤
      ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*max 1 (protection 1 cfg.K)^cfg.directions.card*
        cutMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s δ := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [←cutHierarchySource_mean cfg ε M start e C D L hn hB s δ]
  have hf : Measurable (fun ω : BoardClockPath n=>
      terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)) := by
    convert (terminalCalendarSource_measurable cfg ε M start e C D L hn s).comp
      (measurable_id.prodMk (measurable_const (a := s.val.1.val.2-(δ:ℝ)))) using 1
    rfl
  have hg : Measurable (fun ω : BoardClockPath n=>
      cutHierarchySource cfg ε M start e C D L hn s δ δ.coe_nonneg ω) := by
    convert (cutHierarchySource_joint_measurable cfg ε M start e C D L hn s).comp
      ((measurable_const (a := δ)).prodMk measurable_id) using 1
    rfl
  change (∫ω,terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)
    ∂boardClockMeasure n (cfg.B/n))≤_
  apply integral_mono
  · exact GenericCreditIteration.bounded_nonnegative_integrable _ _ hf _
      (fun ω=>terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK (ω,s.val.1.val.2-δ))
  · exact GenericCreditIteration.bounded_nonnegative_integrable _ _ hg _
      (cutHierarchySource_bounds cfg ε M start e C D L hn s hm δ δ.coe_nonneg)
  · exact terminalCalendarSource_le_cutHierarchySource cfg ε M start δ δ.coe_nonneg e C D L hn s hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutMixedMean_measurable
#print axioms NoThreeLine.BirthWitness.calendarMeanSource_le_cutMixedMean
