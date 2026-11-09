import NoThreeLine.InvariantRecycledMartingale
import NoThreeLine.PhaseLineForbiddenLaw

/-! The normalized actual line-stage density is a bounded martingale on
the original state history. Its actual terminal density closes it. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem lineStageRegion_measurable {n : ℕ} (cfg : FlowConfig n) (K : ℝ) (L : LineIndex n) (N : ℕ) :
    Measurable (lineStageRegion cfg K L N) := by
  have he : Measurable (fun s : AugTimedState cfg=>s.val.1.physical) :=
    (AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst
  have ho := (ExtendedState.measurable_occupancy n L).comp he
  have hk := ((measurable_pi_apply L).comp (ExtendedState.measurable_clocks n)).comp he
  exact (measurable_const.le' ho).and ((ho.eq_const N).imp (hk.le' measurable_const))

theorem lineStageDensity_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) :
    Martingale (fun k ω=>lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1)
      (augRecycledStateFiltration cfg ε M hn s) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply RecycledBoardProcess.credit_martingale_of_invariant (augRestartStep cfg ε M hn)
    (augRestartStep_measurable cfg ε M hn) _
    (augRestartStep_map cfg ε M hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (lineStageDensity cfg K L N s) (lineStageDensity_measurable cfg K L N s)
    ((2/(2-K))^2) (fun v=>lineStageDensity_bounds cfg K hK L N hN s v hk)
    (lineStageRegion cfg K L N) (lineStageRegion_measurable cfg K L N)
    (fun v hv ω=>lineStageRegion_step cfg ε M K hKcfg L hsp N hN v hv _) _ s ⟨ho.ge,fun _=>hk⟩
  intro v hv
  change (∫ω,Real.exp (-specifiedClockHazardPotential N (s.val.1.physical.clocks L))*
      lineStageValue cfg K L N (augTimedClockStep cfg ε M hn (v,ω)) ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_const_mul,lineStageValue_step_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm v hv]
  rfl

theorem terminalLineStageDensity_condExp {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ) :
    condExp (augRecycledStateFiltration cfg ε M hn s k) (boardClockMeasure n (cfg.B/n))
      (terminalLineStageDensity cfg ε M K L N hn s)=ᵐ[boardClockMeasure n (cfg.B/n)]
      (fun ω=>lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply martingale_terminal_condExp _ (augRecycledStateFiltration cfg ε M hn s)
    (fun j ω=>lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s j ω).1)
    (lineStageDensity_martingale cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk) ((2/(2-K))^2)
  · intro j ω
    have hb := lineStageDensity_bounds cfg K hK L N hN s (augRecycledPair cfg ε M hn s j ω).1 hk
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  · exact terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s
  · filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s] with ω hω
    exact hω.mono (fun j hj=>congrArg (fun v=>lineStageDensity cfg K L N s v.1) hj)

theorem phaseLineForbiddenLaw_history_event {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (hk : s.val.1.physical.clocks L≤K) (k : ℕ) (E : Set (BoardClockPath n))
    (hE : MeasurableSet[augRecycledStateFiltration cfg ε M hn s k] E) :
    (phaseLineForbiddenLaw cfg ε M K L N hn s).real E=
      ∫ω in E,lineStageDensity cfg K L N s (augRecycledPair cfg ε M hn s k ω).1 ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact savedCreditMeasure_history_event _ (augRecycledStateFiltration cfg ε M hn s)
    _ _ (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s _ hk).1) k
    (terminalLineStageDensity_condExp cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk k) E hE

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageDensity_martingale
#print axioms NoThreeLine.BirthWitness.terminalLineStageDensity_condExp
#print axioms NoThreeLine.BirthWitness.phaseLineForbiddenLaw_history_event
