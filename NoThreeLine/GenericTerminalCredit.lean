import NoThreeLine.GenericCreditIteration
import Mathlib.MeasureTheory.Integral.DominatedConvergence

/-! Freeze a measurable transition on a terminal region and pass bounded
finite-step credit identities to an almost-sure terminal limit. The
application must prove actual convergence or finite-time stabilization. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped Topology

namespace NoThreeLine.GenericTerminalCredit
open GenericCreditIteration

def freezeTransition {X Ξ : Type*} (S : Set X) (φ : X × Ξ → X) (a : X × Ξ) : X := by
  classical
  exact if a.1 ∈ S then a.1 else φ a

theorem freezeTransition_measurable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (S : Set X) (hS : MeasurableSet S) (φ : X × Ξ → X) (hφ : Measurable φ) :
    Measurable (freezeTransition S φ) := by
  classical
  exact Measurable.ite (hS.preimage measurable_fst) measurable_fst hφ

theorem freezeTransition_mean {X Ξ : Type*} [MeasurableSpace Ξ]
    (S : Set X) (φ : X × Ξ → X) (ν : Measure Ξ) [IsProbabilityMeasure ν] (z : X → ℝ)
    (hstep : ∀ x ∉ S, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (x : X) :
    (∫ ξ, z (freezeTransition S φ (x,ξ)) ∂ν) = z x := by
  classical
  by_cases hx : x ∈ S
  · simp [freezeTransition, hx]
  · simpa only [freezeTransition, hx, ↓reduceIte] using hstep x hx

theorem finiteState_frozen {X Ξ : Type*} (S : Set X) (φ : X × Ξ → X)
    (x : X) (hx : x ∈ S) (k : ℕ) (v : Fin k → Ξ) :
    finiteState (freezeTransition S φ) k x v = x := by
  classical
  induction k with
  | zero => rfl
  | succ k ih => simp [finiteState, ih, freezeTransition, hx]

theorem expected_credit_of_ae_tendsto {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (x : X) (terminal : (ℕ → Ξ) → ℝ)
    (hlim : ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => ν),
      Tendsto (fun k => z (noiseState φ x k ω)) atTop (𝓝 (terminal ω))) :
    (∫ ω, terminal ω ∂Measure.infinitePi (fun _ : ℕ => ν)) = z x := by
  have hm (k : ℕ) : AEStronglyMeasurable (fun ω => z (noiseState φ x k ω))
      (Measure.infinitePi (fun _ : ℕ => ν)) :=
    (hz.comp (noiseState_measurable φ hφ x k)).aestronglyMeasurable
  have hbound (k : ℕ) : ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => ν),
      ‖z (noiseState φ x k ω)‖ ≤ B := Filter.Eventually.of_forall (fun ω => by
        simpa only [Real.norm_eq_abs, abs_of_nonneg (hb _).1] using (hb (noiseState φ x k ω)).2)
  have ht := tendsto_integral_of_dominated_convergence (fun _ : ℕ → Ξ => B)
    hm (integrable_const B) hbound hlim
  simp_rw [infinitePi_expected_credit φ hφ ν z hz B hb hstep] at ht
  exact tendsto_nhds_unique ht tendsto_const_nhds

theorem expected_credit_of_eventually_stable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (x : X) (terminal : (ℕ → Ξ) → X)
    (hstable : ∀ᵐ ω ∂Measure.infinitePi (fun _ : ℕ => ν),
      ∀ᶠ k in atTop, noiseState φ x k ω = terminal ω) :
    (∫ ω, z (terminal ω) ∂Measure.infinitePi (fun _ : ℕ => ν)) = z x := by
  apply expected_credit_of_ae_tendsto φ hφ ν z hz B hb hstep x (fun ω => z (terminal ω))
  filter_upwards [hstable] with ω hω
  exact tendsto_const_nhds.congr' (hω.mono (fun k hk => (congrArg z hk).symm))

end NoThreeLine.GenericTerminalCredit

#print axioms NoThreeLine.GenericTerminalCredit.expected_credit_of_eventually_stable
