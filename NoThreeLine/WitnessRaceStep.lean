import NoThreeLine.WitnessExponentialStep
import NoThreeLine.WinnerMarkIntegral

/-! Evaluate the S7 first-event observable on the actual original-board
firstMarkedRace. The proved joint law supplies time, label, and mark;
no exponential/uniform independence assumption is added here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped BigOperators NNReal

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines EtaMixedGenerator

def firstWitnessSnapshot {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (e : Retention n) (start : ℝ) (T : ℝ≥0) (z : CandidateData n) : WitnessState n :=
  if z.1.1≤T then thinnedWitness (clippedWitnessCurve cfg x b T z.1.1) cfg.directions cfg.mask cfg.B
    z.1.2 (fun q=>e.value q (start+z.1.1)) z.2
  else selectedWitnessCurve cfg x b T

theorem firstWitnessSnapshot_measurable {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (e : Retention n) (start : ℝ) (T : ℝ≥0) :
    Measurable (firstWitnessSnapshot cfg x b e start T) := by
  have hp : Measurable (fun z : CandidateData n=>clippedWitnessCurve cfg x b T z.1.1) :=
    (selectedWitnessCurve_measurable cfg x b).comp ((timeClip_continuous T).measurable.comp measurable_fst.fst)
  have hr : Measurable (fun z : CandidateData n=>fun q=>e.value q (start+z.1.1)) :=
    measurable_pi_lambda _ (fun q=>(e.measurable_value q).comp (measurable_const.add measurable_fst.fst))
  have hb0 : Measurable (fun z : (WitnessState n×(Grid n→ℝ))×Grid n=>z.1.1.birth cfg.directions z.2 z.1.2) :=
    measurable_from_prod_countable_left (fun q=>WitnessState.birth_measurable cfg.directions q)
  have hb : Measurable (fun z : CandidateData n=>(clippedWitnessCurve cfg x b T z.1.1).birth cfg.directions
      z.1.2 (fun q=>e.value q (start+z.1.1))) :=
    hb0.comp ((hp.prodMk hr).prodMk measurable_fst.snd)
  have hα0 : Measurable (fun z : ProcessState n×Grid n=>z.1.acceptance cfg.mask cfg.B z.2) :=
    measurable_from_prod_countable_left (fun q=>ProcessState.measurable_acceptance cfg.mask cfg.B q)
  have hα : Measurable (fun z : CandidateData n=>(clippedWitnessCurve cfg x b T z.1.1).augmented.physical.process.acceptance
      cfg.mask cfg.B z.1.2) :=
    hα0.comp
      (((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        ((WitnessState.measurable_augmented n).comp hp))).prodMk measurable_fst.snd)
  exact Measurable.ite (measurableSet_le measurable_fst.fst measurable_const)
    (Measurable.ite (measurableSet_le measurable_snd hα) hb hp) measurable_const

theorem firstWitnessSnapshot_valid {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (e : Retention n) (start : ℝ) (T : ℝ≥0)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1) (z : CandidateData n) :
    (firstWitnessSnapshot cfg x b e start T z).Valid cfg.B := by
  have hv : (clippedWitnessCurve cfg x b T z.1.1).Valid cfg.B :=
    selectedWitnessCurve_valid cfg x b ha _ ⟨(timeClip_mem T _).1,(timeClip_mem T _).2.trans hT⟩
  unfold firstWitnessSnapshot thinnedWitness
  split_ifs
  · exact WitnessState.birth_valid _ cfg.B hv _ _ _ (e.bounds _ _)
  · exact hv
  · exact selectedWitnessCurve_valid cfg x b ha T ⟨T.coe_nonneg,hT⟩

theorem firstWitnessSnapshot_mean {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0)
    (hn : 0<n) (t : ℝ) :
    (∑q : Grid n,∫mark,mixed cfg.directions C D L (firstWitnessSnapshot cfg x b e start T ((t,q),mark)) ∂markMeasure)/(n:ℝ)^2=
      if t≤T then selectedCandidateMean cfg x b C D L e start T t
      else mixed cfg.directions C D L (selectedWitnessCurve cfg x b T) := by
  by_cases ht : t≤T
  · simp only [firstWitnessSnapshot,if_pos ht]
    rfl
  · simp only [firstWitnessSnapshot,if_neg ht,integral_const,probReal_univ,one_smul,
      Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul,Nat.cast_mul]
    have hnr : (n:ℝ)≠0 := by exact_mod_cast Nat.ne_of_gt hn
    field_simp

theorem actual_first_witness_source_bound {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start : ℝ) (T : ℝ≥0)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (ha : WitnessState.Valid ⟨⟨x.1.val,x.2⟩,b⟩ cfg.B)
    (hT : (T:ℝ)≤selectedGuardTime cfg x.1)
    (hstop : x.1.val.process.stopped=false) (hC : C⊆x.1.val.process.activeEvents)
    (hCL : C⊆L) (hCD : Disjoint C D) (hE : EmptyLineCredit x.1.val) (hK : cfg.K<2) :
    (∫ω,mixed cfg.directions C D L (firstWitnessSnapshot cfg x b e start T (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂boardClockMeasure n (cfg.B/n))≤
      mixed cfg.directions C D L (selectedWitnessCurve cfg x b 0)+
        ∫t in (0:ℝ)..T,Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedSourceSum cfg x b C D L e start t := by
  letI := isProbabilityMeasure_expMeasure (mul_pos (show (0:ℝ)<n by exact_mod_cast hn) hB)
  have hF := mixed_integrable (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
    (firstWitnessSnapshot cfg x b e start T) (firstWitnessSnapshot_measurable cfg x b e start T)
    cfg.directions C D L cfg.B (firstWitnessSnapshot_valid cfg x b e start T ha hT)
  rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hF]
  simp_rw [firstWitnessSnapshot_mean cfg x b C D L e start T hn]
  exact selected_first_step_source_bound cfg x b C D L e start T hn hB hm ha hT hstop hC hCL hCD hE hK

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.firstWitnessSnapshot_measurable
#print axioms NoThreeLine.BirthWitness.actual_first_witness_source_bound
