import NoThreeLine.RecycledInvariantEqualIntegral

/-! Signed equal step integrals on an actual invariant region. A common
constant shift is used only in the proof; the transition and law stay fixed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem history_equal_integrals_of_invariant_signed {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a, ν.map (fun w => F (a,w)) =
      (ν.map (fun w => (F (a,w)).1)).prod ν)
    (R : S → Prop) (hRm : Measurable R)
    (hR : ∀ a, R a → ∀ w, R (F (a,w)).1)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hfB : ∀ x, R x.1 → ‖f x‖ ≤ B)
    (hgC : ∀ x, R x.1 → ‖g x‖ ≤ C)
    (hmean : ∀ a, R a → (∫ w, f (a,w) ∂ν) = ∫ w, g (a,w) ∂ν)
    (s : S) (hs : R s) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, f (iterate F s k w) ∂ν) = ∫ w in E, g (iterate F s k w) ∂ν := by
  let c := max B 0 + max C 0
  have hBc : B ≤ c := by dsimp [c]; linarith [le_max_left B 0, le_max_right C 0]
  have hCc : C ≤ c := by dsimp [c]; linarith [le_max_right B 0, le_max_left C 0]
  have hfshift (x : S × W) (hx : R x.1) : 0 ≤ f x+c ∧ f x+c ≤ c+c := by
    have hb0 : |f x| ≤ B := by simpa only [Real.norm_eq_abs] using hfB x hx
    have hb : |f x| ≤ c := hb0.trans hBc
    constructor <;> linarith [neg_abs_le (f x), le_abs_self (f x)]
  have hgshift (x : S × W) (hx : R x.1) : 0 ≤ g x+c ∧ g x+c ≤ c+c := by
    have hb0 : |g x| ≤ C := by simpa only [Real.norm_eq_abs] using hgC x hx
    have hb : |g x| ≤ c := hb0.trans hCc
    constructor <;> linarith [neg_abs_le (g x), le_abs_self (g x)]
  have hfi (a : S) (ha : R a) : Integrable (fun w => f (a,w)) ν := by
    apply (integrable_const (max B 0)).mono'
      ((hf.comp (measurable_const.prodMk measurable_id)).aestronglyMeasurable)
    exact ae_of_all _ (fun w => (hfB (a,w) ha).trans (le_max_left B 0))
  have hgi (a : S) (ha : R a) : Integrable (fun w => g (a,w)) ν := by
    apply (integrable_const (max C 0)).mono'
      ((hg.comp (measurable_const.prodMk measurable_id)).aestronglyMeasurable)
    exact ae_of_all _ (fun w => (hgC (a,w) ha).trans (le_max_left C 0))
  have hh := history_equal_integrals_of_invariant F hF ν hsection R hRm hR
    (fun x => f x+c) (fun x => g x+c) (hf.add measurable_const) (hg.add measurable_const)
    (c+c) (c+c) hfshift hgshift
    (fun a ha => by rw [integral_add (hfi a ha) (integrable_const c),
      integral_add (hgi a ha) (integrable_const c),hmean a ha]) s hs k E hE
  have hfa : Integrable (fun w => f (iterate F s k w)) ν := by
    apply (integrable_const (max B 0)).mono'
      ((hf.comp (iterate_measurable F hF s k)).aestronglyMeasurable)
    exact ae_of_all _ (fun w => (hfB _ (iterate_region F R hR s hs k w)).trans (le_max_left B 0))
  have hga : Integrable (fun w => g (iterate F s k w)) ν := by
    apply (integrable_const (max C 0)).mono'
      ((hg.comp (iterate_measurable F hF s k)).aestronglyMeasurable)
    exact ae_of_all _ (fun w => (hgC _ (iterate_region F R hR s hs k w)).trans (le_max_left C 0))
  rw [integral_add hfa.integrableOn (integrable_const c),
    integral_add hga.integrableOn (integrable_const c)] at hh
  exact add_right_cancel hh

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.history_equal_integrals_of_invariant_signed
