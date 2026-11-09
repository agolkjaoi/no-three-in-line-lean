import NoThreeLine.ProtectedCenteredFirstMean
import NoThreeLine.ProtectedWholeEnergyMean

/-! Actual first-Q centered-square compensation by the actual running
whole-event energy, including both the real mark and boundary update. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedTimedCenteredSquare_firstForbidden_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (A S : ℝ→ℝ) (D : ℝ)
    (hAD : ∀c∈Icc (0:ℝ) (2*cfg.B),0≤A c ∧ A c≤D) (hA : Measurable A) (hS : Continuous S)
    (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedTimedCenteredSquare cfg ε M L E A S s (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun ω=>augTimedLineLikelihood cfg ε M L (s.1,WinnerMarkLaw.firstMarkedRace hn ω)
  let f := fun ω=>protectedTimedCenteredSquare cfg ε M L E A S s (WinnerMarkLaw.firstMarkedRace hn ω)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  obtain ⟨R,hR⟩ := protectedTimedWeightedCenteredSquare_exists_bound cfg ε M K hKcfg hK L hsp E hE A S D hAD hS s hN hk hsv
  have hi : Integrable (fun ω=>Z ω*f ω) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((protectedTimedWeightedCenteredSquare_measurable cfg ε M L E A S hA hS s).comp
        (WinnerMarkLaw.firstMarkedRace_measurable hn)) R (fun ω=>hR _)
  change Integrable f (ν.withDensity (fun ω=>ENNReal.ofReal (Z ω)))
  rw [integrable_withDensity_iff_integrable_smul'
    (firstLineLikelihood_measurable cfg ε M L hn s.1).ennreal_ofReal
    (ae_of_all _ (fun _=>ENNReal.ofReal_lt_top))]
  simpa only [ENNReal.toReal_ofReal (augTimedLineLikelihood_bounds cfg ε M K hKcfg hK L hsp s.1 hN hk _).1,
    smul_eq_mul] using hi

theorem protected_credit_centered_energy_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedCenteredSquare cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω)-
      protectedRunningCreditEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedTimedScalarSquare cfg L E id s := by
  have hS := selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E
  have hV : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) :=
    (protectedCreditEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  unfold protectedRunningCreditEnergy
  rw [integral_sub
    (protectedTimedCenteredSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE id _
      (2*cfg.B) (fun c hc=>hc) measurable_id hS hn hB s hN hk hsv)
    (protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk),
    firstLineForbiddenLaw_protectedCreditCentered_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv]
  rw [protectedRunningScalarSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk]
  ring

theorem protected_entropy_centered_energy_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedCenteredSquare cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω)-
      protectedRunningEntropyEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s := by
  have hS := selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB
  have hV : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) :=
    (protectedEntropyEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E cfg.B).comp
      (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  unfold protectedRunningEntropyEnergy
  rw [integral_sub
    (protectedTimedCenteredSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B) _
      (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) (protectedEntropy_continuous cfg.B).measurable hS hn hB s hN hk hsv)
    (protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk),
    firstLineForbiddenLaw_protectedEntropyCentered_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv]
  rw [protectedRunningScalarSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk]
  ring

end NoThreeLine
#print axioms NoThreeLine.protected_credit_centered_energy_first_compensation
#print axioms NoThreeLine.protected_entropy_centered_energy_first_compensation
