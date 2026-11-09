import NoThreeLine.ObservedTwoCutTower
import NoThreeLine.ObservedPhaseCutTower

/-! Mix the genuine two-cut tower over arbitrary inherited phase-state
laws. Endpoint exceptions are removed jointly with the incoming state
and residual board before applying the actual fixed-state tower. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem observedPhaseFuture_two_cut_tower_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ]
    (p : Grid n) (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 ((cs j).horizon : ℝ) → u∈Ioo 0 v →
    (∫x,validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*
      F u v (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2),
        phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,v),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)))=
    ∫x,phaseCutCredit (cs j).config ε M (phaseEndpoint cs start j) hn p ((x.1,v),x.2)*
      F u v (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2),
        phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,v),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun i (x : GoodPhaseObservation n B×BoardClockPath n)=>cfg.horizon-
    (observedRecycledPair cfg ε M t₀ hn (goodPhaseStart cfg ε M x.1).val i x.2).1.1.val.2
  have ha (i : ℕ) : Measurable (a i) := measurable_const.sub
    ((observedRecycledPair_joint_measurable cfg ε M t₀ hn i).comp
      (((goodPhaseStart_measurable cfg ε M).comp measurable_fst).subtype_val.prodMk measurable_snd)).fst.fst.subtype_val.snd
  have he := ae_time_avoids_random_endpoints (μ.prod ν) a ha
  filter_upwards [he] with v hv
  filter_upwards [he] with u hu hvI huI
  have huH : u∈Ioo 0 (cfg.horizon:ℝ) := ⟨huI.1,huI.2.trans hvI.2⟩
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>phaseCutObservation cfg ε M t₀ hn ((x.1,u),x.2)
  let V := fun x : GoodPhaseObservation n B×BoardClockPath n=>phaseCutObservation cfg ε M t₀ hn ((x.1,v),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M t₀ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := (phaseCutObservation_measurable cfg ε M t₀ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*F u v (U x,V x)
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>augTimedCredit cfg p (V x).1*F u v (U x,V x)
  have hf : Measurable f := ((validAugStateCredit_measurable B p).comp
    (observedPhaseFuture_measurable cs ε M deadline start hn j k).fst.snd.fst).mul ((hF u v).comp (hU.prodMk hV))
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp hV.fst).mul ((hF u v).comp (hU.prodMk hV))
  have hfi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (B*A)
    (fun x=>⟨mul_nonneg (validAugStateCredit_bounds B p _).1 (hFA u v (U x,V x)).1,
      mul_le_mul (validAugStateCredit_bounds B p _).2 (hFA u v (U x,V x)).2 (hFA u v (U x,V x)).1 hB.le⟩)
  have hgi : Integrable g (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (B*A)
    (fun x=>⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (hFA u v (U x,V x)).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hFA u v (U x,V x)).2 (hFA u v (U x,V x)).1 hB.le⟩)
  change (∫x,f x ∂μ.prod ν)=∫x,g x ∂μ.prod ν
  rw [integral_prod _ hfi,integral_prod _ hgi]
  apply integral_congr_ae
  filter_upwards [Measure.ae_ae_of_ae_prod hu,Measure.ae_ae_of_ae_prod hv] with s hsU hsV
  have hh := observedFuture_two_actual_cuts_tower_of_ae_avoid cs ε M deadline start
    (cfg.horizon-u) (cfg.horizon-v) (sub_nonneg.mpr huH.2.le) (sub_nonneg.mpr hvI.2.le)
    hn hB j k (goodPhaseStart cfg ε M s) p (by linarith [huI.2])
    (by change cfg.horizon-u<cfg.horizon; linarith [huI.1]) (F u v) (hF u v) A (hFA u v) (by
      filter_upwards [hsU] with ω hω i
      intro h
      apply hω i
      dsimp only [a]
      linarith) (by
      filter_upwards [hsV] with ω hω i
      intro h
      apply hω i
      dsimp only [a]
      linarith)
  simpa only [f,g,U,V,phaseCutObservation,elapsedCutAmount_coe _ _ huH.2.le,
    elapsedCutAmount_coe _ _ hvI.2.le,observedPhaseFuture,cfg,t₀,ν] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedPhaseFuture_two_cut_tower_ae
