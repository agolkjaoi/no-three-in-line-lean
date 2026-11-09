import NoThreeLine.RestartIntegralAPI

/-! A general measurable transition driven by iid noise. Pointwise
one-step mean preservation of a bounded real credit implies preservation
at every finite iterate. This is a library result, not yet an application
to the full geometric state/guard process. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.GenericCreditIteration

def finiteState {X Ξ : Type*} (φ : X × Ξ → X) :
    (k : ℕ) → X → (Fin k → Ξ) → X
  | 0, x, _ => x
  | k+1, x, v => φ (finiteState φ k x (fun i => v i.castSucc), v (Fin.last k))

theorem finiteState_measurable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (k : ℕ) :
    Measurable (fun z : X × (Fin k → Ξ) => finiteState φ k z.1 z.2) := by
  induction k with
  | zero => exact measurable_fst
  | succ k ih =>
    exact hφ.comp ((ih.comp (measurable_fst.prodMk
      (measurable_pi_lambda _ (fun i => (measurable_pi_apply i.castSucc).comp measurable_snd)))).prodMk
        ((measurable_pi_apply (Fin.last k)).comp measurable_snd))

theorem finiteState_fixed_measurable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (k : ℕ) (x : X) :
    Measurable (finiteState φ k x) :=
  (finiteState_measurable φ hφ k).comp (measurable_const.prodMk measurable_id)

theorem finiteState_snoc {X Ξ : Type*} (φ : X × Ξ → X) (k : ℕ) (x : X)
    (v : Fin k → Ξ) (ξ : Ξ) :
    finiteState φ (k+1) x (Fin.snoc v ξ) = φ (finiteState φ k x v,ξ) := by
  simp [finiteState]

theorem fin_snoc_preserving {Ξ : Type*} [MeasurableSpace Ξ]
    (ν : Measure Ξ) [IsProbabilityMeasure ν] (k : ℕ) :
    MeasurePreserving (fun z : (Fin k → Ξ) × Ξ => Fin.snoc z.1 z.2)
      ((Measure.pi (fun _ : Fin k => ν)).prod ν)
      (Measure.pi (fun _ : Fin (k+1) => ν)) := by
  have h := MeasurePreserving.symm
    (MeasurableEquiv.piFinSuccAbove (fun _ : Fin (k+1) => Ξ) (Fin.last k))
    (measurePreserving_piFinSuccAbove (fun _ : Fin (k+1) => ν) (Fin.last k))
  have hs := h.comp (Measure.measurePreserving_swap
    (μ := Measure.pi (fun _ : Fin k => ν)) (ν := ν))
  simpa [MeasurableEquiv.piFinSuccAbove, Fin.snocEquiv, Function.comp_def] using hs

theorem bounded_nonnegative_integrable {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (f : Ω → ℝ) (hf : Measurable f)
    (B : ℝ) (hb : ∀ ω, 0 ≤ f ω ∧ f ω ≤ B) : Integrable f μ := by
  apply (integrable_const B).mono' hf.aestronglyMeasurable
  exact Filter.Eventually.of_forall (fun ω => by simpa only [Real.norm_eq_abs, abs_of_nonneg (hb ω).1] using (hb ω).2)

theorem finite_credit_integrable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (k : ℕ) (x : X) :
    Integrable (fun v => z (finiteState φ k x v)) (Measure.pi (fun _ : Fin k => ν)) :=
  bounded_nonnegative_integrable _ _ (hz.comp (finiteState_fixed_measurable φ hφ k x)) B
    (fun _ => hb _)

theorem finite_expected_credit {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (k : ℕ) (x : X) :
    (∫ v, z (finiteState φ k x v) ∂Measure.pi (fun _ : Fin k => ν)) = z x := by
  induction k with
  | zero => simp [finiteState]
  | succ k ih =>
    have hm : Measurable (fun v => z (finiteState φ (k+1) x v)) :=
      hz.comp (finiteState_fixed_measurable φ hφ (k+1) x)
    have hprod : Integrable (fun a : (Fin k → Ξ) × Ξ => z (φ (finiteState φ k x a.1,a.2)))
        ((Measure.pi (fun _ : Fin k => ν)).prod ν) :=
      bounded_nonnegative_integrable _ _
        (hz.comp (hφ.comp (((finiteState_fixed_measurable φ hφ k x).comp measurable_fst).prodMk
          measurable_snd))) B (fun a => hb _)
    rw [← (fin_snoc_preserving ν k).map_eq,
      integral_map_of_stronglyMeasurable (fin_snoc_preserving ν k).measurable hm.stronglyMeasurable]
    simp only [finiteState_snoc]
    rw [integral_prod _ hprod]
    simp_rw [hstep]
    exact ih

def noisePrefix {Ξ : Type*} (k : ℕ) (ω : ℕ → Ξ) : Fin k → Ξ := fun i => ω i.val

theorem noisePrefix_measurable {Ξ : Type*} [MeasurableSpace Ξ] (k : ℕ) :
    Measurable (@noisePrefix Ξ k) := measurable_pi_lambda _ (fun i => measurable_pi_apply i.val)

theorem noisePrefix_map {Ξ : Type*} [MeasurableSpace Ξ]
    (ν : Measure Ξ) [IsProbabilityMeasure ν] (k : ℕ) :
    (Measure.infinitePi (fun _ : ℕ => ν)).map (noisePrefix k) =
      Measure.pi (fun _ : Fin k => ν) := by
  unfold noisePrefix
  rw [Measure.map_infinitePi_infinitePi_of_inj (P := fun _ : ℕ => ν) Fin.val_injective,
    Measure.infinitePi_eq_pi]

def noiseState {X Ξ : Type*} (φ : X × Ξ → X) (x : X) (k : ℕ) (ω : ℕ → Ξ) : X :=
  finiteState φ k x (noisePrefix k ω)

theorem noiseState_zero {X Ξ : Type*} (φ : X × Ξ → X) (x : X) (ω : ℕ → Ξ) :
    noiseState φ x 0 ω = x := rfl

theorem noiseState_succ {X Ξ : Type*} (φ : X × Ξ → X) (x : X) (k : ℕ) (ω : ℕ → Ξ) :
    noiseState φ x (k+1) ω = φ (noiseState φ x k ω,ω k) := rfl

theorem noiseState_measurable {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (x : X) (k : ℕ) :
    Measurable (noiseState φ x k) :=
  (finiteState_fixed_measurable φ hφ k x).comp (noisePrefix_measurable k)

theorem expectation_of_prefix_law {X Ξ Ω : Type*} [MeasurableSpace X]
    [MeasurableSpace Ξ] [MeasurableSpace Ω]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x)
    (k : ℕ) (x : X) (μ : Measure Ω) (pref : Ω → Fin k → Ξ)
    (hprefix : Measurable pref) (hlaw : μ.map pref = Measure.pi (fun _ : Fin k => ν)) :
    (∫ ω, z (finiteState φ k x (pref ω)) ∂μ) = z x := by
  have hm : Measurable (fun v => z (finiteState φ k x v)) :=
    hz.comp (finiteState_fixed_measurable φ hφ k x)
  rw [← integral_map_of_stronglyMeasurable hprefix hm.stronglyMeasurable, hlaw]
  exact finite_expected_credit φ hφ ν z hz B hb hstep k x

theorem infinitePi_expected_credit {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (k : ℕ) (x : X) :
    (∫ ω, z (noiseState φ x k ω) ∂Measure.infinitePi (fun _ : ℕ => ν)) = z x :=
  expectation_of_prefix_law φ hφ ν z hz B hb hstep k x _ (noisePrefix k)
    (noisePrefix_measurable k) (noisePrefix_map ν k)

end NoThreeLine.GenericCreditIteration

#print axioms NoThreeLine.GenericCreditIteration.finite_expected_credit
#print axioms NoThreeLine.GenericCreditIteration.infinitePi_expected_credit
