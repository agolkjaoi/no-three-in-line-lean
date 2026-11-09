import NoThreeLine.ScheduledCrossPhaseMixed
import NoThreeLine.ScheduledTwoCutLeaf

/-! Canonical cross-phase physical leaf comparison under the two actual
cut point measures. The actual earlier eta product is retained and only
one global eta floor is used. Full-future density consistency is separate. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem scheduled_cross_phase_corrected_leaf_le_ae_earlier {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k : ℕ) (v : ℝ) (p : Grid n) (hp : p∈C)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→
    (∫ω,observedCorrectedRootLeaf (cs (j+1+k)).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p (j+1+k) v)≤
    ∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j u := by
  have he := scheduled_cross_phase_mixed_le_ae_earlier cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB)
    (initialGoodPhaseObservation B hB deadline start) Γ e C L hCL hΓ hK j k v F hF A hFA
  filter_upwards [he] with u hu huI
  rw [scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp,
    scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp,hΓ (j+1+k),hΓ j]
  exact hu huI

theorem scheduled_cross_phase_leaf_le_ae_earlier {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (e : Retention n)
    (C L : Finset (Grid n)) (hCL : C⊆L) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K<2) (j k : ℕ) (v : ℝ) (p : Grid n) (hp : p∈C)
    (hε0 : 0≤ε) (hε : ε<1)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 ((cs j).horizon:ℝ)→
    (∫ω,observedRootLeaf (cs (j+1+k)).config C p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) (j+1+k) (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p (j+1+k) v)≤
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j u)/(1-ε)^L.card.choose 2 := by
  let cfg := (cs (j+1+k)).config
  let s := initialGoodPhaseObservation B hB deadline start
  let V := fun ω=>scheduledCutObservation cs ε M deadline start hn s (j+1+k) (ω,v)
  let U := fun u ω=>scheduledCutObservation cs ε M deadline start hn s j (ω,u)
  have hV : Measurable V := (scheduledCutObservation_measurable cs ε M deadline start hn s (j+1+k)).comp
    (measurable_id.prodMk measurable_const)
  have hU (u : ℝ) : Measurable (U u) := (scheduledCutObservation_measurable cs ε M deadline start hn s j).comp
    (measurable_id.prodMk measurable_const)
  have he := scheduled_cross_phase_corrected_leaf_le_ae_earlier cs ε M deadline start hn hB Γ e C L hCL hΓ hK j k v p hp F hF A hFA
  filter_upwards [he] with u hu huI
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p (j+1+k) v
  letI := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p (j+1+k) v
  have hi : Integrable (fun ω=>observedRootLeaf cfg C p (V ω)*F u (U u ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedRootLeaf_measurable cfg C p).comp hV).mul ((hF u).comp (hU u))) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedRootLeaf_bounds cfg C p _).1 (hFA u _).1,
        mul_le_mul (observedRootLeaf_bounds cfg C p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hj : Integrable (fun ω=>observedCorrectedRootLeaf cfg C L p (V ω)*F u (U u ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedCorrectedRootLeaf_measurable cfg C L p).comp hV).mul ((hF u).comp (hU u))) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C L p _).1 (hFA u _).1,
        mul_le_mul (observedCorrectedRootLeaf_bounds cfg C L p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hf := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>by
    have hh := mul_le_mul_of_nonneg_right
      (scheduled_observedRootLeaf_eta_floor cs ε M deadline start hn hB e C L p hε0 hε.le (j+1+k) (ω,v))
      (hFA u (U u ω)).1
    simpa only [mul_assoc] using hh)
  rw [integral_const_mul] at hf
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hf.trans (hu huI)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_leaf_le_ae_earlier
