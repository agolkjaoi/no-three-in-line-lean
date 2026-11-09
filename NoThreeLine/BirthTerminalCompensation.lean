import NoThreeLine.BirthRateAccumulation
import NoThreeLine.RecycledTerminal

/-! The actual finite terminal selected-point indicator has expectation
equal to its initial value plus the accumulated actual running birth rate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine

theorem bounded_stable_integral_limit {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : ℕ → Ω → ℝ) (hf : ∀k,Measurable (f k))
    (B : ℝ) (hb : ∀k ω,0≤f k ω ∧ f k ω≤B) (g : Ω → ℝ)
    (hs : ∀ᵐ ω ∂μ,∀ᶠ k in atTop,f k ω=g ω) :
    Tendsto (fun k=>∫ω,f k ω ∂μ) atTop (𝓝 (∫ω,g ω ∂μ)) := by
  apply tendsto_integral_of_dominated_convergence (fun _ : Ω=>B)
    (fun k=>(hf k).aestronglyMeasurable) (integrable_const B)
  · intro k
    exact Filter.Eventually.of_forall (fun ω=>by
      simpa only [Real.norm_eq_abs,abs_of_nonneg (hb k ω).1] using (hb k ω).2)
  · filter_upwards [hs] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk=>hk.symm))

namespace BirthWitness

def terminalBirthRate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  cumulativeBirthRate cfg ε M p hn s (augRecycledCompletionIndex cfg ε M hn s ω) ω

theorem terminalBirthRate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n) (hn : 0<n)
    (s : AugTimedState cfg) : Measurable (terminalBirthRate cfg ε M p hn s) := by
  classical
  exact Measurable.find (cumulativeBirthRate_measurable cfg ε M p hn s)
    (fun k=>(augRecycledCompletionPredicate_measurable cfg ε M hn s k).setOf)
    (augRecycledCompletionPredicate_exists cfg ε M hn s)

theorem terminalBirthRate_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0≤terminalBirthRate cfg ε M p hn s ω ∧ terminalBirthRate cfg ε M p hn s ω≤(cfg.horizon:ℝ)*(cfg.B/n) :=
  cumulativeBirthRate_bounds cfg ε M p hn hB hm s _ ω

theorem terminalBirthRate_integrable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    Integrable (terminalBirthRate cfg ε M p hn s) (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    (terminalBirthRate_measurable cfg ε M p hn s) ((cfg.horizon:ℝ)*(cfg.B/n))
    (terminalBirthRate_bounds cfg ε M p hn hB hm s)

theorem cumulativeBirthRate_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),∀ᶠ k in atTop,
      cumulativeBirthRate cfg ε M p hn s k ω=terminalBirthRate cfg ε M p hn s ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s] with ω hω
  let N := augRecycledCompletionIndex cfg ε M hn s ω
  have hd : AugTimedDone cfg (augRecycledPair cfg ε M hn s N ω).1 := hω
  have htail (j : ℕ) (hj : N≤j) : clockBirthRunningRate cfg ε M p hn
      (augRecycledPair cfg ε M hn s j ω)=0 := by
    have he := augRecycledPair_absorbing cfg ε M hn s ω N hd j hj
    have hdone : birthDone cfg (augRecycledPair cfg ε M hn s j ω).1 := by
      rw [he]
      exact (birthDone_iff cfg _).mpr hd
    simp only [clockBirthRunningRate,birthRunningRate,birthElapsed,if_pos hdone,intervalIntegral.integral_same]
  filter_upwards [eventually_ge_atTop N] with k hk
  change cumulativeBirthRate cfg ε M p hn s k ω=cumulativeBirthRate cfg ε M p hn s N ω
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih => rw [cumulativeBirthRate_succ,htail j hj,add_zero,ih]

theorem terminal_selectedIndicator_compensation {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : AugTimedState cfg) :
    (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω) ∂boardClockMeasure n (cfg.B/n))=
      selectedIndicator cfg p s+∫ω,terminalBirthRate cfg ε M p hn s ω ∂boardClockMeasure n (cfg.B/n) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hs : ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n),∀ᶠ k in atTop,
      selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1=
        selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω) := by
    filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s] with ω hω
    exact hω.mono (fun k hk=>congrArg (fun r : AugTimedState cfg × BoardClockPath n=>selectedIndicator cfg p r.1) hk)
  have hz := bounded_stable_integral_limit (boardClockMeasure n (cfg.B/n)) _
    (fun k=>(selectedIndicator_measurable cfg p).comp (augRecycledPair_measurable cfg ε M hn s k).fst)
    1 (fun k ω=>selectedIndicator_bounds cfg p _) _ hs
  have hr := bounded_stable_integral_limit (boardClockMeasure n (cfg.B/n)) _
    (cumulativeBirthRate_measurable cfg ε M p hn s) ((cfg.horizon:ℝ)*(cfg.B/n))
    (cumulativeBirthRate_bounds cfg ε M p hn hB hm s) _ (cumulativeBirthRate_stable_ae cfg ε M p hn hB s)
  change Tendsto (fun k=>∫ω,selectedIndicator cfg p (augRecycledPair cfg ε M hn s k ω).1
      ∂boardClockMeasure n (cfg.B/n)) atTop
    (𝓝 (∫ω,selectedIndicator cfg p (augRecycledTerminal cfg ε M hn s ω) ∂boardClockMeasure n (cfg.B/n))) at hz
  simp_rw [finite_selectedIndicator_compensation cfg ε M p hn hB hm s] at hz
  exact tendsto_nhds_unique hz (tendsto_const_nhds.add hr)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.BirthWitness.cumulativeBirthRate_stable_ae
#print axioms NoThreeLine.BirthWitness.terminal_selectedIndicator_compensation
