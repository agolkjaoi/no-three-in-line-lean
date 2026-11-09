import NoThreeLine.CutCrossingPartition
import NoThreeLine.ObservedFutureStopped

/-! Sum all actual strict update intervals and the already-stopped branch.
Endpoint avoidance is explicit at this intermediate fixed-cut statement;
it is not asserted to hold at every deterministic guard time. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem observedFuture_actual_cut_tower_of_ae_avoid {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (hB : 0<B) (j k : ℕ) (s : GoodObservation (cs j).config)
    (hcut : δ<s.val.1.val.2) (p : Grid n)
    (F : TimedObservation (cs j).config→ℝ) (hF : Measurable F)
    (C : ℝ) (hFC : ∀v,0≤F v ∧ F v≤C)
    (havoid : ∀ᵐω ∂boardClockMeasure n (B/n),∀i,
      δ≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2) :
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn s ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit (cs j).config p
      (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn s ω).1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn s ω)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let μ := boardClockMeasure n (B/n)
  let E := actualCutInterval cfg ε M t₀ δ hn s.val
  let U := sourceCutTerminal cfg ε M t₀ δ hδ hn s
  let Z := fun ω=>validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1
  let z := fun ω=>augTimedCredit cfg p (U ω).1
  let f := fun ω=>Z ω*F (U ω)
  let g := fun ω=>z ω*F (U ω)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hU : Measurable U := sourceCutTerminal_measurable cfg ε M t₀ δ hδ hn s
  have hZ : Measurable Z := (validAugStateCredit_measurable B p).comp
    (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
      ((observedRecycledTerminalPair_measurable cfg ε M t₀ hn).comp
        (measurable_const.prodMk measurable_id))).fst.snd.fst)
  have hz : Measurable z := (augTimedCredit_measurable cfg p).comp hU.fst
  have hf : Integrable f μ := GenericCreditIteration.bounded_nonnegative_integrable μ f
    (hZ.mul (hF.comp hU)) (B*C) (fun ω=>⟨
      mul_nonneg (validAugStateCredit_bounds B p _).1 (hFC (U ω)).1,
      mul_le_mul (validAugStateCredit_bounds B p _).2 (hFC (U ω)).2 (hFC (U ω)).1 hB.le⟩)
  have hg : Integrable g μ := GenericCreditIteration.bounded_nonnegative_integrable μ g
    (hz.mul (hF.comp hU)) (B*C) (fun ω=>⟨
      mul_nonneg (augTimedCredit_bounds cfg p _).1 (hFC (U ω)).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hFC (U ω)).2 (hFC (U ω)).1 hB.le⟩)
  apply integral_eq_of_disjoint_pieces μ E
    (actualCutInterval_measurable cfg ε M t₀ δ hn s.val)
    (actualCutInterval_pairwise cfg ε M t₀ δ hn s) f g hf hg
  · intro i
    have hh := observedFuture_actual_cut_interval cs ε M deadline start δ hδ hn hB j k i s p F hF C hFC
    rw [←integral_indicator (actualCutInterval_measurable cfg ε M t₀ δ hn s.val i),
      ←integral_indicator (actualCutInterval_measurable cfg ε M t₀ δ hn s.val i)]
    simpa only [Set.indicator, actualCutInterval, Set.mem_setOf_eq, f, g, Z, z, U] using hh
  · filter_upwards [havoid,augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hω hd hrest
    have hnox (i : ℕ) : ¬((observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1.1.val.2<δ ∧
        δ<(observedRecycledPair cfg ε M t₀ hn s.val i ω).1.1.val.2) :=
      fun hx=>hrest (Set.mem_iUnion.mpr ⟨i,hx⟩)
    have hR := remaining_above_cut_of_no_cross
      (fun i=>(observedRecycledPair cfg ε M t₀ hn s.val i ω).1.1.val.2) δ hcut hω hnox
      (augRecycledCompletionIndex cfg ε M hn s.val.1 ω)
    change δ<(observedRecycledTerminal cfg ε M t₀ hn (s.val,ω)).1.val.2 at hR
    rw [observedRecycledTerminal_base] at hR
    exact congrArg (fun v=>v*F (U ω))
      (observedFuture_credit_eq_cut_after_completion cs ε M deadline start δ hδ hn j k s ω p hd hR)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedFuture_actual_cut_tower_of_ae_avoid
