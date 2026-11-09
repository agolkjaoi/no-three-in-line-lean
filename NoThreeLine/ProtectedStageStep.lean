import NoThreeLine.ProtectedRunningHistory

/-! The actual first-forbidden compensation identity implies equality
of the two original-board stage-weighted step means, also after the
occupancy stage has ended, when both weights are exactly zero. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protected_first_mean_add_running {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,(protectedTimedCredit cfg L p s+protectedClockRunningSource cfg ε M L p hn (s,ω))
        ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hi : Integrable (fun ω=>protectedClockRunningSource cfg ε M L p hn (s,ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) :=
    protectedRunningSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp p hn hB hm s.1 hN hk
  rw [integral_add (integrable_const _) hi]
  simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul]
  rw [firstLineForbiddenLaw_protectedCredit_mean cfg ε M K hKcfg hK L hsp p hpL hn hB hm s hN hk hsv]
  rw [show (∫ω,protectedClockRunningSource cfg ε M L p hn (s,ω)
    ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedFirstSource cfg ε M L p s.1 from
      protectedRunningSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp p hn hB hm s.1 hN hk]

theorem protectedStage_step_equal_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hs : lineStageRegion cfg K L N s.1) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,lineStageValue cfg K L N (protectedRestartStep cfg ε M L hn (s,ω)).1.1*
      protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂boardClockMeasure n (cfg.B/n))=
      ∫ω,lineStageValue cfg K L N (protectedRestartStep cfg ε M L hn (s,ω)).1.1*
        (protectedTimedCredit cfg L p s+protectedClockRunningSource cfg ε M L p hn (s,ω))
        ∂boardClockMeasure n (cfg.B/n) := by
  by_cases ho : occupancy s.1.val.1.physical.process L=N
  · have hcurrent : occupancy s.1.val.1.physical.process L≤1 := ho ▸ hN
    have hh := protected_first_mean_add_running cfg ε M K hKcfg hK L hsp p hpL hn hB hm s
      hcurrent (hs.2 ho) hsv
    rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
      (firstLineLikelihood_measurable cfg ε M L hn s.1)
      (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hcurrent (hs.2 ho) _).1),
      savedCreditMeasure_integral _ _ (firstLineLikelihood_measurable cfg ε M L hn s.1)
      (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hcurrent (hs.2 ho) _).1)] at hh
    have hfactor (ω : BoardClockPath n) :
        lineStageValue cfg K L N (protectedRestartStep cfg ε M L hn (s,ω)).1.1=
          lineStageValue cfg K L N s.1*augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω) :=
      lineStageValue_step_factor cfg ε M K hKcfg L hsp N hN s.1 ho (hs.2 ho) _
    simp_rw [hfactor,mul_assoc]
    rw [integral_const_mul,integral_const_mul,hh]
  · have hz (ω : BoardClockPath n) :
        lineStageValue cfg K L N (protectedRestartStep cfg ε M L hn (s,ω)).1.1=0 := by
      have hm := augTimedStep_occupancy_le cfg ε M L s.1 (WinnerMarkLaw.firstMarkedRace hn ω)
      have hmin := hs.1
      have hne : occupancy (protectedRestartStep cfg ε M L hn (s,ω)).1.1.val.1.physical.process L≠N := by
        change occupancy (augTimedStep cfg ε M (s.1,WinnerMarkLaw.firstMarkedRace hn ω)).val.1.physical.process L≠N
        omega
      exact if_neg (fun h=>hne h.1)
    simp only [hz,zero_mul,integral_zero]

end NoThreeLine

#print axioms NoThreeLine.protected_first_mean_add_running
#print axioms NoThreeLine.protectedStage_step_equal_mean
