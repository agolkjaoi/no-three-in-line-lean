import NoThreeLine.ClosedGuardHit

/-! A closed invariant that holds before a first closed guard also holds
at contact, provided it holds initially. This includes a zero-length step. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine

theorem firstClosedHit_invariant {E : Type*} [TopologicalSpace E]
    (T : ℝ) (hT : 0 ≤ T) (φ : ℝ → E) (bad good : Set E)
    (hφ : Continuous φ) (hb : IsClosed bad) (hg : IsClosed good)
    (hinit : φ 0 ∈ good) (hpre : badᶜ ⊆ good)
    (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (firstClosedHit T φ bad)) : φ t ∈ good := by
  let τ := firstClosedHit T φ bad
  have hτ : 0 ≤ τ := (firstClosedHit_bounds T hT φ bad hφ hb).1
  by_cases hzero : τ = 0
  · have ht' : t ∈ Icc (0 : ℝ) τ := ht
    rw [hzero] at ht'
    have htz : t = 0 := le_antisymm ht'.2 ht'.1
    simpa only [htz] using hinit
  · have hp : 0 < τ := lt_of_le_of_ne hτ (Ne.symm hzero)
    have hbefore : Ico (0 : ℝ) τ ⊆ φ ⁻¹' good := by
      intro u hu
      exact hpre (firstClosedHit_before T hT φ bad hφ hb u hu.1 hu.2)
    have hclosed : IsClosed (φ ⁻¹' good) := hg.preimage hφ
    have hh := closure_minimal hbefore hclosed
    rw [closure_Ico hp.ne] at hh
    exact hh ht

end NoThreeLine

#print axioms NoThreeLine.firstClosedHit_invariant
