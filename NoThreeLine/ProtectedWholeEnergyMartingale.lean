import NoThreeLine.ProtectedWholeLinearMartingale
import NoThreeLine.FiniteEnergyMartingale

/-! The square of the actually compensated whole credit/entropy minus
its actual elapsed whole-event energy is a martingale under the same Q.
The energy sum is adapted, not asserted to be predictable. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def compensatedProtectedCreditEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  (compensatedProtectedCreditTotal cfg ε M L E hn s k ω)^2-
    cumulativeProtectedStateSource cfg ε M L (protectedCreditEnergyField cfg L E) hn s k ω

def compensatedProtectedEntropyEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  (compensatedProtectedEntropyTotal cfg ε M L E hn s k ω)^2-
    cumulativeProtectedStateSource cfg ε M L (protectedEntropyEnergyField cfg L E) hn s k ω

theorem compensatedProtectedCreditEnergy_martingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedCreditEnergy cfg ε M L E hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  apply finiteEnergyMartingale _ _ _ _
    (compensatedProtectedCreditTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv)
    (fun k=>protectedClockStateSource_measurable_history cfg ε M L (protectedCreditEnergyField cfg L E)
      ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst) hn s k)
    (fun _=>(E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*((cfg.B/n)*cfg.B)))
    (fun _=>(cfg.horizon:ℝ)*protectedWholeEnergyCap n cfg.B E.card)
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).1)
    (fun k ω=>protectedClockStateSource_bound cfg ε M E (protectedCreditEnergyField cfg L E)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) hn _
      (fun p hp=>protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) k ω) _)
  exact protectedCreditEnergy_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv

theorem compensatedProtectedEntropyEnergy_martingale {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    Martingale (compensatedProtectedEntropyEnergy cfg ε M L E hn s)
      (protectedStateFiltration cfg ε M L hn s) (phaseLineForbiddenLaw cfg ε M K L N hn s.1) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  apply finiteEnergyMartingale _ _ _ _
    (compensatedProtectedEntropyTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv)
    (fun k=>protectedClockStateSource_measurable_history cfg ε M L (protectedEntropyEnergyField cfg L E)
      ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst) hn s k)
    (fun _=>(E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*protectedEntropySourceCap n cfg.B))
    (fun _=>(cfg.horizon:ℝ)*protectedWholeEnergyCap n cfg.B E.card)
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).2)
    (fun k ω=>protectedClockStateSource_bound cfg ε M E (protectedEntropyEnergyField cfg L E)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) hn _
      (fun p hp=>protectedRecycledPair_saved_bounds_all cfg ε M L hsp p (hE hp) hn s (hsv p hp) k ω) _)
  exact protectedEntropyEnergy_history_equal_integrals cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv

end NoThreeLine
#print axioms NoThreeLine.compensatedProtectedCreditEnergy_martingale
#print axioms NoThreeLine.compensatedProtectedEntropyEnergy_martingale
