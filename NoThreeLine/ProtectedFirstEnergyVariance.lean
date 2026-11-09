import NoThreeLine.ProtectedCenteredValue

/-! The actual compensated one-step increment has second moment equal
to actual elapsed whole-event energy under the constructed first-Q law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem integral_centered_square_of_energy {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (X V : Ω→ℝ) (c : ℝ)
    (hX : Integrable X μ) (hXX : Integrable (fun ω=>(X ω)^2) μ) (hV : Integrable V μ)
    (hmean : (∫ω,X ω ∂μ)=c) (henergy : (∫ω,((X ω)^2-V ω) ∂μ)=c^2) :
    Integrable (fun ω=>(X ω-c)^2) μ ∧
      (∫ω,(X ω-c)^2 ∂μ)=∫ω,V ω ∂μ := by
  have heq : (fun ω=>(X ω-c)^2)=(fun ω=>(X ω)^2-(2*c)*X ω+c^2) := by
    funext ω
    ring
  rw [heq]
  have hiD : Integrable (fun ω=>(X ω)^2-(2*c)*X ω) μ := hXX.sub (hX.const_mul (2*c))
  have hi := hiD.add (integrable_const (c^2))
  refine ⟨hi,?_⟩
  rw [integral_add hiD (integrable_const (c^2)),
    integral_sub hXX (hX.const_mul (2*c)),integral_const_mul,hmean]
  rw [integral_sub hXX hV] at henergy
  simp only [integral_const,measureReal_def,measure_univ,ENNReal.toReal_one,one_smul]
  linarith only [henergy]

theorem protected_credit_first_energy_variance {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedCenteredValue cfg ε M L E id
      (fun t=>protectedCreditTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.mask L E)
      s (WinnerMarkLaw.firstMarkedRace hn ω)-protectedCreditTotal L E s.1.val.1.physical s.2)^2
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,protectedRunningCreditEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hlin := protectedCreditCenteredValue_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hsquare := protectedTimedCenteredSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE id _
    (2*cfg.B) (fun c hc=>hc) measurable_id
    (selectedCreditSource_continuous cfg (augTimedInput cfg s.1).1.1 L E) hn hB s hN hk hsv
  have henergy := protected_credit_centered_energy_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hV : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) :=
    (protectedCreditEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact (integral_centered_square_of_energy _ _ _ _ hlin.1 hsquare
    (protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk)
    hlin.2 henergy).2

theorem protected_entropy_first_energy_variance {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedCenteredValue cfg ε M L E (protectedEntropy cfg.B)
      (fun t=>protectedEntropyTotalSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B)
      s (WinnerMarkLaw.firstMarkedRace hn ω)-protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2)^2
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      ∫ω,protectedRunningEntropyEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1 := by
  letI := firstLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp hn hB hm s.1 hN hk
  have hlin := protectedEntropyCenteredValue_first_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hsquare := protectedTimedCenteredSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B) _
    (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) (protectedEntropy_continuous cfg.B).measurable
    (selectedEntropySource_continuous cfg (augTimedInput cfg s.1).1.1 L E s.2 hB) hn hB s hN hk hsv
  have henergy := protected_entropy_centered_energy_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  have hV : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) :=
    (protectedEntropyEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E cfg.B).comp
      (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact (integral_centered_square_of_energy _ _ _ _ hlin.1 hsquare
    (protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk)
    hlin.2 henergy).2

end NoThreeLine
#print axioms NoThreeLine.protected_credit_first_energy_variance
#print axioms NoThreeLine.protected_entropy_first_energy_variance
