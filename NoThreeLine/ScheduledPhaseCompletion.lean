import NoThreeLine.ScheduledCutBirthMean

/-! Actual phase completion after a random inherited phase state. The
original residual-board product law supplies the conditional clock law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness

theorem phaseTerminalDone_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n) :
    Measurable (fun x : GoodPhaseObservation n cfg.B×BoardClockPath n=>
      AugTimedDone cfg (augRecycledTerminal cfg ε M hn (goodPhaseStart cfg ε M x.1).val.1 x.2)) :=
  (augTimedDone_measurable cfg).comp ((augRecycledTerminalPair_joint_measurable cfg ε M hn).fst.comp
    (((goodPhaseStart_measurable cfg ε M).subtype_val.fst.comp measurable_fst).prodMk measurable_snd))

theorem phaseTerminalDone_prod_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (μ : Measure (GoodPhaseObservation n cfg.B)) [IsProbabilityMeasure μ] :
    ∀ᵐx∂μ.prod (boardClockMeasure n (cfg.B/n)),
      AugTimedDone cfg (augRecycledTerminal cfg ε M hn (goodPhaseStart cfg ε M x.1).val.1 x.2) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply (Measure.ae_prod_iff_ae_ae (phaseTerminalDone_measurable cfg ε M hn).setOf).mpr
  exact Filter.Eventually.of_forall (fun s=>augRecycledTerminal_done_ae cfg ε M hn hB (goodPhaseStart cfg ε M s).val.1)

theorem scheduledPhaseCompletion_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseObservation n B) (N : ℕ) :
    ∀ᵐω∂boardClockMeasure n (B/n),
      AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
        (goodPhaseStart (cs N).config ε M (goodPhases cs ε M deadline start hn s N ω).1).val.1
        (goodPhases cs ε M deadline start hn s N ω).2) := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s N
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s N
  have hh := phaseTerminalDone_prod_ae (cs N).config ε M hn hB μ
  have he : ν.map (goodPhases cs ε M deadline start hn s N)=μ.prod ν :=
    goodPhases_residual_product cs ε M deadline start hn hB s N
  rw [←he] at hh
  exact ae_of_ae_map (goodPhases_measurable cs ε M deadline start hn s N).aemeasurable hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledPhaseCompletion_ae
