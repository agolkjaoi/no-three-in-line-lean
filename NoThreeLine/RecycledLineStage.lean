import NoThreeLine.LineStageTransition
import NoThreeLine.InvariantCreditIteration
import NoThreeLine.RecycledTerminal

/-! The actual original-board fixed-occupancy value preserves its mean
at every finite iterate and the actual almost-sure finite terminal state. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem lineStageRegion_recycled {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hKcfg : cfg.K≤K)
    (L : LineIndex n) (hsp : specified cfg.directions L) (N : ℕ) (hN : N≤1) (hn : 0<n)
    (s : AugTimedState cfg) (hs : lineStageRegion cfg K L N s) (k : ℕ) (ω : BoardClockPath n) :
    lineStageRegion cfg K L N (augRecycledPair cfg ε M hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact lineStageRegion_step cfg ε M K hKcfg L hsp N hN _ ih _

theorem lineStageValue_recycled_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hs : lineStageRegion cfg K L N s) (k : ℕ) :
    (∫ω,lineStageValue cfg K L N (augRecycledPair cfg ε M hn s k ω).1
      ∂boardClockMeasure n (cfg.B/n))=lineStageValue cfg K L N s := by
  have hr : 0<cfg.B/(n:ℝ) := div_pos hB (by exact_mod_cast hn)
  letI := boardClockMeasure_probability n (cfg.B/n) hr
  have hi := GenericCreditIteration.infinitePi_expected_credit_of_invariant
    (augTimedClockStep cfg ε M hn) (augTimedClockStep_measurable cfg ε M hn)
    (boardClockMeasure n (cfg.B/n)) (lineStageValue cfg K L N)
    (lineStageValue_measurable cfg K L N) ((2/(2-K))^2) (lineStageValue_bounds cfg K hK L N hN)
    (lineStageRegion cfg K L N)
    (fun x hx ω=>lineStageRegion_step cfg ε M K hKcfg L hsp N hN x hx _)
    (fun x hx=>lineStageValue_step_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm x hx) k s hs
  have he := congrArg (fun μ : Measure (AugTimedState cfg)=>∫x,lineStageValue cfg K L N x ∂μ)
    (augRecycledState_map_eq_noiseState cfg ε M hn (cfg.B/n) hr s k)
  rw [integral_map_of_stronglyMeasurable (augRecycledPair_measurable cfg ε M hn s k).fst
      (lineStageValue_measurable cfg K L N).stronglyMeasurable,
    integral_map_of_stronglyMeasurable (augTimedNoiseState_measurable cfg ε M hn s k)
      (lineStageValue_measurable cfg K L N).stronglyMeasurable] at he
  exact he.trans hi

theorem lineStageValue_recycled_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B)
    (s : AugTimedState cfg) (k : ℕ) :
    Integrable (fun ω=>lineStageValue cfg K L N (augRecycledPair cfg ε M hn s k ω).1)
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((lineStageValue_measurable cfg K L N).comp (augRecycledPair_measurable cfg ε M hn s k).fst)
    ((2/(2-K))^2) (fun ω=>lineStageValue_bounds cfg K hK L N hN _)

theorem lineStageValue_terminal_integrable {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hK : K<2) (L : LineIndex n) (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B)
    (s : AugTimedState cfg) :
    Integrable (fun ω=>lineStageValue cfg K L N (augRecycledTerminal cfg ε M hn s ω))
      (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((lineStageValue_measurable cfg K L N).comp (augRecycledTerminal_measurable cfg ε M hn s))
    ((2/(2-K))^2) (fun ω=>lineStageValue_bounds cfg K hK L N hN _)

theorem lineStageValue_terminal_mean {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hs : lineStageRegion cfg K L N s) :
    (∫ω,lineStageValue cfg K L N (augRecycledTerminal cfg ε M hn s ω)
      ∂boardClockMeasure n (cfg.B/n))=lineStageValue cfg K L N s := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have hlim : ∀ᵐω ∂boardClockMeasure n (cfg.B/n),
      Tendsto (fun k=>lineStageValue cfg K L N (augRecycledPair cfg ε M hn s k ω).1) atTop
        (𝓝 (lineStageValue cfg K L N (augRecycledTerminal cfg ε M hn s ω))) := by
    filter_upwards [augRecycledTerminalPair_stable_ae cfg ε M hn hB s] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun k hk=>(congrArg (fun v=>lineStageValue cfg K L N v.1) hk).symm))
  have hmeas (k : ℕ) : Measurable (fun ω=>lineStageValue cfg K L N (augRecycledPair cfg ε M hn s k ω).1) :=
    (lineStageValue_measurable cfg K L N).comp (augRecycledPair_measurable cfg ε M hn s k).fst
  have ht := tendsto_integral_of_dominated_convergence (fun _ : BoardClockPath n=>(2/(2-K))^2)
    (fun k=>(hmeas k).aestronglyMeasurable)
    (integrable_const _) (fun k=>ae_of_all _ (fun ω=>by
      have hb := lineStageValue_bounds cfg K hK L N hN (augRecycledPair cfg ε M hn s k ω).1
      simpa only [Real.norm_eq_abs,abs_of_nonneg hb.1] using hb.2)) hlim
  simp_rw [lineStageValue_recycled_mean cfg ε M K hKcfg hK L hsp N hN hn hB hm s hs] at ht
  exact tendsto_nhds_unique ht tendsto_const_nhds

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.lineStageValue_recycled_mean
#print axioms NoThreeLine.BirthWitness.lineStageValue_terminal_mean
