import NoThreeLine.ScheduledTwoCutLeaf
import NoThreeLine.ScheduledTwoCutFutureTower
import NoThreeLine.ScheduledCutFutureTower

/-! Canonical same-phase physical-leaf comparison under the actual full
original-schedule terminal point probability. The inherited random state,
root credit normalization and eta floor are all supplied internally. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem scheduled_future_two_leaf_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j k : ℕ) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hK : (cs j).config.K<2)
    (p : Grid n) (hp : p∈C) (hε0 : 0≤ε) (hε : ε<1)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐv : ℝ ∂volume,∀ᵐu : ℝ ∂volume, v∈Ioo 0 ((cs j).horizon:ℝ) → u∈Ioo 0 v →
    (∫ω,observedRootLeaf (cs j).config C p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))≤
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k))/(1-ε)^L.card.choose 2 := by
  let cfg := (cs j).config
  let leftTest := fun u (_v : ℝ) (x : TimedObservation cfg×TimedObservation cfg)=>observedRootLeaf cfg C p x.2*F u x.1
  let rightTest := fun u (x : TimedObservation cfg)=>observedCorrectedRootLeaf cfg C L p x*F u x
  have hleftTest : ∀u v,Measurable (leftTest u v) := fun u _=>
    ((observedRootLeaf_measurable cfg C p).comp measurable_snd).mul ((hF u).comp measurable_fst)
  have hrightTest : ∀u,Measurable (rightTest u) := fun u=>
    (observedCorrectedRootLeaf_measurable cfg C L p).mul (hF u)
  have hleftTestA : ∀u v x,0≤leftTest u v x ∧ leftTest u v x≤rootLeafCap C p B*A := fun u _ x=>
    ⟨mul_nonneg (observedRootLeaf_bounds cfg C p x.2).1 (hFA u x.1).1,
      mul_le_mul (observedRootLeaf_bounds cfg C p x.2).2 (hFA u x.1).2 (hFA u x.1).1 (rootLeafCap_nonneg C p B)⟩
  have hrightTestA : ∀u x,0≤rightTest u x ∧ rightTest u x≤rootLeafCap C p B*A := fun u x=>
    ⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C L p x).1 (hFA u x).1,
      mul_le_mul (observedCorrectedRootLeaf_bounds cfg C L p x).2 (hFA u x).2 (hFA u x).1 (rootLeafCap_nonneg C p B)⟩
  have hleft := scheduled_two_cut_future_point_integral_ae cs ε M deadline start hn hB j k p
    leftTest hleftTest _ hleftTestA
  have hright := scheduledCut_future_point_integral_ae cs ε M deadline start hn hB j k p
    rightTest hrightTest _ hrightTestA
  filter_upwards [hleft] with v hl
  by_cases hv : v∈Ioo 0 ((cs j).horizon:ℝ)
  · have hsource := scheduled_two_cut_leaf_le_ae_earlier cs ε M deadline start hn hB j v
      ⟨hv.1.le,hv.2.le⟩ e C L hCL hK p hp hε0 hε F hF A hFA
    filter_upwards [hl,hright,hsource] with u hL hR hS _ hu
    have huH : u∈Ioo 0 ((cs j).horizon:ℝ) := ⟨hu.1,hu.2.trans hv.2⟩
    dsimp only [leftTest] at hL
    dsimp only [rightTest] at hR
    rw [hL hv hu,hR huH]
    exact hS hu
  · exact Filter.Eventually.of_forall (fun _ hvI _=>(hv hvI).elim)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_future_two_leaf_le_ae_times
