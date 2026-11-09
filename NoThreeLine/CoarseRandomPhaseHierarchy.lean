import NoThreeLine.PhaseKernelProduct
import NoThreeLine.SourceCutVolterra

/-! Average the actual coarse-price Volterra hierarchy over arbitrary
inherited laws. The full max(1,a1(K))^|Gamma| price is retained; no separation
of the root or witness labels is assumed. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness

def phaseCoarseCoefficient {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n) (q : Grid n) (t : ℝ) : ℝ :=
  (cfg.mask q*e.value q (start+t)/n)*max 1 (AuxiliaryODE.protection 1 cfg.K)^cfg.directions.card

theorem phaseCoarseCoefficient_measurable {n : ℕ} (cfg : FlowConfig n) (start : ℝ) (e : Retention n) (q : Grid n) :
    Measurable (phaseCoarseCoefficient cfg start e q) :=
  ((((e.measurable_value q).comp (measurable_const.add measurable_id)).const_mul (cfg.mask q)).div_const n).mul_const _

theorem goodPhaseStart_coarseCoefficient {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (s : GoodPhaseObservation n cfg.B) (q : Grid n) (t : ℝ) :
    elapsedSourceCoefficient cfg start e (goodPhaseStart cfg ε M s) q t=phaseCoarseCoefficient cfg start e q t := by
  change (cfg.mask q*e.value q (observationTime cfg start (observedPhaseStart cfg ε M s.val).1+t)/n)*_= _
  rw [observedPhaseStart_time]
  rfl

theorem phaseCoarseHierarchy_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) :
    Measurable (fun x : GoodPhaseObservation n cfg.B×ℝ=>
      elapsedHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2) := by
  simp only [elapsedHierarchyMean,goodPhaseStart_coarseCoefficient]
  exact Finset.measurable_sum _ (fun q _=>((phaseCoarseCoefficient_measurable cfg start e q).comp measurable_snd).mul
    (phaseKernelMixedMean_joint_integrand cfg ε M start e (insert q C) (D.erase q) L hn hB))

theorem phaseCoarseHierarchy_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (t : ℝ) :
    (∫s,elapsedHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M s) t ∂μ)=
      ∑q∈D,phaseCoarseCoefficient cfg start e q t*phaseKernelMixedMean cfg ε M start e (insert q C) (D.erase q) L hn μ t := by
  simp only [elapsedHierarchyMean,goodPhaseStart_coarseCoefficient]
  rw [integral_finsetSum _ (fun q _=>
    (phaseKernelMixedMean_integrable cfg ε M start e (insert q C) (D.erase q) L hn hB μ t).const_mul _)]
  simp only [integral_const_mul,phaseKernelMixedMean]

theorem phaseKernelMixedMean_coarse_volterra {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D)
    (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] (t : ℝ) (ht : t∈Icc (0:ℝ) cfg.horizon) :
    phaseKernelMixedMean cfg ε M start e C D L hn μ t≤
      (∫s,goodPhaseMixed cfg.directions e C D L s ∂μ)+
        ∫u in (0:ℝ)..t,∑q∈D,phaseCoarseCoefficient cfg start e q u*
          phaseKernelMixedMean cfg ε M start e (insert q C) (D.erase q) L hn μ u := by
  let f : GoodPhaseObservation n cfg.B×ℝ→ℝ := fun x=>
    elapsedHierarchyMean cfg ε M start e C D L hn (goodPhaseStart cfg ε M x.1) x.2
  have hf : Measurable f := phaseCoarseHierarchy_joint_measurable cfg ε M start e C D L hn hB
  have hb (x) : 0≤f x ∧ f x≤sourceCap cfg.directions C D cfg.B cfg.K :=
    elapsedHierarchyMean_bounds cfg ε M start e C D L hn hB (goodPhaseStart cfg ε M x.1) hm x.2
  have hi : Integrable f (μ.prod (volume.restrict (Ioo 0 t))) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (sourceCap cfg.directions C D cfg.B cfg.K) hb
  have htint : Integrable (fun s=>∫u in (0:ℝ)..t,f (s,u)) μ := by
    simp_rw [intervalIntegral.integral_of_le ht.1,integral_Ioc_eq_integral_Ioo]
    exact hi.integral_prod_left
  have hz : Integrable (goodPhaseMixed cfg.directions e C D L) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (goodPhaseMixed_measurable _ e C D L)
      (mixedCap C cfg.B) (goodPhaseMixed_bounds _ e C D L)
  have hh := integral_mono (phaseKernelMixedMean_integrable cfg ε M start e C D L hn hB μ t)
    (hz.add htint) (fun s=>elapsedMixedMean_volterra cfg ε M start e C D L hn hB hm hK hCL hCD
      (goodPhaseStart cfg ε M s) t ht)
  simp only [Pi.add_apply] at hh
  rw [integral_add hz htint,CalendarIntegral.expected_interval_integral_swap μ t ht.1 f hf _ hb] at hh
  simpa only [phaseKernelMixedMean,f,phaseCoarseHierarchy_mean cfg ε M start e C D L hn hB μ] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseKernelMixedMean_coarse_volterra
