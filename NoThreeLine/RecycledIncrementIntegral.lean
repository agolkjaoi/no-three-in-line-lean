import NoThreeLine.RecycledCreditMartingale

/-! Compare two bounded actual step increments on every finite-history
event using the proved residual-board product law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem history_function_mean {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (f : S × W → ℝ) (hf : Measurable f) (B : ℝ) (hb : ∀ x,0≤f x ∧ f x≤B)
    (g : S → ℝ) (hg : Measurable g) (hmean : ∀ s,(∫w,f (s,w) ∂ν)=g s)
    (s : S) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫w in E,f (iterate F s k w) ∂ν)=∫w in E,g (state F s k w) ∂ν := by
  change MeasurableSet[MeasurableSpace.comap (StateHistory.history (state F s) k) inferInstance] E at hE
  obtain ⟨A,hA,rfl⟩ := hE
  let H := StateHistory.history (state F s) k
  have hH : Measurable H := StateHistory.history_measurable _ (state_measurable F hF s) k
  letI : IsProbabilityMeasure (ν.map H) := Measure.isProbabilityMeasure_map hH.aemeasurable
  let f' : (Fin (k+1) → S) × W → ℝ := fun x=>f (x.1 (Fin.last k),x.2)
  let g' : (Fin (k+1) → S) → ℝ := fun x=>g (x (Fin.last k))
  have hf' : Measurable f' := hf.comp
    (((measurable_pi_apply (Fin.last k)).comp measurable_fst).prodMk measurable_snd)
  have hg' : Measurable g' := hg.comp (measurable_pi_apply (Fin.last k))
  have hi : Integrable f' ((ν.map H).prod ν) :=
    GenericCreditIteration.bounded_nonnegative_integrable _ _ hf' B (fun x=>hb _)
  exact independent_history_setIntegral ν ν H (fun w=>(iterate F s k w).2) hH
    (iterate_measurable F hF s k).snd (history_residual_product F hF ν hsection s k)
    f' g' hf' hg' hi (fun x=>hmean (x (Fin.last k))) A hA

theorem history_equal_integrals {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ s, ν.map (fun w => F (s,w))=(ν.map (fun w=>(F (s,w)).1)).prod ν)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hfB : ∀ x,0≤f x ∧ f x≤B) (hgC : ∀ x,0≤g x ∧ g x≤C)
    (hmean : ∀ s,(∫w,f (s,w) ∂ν)=∫w,g (s,w) ∂ν)
    (s : S) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫w in E,f (iterate F s k w) ∂ν)=∫w in E,g (iterate F s k w) ∂ν := by
  let q : S → ℝ := fun a=>∫w,f (a,w) ∂ν
  have hq : Measurable q := hf.stronglyMeasurable.integral_prod_right'.measurable
  have h1 := history_function_mean F hF ν hsection f hf B hfB q hq (fun _=>rfl) s k E hE
  have h2 := history_function_mean F hF ν hsection g hg C hgC q hq (fun a=>(hmean a).symm) s k E hE
  exact h1.trans h2.symm

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.history_equal_integrals
