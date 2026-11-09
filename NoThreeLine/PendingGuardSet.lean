import NoThreeLine.GuardFiniteProgress

/-! Closed guards that exclude already handled tag lines and all stopped
states. This is the guard set needed when a segment is restarted. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.AuxiliaryODE

def unhandledLineGuard {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (ρ : ℝ) (handled : Finset (LineIndex n)) : Set (Coordinates n) :=
  ⋃ L : LineIndex n, {z | L ∉ handled ∧ ¬specified Γ L ∧ occupancy s L = 1 ∧ z.2.2 L ≤ ρ}

def pendingGuardSet {n : ℕ} (s : ProcessState n) (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) (handled : Finset (LineIndex n)) : Set (Coordinates n) :=
  if s.stopped = false then
    weightGuard s B ∪ clockGuard s Γ K ∪ unhandledLineGuard s Γ ρ handled
  else ∅

theorem unhandledLineGuard_closed {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (ρ : ℝ) (handled : Finset (LineIndex n)) :
    IsClosed (unhandledLineGuard s Γ ρ handled) := by
  apply isClosed_iUnion_of_finite
  intro L
  by_cases h : L ∉ handled ∧ ¬specified Γ L ∧ occupancy s L = 1
  · have hc : IsClosed {z : Coordinates n | z.2.2 L ≤ ρ} :=
      isClosed_le (by fun_prop : Continuous (fun z : Coordinates n => z.2.2 L)) continuous_const
    simpa only [h.1,h.2.1,h.2.2,true_and,not_false_eq_true] using hc
  · have he : {z : Coordinates n | L ∉ handled ∧ ¬specified Γ L ∧
        occupancy s L = 1 ∧ z.2.2 L ≤ ρ} = ∅ := by
      ext z
      simp only [mem_setOf_eq,mem_empty_iff_false,iff_false]
      exact fun hz => h ⟨hz.1,hz.2.1,hz.2.2.1⟩
    rw [he]
    exact isClosed_empty

theorem pendingGuardSet_closed {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (handled : Finset (LineIndex n)) :
    IsClosed (pendingGuardSet s Γ B K ρ handled) := by
  unfold pendingGuardSet
  split_ifs
  · exact ((weightGuard_closed s B).union (clockGuard_closed s Γ K)).union
      (unhandledLineGuard_closed s Γ ρ handled)
  · exact isClosed_empty

theorem mem_pendingGuardSet_iff {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (handled : Finset (LineIndex n))
    (z : Coordinates n) :
    z ∈ pendingGuardSet s Γ B K ρ handled ↔
      pendingBoundary (s.withWeights z.1) Γ B K ρ z.2.1 z.2.2 handled := by
  by_cases hs : s.stopped = false
  · simp only [pendingGuardSet,if_pos hs,mem_union,weightGuard,clockGuard,
      unhandledLineGuard,mem_iUnion,mem_setOf_eq,pendingBoundary,
      ProcessState.withWeights,clockTriggered,newTags,triggeredTags,occupancy,
      Finset.nonempty_def,Finset.mem_sdiff,Finset.mem_filter,Finset.mem_univ,true_and]
    simp only [hs,true_and]
    aesop
  · simp [pendingGuardSet,hs,pendingBoundary,ProcessState.withWeights]

theorem pendingGuardSet_avoids_weight {n : ℕ} (s : ProcessState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ : ℝ) (handled : Finset (LineIndex n))
    (z : Coordinates n) (hs : s.stopped = false)
    (hz : z ∉ pendingGuardSet s Γ B K ρ handled) (p : Grid n)
    (hp : (s.accounts p).status = .active) : z.1 p < B := by
  by_contra h
  apply hz
  simp only [pendingGuardSet,if_pos hs,mem_union]
  exact Or.inl (Or.inl (mem_iUnion.mpr ⟨p,⟨hp,le_of_not_gt h⟩⟩))

end NoThreeLine.AuxiliaryODE

#print axioms NoThreeLine.AuxiliaryODE.pendingGuardSet_closed
#print axioms NoThreeLine.AuxiliaryODE.mem_pendingGuardSet_iff
