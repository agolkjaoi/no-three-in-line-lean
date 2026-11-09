import NoThreeLine.ScheduledLineStagePath

/-! Actual phase completion from any inherited valid augmented state.
The original-board state/residual product supplies each conditional law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness

theorem validPhaseTerminalDone_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n) :
    Measurable (fun x : ValidAugmentedState n cfg.B×BoardClockPath n=>
      AugTimedDone cfg (augRecycledTerminal cfg ε M hn (augPhaseStart cfg ε M x.1) x.2)) :=
  (augTimedDone_measurable cfg).comp ((augRecycledTerminalPair_joint_measurable cfg ε M hn).fst.comp
    (((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd))

theorem validPhaseTerminalDone_prod_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (μ : Measure (ValidAugmentedState n cfg.B)) [IsProbabilityMeasure μ] :
    ∀ᵐx∂μ.prod (boardClockMeasure n (cfg.B/n)),
      AugTimedDone cfg (augRecycledTerminal cfg ε M hn (augPhaseStart cfg ε M x.1) x.2) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply (Measure.ae_prod_iff_ae_ae (validPhaseTerminalDone_measurable cfg ε M hn).setOf).mpr
  exact Filter.Eventually.of_forall (fun e=>augRecycledTerminal_done_ae cfg ε M hn hB (augPhaseStart cfg ε M e))

theorem validScheduledPhaseCompletion_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) (j : ℕ) :
    ∀ᵐω∂boardClockMeasure n (B/n),
      AugTimedDone (cs j).config (augRecycledTerminal (cs j).config ε M hn
        (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
        (recycledPhases cs ε M deadline start hn e j ω).2) := by
  let ν := boardClockMeasure n (B/n)
  let μ := ν.map (recycledPhaseState cs ε M deadline start hn e j)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map
    (recycledPhaseState_measurable cs ε M deadline start hn e j).aemeasurable
  have hh := validPhaseTerminalDone_prod_ae (cs j).config ε M hn hB μ
  have he : ν.map (fun ω=>(recycledPhaseState cs ε M deadline start hn e j ω,
      (recycledPhases cs ε M deadline start hn e j ω).2))=μ.prod ν := by
    dsimp [μ,ν]
    rw [recycledPhaseState_map cs ε M deadline start hn hB e j]
    exact recycledPhases_state_residual_map cs ε M deadline start hn hB e j
  rw [←he] at hh
  exact ae_of_ae_map ((recycledPhaseState_measurable cs ε M deadline start hn e j).prodMk
    (recycledPhases_measurable cs ε M deadline start hn e j).snd).aemeasurable hh

theorem validScheduledPhasesCompletion_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (e : ValidAugmentedState n B) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀j,
      AugTimedDone (cs j).config (augRecycledTerminal (cs j).config ε M hn
        (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
        (recycledPhases cs ε M deadline start hn e j ω).2) :=
  ae_all_iff.mpr (fun j=>validScheduledPhaseCompletion_ae cs ε M deadline start hn hB e j)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.validScheduledPhasesCompletion_ae
