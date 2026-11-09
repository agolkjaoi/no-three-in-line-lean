import NoThreeLine.RecycledInvariantEqualIntegral

/-! Inequalities of actual step integrals on finite state-history events.
The invariant version extends only proof integrands, not the transition or law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem history_le_integrals {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a, ν.map (fun w => F (a,w)) =
      (ν.map (fun w => (F (a,w)).1)).prod ν)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hfB : ∀ x, 0 ≤ f x ∧ f x ≤ B) (hgC : ∀ x, 0 ≤ g x ∧ g x ≤ C)
    (hmean : ∀ a, (∫ w, f (a,w) ∂ν) ≤ ∫ w, g (a,w) ∂ν)
    (s : S) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, f (iterate F s k w) ∂ν) ≤ ∫ w in E, g (iterate F s k w) ∂ν := by
  let u : S → ℝ := fun a => ∫ w, f (a,w) ∂ν
  let v : S → ℝ := fun a => ∫ w, g (a,w) ∂ν
  have hu : Measurable u := hf.stronglyMeasurable.integral_prod_right'.measurable
  have hv : Measurable v := hg.stronglyMeasurable.integral_prod_right'.measurable
  have huB (a : S) : 0 ≤ u a ∧ u a ≤ B := by
    have hi : Integrable (fun w => f (a,w)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable ν _
        (hf.comp (measurable_const.prodMk measurable_id)) B (fun w => hfB (a,w))
    refine ⟨integral_nonneg (fun w => (hfB (a,w)).1),?_⟩
    calc
      u a ≤ ∫ _w, B ∂ν := integral_mono hi (integrable_const B) (fun w => (hfB (a,w)).2)
      _ = B := by simp
  have hvC (a : S) : 0 ≤ v a ∧ v a ≤ C := by
    have hi : Integrable (fun w => g (a,w)) ν :=
      GenericCreditIteration.bounded_nonnegative_integrable ν _
        (hg.comp (measurable_const.prodMk measurable_id)) C (fun w => hgC (a,w))
    refine ⟨integral_nonneg (fun w => (hgC (a,w)).1),?_⟩
    calc
      v a ≤ ∫ _w, C ∂ν := integral_mono hi (integrable_const C) (fun w => (hgC (a,w)).2)
      _ = C := by simp
  have hiu : Integrable (fun w => u (state F s k w)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      (hu.comp (state_measurable F hF s k)) B (fun w => huB _)
  have hiv : Integrable (fun w => v (state F s k w)) ν :=
    GenericCreditIteration.bounded_nonnegative_integrable ν _
      (hv.comp (state_measurable F hF s k)) C (fun w => hvC _)
  calc
    _ = ∫ w in E, u (state F s k w) ∂ν :=
      history_function_mean F hF ν hsection f hf B hfB u hu (fun _ => rfl) s k E hE
    _ ≤ ∫ w in E, v (state F s k w) ∂ν :=
      integral_mono hiu.integrableOn hiv.integrableOn (fun w => hmean (state F s k w))
    _ = _ := (history_function_mean F hF ν hsection g hg C hgC v hv (fun _ => rfl) s k E hE).symm

theorem history_le_integrals_of_invariant {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a, ν.map (fun w => F (a,w)) =
      (ν.map (fun w => (F (a,w)).1)).prod ν)
    (R : S → Prop) (hRm : Measurable R)
    (hR : ∀ a, R a → ∀ w, R (F (a,w)).1)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hfB : ∀ x, R x.1 → 0 ≤ f x ∧ f x ≤ B)
    (hgC : ∀ x, R x.1 → 0 ≤ g x ∧ g x ≤ C)
    (hmean : ∀ a, R a → (∫ w, f (a,w) ∂ν) ≤ ∫ w, g (a,w) ∂ν)
    (s : S) (hs : R s) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, f (iterate F s k w) ∂ν) ≤ ∫ w in E, g (iterate F s k w) ∂ν := by
  classical
  let f' : S × W → ℝ := fun x => if R x.1 then f x else 0
  let g' : S × W → ℝ := fun x => if R x.1 then g x else 0
  have hf' : Measurable f' := Measurable.ite (hRm.comp measurable_fst).setOf hf measurable_const
  have hg' : Measurable g' := Measurable.ite (hRm.comp measurable_fst).setOf hg measurable_const
  have hf'B (x : S × W) : 0 ≤ f' x ∧ f' x ≤ max B 0 := by
    dsimp only [f']
    split_ifs with hx
    · exact ⟨(hfB x hx).1, (hfB x hx).2.trans (le_max_left _ _)⟩
    · exact ⟨le_rfl, le_max_right _ _⟩
  have hg'C (x : S × W) : 0 ≤ g' x ∧ g' x ≤ max C 0 := by
    dsimp only [g']
    split_ifs with hx
    · exact ⟨(hgC x hx).1, (hgC x hx).2.trans (le_max_left _ _)⟩
    · exact ⟨le_rfl, le_max_right _ _⟩
  have hmean' (a : S) : (∫ w, f' (a,w) ∂ν) ≤ ∫ w, g' (a,w) ∂ν := by
    by_cases ha : R a
    · simpa only [f',g',if_pos ha] using hmean a ha
    · simp only [f',g',if_neg ha,le_refl]
  have hh := history_le_integrals F hF ν hsection f' g' hf' hg'
    (max B 0) (max C 0) hf'B hg'C hmean' s k E hE
  calc
    _ = ∫ w in E, f' (iterate F s k w) ∂ν := by
      apply integral_congr_ae
      exact ae_of_all _ (fun w => by
        change f (iterate F s k w) =
          if R (state F s k w) then f (iterate F s k w) else 0
        rw [if_pos (iterate_region F R hR s hs k w)])
    _ ≤ ∫ w in E, g' (iterate F s k w) ∂ν := hh
    _ = _ := by
      apply integral_congr_ae
      exact ae_of_all _ (fun w => by
        change (if R (state F s k w) then g (iterate F s k w) else 0) =
          g (iterate F s k w)
        rw [if_pos (iterate_region F R hR s hs k w)])

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.history_le_integrals
#print axioms NoThreeLine.RecycledBoardProcess.history_le_integrals_of_invariant
