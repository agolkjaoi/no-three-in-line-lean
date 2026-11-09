import NoThreeLine.ExponentialSurvivalGenerator
import NoThreeLine.WitnessRaceStep

/-! D-empty actual mixed observable, restricted to survival beyond u.
The eta product and all active-root/leaf indicators remain in mixed. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

theorem selected_survival_source_free_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0) (u : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1) (hu : 0≤u) (huT : u≤T)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫t in Ioi u,(if t≤T then selectedCandidateMean cfg x b C ∅ L e start T t
      else mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b T)) ∂expMeasure ((n:ℝ)*cfg.B))≤
      Real.exp (-(((n:ℝ)*cfg.B)*u))*mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b u) := by
  let rate : ℝ := (n:ℝ)*cfg.B
  have hr : 0<rate := mul_pos (by exact_mod_cast hn) hB
  letI := isProbabilityMeasure_expMeasure hr
  let z := fun t=>mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b t)
  let v := fun t=>continuousDrift (selectedWitnessCurve cfg x b t) cfg.directions C ∅ L cfg.mask
  let J := selectedCandidateMean cfg x b C ∅ L e start T
  have hav (t : ℝ) : (clippedWitnessCurve cfg x b T t).Valid cfg.B :=
    selectedWitnessCurve_valid cfg x b ha _ ⟨(timeClip_mem T t).1,(timeClip_mem T t).2.trans hT⟩
  have hJm : Measurable J := candidateMixedMean_measurable _
    ((selectedWitnessCurve_measurable cfg x b).comp (timeClip_continuous T).measurable) _
    (measurable_pi_lambda _ (fun q=>(e.measurable_value q).comp (measurable_const.add measurable_id)))
    cfg.directions C ∅ L cfg.mask cfg.B hB hav (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
  have hJb (t : ℝ) : 0≤J t ∧ J t≤mixedCap C cfg.B := candidateMixedMean_bounds _
    cfg.directions C ∅ L cfg.mask _ cfg.B hn hB (hav t) (fun q=>⟨cfg.mask_nonneg q,hm q⟩)
    (fun q=>e.bounds q (start+t))
  have hJE : Integrable J (expMeasure rate) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ J hJm _ hJb
  have hJV : IntervalIntegrable J volume u T :=
    (intervalIntegrable_iff_integrableOn_Ioc_of_le huT).mpr
      (integrableOn_of_nonneg_bound volume (Ioc u T) measurableSet_Ioc J hJm _ (fun t _=>hJb t))
  have hJW : IntervalIntegrable (fun t=>rate*Real.exp (-(rate*t))*J t) volume u T :=
    hJV.continuousOn_mul (by fun_prop)
  apply expMeasure_survival_generator_nonpos rate u T hr hu huT z v J
    (selectedMixed_continuous cfg x b C ∅ L).continuousOn
    (selectedContinuousDrift_continuous cfg x b C ∅ L).continuousOn
    (fun t ht=>selectedMixed_hasDerivAt cfg x b C ∅ L ha.1.1 t ⟨hu.trans_lt ht.1,ht.2.trans_le hT⟩) hJE hJW
  intro t ht
  have heq : clippedWitnessCurve cfg x b T t=selectedWitnessCurve cfg x b t := by
    simp only [clippedWitnessCurve,timeClip_eq T t ⟨hu.trans ht.1.le,ht.2.le⟩]
  change continuousDrift _ _ _ _ _ _+rate*(candidateMixedMean _ _ _ _ _ _ _ _-mixed _ _ _ _ _)≤_
  rw [heq,candidateMixedMean_generator _ cfg.directions C ∅ L cfg.mask _ cfg.B hn hB
    (selectedWitnessCurve_valid cfg x b ha t ⟨hu.trans ht.1.le,ht.2.le.trans hT⟩)
    (fun q=>⟨cfg.mask_nonneg q,hm q⟩)]
  simpa only [sourceSum,Finset.sum_empty] using
    selectedGenerator_le_s7 cfg x b C ∅ L (fun q=>e.value q (start+t)) ha hstop hC hCL
      (Finset.disjoint_empty_right C) (fun q _=>(e.bounds q (start+t)).1) hE hK t
      ⟨hu.trans_lt ht.1,ht.2.trans_le hT⟩

theorem actual_survival_witness_source_free_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0) (u : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1) (hu : 0≤u) (huT : u≤T)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫ω in {ω | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1},
      mixed cfg.directions C ∅ L (firstWitnessSnapshot cfg x b e start T (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n))≤
      Real.exp (-(((n:ℝ)*cfg.B)*u))*mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b u) := by
  let rate : ℝ := (n:ℝ)*cfg.B
  letI := isProbabilityMeasure_expMeasure (mul_pos (show (0:ℝ)<n by exact_mod_cast hn) hB)
  let f := fun z : CandidateData n=>if u<z.1.1 then
    mixed cfg.directions C ∅ L (firstWitnessSnapshot cfg x b e start T z) else 0
  have hf : Measurable f := Measurable.ite (measurableSet_lt measurable_const measurable_fst.fst)
    ((mixed_measurable cfg.directions C ∅ L).comp (firstWitnessSnapshot_measurable cfg x b e start T)) measurable_const
  have hb (z : CandidateData n) : 0≤f z ∧ f z≤mixedCap C cfg.B := by
    dsimp only [f]
    split_ifs
    · exact ⟨mixed_nonneg _ cfg.directions C ∅ L cfg.B (firstWitnessSnapshot_valid cfg x b e start T ha hT z),
        mixed_le_cap _ cfg.directions C ∅ L cfg.B (firstWitnessSnapshot_valid cfg x b e start T ha hT z)⟩
    · exact ⟨le_rfl,mixedCap_nonneg C cfg.B⟩
  have hfi : Integrable f (((expMeasure rate).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ f hf _ hb
  have hmean (t : ℝ) : (∑q : Grid n,∫mark,f ((t,q),mark) ∂markMeasure)/(n:ℝ)^2=
      if u<t then (if t≤T then selectedCandidateMean cfg x b C ∅ L e start T t
        else mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b T)) else 0 := by
    by_cases h : u<t
    · simpa only [f,if_pos h] using firstWitnessSnapshot_mean cfg x b C ∅ L e start T hn t
    · simp only [f,if_neg h,integral_zero,Finset.sum_const_zero,zero_div]
  have hmeas : MeasurableSet {ω : BoardClockPath n | u<(WinnerMarkLaw.firstMarkedRace hn ω).1.1} :=
    measurableSet_lt measurable_const (WinnerMarkLaw.firstMarkedRace_measurable hn).fst.fst
  rw [←integral_indicator hmeas]
  change (∫ω,f (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))≤_
  rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB f hfi]
  simp_rw [hmean]
  change (∫t,(Ioi u).indicator (fun t=>if t≤T then selectedCandidateMean cfg x b C ∅ L e start T t
    else mixed cfg.directions C ∅ L (selectedWitnessCurve cfg x b T)) t ∂expMeasure rate)≤_
  rw [integral_indicator measurableSet_Ioi]
  exact selected_survival_source_free_bound cfg x b C L e start T u hn hB hm ha hT hu huT hstop hC hCL hE hK

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.selected_survival_source_free_bound
#print axioms NoThreeLine.BirthWitness.actual_survival_witness_source_free_bound
