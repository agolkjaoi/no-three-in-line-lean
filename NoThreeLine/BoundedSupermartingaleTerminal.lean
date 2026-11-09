import NoThreeLine.BoundedMartingaleTerminal

/-! Terminal history inequality for bounded supermartingales that actually
stabilize. The limit is supplied by the concrete absorption theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology
namespace NoThreeLine

theorem supermartingale_terminal_setIntegral_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (ℱ : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (f : ℕ→Ω→ℝ) (hf : Supermartingale f ℱ μ) (B : ℝ) (hb : ∀k ω,‖f k ω‖≤B)
    (g : Ω→ℝ) (hstable : ∀ᵐω ∂μ,∀ᶠj in atTop,f j ω=g ω)
    (k : ℕ) (A : Set Ω) (hA : MeasurableSet[ℱ k] A) :
    (∫ω in A,g ω ∂μ)≤∫ω in A,f k ω ∂μ := by
  have hm (j : ℕ) : AEStronglyMeasurable (f j) (μ.restrict A) :=
    ((hf.stronglyMeasurable j).mono (ℱ.le j)).aestronglyMeasurable
  have hlim : ∀ᵐω ∂μ.restrict A,Tendsto (fun j=>f j ω) atTop (𝓝 (g ω)) := by
    filter_upwards [ae_restrict_of_ae hstable] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun j hj=>hj.symm))
  have ht := tendsto_integral_of_dominated_convergence (fun _ : Ω=>B)
    hm (integrable_const B) (fun j=>Filter.Eventually.of_forall (hb j)) hlim
  apply le_of_tendsto ht
  filter_upwards [eventually_ge_atTop k] with j hj
  exact hf.setIntegral_le hj hA

end NoThreeLine
#print axioms NoThreeLine.supermartingale_terminal_setIntegral_le
