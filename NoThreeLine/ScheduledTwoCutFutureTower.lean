import NoThreeLine.ObservedPhaseTwoCutTower

/-! The original inherited phase-state/residual-board product law gives
the genuine two-cut tower on the full original schedule. The canonical
root-credit point measure is compared to the later actual cut measure. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem scheduled_two_cut_future_credit_tower_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j k : ℕ)
    (p : Grid n) (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 ((cs j).horizon : ℝ) → u∈Ioo 0 v →
    (∫ω,validAugStateCredit B p
        (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k) ω).1.2.1*
      F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
        scheduledCutObservation cs ε M deadline start hn s j (ω,v))
      ∂boardClockMeasure n (B/n))=
    ∫ω,scheduledCutCredit cs ε M deadline start hn s p j (ω,v)*
      F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
        scheduledCutObservation cs ε M deadline start hn s j (ω,v))
      ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  have he := observedPhaseFuture_two_cut_tower_ae cs ε M deadline start hn hB j k μ p F hF A hFA
  filter_upwards [he] with v hv
  filter_upwards [hv] with u hu hvI huI
  let U := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,u),x.2)
  let V := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation (cs j).config ε M (phaseEndpoint cs start j) hn ((x.1,v),x.2)
  have hU : Measurable U := (phaseCutObservation_measurable (cs j).config ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hV : Measurable V := (phaseCutObservation_measurable (cs j).config ε M _ hn).comp
    ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    validAugStateCredit B p (observedPhaseFuture cs ε M deadline start hn j k x).1.2.1*F u v (U x,V x)
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>
    augTimedCredit (cs j).config p (V x).1*F u v (U x,V x)
  have hf : Measurable f := ((validAugStateCredit_measurable B p).comp
    (observedPhaseFuture_measurable cs ε M deadline start hn j k).fst.snd.fst).mul ((hF u v).comp (hU.prodMk hV))
  have hg : Measurable g := ((augTimedCredit_measurable (cs j).config p).comp hV.fst).mul ((hF u v).comp (hU.prodMk hV))
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
    _ = ∫x,g x ∂μ.prod ν := hu hvI huI
    _ = ∫ω,g (goodPhases cs ε M deadline start hn s j ω) ∂ν := by
      rw [←integral_map_of_stronglyMeasurable hy hg.stronglyMeasurable,
        goodPhases_residual_product cs ε M deadline start hn hB s j]
      rfl
    _ = _ := rfl

theorem scheduled_two_cut_future_point_integral_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j k : ℕ) (p : Grid n)
    (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 ((cs j).horizon : ℝ) → u∈Ioo 0 v →
    (∫ω,F u v (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,u),
      scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,v))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))=
    ∫ω,F u v (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,u),
      scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,v))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j v := by
  let s := initialGoodPhaseObservation B hB deadline start
  have he := scheduled_two_cut_future_credit_tower_ae cs ε M deadline start hn
    (lt_of_lt_of_le zero_lt_one hB) s j k p F hF A hFA
  filter_upwards [he] with v hv
  filter_upwards [hv] with u hu hvI huI
  change (∫ω,F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
      scheduledCutObservation cs ε M deadline start hn s j (ω,v))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (phasePointCredit cs ε M deadline start hn hB p (j+1+k)))=
    ∫ω,F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
      scheduledCutObservation cs ε M deadline start hn s j (ω,v))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (fun ω=>scheduledCutCredit cs ε M deadline start hn s p j (ω,v))
  have hz : Measurable (fun ω : BoardClockPath n=>scheduledCutCredit cs ε M deadline start hn s p j (ω,v)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn s p j).comp (measurable_id.prodMk measurable_const)
  rw [savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p (j+1+k))
      (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p (j+1+k) ω).1),
    savedCreditMeasure_integral _ _ hz
      (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn s p j (ω,v)).1)]
  have hcredit (ω : BoardClockPath n) : validAugStateCredit B p
      (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k) ω).1.2.1=
      phasePointCredit cs ε M deadline start hn hB p (j+1+k) ω := by
    change validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s.val (j+1+k) ω).1=_
    rw [observedRecycledPhaseState_base]
    rfl
  simpa only [hcredit] using hu hvI huI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_two_cut_future_credit_tower_ae
#print axioms NoThreeLine.BirthWitness.scheduled_two_cut_future_point_integral_ae
