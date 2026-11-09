import NoThreeLine.ObservedTwoCutInterval
import NoThreeLine.ObservedFutureStopped
import NoThreeLine.ObservedCutAETower

/-! Sum the actual later crossing intervals while retaining the earlier
cut observation. Fubini removes random endpoint exceptions for almost
every pair of elapsed times. The future density includes the original
deadline transition and any finite tail of the original schedule. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem observedFuture_two_actual_cuts_tower_of_ae_avoid {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start a b : ℝ)
    (ha : 0≤a) (hb : 0≤b) (hn : 0<n) (hB : 0<B) (j k : ℕ)
    (s : GoodObservation (cs j).config) (p : Grid n) (hba : b<a) (hstart : a<s.val.1.val.2)
    (F : TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : Measurable F) (A : ℝ) (hFA : ∀x,0≤F x ∧ F x≤A)
    (havoidA : ∀ᵐω ∂boardClockMeasure n (B/n),∀i,
      a≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2)
    (havoidB : ∀ᵐω ∂boardClockMeasure n (B/n),∀i,
      b≠(observedRecycledPair (cs j).config ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2) :
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) a ha hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) b hb hn s ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit (cs j).config p
      (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) b hb hn s ω).1*
      F (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) a ha hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) b hb hn s ω)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let μ := boardClockMeasure n (B/n)
  let E := actualCutInterval cfg ε M t₀ b hn s.val
  let U := sourceCutTerminal cfg ε M t₀ a ha hn s
  let V := sourceCutTerminal cfg ε M t₀ b hb hn s
  let Z := fun ω=>validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1
  let z := fun ω=>augTimedCredit cfg p (V ω).1
  let f := fun ω=>Z ω*F (U ω,V ω)
  let g := fun ω=>z ω*F (U ω,V ω)
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have hU : Measurable U := sourceCutTerminal_measurable cfg ε M t₀ a ha hn s
  have hV : Measurable V := sourceCutTerminal_measurable cfg ε M t₀ b hb hn s
  have hZ : Measurable Z := (validAugStateCredit_measurable B p).comp
    (((observedAfterTerminal_measurable cs ε M deadline start hn j k).comp
      ((observedRecycledTerminalPair_measurable cfg ε M t₀ hn).comp
        (measurable_const.prodMk measurable_id))).fst.snd.fst)
  have hz : Measurable z := (augTimedCredit_measurable cfg p).comp hV.fst
  have hf : Integrable f μ := GenericCreditIteration.bounded_nonnegative_integrable μ f
    (hZ.mul (hF.comp (hU.prodMk hV))) (B*A) (fun ω=>⟨
      mul_nonneg (validAugStateCredit_bounds B p _).1 (hFA (U ω,V ω)).1,
      mul_le_mul (validAugStateCredit_bounds B p _).2 (hFA (U ω,V ω)).2 (hFA (U ω,V ω)).1 hB.le⟩)
  have hg : Integrable g μ := GenericCreditIteration.bounded_nonnegative_integrable μ g
    (hz.mul (hF.comp (hU.prodMk hV))) (B*A) (fun ω=>⟨
      mul_nonneg (augTimedCredit_bounds cfg p _).1 (hFA (U ω,V ω)).1,
      mul_le_mul (augTimedCredit_bounds cfg p _).2 (hFA (U ω,V ω)).2 (hFA (U ω,V ω)).1 hB.le⟩)
  apply integral_eq_of_disjoint_pieces μ E
    (actualCutInterval_measurable cfg ε M t₀ b hn s.val)
    (actualCutInterval_pairwise cfg ε M t₀ b hn s) f g hf hg
  · intro i
    have hh := observedFuture_two_actual_cut_interval cs ε M deadline start a b ha hb hn hB j k i s p
      hba hstart F hF A hFA havoidA
    rw [←integral_indicator (actualCutInterval_measurable cfg ε M t₀ b hn s.val i),
      ←integral_indicator (actualCutInterval_measurable cfg ε M t₀ b hn s.val i)]
    simpa only [Set.indicator,actualCutInterval,Set.mem_setOf_eq,f,g,Z,z,U,V] using hh
  · filter_upwards [havoidB,augRecycledTerminal_done_ae cfg ε M hn hB s.val.1] with ω hω hd hrest
    have hnox (i : ℕ) : ¬((observedRecycledPair cfg ε M t₀ hn s.val (i+1) ω).1.1.val.2<b ∧
        b<(observedRecycledPair cfg ε M t₀ hn s.val i ω).1.1.val.2) :=
      fun hx=>hrest (Set.mem_iUnion.mpr ⟨i,hx⟩)
    have hR := remaining_above_cut_of_no_cross
      (fun i=>(observedRecycledPair cfg ε M t₀ hn s.val i ω).1.1.val.2) b (hba.trans hstart) hω hnox
      (augRecycledCompletionIndex cfg ε M hn s.val.1 ω)
    change b<(observedRecycledTerminal cfg ε M t₀ hn (s.val,ω)).1.val.2 at hR
    rw [observedRecycledTerminal_base] at hR
    exact congrArg (fun v=>v*F (U ω,V ω))
      (observedFuture_credit_eq_cut_after_completion cs ε M deadline start b hb hn j k s ω p hd hR)

theorem observedFuture_two_actual_cuts_tower_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (s : GoodObservation (cs j).config) (p : Grid n)
    (F : ℝ→ℝ→TimedObservation (cs j).config×TimedObservation (cs j).config→ℝ)
    (hF : ∀u v,Measurable (F u v)) (A : ℝ) (hFA : ∀u v x,0≤F u v x ∧ F u v x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume,∀hv : v∈Ioo 0 s.val.1.val.2,∀hu : u∈Ioo 0 v,
    (∫ω,validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1*
      F u v (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (s.val.1.val.2-u) (sub_nonneg.mpr (hu.2.le.trans hv.2.le)) hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (s.val.1.val.2-v) (sub_nonneg.mpr hv.2.le) hn s ω)
      ∂boardClockMeasure n (B/n))=
    ∫ω,augTimedCredit (cs j).config p
      (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (s.val.1.val.2-v) (sub_nonneg.mpr hv.2.le) hn s ω).1*
      F u v (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (s.val.1.val.2-u) (sub_nonneg.mpr (hu.2.le.trans hv.2.le)) hn s ω,
        sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (s.val.1.val.2-v) (sub_nonneg.mpr hv.2.le) hn s ω)
      ∂boardClockMeasure n (B/n) := by
  let cfg := (cs j).config
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have havoid := ae_time_avoids_random_endpoints (boardClockMeasure n (B/n))
    (fun i ω=>s.val.1.val.2-
      (observedRecycledPair cfg ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2)
    (fun i=>measurable_const.sub
      (observedRecycledPair_measurable cfg ε M (phaseEndpoint cs start j) hn s.val i).fst.fst.subtype_val.snd)
  filter_upwards [havoid] with v hv
  filter_upwards [havoid] with u hu hvI huI
  apply observedFuture_two_actual_cuts_tower_of_ae_avoid cs ε M deadline start
    (s.val.1.val.2-u) (s.val.1.val.2-v) _ _ hn hB j k s p
    (by linarith [huI.2]) (by linarith [huI.1]) (F u v) (hF u v) A (hFA u v)
  · filter_upwards [hu] with ω hω i
    intro he
    exact hω i (by linarith)
  · filter_upwards [hv] with ω hω i
    intro he
    exact hω i (by linarith)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedFuture_two_actual_cuts_tower_of_ae_avoid
#print axioms NoThreeLine.BirthWitness.observedFuture_two_actual_cuts_tower_ae_times
