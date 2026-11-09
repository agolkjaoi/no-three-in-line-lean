import NoThreeLine.WeightedRunningIntegral
import NoThreeLine.ProtectedRunningSource
import NoThreeLine.ProtectedFirstSurvival

/-! Under the constructed first-line-forbidden law, the real elapsed
source has exactly the analytic source mean. The actual saved ledger
minus that real source therefore has its initial expectation. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedRunningSource_firstForbidden_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg)
    (hN : occupancy s.val.1.physical.process L≤1) (hk : s.val.1.physical.clocks L≤K) :
    (∫ω,protectedRunningSource cfg ε M L p (s,WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s)=protectedFirstSource cfg ε M L p s := by
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [protectedRunningSource,protectedFirstSource,if_pos hd,integral_zero]
  · let ν := boardClockMeasure n (cfg.B/n)
    letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
    let T := augGuardTime cfg ε M (augTimedInput cfg s)
    let wait := fun ω=>(WinnerMarkLaw.firstMarkedRace hn ω).1.1
    let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s,WinnerMarkLaw.firstMarkedRace hn ω)
    let S := fun u=>protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg s).1.1,u)) cfg.mask L p
    have hT := augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1
    have hF := savedCreditMeasure_running_integral ν T hT.1 wait Z S
      (WinnerMarkLaw.firstMarkedRace_measurable hn).fst.fst
      (firstLineLikelihood_measurable cfg ε M L hn s)
      (selectedProtectedSource_continuous cfg (augTimedInput cfg s).1.1 L p).measurable
      ((2/(2-K))^2) ((cfg.B/n)*cfg.B) (sq_nonneg _)
      (mul_nonneg (div_nonneg hB.le (Nat.cast_nonneg n)) hB.le)
      (fun ω=>augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s hN hk _)
      (fun u hu=>selectedProtectedSource_bounds cfg (augTimedInput cfg s).1.1 s.property.1.1
        K hKcfg hK L hsp p hB.le hm hN hk u ⟨hu.1.le,hu.2.le.trans hT.2⟩)
    simp only [protectedRunningSource,protectedFirstSource,if_neg hd]
    change (∫ω,(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u) ∂savedCreditMeasure ν Z)=_
    rw [hF]
    apply intervalIntegral.integral_congr
    intro u hu
    rw [uIcc_of_le hT.1] at hu
    have hs := augTimedLineLikelihood_survival_mean cfg ε M K hKcfg hK L hsp hn hB hm s hN hk hd u hu.1 hu.2
    change (∫ω,(if u<wait ω then Z ω else 0) ∂ν)*S u=_
    rw [hs]

theorem protectedCredit_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
  let f := fun ω=>protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((protectedTimedWeightedCredit_measurable cfg ε M L p s).comp (WinnerMarkLaw.firstMarkedRace_measurable hn))
      ((2/(2-K))^2*(2*cfg.B)) (fun ω=>protectedTimedWeightedCredit_bounds cfg ε M K hKcfg hK L hsp p s hN hk hsv _)
  change Integrable f (ν.withDensity (fun ω=>ENNReal.ofReal (Z ω)))
  rw [integrable_withDensity_iff_integrable_smul'
    (firstLineLikelihood_measurable cfg ε M L hn s.1).ennreal_ofReal
    (ae_of_all _ (fun _=>ENNReal.ofReal_lt_top))]
  simpa only [ENNReal.toReal_ofReal (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1,
    smul_eq_mul] using hi

theorem protected_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1-
      protectedRunningSource cfg ε M L p (s.1,WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedTimedCredit cfg L p s := by
  rw [integral_sub
    (protectedCredit_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s hN hk hsv)
    (protectedRunningSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s.1 hN hk),
    firstLineForbiddenLaw_protectedCredit_mean cfg ε M K hKcfg hK L hsp p hpL hn hB hm s hN hk hsv,
    protectedRunningSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp p hn hB hm s.1 hN hk]
  ring

end NoThreeLine

#print axioms NoThreeLine.protectedRunningSource_firstForbidden_mean
#print axioms NoThreeLine.protected_first_compensation
