import NoThreeLine.SingletonWitnessCredit
import NoThreeLine.CutEtaFloor
import NoThreeLine.CutPointLaw
import NoThreeLine.SourceCutExpectation

/-! Actual singleton mixed means control active-root witness products under
the actual cut point law. No retired-root boundary observable is identified
with this quantity; such an observable needs a simultaneously frozen hierarchy. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped NNReal

namespace NoThreeLine.BirthWitness

def cutActiveWitness {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) : ℝ :=
  activeWitness D p (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

def cutCorrectedActiveWitness {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) : ℝ :=
  correctedActiveWitness D L p
    (observedWitness cfg e (sourceCutTerminal cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutActiveWitness_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutActiveWitness cfg ε M start e D p hn s) :=
  (activeWitness_measurable D p).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

theorem cutCorrectedActiveWitness_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg) :
    Measurable (cutCorrectedActiveWitness cfg ε M start e D L p hn s) :=
  (correctedActiveWitness_measurable D L p).comp
    ((observedWitness_measurable cfg e).comp (sourceCutTerminal_joint_measurable cfg ε M start hn s))

theorem cutActiveWitness_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (e : Retention n)
    (D : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    0≤cutActiveWitness cfg ε M start e D p hn s x ∧ cutActiveWitness cfg ε M start e D p hn s x≤1 :=
  activeWitness_bounds D p _ cfg.B (observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutCorrectedActiveWitness_bounds {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n) (s : GoodObservation cfg)
    (x : ℝ≥0×BoardClockPath n) :
    0≤cutCorrectedActiveWitness cfg ε M start e D L p hn s x ∧
      cutCorrectedActiveWitness cfg ε M start e D L p hn s x≤1 :=
  correctedActiveWitness_bounds D L p _ cfg.B (observedWitness_valid cfg e _
    (sourceCutTerminal_consistent cfg ε M start x.1 x.1.coe_nonneg hn s x.2))

theorem cutPoint_correctedWitness_mean {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (s : GoodObservation cfg) (δ : ℝ≥0) :
    (∫ω,cutCorrectedActiveWitness cfg ε M start e D L p hn s (δ,ω)
      ∂cutPointMeasure cfg ε M start hn s p δ)=cutMixedMean cfg ε M start e {p} D L hn s δ := by
  unfold cutPointMeasure
  have hZ : Measurable (fun ω=>((cutProcess cfg ε M start hn s (δ,ω)).accounts p).credit) :=
    (sourceCutCredit_joint_measurable cfg ε M start hn s p).comp (measurable_const.prodMk measurable_id)
  rw [savedCreditMeasure_integral _ _ hZ
    (fun ω=>(sourceCutCredit_bounds cfg ε M start δ δ.coe_nonneg hn s p ω).1)]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>(singleton_mixed_credit cfg.directions D L p
    (observedWitness cfg e (sourceCutTerminal cfg ε M start δ δ.coe_nonneg hn s ω))).symm)

theorem cutPoint_activeWitness_mean_bound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (D L : Finset (Grid n)) (p : Grid n) (hn : 0<n)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1) (s : GoodObservation cfg)
    (hs : augTimedCredit cfg p s.val.1=1) (hε : ε<1)
    (hinit : ∀a∈L,∀b∈L,a≠b→1-ε≤s.val.1.val.1.eta a b) (δ : ℝ≥0) :
    (∫ω,cutActiveWitness cfg ε M start e D p hn s (δ,ω)
      ∂cutPointMeasure cfg ε M start hn s p δ)≤
        cutMixedMean cfg ε M start e {p} D L hn s δ/(1-ε)^L.card.choose 2 := by
  let ν := cutPointMeasure cfg ε M start hn s p δ
  letI := cutPointMeasure_probability cfg ε M start hn hB hm s p hs δ
  have hi : Integrable (fun ω=>cutActiveWitness cfg ε M start e D p hn s (δ,ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((cutActiveWitness_measurable cfg ε M start e D p hn s).comp (measurable_const.prodMk measurable_id))
      1 (fun ω=>cutActiveWitness_bounds cfg ε M start e D p hn s (δ,ω))
  have hj : Integrable (fun ω=>cutCorrectedActiveWitness cfg ε M start e D L p hn s (δ,ω)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _
      ((cutCorrectedActiveWitness_measurable cfg ε M start e D L p hn s).comp
        (measurable_const.prodMk measurable_id)) 1
      (fun ω=>cutCorrectedActiveWitness_bounds cfg ε M start e D L p hn s (δ,ω))
  have h := integral_mono (hi.const_mul ((1-ε)^L.card.choose 2)) hj (fun ω=>
    activeWitness_eta_floor D L p _ cfg.B ε
      (observedWitness_valid cfg e _ (sourceCutTerminal_consistent cfg ε M start δ δ.coe_nonneg hn s ω))
      hε.le (fun a ha b hb hab=>sourceCutTerminal_eta_lower cfg ε M start hn s δ a b hab
        (hinit a ha b hb hab) ω))
  rw [integral_const_mul] at h
  change (1-ε)^L.card.choose 2*(∫ω,cutActiveWitness cfg ε M start e D p hn s (δ,ω) ∂ν)≤
    (∫ω,cutCorrectedActiveWitness cfg ε M start e D L p hn s (δ,ω)
      ∂cutPointMeasure cfg ε M start hn s p δ) at h
  rw [cutPoint_correctedWitness_mean] at h
  apply (le_div_iff₀ (pow_pos (sub_pos.mpr hε) _)).mpr
  simpa only [mul_comm] using h

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.cutPoint_correctedWitness_mean
#print axioms NoThreeLine.BirthWitness.cutPoint_activeWitness_mean_bound
