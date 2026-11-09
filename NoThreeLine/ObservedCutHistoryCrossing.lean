import NoThreeLine.ObservedCutIteration

/-! The strict-crossing credit identity retains the complete old history
as well as the cut probe. This is the payload needed for an older cut;
no old active/line-credit values are reconstructed from the later state. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def cutHistoryCrossingTest {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) (i : ℕ) (H : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg→ℝ)
    (x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×TimedObservation cfg) : ℝ :=
  if crossesCut cfg δ x.1.2 x.2 then H (x.1.1,interiorCutObservation cfg ε M start δ hδ hn x.1.2) else 0

theorem cutHistoryCrossingTest_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (i : ℕ)
    (H : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg→ℝ) (hH : Measurable H) :
    Measurable (cutHistoryCrossingTest cfg ε M start δ hδ hn i H) := by
  apply Measurable.ite
  · exact (measurableSet_lt ((measurable_subtype_coe.comp measurable_snd.fst).snd) measurable_const).inter
      (measurableSet_lt measurable_const ((measurable_subtype_coe.comp measurable_fst.snd.fst).snd))
  · exact hH.comp (measurable_fst.fst.prodMk
      ((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp measurable_fst.snd))
  · exact measurable_const

theorem cutHistoryCrossingTest_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (i : ℕ)
    (H : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg→ℝ)
    (A : ℝ) (hH : ∀x,0≤H x ∧ H x≤A)
    (x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×TimedObservation cfg) :
    0≤cutHistoryCrossingTest cfg ε M start δ hδ hn i H x ∧
      cutHistoryCrossingTest cfg ε M start δ hδ hn i H x≤A := by
  unfold cutHistoryCrossingTest
  split_ifs
  · exact hH _
  · exact ⟨le_rfl,(hH (x.1.1,x.2)).1.trans (hH (x.1.1,x.2)).2⟩

theorem observedRecycled_crossing_history_tower {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : TimedObservation cfg) (p : Grid n) (i : ℕ)
    (H : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg→ℝ) (hH : Measurable H)
    (A : ℝ) (hHA : ∀x,0≤H x ∧ H x≤A) :
    (∫ω,augTimedCredit cfg p (observedRecycledPair cfg ε M start hn s (i+1) ω).1.1*
      cutHistoryCrossingTest cfg ε M start δ hδ hn i H
        ((observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s i ω).1),
          (observedRecycledPair cfg ε M start hn s (i+1) ω).1)
      ∂boardClockMeasure n (cfg.B/n))=
    ∫ω,augTimedCredit cfg p
      (interiorCutObservation cfg ε M start δ hδ hn (observedRecycledPair cfg ε M start hn s i ω).1).1*
      cutHistoryCrossingTest cfg ε M start δ hδ hn i H
        ((observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s i ω).1),
          (observedRecycledPair cfg ε M start hn s (i+1) ω).1)
      ∂boardClockMeasure n (cfg.B/n) := by
  let μ := boardClockMeasure n (cfg.B/n)
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  let a := fun ω=>(observedPast cfg ε M start hn s i ω,(observedRecycledPair cfg ε M start hn s i ω).1)
  let r := fun ω=>(observedRecycledPair cfg ε M start hn s i ω).2
  have ha : Measurable a := (observedPast_measurable cfg ε M start hn s i).prodMk
    (observedRecycledPair_measurable cfg ε M start hn s i).fst
  have hr : Measurable r := (observedRecycledPair_measurable cfg ε M start hn s i).snd
  letI : IsProbabilityMeasure (μ.map a) := Measure.isProbabilityMeasure_map ha.aemeasurable
  let step := fun x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n=>
    observedClockStep cfg ε M start hn (x.1.2,x.2)
  let test := fun x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n=>
    cutHistoryCrossingTest cfg ε M start δ hδ hn i H (x.1,step x)
  let f := fun x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n=>
    augTimedCredit cfg p (step x).1*test x
  let g := fun x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n=>
    augTimedCredit cfg p (interiorCutObservation cfg ε M start δ hδ hn x.1.2).1*test x
  have hstep : Measurable step := (observedClockStep_measurable cfg ε M start hn).comp
    (measurable_fst.snd.prodMk measurable_snd)
  have ht : Measurable test := (cutHistoryCrossingTest_measurable cfg ε M start δ hδ hn i H hH).comp
    (measurable_fst.prodMk hstep)
  have hf : Measurable f := ((augTimedCredit_measurable cfg p).comp hstep.fst).mul ht
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp
    (((interiorCutObservation_measurable cfg ε M start δ hδ hn).comp measurable_fst.snd).fst)).mul ht
  have htB (x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n) :
      0≤test x ∧ test x≤A := cutHistoryCrossingTest_bounds cfg ε M start δ hδ hn i H A hHA _
  have hfi : Integrable f ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (cfg.B*A) (fun x=>
      ⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (htB x).1,
        mul_le_mul (augTimedCredit_bounds cfg p _).2 (htB x).2 (htB x).1 hB.le⟩)
  have hgi : Integrable g ((μ.map a).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (cfg.B*A) (fun x=>
      ⟨mul_nonneg (augTimedCredit_bounds cfg p _).1 (htB x).1,
        mul_le_mul (augTimedCredit_bounds cfg p _).2 (htB x).2 (htB x).1 hB.le⟩)
  apply independent_pair_integral_congr_fibers μ μ a r ha hr
    (observedPast_state_residual_product cfg ε M start hn hB s i i le_rfl) f g hf hg hfi hgi
  intro v
  exact observedCut_crossing_test_tower cfg ε M start δ hδ hn hB hm v.2 p (fun u=>H (v.1,u))

theorem observedFuture_crossing_history_tower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hB : 0<B)
    (j k i : ℕ) (s : TimedObservation (cs j).config) (p : Grid n)
    (H : (Fin (i+1)→TimedObservation (cs j).config)×TimedObservation (cs j).config→ℝ)
    (hH : Measurable H) (A : ℝ) (hHA : ∀x,0≤H x ∧ H x≤A) :
    let cfg := (cs j).config
    let t₀ := phaseEndpoint cs start j
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1*
      cutHistoryCrossingTest cfg ε M t₀ δ hδ hn i H
        ((observedPast cfg ε M t₀ hn s i ω,(observedRecycledPair cfg ε M t₀ hn s i ω).1),
          (observedRecycledPair cfg ε M t₀ hn s (i+1) ω).1)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit cfg p
      (interiorCutObservation cfg ε M t₀ δ hδ hn (observedRecycledPair cfg ε M t₀ hn s i ω).1).1*
      cutHistoryCrossingTest cfg ε M t₀ δ hδ hn i H
        ((observedPast cfg ε M t₀ hn s i ω,(observedRecycledPair cfg ε M t₀ hn s i ω).1),
          (observedRecycledPair cfg ε M t₀ hn s (i+1) ω).1)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let G := fun v : Fin ((i+1)+1)→TimedObservation cfg=>
    cutHistoryCrossingTest cfg ε M t₀ δ hδ hn i H
      (((fun q=>v q.castSucc),v (Fin.castSucc (Fin.last i))),v (Fin.last (i+1)))
  have hG : Measurable G := (cutHistoryCrossingTest_measurable cfg ε M t₀ δ hδ hn i H hH).comp
    (((measurable_pi_lambda _ (fun q=>measurable_pi_apply q.castSucc)).prodMk
      (measurable_pi_apply (Fin.castSucc (Fin.last i)))).prodMk (measurable_pi_apply (Fin.last (i+1))))
  have hGA (v : Fin ((i+1)+1)→TimedObservation cfg) : 0≤G v ∧ G v≤A :=
    cutHistoryCrossingTest_bounds cfg ε M t₀ δ hδ hn i H A hHA _
  exact (observedThroughPhaseTail_history_integral cs ε M deadline start hn hB j k (i+1) s p G hG A hGA).trans
    (observedRecycled_crossing_history_tower cfg ε M t₀ δ hδ hn hB (cs j).mask_le_one s p i H hH A hHA)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedRecycled_crossing_history_tower
#print axioms NoThreeLine.BirthWitness.observedFuture_crossing_history_tower
