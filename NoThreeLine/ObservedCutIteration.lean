import NoThreeLine.ObservedCrossingTest
import NoThreeLine.ObservedHistoryFutureCredit

/-! Move the actual one-step strict-cut identity through recycled clocks
and then through the true finite future schedule. This is one indexed cut
interval; summing all possible intervals is a separate final passage. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem independent_pair_integral_congr_fibers {Ω H W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω→H) (r : Ω→W) (hh : Measurable h) (hr : Measurable r)
    (hpair : μ.map (fun ω=>(h ω,r ω))=(μ.map h).prod ν)
    (f g : H×W→ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map h).prod ν)) (hgi : Integrable g ((μ.map h).prod ν))
    (he : ∀a,(∫w,f (a,w) ∂ν)=∫w,g (a,w) ∂ν) :
    (∫ω,f (h ω,r ω) ∂μ)=∫ω,g (h ω,r ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map h) := Measure.isProbabilityMeasure_map hh.aemeasurable
  rw [←integral_map_of_stronglyMeasurable (hh.prodMk hr) hf.stronglyMeasurable,
    ←integral_map_of_stronglyMeasurable (hh.prodMk hr) hg.stronglyMeasurable,hpair,
    integral_prod _ hfi,integral_prod _ hgi]
  exact integral_congr_ae (Filter.Eventually.of_forall he)

namespace BirthWitness

theorem observedRecycledPair_residual_product {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (s : TimedObservation cfg) (i : ℕ) :
    (boardClockMeasure n (cfg.B/n)).map (observedRecycledPair cfg ε M start hn s i)=
      ((boardClockMeasure n (cfg.B/n)).map (fun ω=>(observedRecycledPair cfg ε M start hn s i ω).1)).prod
        (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  have h := observedRecycledPair_map cfg ε M start hn (cfg.B/n) (div_pos hB (by exact_mod_cast hn)) s i
  have hp := congrArg (fun μ : Measure (TimedObservation cfg×BoardClockPath n)=>μ.map Prod.fst) h
  rw [Measure.map_map measurable_fst (observedRecycledPair_measurable cfg ε M start hn s i),
    Measure.map_fst_prod,measure_univ,one_smul] at hp
  rw [h]
  exact congrArg (fun μ : Measure (TimedObservation cfg)=>μ.prod (boardClockMeasure n (cfg.B/n))) hp.symm

theorem observedRecycled_crossing_tower {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : TimedObservation cfg)
    (p : Grid n) (i : ℕ) (F : TimedObservation cfg→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C) :
    (∫ω,augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s (i+1) ω).1.1*
      cutCrossingTest cfg ε M start δ hδ hn F
        ((observedRecycledPair cfg ε M start hn s i ω).1,(observedRecycledPair cfg ε M start hn s (i+1) ω).1)
      ∂boardClockMeasure n (cfg.B/n))=
    ∫ω,augTimedCredit cfg p
      (interiorCutObservation cfg ε M start δ hδ hn (observedRecycledPair cfg ε M start hn s i ω).1).1*
      cutCrossingTest cfg ε M start δ hδ hn F
        ((observedRecycledPair cfg ε M start hn s i ω).1,(observedRecycledPair cfg ε M start hn s (i+1) ω).1)
      ∂boardClockMeasure n (cfg.B/n) := by
  let μ := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun ω=>(observedRecycledPair cfg ε M start hn s i ω).1
  let r := fun ω=>(observedRecycledPair cfg ε M start hn s i ω).2
  have ha : Measurable a := (observedRecycledPair_measurable cfg ε M start hn s i).fst
  have hr : Measurable r := (observedRecycledPair_measurable cfg ε M start hn s i).snd
  letI : IsProbabilityMeasure (μ.map a) := Measure.isProbabilityMeasure_map ha.aemeasurable
  let test := fun x : TimedObservation cfg×BoardClockPath n=>
    cutCrossingTest cfg ε M start δ hδ hn F (x.1,observedClockStep cfg ε M start hn x)
  let f := fun x : TimedObservation cfg×BoardClockPath n=>augTimedCredit cfg p (observedClockStep cfg ε M start hn x).1*test x
  let g := fun x : TimedObservation cfg×BoardClockPath n=>
    augTimedCredit cfg p (interiorCutObservation cfg ε M start δ hδ hn x.1).1*test x
  have ht : Measurable test := (cutCrossingTest_measurable cfg ε M start δ hδ hn F hF).comp
    (measurable_fst.prodMk (observedClockStep_measurable cfg ε M start hn))
  have hf : Measurable f := ((augTimedCredit_measurable cfg p).comp
    (observedClockStep_measurable cfg ε M start hn).fst).mul ht
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp
    (((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp measurable_fst).fst)).mul ht
  have htB (x : TimedObservation cfg×BoardClockPath n) : 0≤test x ∧ test x≤C :=
    cutCrossingTest_bounds cfg ε M start δ hδ hn F C hFC _
  have hfi : Integrable f ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (cfg.B*C) (fun x=>
      ⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (htB x).1,
        mul_le_mul (augTimedCredit_bounds cfg p _).2 (htB x).2 (htB x).1 hB.le⟩)
  have hgi : Integrable g ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (cfg.B*C) (fun x=>
      ⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (htB x).1,
        mul_le_mul (augTimedCredit_bounds cfg p _).2 (htB x).2 (htB x).1 hB.le⟩)
  exact independent_pair_integral_congr_fibers μ μ a r ha hr
    (observedRecycledPair_residual_product cfg ε M start hn hB s i) f g hf hg hfi hgi
    (fun v=>observedCut_crossing_test_tower cfg ε M start δ hδ hn hB hm v p F)

theorem observedFuture_crossing_tower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<B)
    (j k i : ℕ) (s : TimedObservation (cs j).config) (p : Grid n)
    (F : TimedObservation (cs j).config→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C) :
    let cfg := (cs j).config
    let t₀ := phaseEndpoint cs start j
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1*
      cutCrossingTest cfg ε M t₀ δ hδ hn F
        ((observedRecycledPair cfg ε M t₀ hn s i ω).1,(observedRecycledPair cfg ε M t₀ hn s (i+1) ω).1)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit cfg p
      (interiorCutObservation cfg ε M t₀ δ hδ hn (observedRecycledPair cfg ε M t₀ hn s i ω).1).1*
      cutCrossingTest cfg ε M t₀ δ hδ hn F
        ((observedRecycledPair cfg ε M t₀ hn s i ω).1,(observedRecycledPair cfg ε M t₀ hn s (i+1) ω).1)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let G := fun v : Fin ((i+1)+1)→TimedObservation cfg=>
    cutCrossingTest cfg ε M t₀ δ hδ hn F (v (Fin.castSucc (Fin.last i)),v (Fin.last (i+1)))
  have hG : Measurable G := (cutCrossingTest_measurable cfg ε M t₀ δ hδ hn F hF).comp
    ((measurable_pi_apply (Fin.castSucc (Fin.last i))).prodMk (measurable_pi_apply (Fin.last (i+1))))
  have hGC (v : Fin ((i+1)+1)→TimedObservation cfg) : 0≤G v ∧ G v≤C :=
    cutCrossingTest_bounds cfg ε M t₀ δ hδ hn F C hFC _
  exact (observedThroughPhaseTail_history_integral cs ε M deadline start hn hB j k (i+1) s p G hG C hGC).trans
    (observedRecycled_crossing_tower cfg ε M t₀ δ hδ hn hB (cs j).mask_le_one s p i F hF C hFC)

end BirthWitness
end NoThreeLine
#print axioms NoThreeLine.BirthWitness.observedRecycled_crossing_tower
#print axioms NoThreeLine.BirthWitness.observedFuture_crossing_tower
