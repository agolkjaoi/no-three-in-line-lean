import NoThreeLine.StableResidualProduct

/-! Retain every state and birth record through a fixed old segment index
together with the actual phase terminal observation. The terminal residual
board is independent of this whole payload, not merely of its physical
projection or the endpoint state. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Filter
namespace NoThreeLine.BirthWitness

def observedPast {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (i : ℕ) (ω : BoardClockPath n) : Fin (i+1)→TimedObservation cfg :=
  fun j=>(observedRecycledPair cfg ε M start hn s j.val ω).1

theorem observedPast_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (i : ℕ) : Measurable (observedPast cfg ε M start hn s i) :=
  measurable_pi_lambda _ (fun j=>(observedRecycledPair_measurable cfg ε M start hn s j.val).fst)

theorem observedPast_state_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : TimedObservation cfg) (i k : ℕ) (hik : i≤k) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>
      ((observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s k ω).1),
        (observedRecycledPair cfg ε M start hn s k ω).2))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>
        (observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s k ω).1))).prod
          (boardClockMeasure n (cfg.B/n)) := by
  let μ := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability cfg hn hB
  let H := fun ω : BoardClockPath n=>
    ((fun j : Fin (k+1)=>(observedRecycledPair cfg ε M start hn s j.val ω).1),
      (observedRecycledPair cfg ε M start hn s k ω).2)
  let ψ := fun a : Fin (k+1)→TimedObservation cfg=>
    ((fun j : Fin (i+1)=>a (Fin.castLE (Nat.succ_le_succ hik) j)),a (Fin.last k))
  let ρ := (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
    (fun ω=>fun j : Fin (k+1)=>observedNoiseState cfg ε M start hn s j.val ω)
  have hnoise : Measurable (fun ω : PhaseNoise n=>fun j : Fin (k+1)=>
      observedNoiseState cfg ε M start hn s j.val ω) :=
    measurable_pi_lambda _ (fun j=>(observedNoiseState_joint_measurable cfg ε M start hn j.val).comp
      (measurable_const.prodMk measurable_id))
  letI : IsProbabilityMeasure ρ := Measure.isProbabilityMeasure_map hnoise.aemeasurable
  have hH : Measurable H := (observedPast_measurable cfg ε M start hn s k).prodMk
    (observedRecycledPair_measurable cfg ε M start hn s k).snd
  have hψ : Measurable ψ :=
    (measurable_pi_lambda _ (fun j=>measurable_pi_apply (Fin.castLE (Nat.succ_le_succ hik) j))).prodMk
      (measurable_pi_apply (Fin.last k))
  have hp : Measurable (fun z : (Fin (k+1)→TimedObservation cfg)×BoardClockPath n=>(ψ z.1,z.2)) :=
    (hψ.comp measurable_fst).prodMk measurable_snd
  have hmap : μ.map H=ρ.prod μ :=
    observedRecycledHistory_residual_map cfg ε M start hn (cfg.B/n)
      (div_pos hB (by exact_mod_cast hn)) s k
  have h := congrArg (fun ν : Measure ((Fin (k+1)→TimedObservation cfg)×BoardClockPath n)=>
    ν.map (fun z=>(ψ z.1,z.2))) hmap
  rw [Measure.map_map hp hH,map_pair_with_fresh_right ρ μ ψ hψ] at h
  have hproj := congrArg (fun ν : Measure (((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n)=>
    ν.map Prod.fst) h
  rw [Measure.map_map measurable_fst (hp.comp hH),Measure.map_fst_prod,measure_univ,one_smul] at hproj
  rw [←hproj] at h
  exact h

theorem observedPast_terminal_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : TimedObservation cfg) (i : ℕ) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω=>
      ((observedPast cfg ε M start hn s i ω,observedRecycledTerminal cfg ε M start hn (s,ω)),
        (observedRecycledTerminalPair cfg ε M start hn (s,ω)).2))=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>
        (observedPast cfg ε M start hn s i ω,observedRecycledTerminal cfg ε M start hn (s,ω)))).prod
          (boardClockMeasure n (cfg.B/n)) := by
  let μ := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let f := fun k ω=>
    ((observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s (i+k) ω).1),
      (observedRecycledPair cfg ε M start hn s (i+k) ω).2)
  let F := fun ω=>
    ((observedPast cfg ε M start hn s i ω,observedRecycledTerminal cfg ε M start hn (s,ω)),
      (observedRecycledTerminalPair cfg ε M start hn (s,ω)).2)
  have hpast := observedPast_measurable cfg ε M start hn s i
  have hterm : Measurable (fun ω=>observedRecycledTerminalPair cfg ε M start hn (s,ω)) :=
    (observedRecycledTerminalPair_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  apply residual_product_of_eventually_stable μ μ f F
    (fun k=>(hpast.prodMk (observedRecycledPair_measurable cfg ε M start hn s (i+k)).fst).prodMk
      (observedRecycledPair_measurable cfg ε M start hn s (i+k)).snd)
    ((hpast.prodMk hterm.fst).prodMk hterm.snd)
    (fun k=>observedPast_state_residual_product cfg ε M start hn hB s i (i+k) (Nat.le_add_right i k))
  filter_upwards [observedRecycledTerminalPair_stable_ae cfg ε M start hn hB s] with ω hω
  obtain ⟨K,hK⟩ := eventually_atTop.mp hω
  filter_upwards [eventually_ge_atTop K] with k hk
  have he := hK (i+k) (hk.trans (Nat.le_add_left k i))
  dsimp only [f,F]
  rw [he]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedPast_state_residual_product
#print axioms NoThreeLine.BirthWitness.observedPast_terminal_residual_product
