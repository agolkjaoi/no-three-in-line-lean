import NoThreeLine.ScheduledTwoCutMixed
import NoThreeLine.ObservedSourceFreeLeaf
import NoThreeLine.ScheduledCutEta

/-! Canonical actual inherited-state leaf comparison between two cuts.
Initial eta floors are supplied from the actual original full schedule;
no fresh initialization or conditional moment premise is introduced. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem mixed_observedRootLeaf_credit {n : ℕ} (cfg : FlowConfig n) (e : Retention n)
    (C L : Finset (Grid n)) (p : Grid n) (hp : p∈C) (v : TimedObservation cfg) :
    mixed cfg.directions C ∅ L (observedWitness cfg e v)=
      augTimedCredit cfg p v.1*observedCorrectedRootLeaf cfg C L p v := by
  have h := mixed_rootLeaf_credit cfg.directions C ∅ L p hp (observedWitness cfg e v)
  simpa only [correctedRootLeafWitness,rootLeafWitness,witnessProduct,Finset.prod_empty,one_mul,
    observedWitness,observedCorrectedRootLeaf,observedRootLeaf,augTimedCredit] using h

theorem scheduledCut_correctedRootLeaf_test {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (e : Retention n) (C L : Finset (Grid n)) (p : Grid n) (hp : p∈C) (j : ℕ)
    (t : ℝ) (g : BoardClockPath n→ℝ) :
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,t))*g ω
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j t)=
    ∫ω,mixed (cs j).directions C ∅ L (scheduledCutWitness cs ε M deadline start e hn
        (initialGoodPhaseObservation B hB deadline start) j (ω,t))*g ω
      ∂boardClockMeasure n (B/n) := by
  let s := initialGoodPhaseObservation B hB deadline start
  have hz : Measurable (fun ω=>scheduledCutCredit cs ε M deadline start hn s p j (ω,t)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn s p j).comp (measurable_id.prodMk measurable_const)
  rw [scheduledCutPointMeasure,savedCreditMeasure_integral _ _ hz
    (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn s p j (ω,t)).1)]
  apply integral_congr_ae
  filter_upwards [] with ω
  rw [show mixed (cs j).directions C ∅ L (scheduledCutWitness cs ε M deadline start e hn s j (ω,t))=
      scheduledCutCredit cs ε M deadline start hn s p j (ω,t)*observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn s j (ω,t)) from
    mixed_observedRootLeaf_credit (cs j).config e C L p hp _]
  exact (mul_assoc _ _ _).symm

theorem scheduled_two_cut_corrected_leaf_le_ae_earlier {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j : ℕ) (v : ℝ) (hv : v∈Icc 0 ((cs j).horizon:ℝ))
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : (cs j).config.K<2)
    (p : Grid n) (hp : p∈C)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 v →
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j v)≤
    ∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j u := by
  have he := scheduled_two_cut_mixed_le_ae_earlier cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB)
    (initialGoodPhaseObservation B hB deadline start) j v hv e C L hCL hK F hF A hFA
  filter_upwards [he] with u hu huI
  rw [scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp,
    scheduledCut_correctedRootLeaf_test cs ε M deadline start hn hB e C L p hp]
  exact hu huI

theorem scheduled_observedRootLeaf_eta_floor {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (e : Retention n) (C L : Finset (Grid n)) (p : Grid n) (hε0 : 0≤ε) (hε : ε≤1)
    (j : ℕ) (x : BoardClockPath n×ℝ) :
    (1-ε)^L.card.choose 2*observedRootLeaf (cs j).config C p
      (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j x)≤
    observedCorrectedRootLeaf (cs j).config C L p
      (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j x) := by
  have hh := rootLeafWitness_eta_floor (cs j).directions C ∅ L p
    (scheduledCutWitness cs ε M deadline start e hn (initialGoodPhaseObservation B hB deadline start) j x)
    B ε (scheduledCutWitness_valid cs ε M deadline start e hn _ j x) hε
    (fun a _ b _ hab=>initial_scheduledCutWitness_eta_lower cs ε M deadline start p hn hB e hε0 a b hab j x)
  simpa only [rootLeafWitness,correctedRootLeafWitness,witnessProduct,Finset.prod_empty,one_mul,
    scheduledCutWitness,observedWitness,observedRootLeaf,observedCorrectedRootLeaf] using hh

theorem scheduled_two_cut_leaf_le_ae_earlier {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (j : ℕ) (v : ℝ) (hv : v∈Icc 0 ((cs j).horizon:ℝ))
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : (cs j).config.K<2)
    (p : Grid n) (hp : p∈C) (hε0 : 0≤ε) (hε : ε<1)
    (F : ℝ→TimedObservation (cs j).config→ℝ) (hF : ∀u,Measurable (F u))
    (A : ℝ) (hFA : ∀u x,0≤F u x ∧ F u x≤A) :
    ∀ᵐu : ℝ ∂volume,u∈Ioo 0 v →
    (∫ω,observedRootLeaf (cs j).config C p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,v))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j v)≤
    (∫ω,observedCorrectedRootLeaf (cs j).config C L p
        (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))*
      F u (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) j (ω,u))
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p j u)/(1-ε)^L.card.choose 2 := by
  let cfg := (cs j).config
  let s := initialGoodPhaseObservation B hB deadline start
  let S := fun t ω=>scheduledCutObservation cs ε M deadline start hn s j (ω,t)
  have hS (t : ℝ) : Measurable (S t) :=
    (scheduledCutObservation_measurable cs ε M deadline start hn s j).comp (measurable_id.prodMk measurable_const)
  have he := scheduled_two_cut_corrected_leaf_le_ae_earlier cs ε M deadline start hn hB j v hv e C L hCL hK p hp F hF A hFA
  filter_upwards [he] with u hu huI
  let ν := scheduledCutPointMeasure cs ε M deadline start hn hB p j v
  letI := scheduledCutPointMeasure_probability cs ε M deadline start hn hB p j v
  have hi : Integrable (fun ω=>observedRootLeaf cfg C p (S v ω)*F u (S u ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedRootLeaf_measurable cfg C p).comp (hS v)).mul ((hF u).comp (hS u))) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedRootLeaf_bounds cfg C p _).1 (hFA u _).1,
        mul_le_mul (observedRootLeaf_bounds cfg C p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hj : Integrable (fun ω=>observedCorrectedRootLeaf cfg C L p (S v ω)*F u (S u ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      (((observedCorrectedRootLeaf_measurable cfg C L p).comp (hS v)).mul ((hF u).comp (hS u))) (rootLeafCap C p B*A)
      (fun ω=>⟨mul_nonneg (observedCorrectedRootLeaf_bounds cfg C L p _).1 (hFA u _).1,
        mul_le_mul (observedCorrectedRootLeaf_bounds cfg C L p _).2 (hFA u _).2 (hFA u _).1 (rootLeafCap_nonneg C p B)⟩)
  have hf := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>by
    have hh := mul_le_mul_of_nonneg_right
      (scheduled_observedRootLeaf_eta_floor cs ε M deadline start hn hB e C L p hε0 hε.le j (ω,v)) (hFA u (S u ω)).1
    simpa only [mul_assoc] using hh)
  rw [integral_const_mul] at hf
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hf.trans (hu huI)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduled_two_cut_leaf_le_ae_earlier
