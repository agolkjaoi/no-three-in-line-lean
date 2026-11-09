import NoThreeLine.WitnessRunningAccumulation
import NoThreeLine.ObservedTerminalLaw

/-! Almost-sure finite termination closes the actual running-source S7
bound at the actual original-board terminal observer. Domination comes
from remaining-time telescoping, not an assumed compensator theorem. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine.BirthWitness

def terminalRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n) : ℝ :=
  cumulativeRunningSource cfg ε M start e C D L hn s (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω

theorem terminalRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (terminalRunningSource cfg ε M start e C D L hn s) := by
  classical
  exact Measurable.find (cumulativeRunningSource_measurable cfg ε M start e C D L hn s)
    (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s.val.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.val.1)

theorem cumulativeRunningSource_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (s : GoodObservation cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),∀ᶠ k in atTop,
      cumulativeRunningSource cfg ε M start e C D L hn s k ω=terminalRunningSource cfg ε M start e C D L hn s ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hω
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  have hd : AugTimedDone cfg (observedRecycledPair cfg ε M start hn s.val N ω).1.1 := by
    change AugTimedDone cfg (observedRecycledTerminal cfg ε M start hn (s.val,ω)).1
    rw [observedRecycledTerminal_base]
    exact hω
  have htail (j : ℕ) (hj : N≤j) : goodRunningSource cfg ε M start e C D L hn
      (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω)=0 := by
    have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s j ω)
    change (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val =
      (observedRecycledPair cfg ε M start hn s.val j ω).1 at hp
    have hsame := observedRecycledPair_absorbing cfg ε M start hn s.val ω N hd j hj
    have hdone : observationDone cfg
        (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s j ω).1.val := by
      rw [hp,hsame]
      exact hd.imp (fun h=>h.le) id
    simp only [goodRunningSource,clockRunningSource,runningSource,observedAdvance,if_pos hdone,
      intervalIntegral.integral_same]
  filter_upwards [eventually_ge_atTop N] with k hk
  change cumulativeRunningSource cfg ε M start e C D L hn s k ω=
    cumulativeRunningSource cfg ε M start e C D L hn s N ω
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih => rw [cumulativeRunningSource_succ,htail j hj,add_zero,ih]

theorem terminal_expected_mixed_running_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (C D L : Finset (Grid n)) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hK : cfg.K<2) (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodObservation cfg) :
    (∫ω,mixed cfg.directions C D L (observedWitness cfg e
      (observedRecycledTerminal cfg ε M start hn (s.val,ω))) ∂boardClockMeasure n (cfg.B/n))≤
      goodMixed cfg e C D L s+
        ∫ω,terminalRunningSource cfg ε M start e C D L hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let F := goodObservedRestartStep cfg ε M start hn
  have hF : Measurable F := goodObservedRestartStep_measurable cfg ε M start hn
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun k ω=>goodMixed cfg e C D L (RecycledBoardProcess.state F s k ω)
  let ZT := fun ω=>mixed cfg.directions C D L (observedWitness cfg e
    (observedRecycledTerminal cfg ε M start hn (s.val,ω)))
  have hzm (k : ℕ) : AEStronglyMeasurable (Z k) ν :=
    ((goodMixed_measurable cfg e C D L).comp (RecycledBoardProcess.state_measurable F hF s k)).aestronglyMeasurable
  have hzb (k : ℕ) : ∀ᵐ ω ∂ν,‖Z k ω‖≤mixedCap C cfg.B := Filter.Eventually.of_forall (fun ω=>by
    have hh := goodMixed_bounds cfg e C D L (RecycledBoardProcess.state F s k ω)
    simpa only [Z,Real.norm_eq_abs,abs_of_nonneg hh.1] using hh.2)
  have hzt : ∀ᵐ ω ∂ν,Tendsto (fun k=>Z k ω) atTop (𝓝 (ZT ω)) := by
    filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.val] with ω hω
    apply tendsto_const_nhds.congr'
    filter_upwards [hω] with k hk
    have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s k ω)
    have he := hp.trans (congrArg Prod.fst hk)
    exact congrArg (fun y=>mixed cfg.directions C D L (observedWitness cfg e y)) he.symm
  have hzlim := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n=>mixedCap C cfg.B)
    hzm (integrable_const _) hzb hzt
  let R := cumulativeRunningSource cfg ε M start e C D L hn s
  let RT := terminalRunningSource cfg ε M start e C D L hn s
  let Q := (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K
  have hrm (k : ℕ) : AEStronglyMeasurable (R k) ν :=
    (cumulativeRunningSource_measurable cfg ε M start e C D L hn s k).aestronglyMeasurable
  have hrb (k : ℕ) : ∀ᵐ ω ∂ν,‖R k ω‖≤Q := Filter.Eventually.of_forall (fun ω=>by
    have hh := cumulativeRunningSource_bounds cfg ε M start e C D L hn hm hK s k ω
    simpa only [R,Q,Real.norm_eq_abs,abs_of_nonneg hh.1] using hh.2)
  have hrt : ∀ᵐ ω ∂ν,Tendsto (fun k=>R k ω) atTop (𝓝 (RT ω)) := by
    filter_upwards [cumulativeRunningSource_stable_ae cfg ε M start e C D L hn hB s] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk=>hk.symm))
  have hrlim := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n=>Q)
    hrm (integrable_const _) hrb hrt
  exact le_of_tendsto_of_tendsto hzlim (tendsto_const_nhds.add hrlim)
    (Filter.Eventually.of_forall (finite_expected_mixed_running_bound cfg ε M start e C D L hn hB hm hK hCL hCD s))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeRunningSource_stable_ae
#print axioms NoThreeLine.BirthWitness.terminal_expected_mixed_running_bound
