import NoThreeLine.WitnessSourceRegularity
import NoThreeLine.ExponentialGeneratorIntegral

/-! Actual selected-flow S7 first-event bound. Retention is measurable,
evaluated at the absolute time start+t. All candidate/source integrability
and the generator inequality are supplied by the actual state definitions.
This statement precedes boundary resolution and history iteration. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def clippedWitnessCurve {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (T : ℝ≥0) (t : ℝ) : WitnessState n :=
  selectedWitnessCurve cfg x b (timeClip T t)

def selectedCandidateMean {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0) (t : ℝ) : ℝ :=
  candidateMixedMean (clippedWitnessCurve cfg x b T t) cfg.directions C D L cfg.mask
    (fun q=>e.value q (start+t)) cfg.B

def selectedSourceSum {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start t : ℝ) : ℝ :=
  sourceSum (selectedWitnessCurve cfg x b t) cfg.directions C D L cfg.mask (fun q=>e.value q (start+t))

theorem selectedSourceSum_measurable {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) :
    Measurable (selectedSourceSum cfg x b C D L e start) :=
  sourceSum_measurable _ (selectedWitnessCurve_measurable cfg x b) _
    (measurable_pi_lambda _ (fun q=>(e.measurable_value q).comp (measurable_const.add measurable_id)))
    cfg.directions C D L cfg.mask

theorem selected_first_step_source_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫t,(if t≤T then selectedCandidateMean cfg x b C D L e start T t
      else mixed cfg.directions C D L (selectedWitnessCurve cfg x b T)) ∂expMeasure ((n:ℝ)*cfg.B))≤
      mixed cfg.directions C D L (selectedWitnessCurve cfg x b 0)+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedSourceSum cfg x b C D L e start t := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hrate : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hrate
  let z := fun t=>mixed cfg.directions C D L (selectedWitnessCurve cfg x b t)
  let v := fun t=>continuousDrift (selectedWitnessCurve cfg x b t) cfg.directions C D L cfg.mask
  let J := selectedCandidateMean cfg x b C D L e start T
  let S := selectedSourceSum cfg x b C D L e start
  have hav (t : ℝ) : (clippedWitnessCurve cfg x b T t).Valid cfg.B := by
    have ht := timeClip_mem T t
    exact selectedWitnessCurve_valid cfg x b ha _ ⟨ht.1,ht.2.trans hT⟩
  have hJm : Measurable J := candidateMixedMean_measurable _
    ((selectedWitnessCurve_measurable cfg x b).comp (timeClip_continuous T).measurable) _
    (measurable_pi_lambda _ (fun q=>(e.measurable_value q).comp (measurable_const.add measurable_id)))
    cfg.directions C D L cfg.mask cfg.B hB hav (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
  have hJb (t : ℝ) : 0≤J t ∧ J t≤mixedCap C cfg.B := candidateMixedMean_bounds _
    cfg.directions C D L cfg.mask _ cfg.B hn hB (hav t) (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (fun q=>e.bounds q (start+t))
  have hJE : IntegrableOn J (Ioc 0 T) (expMeasure rate) :=
    (GenericCreditIteration.bounded_nonnegative_integrable _ J hJm _ hJb).integrableOn
  have hJV : IntervalIntegrable J volume 0 T :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le T.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume (Ioc (0:ℝ) T) measurableSet_Ioc J hJm _ (fun t _=>hJb t))
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume 0 T :=
    hJV.continuousOn_mul (by fun_prop)
  have hSm : Measurable S := selectedSourceSum_measurable cfg x b C D L e start
  have hSb (t : ℝ) (ht : t∈Ioo (0:ℝ) T) :
      0≤S t ∧ S t≤sourceCap cfg.directions C D cfg.B cfg.K := by
    apply sourceSum_bounds _ cfg.directions C D L cfg.mask _ cfg.B cfg.K
      (selectedWitnessCurve_valid cfg x b ha t ⟨ht.1.le,ht.2.le.trans hT⟩)
      (fun q=>⟨cfg.mask_nonneg q,hm q⟩) (fun q=>e.bounds q (start+t)) hK
    intro q _ K hshared hsp
    exact (shared_clock_selected_lt cfg x.1 C q ha.1.1 hstop hC t
      ⟨ht.1.le,ht.2.trans_le hT⟩ K hshared hsp).le
  have hSV : IntervalIntegrable S volume 0 T :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le T.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) T) measurableSet_Ioo S hSm _ hSb)
  have hSW : IntervalIntegrable (fun t=>Real.exp (-(rate*t))*S t) volume 0 T :=
    hSV.continuousOn_mul (by fun_prop)
  have hz : ContinuousOn z (Icc (0:ℝ) T) := (selectedMixed_continuous cfg x b C D L).continuousOn
  have hv : ContinuousOn v (Icc (0:ℝ) T) := (selectedContinuousDrift_continuous cfg x b C D L).continuousOn
  have hd : ∀t∈Ioo (0:ℝ) T,HasDerivAt z (v t) t := by
    intro t ht
    exact selectedMixed_hasDerivAt cfg x b C D L ha.1.1 t ⟨ht.1,ht.2.trans_le hT⟩
  change (∫t,(if t≤T then J t else z T) ∂expMeasure rate)≤z 0+_
  rw [expMeasure_first_step_generator rate T hrate T.coe_nonneg z v J hz hv hd hJE hJW]
  apply add_le_add le_rfl
  apply intervalIntegral.integral_mono_on_of_le_Ioo T.coe_nonneg
    (exponential_generator_intervalIntegrable rate T T.coe_nonneg z v J hz hv hJW) hSW
  intro t ht
  apply mul_le_mul_of_nonneg_left _ (Real.exp_pos _).le
  have heq : clippedWitnessCurve cfg x b T t=selectedWitnessCurve cfg x b t := by
    simp only [clippedWitnessCurve,timeClip_eq T t ⟨ht.1.le,ht.2.le⟩]
  change continuousDrift _ _ _ _ _ _+rate*(candidateMixedMean _ _ _ _ _ _ _ _-mixed _ _ _ _ _)≤_
  rw [heq,candidateMixedMean_generator _ cfg.directions C D L cfg.mask _ cfg.B hn hB
    (selectedWitnessCurve_valid cfg x b ha t ⟨ht.1.le,ht.2.le.trans hT⟩) (fun q=>⟨cfg.mask_nonneg q,hm q⟩)]
  exact selectedGenerator_le_s7 cfg x b C D L (fun q=>e.value q (start+t)) ha hstop hC hCL hCD
    (fun q _=>(e.bounds q (start+t)).1) hE hK t ⟨ht.1,ht.2.trans_le hT⟩

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.selected_first_step_source_bound
