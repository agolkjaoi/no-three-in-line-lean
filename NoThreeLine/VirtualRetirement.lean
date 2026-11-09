import NoThreeLine.AugmentedCappedSegment
import NoThreeLine.ExtendedRetirement

/-! Positive retirement cannot increase virtual deletion mass: it removes
active leaves without changing selected occupancy or coordinate values. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem virtualLeaf_retire {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (positive : Grid n → Bool) (y q : Grid n)
    (h : virtualLeaf (s.retire positive) Γ y q) : virtualLeaf s Γ y q :=
  ⟨CreditAccount.retire_active _ _ h.1,h.2⟩

theorem virtualMass_retire_le {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (positive : Grid n → Bool) (z : Coordinates n) (L : LineIndex n) (q : Grid n)
    (hw : ∀ p, 0 ≤ z.1 p) (hk : z.2.1 L ≤ 2) :
    virtualMass (s.retire positive) Γ z L q ≤ virtualMass s Γ z L q := by
  have hnonneg := virtualMass_nonneg s Γ z L q hw hk
  unfold virtualMass
  split_ifs with hnew hold hold
  · apply Finset.sum_le_sum
    intro y hy
    by_cases hn : virtualLeaf (s.retire positive) Γ y q
    · have ho := virtualLeaf_retire s Γ positive y q hn
      simp only [if_pos hn,if_pos ho]
      exact le_rfl
    · simp only [if_neg hn]
      split_ifs
      · exact normalizedLineWeight_nonneg s z L y (hw y) hk hold.2.2.1
      · exact le_rfl
  · exfalso
    apply hold
    exact ⟨hnew.1,hnew.2.1,hnew.2.2.1,hnew.2.2.2.1,
      CreditAccount.retire_active _ _ hnew.2.2.2.2⟩
  · simpa only [virtualMass,if_pos hold] using hnonneg
  · exact le_rfl

theorem virtualMass_resolveBoundary_le {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (k r : LineIndex n → ℝ)
    (handled : Finset (LineIndex n)) (z : Coordinates n) (L : LineIndex n) (q : Grid n)
    (hw : ∀ p, 0 ≤ z.1 p) (hk : z.2.1 L ≤ 2) :
    virtualMass (resolveBoundary s Γ B K ρ k r handled) Γ z L q ≤ virtualMass s Γ z L q := by
  unfold resolveBoundary
  split_ifs
  · rw [virtualMass_stopped _ _ _ _ _ rfl]
    exact virtualMass_nonneg s Γ z L q hw hk
  · exact virtualMass_retire_le s Γ _ z L q hw hk

theorem ExtendedState.virtualMass_resolve_le {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (he : e.Valid B)
    (L : LineIndex n) (q : Grid n) :
    virtualMass (e.resolve Γ B K ρ).process Γ (e.resolve Γ B K ρ).coordinates L q ≤
      virtualMass e.process Γ e.coordinates L q := by
  rw [resolve_coordinates]
  exact virtualMass_resolveBoundary_le e.process Γ B K ρ e.clocks e.lineCredits e.handled
    e.coordinates L q (fun p => (he.2.1.1 p).1) (he.2.1.2.1 L).2

theorem ExtendedState.virtualMass_deadline_le {n : ℕ} (e : ExtendedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B : ℝ) (he : e.Valid B)
    (deadline : Grid n → ℝ) (t : ℝ) (L : LineIndex n) (q : Grid n) :
    virtualMass (deadlineRetirement deadline (e,t)).process Γ
      (deadlineRetirement deadline (e,t)).coordinates L q ≤ virtualMass e.process Γ e.coordinates L q := by
  unfold deadlineRetirement
  rw [retire_coordinates]
  exact virtualMass_retire_le e.process Γ _ e.coordinates L q
    (fun p => (he.2.1.1 p).1) (he.2.1.2.1 L).2

end NoThreeLine

#print axioms NoThreeLine.virtualMass_retire_le
#print axioms NoThreeLine.ExtendedState.virtualMass_resolve_le
#print axioms NoThreeLine.ExtendedState.virtualMass_deadline_le
