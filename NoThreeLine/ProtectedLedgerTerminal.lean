import NoThreeLine.ProtectedLedgerProcess
import NoThreeLine.StableResidualProduct

/-! The passive protected ledger terminates at the original physical
completion selector. Almost-sure stability gives its actual terminal
state/residual product law without modifying the original clock path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine
open AuxiliaryODE

theorem protectedRestartStep_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (hs : AugTimedDone cfg s.1) (ω : BoardClockPath n) :
    protectedRestartStep cfg ε M L hn (s,ω)=(s,ω) := by
  simp only [protectedRestartStep,augRestartStep_done cfg ε M hn s.1 hs ω,protectedRemember,protectedLineSave_self]

theorem protectedRecycledPair_absorbing {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (ω : BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (protectedRecycledPair cfg ε M L hn s k ω).1.1) :
    ∀j,k≤j→protectedRecycledPair cfg ε M L hn s j ω=protectedRecycledPair cfg ε M L hn s k ω := by
  intro j hj
  induction j,hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    change protectedRestartStep cfg ε M L hn (protectedRecycledPair cfg ε M L hn s j ω)=_
    rw [ih]
    exact protectedRestartStep_done cfg ε M L hn _ hk _

def protectedRecycledTerminalPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (ω : BoardClockPath n) : ProtectedTimedState cfg×BoardClockPath n :=
  protectedRecycledPair cfg ε M L hn s (augRecycledCompletionIndex cfg ε M hn s.1 ω) ω

theorem protectedRecycledTerminalPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) : Measurable (protectedRecycledTerminalPair cfg ε M L hn s) := by
  classical
  exact Measurable.find (protectedRecycledPair_measurable cfg ε M L hn s)
    (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.1)

theorem protectedRecycledTerminalPair_projection {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (ω : BoardClockPath n) :
    ((protectedRecycledTerminalPair cfg ε M L hn s ω).1.1,(protectedRecycledTerminalPair cfg ε M L hn s ω).2)=
      augRecycledTerminalPair cfg ε M hn s.1 ω :=
  protectedRecycledPair_projection cfg ε M L hn s _ ω

theorem protectedRecycledTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      protectedRecycledPair cfg ε M L hn s k ω=protectedRecycledTerminalPair cfg ε M L hn s ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.1] with ω hω
  have he := congrArg Prod.fst (protectedRecycledTerminalPair_projection cfg ε M L hn s ω)
  have hd : AugTimedDone cfg (protectedRecycledTerminalPair cfg ε M L hn s ω).1.1 := by
    rw [he]
    exact hω
  filter_upwards [eventually_ge_atTop (augRecycledCompletionIndex cfg ε M hn s.1 ω)] with k hk
  exact protectedRecycledPair_absorbing cfg ε M L hn s ω _ hd k hk

theorem protectedRecycledTerminalPair_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (hB : 0<cfg.B) (s : ProtectedTimedState cfg) :
    (boardClockMeasure n (cfg.B/n)).map (protectedRecycledTerminalPair cfg ε M L hn s)=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>(protectedRecycledTerminalPair cfg ε M L hn s ω).1)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  apply residual_product_of_eventually_stable _ _
    (protectedRecycledPair cfg ε M L hn s) (protectedRecycledTerminalPair cfg ε M L hn s)
    (protectedRecycledPair_measurable cfg ε M L hn s) (protectedRecycledTerminalPair_measurable cfg ε M L hn s) _
    (protectedRecycledTerminalPair_stable_ae cfg ε M L hn hB s)
  intro k
  have hm := RecycledBoardProcess.iterate_state_map (protectedRestartStep cfg ε M L hn)
    (protectedRestartStep_measurable cfg ε M L hn) (boardClockMeasure n (cfg.B/n))
    (protectedRestartStep_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn))) s k
  exact (protectedRecycledPair_map cfg ε M L hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s k).trans
    (congrArg (fun μ : Measure (ProtectedTimedState cfg)=>μ.prod (boardClockMeasure n (cfg.B/n))) hm.symm)

theorem protectedRecycledTerminal_saved_inactive {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n) (hn : 0<n)
    (s : ProtectedTimedState cfg) (p : Grid n) (hp : (s.1.val.1.physical.process.accounts p).status≠.active)
    (ω : BoardClockPath n) : (protectedRecycledTerminalPair cfg ε M L hn s ω).1.2 p=s.2 p :=
  protectedRecycledPair_saved_inactive cfg ε M L hn s p hp _ ω

end NoThreeLine

#print axioms NoThreeLine.protectedRecycledTerminalPair_projection
#print axioms NoThreeLine.protectedRecycledTerminalPair_map
#print axioms NoThreeLine.protectedRecycledTerminal_saved_inactive
