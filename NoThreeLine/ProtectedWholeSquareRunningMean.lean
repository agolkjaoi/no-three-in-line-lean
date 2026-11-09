import NoThreeLine.ProtectedWholeSquareFirstMean

/-! The actual elapsed whole-square source, including the full external
jump square, compensates both whole credit and whole entropy squares. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedRunningCreditSquareSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedCreditSquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E) z

theorem protectedRunningCreditSquareSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedRunningCreditSquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  have hS : Continuous (fun t=>protectedCreditSquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E) := (protectedCreditSquareSource_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hS hN hk

theorem protected_credit_whole_square_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedScalarSquare cfg L E id (protectedRestartStep cfg ε M L hn (s,ω)).1-
      protectedRunningCreditSquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedTimedScalarSquare cfg L E id s := by
  have hS : Continuous (fun t=>protectedCreditSquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E) := (protectedCreditSquareSource_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  rw [integral_sub
    (protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE id
      measurable_id (2*cfg.B) (fun c hc=>hc) hn hB s hN hk hsv)
    (protectedRunningCreditSquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv),
    firstLineForbiddenLaw_protectedCreditTotalSquare_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv]
  unfold protectedRunningCreditSquareSource
  rw [protectedRunningScalarSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hS hN hk]
  ring

def protectedRunningEntropySquareSource {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : ProtectedTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s.1 (fun t=>protectedEntropySquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) z

theorem protectedRunningEntropySquareSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Integrable (fun ω=>protectedRunningEntropySquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      (firstLineForbiddenLaw cfg ε M L hn s.1) := by
  have hS : Continuous (fun t=>protectedEntropySquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := (protectedEntropySquareSource_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E cfg.B hB).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  exact protectedRunningScalarSource_firstForbidden_integrable cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hS hN hk

theorem protected_entropy_whole_square_first_compensation {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (hN : occupancy s.1.val.1.physical.process L≤1)
    (hk : s.1.val.1.physical.clocks L≤K) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) (protectedRestartStep cfg ε M L hn (s,ω)).1-
      protectedRunningEntropySquareSource cfg ε M L E s (WinnerMarkLaw.firstMarkedRace hn ω))
      ∂firstLineForbiddenLaw cfg ε M L hn s.1)=protectedTimedScalarSquare cfg L E (protectedEntropy cfg.B) s := by
  have hS : Continuous (fun t=>protectedEntropySquareSource (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,t)) s.2 cfg.directions cfg.mask L E cfg.B) := (protectedEntropySquareSource_withCoordinates_continuous s.1.val.1.physical s.2 cfg.directions cfg.mask L E cfg.B hB).comp (selectedLedgerCurve_continuous cfg (augTimedInput cfg s.1).1.1)
  rw [integral_sub
    (protectedScalarSquare_firstForbidden_integrable cfg ε M K hKcfg hK L hsp E hE (protectedEntropy cfg.B)
      (protectedEntropy_continuous cfg.B).measurable (2*cfg.B) (fun c hc=>protectedEntropy_bounds cfg.B c hB hc.1 hc.2) hn hB s hN hk hsv)
    (protectedRunningEntropySquareSource_integrable cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv),
    firstLineForbiddenLaw_protectedEntropyTotalSquare_mean cfg ε M K hKcfg hK L hsp E hE hn hB hm s hN hk hsv]
  unfold protectedRunningEntropySquareSource
  rw [protectedRunningScalarSource_firstForbidden_mean cfg ε M K hKcfg hK L hsp hn hB hm s.1 _ hS hN hk]
  ring

end NoThreeLine
#print axioms NoThreeLine.protected_credit_whole_square_first_compensation
#print axioms NoThreeLine.protected_entropy_whole_square_first_compensation
