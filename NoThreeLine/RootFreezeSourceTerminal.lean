import NoThreeLine.RootFreezeAccumulation
import NoThreeLine.RootFreezePointLaw

/-! Actual terminal S7 for the frozen root hierarchy. Finite history
estimates pass to the actual terminal snapshot by proved a.e. stability
and the physical elapsed-time bound, with no optional-stopping premise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine.BirthWitness

def terminalRootRunningSource {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) (ω : BoardClockPath n) : ℝ :=
  cumulativeRootRunningSource cfg ε M start p e C D L hn s
    (augRecycledCompletionIndex cfg ε M hn s.val.1.1 ω) ω

theorem terminalRootRunningSource_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (s : GoodRootObservation cfg p) :
    Measurable (terminalRootRunningSource cfg ε M start p e C D L hn s) := by
  classical
  exact Measurable.find (cumulativeRootRunningSource_measurable cfg ε M start p e C D L hn s)
    (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s.val.1.1 k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s.val.1.1)

theorem cumulativeRootRunningSource_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n)) (hn : 0<n)
    (hB : 0<cfg.B) (s : GoodRootObservation cfg p) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω=
        terminalRootRunningSource cfg ε M start p e C D L hn s ω := by
  filter_upwards [rootObserverTerminal_frozen_ae cfg ε M start p hn hB s.val s.property.1] with ω hω
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1.1 ω
  have htail (j : ℕ) (hj : N≤j) : goodRootRunningSource cfg ε M start p e C D L hn
      (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω)=0 := by
    apply goodRootRunningSource_frozen
    have hp : (RecycledBoardProcess.iterate (goodRootRestartStep cfg ε M start p hn) s j ω).1.val=
        (rootObserverRecycledPair cfg ε M start p hn s.val j ω).1 :=
      congrArg Prod.fst (goodRootRecycled_projection cfg ε M start p hn s j ω)
    rw [hp]
    have hf := rootObserverRecycledPair_frozen_stable cfg ε M start p hn s.val ω N hω j hj
    rw [hf]
    exact hω
  filter_upwards [eventually_ge_atTop N] with k hk
  change cumulativeRootRunningSource cfg ε M start p e C D L hn s k ω=
    cumulativeRootRunningSource cfg ε M start p e C D L hn s N ω
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih => rw [cumulativeRootRunningSource_succ,htail j hj,add_zero,ih]

theorem terminal_expected_rootMixed_running_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hCL : C⊆L) (hCD : Disjoint C D) (s : GoodRootObservation cfg p) :
    (∫ω,mixed cfg.directions C D L (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂boardClockMeasure n (cfg.B/n))≤goodRootMixed cfg p e C D L s+
        ∫ω,terminalRootRunningSource cfg ε M start p e C D L hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let F := goodRootRestartStep cfg ε M start p hn
  have hF : Measurable F := goodRootRestartStep_measurable cfg ε M start p hn
  let ν := boardClockMeasure n (cfg.B/n)
  let Z := fun k ω=>goodRootMixed cfg p e C D L (RecycledBoardProcess.state F s k ω)
  let ZT := fun ω=>mixed cfg.directions C D L (rootBoundaryWitness cfg ε M start e p hn s.val ω)
  have hzm (k : ℕ) : AEStronglyMeasurable (Z k) ν :=
    ((goodRootMixed_measurable cfg p e C D L).comp (RecycledBoardProcess.state_measurable F hF s k)).aestronglyMeasurable
  have hzb (k : ℕ) : ∀ᵐω∂ν,‖Z k ω‖≤mixedCap C cfg.B := Filter.Eventually.of_forall (fun ω=>by
    have hh := goodRootMixed_bounds cfg p e C D L (RecycledBoardProcess.state F s k ω)
    simpa only [Z,Real.norm_eq_abs,abs_of_nonneg hh.1] using hh.2)
  have hzt : ∀ᵐω∂ν,Tendsto (fun k=>Z k ω) atTop (𝓝 (ZT ω)) := by
    filter_upwards [rootObserverTerminal_saved_stable_ae cfg ε M start p hn hB s.val s.property.1] with ω hω
    apply tendsto_const_nhds.congr'
    filter_upwards [hω] with k hk
    have hp : (RecycledBoardProcess.iterate F s k ω).1.val=
        (rootObserverRecycledPair cfg ε M start p hn s.val k ω).1 :=
      congrArg Prod.fst (goodRootRecycled_projection cfg ε M start p hn s k ω)
    change mixed cfg.directions C D L
      (savedWitness e (rootObserverTerminal cfg ε M start p hn (s.val,ω)).2.2)=
        mixed cfg.directions C D L (savedWitness e (RecycledBoardProcess.iterate F s k ω).1.val.2.2)
    rw [hp,hk]
  have hzlim := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n=>mixedCap C cfg.B)
    hzm (integrable_const _) hzb hzt
  let R := cumulativeRootRunningSource cfg ε M start p e C D L hn s
  let RT := terminalRootRunningSource cfg ε M start p e C D L hn s
  let Q := (cfg.horizon:ℝ)*sourceCap cfg.directions C D cfg.B cfg.K
  have hrm (k : ℕ) : AEStronglyMeasurable (R k) ν :=
    (cumulativeRootRunningSource_measurable cfg ε M start p e C D L hn s k).aestronglyMeasurable
  have hrb (k : ℕ) : ∀ᵐω∂ν,‖R k ω‖≤Q := Filter.Eventually.of_forall (fun ω=>by
    have hh := cumulativeRootRunningSource_bounds cfg ε M start p e C D L hn hm hK s k ω
    simpa only [R,Q,Real.norm_eq_abs,abs_of_nonneg hh.1] using hh.2)
  have hrt : ∀ᵐω∂ν,Tendsto (fun k=>R k ω) atTop (𝓝 (RT ω)) := by
    filter_upwards [cumulativeRootRunningSource_stable_ae cfg ε M start p e C D L hn hB s] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk=>hk.symm))
  have hrlim := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n=>Q)
    hrm (integrable_const _) hrb hrt
  exact le_of_tendsto_of_tendsto hzlim (tendsto_const_nhds.add hrlim)
    (Filter.Eventually.of_forall
      (finite_expected_rootMixed_running_bound cfg ε M start p e C D L hn hB hm hK hCL hCD s))

theorem rootPoint_correctedWitness_source_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (e : Retention n) (D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (hK : cfg.K<2)
    (hL : p∈L) (hD : p∉D) (s : GoodRootObservation cfg p) :
    (∫ω,correctedActiveWitness D L p (rootBoundaryWitness cfg ε M start e p hn s.val ω)
      ∂withinPhasePointMeasure cfg ε M hn s.val.1.1 p)≤goodRootMixed cfg p e {p} D L s+
        ∫ω,terminalRootRunningSource cfg ε M start p e {p} D L hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  rw [rootBoundaryWitness_corrected_point_mean cfg ε M start e p hn s.val s.property.1 D L]
  exact terminal_expected_rootMixed_running_bound cfg ε M start p e {p} D L hn hB hm hK
    (Finset.singleton_subset_iff.mpr hL) (Finset.disjoint_singleton_left.mpr hD) s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cumulativeRootRunningSource_stable_ae
#print axioms NoThreeLine.BirthWitness.terminal_expected_rootMixed_running_bound
#print axioms NoThreeLine.BirthWitness.rootPoint_correctedWitness_source_bound
