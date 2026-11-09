import NoThreeLine.BoundedSupermartingaleTerminal
import NoThreeLine.SavedCreditHistory

/-! A bounded nonnegative old-history test can multiply the terminal
supermartingale inequality. This prepares actual cut-crossing tests. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology
namespace NoThreeLine

theorem supermartingale_terminal_test_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (ℱ : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (f : ℕ→Ω→ℝ) (hf : Supermartingale f ℱ μ) (B : ℝ)
    (hb : ∀k ω,0≤f k ω ∧ f k ω≤B) (g : Ω→ℝ)
    (hstable : ∀ᵐω ∂μ,∀ᶠj in atTop,f j ω=g ω) (k : ℕ)
    (F : Ω→ℝ) (hF : @Measurable Ω ℝ (ℱ k) inferInstance F)
    (C : ℝ) (hFC : ∀ω,0≤F ω ∧ F ω≤C) :
    (∫ω,g ω*F ω ∂μ)≤∫ω,f k ω*F ω ∂μ := by
  have hFm : Measurable F := hF.mono (ℱ.le k) le_rfl
  have hprod (j : ℕ) : Integrable (fun ω=>f j ω*F ω) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _
      (((hf.stronglyMeasurable j).mono (ℱ.le j)).measurable.mul hFm) (B*C)
      (fun ω=>⟨mul_nonneg (hb j ω).1 (hFC ω).1,
        mul_le_mul (hb j ω).2 (hFC ω).2 (hFC ω).1 ((hb j ω).1.trans (hb j ω).2)⟩)
  have hle (j : ℕ) (hj : k≤j) : (∫ω,f j ω*F ω ∂μ)≤∫ω,f k ω*F ω ∂μ := by
    have he := condExp_mul_of_stronglyMeasurable_right hF.stronglyMeasurable (hprod j) (hf.integrable j)
    have hc : Integrable (fun ω=>condExp (ℱ k) μ (f j) ω*F ω) μ := integrable_condExp.congr he
    calc
      _ = ∫ω,condExp (ℱ k) μ (fun ω=>f j ω*F ω) ω ∂μ := (integral_condExp (ℱ.le k)).symm
      _ = ∫ω,condExp (ℱ k) μ (f j) ω*F ω ∂μ := integral_congr_ae he
      _ ≤ _ := integral_mono_ae hc (hprod k) ((hf.condExp_ae_le hj).mono
        (fun ω hω=>mul_le_mul_of_nonneg_right hω (hFC ω).1))
  have hm (j : ℕ) : AEStronglyMeasurable (fun ω=>f j ω*F ω) μ := (hprod j).aestronglyMeasurable
  have hlim : ∀ᵐω ∂μ,Tendsto (fun j=>f j ω*F ω) atTop (𝓝 (g ω*F ω)) := by
    filter_upwards [hstable] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun j hj=>congrArg (fun x=>x*F ω) hj.symm))
  have hbound (j : ℕ) : ∀ᵐω ∂μ,‖f j ω*F ω‖≤B*C := by
    filter_upwards [] with ω
    rw [Real.norm_eq_abs,abs_of_nonneg (mul_nonneg (hb j ω).1 (hFC ω).1)]
    exact mul_le_mul (hb j ω).2 (hFC ω).2 (hFC ω).1 ((hb j ω).1.trans (hb j ω).2)
  have ht := tendsto_integral_of_dominated_convergence (fun _ : Ω=>B*C) hm (integrable_const _) hbound hlim
  apply le_of_tendsto ht
  filter_upwards [eventually_ge_atTop k] with j hj
  exact hle j hj

end NoThreeLine
#print axioms NoThreeLine.supermartingale_terminal_test_le
