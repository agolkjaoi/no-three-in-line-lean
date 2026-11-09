import NoThreeLine.WitnessPhaseSource
import NoThreeLine.ObservedPhaseLaw

/-! The source invariant subtype follows the already constructed original
board phases pointwise. The true remaining board remains independent after
each finite phase prefix; this is inherited from its actual restart law. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

theorem phaseRecordsConsistent_measurable {n : ℕ} {B : ℝ} :
    Measurable (PhaseRecordsConsistent (n:=n) (B:=B)) := by
  apply Measurable.forall
  intro p
  exact (((measurable_pi_apply p).comp measurable_snd).fst.eq_const true).iff
    ((measurable_finset_mem p).comp ((ProcessState.measurable_selected n).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
        (measurable_subtype_coe.comp measurable_fst)))))

theorem emptyLineCredit_measurable {n : ℕ} : Measurable (@EmptyLineCredit n) := by
  apply Measurable.forall
  intro J
  exact ((ExtendedState.measurable_occupancy n J).eq_const 0).imp
    (((measurable_pi_apply J).comp (ExtendedState.measurable_lineCredits n)).eq_const 1)

theorem goodPhaseObservation_measurableSet {n : ℕ} {B : ℝ} :
    MeasurableSet {s : PhaseObservation n B | PhaseRecordsConsistent s ∧ EmptyLineCredit s.1.val.physical} :=
  (phaseRecordsConsistent_measurable.and (emptyLineCredit_measurable.comp
    ((AugmentedState.measurable_physical n).comp (measurable_subtype_coe.comp measurable_fst)))).setOf

def goodPhases {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) :
    ℕ→BoardClockPath n→GoodPhaseObservation n B×BoardClockPath n
  | 0,ω=>(s,ω)
  | k+1,ω=>goodScheduledPair cs ε M deadline start hn k (goodPhases cs ε M deadline start hn s k ω)

theorem goodPhases_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (goodPhases cs ε M deadline start hn s k) := by
  induction k with
  | zero => exact measurable_const.prodMk measurable_id
  | succ k ih => exact (goodScheduledPair_measurable cs ε M deadline start hn k).comp ih

theorem goodPhases_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    ((goodPhases cs ε M deadline start hn s k ω).1.val,(goodPhases cs ε M deadline start hn s k ω).2)=
      (observedRecycledPhaseState cs ε M deadline start hn s.val k ω,
        (observedRecycledPhases cs ε M deadline start hn s.val k ω).2) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((goodScheduledPair cs ε M deadline start hn k _).1.val,
      (goodScheduledPair cs ε M deadline start hn k _).2)=_
    rw [goodScheduledPair_projection,ih]
    simp only [observedRecycledPhaseState,observedRecycledPhases_succ]

theorem goodPhases_state_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    (goodPhases cs ε M deadline start hn s k ω).1.val=
      observedRecycledPhaseState cs ε M deadline start hn s.val k ω :=
  congrArg Prod.fst (goodPhases_projection cs ε M deadline start hn s k ω)

theorem goodPhases_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (s : GoodPhaseObservation n B) (k : ℕ) :
    (boardClockMeasure n (B/n)).map (goodPhases cs ε M deadline start hn s k)=
      ((boardClockMeasure n (B/n)).map (fun ω=>(goodPhases cs ε M deadline start hn s k ω).1)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hg := goodPhases_measurable cs ε M deadline start hn s k
  letI : IsProbabilityMeasure (ν.map (fun ω=>(goodPhases cs ε M deadline start hn s k ω).1)) :=
    Measure.isProbabilityMeasure_map hg.fst.aemeasurable
  have he : MeasurableEmbedding (Subtype.val : GoodPhaseObservation n B→PhaseObservation n B) :=
    MeasurableEmbedding.subtype_coe goodPhaseObservation_measurableSet
  apply (he.prodMap (MeasurableEmbedding.id (α:=BoardClockPath n))).map_injective
  rw [Measure.map_map (he.prodMap MeasurableEmbedding.id).measurable hg]
  change ν.map (fun ω=>((goodPhases cs ε M deadline start hn s k ω).1.val,
      (goodPhases cs ε M deadline start hn s k ω).2))=
    ((ν.map (fun ω=>(goodPhases cs ε M deadline start hn s k ω).1)).prod ν).map
      (fun x=>(x.1.val,x.2))
  rw [map_pair_with_fresh_right _ ν Subtype.val measurable_subtype_coe,
    Measure.map_map measurable_subtype_coe hg.fst]
  have hres (ω) : (goodPhases cs ε M deadline start hn s k ω).2=
      (observedRecycledPhases cs ε M deadline start hn s.val k ω).2 :=
    congrArg Prod.snd (goodPhases_projection cs ε M deadline start hn s k ω)
  simp only [Function.comp_def,goodPhases_state_projection,hres]
  rw [observedRecycledPhaseState_map cs ε M deadline start hn hB s.val k]
  exact observedRecycledPhases_state_residual_map cs ε M deadline start hn hB s.val k

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.goodPhases_projection
#print axioms NoThreeLine.BirthWitness.goodPhases_residual_product
