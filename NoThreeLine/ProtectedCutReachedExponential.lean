import NoThreeLine.ProtectedSelectedLiveExponential
import NoThreeLine.LineStageCutReached

/-! A real executed-flow cut, including the guard endpoint, under the same
whole-phase forbidden law. The indicator is retained: no time-maximum claim. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem protectedCreditExp_cutReached_integral_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (u : ℝ) (hd : ¬birthDone cfg s.1) (hu : 0≤u)
    (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫_ω in firstLineCutReached cfg ε M hn s.1 u,
      Real.exp (θ*(protectedCreditTotal L E (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
        selectedCreditSourceIntegral cfg (augTimedInput cfg s.1).1.1 L E u)-
        (θ^2/2)*selectedCreditEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
      Real.exp (θ*protectedCreditTotal L E s.1.val.1.physical s.2) := by
  rw [setIntegral_const,smul_eq_mul,
    phaseLineForbiddenLaw_firstCutReached cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk u hd hu hug]
  have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  exact selectedProtectedCreditExp_live_survival cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1
    K hKcfg hK L E s.2 hn hB hm hs hsp hE (ho ▸ hN) hk θ hθ u hu
    (hug.trans (augGuardTime_mem cfg ε M _ s.1.property.1.1).2)

theorem protectedEntropyExp_cutReached_integral_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (θ : ℝ) (hθ : 0≤θ) (u : ℝ) (hd : ¬birthDone cfg s.1) (hu : 0≤u)
    (hug : u≤augGuardTime cfg ε M (augTimedInput cfg s.1)) :
    (∫_ω in firstLineCutReached cfg ε M hn s.1 u,
      Real.exp (θ*(protectedEntropyTotal L E cfg.B (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,u)) s.2-
        selectedEntropySourceIntegral cfg (augTimedInput cfg s.1).1.1 L E s.2 u)-
        (θ^2/2)*selectedEntropyEnergyIntegral cfg (augTimedInput cfg s.1).1.1 L E u)
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)≤
      Real.exp (θ*protectedEntropyTotal L E cfg.B s.1.val.1.physical s.2) := by
  rw [setIntegral_const,smul_eq_mul,
    phaseLineForbiddenLaw_firstCutReached cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk u hd hu hug]
  have hs : s.1.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  exact selectedProtectedEntropyExp_live_survival cfg (augTimedInput cfg s.1).1.1 s.1.property.1.1
    K hKcfg hK L E s.2 hn hB hm hs hsp hE (ho ▸ hN) hk θ hθ u hu
    (hug.trans (augGuardTime_mem cfg ε M _ s.1.property.1.1).2)

end NoThreeLine
#print axioms NoThreeLine.protectedCreditExp_cutReached_integral_le
#print axioms NoThreeLine.protectedEntropyExp_cutReached_integral_le
