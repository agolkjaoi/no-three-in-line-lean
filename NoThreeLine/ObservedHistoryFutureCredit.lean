import NoThreeLine.ObservedHistoryTerminalResidual
import NoThreeLine.ObservedPhaseContinuation
import NoThreeLine.ObservedTerminalCredit

/-! A finite old within-phase history can be tested against credit after
the actual current phase and any finite tail of the original schedule.
The full history/terminal/residual product law supplies the tower. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def observedAfterTerminal {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (x : TimedObservation (cs j).config×BoardClockPath n) :
    (ℕ×PhaseObservation n B)×BoardClockPath n :=
  observedPhaseContinuation cs ε M deadline start hn (j+1) k
    (observedDeadline deadline (phaseEndpoint cs start (j+1)) (observedTimedProjection (cs j).config x.1)) x.2

theorem observedAfterTerminal_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) :
    Measurable (observedAfterTerminal cs ε M deadline start hn j k) :=
  (observedPhaseContinuation_joint_measurable cs ε M deadline start hn (j+1) k).comp
    (((observedDeadline_measurable deadline _).comp
      ((observedTimedProjection_measurable (cs j).config).comp measurable_fst)).prodMk measurable_snd)

theorem observedAfterTerminal_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n) :
    (∫ω,validAugStateCredit B p (observedAfterTerminal cs ε M deadline start hn j k (s,ω)).1.2.1
      ∂boardClockMeasure n (B/n))=augTimedCredit (cs j).config p s.1 := by
  have hh := observedPhaseContinuation_expected_credit cs ε M deadline start hn hB (j+1) k
    (observedDeadline deadline (phaseEndpoint cs start (j+1)) (observedTimedProjection (cs j).config s)) p
  change _=validAugStateCredit B p (augValidDeadlineRetirement deadline (phaseEndpoint cs start (j+1))
    (observedTimedProjection (cs j).config s).1) at hh
  rw [augValidDeadlineRetirement_credit] at hh
  exact hh

def observedThroughPhaseTail {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : TimedObservation (cs j).config) (ω : BoardClockPath n) :
    (ℕ×PhaseObservation n B)×BoardClockPath n :=
  observedAfterTerminal cs ε M deadline start hn j k
    (observedRecycledTerminalPair (cs j).config ε M (phaseEndpoint cs start j) hn (s,ω))

theorem observedThroughPhaseTail_original {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (s : PhaseObservation n B) (j k : ℕ) (ω : BoardClockPath n) :
    let r := observedRecycledPhases cs ε M deadline start hn s j ω
    observedThroughPhaseTail cs ε M deadline start hn j k
      (observedPhaseStart (cs j).config ε M r.1.2) r.2=
        observedRecycledPhases cs ε M deadline start hn s (j+1+k) ω := by
  rw [observedPhaseContinuation_original cs ε M deadline start hn s (j+1) k ω,
    observedRecycledPhases_succ]
  rfl

theorem observedThroughPhaseTail_history_integral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (j k i : ℕ)
    (s : TimedObservation (cs j).config) (p : Grid n)
    (F : (Fin (i+1)→TimedObservation (cs j).config)→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C) :
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s ω).1.2.1*
      F (observedPast (cs j).config ε M (phaseEndpoint cs start j) hn s i ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit (cs j).config p
      (observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s i ω).1.1*
      F (observedPast (cs j).config ε M (phaseEndpoint cs start j) hn s i ω)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let μ := boardClockMeasure n (B/n)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  let H := fun ω=>(observedPast cfg ε M t₀ hn s i ω,observedRecycledTerminal cfg ε M t₀ hn (s,ω))
  let R := fun ω=>(observedRecycledTerminalPair cfg ε M t₀ hn (s,ω)).2
  let f := fun x : ((Fin (i+1)→TimedObservation cfg)×TimedObservation cfg)×BoardClockPath n=>
    validAugStateCredit B p (observedAfterTerminal cs ε M deadline start hn j k (x.1.2,x.2)).1.2.1*F x.1.1
  let g := fun x : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg=>
    augTimedCredit cfg p x.2.1*F x.1
  have ht : Measurable (fun ω=>observedRecycledTerminalPair cfg ε M t₀ hn (s,ω)) :=
    (observedRecycledTerminalPair_measurable cfg ε M t₀ hn).comp (measurable_const.prodMk measurable_id)
  have hH : Measurable H := (observedPast_measurable cfg ε M t₀ hn s i).prodMk ht.fst
  have hR : Measurable R := ht.snd
  letI : IsProbabilityMeasure (μ.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  have hf : Measurable f :=
    ((validAugStateCredit_measurable B p).comp
      (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
        (measurable_fst.snd.prodMk measurable_snd)).fst.snd.fst)).mul (hF.comp measurable_fst.fst)
  have hg : Measurable g := ((augTimedCredit_measurable cfg p).comp measurable_snd.fst).mul
    (hF.comp measurable_fst)
  have hfi : Integrable f ((μ.map H).prod μ) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf (B*C) (fun x=>
      ⟨mul_nonneg (validAugStateCredit_bounds B p _).1 (hFC x.1.1).1,
        mul_le_mul (validAugStateCredit_bounds B p _).2 (hFC x.1.1).2 (hFC x.1.1).1 hB.le⟩)
  have hmean (a : (Fin (i+1)→TimedObservation cfg)×TimedObservation cfg) :
      (∫ω,f (a,ω) ∂μ)=g a := by
    change (∫ω,validAugStateCredit B p (observedAfterTerminal cs ε M deadline start hn j k (a.2,ω)).1.2.1*F a.1 ∂μ)=_
    rw [integral_mul_const,observedAfterTerminal_expected_credit cs ε M deadline start hn hB j k a.2 p]
  have hfirst := independent_history_setIntegral μ μ H R hH hR
    (observedPast_terminal_residual_product cfg ε M t₀ hn hB s i)
    f g hf hg hfi hmean Set.univ MeasurableSet.univ
  simp only [Set.preimage_univ,Measure.restrict_univ] at hfirst
  have hpast : @Measurable (BoardClockPath n) ℝ (observedRecycledFiltration cfg ε M t₀ hn s i)
      inferInstance (fun ω=>F (observedPast cfg ε M t₀ hn s i ω)) :=
    hF.comp (comap_measurable (observedPast cfg ε M t₀ hn s i))
  have hsecond := observedTerminal_point_history_integral cfg ε M t₀ hn hB (cs j).mask_le_one s p i
    (fun ω=>F (observedPast cfg ε M t₀ hn s i ω)) hpast C (fun ω=>hFC _)
  have hZm : Measurable (fun ω : BoardClockPath n=>
      augTimedCredit cfg p (observedRecycledTerminal cfg ε M t₀ hn (s,ω)).1) :=
    (augTimedCredit_measurable cfg p).comp ht.fst.fst
  rw [savedCreditMeasure_integral (boardClockMeasure n (cfg.B/n))
    (fun ω : BoardClockPath n=>augTimedCredit cfg p (observedRecycledTerminal cfg ε M t₀ hn (s,ω)).1)
    hZm (fun ω=>(augTimedCredit_bounds cfg p _).1)
    (fun ω=>F (observedPast cfg ε M t₀ hn s i ω))] at hsecond
  exact hfirst.trans hsecond

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedThroughPhaseTail_original
#print axioms NoThreeLine.BirthWitness.observedThroughPhaseTail_history_integral
