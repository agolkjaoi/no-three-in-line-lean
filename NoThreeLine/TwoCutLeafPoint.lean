import NoThreeLine.CutRootLeafPoint
import NoThreeLine.WitnessTwoCutsCompatible
import NoThreeLine.SourceElapsedMean

/-! Actual source-free physical leaves at two cuts, under the corresponding
actual root-credit densities. The earlier active indicators and eta product
are retained. This is not yet a tower for two-cut tests under a full-future
terminal density. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

theorem cutRootLeaf_test_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (s : GoodObservation cfg) (δ : ℝ≥0) (ν : Measure (BoardClockPath n)) [IsFiniteMeasure ν]
    (g : BoardClockPath n→ℝ) (hg : Measurable g) (A : ℝ) (hA : ∀ω,0≤g ω ∧ g ω≤A) :
    Integrable (fun ω=>cutRootLeaf cfg ε M start e C D p hn s (δ,ω)*g ω) ν := by
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _
    (((cutRootLeaf_measurable cfg ε M start e C D p hn s).comp
      (measurable_const.prodMk measurable_id)).mul hg) (rootLeafCap C p cfg.B*A)
  intro ω
  have hl := cutRootLeaf_bounds cfg ε M start e C D p hn s (δ,ω)
  exact ⟨mul_nonneg hl.1 (hA ω).1,mul_le_mul hl.2 (hA ω).2 (hA ω).1 (rootLeafCap_nonneg C p cfg.B)⟩

theorem cutCorrectedRootLeaf_test_integrable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (C D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (s : GoodObservation cfg) (δ : ℝ≥0) (ν : Measure (BoardClockPath n)) [IsFiniteMeasure ν]
    (g : BoardClockPath n→ℝ) (hg : Measurable g) (A : ℝ) (hA : ∀ω,0≤g ω ∧ g ω≤A) :
    Integrable (fun ω=>cutCorrectedRootLeaf cfg ε M start e C D L p hn s (δ,ω)*g ω) ν := by
  apply GenericCreditIteration.bounded_nonnegative_integrable _ _
    (((cutCorrectedRootLeaf_measurable cfg ε M start e C D L p hn s).comp
      (measurable_const.prodMk measurable_id)).mul hg) (rootLeafCap C p cfg.B*A)
  intro ω
  have hl := cutCorrectedRootLeaf_bounds cfg ε M start e C D L p hn s (δ,ω)
  exact ⟨mul_nonneg hl.1 (hA ω).1,mul_le_mul hl.2 (hA ω).2 (hA ω).1 (rootLeafCap_nonneg C p cfg.B)⟩

theorem two_cutPoint_correctedRootLeaf_le_ae_earlier {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (b : ℝ≥0) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (p : Grid n) (hp : p∈C) (s : GoodObservation cfg) (hbR : (b:ℝ)≤s.val.1.val.2)
    (F : ℝ→TimedObservation cfg→ℝ) (hF : ∀t,Measurable (F t))
    (A : ℝ) (hFA : ∀t v,0≤F t v ∧ F t v≤A) :
    ∀ᵐt : ℝ ∂volume, t∈Ioo 0 (s.val.1.val.2-b) →
    (∫ω,cutCorrectedRootLeaf cfg ε M start e C ∅ L p hn s (b,ω)*
      F t (sourceCutTerminal cfg ε M start (elapsedCutAmount s.val.1.val.2 t)
        (elapsedCutAmount s.val.1.val.2 t).coe_nonneg hn s ω)
      ∂cutPointMeasure cfg ε M start hn s p b)≤
    ∫ω,cutCorrectedRootLeaf cfg ε M start e C ∅ L p hn s
      (elapsedCutAmount s.val.1.val.2 t,ω)*
      F t (sourceCutTerminal cfg ε M start (elapsedCutAmount s.val.1.val.2 t)
        (elapsedCutAmount s.val.1.val.2 t).coe_nonneg hn s ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t) := by
  have he := source_free_nested_cuts_le_ae_earlier cfg ε M start b b.coe_nonneg hn hB hm e C L hCL hK
    s hbR F hF A hFA
  filter_upwards [he] with t ht htI
  rw [cutPoint_correctedRootLeaf_test cfg ε M start e C ∅ L p hp,
    cutPoint_correctedRootLeaf_test cfg ε M start e C ∅ L p hp]
  have hδ := elapsedCutAmount_coe s.val.1.val.2 t (htI.2.le.trans (sub_le_self _ b.coe_nonneg))
  simpa only [hδ] using ht htI

theorem two_cutPoint_rootLeaf_le_ae_earlier {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (b : ℝ≥0) (hn : 0<n) (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (e : Retention n) (C L : Finset (Grid n)) (hCL : C⊆L) (hK : cfg.K<2)
    (p : Grid n) (hp : p∈C) (s : GoodObservation cfg) (hbR : (b:ℝ)≤s.val.1.val.2)
    (hε : ε<1) (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b)
    (F : ℝ→TimedObservation cfg→ℝ) (hF : ∀t,Measurable (F t))
    (A : ℝ) (hFA : ∀t v,0≤F t v ∧ F t v≤A) :
    ∀ᵐt : ℝ ∂volume, t∈Ioo 0 (s.val.1.val.2-b) →
    (∫ω,cutRootLeaf cfg ε M start e C ∅ p hn s (b,ω)*
      F t (sourceCutTerminal cfg ε M start (elapsedCutAmount s.val.1.val.2 t)
        (elapsedCutAmount s.val.1.val.2 t).coe_nonneg hn s ω)
      ∂cutPointMeasure cfg ε M start hn s p b)≤
    (∫ω,cutCorrectedRootLeaf cfg ε M start e C ∅ L p hn s
      (elapsedCutAmount s.val.1.val.2 t,ω)*
      F t (sourceCutTerminal cfg ε M start (elapsedCutAmount s.val.1.val.2 t)
        (elapsedCutAmount s.val.1.val.2 t).coe_nonneg hn s ω)
      ∂cutPointMeasure cfg ε M start hn s p (elapsedCutAmount s.val.1.val.2 t))/(1-ε)^L.card.choose 2 := by
  have he := two_cutPoint_correctedRootLeaf_le_ae_earlier cfg ε M start b hn hB hm e C L hCL hK
    p hp s hbR F hF A hFA
  filter_upwards [he] with t ht htI
  let δ := elapsedCutAmount s.val.1.val.2 t
  let g := fun ω=>F t (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω)
  have hg : Measurable g := (hF t).comp ((sourceCutTerminal_joint_measurable cfg ε M start hn s).comp
    (measurable_const.prodMk measurable_id))
  have hgA : ∀ω,0≤g ω ∧ g ω≤A := fun ω=>hFA t _
  letI := cutPointMeasure_finite cfg ε M start hn hB s p b
  have hi := cutRootLeaf_test_integrable cfg ε M start e C ∅ p hn s b
    (cutPointMeasure cfg ε M start hn s p b) g hg A hgA
  have hj := cutCorrectedRootLeaf_test_integrable cfg ε M start e C ∅ L p hn s b
    (cutPointMeasure cfg ε M start hn s p b) g hg A hgA
  have hf := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>by
    have hh := mul_le_mul_of_nonneg_right
      (cutRootLeaf_eta_floor cfg ε M start e C ∅ L p hn s hε.le hinit (b,ω)) (hgA ω).1
    simpa only [mul_assoc] using hh)
  rw [integral_const_mul] at hf
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using hf.trans (ht htI)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.two_cutPoint_correctedRootLeaf_le_ae_earlier
#print axioms NoThreeLine.BirthWitness.two_cutPoint_rootLeaf_le_ae_earlier
