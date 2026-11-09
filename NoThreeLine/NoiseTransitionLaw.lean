import NoThreeLine.FiniteTransitionLaw

/-! Two independently driven measurable transitions have identical finite
state laws when their actual one-state noise pushforwards agree. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem map_prod_eq_of_sections {S W V X : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V] [MeasurableSpace X]
    (μ : Measure S) (ν : Measure W) (ρ : Measure V) [SFinite ν] [SFinite ρ]
    (f : S × W → X) (g : S × V → X) (hf : Measurable f) (hg : Measurable g)
    (heq : ∀ s, ν.map (fun w => f (s,w)) = ρ.map (fun v => g (s,v))) :
    (μ.prod ν).map f = (μ.prod ρ).map g := by
  apply Measure.ext
  intro A hA
  rw [Measure.map_apply hf hA,Measure.map_apply hg hA,
    Measure.prod_apply (hA.preimage hf),Measure.prod_apply (hA.preimage hg)]
  apply lintegral_congr
  intro s
  have h := congrArg (fun m : Measure X => m A) (heq s)
  have hfs : Measurable (fun w : W => f (s,w)) :=
    hf.comp (measurable_const.prodMk measurable_id)
  have hgs : Measurable (fun v : V => g (s,v)) :=
    hg.comp (measurable_const.prodMk measurable_id)
  rw [Measure.map_apply hfs hA,Measure.map_apply hgs hA] at h
  exact h

theorem stateLaw_eq_of_transition_laws {S W V : Type*}
    [MeasurableSpace S] [MeasurableSpace W] [MeasurableSpace V]
    (φ : S × W → S) (ψ : S × V → S) (hφ : Measurable φ) (hψ : Measurable ψ)
    (ν : Measure W) (ρ : Measure V) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ]
    (heq : ∀ s, ν.map (fun w => φ (s,w)) = ρ.map (fun v => ψ (s,v))) (s : S) (k : ℕ) :
    FiniteTransitionLaw.stateLaw φ ν s k = FiniteTransitionLaw.stateLaw ψ ρ s k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((FiniteTransitionLaw.stateLaw φ ν s k).prod ν).map φ =
      ((FiniteTransitionLaw.stateLaw ψ ρ s k).prod ρ).map ψ
    rw [ih]
    exact map_prod_eq_of_sections _ ν ρ φ ψ hφ hψ heq

end NoThreeLine

#print axioms NoThreeLine.map_prod_eq_of_sections
#print axioms NoThreeLine.stateLaw_eq_of_transition_laws
