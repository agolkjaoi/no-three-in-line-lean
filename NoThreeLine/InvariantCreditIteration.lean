import NoThreeLine.GenericCreditIteration

/-! Finite mean preservation only on a proved transition-invariant region.
Applications must supply both the one-step identity and invariance. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory

namespace NoThreeLine.GenericCreditIteration

theorem finiteState_invariant {X Ξ : Type*} (φ : X × Ξ → X) (R : X→Prop)
    (hR : ∀x,R x → ∀ξ,R (φ (x,ξ))) (k : ℕ) (x : X) (hx : R x) (v : Fin k→Ξ) :
    R (finiteState φ k x v) := by
  induction k with
  | zero => exact hx
  | succ k ih => exact hR _ (ih (fun i=>v i.castSucc)) _

theorem finite_expected_credit_of_invariant {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀x,0≤z x ∧ z x≤B)
    (R : X→Prop) (hR : ∀x,R x → ∀ξ,R (φ (x,ξ)))
    (hstep : ∀x,R x → (∫ξ,z (φ (x,ξ)) ∂ν)=z x) (k : ℕ) (x : X) (hx : R x) :
    (∫v,z (finiteState φ k x v) ∂Measure.pi (fun _ : Fin k=>ν))=z x := by
  induction k with
  | zero => simp [finiteState]
  | succ k ih =>
    have hm : Measurable (fun v=>z (finiteState φ (k+1) x v)) :=
      hz.comp (finiteState_fixed_measurable φ hφ (k+1) x)
    have hprod : Integrable (fun a : (Fin k→Ξ)×Ξ=>z (φ (finiteState φ k x a.1,a.2)))
        ((Measure.pi (fun _ : Fin k=>ν)).prod ν) :=
      bounded_nonnegative_integrable _ _
        (hz.comp (hφ.comp (((finiteState_fixed_measurable φ hφ k x).comp measurable_fst).prodMk
          measurable_snd))) B (fun a=>hb _)
    rw [←(fin_snoc_preserving ν k).map_eq,
      integral_map_of_stronglyMeasurable (fin_snoc_preserving ν k).measurable hm.stronglyMeasurable]
    simp only [finiteState_snoc]
    rw [integral_prod _ hprod]
    have he (v : Fin k→Ξ) : (∫ξ,z (φ (finiteState φ k x v,ξ)) ∂ν)=z (finiteState φ k x v) :=
      hstep _ (finiteState_invariant φ R hR k x hx v)
    simp_rw [he]
    exact ih

theorem infinitePi_expected_credit_of_invariant {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X→ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀x,0≤z x ∧ z x≤B)
    (R : X→Prop) (hR : ∀x,R x → ∀ξ,R (φ (x,ξ)))
    (hstep : ∀x,R x → (∫ξ,z (φ (x,ξ)) ∂ν)=z x) (k : ℕ) (x : X) (hx : R x) :
    (∫ω,z (noiseState φ x k ω) ∂Measure.infinitePi (fun _ : ℕ=>ν))=z x := by
  have hm : Measurable (fun v=>z (finiteState φ k x v)) := hz.comp (finiteState_fixed_measurable φ hφ k x)
  change (∫ω,z (finiteState φ k x (noisePrefix k ω)) ∂Measure.infinitePi (fun _ : ℕ=>ν))=_
  rw [←integral_map_of_stronglyMeasurable (noisePrefix_measurable k) hm.stronglyMeasurable,
    noisePrefix_map ν k]
  exact finite_expected_credit_of_invariant φ hφ ν z hz B hb R hR hstep k x hx

end NoThreeLine.GenericCreditIteration

#print axioms NoThreeLine.GenericCreditIteration.infinitePi_expected_credit_of_invariant
