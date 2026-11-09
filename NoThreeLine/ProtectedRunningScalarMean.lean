import NoThreeLine.ProtectedEntropyRunningMean

/-! Any fixed incoming continuous signed source accumulated to the actual
advance has its survival-weighted mean under the real first forbidden law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedRunningScalarSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (S : ℝ→ℝ) (z : CandidateData n) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augAdvance cfg ε M (augTimedInput cfg s,z.1.1),S t

def protectedFirstScalarSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (S : ℝ→ℝ) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augGuardTime cfg ε M (augTimedInput cfg s),
      Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L t*S t

theorem protectedRunningScalarSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (S : ℝ→ℝ) (hS : Continuous S) :
    Measurable (protectedRunningScalarSource cfg ε M s S) := by
  unfold protectedRunningScalarSource
  split_ifs
  · exact measurable_const
  · exact variable_running_integral_measurable _
      ((augAdvance_measurable cfg ε M).comp (measurable_const.prodMk measurable_fst.fst))
      (fun z=>(augAdvance_mem cfg ε M _ s.property.1.1 z.1.1).1) _
      (hS.measurable.comp measurable_snd)

theorem protectedRunningScalarSource_firstForbidden_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (S : ℝ→ℝ) (hS : Continuous S)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    (∫ω,protectedRunningScalarSource cfg ε M s S (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s)=protectedFirstScalarSource cfg ε M L s S := by
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [protectedRunningScalarSource,protectedFirstScalarSource,if_pos hd,integral_zero]
  · let ν := boardClockMeasure n (cfg.B/n)
    letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
    let T := augGuardTime cfg ε M (augTimedInput cfg s)
    let wait := fun ω=>(WinnerMarkLaw.firstMarkedRace hn ω).1.1
    let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)
    have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
    obtain ⟨C,hC⟩ := isCompact_Icc.exists_bound_of_continuousOn (s:=Icc (0:ℝ) T) hS.continuousOn
    have hC0 : 0≤C := (norm_nonneg (S 0)).trans (hC 0 ⟨le_rfl,hT.1⟩)
    have hF := savedCreditMeasure_running_integral_signed ν T hT.1 wait Z S
      (WinnerMarkLaw.firstMarkedRace_measurable hn).fst.fst
      (firstLineLikelihood_measurable cfg ε M L hn s) hS.measurable
      ((2/(2-K))^2) C (sq_nonneg _) hC0
      (fun ω=>augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _)
      (fun u hu=>hC u ⟨hu.1.le,hu.2.le⟩)
    simp only [protectedRunningScalarSource,protectedFirstScalarSource,if_neg hd]
    change (∫ω,(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u) ∂savedCreditMeasure ν Z)=_
    rw [hF]
    apply intervalIntegral.integral_congr
    intro u hu
    rw [uIcc_of_le hT.1] at hu
    have hs := augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s hN hk hd u hu.1 hu.2
    change (∫ω,(if u<wait ω then Z ω else 0) ∂ν)*S u=_
    rw [hs]

theorem protectedRunningScalarSource_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (S : ℝ→ℝ) (hS : Continuous S)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    Integrable (fun ω=>protectedRunningScalarSource cfg ε M s S (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s) := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s hN hk
  let T := augGuardTime cfg ε M (augTimedInput cfg s)
  have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
  obtain ⟨C,hC⟩ := isCompact_Icc.exists_bound_of_continuousOn (s:=Icc (0:ℝ) T) hS.continuousOn
  have hC0 : 0≤C := (norm_nonneg (S 0)).trans (hC 0 ⟨le_rfl,hT.1⟩)
  have hmS := (protectedRunningScalarSource_measurable cfg ε M s S hS).comp
    (WinnerMarkLaw.firstMarkedRace_measurable hn)
  apply (integrable_const (C*T)).mono' hmS.aestronglyMeasurable
  refine ae_of_all _ (fun ω=>?_)
  unfold protectedRunningScalarSource
  split_ifs
  · simpa only [Function.comp_apply,norm_zero] using mul_nonneg hC0 hT.1
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 (WinnerMarkLaw.firstMarkedRace hn ω).1.1
    have hb := intervalIntegral.norm_integral_le_of_norm_le_const (f:=S) (a:=0)
      (b:=augAdvance cfg ε M (augTimedInput cfg s,(WinnerMarkLaw.firstMarkedRace hn ω).1.1))
      (fun u hu=>by rw [uIoc_of_le ha.1] at hu; exact hC u ⟨hu.1.le,hu.2.trans ha.2⟩)
    simp only [sub_zero,abs_of_nonneg ha.1] at hb
    exact hb.trans (mul_le_mul_of_nonneg_left ha.2 hC0)

end NoThreeLine
#print axioms NoThreeLine.protectedRunningScalarSource_firstForbidden_mean
#print axioms NoThreeLine.protectedRunningScalarSource_firstForbidden_integrable
