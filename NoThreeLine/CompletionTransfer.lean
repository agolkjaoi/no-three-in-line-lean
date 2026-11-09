import NoThreeLine.RecycledBoardProcess

/-! For absorbing completion predicates, equality of the one-time failure
probabilities transfers almost-sure finite completion. No joint path-law
identification is required for this particular conclusion. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set Filter

namespace NoThreeLine

theorem ae_completion_of_failure_marginals {Ω Ξ : Type*} [MeasurableSpace Ω] [MeasurableSpace Ξ]
    (μ : Measure Ω) (ν : Measure Ξ) [IsFiniteMeasure μ] [IsFiniteMeasure ν]
    (P : ℕ → Ω → Prop) (Q : ℕ → Ξ → Prop)
    (hP : ∀ k, Measurable (P k)) (hQ : ∀ k, Measurable (Q k))
    (hPm : ∀ ω, Monotone (fun k => P k ω)) (hQm : ∀ ξ, Monotone (fun k => Q k ξ))
    (heq : ∀ k, μ {ω | ¬P k ω} = ν {ξ | ¬Q k ξ})
    (hcomplete : ∀ᵐ ξ ∂ν, ∃ k, Q k ξ) : ∀ᵐ ω ∂μ, ∃ k, P k ω := by
  have ha : Antitone (fun k => {ω | ¬P k ω}) := by
    intro i j hij ω hj hi
    exact hj (hPm ω hij hi)
  have hb : Antitone (fun k => {ξ | ¬Q k ξ}) := by
    intro i j hij ξ hj hi
    exact hj (hQm ξ hij hi)
  have hnull : ν (⋂ k, {ξ | ¬Q k ξ}) = 0 := by
    have he : (⋂ k, {ξ | ¬Q k ξ}) = {ξ | ¬∃ k, Q k ξ} := by ext ξ; simp
    rw [he]
    exact ae_iff.mp hcomplete
  apply ae_iff.mpr
  have hset : {ω | ¬∃ k, P k ω} = ⋂ k, {ω | ¬P k ω} := by ext ω; simp
  rw [hset,ha.measure_iInter (fun k => (hP k).not.setOf.nullMeasurableSet) ⟨0,measure_ne_top μ _⟩]
  simp_rw [heq]
  rw [← hb.measure_iInter (fun k => (hQ k).not.setOf.nullMeasurableSet) ⟨0,measure_ne_top ν _⟩]
  exact hnull

end NoThreeLine

#print axioms NoThreeLine.ae_completion_of_failure_marginals
