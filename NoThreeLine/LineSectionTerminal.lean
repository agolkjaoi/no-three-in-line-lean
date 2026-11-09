import NoThreeLine.LineSectionIteration
import NoThreeLine.ObservedTerminalLaw

/-! Select the additional frozen snapshot at the original physical
completion index. The established original-process completion supplies a.e.
stability, and bounded convergence transports the source-free hierarchy. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set ProbabilityTheory Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

def lineSectionTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (ω : BoardClockPath n) : GoodLineSectionObservation cfg p :=
  RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s
    (augRecycledCompletionIndex cfg ε M hn s.val.1.1 ω) ω

theorem lineSectionTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) : Measurable (lineSectionTerminal cfg ε M start L p E A hn s) := by
  classical
  exact Measurable.find
    (RecycledBoardProcess.state_measurable _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn) s)
    (fun k => (augRecycledCompletionPredicate_measurable cfg ε M hn s.val.1.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.val.1.1)

theorem lineSectionTerminal_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (ω : BoardClockPath n) :
    (lineSectionTerminal cfg ε M start L p E A hn s ω).val.1 =
      observedRecycledTerminal cfg ε M start hn (s.val.1,ω) :=
  congrArg Prod.fst (goodLineSectionRecycled_projection cfg ε M start L p E A hn s _ ω)

theorem goodLineSection_frozen_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (s : GoodLineSectionObservation cfg p) (ω : BoardClockPath n) (k : ℕ)
    (hk : (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.2.1 = true) :
    ∀ j, k ≤ j →
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s j ω).val.2 =
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.2 := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    exact (lineSectionObserverStep_preserves_frozen cfg ε M start L p E A
      ((RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s j ω).val,
        WinnerMarkLaw.firstMarkedRace hn
          (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s j ω).2)
      (by rw [ih]; exact hk)).trans ih

theorem lineSectionTerminal_frozen_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), (lineSectionTerminal cfg ε M start L p E A hn s ω).val.2.1 = true := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1.1] with ω hω
  by_contra hnot
  have hf : (lineSectionTerminal cfg ε M start L p E A hn s ω).val.2.1 = false :=
    Bool.eq_false_iff.mpr hnot
  apply (lineSectionTerminal cfg ε M start L p E A hn s ω).property.1.open_root hf
  left
  rw [lineSectionTerminal_projection]
  change (observedRecycledTerminal cfg ε M start hn (s.val.1,ω)).1.val.2 ≤ 0 ∨
    (observedRecycledTerminal cfg ε M start hn (s.val.1,ω)).1.val.1.physical.process.stopped = true
  rw [observedRecycledTerminal_base]
  exact hω.imp (fun h => h.le) id

theorem lineSectionTerminal_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      (RecycledBoardProcess.state (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).val.2 =
        (lineSectionTerminal cfg ε M start L p E A hn s ω).val.2 := by
  filter_upwards [lineSectionTerminal_frozen_ae cfg ε M start L p E A hn hB s] with ω hω
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s.val.1.1 ω)] with k hk
  exact goodLineSection_frozen_stable cfg ε M start L p E A hn s ω _ hω k hk

theorem lineSectionTerminal_expected_le {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (C labels : Finset (Grid n)) (hn : 0 < n) (hB : 0 < cfg.B)
    (hm : ∀ q, cfg.mask q ≤ 1) (hK : cfg.K < 2) (hCL : C ⊆ labels)
    (s : GoodLineSectionObservation cfg p) :
    (∫ ω, goodLineSectionPhi cfg p C labels (lineSectionTerminal cfg ε M start L p E A hn s ω)
      ∂boardClockMeasure n (cfg.B/n)) ≤ goodLineSectionPhi cfg p C labels s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let F := goodLineSectionRestart cfg ε M start L p E A hn
  have hF := goodLineSectionRestart_measurable cfg ε M start L p E A hn
  let Z := fun k ω => goodLineSectionPhi cfg p C labels (RecycledBoardProcess.state F s k ω)
  let ZT := fun ω => goodLineSectionPhi cfg p C labels (lineSectionTerminal cfg ε M start L p E A hn s ω)
  have hzm (k : ℕ) : AEStronglyMeasurable (Z k) (boardClockMeasure n (cfg.B/n)) :=
    ((goodLineSectionPhi_measurable cfg p C labels).comp (RecycledBoardProcess.state_measurable F hF s k)).aestronglyMeasurable
  have hzb (k : ℕ) : ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ‖Z k ω‖ ≤ mixedCap C cfg.B :=
    Filter.Eventually.of_forall (fun ω => by
      have h := goodLineSectionPhi_bounds cfg p C labels (RecycledBoardProcess.state F s k ω)
      simpa only [Z,Real.norm_eq_abs,abs_of_nonneg h.1] using h.2)
  have hzt : ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), Tendsto (fun k => Z k ω) atTop (𝓝 (ZT ω)) := by
    filter_upwards [lineSectionTerminal_stable_ae cfg ε M start L p E A hn hB s] with ω hω
    apply tendsto_const_nhds.congr'
    filter_upwards [hω] with k hk
    exact congrArg (fun v : Bool × AugmentedState n => correctedPhi cfg.directions C labels v.2) hk.symm
  have hlim := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n => mixedCap C cfg.B)
    hzm (integrable_const _) hzb hzt
  exact le_of_tendsto_of_tendsto hlim tendsto_const_nhds (Filter.Eventually.of_forall
    (goodLineSectionPhi_expected_le cfg ε M start L p E A C labels hn hB hm hK hCL s))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_projection
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_stable_ae
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_expected_le
