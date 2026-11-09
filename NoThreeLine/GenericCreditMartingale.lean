import NoThreeLine.GenericCreditIteration
import Mathlib.Probability.Martingale.Basic

/-! Natural noise-prefix filtration and the bounded-credit martingale
of a measurable iid-driven transition. The one-step mean identity remains
an explicit general-library hypothesis, to be supplied by the state model. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped BigOperators

namespace NoThreeLine.GenericCreditMartingale
open GenericCreditIteration

def past {Ξ : Type*} (k : ℕ) (v : Fin (k+1) → Ξ) : Fin k → Ξ := fun i => v i.castSucc

theorem past_measurable {Ξ : Type*} [MeasurableSpace Ξ] (k : ℕ) : Measurable (@past Ξ k) :=
  measurable_pi_lambda _ (fun i => measurable_pi_apply i.castSucc)

def noiseFiltration (Ξ : Type*) [MeasurableSpace Ξ] :
    Filtration ℕ (inferInstance : MeasurableSpace (ℕ → Ξ)) where
  seq k := MeasurableSpace.comap (noisePrefix (Ξ := Ξ) k) inferInstance
  mono' := by
    intro i j hij
    let take : (Fin j → Ξ) → (Fin i → Ξ) := fun v k => v (Fin.castLE hij k)
    have hm : Measurable take := measurable_pi_lambda _ (fun k => measurable_pi_apply (Fin.castLE hij k))
    have he : noisePrefix (Ξ := Ξ) i = take ∘ noisePrefix j := rfl
    change MeasurableSpace.comap (noisePrefix (Ξ := Ξ) i) inferInstance ≤
      MeasurableSpace.comap (noisePrefix (Ξ := Ξ) j) inferInstance
    rw [he, ← MeasurableSpace.comap_comp]
    exact MeasurableSpace.comap_mono hm.comap_le
  le' k := (noisePrefix_measurable k).comap_le

theorem setIntegral_noisePrefix {Ξ : Type*} [MeasurableSpace Ξ]
    (ν : Measure Ξ) [IsProbabilityMeasure ν] (k : ℕ)
    (A : Set (Fin k → Ξ)) (hA : MeasurableSet A) (f : (Fin k → Ξ) → ℝ) (hf : Measurable f) :
    (∫ ω in noisePrefix k ⁻¹' A, f (noisePrefix k ω) ∂Measure.infinitePi (fun _ : ℕ => ν)) =
      ∫ v in A, f v ∂Measure.pi (fun _ : Fin k => ν) := by
  rw [← integral_map_of_stronglyMeasurable (noisePrefix_measurable k) hf.stronglyMeasurable,
    ← Measure.restrict_map (noisePrefix_measurable k) hA, noisePrefix_map ν k]

theorem finite_history_credit {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (k : ℕ) (x : X)
    (A : Set (Fin k → Ξ)) (hA : MeasurableSet A) :
    (∫ v in past k ⁻¹' A, z (finiteState φ (k+1) x v) ∂Measure.pi (fun _ : Fin (k+1) => ν)) =
      ∫ v in A, z (finiteState φ k x v) ∂Measure.pi (fun _ : Fin k => ν) := by
  have hs := fin_snoc_preserving ν k
  have hr : (Measure.pi (fun _ : Fin (k+1) => ν)).restrict (past k ⁻¹' A) =
      (((Measure.pi (fun _ : Fin k => ν)).prod ν).restrict (A ×ˢ univ)).map
        (fun a : (Fin k → Ξ) × Ξ => Fin.snoc a.1 a.2) := by
    rw [← hs.map_eq, Measure.restrict_map hs.measurable (hA.preimage (past_measurable k))]
    congr 2
    ext a
    change (fun i : Fin k => (Fin.snoc a.1 a.2 : Fin (k+1) → Ξ) i.castSucc) ∈ A ↔
      a.1 ∈ A ∧ a.2 ∈ univ
    simp only [Fin.snoc_castSucc, Set.mem_univ, and_true]
  have hcredit : Measurable (fun v => z (finiteState φ (k+1) x v)) :=
    hz.comp (finiteState_fixed_measurable φ hφ (k+1) x)
  have hprod : Integrable (fun a : (Fin k → Ξ) × Ξ => z (φ (finiteState φ k x a.1,a.2)))
      (((Measure.pi (fun _ : Fin k => ν)).restrict A).prod ν) :=
    bounded_nonnegative_integrable _ _
      (hz.comp (hφ.comp (((finiteState_fixed_measurable φ hφ k x).comp measurable_fst).prodMk
        measurable_snd))) B (fun _ => hb _)
  rw [hr, integral_map_of_stronglyMeasurable hs.measurable hcredit.stronglyMeasurable,
    ← Measure.restrict_prod_eq_prod_univ]
  simp only [finiteState_snoc]
  rw [integral_prod _ hprod]
  simp_rw [hstep]

theorem noise_history_credit {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (k : ℕ) (x : X)
    (S : Set (ℕ → Ξ)) (hS : MeasurableSet[noiseFiltration Ξ k] S) :
    (∫ ω in S, z (noiseState φ x (k+1) ω) ∂Measure.infinitePi (fun _ : ℕ => ν)) =
      ∫ ω in S, z (noiseState φ x k ω) ∂Measure.infinitePi (fun _ : ℕ => ν) := by
  change MeasurableSet[MeasurableSpace.comap (noisePrefix k) inferInstance] S at hS
  obtain ⟨A,hA,rfl⟩ := hS
  have hnext : noisePrefix (Ξ := Ξ) k ⁻¹' A = noisePrefix (k+1) ⁻¹' (past k ⁻¹' A) := rfl
  have hc (j : ℕ) : Measurable (fun v => z (finiteState φ j x v)) :=
    hz.comp (finiteState_fixed_measurable φ hφ j x)
  change (∫ ω in noisePrefix k ⁻¹' A, z (finiteState φ (k+1) x (noisePrefix (k+1) ω)) ∂_) = _
  conv_lhs => rw [hnext]
  rw [setIntegral_noisePrefix ν (k+1) _ (hA.preimage (past_measurable k)) _ (hc (k+1)),
    finite_history_credit φ hφ ν z hz B hb hstep k x A hA]
  exact (setIntegral_noisePrefix ν k A hA _ (hc k)).symm

theorem noise_credit_stronglyAdapted {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (z : X → ℝ) (hz : Measurable z) (x : X) :
    StronglyAdapted (noiseFiltration Ξ) (fun k ω => z (noiseState φ x k ω)) := by
  intro k
  apply Measurable.stronglyMeasurable
  exact (hz.comp (finiteState_fixed_measurable φ hφ k x)).comp (comap_measurable (noisePrefix k))

theorem noise_credit_martingale {X Ξ : Type*} [MeasurableSpace X] [MeasurableSpace Ξ]
    (φ : X × Ξ → X) (hφ : Measurable φ) (ν : Measure Ξ) [IsProbabilityMeasure ν]
    (z : X → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ x, 0 ≤ z x ∧ z x ≤ B)
    (hstep : ∀ x, (∫ ξ, z (φ (x,ξ)) ∂ν) = z x) (x : X) :
    Martingale (fun k ω => z (noiseState φ x k ω)) (noiseFiltration Ξ)
      (Measure.infinitePi (fun _ : ℕ => ν)) := by
  have hadp := noise_credit_stronglyAdapted φ hφ z hz x
  have hi (k : ℕ) : Integrable (fun ω => z (noiseState φ x k ω))
      (Measure.infinitePi (fun _ : ℕ => ν)) :=
    bounded_nonnegative_integrable _ _ (hz.comp (noiseState_measurable φ hφ x k)) B (fun _ => hb _)
  rw [martingale_iff]
  exact ⟨supermartingale_of_setIntegral_succ_le hadp hi (fun k S hS =>
    (noise_history_credit φ hφ ν z hz B hb hstep k x S hS).le),
    submartingale_of_setIntegral_le_succ hadp hi (fun k S hS =>
      (noise_history_credit φ hφ ν z hz B hb hstep k x S hS).ge)⟩

end NoThreeLine.GenericCreditMartingale

#print axioms NoThreeLine.GenericCreditMartingale.noise_credit_martingale
