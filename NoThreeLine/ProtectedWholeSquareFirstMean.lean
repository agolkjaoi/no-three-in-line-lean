import NoThreeLine.ProtectedScalarSquareBounds
import NoThreeLine.ProtectedRunningScalarMean

/-! Actual first-forbidden means for the square of the whole protected
credit and entropy sums. All cross terms and real boundary saves remain. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedWeightedCreditTotalSquare_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedScalarSquare cfg ε M L E id s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=
      protectedTimedScalarSquare cfg L E id s+
        protectedFirstScalarSource cfg ε M L s.1 (fun t=>protectedCreditSquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedScalarSquare,augTimedLineLikelihood,if_pos hd,one_mul,
      protectedTimedScalarSquare,protectedRemember,augTimedStep,augTimedStepPair,if_pos hd,
      protectedLineSave_self,protectedFirstScalarSource,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf : Integrable (protectedTimedWeightedScalarSquare cfg ε M L E id s)
        (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        (protectedTimedWeightedScalarSquare_measurable cfg ε M L E id measurable_id s)
        ((2/(2-K))^2*((E.card:ℝ)*(2*cfg.B))^2)
        (fun z=>protectedTimedWeightedScalarSquare_bounds cfg ε M K hKcfg hK L hsp E hE id
          (2*cfg.B) (fun c hc=>hc) s hN hk hsv z)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedScalarSquare_candidate_mean cfg ε M L E id s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstScalarSource,if_neg hd]
    exact selectedProtectedCreditSquare_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedCreditTotalSquare_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E id (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E id s+
        protectedFirstScalarSource cfg ε M L s.1 (fun t=>protectedCreditSquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedCreditTotalSquare_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv

theorem protectedTimedWeightedEntropyTotalSquare_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedWeightedScalarSquare cfg ε M L E (protectedEntropy cfg.B) s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂boardClockMeasure n (cfg.B/n))=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        protectedFirstScalarSource cfg ε M L s.1 (fun t=>protectedEntropySquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := by
  have hnR : (0:ℝ)<n := by exact_mod_cast hn
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB hnR)
  by_cases hd : s.1.val.2≤0 ∨ s.1.val.1.physical.process.stopped=true
  · simp only [protectedTimedWeightedScalarSquare,augTimedLineLikelihood,if_pos hd,one_mul,
      protectedTimedScalarSquare,protectedRemember,augTimedStep,augTimedStepPair,if_pos hd,
      protectedLineSave_self,protectedFirstScalarSource,add_zero]
    simp
  · letI := isProbabilityMeasure_expMeasure (mul_pos hnR hB)
    have hf : Integrable (protectedTimedWeightedScalarSquare cfg ε M L E (protectedEntropy cfg.B) s)
        (((expMeasure ((n:ℝ)*cfg.B)).prod (BoardWinnerLaw.uniformGrid hn)).prod markMeasure) :=
      GenericCreditIteration.bounded_nonnegative_integrable _ _
        (protectedTimedWeightedScalarSquare_measurable cfg ε M L E (protectedEntropy cfg.B) (protectedEntropy_continuous cfg.B).measurable s)
        ((2/(2-K))^2*((E.card:ℝ)*(2*cfg.B))^2)
        (fun z=>protectedTimedWeightedScalarSquare_bounds cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
          (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) s hN hk hsv z)
    rw [WinnerMarkLaw.candidate_firstMarkedRace_integral hn cfg.B hB _ hf]
    have heq := integral_congr_ae (Filter.Eventually.mono
      (expMeasure_ae_positive ((n:ℝ)*cfg.B) (mul_pos hnR hB))
      (fun t ht=>protectedTimedWeightedScalarSquare_candidate_mean cfg ε M L E (protectedEntropy cfg.B) s hn hd t ht))
    rw [heq]
    have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    simp only [protectedFirstScalarSource,if_neg hd]
    exact selectedProtectedEntropySquare_first_exponential_mean cfg (augTimedInput cfg s.1).1.1
      s.1.property.1.1 K hKcfg hK L E s.2 hn hB hm hs hsp hE hN hk (fun _ _ _=>false)
      (augGuardTime cfg ε M (augTimedInput cfg s.1))
      (augGuardTime_mem cfg ε M _ s.1.property.1.1).1 (augGuardTime_mem cfg ε M _ s.1.property.1.1).2

theorem firstLineForbiddenLaw_protectedEntropyTotalSquare_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        protectedFirstScalarSource cfg ε M L s.1 (fun t=>protectedEntropySquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := by
  rw [firstLineForbiddenLaw,savedCreditMeasure_integral _ _
    (firstLineLikelihood_measurable cfg ε M L hn s.1)
    (fun ω=>(augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1)]
  exact protectedTimedWeightedEntropyTotalSquare_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv

theorem protectedScalarSquare_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (A : ℝ→ℝ) (hA : Measurable A) (D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D)
    (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedTimedScalarSquare cfg L E A (protectedRestartStep cfg ε M L hn (s,ω)).1)
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
  let f := fun ω=>protectedTimedScalarSquare cfg L E A (protectedRestartStep cfg ε M L hn (s,ω)).1
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hi : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((protectedTimedWeightedScalarSquare_measurable cfg ε M L E A hA s).comp (WinnerMarkLaw.firstMarkedRace_measurable hn))
      ((2/(2-K))^2*((E.card:ℝ)*D)^2)
      (fun ω=>protectedTimedWeightedScalarSquare_bounds cfg ε M K hKcfg hK L hsp E hE A D hAD s hN hk hsv _)
  change Integrable f (ν.withDensity (fun ω=>ENNReal.ofReal (Z ω)))
  rw [integrable_withDensity_iff_integrable_smul'
    (firstLineLikelihood_measurable cfg ε M L hn s.1).ennreal_ofReal
    (ae_of_all _ (fun _=>ENNReal.ofReal_lt_top))]
  simpa only [ENNReal.toReal_ofReal (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1,
    smul_eq_mul] using hi

end NoThreeLine
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedCreditTotalSquare_mean
#print axioms NoThreeLine.firstLineForbiddenLaw_protectedEntropyTotalSquare_mean
#print axioms NoThreeLine.protectedScalarSquare_firstForbidden_integrable
