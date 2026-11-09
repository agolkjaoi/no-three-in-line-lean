import NoThreeLine.GoodPhaseContinuation
import NoThreeLine.ObservedPhaseTwoCutMixed

/-! Actual continuation through original scheduled phases and then a partial
phase. The remaining board law, inherited records and original deadlines
are supplied by the real restart kernels, not by a conditional-law assumption. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem goodPhaseContinuation_index {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : GoodPhaseObservation n B) (ω : BoardClockPath n) :
    (goodPhaseContinuation cs ε M deadline start hn j k s ω).1.1=j+k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (goodPhaseContinuation cs ε M deadline start hn j k s ω).1.1+1=j+(k+1)
    omega

theorem goodPhaseContinuation_residual_product {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (j k : ℕ) (s : GoodPhaseObservation n B) :
    (boardClockMeasure n (B/n)).map (fun ω=>
      ((goodPhaseContinuation cs ε M deadline start hn j k s ω).1.2,
        (goodPhaseContinuation cs ε M deadline start hn j k s ω).2))=
      ((boardClockMeasure n (B/n)).map (fun ω=>
        (goodPhaseContinuation cs ε M deadline start hn j k s ω).1.2)).prod
        (boardClockMeasure n (B/n)) := by
  let ν := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let F := goodPhaseIndexedRestart cs ε M deadline start hn
  have hm := goodPhaseIndexedRestart_measurable cs ε M deadline start hn
  have hi := RecycledBoardProcess.iterate_measurable F hm (j,s) k
  have he := RecycledBoardProcess.iterate_map F hm ν
    (goodPhaseIndexedRestart_section_product cs ε M deadline start hn hB) (j,s) k
  rw [←RecycledBoardProcess.iterate_state_map F hm ν
    (goodPhaseIndexedRestart_section_product cs ε M deadline start hn hB) (j,s) k] at he
  have hh := congrArg (fun μ : Measure ((ℕ×GoodPhaseObservation n B)×BoardClockPath n)=>
    μ.map (fun x=>(x.1.2,x.2))) he
  rw [Measure.map_map (measurable_fst.snd.prodMk measurable_snd) hi,
    map_pair_with_fresh_right _ ν Prod.snd measurable_snd,
    Measure.map_map measurable_snd hi.fst] at hh
  exact hh

theorem goodPhaseContinuation_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (s : GoodPhaseObservation n B) (j k : ℕ) (ω : BoardClockPath n) :
    let r := goodPhases cs ε M deadline start hn s j ω
    goodPhases cs ε M deadline start hn s (j+k) ω=
      ((goodPhaseContinuation cs ε M deadline start hn j k r.1 r.2).1.2,
        (goodPhaseContinuation cs ε M deadline start hn j k r.1 r.2).2) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change goodScheduledPair cs ε M deadline start hn (j+k)
      (goodPhases cs ε M deadline start hn s (j+k) ω)=_
    rw [ih]
    change goodScheduledPair cs ε M deadline start hn (j+k) _=
      (let r := goodPhaseContinuation cs ε M deadline start hn j k
        (goodPhases cs ε M deadline start hn s j ω).1 (goodPhases cs ε M deadline start hn s j ω).2
       goodScheduledPair cs ε M deadline start hn r.1.1 (r.1.2,r.2))
    dsimp only
    rw [goodPhaseContinuation_index]

theorem phaseCut_expected_source_free {n : ℕ} (cfg : FlowConfig n) (ε M start v : ℝ)
    (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2) (s : GoodPhaseObservation n cfg.B) :
    (∫ω,mixed cfg.directions C ∅ L (observedWitness cfg e
      (phaseCutObservation cfg ε M start hn ((s,v),ω))) ∂boardClockMeasure n (cfg.B/n))≤
      goodPhaseMixed cfg.directions e C ∅ L s := by
  exact (terminal_expected_source_free_mixed_le cfg ε M
    (start-(elapsedCutAmount cfg.horizon v:ℝ)) e C L hn hB hm hK hCL
    (sourceRestrictGood cfg (elapsedCutAmount cfg.horizon v) (elapsedCutAmount cfg.horizon v).coe_nonneg
      (goodPhaseStart cfg ε M s)))

def goodContinuationCut {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ)
    (x : GoodPhaseObservation n B×BoardClockPath n) : TimedObservation (cs (j+k)).config :=
  let r := goodPhaseContinuation cs ε M deadline start hn j k x.1 x.2
  phaseCutObservation (cs (j+k)).config ε M (phaseEndpoint cs start (j+k)) hn ((r.1.2,v),r.2)

theorem goodContinuationCut_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (v : ℝ) :
    Measurable (goodContinuationCut cs ε M deadline start hn j k v) := by
  have hr := goodPhaseContinuation_joint_measurable cs ε M deadline start hn j k
  exact (phaseCutObservation_measurable (cs (j+k)).config ε M _ hn).comp
    ((hr.fst.snd.prodMk measurable_const).prodMk hr.snd)

theorem goodContinuationCut_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (j k : ℕ) (v : ℝ) (ω : BoardClockPath n) :
    goodContinuationCut cs ε M deadline start hn j k v (goodPhases cs ε M deadline start hn s j ω)=
      scheduledCutObservation cs ε M deadline start hn s (j+k) (ω,v) := by
  unfold scheduledCutObservation
  rw [goodPhaseContinuation_original cs ε M deadline start hn s j k ω]
  rfl

theorem goodContinuationCut_expected_source_free {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hn : 0<n) (hB : 0<B)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2) (hCL : C⊆L)
    (j k : ℕ) (v : ℝ) (s : GoodPhaseObservation n B) :
    (∫ω,mixed Γ C ∅ L (observedWitness (cs (j+k)).config e
      (goodContinuationCut cs ε M deadline start hn j k v (s,ω))) ∂boardClockMeasure n (B/n))≤
      goodPhaseMixed Γ e C ∅ L s := by
  let ν := boardClockMeasure n (B/n)
  let cfg := (cs (j+k)).config
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let r := fun ω=>goodPhaseContinuation cs ε M deadline start hn j k s ω
  have hr : Measurable r := (goodPhaseContinuation_joint_measurable cs ε M deadline start hn j k).comp
    (measurable_const.prodMk measurable_id)
  let μ := ν.map (fun ω=>(r ω).1.2)
  letI : IsProbabilityMeasure μ := Measure.isProbabilityMeasure_map hr.fst.snd.aemeasurable
  let f := fun x : GoodPhaseObservation n B×BoardClockPath n=>mixed Γ C ∅ L
    (observedWitness cfg e (phaseCutObservation cfg ε M (phaseEndpoint cs start (j+k)) hn ((x.1,v),x.2)))
  let g := fun x : GoodPhaseObservation n B×BoardClockPath n=>goodPhaseMixed Γ e C ∅ L x.1
  have hcut : Measurable (fun x : GoodPhaseObservation n B×BoardClockPath n=>
      phaseCutObservation cfg ε M (phaseEndpoint cs start (j+k)) hn ((x.1,v),x.2)) :=
    (phaseCutObservation_measurable cfg ε M _ hn).comp
      ((measurable_fst.prodMk measurable_const).prodMk measurable_snd)
  have hf : Measurable f := (mixed_measurable Γ C ∅ L).comp ((observedWitness_measurable cfg e).comp hcut)
  have hg : Measurable g := (goodPhaseMixed_measurable Γ e C ∅ L).comp measurable_fst
  have hfB (x) : 0≤f x ∧ f x≤mixedCap C B := by
    have hv : (observedWitness cfg e (phaseCutObservation cfg ε M (phaseEndpoint cs start (j+k)) hn ((x.1,v),x.2))).Valid B := by
      apply observedWitness_valid
      exact sourceCutTerminal_consistent cfg ε M _ _ _ hn _ _
    exact ⟨mixed_nonneg _ Γ C ∅ L B hv,mixed_le_cap _ Γ C ∅ L B hv⟩
  have hgB (x) : 0≤g x ∧ g x≤mixedCap C B := goodPhaseMixed_bounds Γ e C ∅ L x.1
  have hh := independent_pair_le_integrals ν ν (fun ω=>(r ω).1.2) (fun ω=>(r ω).2)
    hr.fst.snd hr.snd (goodPhaseContinuation_residual_product cs ε M deadline start hn hB j k s)
    f g hf hg
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (mixedCap C B) hfB)
    (GenericCreditIteration.bounded_nonnegative_integrable _ _ hg (mixedCap C B) hgB)
    (fun a=>by
      simpa [f,g,ν,cfg,SharedPhase.config,hΓ (j+k)] using
        phaseCut_expected_source_free cfg ε M (phaseEndpoint cs start (j+k)) v hn hB
          (cs (j+k)).mask_le_one e C L hCL (hK (j+k)) a)
  exact hh.trans (goodPhaseContinuation_expected_source_free cs ε M deadline start Γ e C L hn hB hΓ hK hCL j k s)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.goodContinuationCut_original
#print axioms NoThreeLine.BirthWitness.goodContinuationCut_expected_source_free
