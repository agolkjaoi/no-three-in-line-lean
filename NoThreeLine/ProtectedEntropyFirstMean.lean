import NoThreeLine.ProtectedEntropyTimedEvent

/-! Exact actual first-race entropy mean with signed source h'positiveDrift-cost. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedEntropy_le (B c : ℝ) (hB : 0<B) (hc : 0≤c) : protectedEntropy B c≤2*B := by
  by_cases hz : c=0
  · simp only [hz,protectedEntropy_zero]
    positivity
  · have hp : 0<c := lt_of_le_of_ne hc (Ne.symm hz)
    have hh := mul_le_mul_of_nonneg_left (Real.log_le_sub_one_of_pos (div_pos (by linarith : 0<2*B) hp)) hc
    have heq : c*(2*B/c-1)=2*B-c := by field_simp
    rw [heq] at hh
    rw [protectedEntropy_eq B c hB]
    nlinarith only [hh]

theorem protectedEntropy_bounds (B c : ℝ) (hB : 0<B) (hc : 0≤c) (hu : c≤2*B) :
    0≤protectedEntropy B c ∧ protectedEntropy B c≤2*B :=
  ⟨protectedEntropy_nonneg B c hB hc hu,protectedEntropy_le B c hB hc⟩

theorem protectedTimedWeightedEntropy_bounds {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (hB : 0<cfg.B) (p : Grid n) (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) (z : CandidateData n) :
    0≤protectedTimedWeightedEntropy cfg ε M L p s z ∧
      protectedTimedWeightedEntropy cfg ε M L p s z≤(2/(2-K))^2*(2*cfg.B) := by
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
    have hh := protectedEntropy_bounds cfg.B _ hB hc.1 hc.2
    exact ⟨mul_nonneg hl.1 hh.1,mul_le_mul hl.2 hh.2 hh.1 (sq_nonneg _)⟩
  · have hl : augTimedLineLikelihood cfg ε M L (s.1,z)=0 := by
      rw [augTimedLineLikelihood_eq_states,if_neg ho]
    simp only [protectedTimedWeightedEntropy,hl,zero_mul]
    exact ⟨le_rfl,mul_nonneg (sq_nonneg _) (hsv.1.trans hsv.2)⟩

def protectedFirstEntropySource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (p : Grid n) (s : ProtectedTimedState cfg) : ℝ :=
  if s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true then 0 else
    ∫t in (0:ℝ)..augGuardTime cfg ε M (augTimedInput cfg s.1),
      Real.exp (-(((n:ℝ)*cfg.B)*t))*selectedLineLikelihood cfg (augTimedInput cfg s.1).1.1 L t*
        protectedEntropySource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L p cfg.B

theorem protectedTimedWeightedEntropy_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedEntropy cfg ε M L p s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=
      protectedEntropy cfg.B (protectedTimedCredit cfg L p s)+protectedFirstEntropySource cfg ε M L p s := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedEntropy,augTimedLineLikelihood,if_pos hd,one_mul,
      protectedTimedCredit,protectedRemember,augTimedStep,augTimedStepPair,if_pos hd,
      protectedLineSave_self,protectedFirstEntropySource,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf : Integrable (protectedTimedWeightedEntropy cfg ε M L p s)
        (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        (protectedTimedWeightedEntropy_measurable cfg ε M L p s) ((2/(2-K))^2*(2*cfg.B))
        (fun z=>protectedTimedWeightedEntropy_bounds cfg ε M K hKcfg hK L hsp hB p s hN hk hsv z)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedEntropy_candidate_mean cfg ε M L p s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstEntropySource,if_neg hd]
    exact selectedProtectedEntropy_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L p s.2 hn hB hm hs hsp hpL hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedEntropy_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (p : Grid n) (hpL : p∈L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : 0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedEntropy cfg.B (protectedTimedCredit cfg L p (protectedRestartStep cfg ε M L hn (s,ω)).1)
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedEntropy cfg.B (protectedTimedCredit cfg L p s)+protectedFirstEntropySource cfg ε M L p s := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedEntropy_first_mean cfg ε M K hKcfg hK L hsp p hpL hn hB hm s hN hk hsv

end NoThreeLine

#print axioms NoThreeLine.protectedTimedWeightedEntropy_first_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedEntropy_mean
