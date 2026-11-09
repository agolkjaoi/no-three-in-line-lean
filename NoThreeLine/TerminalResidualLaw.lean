import NoThreeLine.RecycledTerminal

/-! The actual residual board at the random completed segment index has
its original law and is independent of the actual terminal state. This is
proved by finite product laws and almost-sure stabilization of both fields. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem map_pair_with_fresh_right {X Y S : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    [MeasurableSpace S] (μ : Measure X) (ν : Measure Y) [SFinite μ] [SFinite ν]
    (f : X → S) (hf : Measurable f) :
    (μ.prod ν).map (fun z => (f z.1,z.2)) = (μ.map f).prod ν := by
  simpa only [Measure.map_id,Prod.map_def,id_eq] using (Measure.map_prod_map μ ν hf measurable_id).symm

theorem augRecycledTerminalPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (augRecycledTerminalPair cfg ε M hn s) =
      ((boardClockMeasure n (cfg.B/n)).map (augRecycledTerminal cfg ε M hn s)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let ν := boardClockMeasure n (cfg.B/n)
  let μ := Measure.infinitePi (fun _ : ℕ => ν)
  have hg (k : ℕ) : Measurable (fun z : (ℕ → BoardClockPath n) × BoardClockPath n =>
      (augTimedNoiseState cfg ε M hn s k z.1,z.2)) :=
    ((augTimedNoiseState_measurable cfg ε M hn s k).comp measurable_fst).prodMk measurable_snd
  have hG : Measurable (fun z : (ℕ → BoardClockPath n) × BoardClockPath n =>
      (augTimedTerminal cfg ε M hn s z.1,z.2)) :=
    ((augTimedTerminal_measurable cfg ε M hn s).comp measurable_fst).prodMk measurable_snd
  have he (k : ℕ) : ν.map (augRecycledPair cfg ε M hn s k) =
      (μ.prod ν).map (fun z => (augTimedNoiseState cfg ε M hn s k z.1,z.2)) := by
    rw [map_pair_with_fresh_right μ ν _ (augTimedNoiseState_measurable cfg ε M hn s k)]
    change ν.map (augRecycledPair cfg ε M hn s k) =
      (μ.map (GenericCreditIteration.noiseState (augTimedClockStep cfg ε M hn) s k)).prod ν
    rw [FiniteTransitionLaw.noiseState_map _ (augTimedClockStep_measurable cfg ε M hn)]
    exact augRecycledPair_map cfg ε M hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s k
  have hstable : ∀ᵐ z : (ℕ → BoardClockPath n) × BoardClockPath n ∂μ.prod ν,
      ∀ᶠ k in atTop, (augTimedNoiseState cfg ε M hn s k z.1,z.2) =
        (augTimedTerminal cfg ε M hn s z.1,z.2) := by
    have hf : ∀ᵐ z : (ℕ → BoardClockPath n) × BoardClockPath n ∂μ.prod ν,
        ∀ᶠ k in atTop, augTimedNoiseState cfg ε M hn s k z.1 = augTimedTerminal cfg ε M hn s z.1 :=
      Measure.quasiMeasurePreserving_fst.ae (augTimedNoiseState_stabilizes_ae cfg ε M hn hB s)
    filter_upwards [hf] with z hz
    exact hz.mono (fun k hk => Prod.ext hk rfl)
  have h := map_eq_of_eventually_stable_marginals ν (μ.prod ν)
    (augRecycledPair cfg ε M hn s)
    (fun k z => (augTimedNoiseState cfg ε M hn s k z.1,z.2))
    (augRecycledTerminalPair cfg ε M hn s)
    (fun z => (augTimedTerminal cfg ε M hn s z.1,z.2))
    (augRecycledPair_measurable cfg ε M hn s) hg (augRecycledTerminalPair_measurable cfg ε M hn s)
    hG he (augRecycledTerminalPair_stable_ae cfg ε M hn hB s) hstable
  rw [map_pair_with_fresh_right μ ν _ (augTimedTerminal_measurable cfg ε M hn s),
    ← augRecycledTerminal_map cfg ε M hn hB s] at h
  exact h

theorem augRecycledTerminal_residual_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : AugTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => (augRecycledTerminalPair cfg ε M hn s ω).2) =
      boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure ((boardClockMeasure n (cfg.B/n)).map
      (augRecycledTerminal cfg ε M hn s)) :=
    Measure.isProbabilityMeasure_map (augRecycledTerminal_measurable cfg ε M hn s).aemeasurable
  have h := congrArg (fun μ : Measure (AugTimedState cfg × BoardClockPath n) => μ.map Prod.snd)
    (augRecycledTerminalPair_map cfg ε M hn hB s)
  rw [Measure.map_map measurable_snd (augRecycledTerminalPair_measurable cfg ε M hn s),
    Measure.map_snd_prod,measure_univ,one_smul] at h
  exact h

end NoThreeLine

#print axioms NoThreeLine.augRecycledTerminalPair_map
#print axioms NoThreeLine.augRecycledTerminal_residual_map
