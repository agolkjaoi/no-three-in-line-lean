import NoThreeLine.SourceCutTerminal

/-! Joint measurability in a nonnegative cut amount and the original board.
The physical/eta terminal and saved credit do not depend on the phase-start
parameter, so the established joint physical terminal kernel applies. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine

theorem sourceRestrictState_joint_measurable {n : ℕ} (cfg : FlowConfig n) :
    Measurable (fun x : ℝ≥0×AugTimedState cfg=>sourceRestrictState cfg x.1 x.1.coe_nonneg x.2) := by
  have hd : Measurable (fun x : ℝ≥0×AugTimedState cfg=>(x.1:ℝ)) :=
    measurable_subtype_coe.comp measurable_fst
  exact ((measurable_subtype_coe.comp measurable_snd).fst.prodMk
    (measurable_const.max ((measurable_subtype_coe.comp measurable_snd).snd.sub hd))).subtype_mk

namespace BirthWitness

theorem sourceCutTerminal_base {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) :
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1=
      augRecycledTerminal cfg ε M hn (sourceRestrictState cfg δ hδ s.val.1) ω :=
  observedRecycledTerminal_base cfg ε M (start-δ) hn _

theorem sourceCutTerminal_base_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>(sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2).1) := by
  have hs : Measurable (fun x : ℝ≥0×BoardClockPath n=>
      sourceRestrictState cfg x.1 x.1.coe_nonneg s.val.1) :=
    (sourceRestrictState_joint_measurable cfg).comp (measurable_fst.prodMk measurable_const)
  have ht := (augRecycledTerminalPair_joint_measurable cfg ε M hn).fst.comp (hs.prodMk measurable_snd)
  convert ht using 1
  funext x
  exact sourceCutTerminal_base cfg ε M start x.1 x.1.coe_nonneg hn s x.2

theorem sourceCutCredit_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : GoodObservation cfg) (p : Grid n) :
    Measurable (fun x : ℝ≥0×BoardClockPath n=>
      augTimedCredit cfg p (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2).1) :=
  (augTimedCredit_measurable cfg p).comp (sourceCutTerminal_base_joint_measurable cfg ε M start hn s)

theorem sourceCutCredit_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (s : GoodObservation cfg) (p : Grid n) (ω : BoardClockPath n) :
    0≤augTimedCredit cfg p (sourceCutTerminal cfg ε M start δ hδ hn s ω).1 ∧
      augTimedCredit cfg p (sourceCutTerminal cfg ε M start δ hδ hn s ω).1≤cfg.B :=
  augTimedCredit_bounds cfg p _

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.sourceRestrictState_joint_measurable
#print axioms NoThreeLine.BirthWitness.sourceCutCredit_joint_measurable
