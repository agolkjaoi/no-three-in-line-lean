import NoThreeLine.GoodPhaseHistoryResidual
import NoThreeLine.CutHistoryMemory

/-! The actual old cut observation, the actual invariant phase terminal,
and its remaining original board have the full product law. The old cut
is obtained from finite history memory and a.e. actual termination. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine.BirthWitness

theorem goodCut_terminal_residual_product {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B)
    (s : GoodPhaseObservation n cfg.B) (hcut : δ<(cfg.horizon:ℝ))
    (havoid : ∀ᵐω ∂boardClockMeasure n (cfg.B/n),∀i,
      δ≠(observedRecycledPair cfg ε M start hn (goodPhaseStart cfg ε M s).val i ω).1.1.val.2) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>
      ((sourceCutTerminal cfg ε M start δ hδ hn (goodPhaseStart cfg ε M s) ω,
        (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1),
        (goodPhaseRecycledPair cfg ε M start hn (s,ω)).2))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>
        (sourceCutTerminal cfg ε M start δ hδ hn (goodPhaseStart cfg ε M s) ω,
          (goodPhaseRecycledPair cfg ε M start hn (s,ω)).1))).prod
        (boardClockMeasure n (cfg.B/n)) := by
  let ν := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let tr := fun ω : BoardClockPath n=>goodPhaseRecycledPair cfg ε M start hn (s,ω)
  let cut := sourceCutTerminal cfg ε M start δ hδ hn (goodPhaseStart cfg ε M s)
  let past := fun i=>observedPast cfg ε M start hn (goodPhaseStart cfg ε M s).val i
  let f := fun i ω=>((finiteCutMemory cfg ε M start δ hδ hn i (past i ω),(tr ω).1),(tr ω).2)
  let F := fun ω=>((cut ω,(tr ω).1),(tr ω).2)
  have ht : Measurable tr := (goodPhaseRecycledPair_measurable cfg ε M start hn).comp
    (measurable_const.prodMk measurable_id)
  have hc : Measurable cut := sourceCutTerminal_measurable cfg ε M start δ hδ hn _
  have hp (i : ℕ) : Measurable (past i) := observedPast_measurable cfg ε M start hn _ i
  apply residual_product_of_eventually_stable ν ν f F
    (fun i=>(((finiteCutMemory_measurable cfg ε M start δ hδ hn i).comp (hp i)).prodMk ht.fst).prodMk ht.snd)
    ((hc.prodMk ht.fst).prodMk ht.snd)
  · intro i
    let P := Fin (i+1)→TimedObservation cfg
    let ψ := fun x : P×GoodPhaseObservation n cfg.B=>(finiteCutMemory cfg ε M start δ hδ hn i x.1,x.2)
    have hψ : Measurable ψ := ((finiteCutMemory_measurable cfg ε M start δ hδ hn i).comp measurable_fst).prodMk measurable_snd
    have hm : Measurable (fun x : (P×GoodPhaseObservation n cfg.B)×BoardClockPath n=>(ψ x.1,x.2)) :=
      (hψ.comp measurable_fst).prodMk measurable_snd
    have hi : Measurable (fun ω : BoardClockPath n=>((past i ω,(tr ω).1),(tr ω).2)) :=
      ((hp i).prodMk ht.fst).prodMk ht.snd
    have h := congrArg (fun μ : Measure ((P×GoodPhaseObservation n cfg.B)×BoardClockPath n)=>
      μ.map (fun x=>(ψ x.1,x.2))) (goodPhasePast_terminal_residual_product cfg ε M start hn hB s i)
    change (ν.map (fun ω=>((past i ω,(tr ω).1),(tr ω).2))).map (fun x=>(ψ x.1,x.2))=
      ((ν.map (fun ω=>(past i ω,(tr ω).1))).prod ν).map (fun x=>(ψ x.1,x.2)) at h
    rw [Measure.map_map hm hi,map_pair_with_fresh_right _ ν ψ hψ,
      Measure.map_map hψ ((hp i).prodMk ht.fst)] at h
    exact h
  · filter_upwards [havoid,augRecycledTerminal_done_ae cfg ε M hn hB (goodPhaseStart cfg ε M s).val.1] with ω hω hd
    have hh := finiteCutMemory_stable_actual cfg ε M start δ hδ hn (goodPhaseStart cfg ε M s) ω hcut hω hd
    exact hh.mono (fun i hi=>by dsimp only [f,F,past,cut]; rw [hi])

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodCut_terminal_residual_product
