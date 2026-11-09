import NoThreeLine.ProtectedWholeEnergyTerminal
import NoThreeLine.BoundedMartingaleTerminalMaximal

/-! Coefficient-one bounds for every actual discrete update of the
compensated whole protected credit and entropy under the same whole-phase Q.
The numerator is the expectation of actual accumulated whole-event energy.
No predictable-energy hypothesis or union over update times is used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem boundedMartingale_centered_terminal_maximal {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ]
    (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X : ℕ→Ω→ℝ) (hX : Martingale X F μ) (C : ℝ)
    (hC : ∀k ω,‖X k ω‖≤C) (Y : Ω→ℝ)
    (hstable : ∀ᵐω∂μ,∀ᶠk in atTop,X k ω=Y ω)
    (c r : ℝ) (hr : 0<r) :
    μ {ω | ∃k,r≤|X k ω-c|}≤ENNReal.ofReal ((∫ω,(Y ω-c)^2 ∂μ)/r^2) := by
  have hc : Martingale (fun k ω=>X k ω-c) F μ := hX.sub (martingale_const F μ c)
  apply boundedMartingale_terminal_maximal μ F (fun k ω=>X k ω-c) hc (C+‖c‖)
    (fun k ω=>(norm_sub_le _ _).trans (add_le_add (hC k ω) le_rfl)) (fun ω=>Y ω-c) _ r hr
  filter_upwards [hstable] with ω hω
  exact hω.mono (fun k hk=>congrArg (fun x : ℝ=>x-c) hk)

theorem protectedCreditEnergy_all_update_maximal {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (r : ℝ) (hr : 0<r) :
    phaseLineForbiddenLaw cfg ε M K L N hn s.1
      {ω | ∃k,r≤|compensatedProtectedCreditTotal cfg ε M L E hn s k ω-
        protectedTimedCreditTotal cfg L E s|}≤
      ENNReal.ofReal ((∫ω,terminalProtectedCreditEnergy cfg ε M L E hn s ω
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)/r^2) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hMT := compensatedProtectedCreditTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv
  have habs := phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s.1
  have hh := boundedMartingale_centered_terminal_maximal
    (phaseLineForbiddenLaw cfg ε M K L N hn s.1) (protectedStateFiltration cfg ε M L hn s)
    (compensatedProtectedCreditTotal cfg ε M L E hn s) hMT
    ((E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*((cfg.B/n)*cfg.B)))
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).1)
    (terminalCompensatedProtectedCreditTotal cfg ε M L E hn s)
    (habs.ae_le (compensatedProtectedStateObservable_stable_ae cfg ε M L (protectedTimedCreditTotal cfg L E)
      (protectedCreditSourceField cfg L E) hn hB s))
    (protectedTimedCreditTotal cfg L E s) r hr
  rw [terminalProtectedCreditEnergy_variance cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv] at hh
  exact hh

theorem protectedEntropyEnergy_all_update_maximal {n : ℕ}
    (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K) (hK : K<2)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val) (hn : 0<n) (hB : 0<cfg.B)
    (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (r : ℝ) (hr : 0<r) :
    phaseLineForbiddenLaw cfg ε M K L N hn s.1
      {ω | ∃k,r≤|compensatedProtectedEntropyTotal cfg ε M L E hn s k ω-
        protectedTimedEntropyTotal cfg L E s|}≤
      ENNReal.ofReal ((∫ω,terminalProtectedEntropyEnergy cfg ε M L E hn s ω
        ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)/r^2) := by
  letI := phaseLineForbiddenLaw_probability cfg ε M K hKcfg hK L hsp N hN hn hB hm s.1 ho hk
  have hMT := compensatedProtectedEntropyTotal_martingale cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv
  have habs := phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s.1
  have hh := boundedMartingale_centered_terminal_maximal
    (phaseLineForbiddenLaw cfg ε M K L N hn s.1) (protectedStateFiltration cfg ε M L hn s)
    (compensatedProtectedEntropyTotal cfg ε M L E hn s) hMT
    ((E.card:ℝ)*(2*cfg.B)+(cfg.horizon:ℝ)*((E.card:ℝ)*protectedEntropySourceCap n cfg.B))
    (fun k ω=>(compensatedProtectedWholeTotal_norm_bounds cfg ε M L hsp E hE hn hB hm s hsv k ω).2)
    (terminalCompensatedProtectedEntropyTotal cfg ε M L E hn s)
    (habs.ae_le (compensatedProtectedStateObservable_stable_ae cfg ε M L (protectedTimedEntropyTotal cfg L E)
      (protectedEntropySourceField cfg L E) hn hB s))
    (protectedTimedEntropyTotal cfg L E s) r hr
  rw [terminalProtectedEntropyEnergy_variance cfg ε M K hKcfg hK L hsp N hN E hE hn hB hm s ho hk hsv] at hh
  exact hh

end NoThreeLine
#print axioms NoThreeLine.protectedCreditEnergy_all_update_maximal
#print axioms NoThreeLine.protectedEntropyEnergy_all_update_maximal
