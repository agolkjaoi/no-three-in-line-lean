import NoThreeLine.ProtectedWholeEnergyMartingale
import NoThreeLine.ProtectedStateSourceTerminal
import NoThreeLine.BoundedEnergyTerminalVariance

/-! Variance at the actual physical completion selector equals the
actual accumulated whole-event energy under the original whole-phase Q. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def terminalCompensatedProtectedCreditTotal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  compensatedProtectedCreditTotal cfg ε M L E hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

def terminalCompensatedProtectedEntropyTotal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  compensatedProtectedEntropyTotal cfg ε M L E hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

def terminalProtectedCreditEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L (protectedCreditEnergyField cfg L E) hn s
    (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

def terminalProtectedEntropyEnergy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L (protectedEntropyEnergyField cfg L E) hn s
    (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

theorem terminalProtectedCreditEnergy_variance {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(terminalCompensatedProtectedCreditTotal cfg ε M L E hn s ω-protectedTimedCreditTotal cfg L E s)^2
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω,terminalProtectedCreditEnergy cfg ε M L E hn s ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hMT := compensatedProtectedCreditTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv
  have hV : Measurable (protectedCreditEnergyField cfg L E) :=
    (protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst
  have habs := phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s.1
  have hh := boundedEnergyTerminalVariance (phaseLineForbiddenLaw cfg ε M K L N hn s.1)
    (protectedStateFiltration cfg ε M L hn s) (compensatedProtectedCreditTotal cfg ε M L E hn s)
    (cumulativeProtectedStateSource cfg ε M L (protectedCreditEnergyField cfg L E) hn s) hMT
    (compensatedProtectedCreditEnergy_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv)
    ((E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*((cfg.B/n)*cfg.B)))
    ((cfg.horizon:ℝ)*protectedWholeEnergyCap n cfg.B E.card)
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).1)
    (fun k ω=>cumulativeProtectedStateSource_bound cfg ε M L hsp E hE (protectedCreditEnergyField cfg L E)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) hn s hsv k ω)
    (terminalCompensatedProtectedCreditTotal cfg ε M L E hn s) (terminalProtectedCreditEnergy cfg ε M L E hn s)
    (protectedCompletion_evaluate_measurable cfg ε M hn s _ (fun k=>(hMT.stronglyMeasurable k).measurable.mono
      ((protectedStateFiltration cfg ε M L hn s).le k) le_rfl))
    (protectedCompletion_evaluate_measurable cfg ε M hn s _
      (cumulativeProtectedStateSource_measurable cfg ε M L (protectedCreditEnergyField cfg L E) hV hn s))
    (habs.ae_le (compensatedProtectedStateObservable_stable_ae cfg ε M L (protectedTimedCreditTotal cfg L E)
      (protectedCreditSourceField cfg L E) hn hB s))
    (habs.ae_le (cumulativeProtectedStateSource_stable_ae cfg ε M L (protectedCreditEnergyField cfg L E) hn hB s))
    (protectedTimedCreditTotal cfg L E s)
    (fun ω=>by simp [compensatedProtectedCreditTotal,compensatedProtectedStateObservable,
      cumulativeProtectedStateSource,protectedRecycledPair,RecycledBoardProcess.iterate])
    (fun ω=>by simp [cumulativeProtectedStateSource])
  exact hh.2

theorem terminalProtectedEntropyEnergy_variance {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) :
    (∫ω,(terminalCompensatedProtectedEntropyTotal cfg ε M L E hn s ω-protectedTimedEntropyTotal cfg L E s)^2
      ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω,terminalProtectedEntropyEnergy cfg ε M L E hn s ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1 := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hMT := compensatedProtectedEntropyTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv
  have hV : Measurable (protectedEntropyEnergyField cfg L E) :=
    (protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst
  have habs := phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s.1
  have hh := boundedEnergyTerminalVariance (phaseLineForbiddenLaw cfg ε M K L N hn s.1)
    (protectedStateFiltration cfg ε M L hn s) (compensatedProtectedEntropyTotal cfg ε M L E hn s)
    (cumulativeProtectedStateSource cfg ε M L (protectedEntropyEnergyField cfg L E) hn s) hMT
    (compensatedProtectedEntropyEnergy_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv)
    ((E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*protectedEntropySourceCap n cfg.B))
    ((cfg.horizon:ℝ)*protectedWholeEnergyCap n cfg.B E.card)
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).2)
    (fun k ω=>cumulativeProtectedStateSource_bound cfg ε M L hsp E hE (protectedEntropyEnergyField cfg L E)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) hn s hsv k ω)
    (terminalCompensatedProtectedEntropyTotal cfg ε M L E hn s) (terminalProtectedEntropyEnergy cfg ε M L E hn s)
    (protectedCompletion_evaluate_measurable cfg ε M hn s _ (fun k=>(hMT.stronglyMeasurable k).measurable.mono
      ((protectedStateFiltration cfg ε M L hn s).le k) le_rfl))
    (protectedCompletion_evaluate_measurable cfg ε M hn s _
      (cumulativeProtectedStateSource_measurable cfg ε M L (protectedEntropyEnergyField cfg L E) hV hn s))
    (habs.ae_le (compensatedProtectedStateObservable_stable_ae cfg ε M L (protectedTimedEntropyTotal cfg L E)
      (protectedEntropySourceField cfg L E) hn hB s))
    (habs.ae_le (cumulativeProtectedStateSource_stable_ae cfg ε M L (protectedEntropyEnergyField cfg L E) hn hB s))
    (protectedTimedEntropyTotal cfg L E s)
    (fun ω=>by simp [compensatedProtectedEntropyTotal,compensatedProtectedStateObservable,
      cumulativeProtectedStateSource,protectedRecycledPair,RecycledBoardProcess.iterate])
    (fun ω=>by simp [cumulativeProtectedStateSource])
  exact hh.2

end NoThreeLine
#print axioms NoThreeLine.terminalProtectedCreditEnergy_variance
#print axioms NoThreeLine.terminalProtectedEntropyEnergy_variance
