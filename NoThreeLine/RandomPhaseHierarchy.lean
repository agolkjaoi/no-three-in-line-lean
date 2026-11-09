import NoThreeLine.SourceStateCutMeasurable
import NoThreeLine.UnitSourceVolterra

/-! Integrate the actual one-phase cut hierarchy against an arbitrary
probability law of inherited valid observations. The one-phase Volterra
estimate is proved by the process, not assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness

def phaseKernelMixedMean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (μ : Measure (GoodPhaseObservation n cfg.B)) (t : ℝ) : ℝ :=
  ∫s,elapsedMixedMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t ∂μ

theorem phaseKernelMixedMean_joint_integrand {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) :
    Measurable (fun x : GoodPhaseObservation n cfg.B×ℝ=>
      elapsedMixedMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2) := by
  have hf : Measurable (fun x : GoodPhaseObservation n cfg.B×ℝ=>(goodPhaseStart cfg ε M x.1,x.2)) :=
    ((goodPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd
  convert (elapsedMixedMean_state_joint_measurable cfg ε M start e C D L hn hB).comp hf using 1
  rfl

theorem phaseKernelMixedMean_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] :
    Measurable (phaseKernelMixedMean cfg ε M start e C D L hn μ) :=
  ((phaseKernelMixedMean_joint_integrand cfg ε M start e C D L hn hB).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem phaseKernelMixedMean_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (t : ℝ) :
    Integrable (fun s=>elapsedMixedMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t) μ := by
  have hf : Measurable (fun s : GoodPhaseObservation n cfg.B=>
      elapsedMixedMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t) := by
    convert (phaseKernelMixedMean_joint_integrand cfg ε M start e C D L hn hB).comp
      (measurable_id.prodMk (measurable_const (a:=t))) using 1
    rfl
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    (mixedCap C cfg.B) (fun s=>elapsedMixedMean_bounds cfg ε M start e C D L hn hB (goodPhaseStart cfg ε M s) t)

def phaseUnitCoefficient {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n) (q : Grid n) (t : ℝ) : ℝ :=
  cfg.mask q*e.value q (start+t)/n

theorem phaseUnitCoefficient_measurable {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n) (q : Grid n) :
    Measurable (phaseUnitCoefficient cfg start e q) :=
  (((e.measurable_value q).comp (measurable_const.add measurable_id)).const_mul (cfg.mask q)).div_const n

theorem goodPhaseStart_unitCoefficient {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (s : GoodPhaseObservation n cfg.B) (q : Grid n) (t : ℝ) :
    unitSourceCoefficient cfg start e (goodPhaseStart cfg ε M s) q t=phaseUnitCoefficient cfg start e q t := by
  change cfg.mask q*e.value q (observationTime cfg start (observedPhaseStart cfg ε M s.val).1+t)/n=_
  rw [observedPhaseStart_time]
  rfl

theorem phaseUnitHierarchy_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) :
    Measurable (fun x : GoodPhaseObservation n cfg.B×ℝ=>
      unitHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2) := by
  simp only [unitHierarchyMean,goodPhaseStart_unitCoefficient]
  exact Finset.measurable_sum _ (fun q _=>((phaseUnitCoefficient_measurable cfg start e q).comp measurable_snd).mul
    (phaseKernelMixedMean_joint_integrand cfg ε M start e (insert q C) (D.erase q) L hn hB))

theorem phaseUnitHierarchy_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (t : ℝ) :
    (∫s,unitHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t ∂μ)=
      ∑q∈D,phaseUnitCoefficient cfg start e q t*phaseKernelMixedMean cfg ε M start e (insert q C) (D.erase q) L hn μ t := by
  simp only [unitHierarchyMean,goodPhaseStart_unitCoefficient]
  rw [integral_finsetSum _ (fun q _=>
    (phaseKernelMixedMean_integrable cfg ε M start e (insert q C) (D.erase q) L hn hB μ t).const_mul _)]
  simp only [integral_const_mul,phaseKernelMixedMean]

theorem phaseKernelMixedMean_unit_volterra {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (hsep : SeparatedLabels cfg.directions (C∪D))
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    phaseKernelMixedMean cfg ε M start e C D L hn μ t≤
      (∫s,goodPhaseMixed cfg.directions e C D L s ∂μ)+
        ∫u in (0:ℝ)..t,∑q∈D,phaseUnitCoefficient cfg start e q u*
          phaseKernelMixedMean cfg ε M start e (insert q C) (D.erase q) L hn μ u := by
  let f : GoodPhaseObservation n cfg.B×ℝ→ℝ := fun x=>
    unitHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2
  have hf : Measurable f := phaseUnitHierarchy_joint_measurable cfg ε M start e C D L hn hB
  have hb (x) : 0≤f x ∧ f x≤unitSourceCap C D cfg.B :=
    unitHierarchyMean_bounds cfg ε M start e C D L hn hB (goodPhaseStart cfg ε M x.1) hm x.2
  have hi : Integrable f (μ.prod (volume.restrict (Ioo 0 t))) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (unitSourceCap C D cfg.B) hb
  have htint : Integrable (fun s=>∫u in (0:ℝ)..t,f (s,u)) μ := by
    simp_rw [intervalIntegral.integral_of_le ht.1,integral_Ioc_eq_integral_Ioo]
    exact hi.integral_prod_left
  have hz : Integrable (goodPhaseMixed cfg.directions e C D L) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (goodPhaseMixed_measurable _ e C D L)
      (mixedCap C cfg.B) (goodPhaseMixed_bounds _ e C D L)
  have hh := integral_mono (phaseKernelMixedMean_integrable cfg ε M start e C D L hn hB μ t)
    (hz.add htint) (fun s=>elapsedMixedMean_unit_volterra cfg ε M start e C D L hn hB hm hK hCL hCD hsep
      (goodPhaseStart cfg ε M s) t ht)
  simp only [Pi.add_apply] at hh
  rw [integral_add hz htint,CalendarIntegral.expected_interval_integral_swap μ t ht.1 f hf _ hb] at hh
  simpa only [phaseKernelMixedMean,f,phaseUnitHierarchy_mean cfg ε M start e C D L hn hB μ] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseKernelMixedMean_unit_volterra
