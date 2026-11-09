import NoThreeLine.ScheduledCrossingKernel

/-! A marked phase can be priced by the same terminal physical stage
value used by all later phases. Its flag may occur before a later line
birth in this phase, as in the continuous first-crossing comparison. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem scheduledCrossingPair_terminalDensity {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (s : ProtectedPhaseState n B) (ω : BoardClockPath n) :
    let a := protectedPhaseStart (cs j).config ε M s
    terminalLineStageDensity (cs j).config ε M K L N hn a.1 ω=
      validLineStageDensity K L N s.1
        (scheduledCrossingPair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 := by
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let r := protectedRecycledTerminalPair cfg ε M L hn a ω
  have hr := congrArg Prod.fst (protectedRecycledTerminalPair_projection cfg ε M L hn a ω)
  change r.1.1=augRecycledTerminal cfg ε M hn a.1 ω at hr
  change lineStageDensity cfg K L N a.1 (augRecycledTerminal cfg ε M hn a.1 ω)=
    validLineStageDensity K L N s.1
      (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
        (augTimedStateProjection cfg r.1.1))
  rw [←hr]
  unfold validLineStageDensity
  rw [validLineStageValue_retire]
  rfl

theorem scheduledCrossingPair_flag_terminal_lower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j : ℕ) (hKcfg : (cs j).K≤K) (hK : K<2) (hsp : specified (cs j).directions L)
    (hN : N≤1) (s : ProtectedPhaseState n B)
    (ho : occupancy s.1.val.physical.process L=N) (hk : s.1.val.physical.clocks L≤K) :
    let μ := boardClockMeasure n (B/n)
    let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
    let U := {ω | (F (s,ω)).1.2=true}
    μ.real U≤∫ ω in U,validLineStageDensity K L N s.1 (F (s,ω)).1.1.1 ∂μ := by
  let cfg := (cs j).config
  let a := protectedPhaseStart cfg ε M s
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := scheduledCrossingPair cs ε M deadline start L N E A hn b j
  let U := {ω | (F (s,ω)).1.2=true}
  have hU : MeasurableSet U := measurableSet_eq_fun
    ((scheduledCrossingPair_measurable cs ε M deadline start L N E A hA hn b j).comp
      (measurable_const.prodMk measurable_id)).fst.snd measurable_const
  have he : U=protectedActualExceedance cfg ε M L N E A hn a b := by
    ext ω
    exact scheduledCrossingPair_flag cs ε M deadline start L N E A hn b j (s,ω)
  have h := phaseLineForbiddenLaw_protected_firstCrossing_ge cfg ε M K hKcfg hK L hsp N hN hn
    hB (cs j).mask_le_one a ho hk E A hA b
  rw [←he,phaseLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB a.1)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN a.1 _ hk).1) U hU] at h
  calc
    μ.real U ≤ ∫ω in U,terminalLineStageDensity cfg ε M K L N hn a.1 ω ∂μ := h
    _ = ∫ω in U,validLineStageDensity K L N s.1 (F (s,ω)).1.1.1 ∂μ :=
      integral_congr_ae (ae_of_all _ (scheduledCrossingPair_terminalDensity cs ε M K deadline start
        L N E A hn b j s))

end NoThreeLine

#print axioms NoThreeLine.scheduledCrossingPair_terminalDensity
#print axioms NoThreeLine.scheduledCrossingPair_flag_terminal_lower

