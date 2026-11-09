import NoThreeLine.ObservedRecycledTerminal

/-! The actual original-board terminal state, birth records, and remaining
board have exactly the iid terminal-observer times independent-board law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine.BirthWitness

theorem observedRecycledTerminalPair_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => observedRecycledTerminalPair cfg ε M start hn (s,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
        (fun ω => observedTerminal cfg ε M start hn (s,ω))).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let ν := boardClockMeasure n (cfg.B/n)
  let μ := FreshBoardWaits.freshBoardMeasure n (cfg.B/n)
  letI := phaseNoise_probability cfg hn hB
  have hns (k : ℕ) : Measurable (observedNoiseState cfg ε M start hn s k) :=
    (observedNoiseState_joint_measurable cfg ε M start hn k).comp (measurable_const.prodMk measurable_id)
  have hnt : Measurable (fun ω : PhaseNoise n => observedTerminal cfg ε M start hn (s,ω)) :=
    (observedTerminal_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  have hrt : Measurable (fun ω : BoardClockPath n => observedRecycledTerminalPair cfg ε M start hn (s,ω)) :=
    (observedRecycledTerminalPair_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  have hg (k : ℕ) : Measurable (fun z : PhaseNoise n × BoardClockPath n =>
      (observedNoiseState cfg ε M start hn s k z.1,z.2)) :=
    ((hns k).comp measurable_fst).prodMk measurable_snd
  have hG : Measurable (fun z : PhaseNoise n × BoardClockPath n =>
      (observedTerminal cfg ε M start hn (s,z.1),z.2)) :=
    (hnt.comp measurable_fst).prodMk measurable_snd
  have he (k : ℕ) : ν.map (observedRecycledPair cfg ε M start hn s k) =
      (μ.prod ν).map (fun z => (observedNoiseState cfg ε M start hn s k z.1,z.2)) := by
    rw [map_pair_with_fresh_right μ ν _ (hns k)]
    change ν.map (observedRecycledPair cfg ε M start hn s k) =
      ((Measure.infinitePi (fun _ : ℕ => ν)).map
        (GenericCreditIteration.noiseState (observedClockStep cfg ε M start hn) s k)).prod ν
    rw [FiniteTransitionLaw.noiseState_map _ (observedClockStep_measurable cfg ε M start hn)]
    exact observedRecycledPair_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s k
  have hstable : ∀ᵐ z : PhaseNoise n × BoardClockPath n ∂μ.prod ν, ∀ᶠ k in atTop,
      (observedNoiseState cfg ε M start hn s k z.1,z.2) = (observedTerminal cfg ε M start hn (s,z.1),z.2) := by
    have hf : ∀ᵐ z : PhaseNoise n × BoardClockPath n ∂μ.prod ν, ∀ᶠ k in atTop,
        observedNoiseState cfg ε M start hn s k z.1 = observedTerminal cfg ε M start hn (s,z.1) :=
      Measure.quasiMeasurePreserving_fst.ae (observedTerminal_stable_ae cfg ε M start hn hB s)
    filter_upwards [hf] with z hz
    exact hz.mono (fun k hk => Prod.ext hk rfl)
  have h := map_eq_of_eventually_stable_marginals ν (μ.prod ν)
    (observedRecycledPair cfg ε M start hn s)
    (fun k z => (observedNoiseState cfg ε M start hn s k z.1,z.2))
    (fun ω => observedRecycledTerminalPair cfg ε M start hn (s,ω))
    (fun z => (observedTerminal cfg ε M start hn (s,z.1),z.2))
    (observedRecycledPair_measurable cfg ε M start hn s) hg hrt hG he
    (observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s) hstable
  rw [map_pair_with_fresh_right μ ν _ hnt] at h
  exact h

theorem observedRecycledTerminal_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => observedRecycledTerminal cfg ε M start hn (s,ω)) =
      (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map (fun ω => observedTerminal cfg ε M start hn (s,ω)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have ht : Measurable (fun ω : BoardClockPath n => observedRecycledTerminalPair cfg ε M start hn (s,ω)) :=
    (observedRecycledTerminalPair_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  have h := congrArg (fun μ : Measure (TimedObservation cfg × BoardClockPath n) => μ.map Prod.fst)
    (observedRecycledTerminalPair_map cfg ε M start hn hB s)
  rw [Measure.map_map measurable_fst ht,Measure.map_fst_prod,measure_univ,one_smul] at h
  exact h

theorem observedRecycledTerminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : TimedObservation cfg) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => observedRecycledTerminalPair cfg ε M start hn (s,ω)) =
      ((boardClockMeasure n (cfg.B/n)).map
        (fun ω => observedRecycledTerminal cfg ε M start hn (s,ω))).prod (boardClockMeasure n (cfg.B/n)) := by
  rw [observedRecycledTerminal_map cfg ε M start hn hB s]
  exact observedRecycledTerminalPair_map cfg ε M start hn hB s

theorem observedRecycledTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedObservation cfg) (p : Grid n) :
    (∫ ω, augTimedCredit cfg p (observedRecycledTerminal cfg ε M start hn (s,ω)).1
      ∂boardClockMeasure n (cfg.B/n)) = augTimedCredit cfg p s.1 := by
  simp only [observedRecycledTerminal_base]
  exact augRecycledTerminal_expected_credit cfg ε M hn hB hm s.1 p

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledTerminalPair_map
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_residual_product
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_expected_credit
