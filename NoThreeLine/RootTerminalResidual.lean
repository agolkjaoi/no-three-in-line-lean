import NoThreeLine.StableResidualProduct
import NoThreeLine.RootFreezeTerminal

/-! The terminal residual board is independent of the full root observer,
including its saved snapshot. Finite full-observer restart laws and actual
completion absorption are the inputs; physical projection is used only to
identify the actual completion event and the physical part of stability. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine.BirthWitness

theorem rootObserverRecycledPair_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) (k : ℕ) :
    (boardClockMeasure n rate).map (rootObserverRecycledPair cfg ε M start p hn s k)=
      ((boardClockMeasure n rate).map
        (fun ω=>(rootObserverRecycledPair cfg ε M start p hn s k ω).1)).prod (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  have hm := rootObserverRecycledPair_map cfg ε M start p hn rate hr s k
  have hp := congrArg (fun μ : Measure (RootObservation cfg×BoardClockPath n)=>μ.map Prod.fst) hm
  rw [Measure.map_map measurable_fst (rootObserverRecycledPair_measurable cfg ε M start p hn s k),
    Measure.map_fst_prod,measure_univ,one_smul] at hp
  rw [hm]
  exact congrArg (fun μ : Measure (RootObservation cfg)=>μ.prod (boardClockMeasure n rate)) hp.symm

theorem rootObserverTerminalPair_stable_ae {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) :
    ∀ᵐω∂boardClockMeasure n (cfg.B/n),∀ᶠk in atTop,
      rootObserverRecycledPair cfg ε M start p hn s k ω=rootObserverTerminalPair cfg ε M start p hn (s,ω) := by
  filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s.1,
    rootObserverTerminal_saved_stable_ae cfg ε M start p hn hB s hs] with ω ho hsnap
  filter_upwards [ho,hsnap] with k hk hsave
  have hp := (rootObserverRecycledPair_projection cfg ε M start p hn s k ω).trans
    (hk.trans (rootObserverTerminalPair_projection cfg ε M start p hn (s,ω)).symm)
  apply Prod.ext
  · apply Prod.ext
    · exact congrArg (fun r : TimedObservation cfg×BoardClockPath n=>r.1) hp
    · exact hsave
  · exact congrArg (fun r : TimedObservation cfg×BoardClockPath n=>r.2) hp

theorem rootObserverTerminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 0<cfg.B) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>rootObserverTerminalPair cfg ε M start p hn (s,ω))=
      ((boardClockMeasure n (cfg.B/n)).map
        (fun ω=>rootObserverTerminal cfg ε M start p hn (s,ω))).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  exact residual_product_of_eventually_stable (boardClockMeasure n (cfg.B/n)) (boardClockMeasure n (cfg.B/n))
    (rootObserverRecycledPair cfg ε M start p hn s)
    (fun ω=>rootObserverTerminalPair cfg ε M start p hn (s,ω))
    (rootObserverRecycledPair_measurable cfg ε M start p hn s)
    ((rootObserverTerminalPair_measurable cfg ε M start p hn).comp (measurable_const.prodMk measurable_id))
    (rootObserverRecycledPair_residual_product cfg ε M start p hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s)
    (rootObserverTerminalPair_stable_ae cfg ε M start p hn hB s hs)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootObserverTerminalPair_stable_ae
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_residual_product
