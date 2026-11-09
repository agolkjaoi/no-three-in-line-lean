import NoThreeLine.InvariantRecycledMartingale

/-! Equal conditional step integrals with bounds and means required only
on an actual invariant region. The original transition, residual law and
state-history filtration are unchanged; only proof integrands are extended. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.RecycledBoardProcess

theorem history_equal_integrals_of_invariant {S W : Type*}
    [MeasurableSpace S] [MeasurableSpace W]
    (F : S × W → S × W) (hF : Measurable F) (ν : Measure W) [IsProbabilityMeasure ν]
    (hsection : ∀ a, ν.map (fun w => F (a,w)) =
      (ν.map (fun w => (F (a,w)).1)).prod ν)
    (R : S → Prop) (hRm : Measurable R)
    (hR : ∀ a, R a → ∀ w, R (F (a,w)).1)
    (f g : S × W → ℝ) (hf : Measurable f) (hg : Measurable g)
    (B C : ℝ) (hfB : ∀ x, R x.1 → 0 ≤ f x ∧ f x ≤ B)
    (hgC : ∀ x, R x.1 → 0 ≤ g x ∧ g x ≤ C)
    (hmean : ∀ a, R a → (∫ w, f (a,w) ∂ν) = ∫ w, g (a,w) ∂ν)
    (s : S) (hs : R s) (k : ℕ) (E : Set W)
    (hE : MeasurableSet[StateHistory.filtration (state F s) (state_measurable F hF s) k] E) :
    (∫ w in E, f (iterate F s k w) ∂ν) = ∫ w in E, g (iterate F s k w) ∂ν := by
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
  have hmean' (a : S) : (∫ w, f' (a,w) ∂ν) = ∫ w, g' (a,w) ∂ν := by
    by_cases ha : R a
    · simpa only [f', g', if_pos ha] using hmean a ha
    · simp only [f', g', if_neg ha]
  have hh := history_equal_integrals F hF ν hsection f' g' hf' hg'
    (max B 0) (max C 0) hf'B hg'C hmean' s k E hE
  calc
    _ = ∫ w in E, f' (iterate F s k w) ∂ν := by
      apply integral_congr_ae
      exact ae_of_all _ (fun w => by
        change f (iterate F s k w) =
          if R (state F s k w) then f (iterate F s k w) else 0
        rw [if_pos (iterate_region F R hR s hs k w)])
    _ = ∫ w in E, g' (iterate F s k w) ∂ν := hh
    _ = _ := by
      apply integral_congr_ae
      exact ae_of_all _ (fun w => by
        change (if R (state F s k w) then g (iterate F s k w) else 0) =
          g (iterate F s k w)
        rw [if_pos (iterate_region F R hR s hs k w)])

end NoThreeLine.RecycledBoardProcess

#print axioms NoThreeLine.RecycledBoardProcess.history_equal_integrals_of_invariant
