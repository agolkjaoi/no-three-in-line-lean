import NoThreeLine.LineSectionCreditTransport
import NoThreeLine.StableResidualProduct

/-! Full additional-contact snapshot and original residual board are
independent at actual completion. Finite expanded-state product laws, not
physical projection alone, supply the result. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def lineSectionTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodLineSectionObservation cfg p × BoardClockPath n) :
    GoodLineSectionObservation cfg p × BoardClockPath n :=
  RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) x.1
    (augRecycledCompletionIndex cfg ε M hn x.1.val.1.1 x.2) x.2

theorem lineSectionTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n) :
    Measurable (lineSectionTerminalPair cfg ε M start L p E A hn) := by
  classical
  exact Measurable.find
    (RecycledBoardProcess.iterate_joint_measurable _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn))
    (fun k => ((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      ((measurable_subtype_coe.fst.fst.comp measurable_fst).prodMk measurable_snd)).setOf)
    (fun x : GoodLineSectionObservation cfg p × BoardClockPath n =>
      augRecycledCompletionPredicate_exists cfg ε M hn x.1.val.1.1 x.2)

theorem lineSectionTerminalPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (x : GoodLineSectionObservation cfg p × BoardClockPath n) :
    ((lineSectionTerminalPair cfg ε M start L p E A hn x).1.val.1,
      (lineSectionTerminalPair cfg ε M start L p E A hn x).2) =
      observedRecycledTerminalPair cfg ε M start hn (x.1.val.1,x.2) :=
  goodLineSectionRecycled_projection cfg ε M start L p E A hn x.1 _ x.2

theorem goodLineSectionIter_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : GoodLineSectionObservation cfg p) (k : ℕ) :
    (boardClockMeasure n rate).map (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k) =
      ((boardClockMeasure n rate).map (fun ω =>
        (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω).1)).prod
          (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  rw [RecycledBoardProcess.iterate_state_map _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn)
    (boardClockMeasure n rate) (goodLineSectionRestart_map cfg ε M start L p E A hn rate hr) s k]
  exact RecycledBoardProcess.iterate_map _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn)
    _ (goodLineSectionRestart_map cfg ε M start L p E A hn rate hr) s k

theorem lineSectionTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ᶠ k in atTop,
      RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s k ω =
        lineSectionTerminalPair cfg ε M start L p E A hn (s,ω) := by
  filter_upwards [lineSectionTerminal_full_stable_ae cfg ε M start L p E A hn hB s,
    observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.val.1] with ω hs hp
  filter_upwards [hs,hp] with k hk hpk
  refine Prod.ext hk ?_
  exact (congrArg Prod.snd (goodLineSectionRecycled_projection cfg ε M start L p E A hn s k ω)).trans
    ((congrArg Prod.snd hpk).trans
      (congrArg Prod.snd (lineSectionTerminalPair_projection cfg ε M start L p E A hn (s,ω))).symm)

theorem lineSectionTerminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : GoodLineSectionObservation cfg p) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => lineSectionTerminalPair cfg ε M start L p E A hn (s,ω)) =
      ((boardClockMeasure n (cfg.B/n)).map (lineSectionTerminal cfg ε M start L p E A hn s)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact residual_product_of_eventually_stable _ _
    (RecycledBoardProcess.iterate (goodLineSectionRestart cfg ε M start L p E A hn) s)
    (fun ω => lineSectionTerminalPair cfg ε M start L p E A hn (s,ω))
    (RecycledBoardProcess.iterate_measurable _ (goodLineSectionRestart_measurable cfg ε M start L p E A hn) s)
    ((lineSectionTerminalPair_measurable cfg ε M start L p E A hn).comp (measurable_const.prodMk measurable_id))
    (goodLineSectionIter_residual_product cfg ε M start L p E A hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s)
    (lineSectionTerminalPair_stable_ae cfg ε M start L p E A hn hB s)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineSectionTerminalPair_measurable
#print axioms NoThreeLine.BirthWitness.lineSectionTerminal_residual_product
