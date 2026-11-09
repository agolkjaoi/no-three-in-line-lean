import NoThreeLine.GoodCutFutureResidual
import NoThreeLine.AESectionRestart

/-! For almost every old calendar time, the actual old cut and the incoming
state of any later original phase are jointly independent of its actual
remaining board. The initial phase state may itself be random/inherited. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem goodCutFuturePair_joint_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (j k : ℕ) :
    Measurable (fun x : GoodPhaseObservation n B×BoardClockPath n=>goodCutFuturePair cs ε M deadline start δ hδ hn j k x.1 x.2) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  have hr := goodPhaseRecycledPair_measurable cfg ε M t₀ hn
  have hc : Measurable (fun x : GoodPhaseObservation n B×BoardClockPath n=>
      sourceCutTerminal cfg ε M t₀ δ hδ hn (goodPhaseStart cfg ε M x.1) x.2) :=
    (observedRecycledTerminal_measurable cfg ε M (t₀-δ) hn).comp
      ((((sourceRestrictGood_measurable cfg δ hδ).comp
        ((goodPhaseStart_measurable cfg ε M).comp measurable_fst)).subtype_val).prodMk measurable_snd)
  exact (goodRememberedContinuation_measurable cs ε M deadline start hn j k).comp
    ((hc.prodMk hr.fst).prodMk hr.snd)

theorem goodCutFuturePair_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n)
    (s : GoodPhaseObservation n B) (j k : ℕ) (ω : BoardClockPath n) :
    let r := goodPhases cs ε M deadline start hn s j ω
    goodCutFuturePair cs ε M deadline start δ hδ hn j k r.1 r.2=
      ((sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn
          (goodPhaseStart (cs j).config ε M r.1) r.2,
        (goodPhases cs ε M deadline start hn s (j+1+k) ω).1),
        (goodPhases cs ε M deadline start hn s (j+1+k) ω).2) := by
  rw [goodPhaseContinuation_original cs ε M deadline start hn s (j+1) k ω]
  rfl

def scheduledOldCutFuturePair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (j k : ℕ) (u : ℝ) (ω : BoardClockPath n) :
    (TimedObservation (cs j).config×GoodPhaseObservation n B)×BoardClockPath n :=
  let r := goodPhases cs ε M deadline start hn s (j+1+k) ω
  ((scheduledCutObservation cs ε M deadline start hn s j (ω,u),r.1),r.2)

theorem scheduledOldCutFuturePair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (j k : ℕ) (u : ℝ) : Measurable (scheduledOldCutFuturePair cs ε M deadline start hn s j k u) := by
  have hr := goodPhases_measurable cs ε M deadline start hn s (j+1+k)
  exact (((scheduledCutObservation_measurable cs ε M deadline start hn s j).comp
    (measurable_id.prodMk measurable_const)).prodMk hr.fst).prodMk hr.snd

theorem scheduledOldCutFuturePair_residual_product_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j k : ℕ) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→
    (boardClockMeasure n (B/n)).map (scheduledOldCutFuturePair cs ε M deadline start hn s j k u)=
      ((boardClockMeasure n (B/n)).map (fun ω=>(scheduledOldCutFuturePair cs ε M deadline start hn s j k u ω).1)).prod
        (boardClockMeasure n (B/n)) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  let a := fun i (x : GoodPhaseObservation n B×BoardClockPath n)=>(cfg.horizon:ℝ)-
    (observedRecycledPair cfg ε M t₀ hn (goodPhaseStart cfg ε M x.1).val i x.2).1.1.val.2
  have ha (i : ℕ) : Measurable (a i) := measurable_const.sub
    ((observedRecycledPair_joint_measurable cfg ε M t₀ hn i).comp
      (((goodPhaseStart_measurable cfg ε M).comp measurable_fst).subtype_val.prodMk measurable_snd)).fst.fst.subtype_val.snd
  have he := ae_time_avoids_random_endpoints (μ.prod ν) a ha
  filter_upwards [he] with u hu huI
  have hδ : 0≤(cfg.horizon:ℝ)-u := sub_nonneg.mpr huI.2.le
  let K := fun x : GoodPhaseObservation n B×BoardClockPath n=>goodCutFuturePair cs ε M deadline start
    ((cfg.horizon:ℝ)-u) hδ hn j k x.1 x.2
  have hK : Measurable K := goodCutFuturePair_joint_measurable cs ε M deadline start _ hδ hn j k
  have hs : ∀ᵐx ∂μ,ν.map (fun ω=>K (x,ω))=(ν.map (fun ω=>(K (x,ω)).1)).prod ν := by
    filter_upwards [Measure.ae_ae_of_ae_prod hu] with x hx
    exact goodCutFuturePair_residual_product cs ε M deadline start _ hδ hn hB j k x (by linarith [huI.1]) (by
      filter_upwards [hx] with ω hω i
      intro h
      exact hω i (by dsimp only [a]; linarith))
  have hprod := product_restart_of_ae_sections μ ν K hK hs
  let Y := goodPhases cs ε M deadline start hn s j
  have hY : Measurable Y := goodPhases_measurable cs ε M deadline start hn s j
  have hKY : K ∘ Y=scheduledOldCutFuturePair cs ε M deadline start hn s j k u := by
    funext ω
    have hh := goodCutFuturePair_original cs ε M deadline start ((cfg.horizon:ℝ)-u) hδ hn s j k ω
    simpa only [K,Y,Function.comp_def,scheduledOldCutFuturePair,scheduledCutObservation,
      phaseCutObservation,cfg,elapsedCutAmount_coe _ _ huI.2.le] using hh
  rw [←hKY,←Measure.map_map hK hY,goodPhases_residual_product cs ε M deadline start hn hB s j]
  change (μ.prod ν).map K=(ν.map (fun ω=>((K ∘ Y) ω).1)).prod ν
  rw [hprod]
  congr 1
  change ((ν.map (fun ω=>(Y ω).1)).prod ν).map (fun x=>(K x).1)=_
  rw [←goodPhases_residual_product cs ε M deadline start hn hB s j,
    Measure.map_map hK.fst hY]
  rfl

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledOldCutFuturePair_residual_product_ae
