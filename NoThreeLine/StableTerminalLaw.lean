import NoThreeLine.RecycledCompletion
import Mathlib.MeasureTheory.Integral.Indicator

/-! Equality of finite marginal laws passes to measurable terminal states
when both sequences stabilize almost surely. The state need not carry a
topology; convergence of indicators suffices for all measurable sets. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter
open scoped Topology

namespace NoThreeLine

theorem map_eq_of_eventually_stable_marginals {Ω Ξ S : Type*}
    [MeasurableSpace Ω] [MeasurableSpace Ξ] [MeasurableSpace S]
    (μ : Measure Ω) (ν : Measure Ξ) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (f : ℕ → Ω → S) (g : ℕ → Ξ → S) (F : Ω → S) (G : Ξ → S)
    (hf : ∀ k, Measurable (f k)) (hg : ∀ k, Measurable (g k))
    (hF : Measurable F) (hG : Measurable G) (heq : ∀ k, μ.map (f k) = ν.map (g k))
    (hfs : ∀ᵐ ω ∂μ, ∀ᶠ k in atTop, f k ω = F ω)
    (hgs : ∀ᵐ ξ ∂ν, ∀ᶠ k in atTop, g k ξ = G ξ) : μ.map F = ν.map G := by
  apply Measure.ext
  intro A hA
  rw [Measure.map_apply hF hA,Measure.map_apply hG hA]
  have hx : Tendsto (fun k => μ ((f k) ⁻¹' A)) atTop (𝓝 (μ (F ⁻¹' A))) := by
    apply tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure atTop (hA.preimage hF)
      (fun k => hA.preimage (hf k))
    filter_upwards [hfs] with ω hω
    filter_upwards [hω] with k hk
    simp only [mem_preimage,hk]
  have hy : Tendsto (fun k => ν ((g k) ⁻¹' A)) atTop (𝓝 (ν (G ⁻¹' A))) := by
    apply tendsto_measure_of_ae_tendsto_indicator_of_isFiniteMeasure atTop (hA.preimage hG)
      (fun k => hA.preimage (hg k))
    filter_upwards [hgs] with ξ hξ
    filter_upwards [hξ] with k hk
    simp only [mem_preimage,hk]
  have he (k : ℕ) : μ ((f k) ⁻¹' A) = ν ((g k) ⁻¹' A) := by
    have h := congrArg (fun m : Measure S => m A) (heq k)
    simpa only [Measure.map_apply (hf k) hA,Measure.map_apply (hg k) hA] using h
  simp_rw [he] at hx
  exact tendsto_nhds_unique hx hy

end NoThreeLine

#print axioms NoThreeLine.map_eq_of_eventually_stable_marginals
