import NoThreeLine.ProtectedEnergyGuardHistory
import NoThreeLine.ProtectedWholeEnergyMaximal
import NoThreeLine.ProtectedWholeCostRegularity

/-! The actual full-history energy-cost comparison reaches the physical
completion selector and expectation under the same forbidden law.
The coarse caps here establish integrability only. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

def terminalProtectedWholeCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (E : Finset (Grid n)) (hn : 0<n) (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  cumulativeProtectedStateSource cfg ε M L (protectedWholeCostField cfg L E) hn s
    (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

theorem protectedTerminalStateSource_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (F : ExtendedState n×(Grid n→ℝ)→ℝ) (hFm : Measurable F) (C : ℝ) (hC : 0≤C)
    (hF : ∀e : ExtendedState n,∀saved : Grid n→ℝ,e.Valid cfg.B→
      (∀p∈E,0≤saved p ∧ saved p≤2*cfg.B)→‖F (e,saved)‖≤C)
    (hn : 0<n) (s : ProtectedTimedState cfg) (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (fun ω=>cumulativeProtectedStateSource cfg ε M L F hn s
      (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω) μ := by
  apply Integrable.of_bound
    (protectedCompletion_evaluate_measurable cfg ε M hn s _
      (cumulativeProtectedStateSource_measurable cfg ε M L F hFm hn s)).aestronglyMeasurable
    ((cfg.horizon:ℝ)*C)
  exact ae_of_all _ (fun ω=>cumulativeProtectedStateSource_bound cfg ε M L hsp E hE F C hC hF hn s hsv _ ω)

theorem terminalProtectedWholeEnergy_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (terminalProtectedCreditEnergy cfg ε M L E hn s) μ ∧
    Integrable (terminalProtectedEntropyEnergy cfg ε M L E hn s) μ ∧
    Integrable (terminalProtectedWholeCost cfg ε M L E hn s) μ := by
  refine ⟨?_,?_,?_⟩
  · exact protectedTerminalStateSource_integrable cfg ε M L hsp E hE (protectedCreditEnergyField cfg L E)
      ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).1.comp measurable_fst)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).1) hn s hsv μ
  · exact protectedTerminalStateSource_integrable cfg ε M L hsp E hE (protectedEntropyEnergyField cfg L E)
      ((protectedWholeEnergyRate_measurable cfg.directions cfg.mask L E cfg.B).2.comp measurable_fst)
      (protectedWholeEnergyCap n cfg.B E.card) (protectedWholeEnergyCap_nonneg n cfg.B E.card hB.le)
      (fun e _ he _=>(protectedWholeEnergyRate_norm_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) hn s hsv μ
  · exact protectedTerminalStateSource_integrable cfg ε M L hsp E hE (protectedWholeCostField cfg L E)
      ((protectedWholeCostRate_measurable cfg.directions cfg.mask L E).comp measurable_fst)
      ((n:ℝ)^2*(cfg.B/n)*((E.card:ℝ)*(2*cfg.B))) (by positivity)
      (fun e _ he _=>(protectedWholeCostRate_bounds e cfg.directions cfg.mask L hsp E hE cfg.B hB he
        (fun q=>⟨cfg.mask_nonneg q,hm q⟩)).2) hn s hsv μ

theorem terminalProtectedEnergy_cost_mean_bound {n : ℕ} (cfg : FlowConfig n) (ε K d γ : ℝ)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1)
    (E : Finset (Grid n)) (hE : E⊆L.val)
    (hn : 2≤n) (hB : 1≤cfg.B) (hd : 0≤d) (hdγ : d≤γ) (hBd : cfg.B≤(n:ℝ)^d)
    (hKcfg : cfg.K≤K) (hK : K<2) (hn0 : 0<n) (hm : ∀q,cfg.mask q≤1) (s : ProtectedTimedState cfg)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K)
    (hsv : ∀p∈E,0≤s.2 p ∧ s.2 p≤2*cfg.B)
    (hready : s.1.val.1.AuxReady cfg.directions ε ((n:ℝ)^γ)) :
    let Q := phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1
    ((1-Real.log 2)*(∫ω,terminalProtectedCreditEnergy cfg ε ((n:ℝ)^γ) L E hn0 s ω ∂Q)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ)*
        ∫ω,terminalProtectedWholeCost cfg ε ((n:ℝ)^γ) L E hn0 s ω ∂Q) ∧
    ((1-Real.log 2)*(∫ω,terminalProtectedEntropyEnergy cfg ε ((n:ℝ)^γ) L E hn0 s ω ∂Q)≤
      ((1+2*(cfg.directions.card:ℝ))*(n:ℝ)^γ*(entropyLogConstant d)^2*(Real.log n)^2)*
        ∫ω,terminalProtectedWholeCost cfg ε ((n:ℝ)^γ) L E hn0 s ω ∂Q) := by
  have hB0 : 0<cfg.B := by linarith
  letI := phaseLineForbiddenLaw_probability cfg ε ((n:ℝ)^γ) K hKcfg hK L hsp N hN hn0 hB0 hm s.1 ho hk
  have hi := terminalProtectedWholeEnergy_integrable cfg ε ((n:ℝ)^γ) L hsp E hE hn0 hB0 hm s hsv
    (phaseLineForbiddenLaw cfg ε ((n:ℝ)^γ) K L N hn0 s.1)
  have hb := protectedCumulativeEnergy_le_cost_ae cfg ε K d γ L hsp N hN E hE hn hB hd hdγ hBd hKcfg hK hn0 s ho hk hready
  dsimp only
  constructor
  · rw [←integral_const_mul,←integral_const_mul]
    apply integral_mono_ae (hi.1.const_mul _) (hi.2.2.const_mul _)
    filter_upwards [hb] with ω hω
    exact (hω (augRecycledCompletionIndex cfg ε ((n:ℝ)^γ) hn0 s.1 ω)).1
  · rw [←integral_const_mul,←integral_const_mul]
    apply integral_mono_ae (hi.2.1.const_mul _) (hi.2.2.const_mul _)
    filter_upwards [hb] with ω hω
    exact (hω (augRecycledCompletionIndex cfg ε ((n:ℝ)^γ) hn0 s.1 ω)).2

end NoThreeLine
#print axioms NoThreeLine.terminalProtectedWholeEnergy_integrable
#print axioms NoThreeLine.terminalProtectedEnergy_cost_mean_bound
