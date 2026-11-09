import NoThreeLine.GenericTerminalCredit
import NoThreeLine.GenericCreditMartingale

/-! A bounded martingale that actually stabilizes almost surely is closed
by its terminal variable. The terminal variable is not an assumed limit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter
open scoped Topology

namespace NoThreeLine

theorem martingale_terminal_setIntegral {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (ℱ : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (f : ℕ → Ω → ℝ) (hf : Martingale f ℱ μ) (B : ℝ) (hb : ∀ k ω, ‖f k ω‖ ≤ B)
    (g : Ω → ℝ) (hstable : ∀ᵐ ω ∂μ, ∀ᶠ j in atTop, f j ω = g ω)
    (k : ℕ) (A : Set Ω) (hA : MeasurableSet[ℱ k] A) :
    (∫ ω in A, g ω ∂μ) = ∫ ω in A, f k ω ∂μ := by
  have hm (j : ℕ) : AEStronglyMeasurable (f j) (μ.restrict A) :=
    ((hf.stronglyMeasurable j).mono (ℱ.le j)).aestronglyMeasurable
  have hlim : ∀ᵐ ω ∂μ.restrict A, Tendsto (fun j => f j ω) atTop (𝓝 (g ω)) := by
    filter_upwards [ae_restrict_of_ae hstable] with ω hω
    exact tendsto_const_nhds.congr' (hω.mono (fun j hj => hj.symm))
  have ht := tendsto_integral_of_dominated_convergence (fun _ : Ω => B)
    hm (integrable_const B) (fun j => Filter.Eventually.of_forall (hb j)) hlim
  have heq : ∀ᶠ j in atTop, (∫ ω in A, f j ω ∂μ) = ∫ ω in A, f k ω ∂μ := by
    filter_upwards [eventually_ge_atTop k] with j hj
    exact (hf.setIntegral_eq hj hA).symm
  exact tendsto_nhds_unique ht (tendsto_const_nhds.congr' (heq.mono (fun j hj => hj.symm)))

theorem martingale_terminal_condExp {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (ℱ : Filtration ℕ (inferInstance : MeasurableSpace Ω))
    (f : ℕ → Ω → ℝ) (hf : Martingale f ℱ μ) (B : ℝ) (hb : ∀ k ω, ‖f k ω‖ ≤ B)
    (g : Ω → ℝ) (hgi : Integrable g μ)
    (hstable : ∀ᵐ ω ∂μ, ∀ᶠ j in atTop, f j ω = g ω) (k : ℕ) :
    μ[g | ℱ k] =ᵐ[μ] f k := by
  symm
  apply ae_eq_condExp_of_forall_setIntegral_eq (ℱ.le k) hgi
  · intro A hA hfinite
    exact (hf.integrable k).integrableOn
  · intro A hA hfinite
    exact (martingale_terminal_setIntegral μ ℱ f hf B hb g hstable k A hA).symm
  · exact (hf.stronglyMeasurable k).aestronglyMeasurable

end NoThreeLine

#print axioms NoThreeLine.martingale_terminal_setIntegral
#print axioms NoThreeLine.martingale_terminal_condExp
