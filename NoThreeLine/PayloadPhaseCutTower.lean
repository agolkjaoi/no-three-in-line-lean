import NoThreeLine.ObservedPhaseCutTower

/-! The actual cut/future-credit tower with an arbitrary measurable old
payload carried alongside the inherited phase input. Its joint law is
explicit measure data; applications must supply the real residual law. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem payloadPhaseFuture_cut_tower_ae {X : Type*} [MeasurableSpace X] {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (μ : Measure X) [IsProbabilityMeasure μ]
    (incoming : X→GoodPhaseObservation n B) (hincoming : Measurable incoming)
    (p : Grid n) (F : ℝ→X×TimedObservation (cs j).config→ℝ)
    (hF : ∀t,Measurable (F t)) (A : ℝ) (hFA : ∀t x,0≤F t x ∧ F t x≤A) :
    ∀ᵐt : ℝ ∂volume,t∈Ioo 0 ((cs j).horizon:ℝ)→
    (∫x,validAugStateCredit B p
        (observedPhaseFuture cs ε M deadline start hn j k (incoming x.1,x.2)).1.2.1*
      F t (x.1,phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((incoming x.1,t),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)))=
    ∫x,augTimedCredit (cs j).config p
        (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((incoming x.1,t),x.2)).1*
      F t (x.1,phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((incoming x.1,t),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun i (x : X×BoardClockPath n)=>(cfg.horizon:ℝ)-
    (observedRecycledPair cfg ε M t₀ hn (goodPhaseStart cfg ε M (incoming x.1)).val i x.2).1.1.val.2
  have ha (i : ℕ) : Measurable (a i) := measurable_const.sub
    ((observedRecycledPair_joint_measurable cfg ε M t₀ hn i).comp
      (((goodPhaseStart_measurable cfg ε M).comp (hincoming.comp measurable_fst)).subtype_val.prodMk measurable_snd)).fst.fst.subtype_val.snd
  have he := ae_time_avoids_random_endpoints (μ.prod ν) a ha
  filter_upwards [he] with t ht htI
  let U := fun x : X×BoardClockPath n=>phaseCutObservation cfg ε M t₀ hn ((incoming x.1,t),x.2)
  let V := fun x : X×BoardClockPath n=>observedPhaseFuture cs ε M deadline start hn j k (incoming x.1,x.2)
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M t₀ hn).comp
    (((hincoming.comp measurable_fst).prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := (observedPhaseFuture_measurable cs ε M deadline start hn j k).comp
    ((hincoming.comp measurable_fst).prodMk measurable_snd)
  let test := fun x : X×BoardClockPath n=>F t (x.1,U x)
  have htest : Measurable test := (hF t).comp (measurable_fst.prodMk hU)
  let f := fun x=>validAugStateCredit B p (V x).1.2.1*test x
  let g := fun x=>augTimedCredit cfg p (U x).1*test x
  have hf : Measurable f := ((validAugStateCredit_measurable B p).comp hV.fst.snd.fst).mul htest
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp hU.fst).mul htest
  have hfi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (B*A)
    (fun x=>⟨mul_nonneg (validAugStateCredit_bounds B p _).1 (hFA t (x.1,U x)).1,
      mul_le_mul (validAugStateCredit_bounds B p _).2 (hFA t (x.1,U x)).2 (hFA t (x.1,U x)).1 hB.le⟩)
  have hgi : Integrable g (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (B*A)
    (fun x=>⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (hFA t (x.1,U x)).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hFA t (x.1,U x)).2 (hFA t (x.1,U x)).1 hB.le⟩)
  change (∫x,f x ∂μ.prod ν)=∫x,g x ∂μ.prod ν
  rw [integral_prod _ hfi,integral_prod _ hgi]
  apply integral_congr_ae
  filter_upwards [Measure.ae_ae_of_ae_prod ht] with x hx
  have hδ : 0≤(cfg.horizon:ℝ)-t := sub_nonneg.mpr htI.2.le
  have hh := observedFuture_actual_cut_tower_of_ae_avoid cs ε M deadline start ((cfg.horizon:ℝ)-t)
    hδ hn hB j k (goodPhaseStart cfg ε M (incoming x)) (by change cfg.horizon-t<cfg.horizon; linarith [htI.1])
    p (fun v=>F t (x,v)) ((hF t).comp (measurable_const.prodMk measurable_id)) A (fun v=>hFA t (x,v)) (by
      filter_upwards [hx] with ω hω i
      intro h
      exact hω i (by dsimp only [a]; linarith))
  simpa only [f,g,test,U,V,phaseCutObservation,observedPhaseFuture,cfg,t₀,ν,
    elapsedCutAmount_coe _ _ htI.2.le] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.payloadPhaseFuture_cut_tower_ae
