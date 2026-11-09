import NoThreeLine.ProtectedExponentialBounds

/-! Actual first-forbidden exponential supermeans for the whole protected
credit and entropy, centered by the actual elapsed source and energy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedWeightedCreditExp_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedTimedWeightedExponential cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E)
      θ s (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))≤
      Real.exp (θ*protectedCreditTotal L E s.1.val.1.physical s.2) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedExponential,protectedTimedExponential,augTimedLineLikelihood,
      if_pos hd,one_mul,protectedRemember,augTimedStep,augTimedStepPair,
      protectedLineSave_self,protectedRunningScalarSource,sub_zero,mul_zero]
    simp [protectedScalarTotal,protectedCreditTotal]
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf := protectedTimedWeightedExponential_integrable cfg ε M K hKcfg hK L hsp E hE id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E)
      θ (2*cfg.B) (fun c hc=>hc) measurable_id
      (selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E)
      (selectedCreditEnergy_continuous cfg (augTimedInput cfg s.1).1.1 L E) s hN hk hsv
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedExponential_candidate_mean cfg ε M L E id
        (fun u=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) cfg.mask L E)
        (fun u=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) cfg.directions cfg.mask L E)
        θ s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    exact selectedProtectedCreditExp_first_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk θ hθ (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedCreditExp_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedTimedExponential cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E)
      θ s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedCreditTotal L E s.1.val.1.physical s.2) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedCreditExp_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ

theorem protectedTimedWeightedEntropyExp_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedTimedWeightedExponential cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B)
      θ s (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedExponential,protectedTimedExponential,augTimedLineLikelihood,
      if_pos hd,one_mul,protectedRemember,augTimedStep,augTimedStepPair,
      protectedLineSave_self,protectedRunningScalarSource,sub_zero,mul_zero]
    simp [protectedScalarTotal,protectedEntropyTotal,protectedLineEntropy]
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf := protectedTimedWeightedExponential_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B)
      θ (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) (protectedEntropy_continuous cfg.B).measurable
      (selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB)
      (selectedEntropyEnergy_continuous cfg (augTimedInput cfg s.1).1.1 L E) s hN hk hsv
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedExponential_candidate_mean cfg ε M L E (protectedEntropy cfg.B)
        (fun u=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2 cfg.directions cfg.mask L E cfg.B)
        (fun u=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) cfg.directions cfg.mask L E cfg.B)
        θ s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    exact selectedProtectedEntropyExp_first_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk θ hθ (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedEntropyExp_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (θ : ℝ) (hθ : 0≤θ) :
    (∫ω,protectedTimedExponential cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B)
      θ s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedEntropyExp_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv θ hθ

end NoThreeLine
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedCreditExp_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedEntropyExp_mean
