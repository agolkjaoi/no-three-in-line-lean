import NoThreeLine.GoodPhaseContinuationCut
import NoThreeLine.ObservedHistoryTerminalResidual

/-! The original board after a phase is independent of the whole old finite
within-phase history together with the invariant-carrying phase endpoint.
The full record payload is retained; this is not inferred from a physical
state marginal. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem goodPhasePast_terminal_residual_product {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodPhaseObservation n cfg.B) (i : ℕ) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>
      ((observedPast cfg ε M start hn (goodPhaseStart cfg ε M s).val i ω,
        (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1),
        (goodPhaseRecycledPair cfg ε M start hn (s,ω)).2))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>
        (observedPast cfg ε M start hn (goodPhaseStart cfg ε M s).val i ω,
          (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1))).prod
        (boardClockMeasure n (cfg.B/n)) := by
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let P := Fin (i+1)→TimedObservation cfg
  let past := observedPast cfg ε M start hn (goodPhaseStart cfg ε M s).val i
  let tr := fun ω : BoardClockPath n=>observedRecycledTerminalPair cfg ε M start hn
    ((goodPhaseStart cfg ε M s).val,ω)
  have hp : Measurable past := observedPast_measurable cfg ε M start hn _ i
  have ht : Measurable tr := (observedRecycledTerminalPair_measurable cfg ε M start hn).comp
    (measurable_const.prodMk measurable_id)
  let ψ := fun x : P×TimedObservation cfg=>(x.1,observedTimedProjection cfg x.2)
  have hψ : Measurable ψ := measurable_fst.prodMk ((observedTimedProjection_measurable cfg).comp measurable_snd)
  have h := congrArg (fun μ : Measure ((P×TimedObservation cfg)×BoardClockPath n)=>
    μ.map (fun x=>(ψ x.1,x.2)))
      (observedPast_terminal_residual_product cfg ε M start hn hB (goodPhaseStart cfg ε M s).val i)
  change (ν.map (fun ω=>((past ω,(tr ω).1),(tr ω).2))).map (fun x=>(ψ x.1,x.2))=
    ((ν.map (fun ω=>(past ω,(tr ω).1))).prod ν).map (fun x=>(ψ x.1,x.2)) at h
  have hmap : Measurable (fun x : (P×TimedObservation cfg)×BoardClockPath n=>(ψ x.1,x.2)) :=
    (hψ.comp measurable_fst).prodMk measurable_snd
  have hinput : Measurable (fun ω : BoardClockPath n=>((past ω,(tr ω).1),(tr ω).2)) :=
    (hp.prodMk ht.fst).prodMk ht.snd
  rw [Measure.map_map hmap hinput,
    map_pair_with_fresh_right _ ν ψ hψ,Measure.map_map hψ (hp.prodMk ht.fst)] at h
  let emb := fun x : P×GoodPhaseObservation n cfg.B=>(x.1,x.2.val)
  have he : MeasurableEmbedding emb := MeasurableEmbedding.id.prodMap
    (MeasurableEmbedding.subtype_coe goodPhaseObservation_measurableSet)
  have hg : Measurable (fun ω : BoardClockPath n=>goodPhaseRecycledPair cfg ε M start hn (s,ω)) :=
    (goodPhaseRecycledPair_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  apply (he.prodMap (MeasurableEmbedding.id (α:=BoardClockPath n))).map_injective
  rw [Measure.map_map (he.prodMap MeasurableEmbedding.id).measurable ((hp.prodMk hg.fst).prodMk hg.snd)]
  change ν.map (fun ω=>(emb (past ω,(goodPhaseRecycledPair cfg ε M start hn (s,ω)).1),
      (goodPhaseRecycledPair cfg ε M start hn (s,ω)).2))=
    ((ν.map (fun ω=>(past ω,(goodPhaseRecycledPair cfg ε M start hn (s,ω)).1))).prod ν).map
      (fun x=>(emb x.1,x.2))
  rw [map_pair_with_fresh_right _ ν emb he.measurable,Measure.map_map he.measurable (hp.prodMk hg.fst)]
  exact h

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodPhasePast_terminal_residual_product
