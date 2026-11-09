import NoThreeLine.ProtectedCenteredBounds

/-! Actual first-forbidden means of the source-centered whole squares.
The actual timed state, source and original board density are retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedWeightedCreditCentered_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedCenteredSquare cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))=
      protectedTimedScalarSquare cfg L E id s+
        protectedFirstScalarSource cfg ε M L s.1
          (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedCenteredSquare,protectedTimedCenteredSquare,augTimedLineLikelihood,
      if_pos hd,one_mul,protectedTimedScalarSquare,protectedRemember,augTimedStep,augTimedStepPair,
      protectedLineSave_self,protectedFirstScalarSource,protectedRunningScalarSource,sub_zero,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf := protectedTimedWeightedCenteredSquare_integrable cfg ε M K hKcfg hK L hsp E hE id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      (2*cfg.B) (fun c hc=>hc) measurable_id
      (selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E) s hN hk hsv
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedCenteredSquare_candidate_mean cfg ε M L E id
        (fun u=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) cfg.mask L E) s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstScalarSource,if_neg hd]
    exact selectedProtectedCreditCentered_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedCreditCentered_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedCenteredSquare cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E id s+
        protectedFirstScalarSource cfg ε M L s.1
          (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedCreditCentered_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv

theorem protectedTimedWeightedEntropyCentered_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedCenteredSquare cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n))=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        protectedFirstScalarSource cfg ε M L s.1
          (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedCenteredSquare,protectedTimedCenteredSquare,augTimedLineLikelihood,
      if_pos hd,one_mul,protectedTimedScalarSquare,protectedRemember,augTimedStep,augTimedStepPair,
      protectedLineSave_self,protectedFirstScalarSource,protectedRunningScalarSource,sub_zero,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf := protectedTimedWeightedCenteredSquare_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) (protectedEntropy_continuous cfg.B).measurable
      (selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB) s hN hk hsv
      (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedCenteredSquare_candidate_mean cfg ε M L E (protectedEntropy cfg.B)
        (fun u=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2 cfg.directions cfg.mask L E cfg.B) s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstScalarSource,if_neg hd]
    exact selectedProtectedEntropyCentered_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedEntropyCentered_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedCenteredSquare cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω) ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        protectedFirstScalarSource cfg ε M L s.1
          (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedEntropyCentered_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv

end NoThreeLine
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedCreditCentered_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedEntropyCentered_mean
