import NoThreeLine.WeightedRunningIntegralSigned
import NoThreeLine.ProtectedEntropyFirstMean
import NoThreeLine.ProtectedFirstSurvival
import Mathlib.Analysis.Normed.Group.Bounded

/-! Exact first-step compensation by the real signed entropy source
accumulated to the actual capped candidate time. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedRunningEntropySource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  if s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1),
      protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B

theorem protectedRunningEntropySource_section_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (p : Grid n) (s : ProtectedTimedState cfg) (hB : 0<cfg.B) :
    Measurable (protectedRunningEntropySource cfg ε M L p s) := by
  unfold protectedRunningEntropySource
  split_ifs
  · exact measurable_const
  · exact variable_running_integral_measurable _
      ((augAdvance_measurable cfg ε M).comp (measurable_const.prodMk measurable_fst.fst))
      (fun z=>(augAdvance_mem cfg ε M _ s.1.property.1.1 z.1.1).1) _
      ((selectedProtectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L s.2 p hB).measurable.comp measurable_snd)

theorem protectedRunningEntropySource_firstForbidden_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K) :
    (∫ω,protectedRunningEntropySource cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedFirstEntropySource cfg ε M L p s := by
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedRunningEntropySource,protectedFirstEntropySource,if_pos hd,integral_zero]
  · let ν := boardClockMeasure n (cfg.B/n)
    letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
    let T := augGuardTime cfg ε M (augTimedInput cfg s.1)
    let wait := fun ω=>(WinnerMarkLaw.firstMarkedRace hn ω).1.1
    let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
    let S := fun u=>protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2 cfg.directions cfg.mask L p cfg.B
    have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
    have hS : Continuous S := selectedProtectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L s.2 p hB
    obtain ⟨C,hC⟩ := isCompact_Icc.exists_bound_of_continuousOn (s:=Icc (0:ℝ) T) hS.continuousOn
    have hC0 : 0≤C := (norm_nonneg (S 0)).trans (hC 0 ⟨le_rfl,hT.1⟩)
    have hF := savedCreditMeasure_running_integral_signed ν T hT.1 wait Z S
      (WinnerMarkLaw.firstMarkedRace_measurable hn).fst.fst
      (firstLineLikelihood_measurable cfg ε M L hn s.1) hS.measurable
      ((2/(2-K))^2) C (sq_nonneg _) hC0
      (fun ω=>augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _)
      (fun u hu=>hC u ⟨hu.1.le,hu.2.le⟩)
    simp only [protectedRunningEntropySource,protectedFirstEntropySource,if_neg hd]
    change (∫ω,(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u) ∂savedCreditMeasure ν Z)=_
    rw [hF]
    apply intervalIntegral.integral_congr
    intro u hu
    rw [uIcc_of_le hT.1] at hu
    have hs := augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk hd u hu.1 hu.2
    change (∫ω,(if u<wait ω then Z ω else 0) ∂ν)*S u=_
    rw [hs]

theorem protectedRunningEntropySource_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K) :
    Integrable (fun ω=>protectedRunningEntropySource cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  let T := augGuardTime cfg ε M (augTimedInput cfg s.1)
  let S := fun u=>protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2 cfg.directions cfg.mask L p cfg.B
  have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
  have hS : Continuous S := selectedProtectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L s.2 p hB
  obtain ⟨C,hC⟩ := isCompact_Icc.exists_bound_of_continuousOn (s:=Icc (0:ℝ) T) hS.continuousOn
  have hC0 : 0≤C := (norm_nonneg (S 0)).trans (hC 0 ⟨le_rfl,hT.1⟩)
  have hmS := (protectedRunningEntropySource_section_measurable cfg ε M L p s hB).comp
    (WinnerMarkLaw.firstMarkedRace_measurable hn)
  apply (integrable_const (C*T)).mono' hmS.aestronglyMeasurable
  refine ae_of_all _ (fun ω=>?_)
  unfold protectedRunningEntropySource
  split_ifs
  · simpa only [Function.comp_apply,norm_zero] using mul_nonneg hC0 hT.1
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1
      (WinnerMarkLaw.firstMarkedRace hn ω).1.1
    have hb := intervalIntegral.norm_integral_le_of_norm_le_const (f:=S) (a:=0)
      (b:=augAdvance cfg ε M (augTimedInput cfg s.1,(WinnerMarkLaw.firstMarkedRace hn ω).1.1))
      (fun u hu=>by rw [uIoc_of_le ha.1] at hu; exact hC u ⟨hu.1.le,hu.2.trans ha.2⟩)
    simp only [sub_zero,abs_of_nonneg ha.1] at hb
    exact hb.trans (mul_le_mul_of_nonneg_left ha.2 hC0)

theorem protectedEntropy_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1))
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
  let f := fun ω=>protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((protectedTimedWeightedEntropy_measurable cfg ε M L p s).comp (WinnerMarkLaw.firstMarkedRace_measurable hn))
      ((2/(2-K))^2*(2*cfg.B)) (fun ω=>protectedTimedWeightedEntropy_bounds cfg ε M K hKcfg hK L hsp hB p s hN hk hsv _)
  change Integrable f (ν.withDensity (fun ω=>ENNReal.ofReal (Z ω)))
  rw [integrable_withDensity_iff_integrable_smul'
    (firstLineLikelihood_measurable cfg ε M L hn s.1).ennreal_ofReal
    (ae_of_all _ (fun _=>ENNReal.ofReal_lt_top))]
  simpa only [ENNReal.toReal_ofReal (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1,
    smul_eq_mul] using hi

theorem protected_entropy_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)-
      protectedRunningEntropySource cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedEntropy cfg.B (protectedTimedCredit cfg L p s) := by
  rw [integral_sub
    (protectedEntropy_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk hsv)
    (protectedRunningEntropySource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk),
    firstLineForbiddenLaw_protectedEntropy_mean cfg ε M K hKcfg hK L hsp p hpL hn hB hm s hN hk hsv,
    protectedRunningEntropySource_firstForbidden_mean cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk]
  ring

end NoThreeLine
#print axioms NoThreeLine.protectedRunningEntropySource_firstForbidden_mean
#print axioms NoThreeLine.protected_entropy_first_compensation
