import NoThreeLine.ProtectedWholeEnergy

/-! Exact first-forbidden energy identity after the real capped update.
The energy is the time integral of whole-event squared losses. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedRunningCreditCross {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedCreditCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.mask L E) z

def protectedRunningCreditEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) z

theorem protectedRunningCreditSquareSource_split {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (hB : 0<cfg.B) (z : CandidateData n) :
    protectedRunningCreditSquareSource cfg ε M L E s z=
      protectedRunningCreditCross cfg ε M L E s z+protectedRunningCreditEnergy cfg ε M L E s z := by
  have hC : Continuous (fun t=>protectedCreditCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.mask L E) := (protectedCreditCrossRate_withCoordinates_continuous s.1.val.1.physical s.2 cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hV : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) := (protectedCreditEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact protectedRunningScalarSource_add cfg ε M s.1 _ _ hC hV z

theorem protected_credit_whole_energy_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E id (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E id s+
        (∫ω,protectedRunningCreditCross cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
          ∂firstLineForbiddenLaw cfg ε M L hn s.1)+
        (∫ω,protectedRunningCreditEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
          ∂firstLineForbiddenLaw cfg ε M L hn s.1) := by
  have hC : Continuous (fun t=>protectedCreditCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.mask L E) := (protectedCreditCrossRate_withCoordinates_continuous s.1.val.1.physical s.2 cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hV : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E) := (protectedCreditEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hiC := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hC hN hk
  have hiV := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk
  have hsum : (∫ω,protectedRunningCreditSquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      (∫ω,protectedRunningCreditCross cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1)+
      (∫ω,protectedRunningCreditEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1) := by
    simp_rw [protectedRunningCreditSquareSource_split cfg ε M L E s hB]
    exact integral_add hiC hiV
  have hc := protected_credit_whole_square_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  rw [integral_sub
    (protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE id measurable_id
      (2*cfg.B) (fun c hc=>hc) hn hB s hN hk hsv)
    (protectedRunningCreditSquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv),hsum] at hc
  linarith only [hc]

def protectedRunningEntropyCross {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedEntropyCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) z

def protectedRunningEntropyEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) z

theorem protectedRunningEntropySquareSource_split {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (hB : 0<cfg.B) (z : CandidateData n) :
    protectedRunningEntropySquareSource cfg ε M L E s z=
      protectedRunningEntropyCross cfg ε M L E s z+protectedRunningEntropyEnergy cfg ε M L E s z := by
  have hC : Continuous (fun t=>protectedEntropyCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := (protectedEntropyCrossRate_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E cfg.B hB).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hV : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) := (protectedEntropyEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E cfg.B).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact protectedRunningScalarSource_add cfg ε M s.1 _ _ hC hV z

theorem protected_entropy_whole_energy_first_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) (protectedRestartStep cfg ε M L hn (s,ω)).1
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s+
        (∫ω,protectedRunningEntropyCross cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
          ∂firstLineForbiddenLaw cfg ε M L hn s.1)+
        (∫ω,protectedRunningEntropyEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
          ∂firstLineForbiddenLaw cfg ε M L hn s.1) := by
  have hC : Continuous (fun t=>protectedEntropyCrossRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := (protectedEntropyCrossRate_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E cfg.B hB).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hV : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) cfg.directions cfg.mask L E cfg.B) := (protectedEntropyEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E cfg.B).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  have hiC := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hC hN hk
  have hiV := protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hV hN hk
  have hsum : (∫ω,protectedRunningEntropySquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=
      (∫ω,protectedRunningEntropyCross cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1)+
      (∫ω,protectedRunningEntropyEnergy cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω)
        ∂firstLineForbiddenLaw cfg ε M L hn s.1) := by
    simp_rw [protectedRunningEntropySquareSource_split cfg ε M L E s hB]
    exact integral_add hiC hiV
  have hc := protected_entropy_whole_square_first_compensation cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv
  rw [integral_sub
    (protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B) (protectedEntropy_continuous cfg.B).measurable
      (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) hn hB s hN hk hsv)
    (protectedRunningEntropySquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv),hsum] at hc
  linarith only [hc]

end NoThreeLine
#print axioms NoThreeLine.protected_credit_whole_energy_first_mean
#print axioms NoThreeLine.protected_entropy_whole_energy_first_mean
