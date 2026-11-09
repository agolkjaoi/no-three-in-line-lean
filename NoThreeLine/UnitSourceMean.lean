import NoThreeLine.UnitSourcePointwise
import NoThreeLine.SourceCutVolterra

/-! Expected unit-price source and its elapsed-time coefficients. -/
set_option autoImplicit false
set_option maxHeartbeats 400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness

theorem unitCutSource_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) (δ : ℝ≥0) :
    (∫ω,unitCutSource cfg ε M start e C D L hn s δ δ.coe_nonneg ω ∂boardClockMeasure n (cfg.B/n))=
      ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*
        cutMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s δ := by
  unfold unitCutSource
  rw [integral_finsetSum _ (fun q _=>
    (cutMixed_integrable cfg ε M start e (insert q C) (D.erase q) L hn hB s δ).const_mul _)]
  simp only [integral_const_mul,cutMixedMean]

theorem calendarMeanSource_le_unitCutMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCD : Disjoint C D) (hsep : SeparatedLabels cfg.directions (C∪D)) (δ : ℝ≥0) :
    calendarMeanSource cfg ε M start e C D L hn s (s.val.1.val.2-δ)≤
      ∑q∈D,(cfg.mask q*e.value q (start+cfg.horizon-δ)/n)*
        cutMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s δ := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [←unitCutSource_mean cfg ε M start e C D L hn hB s δ]
  have hf : Measurable (fun ω : BoardClockPath n=>
      terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)) := by
    convert (terminalCalendarSource_measurable cfg ε M start e C D L hn s).comp
      (measurable_id.prodMk (measurable_const (a := s.val.1.val.2-(δ:ℝ)))) using 1
    rfl
  have hg : Measurable (fun ω : BoardClockPath n=>unitCutSource cfg ε M start e C D L hn s δ δ.coe_nonneg ω) := by
    convert (unitCutSource_joint_measurable cfg ε M start e C D L hn s).comp
      ((measurable_const (a := δ)).prodMk measurable_id) using 1
    rfl
  change (∫ω,terminalCalendarSource cfg ε M start e C D L hn s (ω,s.val.1.val.2-δ)
    ∂boardClockMeasure n (cfg.B/n))≤_
  exact integral_mono
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf _
      (fun ω=>terminalCalendarSource_bounds cfg ε M start e C D L hn s hm hK (ω,s.val.1.val.2-δ)))
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hg _
      (unitCutSource_bounds cfg ε M start e C D L hn s hm δ δ.coe_nonneg))
    (terminalCalendarSource_le_unitCutSource cfg ε M start δ δ.coe_nonneg e C D L hn s hm hCD hsep)

def unitSourceCoefficient {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (q : Grid n) (t : ℝ) : ℝ :=
  cfg.mask q*e.value q (observationTime cfg start s.val.1+t)/n

theorem unitSourceCoefficient_measurable {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (q : Grid n) : Measurable (unitSourceCoefficient cfg start e s q) :=
  (((e.measurable_value q).comp (measurable_const.add measurable_id)).const_mul (cfg.mask q)).div_const n

theorem unitSourceCoefficient_bounds {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n)
    (s : GoodObservation cfg) (hm : ∀q,cfg.mask q≤1) (q : Grid n) (t : ℝ) :
    0≤unitSourceCoefficient cfg start e s q t ∧ unitSourceCoefficient cfg start e s q t≤1/n := by
  constructor
  · exact div_nonneg (mul_nonneg (cfg.mask_nonneg q) (e.bounds q _).1) (Nat.cast_nonneg n)
  · apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    nlinarith [cfg.mask_nonneg q,hm q,(e.bounds q (observationTime cfg start s.val.1+t)).1,
      (e.bounds q (observationTime cfg start s.val.1+t)).2]

def unitHierarchyMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (t : ℝ) : ℝ :=
  ∑q∈D,unitSourceCoefficient cfg start e s q t*
    elapsedMixedMean cfg ε M start e (insert q C) (D.erase q) L hn s t

theorem unitHierarchyMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    Measurable (unitHierarchyMean cfg ε M start e C D L hn s) :=
  Finset.measurable_sum _ (fun q _=>(unitSourceCoefficient_measurable cfg start e s q).mul
    (elapsedMixedMean_measurable cfg ε M start e (insert q C) (D.erase q) L hn hB s))

theorem unitHierarchyMean_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (t : ℝ) :
    0≤unitHierarchyMean cfg ε M start e C D L hn s t ∧
      unitHierarchyMean cfg ε M start e C D L hn s t≤unitSourceCap C D cfg.B := by
  constructor
  · exact Finset.sum_nonneg (fun q _=>mul_nonneg (unitSourceCoefficient_bounds cfg start e s hm q t).1
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).1)
  · exact Finset.sum_le_sum (fun q _=>mul_le_mul (unitSourceCoefficient_bounds cfg start e s hm q t).2
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).2
      (elapsedMixedMean_bounds cfg ε M start e (insert q C) (D.erase q) L hn hB s t).1
      (div_nonneg zero_le_one (Nat.cast_nonneg n)))

theorem unitHierarchyMean_intervalIntegrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg)
    (hm : ∀q,cfg.mask q≤1) (a b : ℝ) :
    IntervalIntegrable (unitHierarchyMean cfg ε M start e C D L hn s) volume a b := by
  rw [intervalIntegrable_iff,uIoc]
  exact integrableOn_of_nonneg_bound volume (Ioc (min a b) (max a b)) measurableSet_Ioc _
    (unitHierarchyMean_measurable cfg ε M start e C D L hn hB s) _
    (fun t _=>unitHierarchyMean_bounds cfg ε M start e C D L hn hB s hm t)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.calendarMeanSource_le_unitCutMean
#print axioms NoThreeLine.BirthWitness.unitHierarchyMean_intervalIntegrable
