import NoThreeLine.WitnessPhaseInitial
import NoThreeLine.ObservedPhaseContinuation
import NoThreeLine.RecycledHistoryInequality

/-! Continue the actual invariant-carrying phase process from its original
phase index. Original configurations, absolute endpoints, all deadlines
and residual clocks are retained. Source-free mixed means do not increase. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.RecycledBoardProcess

theorem iterate_expected_le {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S×W→S×W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀s,ν.map (fun w=>F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (z : S→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀s,0≤z s ∧ z s≤B)
    (hmean : ∀s,(∫w,z (F (s,w)).1 ∂ν)≤z s) (s : S) (k : ℕ) :
    (∫w,z (iterate F s k w).1 ∂ν)≤z s := by
  induction k with
  | zero => simp [iterate]
  | succ k ih =>
    have hh := history_estimate F hF ν hsection z z hz hz B B hb hb hmean s k Set.univ MeasurableSet.univ
    simp only [Measure.restrict_univ,state] at hh
    exact hh.trans ih

end NoThreeLine.RecycledBoardProcess
namespace NoThreeLine.BirthWitness
open PrimitiveLines

def goodPhaseIndexedRestart {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (x : (ℕ×GoodPhaseObservation n B)×BoardClockPath n) : (ℕ×GoodPhaseObservation n B)×BoardClockPath n :=
  let r := goodScheduledPair cs ε M deadline start hn x.1.1 (x.1.2,x.2)
  ((x.1.1+1,r.1),r.2)

theorem goodPhaseIndexedRestart_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) : Measurable (goodPhaseIndexedRestart cs ε M deadline start hn) := by
  have hm : Measurable (fun x : ℕ×(GoodPhaseObservation n B×BoardClockPath n)=>
      goodScheduledPair cs ε M deadline start hn x.1 x.2) :=
    measurable_from_prod_countable_right (fun j=>goodScheduledPair_measurable cs ε M deadline start hn j)
  have hr := hm.comp (measurable_fst.fst.prodMk (measurable_fst.snd.prodMk measurable_snd))
  have hi : Measurable (fun x : (ℕ×GoodPhaseObservation n B)×BoardClockPath n=>x.1.1+1) :=
    (measurable_of_countable (fun j : ℕ=>j+1)).comp measurable_fst.fst
  exact (hi.prodMk hr.fst).prodMk hr.snd

theorem goodPhaseIndexedRestart_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (x : (ℕ×GoodPhaseObservation n B)×BoardClockPath n) :
    let r := goodPhaseIndexedRestart cs ε M deadline start hn x
    ((r.1.1,r.1.2.val),r.2)=observedPhaseRestartStep cs ε M deadline start hn ((x.1.1,x.1.2.val),x.2) := rfl

theorem observedPhaseIndexed_section_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (a : ℕ×PhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>observedPhaseRestartStep cs ε M deadline start hn (a,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(observedPhaseRestartStep cs ε M deadline start hn (a,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have h := observedPhaseRestartStep_map cs ε M deadline start hn hB a
  have hr : Measurable (fun ω : BoardClockPath n=>observedPhaseRestartStep cs ε M deadline start hn (a,ω)) :=
    (observedPhaseRestartStep_measurable cs ε M deadline start hn).comp (measurable_const.prodMk measurable_id)
  have hp := congrArg (fun μ : Measure ((ℕ×PhaseObservation n B)×BoardClockPath n)=>μ.map Prod.fst) h
  rw [Measure.map_map measurable_fst hr,
    Measure.map_fst_prod,measure_univ,one_smul] at hp
  rw [h]
  exact congrArg (fun μ=>μ.prod (boardClockMeasure n (B/n))) hp.symm

theorem goodPhaseIndexedRestart_section_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (a : ℕ×GoodPhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>goodPhaseIndexedRestart cs ε M deadline start hn (a,ω))=
      ((boardClockMeasure n (B/n)).map (fun ω=>(goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)).1)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let emb := fun x : ℕ×GoodPhaseObservation n B=>(x.1,x.2.val)
  have he : MeasurableEmbedding emb := MeasurableEmbedding.id.prodMap
    (MeasurableEmbedding.subtype_coe goodPhaseObservation_measurableSet)
  have hr : Measurable (fun ω : BoardClockPath n=>goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)) :=
    (goodPhaseIndexedRestart_measurable cs ε M deadline start hn).comp (measurable_const.prodMk measurable_id)
  apply (he.prodMap (MeasurableEmbedding.id (α:=BoardClockPath n))).map_injective
  rw [Measure.map_map (he.prodMap MeasurableEmbedding.id).measurable hr]
  change ν.map (fun ω=>(emb (goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)).1,
      (goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)).2))=
    ((ν.map (fun ω=>(goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)).1)).prod ν).map
      (fun x=>(emb x.1,x.2))
  rw [map_pair_with_fresh_right _ ν emb he.measurable,Measure.map_map he.measurable hr.fst]
  exact observedPhaseIndexed_section_product cs ε M deadline start hn hB (a.1,a.2.val)

def goodPhaseContinuation {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : GoodPhaseObservation n B) (ω : BoardClockPath n) : (ℕ×GoodPhaseObservation n B)×BoardClockPath n :=
  RecycledBoardProcess.iterate (goodPhaseIndexedRestart cs ε M deadline start hn) (j,s) k ω

theorem goodPhaseContinuation_joint_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) :
    Measurable (fun x : GoodPhaseObservation n B×BoardClockPath n=>goodPhaseContinuation cs ε M deadline start hn j k x.1 x.2) :=
  (RecycledBoardProcess.iterate_joint_measurable _ (goodPhaseIndexedRestart_measurable cs ε M deadline start hn) k).comp
    ((measurable_const.prodMk measurable_fst).prodMk measurable_snd)

theorem goodPhaseContinuation_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : GoodPhaseObservation n B) (ω : BoardClockPath n) :
    let r := goodPhaseContinuation cs ε M deadline start hn j k s ω
    ((r.1.1,r.1.2.val),r.2)=observedPhaseContinuation cs ε M deadline start hn j k s.val ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (((goodPhaseIndexedRestart cs ε M deadline start hn
      (goodPhaseContinuation cs ε M deadline start hn j k s ω)).1.1,
      (goodPhaseIndexedRestart cs ε M deadline start hn
        (goodPhaseContinuation cs ε M deadline start hn j k s ω)).1.2.val),
      (goodPhaseIndexedRestart cs ε M deadline start hn
        (goodPhaseContinuation cs ε M deadline start hn j k s ω)).2)=_
    rw [goodPhaseIndexedRestart_projection,ih]
    rfl

theorem goodPhaseContinuation_expected_source_free {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L)
    (j k : ℕ) (s : GoodPhaseObservation n B) :
    (∫ω,goodPhaseMixed Γ e C ∅ L (goodPhaseContinuation cs ε M deadline start hn j k s ω).1.2
      ∂boardClockMeasure n (B/n))≤goodPhaseMixed Γ e C ∅ L s := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hmean (a : ℕ×GoodPhaseObservation n B) :
      (∫ω,goodPhaseMixed Γ e C ∅ L (goodPhaseIndexedRestart cs ε M deadline start hn (a,ω)).1.2 ∂ν)≤
        goodPhaseMixed Γ e C ∅ L a.2 := by
    have h := scheduled_expected_mixed_running_bound cs ε M deadline start e C ∅ L hn hB a.1
      (hK a.1) hCL (Finset.disjoint_empty_right C) a.2
    simpa only [goodPhaseIndexedRestart,phaseRunningSource,terminalRunningSource_empty,integral_zero,add_zero,
      SharedPhase.config,hΓ a.1] using h
  exact RecycledBoardProcess.iterate_expected_le _ (goodPhaseIndexedRestart_measurable cs ε M deadline start hn)
    ν (goodPhaseIndexedRestart_section_product cs ε M deadline start hn hB)
    (fun a : ℕ×GoodPhaseObservation n B=>goodPhaseMixed Γ e C ∅ L a.2)
    ((goodPhaseMixed_measurable Γ e C ∅ L).comp measurable_snd) (mixedCap C B)
    (fun a=>goodPhaseMixed_bounds Γ e C ∅ L a.2) hmean (j,s) k

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodPhaseContinuation_projection
#print axioms NoThreeLine.BirthWitness.goodPhaseContinuation_expected_source_free
