import NoThreeLine.ProtectedLedgerStageBounds
import NoThreeLine.LineStageConditionalLikelihood

/-! The real terminal forbidden-line density closes its martingale even
on histories containing the entire saved protected ledger. This uses the
actual ledger/residual product, not only the projected physical history. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def protectedStateFiltration {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : ProtectedTimedState cfg) :
    Filtration ℕ (inferInstance : MeasurableSpace (BoardClockPath n)) :=
  StateHistory.filtration (fun k ω=>(protectedRecycledPair cfg ε M L hn s k ω).1)
    (fun k=>(protectedRecycledPair_measurable cfg ε M L hn s k).fst)

theorem protectedLineStageDensity_martingale {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) :
    Martingale (fun k ω=>lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1)
      (protectedStateFiltration cfg ε M L hn s) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply RecycledBoardProcess.credit_martingale_of_invariant (protectedRestartStep cfg ε M L hn)
    (protectedRestartStep_measurable cfg ε M L hn) _
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)))
    (fun v : ProtectedTimedState cfg=>lineStageDensity cfg K L N s.1 v.1)
    ((lineStageDensity_measurable cfg K L N s.1).comp measurable_fst)
    ((2/(2-K))^2) (fun v=>lineStageDensity_bounds cfg K hK L N hN s.1 v.1 hk)
    (fun v : ProtectedTimedState cfg=>lineStageRegion cfg K L N v.1)
    ((lineStageRegion_measurable cfg K L N).comp measurable_fst)
    (fun v hv ω=>lineStageRegion_step cfg ε M K hKcfg L hsp N hN v.1 hv _) _ s ⟨ho.ge,fun _=>hk⟩
  intro v hv
  change (∫ω,Real.exp (-specifiedClockHazardPotential N (s.1.val.1.physical.clocks L))*
    lineStageValue cfg K L N (augTimedClockStep cfg ε M hn (v.1,ω)) ∂boardClockMeasure n (cfg.B/n))=_
  rw [integral_const_mul,lineStageValue_step_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm v.1 hv]
  rfl

theorem terminalLineStageDensity_protected_condExp {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (k : ℕ) :
    condExp (protectedStateFiltration cfg ε M L hn s k) (boardClockMeasure n (cfg.B/n))
      (terminalLineStageDensity cfg ε M K L N hn s.1)=ᵐ[boardClockMeasure n (cfg.B/n)]
      (fun ω=>lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply martingale_terminal_condExp _ (protectedStateFiltration cfg ε M L hn s)
    (fun j ω=>lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s j ω).1.1)
    (protectedLineStageDensity_martingale cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk) ((2/(2-K))^2)
  · intro j ω
    have hb := lineStageDensity_bounds cfg K hK L N hN s.1 (protectedRecycledPair cfg ε M L hn s j ω).1.1 hk
    simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2
  · exact terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s.1
  · filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s.1] with ω hω
    apply hω.mono
    intro j hj
    have hp := congrArg Prod.fst (protectedRecycledPair_projection cfg ε M L hn s j ω)
    rw [hp]
    exact congrArg (fun v=>lineStageDensity cfg K L N s.1 v.1) hj

theorem phaseLineForbiddenLaw_protected_history_integral {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : ProtectedTimedState cfg) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (k : ℕ) (f : BoardClockPath n→ℝ)
    (hf : @Measurable _ _ (protectedStateFiltration cfg ε M L hn s k) inferInstance f)
    (hi : Integrable (fun ω=>terminalLineStageDensity cfg ε M K L N hn s.1 ω*f ω)
      (boardClockMeasure n (cfg.B/n))) :
    (∫ω,f ω ∂phaseLineForbiddenLaw cfg ε M K L N hn s.1)=
      ∫ω,lineStageDensity cfg K L N s.1 (protectedRecycledPair cfg ε M L hn s k ω).1.1*f ω
        ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact savedCreditMeasure_history_integral _ (protectedStateFiltration cfg ε M L hn s)
    _ _ (terminalLineStageDensity_measurable cfg ε M K L N hn s.1)
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s.1)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s.1 _ hk).1) k
    (terminalLineStageDensity_protected_condExp cfg ε M K hKcfg hK L hsp N hN hn hB hm s ho hk k) f hf hi

end NoThreeLine

#print axioms NoThreeLine.protectedLineStageDensity_martingale
#print axioms NoThreeLine.terminalLineStageDensity_protected_condExp
#print axioms NoThreeLine.phaseLineForbiddenLaw_protected_history_integral
