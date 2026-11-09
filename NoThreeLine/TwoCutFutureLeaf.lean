import NoThreeLine.TwoCutFuturePoint
import NoThreeLine.ObservedSourceFreeLeaf
import NoThreeLine.TwoCutLeafPoint

/-! Two-time source-free physical-leaf comparison under one actual full
future root-credit density. The root and every leaf active indicator are
kept, and the earlier actual eta product remains on the right. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
open scoped NNReal
namespace NoThreeLine.BirthWitness

theorem throughTailPoint_cut_test_ae_time {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (j k : ℕ) (s : GoodObservation (cs j).config) (p : Grid n)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 s.val.1.val.2 →
    (∫ω,F u (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω)
      ∂throughTailPointMeasure cs ε M deadline start hn j k s.val p)=
    ∫ω,F u (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω)
      ∂cutPointMeasure (cs j).config ε M (phaseEndpoint cs start j) hn s p
        (elapsedCutAmount s.val.1.val.2 u) := by
  let cfg := (cs j).config
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  have havoid := ae_time_avoids_random_endpoints (boardClockMeasure n (B/n))
    (fun i ω=>s.val.1.val.2-
      (observedRecycledPair cfg ε M (phaseEndpoint cs start j) hn s.val i ω).1.1.val.2)
    (fun i=>measurable_const.sub
      (observedRecycledPair_measurable cfg ε M (phaseEndpoint cs start j) hn s.val i).fst.fst.subtype_val.snd)
  filter_upwards [havoid] with u hu huI
  rw [throughTailPointMeasure_integral,cutPointMeasure_integral]
  have he := observedFuture_actual_cut_tower_of_ae_avoid cs ε M deadline start
    (s.val.1.val.2-u) (sub_nonneg.mpr huI.2.le) hn hB j k s (by linarith [huI.1]) p
    (F u) (hF u) A (hFA u) (by
      filter_upwards [hu] with ω hω i
      intro hh
      exact hω i (by linarith))
  simpa only [elapsedCutAmount_coe _ _ huI.2.le] using he

theorem throughTailPoint_two_cut_leaf_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 0<B) (j k : ℕ) (s : GoodObservation (cs j).config)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : (cs j).config.K<2)
    (p : Grid n) (hp : p∈C) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 s.val.1.val.2 → u∈Ioo 0 v →
    (∫ω,observedRootLeaf (cs j).config C p
        (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 v) (elapsedCutAmount s.val.1.val.2 v).coe_nonneg hn s ω)*
      F u (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω)
      ∂throughTailPointMeasure cs ε M deadline start hn j k s.val p)≤
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
          (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω)*
      F u (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j)
        (elapsedCutAmount s.val.1.val.2 u) (elapsedCutAmount s.val.1.val.2 u).coe_nonneg hn s ω)
      ∂throughTailPointMeasure cs ε M deadline start hn j k s.val p)/(1-ε)^L.card.choose 2 := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  let leftTest := fun u (_v : ℝ) (x : TimedObservation cfg×TimedObservation cfg)=>observedRootLeaf cfg C p x.2*F u x.1
  let rightTest := fun u (x : TimedObservation cfg)=>observedCorrectedRootLeaf cfg C L p x*F u x
  have hleftTest : ∀u v,Measurable (leftTest u v) := fun u _=>
    ((observedRootLeaf_measurable cfg C p).comp measurable_snd).mul ((hF u).comp measurable_fst)
  have hrightTest : ∀u,Measurable (rightTest u) := fun u=>
    (observedCorrectedRootLeaf_measurable cfg C L p).mul (hF u)
  have hleftTestA : ∀u v x,0≤leftTest u v x ∧ leftTest u v x≤rootLeafCap C p B*A := fun u _ x=>
    ⟨mul_nonneg (observedRootLeaf_bounds cfg C p x.2).1 (hFA u x.1).1,
      mul_le_mul (observedRootLeaf_bounds cfg C p x.2).2 (hFA u x.1).2 (hFA u x.1).1
        (rootLeafCap_nonneg C p B)⟩
  have hrightTestA : ∀u x,0≤rightTest u x ∧ rightTest u x≤rootLeafCap C p B*A := fun u x=>
    ⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C L p x).1 (hFA u x).1,
      mul_le_mul (observedCorrectedRootLeaf_bounds cfg C L p x).2 (hFA u x).2 (hFA u x).1
        (rootLeafCap_nonneg C p B)⟩
  have hleft := throughTailPoint_two_cuts_ae_times cs ε M deadline start hn hB j k s p leftTest hleftTest _ hleftTestA
  have hright := throughTailPoint_cut_test_ae_time cs ε M deadline start hn hB j k s p rightTest hrightTest _ hrightTestA
  filter_upwards [hleft] with v hl
  by_cases hv : v∈Ioo 0 s.val.1.val.2
  · have hbR : (elapsedCutAmount s.val.1.val.2 v:ℝ)≤s.val.1.val.2 := by
      rw [elapsedCutAmount_coe _ _ hv.2.le]
      linarith [hv.1]
    have hsource := two_cutPoint_rootLeaf_le_ae_earlier cfg ε M t₀ (elapsedCutAmount s.val.1.val.2 v)
      hn hB (cs j).mask_le_one e C L hCL hK p hp s hbR hε hinit F hF A hFA
    filter_upwards [hl,hright,hsource] with u hL hR hS _ hu
    have huR : u∈Ioo 0 s.val.1.val.2 := ⟨hu.1,hu.2.trans hv.2⟩
    have hu' : u∈Ioo 0 (s.val.1.val.2-(elapsedCutAmount s.val.1.val.2 v:ℝ)) := by
      simpa only [elapsedCutAmount_coe _ _ hv.2.le,sub_sub_cancel] using hu
    have hh := hS hu'
    simp only [cutRootLeaf_empty_eq,cutCorrectedRootLeaf_empty_eq] at hh
    dsimp only [leftTest] at hL
    dsimp only [rightTest] at hR
    rw [hL hv hu,hR huR]
    exact hh
  · exact Filter.Eventually.of_forall (fun _ hvI _=>(hv hvI).elim)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.throughTailPoint_two_cut_leaf_le_ae_times
