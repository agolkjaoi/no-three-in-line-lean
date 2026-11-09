import NoThreeLine.ObservedCutAETower
import NoThreeLine.ScheduledCutPointLaw

/-! Mix the actual cut tower with a random inherited phase state. No
semigroup identity for separately chosen ODE flows is used. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def observedPhaseFuture {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (x : GoodPhaseObservation n B×BoardClockPath n) :
    (ℕ×PhaseObservation n B)×BoardClockPath n :=
  observedThroughPhaseTail cs ε M deadline start hn j k
    (goodPhaseStart (cs j).config ε M x.1).val x.2

theorem observedPhaseFuture_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) :
    Measurable (observedPhaseFuture cs ε M deadline start hn j k) :=
  (observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
    ((observedRecycledTerminalPair_measurable (cs j).config ε M (phaseEndpoint cs start j) hn).comp
      (((goodPhaseStart_measurable (cs j).config ε M).comp measurable_fst).subtype_val.prodMk measurable_snd))

theorem observedPhaseFuture_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (s : GoodPhaseObservation n B) (j k : ℕ) (ω : BoardClockPath n) :
    observedPhaseFuture cs ε M deadline start hn j k (goodPhases cs ε M deadline start hn s j ω)=
      observedRecycledPhases cs ε M deadline start hn s.val (j+1+k) ω := by
  have hr := congrArg Prod.snd (goodPhases_projection cs ε M deadline start hn s j ω)
  simp only [Prod.snd] at hr
  dsimp only [observedPhaseFuture,goodPhaseStart]
  rw [goodPhases_state_projection,hr]
  exact observedThroughPhaseTail_original cs ε M deadline start hn s.val j k ω

theorem observedPhaseFuture_cut_tower_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (μ : Measure (GoodPhaseObservation n B)) [IsProbabilityMeasure μ]
    (p : Grid n) (F : ℝ→TimedObservation (cs j).config→ℝ)
    (hF : ∀t,Measurable (F t)) (C : ℝ) (hFC : ∀t v,0≤F t v ∧ F t v≤C) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 ((cs j).horizon : ℝ),
    (∫x,validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*
      F t (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,t),x.2))
      ∂μ.prod (boardClockMeasure n (B/n)))=
    ∫x,phaseCutCredit (cs j).config ε M (phaseEndpoint cs start j) hn p ((x.1,t),x.2)*
      F t (phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,t),x.2))
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
  filter_upwards [he] with t ht htI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation cfg ε M t₀ hn ((x.1,t),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable cfg ε M t₀ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*F t (U x)
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>augTimedCredit cfg p (U x).1*F t (U x)
  have hf : Measurable f := ((validAugStateCredit_measurable B p).comp
    (observedPhaseFuture_measurable cs ε M deadline start hn j k).fst.snd.fst).mul ((hF t).comp hU)
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp hU.fst).mul ((hF t).comp hU)
  have hfi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (B*C)
    (fun x=>⟨mul_nonneg (validAugStateCredit_bounds B p _).1 (hFC t (U x)).1,
      mul_le_mul (validAugStateCredit_bounds B p _).2 (hFC t (U x)).2 (hFC t (U x)).1 hB.le⟩)
  have hgi : Integrable g (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (B*C)
    (fun x=>⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (hFC t (U x)).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hFC t (U x)).2 (hFC t (U x)).1 hB.le⟩)
  change (∫x,f x ∂μ.prod ν)=∫x,g x ∂μ.prod ν
  rw [integral_prod _ hfi,integral_prod _ hgi]
  apply integral_congr_ae
  filter_upwards [Measure.ae_ae_of_ae_prod ht] with s hs
  have hδ : 0≤cfg.horizon-t := sub_nonneg.mpr htI.2.le
  have hh := observedFuture_actual_cut_tower_of_ae_avoid cs ε M deadline start (cfg.horizon-t)
    hδ hn hB j k (goodPhaseStart cfg ε M s) (by change cfg.horizon-t<cfg.horizon; linarith [htI.1])
    p (F t) (hF t) C (hFC t) (by
      filter_upwards [hs] with ω hω i
      intro h
      apply hω i
      dsimp only [a]
      linarith)
  simpa only [f,g,U,phaseCutObservation,elapsedCutAmount_coe _ _ htI.2.le,
    observedPhaseFuture,cfg,t₀,ν] using hh

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedPhaseFuture_original
#print axioms NoThreeLine.BirthWitness.observedPhaseFuture_cut_tower_ae
