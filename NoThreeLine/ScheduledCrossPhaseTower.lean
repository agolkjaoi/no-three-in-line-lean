import NoThreeLine.ScheduledOldCutResidual
import NoThreeLine.PayloadPhaseCutTower

/-! Full original-schedule terminal credit has the same joint old-cut and
later-cut expectations as credit at the later cut. The actual old cut is
carried through the intervening phase residual kernels. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem scheduled_cross_phase_future_credit_tower_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j k r : ℕ) (p : Grid n)
    (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs (j+1+k)).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐu : ℝ ∂volume,∀ᵐv : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→v∈Ioo 0 ((cs (j+1+k)).horizon:ℝ)→
    (∫ω,validAugStateCredit B p (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k+1+r) ω).1.2.1*
      F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
        scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v)) ∂boardClockMeasure n (B/n))=
    ∫ω,scheduledCutCredit cs ε M deadline start hn s p (j+1+k) (ω,v)*
      F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
        scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v)) ∂boardClockMeasure n (B/n) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hres := scheduledOldCutFuturePair_residual_product_ae cs ε M deadline start hn hB s j k
  filter_upwards [hres] with u hu
  by_cases huI : u∈Ioo 0 ((cs j).horizon:ℝ)
  · let X := TimedObservation (cs j).config×GoodPhaseObservation n B
    let R := scheduledOldCutFuturePair cs ε M deadline start hn s j k u
    have hR : Measurable R := scheduledOldCutFuturePair_measurable cs ε M deadline start hn s j k u
    let μ := ν.map (fun ω=>(R ω).1)
    letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hR.fst.aemeasurable
    let test := fun v (x : X×TimedObservation (cs (j+1+k)).config)=>F u v (x.1.1,x.2)
    have htest (v : ℝ) : Measurable (test v) := (hF u v).comp (measurable_fst.fst.prodMk measurable_snd)
    have htestA (v : ℝ) (x) : 0≤test v x ∧ test v x≤A := hFA u v _
    have he := payloadPhaseFuture_cut_tower_ae cs ε M deadline start hn hB (j+1+k) r μ
      Prod.snd measurable_snd p test htest A htestA
    filter_upwards [he] with v hv _ hvI
    let U := fun x : X×BoardClockPath n=>phaseCutObservation (cs (j+1+k)).config ε M
      (phaseEndpoint cs start (j+1+k)) hn ((x.1.2,v),x.2)
    let V := fun x : X×BoardClockPath n=>observedPhaseFuture cs ε M deadline start hn (j+1+k) r (x.1.2,x.2)
    let f := fun x : X×BoardClockPath n=>validAugStateCredit B p (V x).1.2.1*F u v (x.1.1,U x)
    let g := fun x : X×BoardClockPath n=>augTimedCredit (cs (j+1+k)).config p (U x).1*F u v (x.1.1,U x)
    have hU : Measurable U := (phaseCutObservation_measurable (cs (j+1+k)).config ε M _ hn).comp
      ((measurable_fst.snd.prodMk measurable_const).prodMk measurable_snd)
    have hV : Measurable V := (observedPhaseFuture_measurable cs ε M deadline start hn (j+1+k) r).comp
      (measurable_fst.snd.prodMk measurable_snd)
    have hf : Measurable f := ((validAugStateCredit_measurable B p).comp hV.fst.snd.fst).mul
      ((hF u v).comp (measurable_fst.fst.prodMk hU))
    have hg : Measurable g := ((augTimedCredit_measurable (cs (j+1+k)).config p).comp hU.fst).mul
      ((hF u v).comp (measurable_fst.fst.prodMk hU))
    calc
      _ = ∫ω,f (R ω) ∂ν := by
        apply integral_congr_ae
        filter_upwards [] with ω
        dsimp only [f,V,R,scheduledOldCutFuturePair]
        rw [observedPhaseFuture_original]
        rfl
      _ = ∫x,f x ∂μ.prod ν := by
        rw [←integral_map_of_stronglyMeasurable hR hf.stronglyMeasurable,hu huI]
      _ = ∫x,g x ∂μ.prod ν := hv hvI
      _ = ∫ω,g (R ω) ∂ν := by
        rw [←integral_map_of_stronglyMeasurable hR hg.stronglyMeasurable,hu huI]
      _ = _ := rfl
  · exact Filter.Eventually.of_forall (fun _ h=>False.elim (huI h))

theorem scheduled_cross_phase_future_point_integral_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j k r : ℕ) (p : Grid n)
    (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs (j+1+k)).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐu : ℝ ∂volume,∀ᵐv : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→v∈Ioo 0 ((cs (j+1+k)).horizon:ℝ)→
    (∫ω,F u v (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u),
        scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r))=
    ∫ω,F u v (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u),
        scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p (j+1+k) v := by
  let s := initialGoodPhaseObservation B hB deadline start
  have he := scheduled_cross_phase_future_credit_tower_ae cs ε M deadline start hn
    (lt_of_lt_of_le zero_lt_one hB) s j k r p F hF A hFA
  filter_upwards [he] with u hu
  filter_upwards [hu] with v hv huI hvI
  change (∫ω,F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
      scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (phasePointCredit cs ε M deadline start hn hB p (j+1+k+1+r)))=
    ∫ω,F u v (scheduledCutObservation cs ε M deadline start hn s j (ω,u),
      scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v))
      ∂savedCreditMeasure (boardClockMeasure n (B/n))
        (fun ω=>scheduledCutCredit cs ε M deadline start hn s p (j+1+k) (ω,v))
  have hz : Measurable (fun ω : BoardClockPath n=>scheduledCutCredit cs ε M deadline start hn s p (j+1+k) (ω,v)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn s p (j+1+k)).comp (measurable_id.prodMk measurable_const)
  rw [savedCreditMeasure_integral _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p (j+1+k+1+r))
      (fun ω=>(phasePointCredit_bounds cs ε M deadline start hn hB p (j+1+k+1+r) ω).1),
    savedCreditMeasure_integral _ _ hz
      (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn s p (j+1+k) (ω,v)).1)]
  have hcredit (ω : BoardClockPath n) : validAugStateCredit B p
      (observedRecycledPhases cs ε M deadline start hn s.val (j+1+k+1+r) ω).1.2.1=
      phasePointCredit cs ε M deadline start hn hB p (j+1+k+1+r) ω := by
    change validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s.val (j+1+k+1+r) ω).1=_
    rw [observedRecycledPhaseState_base]
    rfl
  simpa only [hcredit] using hv huI hvI

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_future_credit_tower_ae
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_future_point_integral_ae
