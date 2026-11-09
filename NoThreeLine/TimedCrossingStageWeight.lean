import NoThreeLine.TimedCrossingPhase

/-! The first crossing flag on an unfinished phase uses the true timed
incoming state. Its local integral and survival monotonicity are priced
by the same physical value as the subsequent scheduled phases. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory ProbabilityTheory Set
namespace NoThreeLine
open AuxiliaryODE BirthWitness

theorem timedCrossingPhasePair_flag_stageValue_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hA : Continuous A) (hn : 0<n) (hB : 0<B)
    (b : ℝ) (j : ℕ) (hKcfg : (cs j).K≤K) (hK : K<2) (hsp : specified (cs j).directions L)
    (hN : N≤1) (s : ProtectedTimedState (cs j).config)
    (ho : occupancy s.1.val.1.physical.process L=N) (hk : s.1.val.1.physical.clocks L≤K) :
    let μ := boardClockMeasure n (B/n)
    let F := timedCrossingPhasePair cs ε M deadline start L N E A hn b j
    let V := validLineStageValue (B:=B) K L N
    (∫ω,crossingFlagValue (V (augTimedStateProjection (cs j).config s.1)) (F (s,ω)).1.2 ∂μ)≤
      ∫ω,crossingFlagValue (V (F (s,ω)).1.1.1) (F (s,ω)).1.2 ∂μ := by
  let μ := boardClockMeasure n (B/n)
  let cfg := (cs j).config
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := timedCrossingPhasePair cs ε M deadline start L N E A hn b j
  let U := {ω | (F (s,ω)).1.2=true}
  let V := validLineStageValue (B:=B) K L N
  let e := augTimedStateProjection cfg s.1
  have hm : Measurable (fun ω=>(F (s,ω)).1.2) :=
    (timedCrossingPhasePair_measurable cs ε M deadline start L N E A hA hn b j).fst.snd.comp
      (measurable_const.prodMk measurable_id)
  have hU : MeasurableSet U := measurableSet_eq_fun hm measurable_const
  have he : U=protectedActualExceedance cfg ε M L N E A hn s b := by
    ext ω
    exact timedCrossingPhasePair_flag cs ε M deadline start L N E A hn b j s ω
  have hl := phaseLineForbiddenLaw_protected_firstCrossing_ge cfg ε M K hKcfg hK L hsp N hN hn
    hB (cs j).mask_le_one s ho hk E A hA b
  rw [←he,phaseLineForbiddenLaw,savedCreditMeasure_real_apply _ _
    (terminalLineStageDensity_integrable cfg ε M K hK L N hN hn hB s.1)
    (fun ω=>(lineStageDensity_bounds cfg K hK L N hN s.1 _ hk).1) U hU] at hl
  change (∫ω,crossingFlagValue (V e) (F (s,ω)).1.2 ∂μ)≤
    ∫ω,crossingFlagValue (V (F (s,ω)).1.1.1) (F (s,ω)).1.2 ∂μ
  rw [crossingFlagValue_integral μ _ hm,crossingFlagValue_integral μ _ hm,
    setIntegral_const,smul_eq_mul,mul_comm]
  calc
    V e * μ.real U ≤ V e * (∫ω in U,terminalLineStageDensity cfg ε M K L N hn s.1 ω ∂μ) :=
      mul_le_mul_of_nonneg_left hl (validLineStageValue_bounds K hK L N hN e).1
    _ = ∫ω in U,V (F (s,ω)).1.1.1 ∂μ := by
      rw [←integral_const_mul]
      apply integral_congr_ae
      exact ae_of_all _ (fun ω=>by
        change V e * terminalLineStageDensity cfg ε M K L N hn s.1 ω=V (F (s,ω)).1.1.1
        have hp : (F (s,ω)).1.1.1=finishRestartedPhase cs deadline start j
            (augRecycledTerminal cfg ε M hn s.1 ω) :=
          congrArg Prod.fst (timedCrossingPhasePair_projection cs ε M deadline start L N E A hn b j s ω)
        rw [hp]
        change V e * (Real.exp (-specifiedClockHazardPotential N (e.val.physical.clocks L))*
          V (augTimedStateProjection cfg (augRecycledTerminal cfg ε M hn s.1 ω))) =
          V (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
            (augTimedStateProjection cfg (augRecycledTerminal cfg ε M hn s.1 ω)))
        rw [show V (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
            (augTimedStateProjection cfg (augRecycledTerminal cfg ε M hn s.1 ω))) =
            V (augTimedStateProjection cfg (augRecycledTerminal cfg ε M hn s.1 ω)) from
          validLineStageValue_retire K L N deadline _ _,←mul_assoc]
        have h1 : V e * Real.exp (-specifiedClockHazardPotential N (e.val.physical.clocks L))=1 := by
          rw [mul_comm]
          exact validLineStageDensity_self K L N e ho hk
        rw [h1,one_mul])

theorem timedCrossingPhasePair_stage_region {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (hKcfg : (cs j).K≤K) (hsp : specified (cs j).directions L) (hN : N≤1)
    (s : ProtectedTimedState (cs j).config) (hs : lineStageRegion (cs j).config K L N s.1)
    (ω : BoardClockPath n) :
    validLineStageRegion K L N (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 := by
  have hp := congrArg Prod.fst (timedCrossingPhasePair_projection cs ε M deadline start L N E A hn b j s ω)
  change (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 =
    finishRestartedPhase cs deadline start j (augRecycledTerminal (cs j).config ε M hn s.1 ω) at hp
  rw [hp,finishRestartedPhase,validLineStageRegion_retire]
  exact lineStageRegion_recycled (cs j).config ε M K hKcfg L hsp N hN hn s.1 hs _ ω

theorem timedCrossingPhasePair_stageValue_ge_on_survival {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (L : LineIndex n) (N : ℕ)
    (E : Finset (Grid n)) (A : ℝ→ℝ) (hn : 0<n) (b : ℝ) (j : ℕ)
    (hKcfg : (cs j).K≤K) (hK : K<2) (hsp : specified (cs j).directions L) (hN : N≤1)
    (s : ProtectedTimedState (cs j).config) (ho : occupancy s.1.val.1.physical.process L=N)
    (hk : s.1.val.1.physical.clocks L≤K) (ω : BoardClockPath n)
    (hkeep : occupancy (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1.val.physical.process L=N) :
    validLineStageValue K L N (augTimedStateProjection (cs j).config s.1)≤
      validLineStageValue K L N (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 := by
  let cfg := (cs j).config
  let e := augTimedStateProjection cfg s.1
  let v := augRecycledTerminal cfg ε M hn s.1 ω
  have hp : (timedCrossingPhasePair cs ε M deadline start L N E A hn b j (s,ω)).1.1.1 =
      finishRestartedPhase cs deadline start j v :=
    congrArg Prod.fst (timedCrossingPhasePair_projection cs ε M deadline start L N E A hn b j s ω)
  rw [hp,finishRestartedPhase,augValidDeadlineRetirement_occupancy] at hkeep
  rw [hp,finishRestartedPhase,validLineStageValue_retire]
  have h := lineStageDensity_recycled_ge_one cfg ε M K hKcfg hK L hsp N hN hn s.1 ho hk
    (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω hkeep
  apply (mul_le_mul_iff_of_pos_left (Real.exp_pos (-specifiedClockHazardPotential N (e.val.physical.clocks L)))).mp
  change lineStageDensity cfg K L N s.1 s.1≤lineStageDensity cfg K L N s.1 v
  rw [lineStageDensity_self cfg K L N s.1 ho hk]
  exact h

end NoThreeLine

#print axioms NoThreeLine.timedCrossingPhasePair_flag_stageValue_le
#print axioms NoThreeLine.timedCrossingPhasePair_stage_region
#print axioms NoThreeLine.timedCrossingPhasePair_stageValue_ge_on_survival

