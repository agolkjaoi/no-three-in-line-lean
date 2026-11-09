import NoThreeLine.ObservedPhaseCutTower

/-! Actual deterministic-cut observables have the same weighted mean under
cut credit and credit at the end of the original finite future schedule,
for almost every interior calendar time. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem scheduledCut_future_credit_tower_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j k : ℕ)
    (p : Grid n) (F : ℝ→TimedObservation (cs j).config→ℝ)
    (hF : ∀t,Measurable (F t)) (C : ℝ) (hFC : ∀t v,0≤F t v ∧ F t v≤C) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 ((cs j).horizon : ℝ),
    (∫ω,validAugStateCredit B p
        (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k) ω).1.2.1*
      F t (scheduledCutObservation cs ε M deadline start hn s j (ω,t))
      ∂boardClockMeasure n (B/n))=
    ∫ω,scheduledCutCredit cs ε M deadline start hn s p j (ω,t)*
      F t (scheduledCutObservation cs ε M deadline start hn s j (ω,t))
      ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  have he := observedPhaseFuture_cut_tower_ae cs ε M deadline start hn hB j k μ p F hF C hFC
  filter_upwards [he] with t ht htI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,t),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable (cs j).config ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*F t (U x)
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    augTimedCredit (cs j).config p (U x).1*F t (U x)
  have hf : Measurable f := ((validAugStateCredit_measurable B p).comp
    (observedPhaseFuture_measurable cs ε M deadline start hn j k).fst.snd.fst).mul ((hF t).comp hU)
  have hg : Measurable g := ((augTimedCredit_measurable (cs j).config p).comp hU.fst).mul ((hF t).comp hU)
  have hy := goodPhases_measurable cs ε M deadline start hn s j
  calc
    _ = ∫ω,f (goodPhases cs ε M deadline start hn s j ω) ∂ν := by
      apply integral_congr_ae
      filter_upwards [] with ω
      dsimp only [f]
      rw [observedPhaseFuture_original]
      rfl
    _ = ∫x,f x ∂μ.prod ν := by
      rw [←integral_map_of_stronglyMeasurable hy hf.stronglyMeasurable,
        goodPhases_residual_product cs ε M deadline start hn hB s j]
      rfl
    _ = ∫x,g x ∂μ.prod ν := ht htI
    _ = ∫ω,g (goodPhases cs ε M deadline start hn s j ω) ∂ν := by
      rw [←integral_map_of_stronglyMeasurable hy hg.stronglyMeasurable,
        goodPhases_residual_product cs ε M deadline start hn hB s j]
      rfl
    _ = _ := rfl

theorem scheduledCut_future_point_integral_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j k : ℕ) (p : Grid n)
    (F : ℝ→TimedObservation (cs j).config→ℝ)
    (hF : ∀t,Measurable (F t)) (C : ℝ) (hFC : ∀t v,0≤F t v ∧ F t v≤C) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 ((cs j).horizon : ℝ),
    (∫ω,F t (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,t))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))=
    ∫ω,F t (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,t))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j t := by
  let s := initialGoodPhaseObservation B hB deadline start
  have he := scheduledCut_future_credit_tower_ae cs ε M deadline start hn
    (lt_of_lt_of_le zero_lt_one hB) s j k p F hF C hFC
  filter_upwards [he] with t ht htI
  change (∫ω,F t (scheduledCutObservation cs ε M deadline start hn s j (ω,t))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (phasePointCredit cs ε M deadline start hn hB p (j+1+k)))=
    ∫ω,F t (scheduledCutObservation cs ε M deadline start hn s j (ω,t))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (fun ω=>scheduledCutCredit cs ε M deadline start hn s p j (ω,t))
  have hz : Measurable (fun ω : BoardClockPath n=>scheduledCutCredit cs ε M deadline start hn s p j (ω,t)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn s p j).comp (measurable_id.prodMk measurable_const)
  rw [savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p (j+1+k))
      (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p (j+1+k) ω).1),
    savedCreditMeasure_integral _ _ hz
      (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn s p j (ω,t)).1)]
  have hcredit (ω : BoardClockPath n) : validAugStateCredit B p
      (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k) ω).1.2.1=
      phasePointCredit cs ε M deadline start hn hB p (j+1+k) ω := by
    change validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s.val (j+1+k) ω).1=_
    rw [observedRecycledPhaseState_base]
    rfl
  simpa only [hcredit] using ht htI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledCut_future_credit_tower_ae
#print axioms NoThreeLine.BirthWitness.scheduledCut_future_point_integral_ae
