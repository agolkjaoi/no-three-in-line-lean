import NoThreeLine.BoundedMartingaleTerminal
import NoThreeLine.ProtectedFirstEnergyVariance

/-! Terminal variance of a bounded martingale with an adapted energy
compensator, when both actually stabilize. No predictability is imposed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
namespace NoThreeLine

theorem boundedEnergyTerminalVariance {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (F : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (X V : ℕ→Ω→ℝ) (hX : Martingale X F μ)
    (hXV : Martingale (fun k ω=>(X k ω)^2-V k ω) F μ)
    (B C : ℝ) (hB : ∀k ω,‖X k ω‖≤B) (hC : ∀k ω,‖V k ω‖≤C)
    (x v : Ω→ℝ) (hxm : Measurable x) (hvm : Measurable v)
    (hxs : ∀ᵐω∂μ,∀ᶠk in atTop,X k ω=x ω)
    (hvs : ∀ᵐω∂μ,∀ᶠk in atTop,V k ω=v ω)
    (c : ℝ) (hx0 : ∀ω,X 0 ω=c) (hv0 : ∀ω,V 0 ω=0) :
    Integrable (fun ω=>(x ω-c)^2) μ ∧
      (∫ω,(x ω-c)^2 ∂μ)=∫ω,v ω ∂μ := by
  have hxb : ∀ᵐω∂μ,‖x ω‖≤B := hxs.mono (fun ω hω=>by
    obtain ⟨k,hk⟩ := hω.exists
    rw [←hk]
    exact hB k ω)
  have hvb : ∀ᵐω∂μ,‖v ω‖≤C := hvs.mono (fun ω hω=>by
    obtain ⟨k,hk⟩ := hω.exists
    rw [←hk]
    exact hC k ω)
  have hxi : Integrable x μ := (integrable_const B).mono' hxm.aestronglyMeasurable hxb
  have hvi : Integrable v μ := (integrable_const C).mono' hvm.aestronglyMeasurable hvb
  have hxxi : Integrable (fun ω=>(x ω)^2) μ := by
    apply (integrable_const (B^2)).mono' (hxm.pow_const 2).aestronglyMeasurable
    filter_upwards [hxb] with ω hω
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) hω 2
  have hbound (k : ℕ) (ω : Ω) : ‖(X k ω)^2-V k ω‖≤B^2+C := by
    apply (norm_sub_le _ _).trans
    apply add_le_add _ (hC k ω)
    rw [norm_pow]
    exact pow_le_pow_left₀ (norm_nonneg _) (hB k ω) 2
  have hstable : ∀ᵐω∂μ,∀ᶠk in atTop,(X k ω)^2-V k ω=(x ω)^2-v ω := by
    filter_upwards [hxs,hvs] with ω hx hv
    filter_upwards [hx,hv] with k hxk hvk
    rw [hxk,hvk]
  have hmean := martingale_terminal_setIntegral μ F X hX B hB x hxs 0 univ MeasurableSet.univ
  have henergy := martingale_terminal_setIntegral μ F (fun k ω=>(X k ω)^2-V k ω) hXV
    (B^2+C) hbound (fun ω=>(x ω)^2-v ω) hstable 0 univ MeasurableSet.univ
  simp only [setIntegral_univ,hx0,integral_const,measureReal_def,Measure.restrict_univ,measure_univ,ENNReal.toReal_one,one_smul] at hmean
  simp only [setIntegral_univ,hx0,hv0,sub_zero,integral_const,measureReal_def,Measure.restrict_univ,measure_univ,ENNReal.toReal_one,one_smul] at henergy
  exact integral_centered_square_of_energy μ x v c hxi hxxi hvi hmean henergy

end NoThreeLine
#print axioms NoThreeLine.boundedEnergyTerminalVariance
