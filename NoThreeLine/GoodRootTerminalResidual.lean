import NoThreeLine.RootTerminalResidual
import NoThreeLine.RootFreezeKernel

/-! Terminal product law on the actual invariant subtype, including empty
line credits. The subtype is evolved by its proved transition; no measurable
invariant-set extension or assumption of a terminal law is used. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine.BirthWitness

def goodRootTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : GoodRootObservation cfg p×BoardClockPath n) : GoodRootObservation cfg p×BoardClockPath n :=
  RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) x.1
    (augRecycledCompletionIndex cfg ε M hn x.1.val.1.1 x.2) x.2

theorem goodRootTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (goodRootTerminalPair cfg ε M start p hn) := by
  classical
  exact Measurable.find
    (RecycledBoardProcess.iterate_joint_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn))
    (fun k=>((augRecycledCompletionPredicate_joint_measurable cfg ε M hn k).comp
      ((measurable_subtype_coe.fst.fst.comp measurable_fst).prodMk measurable_snd)).setOf)
    (fun x : GoodRootObservation cfg p×BoardClockPath n=>augRecycledCompletionPredicate_exists cfg ε M hn x.1.val.1.1 x.2)

theorem goodRootTerminalPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : GoodRootObservation cfg p×BoardClockPath n) :
    ((goodRootTerminalPair cfg ε M start p hn x).1.val,(goodRootTerminalPair cfg ε M start p hn x).2)=
      rootObserverTerminalPair cfg ε M start p hn (x.1.val,x.2) :=
  goodRootRecycled_projection cfg ε M start p hn x.1 _ x.2

theorem goodRootIter_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : GoodRootObservation cfg p) (k : ℕ) :
    (boardClockMeasure n rate).map (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k)=
      ((boardClockMeasure n rate).map
        (fun ω=>(RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω).1)).prod
          (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  let F := goodRootRestartStep cfg ε M start p hn
  have hF : Measurable F := goodRootRestartStep_measurable cfg ε M start p hn
  have hm := RecycledBoardProcess.iterate_map F hF (boardClockMeasure n rate)
    (goodRootRestartStep_map cfg ε M start p hn rate hr) s k
  have hp := congrArg (fun μ : Measure (GoodRootObservation cfg p×BoardClockPath n)=>μ.map Prod.fst) hm
  rw [Measure.map_map measurable_fst (RecycledBoardProcess.iterate_measurable F hF s k),
    Measure.map_fst_prod,measure_univ,one_smul] at hp
  rw [hm]
  exact congrArg (fun μ : Measure (GoodRootObservation cfg p)=>μ.prod (boardClockMeasure n rate)) hp.symm

theorem goodRootTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : GoodRootObservation cfg p) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s k ω=
        goodRootTerminalPair cfg ε M start p hn (s,ω) := by
  filter_upwards [rootObserverTerminalPair_stable_ae cfg ε M start p hn hB s.val s.property.1] with ω hω
  filter_upwards [hω] with k hk
  have hp := (goodRootRecycled_projection cfg ε M start p hn s k ω).trans
    (hk.trans (goodRootTerminalPair_projection cfg ε M start p hn (s,ω)).symm)
  apply Prod.ext
  · apply Subtype.ext
    exact congrArg (fun r : RootObservation cfg×BoardClockPath n=>r.1) hp
  · exact congrArg (fun r : RootObservation cfg×BoardClockPath n=>r.2) hp

theorem goodRootTerminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : GoodRootObservation cfg p) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>goodRootTerminalPair cfg ε M start p hn (s,ω))=
      ((boardClockMeasure n (cfg.B/n)).map
        (fun ω=>(goodRootTerminalPair cfg ε M start p hn (s,ω)).1)).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact residual_product_of_eventually_stable (boardClockMeasure n (cfg.B/n)) (boardClockMeasure n (cfg.B/n))
    (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s)
    (fun ω=>goodRootTerminalPair cfg ε M start p hn (s,ω))
    (RecycledBoardProcess.iterate_measurable _ (goodRootRestartStep_measurable cfg ε M start p hn) s)
    ((goodRootTerminalPair_measurable cfg ε M start p hn).comp (measurable_const.prodMk measurable_id))
    (goodRootIter_residual_product cfg ε M start p hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s)
    (goodRootTerminalPair_stable_ae cfg ε M start p hn hB s)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodRootTerminalPair_projection
#print axioms NoThreeLine.BirthWitness.goodRootTerminal_residual_product
