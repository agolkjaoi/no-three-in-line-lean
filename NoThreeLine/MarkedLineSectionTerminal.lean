import NoThreeLine.GoodMarkedLineSection

/-! Actual completion and full residual independence for the permanently
marked section observer. The underlying contact observer is projected
exactly, so its source-free mean and credit-gap transport apply directly. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def markedSectionTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) : GoodMarkedLineSection cfg p × BoardClockPath n :=
  RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) x.1
    (augRecycledCompletionIndex cfg ε M hn x.1.val.1.1.1 x.2) x.2

theorem markedSectionTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (markedSectionTerminalPair cfg ε M start L p E A hn) := by
  classical
  exact Measurable.find
    (RecycledBoardProcess.iterate_joint_measurable _ (goodMarkedRestart_measurable cfg ε M start L p E A hn))
    (fun k => ((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      ((measurable_subtype_coe.fst.fst.fst.comp measurable_fst).prodMk measurable_snd)).setOf)
    (fun x : GoodMarkedLineSection cfg p × BoardClockPath n =>
      augRecycledCompletionPredicate_exists cfg ε M hn x.1.val.1.1.1 x.2)

theorem markedSectionTerminalPair_core {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) :
    (goodMarkedCore cfg p (markedSectionTerminalPair cfg ε M start L p E A hn x).1,
      (markedSectionTerminalPair cfg ε M start L p E A hn x).2) =
      lineSectionTerminalPair cfg ε M start L p E A hn (goodMarkedCore cfg p x.1,x.2) :=
  goodMarkedIterate_core cfg ε M start L p E A hn x.1 _ x.2

theorem markedSectionTerminalPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodMarkedLineSection cfg p × BoardClockPath n) :
    ((markedSectionTerminalPair cfg ε M start L p E A hn x).1.val.1.1,
      (markedSectionTerminalPair cfg ε M start L p E A hn x).2) =
      observedRecycledTerminalPair cfg ε M start hn (x.1.val.1.1,x.2) :=
  (congrArg (fun v : GoodLineSectionObservation cfg p × BoardClockPath n => (v.1.val.1,v.2))
    (markedSectionTerminalPair_core cfg ε M start L p E A hn x)).trans
    (lineSectionTerminalPair_projection cfg ε M start L p E A hn (goodMarkedCore cfg p x.1,x.2))

theorem goodMarkedRestart_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (hd : observationDone cfg s.val.1.1) (ω : BoardClockPath n) :
    goodMarkedRestart cfg ε M start L p E A hn (s,ω) = (s,ω) := by
  change s.val.1.1.1.val.2 ≤ 0 ∨ s.val.1.1.1.val.1.physical.process.stopped = true at hd
  simp only [goodMarkedRestart,goodMarkedStep_done cfg ε M start L p E A s hd,
    augResidualBoard,if_pos hd]

theorem goodMarkedIterate_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodMarkedLineSection cfg p) (ω : BoardClockPath n) (k : ℕ)
    (hk : observationDone cfg
      (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1.val.1.1) :
    ∀ j, k ≤ j → RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s j ω =
      RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    rw [RecycledBoardProcess.iterate,ih]
    exact goodMarkedRestart_done cfg ε M start L p E A hn _ hk _

theorem markedSectionTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodMarkedLineSection cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω =
        markedSectionTerminalPair cfg ε M start L p E A hn (s,ω) := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1.1.1] with ω hd
  have hdone : observationDone cfg (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1 := by
    have hp := congrArg (fun v : TimedObservation cfg × BoardClockPath n => v.1.1)
      (markedSectionTerminalPair_projection cfg ε M start L p E A hn (s,ω))
    change (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1.1 =
      (observedRecycledTerminal cfg ε M start hn (s.val.1.1,ω)).1 at hp
    rw [observedRecycledTerminal_base] at hp
    change (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1.1.val.2 ≤ 0 ∨
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.1.1.val.1.physical.process.stopped = true
    rw [hp]
    exact hd.imp (fun h => h.le) id
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s.val.1.1.1 ω)] with k hk
  exact goodMarkedIterate_absorbing cfg ε M start L p E A hn s ω _ hdone k hk

theorem goodMarkedIterate_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodMarkedLineSection cfg p) (k : ℕ) :
    (boardClockMeasure n rate).map (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k) =
      ((boardClockMeasure n rate).map (fun ω =>
        (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s k ω).1)).prod
          (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  rw [RecycledBoardProcess.iterate_state_map _ (goodMarkedRestart_measurable cfg ε M start L p E A hn)
    _ (goodMarkedRestart_map cfg ε M start L p E A hn rate hr) s k]
  exact RecycledBoardProcess.iterate_map _ (goodMarkedRestart_measurable cfg ε M start L p E A hn)
    _ (goodMarkedRestart_map cfg ε M start L p E A hn rate hr) s k

theorem markedSectionTerminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodMarkedLineSection cfg p) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)) =
      ((boardClockMeasure n (cfg.B/n)).map (fun ω =>
        (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1)).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact residual_product_of_eventually_stable _ _
    (RecycledBoardProcess.iterate (goodMarkedRestart cfg ε M start L p E A hn) s)
    (fun ω => markedSectionTerminalPair cfg ε M start L p E A hn (s,ω))
    (RecycledBoardProcess.iterate_measurable _ (goodMarkedRestart_measurable cfg ε M start L p E A hn) s)
    ((markedSectionTerminalPair_measurable cfg ε M start L p E A hn).comp (measurable_const.prodMk measurable_id))
    (goodMarkedIterate_residual_product cfg ε M start L p E A hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s)
    (markedSectionTerminalPair_stable_ae cfg ε M start L p E A hn hB s)

theorem markedSectionTerminal_mixed_mean_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2)
    (s : GoodMarkedLineSection cfg p) (C labels : Finset (Grid n)) (hCL : C ⊆ labels) :
    (∫ ω, correctedPhi cfg.directions C labels
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2
      ∂boardClockMeasure n (cfg.B/n)) ≤ correctedPhi cfg.directions C labels s.val.1.2.2 := by
  have he (ω : BoardClockPath n) :
      (markedSectionTerminalPair cfg ε M start L p E A hn (s,ω)).1.val.1.2.2 =
      (lineSectionTerminal cfg ε M start L p E A hn (goodMarkedCore cfg p s) ω).val.2.2 :=
    congrArg (fun v : GoodLineSectionObservation cfg p × BoardClockPath n => v.1.val.2.2)
      (markedSectionTerminalPair_core cfg ε M start L p E A hn (s,ω))
  simp_rw [he]
  exact lineSectionTerminal_expected_le cfg ε M start L p E A C labels hn hB hm hK hCL (goodMarkedCore cfg p s)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_residual_product
#print axioms NoThreeLine.BirthWitness.markedSectionTerminal_mixed_mean_le
