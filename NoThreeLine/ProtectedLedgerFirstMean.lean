import NoThreeLine.ProtectedLedgerTimedEvent

/-! The original board's actual first marked race has the protected
ledger mean computed from the physical positive source. The same result
is expressed under the constructed first-line-forbidden probability law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedWeightedCredit_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (z : CandidateData n) :
    0≤protectedTimedWeightedCredit cfg ε M L p s z ∧
      protectedTimedWeightedCredit cfg ε M L p s z≤(2/(2-K))^2*(2*cfg.B) := by
  by_cases ho : occupancy (augTimedStep cfg ε M (s.1,z)).val.1.physical.process L=
      occupancy s.1.val.1.physical.process L
  · have hn' : occupancy (augTimedStep cfg ε M (s.1,z)).val.1.physical.process L≤1 := ho ▸ hN
    have hk' := augTimedStep_specifiedClock_le cfg ε M K hKcfg L hsp s.1 hN hk z
    have hsaved := protectedLineSave_bounds L s.1.val.1.physical (augTimedStep cfg ε M (s.1,z)).val.1.physical
      s.2 p cfg.B K (augTimedStep cfg ε M (s.1,z)).property.1.1 hn' hk' hK hsv
    have hc := protectedLineCredit_bounds L (augTimedStep cfg ε M (s.1,z)).val.1.physical
      (protectedLineSave L s.1.val.1.physical (augTimedStep cfg ε M (s.1,z)).val.1.physical s.2)
      p cfg.B K (augTimedStep cfg ε M (s.1,z)).property.1.1 hn' hk' hK hsaved
    have hl := augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk z
    exact ⟨mul_nonneg hl.1 hc.1,mul_le_mul hl.2 hc.2 hc.1 (sq_nonneg _)⟩
  · have hl : augTimedLineLikelihood cfg ε M L (s.1,z)=0 := by
      rw [augTimedLineLikelihood_eq_states,if_neg ho]
    simp only [protectedTimedWeightedCredit,hl,zero_mul]
    exact ⟨le_rfl,mul_nonneg (sq_nonneg _) (hsv.1.trans hsv.2)⟩

def protectedFirstSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (s : AugTimedState cfg) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augGuardTime cfg ε M (augTimedInput cfg s),
      Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg (augTimedInput cfg s).1.1 L t*
        protectedLinePositiveDrift (selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)) cfg.mask L p

theorem protectedTimedWeightedCredit_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedCredit cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=
      protectedTimedCredit cfg L p s+protectedFirstSource cfg ε M L p s.1 := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedCredit,augTimedLineLikelihood,if_pos hd,one_mul,
      protectedTimedCredit,protectedRemember,augTimedStep,augTimedStepPair,if_pos hd,
      protectedLineSave_self,protectedFirstSource,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf : Integrable (protectedTimedWeightedCredit cfg ε M L p s)
        (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        (protectedTimedWeightedCredit_measurable cfg ε M L p s) ((2/(2-K))^2*(2*cfg.B))
        (fun z=>protectedTimedWeightedCredit_bounds cfg ε M K hKcfg hK L hsp p s hN hk hsv z)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedCredit_candidate_mean cfg ε M L p s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstSource,if_neg hd]
    exact selectedProtectedLedger_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L p s.2 hn hB hm hs hsp hpL hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedCredit_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedCredit cfg L p s+protectedFirstSource cfg ε M L p s.1 := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedCredit_first_mean cfg ε M K hKcfg hK L hsp p hpL hn hB hm s hN hk hsv

end NoThreeLine

#print axioms NoThreeLine.protectedTimedWeightedCredit_first_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedCredit_mean
