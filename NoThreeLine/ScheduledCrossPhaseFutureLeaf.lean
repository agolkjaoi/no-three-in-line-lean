import NoThreeLine.UniformCrossPhaseMixed
import NoThreeLine.ScheduledCrossPhaseTower
import NoThreeLine.ScheduledTwoCutLeaf
import NoThreeLine.ScheduledCutFutureTower

/-! Cross-phase physical-leaf comparison under one actual full-schedule
terminal point probability. Old-cut memory and the true residual kernels
supply both density transfers. One global eta floor is kept explicitly. -/
set_option autoImplicit false
set_option maxHeartbeats 1800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem scheduled_cross_phase_future_leaf_le_ae_times {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k r : ℕ) (p : Grid n) (hp : p∈C)
    (hε0 : 0≤ε) (hε : ε<1)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,∀ᵐv : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→v∈Ioo 0 ((cs (j+1+k)).horizon:ℝ)→
    (∫ω,observedRootLeaf (cs (j+1+k)).config C p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r))≤
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r))/(1-ε)^L.card.choose 2 := by
  let cfg := (cs (j+1+k)).config
  let s := initialGoodPhaseObservation B hB deadline start
  let leftTest := fun u (_v : ℝ) (x : TimedObservation (cs j).config×TimedObservation cfg)=>
    observedRootLeaf cfg C p x.2*F u x.1
  let rightTest := fun u (x : TimedObservation (cs j).config)=>observedCorrectedRootLeaf (cs j).config C L p x*F u x
  have hleftTest (u v : ℝ) : Measurable (leftTest u v) :=
    ((observedRootLeaf_measurable cfg C p).comp measurable_snd).mul ((hF u).comp measurable_fst)
  have hrightTest (u : ℝ) : Measurable (rightTest u) :=
    (observedCorrectedRootLeaf_measurable (cs j).config C L p).mul (hF u)
  have hleftA (u v : ℝ) (x) : 0≤leftTest u v x ∧ leftTest u v x≤rootLeafCap C p B*A :=
    ⟨mul_nonneg (observedRootLeaf_bounds cfg C p x.2).1 (hFA u x.1).1,
      mul_le_mul (observedRootLeaf_bounds cfg C p x.2).2 (hFA u x.1).2 (hFA u x.1).1 (rootLeafCap_nonneg C p B)⟩
  have hrightA (u : ℝ) (x) : 0≤rightTest u x ∧ rightTest u x≤rootLeafCap C p B*A :=
    ⟨mul_nonneg (observedCorrectedRootLeaf_bounds (cs j).config C L p x).1 (hFA u x).1,
      mul_le_mul (observedCorrectedRootLeaf_bounds (cs j).config C L p x).2 (hFA u x).2 (hFA u x).1 (rootLeafCap_nonneg C p B)⟩
  have hleft := scheduled_cross_phase_future_point_integral_ae cs ε M deadline start hn hB j k r p
    leftTest hleftTest _ hleftA
  have hright := scheduledCut_future_point_integral_ae cs ε M deadline start hn hB j (k+1+r) p
    rightTest hrightTest _ hrightA
  have hJ : j+1+(k+1+r)=j+1+k+1+r := by omega
  simp only [hJ] at hright
  have hmixed := scheduled_cross_phase_mixed_le_ae_all_later cs ε M deadline start hn
    (lt_of_lt_of_le zero_lt_one hB) s Γ e C L hCL hΓ hK j k F hF A hFA
  filter_upwards [hleft,hright,hmixed] with u hlu hru hmu
  filter_upwards [hlu] with v hl huI hvI
  rw [hl huI hvI,hru huI]
  let V := fun ω=>scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v)
  let U := fun ω=>scheduledCutObservation cs ε M deadline start hn s j (ω,u)
  have hV : Measurable V := (scheduledCutObservation_measurable cs ε M deadline start hn s (j+1+k)).comp
    (measurable_id.prodMk measurable_const)
  have hU : Measurable U := (scheduledCutObservation_measurable cs ε M deadline start hn s j).comp
    (measurable_id.prodMk measurable_const)
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p (j+1+k) v
  letI := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p (j+1+k) v
  have hc : (∫ω,observedCorrectedRootLeaf cfg C L p (V ω)*F u (U ω) ∂ν)≤
      ∫ω,observedCorrectedRootLeaf (cs j).config C L p (U ω)*F u (U ω)
        ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j u := by
    rw [scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp,
      scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp,hΓ (j+1+k),hΓ j]
    exact hmu v huI
  have hi : Integrable (fun ω=>observedRootLeaf cfg C p (V ω)*F u (U ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedRootLeaf_measurable cfg C p).comp hV).mul ((hF u).comp hU)) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedRootLeaf_bounds cfg C p _).1 (hFA u _).1,
        mul_le_mul (observedRootLeaf_bounds cfg C p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hj : Integrable (fun ω=>observedCorrectedRootLeaf cfg C L p (V ω)*F u (U ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedCorrectedRootLeaf_measurable cfg C L p).comp hV).mul ((hF u).comp hU)) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C L p _).1 (hFA u _).1,
        mul_le_mul (observedCorrectedRootLeaf_bounds cfg C L p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hf := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>by
    have hh := mul_le_mul_of_nonneg_right
      (scheduled_observedRootLeaf_eta_floor cs ε M deadline start hn hB e C L p hε0 hε.le (j+1+k) (ω,v))
      (hFA u (U ω)).1
    simpa only [mul_assoc] using hh)
  rw [integral_const_mul] at hf
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [leftTest,rightTest,U,V,s,ν,mul_comm] using hf.trans hc

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_future_leaf_le_ae_times
