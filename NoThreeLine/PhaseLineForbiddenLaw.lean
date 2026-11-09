import NoThreeLine.LineStageSurvival

/-! A normalized forbidden-line law for the complete actual phase, with
bounded density, original-board completion and no line birth at any step.
This alone is not the first-crossing change-of-law theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseLineForbiddenLaw {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (L : LineIndex n) (N : ℕ)
    (hn : 0<n) (s : AugTimedState cfg) : Measure (BoardClockPath n) :=
  savedCreditMeasure (boardClockMeasure n (cfg.B/n)) (terminalLineStageDensity cfg ε M K L N hn s)

theorem phaseLineForbiddenLaw_probability {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) : IsProbabilityMeasure (phaseLineForbiddenLaw cfg ε M K L N hn s) :=
  savedCreditMeasure_probability _ _ (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s _ hk).1)
    (terminalLineStageDensity_mean_one cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk)

theorem phaseLineForbiddenLaw_absolutelyContinuous {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (L : LineIndex n) (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) :
    phaseLineForbiddenLaw cfg ε M K L N hn s ≪ boardClockMeasure n (cfg.B/n) :=
  savedCreditMeasure_absolutelyContinuous _ _

theorem phaseLineForbiddenLaw_no_line_birth {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K) :
    ∀ᵐω ∂phaseLineForbiddenLaw cfg ε M K L N hn s,∀k,
      ¬(timedBirth cfg ε M ((augRecycledPair cfg ε M hn s k ω).1,
          WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) ∧
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2).1.2∈L.val) := by
  have hp : ∀ᵐω ∂phaseLineForbiddenLaw cfg ε M K L N hn s,
      0<terminalLineStageDensity cfg ε M K L N hn s ω :=
    savedCreditMeasure_positive_ae _ _ (terminalLineStageDensity_measurable cfg ε M K L N hn s)
  have hd : ∀ᵐω ∂phaseLineForbiddenLaw cfg ε M K L N hn s,
      AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω) :=
    (phaseLineForbiddenLaw_absolutelyContinuous cfg ε M K L N hn s).ae_le
      (augRecycledTerminal_done_ae cfg ε M hn hB s)
  filter_upwards [hp,hd] with ω hpos hdone
  have ht : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N := by
    by_contra ht
    rw [terminalLineStageDensity_formula cfg ε M K hKcfg L hsp N hN hn s ho hk ω,if_neg ht] at hpos
    exact (lt_irrefl (0:ℝ)) hpos
  exact no_line_birth_of_terminal_occupancy cfg ε M L N hn s ho ω hdone ht

theorem phaseLineForbiddenLaw_event_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B)
    (s : AugTimedState cfg) (hk : s.val.1.physical.clocks L≤K)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet E) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s).real E≤(2/(2-K))^2*(boardClockMeasure n (cfg.B/n)).real E := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [phaseLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s _ hk).1) E hE]
  calc
    _ ≤ ∫_ω in E,(2/(2-K))^2 ∂boardClockMeasure n (cfg.B/n) :=
      integral_mono_ae (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s).integrableOn
        (integrable_const _) (ae_of_all _ (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s _ hk).2))
    _ = _ := by rw [setIntegral_const,smul_eq_mul,mul_comm]

theorem phaseLineForbiddenLaw_event_ge_on_survival {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (E : Set (BoardClockPath n)) (hE : MeasurableSet E)
    (hsurv : ∀ω∈E,occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N) :
    (boardClockMeasure n (cfg.B/n)).real E≤(phaseLineForbiddenLaw cfg ε M K L N hn s).real E := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  rw [phaseLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s _ hk).1) E hE]
  have hleft : (boardClockMeasure n (cfg.B/n)).real E=∫_ω in E,(1:ℝ) ∂boardClockMeasure n (cfg.B/n) := by simp
  rw [hleft]
  apply integral_mono_ae (integrable_const _)
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s).integrableOn
  filter_upwards [ae_restrict_of_ae (augRecycledTerminal_done_ae cfg ε M hn hB s),ae_restrict_mem hE] with ω hd hω
  exact terminalLineStageDensity_ge_one_of_survival cfg ε M K hKcfg hK L hsp N hN hn s ho hk ω hd (hsurv ω hω)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_probability
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_no_line_birth
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_event_ge_on_survival
