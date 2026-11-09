import NoThreeLine.RecycledCreditMartingale

/-! Conditional one-step upper estimates and supermartingales for recycled
noise. These general lemmas will accept actual source estimates; no source
or moment estimate of the geometric process is assumed here as a theorem. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem independent_history_setIntegral_le {Ω H W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω → H) (r : Ω → W) (hh : Measurable h) (hr : Measurable r)
    (hpair : μ.map (fun ω => (h ω,r ω)) = (μ.map h).prod ν)
    (f : H × W → ℝ) (g : H → ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map h).prod ν)) (hgi : Integrable g (μ.map h))
    (hmean : ∀ a, (∫ w, f (a,w) ∂ν) ≤ g a) (A : Set H) (hA : MeasurableSet A) :
    (∫ ω in h ⁻¹' A, f (h ω,r ω) ∂μ) ≤ ∫ ω in h ⁻¹' A, g (h ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map h) := Measure.isProbabilityMeasure_map hh.aemeasurable
  have hp : Measurable (fun ω => (h ω,r ω)) := hh.prodMk hr
  have hrestricted : (μ.restrict (h ⁻¹' A)).map (fun ω => (h ω,r ω)) = ((μ.map h).restrict A).prod ν := by
    calc
      _ = (μ.map (fun ω => (h ω,r ω))).restrict (A ×ˢ univ) := by
        rw [Measure.restrict_map hp (hA.prod MeasurableSet.univ)]
        congr 2
        ext ω
        simp
      _ = _ := by rw [hpair,← Measure.restrict_prod_eq_prod_univ]
  have hfiA : Integrable f (((μ.map h).restrict A).prod ν) := by
    rw [Measure.restrict_prod_eq_prod_univ]
    exact hfi.integrableOn
  rw [← integral_map_of_stronglyMeasurable hp hf.stronglyMeasurable,hrestricted,integral_prod _ hfiA,
    ← integral_map_of_stronglyMeasurable hh hg.stronglyMeasurable,← Measure.restrict_map hh hA]
  exact integral_mono hfiA.integral_prod_left hgi.integrableOn hmean

namespace RecycledBoardProcess

theorem history_estimate {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν)
    (z q : S → ℝ) (hz : Measurable z) (hq : Measurable q) (B Q : ℝ)
    (hb : ∀ s, 0 ≤ z s ∧ z s ≤ B) (hqb : ∀ s, 0 ≤ q s ∧ q s ≤ Q)
    (hmean : ∀ s, (∫ w, z (F (s,w)).1 ∂ν) ≤ q s) (s : S) (k : ℕ)
    (E : Set W) (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, z (state F s (k+1) w) ∂ν) ≤ ∫ w in E, q (state F s k w) ∂ν := by
  change MeasurableSet[MeasurableSpace.comap (StateHistory.history (state F s) k) inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  let H := StateHistory.history (state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (state_measurable F hF s) k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f : (Fin (k+1) → S) × W → ℝ := fun a => z (F (a.1 (Fin.last k),a.2)).1
  let g : (Fin (k+1) → S) → ℝ := fun a => q (a (Fin.last k))
  have hf : Measurable f := hz.comp (hF.comp
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).prodMk measurable_snd)).fst
  have hg : Measurable g := hq.comp (measurable_pi_apply (Fin.last k))
  have hfi : Integrable f ((ν.map H).prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ f hf B (fun a => hb _)
  have hgi : Integrable g (ν.map H) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ g hg Q (fun a => hqb _)
  exact independent_history_setIntegral_le ν ν H (fun w => (iterate F s k w).2) hH
    (iterate_measurable F hF s k).snd (history_residual_product F hF ν hsection s k)
    f g hf hg hfi hgi (fun a => hmean (a (Fin.last k))) A hA

theorem credit_supermartingale {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w)) =
      (ν.map (fun w => (F (s,w)).1)).prod ν)
    (z : S → ℝ) (hz : Measurable z) (B : ℝ) (hb : ∀ s, 0 ≤ z s ∧ z s ≤ B)
    (hmean : ∀ s, (∫ w, z (F (s,w)).1 ∂ν) ≤ z s) (s : S) :
    Supermartingale (fun k w => z (state F s k w))
      (StateHistory.filtration (state F s) (state_measurable F hF s)) ν := by
  have hadp := StateHistory.state_stronglyAdapted (state F s) (state_measurable F hF s) z hz
  have hi (k : ℕ) : Integrable (fun w => z (state F s k w)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ (hz.comp (state_measurable F hF s k)) B (fun _ => hb _)
  exact supermartingale_of_setIntegral_succ_le hadp hi
    (history_estimate F hF ν hsection z z hz hz B B hb hb hmean s)

end RecycledBoardProcess
end NoThreeLine

#print axioms NoThreeLine.independent_history_setIntegral_le
#print axioms NoThreeLine.RecycledBoardProcess.history_estimate
#print axioms NoThreeLine.RecycledBoardProcess.credit_supermartingale
