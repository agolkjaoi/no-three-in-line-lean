import NoThreeLine.ProtectedRunningEnergyCost
import NoThreeLine.ProtectedWholeEnergyMean

/-! The real first-forbidden law preserves the whole-event energy-cost
inequality. All three actual elapsed integrals are integrable internally. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedRunningWholeCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (E : Finset (Grid n)) (s : AugTimedState cfg) (z : CandidateData n) : ℝ :=
  protectedRunningScalarSource cfg ε M s
    (fun t=>protectedWholeCostRate (selectedTrajectory cfg ((augTimedInput cfg s).1.1,t)) cfg.directions cfg.mask L E) z

theorem protectedWhole_energy_cost_first_mean_bound {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (s : ProtectedTimedState cfg) (L : LineIndex n) (E : Finset (Grid n))
    (hn : 2≤n) (hB : 1≤cfg.B) (hm : ∀q,cfg.mask q≤1) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hE : E⊆L.val) (hs : s.1.val.1.physical.process.stopped=false) (hsp : specified cfg.directions L)
    (hN : occupancy s.1.val.1.physical.process L≤1) (hKcfg : cfg.K≤K) (hclock : s.1.val.1.physical.clocks L≤K) (hK : K<2)
    (hinit : ∀q,virtualMass s.1.val.1.physical.process cfg.directions s.1.val.1.physical.coordinates L q≤(n:ℝ)^γ) :
    let hn0 : 0<n := by omega
    let Q := firstLineForbiddenLaw cfg ε ((n:ℝ)^γ) L hn0 s.1
    let cost := ∫ω,protectedRunningWholeCost cfg ε ((n:ℝ)^γ) L E s.1 (WinnerMarkLaw.firstMarkedRace hn0 ω) ∂Q
    ((1-Real.log 2)*(∫ω,protectedRunningCreditEnergy cfg ε ((n:ℝ)^γ) L E s
      (WinnerMarkLaw.firstMarkedRace hn0 ω) ∂Q)≤((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*cost) ∧
    ((1-Real.log 2)*(∫ω,protectedRunningEntropyEnergy cfg ε ((n:ℝ)^γ) L E s
      (WinnerMarkLaw.firstMarkedRace hn0 ω) ∂Q)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*cost) := by
  let hn0 : 0<n := by omega
  have hB0 : 0<cfg.B := by linarith
  let x := (augTimedInput cfg s.1).1.1
  have hC : Continuous (fun t=>protectedCreditEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
    (protectedCreditEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)
  have hH : Continuous (fun t=>protectedEntropyEnergyRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E cfg.B) :=
    (protectedEntropyEnergyRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E cfg.B).comp
      (selectedLedgerCurve_continuous cfg x)
  have hG : Continuous (fun t=>protectedWholeCostRate (selectedTrajectory cfg (x,t)) cfg.directions cfg.mask L E) :=
    (protectedWholeCostRate_withCoordinates_continuous s.1.val.1.physical cfg.directions cfg.mask L E).comp
      (selectedLedgerCurve_continuous cfg x)
  have hiC := protectedRunningScalarSource_firstForbidden_integrable cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp hn0 hB0 hm s.1 _ hC hN hclock
  have hiH := protectedRunningScalarSource_firstForbidden_integrable cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp hn0 hB0 hm s.1 _ hH hN hclock
  have hiG := protectedRunningScalarSource_firstForbidden_integrable cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp hn0 hB0 hm s.1 _ hG hN hclock
  have hb (ω : BoardClockPath n) := protectedRunningWhole_energy_cost_bounds cfg ε K d γ s.1 L E
    hn hB hd hdγ hBd hE hs hsp hN hKcfg hclock hK hinit (WinnerMarkLaw.firstMarkedRace hn0 ω)
  constructor
  · rw [←integral_const_mul,←integral_const_mul]
    exact integral_mono (hiC.const_mul _) (hiG.const_mul _) (fun ω=>(hb ω).1)
  · rw [←integral_const_mul,←integral_const_mul]
    exact integral_mono (hiH.const_mul _) (hiG.const_mul _) (fun ω=>(hb ω).2)

end NoThreeLine
#print axioms NoThreeLine.protectedWhole_energy_cost_first_mean_bound
